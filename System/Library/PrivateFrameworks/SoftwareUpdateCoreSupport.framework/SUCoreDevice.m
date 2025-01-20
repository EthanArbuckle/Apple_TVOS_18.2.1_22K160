@interface SUCoreDevice
+ (id)sharedDevice;
- (BOOL)_hasSplatOnlyUpdateInstalled;
- (BOOL)_supportsAppleInternalVariant;
- (BOOL)_supportsCoreServices;
- (BOOL)_supportsFactoryVersion;
- (BOOL)_supportsMobileGestalt;
- (BOOL)_supportsPreservedFactoryVersion;
- (BOOL)_supportsRecoveryOS;
- (BOOL)_supportsRecoveryOSRestoreVersion;
- (BOOL)_supportsRecoveryOSSystemVersion;
- (BOOL)_supportsRestoreVersion;
- (BOOL)_supportsSFR;
- (BOOL)_supportsSFRRestoreVersion;
- (BOOL)_supportsSFRSystemVersion;
- (BOOL)_supportsSplat;
- (BOOL)_supportsSplatRestoreVersion;
- (BOOL)_supportsSplatSystemVersion;
- (BOOL)deviceSupportsAppleInternalVariant;
- (BOOL)deviceSupportsCoreServices;
- (BOOL)deviceSupportsFactoryVersion;
- (BOOL)deviceSupportsMobileGestalt;
- (BOOL)deviceSupportsMultiVolumeBoot;
- (BOOL)deviceSupportsPreservedFactoryVersion;
- (BOOL)deviceSupportsRecoveryOSRestoreVersion;
- (BOOL)deviceSupportsRecoveryOSSystemVersion;
- (BOOL)deviceSupportsRestoreVersion;
- (BOOL)deviceSupportsSFRRestoreVersion;
- (BOOL)deviceSupportsSFRSystemVersion;
- (BOOL)deviceSupportsSplatCryptex1RestoreVersion;
- (BOOL)deviceSupportsSplatCryptex1SystemVersion;
- (BOOL)deviceSupportsSplatRestoreVersion;
- (BOOL)deviceSupportsSplatRollbackRestoreVersion;
- (BOOL)deviceSupportsSplatRollbackSystemVersion;
- (BOOL)deviceSupportsSplatSystemVersion;
- (BOOL)hasBridgeOS;
- (BOOL)hasEligibleRollback;
- (BOOL)hasEmbeddedOS;
- (BOOL)hasRecoveryOS;
- (BOOL)hasSFR;
- (BOOL)hasSemiSplatActive;
- (BOOL)hasSplat;
- (BOOL)isBootedOSSecureInternal;
- (BOOL)isBridgeInternal;
- (BOOL)isCorrectlyFormattedBuildVersion:(id)a3;
- (BOOL)isCorrectlyFormattedProductVersion:(id)a3;
- (BOOL)isInternal;
- (BOOL)isMajorOSUpdate:(id)a3;
- (BOOL)isMinorOSUpdate:(id)a3;
- (BOOL)requiresDocAssetForUpdate;
- (NSDictionary)appleInternalVariantPlistContents;
- (NSDictionary)bridgeVersionPlistContents;
- (NSDictionary)factoryVersionPlistContents;
- (NSDictionary)preservedFactoryVersionPlistContents;
- (NSDictionary)recoveryOSRestoreVersionPlistContents;
- (NSDictionary)recoveryOSSystemVersionPlistContents;
- (NSDictionary)restoreVersionPlistContents;
- (NSDictionary)sfrRestoreVersionPlistContents;
- (NSDictionary)sfrSystemVersionPlistContents;
- (NSDictionary)splatCryptex1RestoreVersionPlistContents;
- (NSDictionary)splatCryptex1SystemVersionPlistContents;
- (NSDictionary)splatRestoreVersionPlistContents;
- (NSDictionary)splatRollbackRestoreVersionPlistContents;
- (NSDictionary)splatRollbackSystemVersionPlistContents;
- (NSDictionary)splatSystemVersionPlistContents;
- (NSDictionary)systemVersionPlistContents;
- (NSString)appleInternalVariantPlistPath;
- (NSString)bridgeBuildVersion;
- (NSString)bridgeRestoreVersion;
- (NSString)bridgeVersion;
- (NSString)bridgeVersionPlistPath;
- (NSString)buildVersion;
- (NSString)deviceBoardID;
- (NSString)deviceClass;
- (NSString)factoryRestoreVersion;
- (NSString)factoryVersionPlistPath;
- (NSString)hwModelString;
- (NSString)hwTarget;
- (NSString)marketingProductName;
- (NSString)preservedFactoryRestoreVersion;
- (NSString)preservedFactoryVersionPlistPath;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)recoveryOSBuildVersion;
- (NSString)recoveryOSProductVersion;
- (NSString)recoveryOSReleaseType;
- (NSString)recoveryOSRestoreVersion;
- (NSString)recoveryOSRestoreVersionPlistPath;
- (NSString)recoveryOSSystemVersionPlistPath;
- (NSString)releaseType;
- (NSString)restoreVersion;
- (NSString)restoreVersionPlistPath;
- (NSString)sfrBuildVersion;
- (NSString)sfrProductVersion;
- (NSString)sfrReleaseType;
- (NSString)sfrRestoreVersion;
- (NSString)sfrRestoreVersionPlistPath;
- (NSString)sfrSystemVersionPlistPath;
- (NSString)splatBuildVersion;
- (NSString)splatCryptex1BuildVersion;
- (NSString)splatCryptex1BuildVersionOverride;
- (NSString)splatCryptex1ProductVersion;
- (NSString)splatCryptex1ProductVersionExtra;
- (NSString)splatCryptex1ReleaseType;
- (NSString)splatCryptex1RestoreVersion;
- (NSString)splatCryptex1RestoreVersionPlistPath;
- (NSString)splatCryptex1SystemVersionPlistPath;
- (NSString)splatProductVersion;
- (NSString)splatProductVersionExtra;
- (NSString)splatReleaseType;
- (NSString)splatRestoreVersion;
- (NSString)splatRestoreVersionPlistPath;
- (NSString)splatRollbackBuildVersion;
- (NSString)splatRollbackProductVersion;
- (NSString)splatRollbackProductVersionExtra;
- (NSString)splatRollbackReleaseType;
- (NSString)splatRollbackRestoreVersion;
- (NSString)splatRollbackRestoreVersionPlistPath;
- (NSString)splatRollbackSystemVersionPlistPath;
- (NSString)splatSystemVersionPlistPath;
- (NSString)systemVersionPlistPath;
- (NSString)targetedSystemVolume;
- (__CFString)_gestaltKeyForQueryKey:(int64_t)a3;
- (id)_copyCoreServicesAppleInternalValue;
- (id)_copyCoreServicesValueForKey:(int64_t)a3;
- (id)_copyDeviceBoardID;
- (id)_copyFactoryVersionValueForKey:(int64_t)a3;
- (id)_copyGestaltValueForKey:(int64_t)a3;
- (id)_copyRecoveryOSRestoreVersionValueForKey:(int64_t)a3;
- (id)_copyRecoveryOSSystemVersionValueForKey:(int64_t)a3;
- (id)_copyRestoreVersionValueForKey:(int64_t)a3;
- (id)_copySFRRestoreVersionValueForKey:(int64_t)a3;
- (id)_copySFRSystemVersionValueForKey:(int64_t)a3;
- (id)_copySplatCryptex1RestoreVersionPath;
- (id)_copySplatCryptex1SystemVersionPath;
- (id)_copySplatCryptex1ValueForKey:(int64_t)a3;
- (id)_copySplatRollbackObjectsPath;
- (id)_copySplatRollbackRestoreVersionPath;
- (id)_copySplatRollbackSystemVersionPath;
- (id)_copySplatRollbackValueForKey:(int64_t)a3;
- (id)_copySplatValueForKey:(int64_t)a3;
- (id)_copyStringValueForKey:(int64_t)a3;
- (id)_copySysCtlValueForKey:(int64_t)a3;
- (id)_coreServicesKeyForQueryKey:(int64_t)a3;
- (id)_factoryVersionKeyForQueryKey:(int64_t)a3;
- (id)_factoryVersionPlistContentsForKey:(int64_t)a3;
- (id)_getMajorVersionFromBuildVersion:(id)a3;
- (id)_nameForQueryKey:(int64_t)a3;
- (id)_nameForQueryMethod:(int64_t)a3;
- (id)_restoreVersionKeyForQueryKey:(int64_t)a3;
- (id)_splatCryptex1VersionPlistContentsForKey:(int64_t)a3;
- (id)_splatRollbackVersionPlistContentsForKey:(int64_t)a3;
- (id)_splatVersionKeyForQueryKey:(int64_t)a3;
- (id)_splatVersionPlistContentsForKey:(int64_t)a3;
- (id)_sysCtlKeyForQueryKey:(int64_t)a3;
- (id)description;
- (id)getSystemRecoveryNSIHDirectory;
- (id)initTargetingSystemVolume:(id)a3;
- (id)summary;
- (int64_t)_queryMethodForKey:(int64_t)a3;
- (void)_initializeBridgeOSProperties;
- (void)_parseBridgeOSBuildInformationFromDevice:(id)a3;
- (void)_reloadPlistContentsForKey:(int64_t)a3;
- (void)adjustTargetingSystemVolume:(id)a3;
- (void)reloadDevice;
- (void)setAppleInternalVariantPlistContents:(id)a3;
- (void)setAppleInternalVariantPlistPath:(id)a3;
- (void)setBridgeBuildVersion:(id)a3;
- (void)setBridgeRestoreVersion:(id)a3;
- (void)setBridgeVersion:(id)a3;
- (void)setBridgeVersionPlistContents:(id)a3;
- (void)setBridgeVersionPlistPath:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceBoardID:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceSupportsAppleInternalVariant:(BOOL)a3;
- (void)setDeviceSupportsCoreServices:(BOOL)a3;
- (void)setDeviceSupportsFactoryVersion:(BOOL)a3;
- (void)setDeviceSupportsMobileGestalt:(BOOL)a3;
- (void)setDeviceSupportsMultiVolumeBoot:(BOOL)a3;
- (void)setDeviceSupportsPreservedFactoryVersion:(BOOL)a3;
- (void)setDeviceSupportsRecoveryOSRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsRecoveryOSSystemVersion:(BOOL)a3;
- (void)setDeviceSupportsRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSFRRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSFRSystemVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatCryptex1RestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatCryptex1SystemVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatRollbackRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatRollbackSystemVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatSystemVersion:(BOOL)a3;
- (void)setFactoryRestoreVersion:(id)a3;
- (void)setFactoryVersionPlistContents:(id)a3;
- (void)setFactoryVersionPlistPath:(id)a3;
- (void)setHasBridgeOS:(BOOL)a3;
- (void)setHasEmbeddedOS:(BOOL)a3;
- (void)setHasRecoveryOS:(BOOL)a3;
- (void)setHasSFR:(BOOL)a3;
- (void)setHasSplat:(BOOL)a3;
- (void)setHasSplatOnlyUpdateInstalled:(BOOL)a3;
- (void)setHwModelString:(id)a3;
- (void)setHwTarget:(id)a3;
- (void)setIsBootedOSSecureInternal:(BOOL)a3;
- (void)setIsBridgeInternal:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setMarketingProductName:(id)a3;
- (void)setPreservedFactoryRestoreVersion:(id)a3;
- (void)setPreservedFactoryVersionPlistContents:(id)a3;
- (void)setPreservedFactoryVersionPlistPath:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setRecoveryOSBuildVersion:(id)a3;
- (void)setRecoveryOSProductVersion:(id)a3;
- (void)setRecoveryOSReleaseType:(id)a3;
- (void)setRecoveryOSRestoreVersion:(id)a3;
- (void)setRecoveryOSRestoreVersionPlistContents:(id)a3;
- (void)setRecoveryOSRestoreVersionPlistPath:(id)a3;
- (void)setRecoveryOSSystemVersionPlistContents:(id)a3;
- (void)setRecoveryOSSystemVersionPlistPath:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestoreVersion:(id)a3;
- (void)setRestoreVersionPlistContents:(id)a3;
- (void)setRestoreVersionPlistPath:(id)a3;
- (void)setSfrBuildVersion:(id)a3;
- (void)setSfrProductVersion:(id)a3;
- (void)setSfrReleaseType:(id)a3;
- (void)setSfrRestoreVersion:(id)a3;
- (void)setSfrRestoreVersionPlistContents:(id)a3;
- (void)setSfrRestoreVersionPlistPath:(id)a3;
- (void)setSfrSystemVersionPlistContents:(id)a3;
- (void)setSfrSystemVersionPlistPath:(id)a3;
- (void)setSplatBuildVersion:(id)a3;
- (void)setSplatCryptex1BuildVersion:(id)a3;
- (void)setSplatCryptex1BuildVersionOverride:(id)a3;
- (void)setSplatCryptex1ProductVersion:(id)a3;
- (void)setSplatCryptex1ProductVersionExtra:(id)a3;
- (void)setSplatCryptex1ReleaseType:(id)a3;
- (void)setSplatCryptex1RestoreVersion:(id)a3;
- (void)setSplatCryptex1RestoreVersionPlistContents:(id)a3;
- (void)setSplatCryptex1RestoreVersionPlistPath:(id)a3;
- (void)setSplatCryptex1SystemVersionPlistContents:(id)a3;
- (void)setSplatCryptex1SystemVersionPlistPath:(id)a3;
- (void)setSplatProductVersion:(id)a3;
- (void)setSplatProductVersionExtra:(id)a3;
- (void)setSplatReleaseType:(id)a3;
- (void)setSplatRestoreVersion:(id)a3;
- (void)setSplatRestoreVersionPlistContents:(id)a3;
- (void)setSplatRestoreVersionPlistPath:(id)a3;
- (void)setSplatRollbackBuildVersion:(id)a3;
- (void)setSplatRollbackProductVersion:(id)a3;
- (void)setSplatRollbackProductVersionExtra:(id)a3;
- (void)setSplatRollbackReleaseType:(id)a3;
- (void)setSplatRollbackRestoreVersion:(id)a3;
- (void)setSplatRollbackRestoreVersionPlistContents:(id)a3;
- (void)setSplatRollbackRestoreVersionPlistPath:(id)a3;
- (void)setSplatRollbackSystemVersionPlistContents:(id)a3;
- (void)setSplatRollbackSystemVersionPlistPath:(id)a3;
- (void)setSplatSystemVersionPlistContents:(id)a3;
- (void)setSplatSystemVersionPlistPath:(id)a3;
- (void)setSystemVersionPlistContents:(id)a3;
- (void)setSystemVersionPlistPath:(id)a3;
- (void)setTargetedSystemVolume:(id)a3;
@end

@implementation SUCoreDevice

+ (id)sharedDevice
{
  if (sharedDevice_onceToken != -1) {
    dispatch_once(&sharedDevice_onceToken, &__block_literal_global_5);
  }
  return (id)sharedDevice___sharedDevice;
}

void __28__SUCoreDevice_sharedDevice__block_invoke()
{
  id v0 = -[SUCoreDevice initTargetingSystemVolume:]( objc_alloc(&OBJC_CLASS___SUCoreDevice),  "initTargetingSystemVolume:",  @"/");
  v1 = (void *)sharedDevice___sharedDevice;
  sharedDevice___sharedDevice = (uint64_t)v0;
}

- (id)initTargetingSystemVolume:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SUCoreDevice;
  v5 = -[SUCoreDevice init](&v18, sel_init);
  v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  if (v4)
  {
    -[SUCoreDevice adjustTargetingSystemVolume:](v5, "adjustTargetingSystemVolume:", v4);
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  v8 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice initTargetingSystemVolume:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  v7 = 0LL;
LABEL_8:

  return v7;
}

- (void)adjustTargetingSystemVolume:(id)a3
{
  uint64_t v181 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    -[SUCoreDevice setTargetedSystemVolume:](self, "setTargetedSystemVolume:", v4);
    [v4 stringByAppendingPathComponent:@"/System/Library/CoreServices/"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringByAppendingPathComponent:@"SystemVersion.plist"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSystemVersionPlistPath:](self, "setSystemVersionPlistPath:", v6);

    [v4 stringByAppendingPathComponent:@"/System/Library/CoreServices/"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 stringByAppendingPathComponent:@"RestoreVersion.plist"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setRestoreVersionPlistPath:](self, "setRestoreVersionPlistPath:", v8);

    [v4 stringByAppendingPathComponent:@"/System/Library/CoreServices/"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 stringByAppendingPathComponent:@"AppleInternalVariant.plist"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setAppleInternalVariantPlistPath:](self, "setAppleInternalVariantPlistPath:", v10);

    [@"/System/Volumes/iSCPreboot/SFR/current/" stringByAppendingPathComponent:@"SystemVersion.plist"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSfrSystemVersionPlistPath:](self, "setSfrSystemVersionPlistPath:", v11);

    [@"/System/Volumes/iSCPreboot/SFR/current/" stringByAppendingPathComponent:@"RestoreVersion.plist"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSfrRestoreVersionPlistPath:](self, "setSfrRestoreVersionPlistPath:", v12);

    uint64_t v13 = -[SUCoreDevice getSystemRecoveryNSIHDirectory](self, "getSystemRecoveryNSIHDirectory");
    uint64_t v14 = (void *)v13;
    uint64_t v15 = @"/System/Volumes/iSCPreboot/SystemRecovery/current/";
    if (v13) {
      uint64_t v15 = (__CFString *)v13;
    }
    uint64_t v16 = v15;
    v17 = -[__CFString stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", @"SystemVersion.plist");
    -[SUCoreDevice setRecoveryOSSystemVersionPlistPath:](self, "setRecoveryOSSystemVersionPlistPath:", v17);

    -[__CFString stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", @"RestoreVersion.plist");
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setRecoveryOSRestoreVersionPlistPath:](self, "setRecoveryOSRestoreVersionPlistPath:", v18);

    [@"/System/Volumes/Hardware/" stringByAppendingPathComponent:@"FactoryVersion.plist"];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setFactoryVersionPlistPath:](self, "setFactoryVersionPlistPath:", v19);

    [@"/System/Volumes/Hardware/" stringByAppendingPathComponent:@"PreservedFactoryVersion.plist"];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setPreservedFactoryVersionPlistPath:](self, "setPreservedFactoryVersionPlistPath:", v20);

    [v4 stringByAppendingPathComponent:@"/System/Cryptexes/OS/System/Library/CoreServices/"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 stringByAppendingPathComponent:@"RestoreVersion.plist"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSplatRestoreVersionPlistPath:](self, "setSplatRestoreVersionPlistPath:", v22);

    [v4 stringByAppendingPathComponent:@"/System/Cryptexes/OS/System/Library/CoreServices/"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 stringByAppendingPathComponent:@"SystemVersion.plist"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice setSplatSystemVersionPlistPath:](self, "setSplatSystemVersionPlistPath:", v24);

    id v25 = -[SUCoreDevice _copySplatRollbackRestoreVersionPath](self, "_copySplatRollbackRestoreVersionPath");
    -[SUCoreDevice setSplatRollbackRestoreVersionPlistPath:](self, "setSplatRollbackRestoreVersionPlistPath:", v25);

    id v26 = -[SUCoreDevice _copySplatRollbackSystemVersionPath](self, "_copySplatRollbackSystemVersionPath");
    -[SUCoreDevice setSplatRollbackSystemVersionPlistPath:](self, "setSplatRollbackSystemVersionPlistPath:", v26);

    id v27 = -[SUCoreDevice _copySplatCryptex1RestoreVersionPath](self, "_copySplatCryptex1RestoreVersionPath");
    -[SUCoreDevice setSplatCryptex1RestoreVersionPlistPath:](self, "setSplatCryptex1RestoreVersionPlistPath:", v27);

    id v28 = -[SUCoreDevice _copySplatCryptex1SystemVersionPath](self, "_copySplatCryptex1SystemVersionPath");
    -[SUCoreDevice setSplatCryptex1SystemVersionPlistPath:](self, "setSplatCryptex1SystemVersionPlistPath:", v28);
    v29 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v29 oslog];
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = -[SUCoreDevice systemVersionPlistPath](self, "systemVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v31;
      _os_log_impl( &dword_187139000,  v30,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using systemVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v32 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v32 oslog];
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = -[SUCoreDevice restoreVersionPlistPath](self, "restoreVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v34;
      _os_log_impl( &dword_187139000,  v33,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using restoreVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v35 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v35 oslog];
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = -[SUCoreDevice appleInternalVariantPlistPath](self, "appleInternalVariantPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v37;
      _os_log_impl( &dword_187139000,  v36,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using appleInternalVariantPlistPath: %{public}@",  buf,  0xCu);
    }
    v38 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v38 oslog];
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = -[SUCoreDevice sfrSystemVersionPlistPath](self, "sfrSystemVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v40;
      _os_log_impl( &dword_187139000,  v39,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using sfrSystemVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v41 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v41 oslog];
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = -[SUCoreDevice sfrRestoreVersionPlistPath](self, "sfrRestoreVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v43;
      _os_log_impl( &dword_187139000,  v42,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using sfrRestoreVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v44 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v44 oslog];
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = -[SUCoreDevice recoveryOSSystemVersionPlistPath](self, "recoveryOSSystemVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v46;
      _os_log_impl( &dword_187139000,  v45,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using recoveryOSSystemVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v47 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v47 oslog];
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = -[SUCoreDevice recoveryOSRestoreVersionPlistPath](self, "recoveryOSRestoreVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v49;
      _os_log_impl( &dword_187139000,  v48,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using recoveryOSRestoreVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v50 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v50 oslog];
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = -[SUCoreDevice factoryVersionPlistPath](self, "factoryVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v52;
      _os_log_impl( &dword_187139000,  v51,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using factoryVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v53 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v53 oslog];
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = -[SUCoreDevice preservedFactoryVersionPlistPath](self, "preservedFactoryVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v55;
      _os_log_impl( &dword_187139000,  v54,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using preservedFactoryVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v56 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v56 oslog];
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = -[SUCoreDevice splatRestoreVersionPlistPath](self, "splatRestoreVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v58;
      _os_log_impl( &dword_187139000,  v57,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using splatRestoreVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v59 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v59 oslog];
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = -[SUCoreDevice splatSystemVersionPlistPath](self, "splatSystemVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v61;
      _os_log_impl( &dword_187139000,  v60,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using splatSystemVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v62 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v62 oslog];
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = -[SUCoreDevice splatRollbackRestoreVersionPlistPath](self, "splatRollbackRestoreVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v64;
      _os_log_impl( &dword_187139000,  v63,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using splatRollbackRestoreVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v65 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v65 oslog];
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = -[SUCoreDevice splatRollbackSystemVersionPlistPath](self, "splatRollbackSystemVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v67;
      _os_log_impl( &dword_187139000,  v66,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using splatRollbackSystemVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v68 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v68 oslog];
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = -[SUCoreDevice splatCryptex1RestoreVersionPlistPath](self, "splatCryptex1RestoreVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v70;
      _os_log_impl( &dword_187139000,  v69,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using splatCryptex1RestoreVersionPlistPath: %{public}@",  buf,  0xCu);
    }
    v71 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v71 oslog];
    v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = -[SUCoreDevice splatCryptex1SystemVersionPlistPath](self, "splatCryptex1SystemVersionPlistPath");
      *(_DWORD *)buf = 138543362;
      id v180 = v73;
      _os_log_impl( &dword_187139000,  v72,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Using splatCryptex1SystemVersionPlistPath: %{public}@",  buf,  0xCu);
    }

    -[SUCoreDevice setDeviceSupportsMobileGestalt:]( self,  "setDeviceSupportsMobileGestalt:",  -[SUCoreDevice _supportsMobileGestalt](self, "_supportsMobileGestalt"));
    -[SUCoreDevice setDeviceSupportsCoreServices:]( self,  "setDeviceSupportsCoreServices:",  -[SUCoreDevice _supportsCoreServices](self, "_supportsCoreServices"));
    -[SUCoreDevice setDeviceSupportsAppleInternalVariant:]( self,  "setDeviceSupportsAppleInternalVariant:",  -[SUCoreDevice _supportsAppleInternalVariant](self, "_supportsAppleInternalVariant"));
    -[SUCoreDevice setDeviceSupportsRestoreVersion:]( self,  "setDeviceSupportsRestoreVersion:",  -[SUCoreDevice _supportsRestoreVersion](self, "_supportsRestoreVersion"));
    -[SUCoreDevice setDeviceSupportsSFRSystemVersion:]( self,  "setDeviceSupportsSFRSystemVersion:",  -[SUCoreDevice _supportsSFRSystemVersion](self, "_supportsSFRSystemVersion"));
    -[SUCoreDevice setDeviceSupportsSFRRestoreVersion:]( self,  "setDeviceSupportsSFRRestoreVersion:",  -[SUCoreDevice _supportsSFRRestoreVersion](self, "_supportsSFRRestoreVersion"));
    -[SUCoreDevice setDeviceSupportsRecoveryOSSystemVersion:]( self,  "setDeviceSupportsRecoveryOSSystemVersion:",  -[SUCoreDevice _supportsRecoveryOSSystemVersion](self, "_supportsRecoveryOSSystemVersion"));
    -[SUCoreDevice setDeviceSupportsRecoveryOSRestoreVersion:]( self,  "setDeviceSupportsRecoveryOSRestoreVersion:",  -[SUCoreDevice _supportsRecoveryOSRestoreVersion](self, "_supportsRecoveryOSRestoreVersion"));
    -[SUCoreDevice setDeviceSupportsFactoryVersion:]( self,  "setDeviceSupportsFactoryVersion:",  -[SUCoreDevice _supportsFactoryVersion](self, "_supportsFactoryVersion"));
    -[SUCoreDevice setDeviceSupportsPreservedFactoryVersion:]( self,  "setDeviceSupportsPreservedFactoryVersion:",  -[SUCoreDevice _supportsPreservedFactoryVersion](self, "_supportsPreservedFactoryVersion"));
    -[SUCoreDevice setDeviceSupportsSplatRestoreVersion:]( self,  "setDeviceSupportsSplatRestoreVersion:",  -[SUCoreDevice _supportsSplatRestoreVersion](self, "_supportsSplatRestoreVersion"));
    -[SUCoreDevice setDeviceSupportsSplatSystemVersion:]( self,  "setDeviceSupportsSplatSystemVersion:",  -[SUCoreDevice _supportsSplatSystemVersion](self, "_supportsSplatSystemVersion"));
    -[SUCoreDevice setDeviceSupportsMultiVolumeBoot:](self, "setDeviceSupportsMultiVolumeBoot:", 0LL);
    -[SUCoreDevice setSystemVersionPlistContents:](self, "setSystemVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsCoreServices](self, "deviceSupportsCoreServices"))
    {
      id v74 = objc_alloc(MEMORY[0x189603F68]);
      v75 = -[SUCoreDevice systemVersionPlistPath](self, "systemVersionPlistPath");
      v76 = (void *)[v74 initWithContentsOfFile:v75];
      -[SUCoreDevice setSystemVersionPlistContents:](self, "setSystemVersionPlistContents:", v76);
    }

    -[SUCoreDevice setRestoreVersionPlistContents:](self, "setRestoreVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsRestoreVersion](self, "deviceSupportsRestoreVersion"))
    {
      id v77 = objc_alloc(MEMORY[0x189603F68]);
      v78 = -[SUCoreDevice restoreVersionPlistPath](self, "restoreVersionPlistPath");
      v79 = (void *)[v77 initWithContentsOfFile:v78];
      -[SUCoreDevice setRestoreVersionPlistContents:](self, "setRestoreVersionPlistContents:", v79);
    }

    -[SUCoreDevice setSfrSystemVersionPlistContents:](self, "setSfrSystemVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsSFRSystemVersion](self, "deviceSupportsSFRSystemVersion"))
    {
      id v80 = objc_alloc(MEMORY[0x189603F68]);
      v81 = -[SUCoreDevice sfrSystemVersionPlistPath](self, "sfrSystemVersionPlistPath");
      v82 = (void *)[v80 initWithContentsOfFile:v81];
      -[SUCoreDevice setSfrSystemVersionPlistContents:](self, "setSfrSystemVersionPlistContents:", v82);
    }

    -[SUCoreDevice setSfrRestoreVersionPlistContents:](self, "setSfrRestoreVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsSFRRestoreVersion](self, "deviceSupportsSFRRestoreVersion"))
    {
      id v83 = objc_alloc(MEMORY[0x189603F68]);
      v84 = -[SUCoreDevice sfrRestoreVersionPlistPath](self, "sfrRestoreVersionPlistPath");
      v85 = (void *)[v83 initWithContentsOfFile:v84];
      -[SUCoreDevice setSfrRestoreVersionPlistContents:](self, "setSfrRestoreVersionPlistContents:", v85);
    }

    -[SUCoreDevice setRecoveryOSSystemVersionPlistContents:](self, "setRecoveryOSSystemVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsRecoveryOSRestoreVersion](self, "deviceSupportsRecoveryOSRestoreVersion"))
    {
      id v86 = objc_alloc(MEMORY[0x189603F68]);
      v87 = -[SUCoreDevice recoveryOSSystemVersionPlistPath](self, "recoveryOSSystemVersionPlistPath");
      v88 = (void *)[v86 initWithContentsOfFile:v87];
      -[SUCoreDevice setRecoveryOSSystemVersionPlistContents:](self, "setRecoveryOSSystemVersionPlistContents:", v88);
    }

    -[SUCoreDevice setRecoveryOSRestoreVersionPlistContents:](self, "setRecoveryOSRestoreVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsRecoveryOSRestoreVersion](self, "deviceSupportsRecoveryOSRestoreVersion"))
    {
      id v89 = objc_alloc(MEMORY[0x189603F68]);
      v90 = -[SUCoreDevice recoveryOSRestoreVersionPlistPath](self, "recoveryOSRestoreVersionPlistPath");
      v91 = (void *)[v89 initWithContentsOfFile:v90];
      -[SUCoreDevice setRecoveryOSRestoreVersionPlistContents:](self, "setRecoveryOSRestoreVersionPlistContents:", v91);
    }

    -[SUCoreDevice setFactoryVersionPlistContents:](self, "setFactoryVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsFactoryVersion](self, "deviceSupportsFactoryVersion"))
    {
      id v92 = objc_alloc(MEMORY[0x189603F68]);
      v93 = -[SUCoreDevice factoryVersionPlistPath](self, "factoryVersionPlistPath");
      v94 = (void *)[v92 initWithContentsOfFile:v93];
      -[SUCoreDevice setFactoryVersionPlistContents:](self, "setFactoryVersionPlistContents:", v94);
    }

    -[SUCoreDevice setPreservedFactoryVersionPlistContents:](self, "setPreservedFactoryVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsPreservedFactoryVersion](self, "deviceSupportsPreservedFactoryVersion"))
    {
      id v95 = objc_alloc(MEMORY[0x189603F68]);
      v96 = -[SUCoreDevice preservedFactoryVersionPlistPath](self, "preservedFactoryVersionPlistPath");
      v97 = (void *)[v95 initWithContentsOfFile:v96];
      -[SUCoreDevice setPreservedFactoryVersionPlistContents:](self, "setPreservedFactoryVersionPlistContents:", v97);
    }

    -[SUCoreDevice setAppleInternalVariantPlistContents:](self, "setAppleInternalVariantPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsCoreServices](self, "deviceSupportsCoreServices"))
    {
      id v98 = objc_alloc(MEMORY[0x189603F68]);
      v99 = -[SUCoreDevice appleInternalVariantPlistPath](self, "appleInternalVariantPlistPath");
      v100 = (void *)[v98 initWithContentsOfFile:v99];
      -[SUCoreDevice setAppleInternalVariantPlistContents:](self, "setAppleInternalVariantPlistContents:", v100);
    }

    -[SUCoreDevice setSplatRestoreVersionPlistContents:](self, "setSplatRestoreVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsSplatRestoreVersion](self, "deviceSupportsSplatRestoreVersion"))
    {
      id v101 = objc_alloc(MEMORY[0x189603F68]);
      v102 = -[SUCoreDevice splatRestoreVersionPlistPath](self, "splatRestoreVersionPlistPath");
      v103 = (void *)[v101 initWithContentsOfFile:v102];
      -[SUCoreDevice setSplatRestoreVersionPlistContents:](self, "setSplatRestoreVersionPlistContents:", v103);
    }

    -[SUCoreDevice setSplatSystemVersionPlistContents:](self, "setSplatSystemVersionPlistContents:", 0LL);
    if (-[SUCoreDevice deviceSupportsSplatSystemVersion](self, "deviceSupportsSplatSystemVersion"))
    {
      id v104 = objc_alloc(MEMORY[0x189603F68]);
      v105 = -[SUCoreDevice splatSystemVersionPlistPath](self, "splatSystemVersionPlistPath");
      v106 = (void *)[v104 initWithContentsOfFile:v105];
      -[SUCoreDevice setSplatSystemVersionPlistContents:](self, "setSplatSystemVersionPlistContents:", v106);
    }

    -[SUCoreDevice setSplatRollbackRestoreVersionPlistContents:]( self,  "setSplatRollbackRestoreVersionPlistContents:",  0LL);
    if (-[SUCoreDevice deviceSupportsSplatRollbackRestoreVersion](self, "deviceSupportsSplatRollbackRestoreVersion"))
    {
      id v107 = objc_alloc(MEMORY[0x189603F68]);
      v108 = -[SUCoreDevice splatRollbackRestoreVersionPlistPath](self, "splatRollbackRestoreVersionPlistPath");
      v109 = (void *)[v107 initWithContentsOfFile:v108];
      -[SUCoreDevice setSplatRollbackRestoreVersionPlistContents:]( self,  "setSplatRollbackRestoreVersionPlistContents:",  v109);
    }

    -[SUCoreDevice setSplatRollbackSystemVersionPlistContents:]( self,  "setSplatRollbackSystemVersionPlistContents:",  0LL);
    if (-[SUCoreDevice deviceSupportsSplatRollbackSystemVersion](self, "deviceSupportsSplatRollbackSystemVersion"))
    {
      id v110 = objc_alloc(MEMORY[0x189603F68]);
      v111 = -[SUCoreDevice splatRollbackSystemVersionPlistPath](self, "splatRollbackSystemVersionPlistPath");
      v112 = (void *)[v110 initWithContentsOfFile:v111];
      -[SUCoreDevice setSplatRollbackSystemVersionPlistContents:]( self,  "setSplatRollbackSystemVersionPlistContents:",  v112);
    }

    -[SUCoreDevice setSplatCryptex1RestoreVersionPlistContents:]( self,  "setSplatCryptex1RestoreVersionPlistContents:",  0LL);
    if (-[SUCoreDevice deviceSupportsSplatCryptex1RestoreVersion](self, "deviceSupportsSplatCryptex1RestoreVersion"))
    {
      id v113 = objc_alloc(MEMORY[0x189603F68]);
      v114 = -[SUCoreDevice splatCryptex1RestoreVersionPlistPath](self, "splatCryptex1RestoreVersionPlistPath");
      v115 = (void *)[v113 initWithContentsOfFile:v114];
      -[SUCoreDevice setSplatCryptex1RestoreVersionPlistContents:]( self,  "setSplatCryptex1RestoreVersionPlistContents:",  v115);
    }

    -[SUCoreDevice setSplatCryptex1SystemVersionPlistContents:]( self,  "setSplatCryptex1SystemVersionPlistContents:",  0LL);
    if (-[SUCoreDevice deviceSupportsSplatCryptex1SystemVersion](self, "deviceSupportsSplatCryptex1SystemVersion"))
    {
      id v116 = objc_alloc(MEMORY[0x189603F68]);
      v117 = -[SUCoreDevice splatCryptex1SystemVersionPlistPath](self, "splatCryptex1SystemVersionPlistPath");
      v118 = (void *)[v116 initWithContentsOfFile:v117];
      -[SUCoreDevice setSplatCryptex1SystemVersionPlistContents:]( self,  "setSplatCryptex1SystemVersionPlistContents:",  v118);
    }

    id v119 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 1LL);
    -[SUCoreDevice setBuildVersion:](self, "setBuildVersion:", v119);

    id v120 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 2LL);
    -[SUCoreDevice setProductVersion:](self, "setProductVersion:", v120);

    id v121 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 3LL);
    -[SUCoreDevice setHwModelString:](self, "setHwModelString:", v121);

    id v122 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 5LL);
    -[SUCoreDevice setDeviceClass:](self, "setDeviceClass:", v122);

    id v123 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 6LL);
    -[SUCoreDevice setMarketingProductName:](self, "setMarketingProductName:", v123);

    id v124 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 7LL);
    -[SUCoreDevice setProductType:](self, "setProductType:", v124);

    id v125 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 8LL);
    -[SUCoreDevice setReleaseType:](self, "setReleaseType:", v125);

    id v126 = -[SUCoreDevice _copyDeviceBoardID](self, "_copyDeviceBoardID");
    -[SUCoreDevice setDeviceBoardID:](self, "setDeviceBoardID:", v126);

    id v127 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 4LL);
    -[SUCoreDevice setHwTarget:](self, "setHwTarget:", v127);

    -[SUCoreDevice setRestoreVersion:](self, "setRestoreVersion:", 0LL);
    if (-[SUCoreDevice deviceSupportsRestoreVersion](self, "deviceSupportsRestoreVersion"))
    {
      id v128 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 9LL);
      id v129 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 10LL);
      [NSString stringWithFormat:@"%@,%@", v128, v129];
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDevice setRestoreVersion:](self, "setRestoreVersion:", v130);
    }
    v131 = -[SUCoreDevice releaseType](self, "releaseType");
    -[SUCoreDevice setIsInternal:](self, "setIsInternal:", [v131 isEqualToString:@"Internal"]);
    v132 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    id v133 = [v132 commonDomain];
    [v133 UTF8String];
    -[SUCoreDevice setIsBootedOSSecureInternal:]( self,  "setIsBootedOSSecureInternal:",  os_variant_has_internal_content());

    -[SUCoreDevice setHasEmbeddedOS:](self, "setHasEmbeddedOS:", 0LL);
    -[SUCoreDevice setHasBridgeOS:](self, "setHasBridgeOS:", 0LL);
    -[SUCoreDevice setBridgeRestoreVersion:](self, "setBridgeRestoreVersion:", 0LL);
    -[SUCoreDevice setBridgeBuildVersion:](self, "setBridgeBuildVersion:", 0LL);
    -[SUCoreDevice setIsBridgeInternal:](self, "setIsBridgeInternal:", 0LL);
    -[SUCoreDevice setHasSFR:](self, "setHasSFR:", -[SUCoreDevice _supportsSFR](self, "_supportsSFR"));
    -[SUCoreDevice setSfrRestoreVersion:](self, "setSfrRestoreVersion:", 0LL);
    -[SUCoreDevice setSfrBuildVersion:](self, "setSfrBuildVersion:", 0LL);
    -[SUCoreDevice setSfrProductVersion:](self, "setSfrProductVersion:", 0LL);
    -[SUCoreDevice setSfrReleaseType:](self, "setSfrReleaseType:", 0LL);
    if (-[SUCoreDevice hasSFR](self, "hasSFR"))
    {
      id v134 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 14LL);
      id v135 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 15LL);
      v136 = v135;
      if (v134 && v135)
      {
        [NSString stringWithFormat:@"%@,%@", v134, v135];
        v137 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDevice setSfrRestoreVersion:](self, "setSfrRestoreVersion:", v137);
      }

      else
      {
        v146 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        [v146 oslog];
        v137 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR)) {
          -[SUCoreDevice adjustTargetingSystemVolume:].cold.3();
        }
      }

      id v147 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 11LL);
      -[SUCoreDevice setSfrBuildVersion:](self, "setSfrBuildVersion:", v147);

      id v148 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 12LL);
      -[SUCoreDevice setSfrProductVersion:](self, "setSfrProductVersion:", v148);

      id v149 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 13LL);
      -[SUCoreDevice setSfrReleaseType:](self, "setSfrReleaseType:", v149);
    }

    -[SUCoreDevice setHasRecoveryOS:]( self,  "setHasRecoveryOS:",  -[SUCoreDevice _supportsRecoveryOS](self, "_supportsRecoveryOS"));
    -[SUCoreDevice setRecoveryOSBuildVersion:](self, "setRecoveryOSBuildVersion:", 0LL);
    -[SUCoreDevice setRecoveryOSProductVersion:](self, "setRecoveryOSProductVersion:", 0LL);
    -[SUCoreDevice setRecoveryOSRestoreVersion:](self, "setRecoveryOSRestoreVersion:", 0LL);
    -[SUCoreDevice setRecoveryOSReleaseType:](self, "setRecoveryOSReleaseType:", 0LL);
    if (-[SUCoreDevice hasRecoveryOS](self, "hasRecoveryOS"))
    {
      id v150 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 19LL);
      id v151 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 20LL);
      v152 = v151;
      if (v150 && v151)
      {
        [NSString stringWithFormat:@"%@,%@", v150, v151];
        v153 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDevice setRecoveryOSRestoreVersion:](self, "setRecoveryOSRestoreVersion:", v153);
      }

      else
      {
        v154 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        [v154 oslog];
        v153 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
          -[SUCoreDevice adjustTargetingSystemVolume:].cold.2();
        }
      }

      id v155 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 16LL);
      -[SUCoreDevice setRecoveryOSBuildVersion:](self, "setRecoveryOSBuildVersion:", v155);

      id v156 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 17LL);
      -[SUCoreDevice setRecoveryOSProductVersion:](self, "setRecoveryOSProductVersion:", v156);

      id v157 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 18LL);
      -[SUCoreDevice setRecoveryOSReleaseType:](self, "setRecoveryOSReleaseType:", v157);
    }

    -[SUCoreDevice setFactoryRestoreVersion:](self, "setFactoryRestoreVersion:", 0LL);
    if (-[SUCoreDevice deviceSupportsFactoryVersion](self, "deviceSupportsFactoryVersion"))
    {
      id v158 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 21LL);
      -[SUCoreDevice setFactoryRestoreVersion:](self, "setFactoryRestoreVersion:", v158);
    }

    -[SUCoreDevice setPreservedFactoryRestoreVersion:](self, "setPreservedFactoryRestoreVersion:", 0LL);
    if (-[SUCoreDevice deviceSupportsPreservedFactoryVersion](self, "deviceSupportsPreservedFactoryVersion"))
    {
      id v159 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 22LL);
      -[SUCoreDevice setPreservedFactoryRestoreVersion:](self, "setPreservedFactoryRestoreVersion:", v159);
    }

    -[SUCoreDevice setHasSplat:](self, "setHasSplat:", -[SUCoreDevice _supportsSplat](self, "_supportsSplat"));
    -[SUCoreDevice setSplatRestoreVersion:](self, "setSplatRestoreVersion:", 0LL);
    -[SUCoreDevice setSplatProductVersion:](self, "setSplatProductVersion:", 0LL);
    -[SUCoreDevice setSplatBuildVersion:](self, "setSplatBuildVersion:", 0LL);
    -[SUCoreDevice setSplatReleaseType:](self, "setSplatReleaseType:", 0LL);
    -[SUCoreDevice setSplatProductVersionExtra:](self, "setSplatProductVersionExtra:", 0LL);
    -[SUCoreDevice setSplatRollbackRestoreVersion:](self, "setSplatRollbackRestoreVersion:", 0LL);
    -[SUCoreDevice setSplatRollbackProductVersion:](self, "setSplatRollbackProductVersion:", 0LL);
    -[SUCoreDevice setSplatRollbackBuildVersion:](self, "setSplatRollbackBuildVersion:", 0LL);
    -[SUCoreDevice setSplatRollbackReleaseType:](self, "setSplatRollbackReleaseType:", 0LL);
    -[SUCoreDevice setSplatRollbackProductVersionExtra:](self, "setSplatRollbackProductVersionExtra:", 0LL);
    -[SUCoreDevice setSplatCryptex1RestoreVersion:](self, "setSplatCryptex1RestoreVersion:", 0LL);
    -[SUCoreDevice setSplatCryptex1ProductVersion:](self, "setSplatCryptex1ProductVersion:", 0LL);
    -[SUCoreDevice setSplatCryptex1BuildVersion:](self, "setSplatCryptex1BuildVersion:", 0LL);
    -[SUCoreDevice setSplatCryptex1BuildVersionOverride:](self, "setSplatCryptex1BuildVersionOverride:", 0LL);
    -[SUCoreDevice setSplatCryptex1ReleaseType:](self, "setSplatCryptex1ReleaseType:", 0LL);
    -[SUCoreDevice setSplatCryptex1ProductVersionExtra:](self, "setSplatCryptex1ProductVersionExtra:", 0LL);
    -[SUCoreDevice setHasSplatOnlyUpdateInstalled:](self, "setHasSplatOnlyUpdateInstalled:", 0LL);
    if (-[SUCoreDevice hasSplat](self, "hasSplat"))
    {
      id v160 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 23LL);
      -[SUCoreDevice setSplatRestoreVersion:](self, "setSplatRestoreVersion:", v160);

      id v161 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 24LL);
      -[SUCoreDevice setSplatProductVersion:](self, "setSplatProductVersion:", v161);

      id v162 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 25LL);
      -[SUCoreDevice setSplatBuildVersion:](self, "setSplatBuildVersion:", v162);

      id v163 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 26LL);
      -[SUCoreDevice setSplatReleaseType:](self, "setSplatReleaseType:", v163);

      id v164 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 27LL);
      -[SUCoreDevice setSplatProductVersionExtra:](self, "setSplatProductVersionExtra:", v164);

      id v165 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 28LL);
      -[SUCoreDevice setSplatRollbackRestoreVersion:](self, "setSplatRollbackRestoreVersion:", v165);

      id v166 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 29LL);
      -[SUCoreDevice setSplatRollbackProductVersion:](self, "setSplatRollbackProductVersion:", v166);

      id v167 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 31LL);
      -[SUCoreDevice setSplatRollbackBuildVersion:](self, "setSplatRollbackBuildVersion:", v167);

      id v168 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 32LL);
      -[SUCoreDevice setSplatRollbackReleaseType:](self, "setSplatRollbackReleaseType:", v168);

      id v169 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 30LL);
      -[SUCoreDevice setSplatRollbackProductVersionExtra:](self, "setSplatRollbackProductVersionExtra:", v169);

      id v170 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 33LL);
      -[SUCoreDevice setSplatCryptex1RestoreVersion:](self, "setSplatCryptex1RestoreVersion:", v170);

      id v171 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 34LL);
      -[SUCoreDevice setSplatCryptex1ProductVersion:](self, "setSplatCryptex1ProductVersion:", v171);

      id v172 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 36LL);
      -[SUCoreDevice setSplatCryptex1BuildVersion:](self, "setSplatCryptex1BuildVersion:", v172);

      id v173 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 37LL);
      -[SUCoreDevice setSplatCryptex1BuildVersionOverride:](self, "setSplatCryptex1BuildVersionOverride:", v173);

      id v174 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 38LL);
      -[SUCoreDevice setSplatCryptex1ReleaseType:](self, "setSplatCryptex1ReleaseType:", v174);

      id v175 = -[SUCoreDevice _copyStringValueForKey:](self, "_copyStringValueForKey:", 35LL);
      -[SUCoreDevice setSplatCryptex1ProductVersionExtra:](self, "setSplatCryptex1ProductVersionExtra:", v175);

      -[SUCoreDevice setHasSplatOnlyUpdateInstalled:]( self,  "setHasSplatOnlyUpdateInstalled:",  -[SUCoreDevice _hasSplatOnlyUpdateInstalled](self, "_hasSplatOnlyUpdateInstalled"));
    }

    -[SUCoreDevice _adjustValuesForMacOS](self, "_adjustValuesForMacOS");
    v176 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v176 oslog];
    v177 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDevice description](self, "description");
      id v178 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v180 = v178;
      _os_log_impl( &dword_187139000,  v177,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Initialized new device: %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    v138 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v138 oslog];
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice adjustTargetingSystemVolume:].cold.1((os_log_s *)v16, v139, v140, v141, v142, v143, v144, v145);
    }
  }
}

- (NSDictionary)splatRollbackRestoreVersionPlistContents
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x189603F68]);
  -[SUCoreDevice splatRollbackRestoreVersionPlistPath](v2, "splatRollbackRestoreVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 initWithContentsOfFile:v4];
  splatRollbackRestoreVersionPlistContents = v2->_splatRollbackRestoreVersionPlistContents;
  v2->_splatRollbackRestoreVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  return v2->_splatRollbackRestoreVersionPlistContents;
}

- (NSDictionary)splatRollbackSystemVersionPlistContents
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x189603F68]);
  -[SUCoreDevice splatRollbackSystemVersionPlistPath](v2, "splatRollbackSystemVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 initWithContentsOfFile:v4];
  splatRollbackSystemVersionPlistContents = v2->_splatRollbackSystemVersionPlistContents;
  v2->_splatRollbackSystemVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  return v2->_splatRollbackSystemVersionPlistContents;
}

- (NSDictionary)splatCryptex1RestoreVersionPlistContents
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x189603F68]);
  -[SUCoreDevice splatCryptex1RestoreVersionPlistPath](v2, "splatCryptex1RestoreVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 initWithContentsOfFile:v4];
  splatCryptex1RestoreVersionPlistContents = v2->_splatCryptex1RestoreVersionPlistContents;
  v2->_splatCryptex1RestoreVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  return v2->_splatCryptex1RestoreVersionPlistContents;
}

- (NSDictionary)splatCryptex1SystemVersionPlistContents
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x189603F68]);
  -[SUCoreDevice splatCryptex1SystemVersionPlistPath](v2, "splatCryptex1SystemVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 initWithContentsOfFile:v4];
  splatCryptex1SystemVersionPlistContents = v2->_splatCryptex1SystemVersionPlistContents;
  v2->_splatCryptex1SystemVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  return v2->_splatCryptex1SystemVersionPlistContents;
}

- (NSString)splatRestoreVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 23LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 23LL);
  splatRestoreVersion = v2->_splatRestoreVersion;
  v2->_splatRestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRestoreVersion;
}

- (NSString)splatProductVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 24LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 24LL);
  splatProductVersion = v2->_splatProductVersion;
  v2->_splatProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatProductVersion;
}

- (NSString)splatBuildVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 25LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 25LL);
  splatBuildVersion = v2->_splatBuildVersion;
  v2->_splatBuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatBuildVersion;
}

- (NSString)splatReleaseType
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 26LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 26LL);
  splatReleaseType = v2->_splatReleaseType;
  v2->_splatReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatReleaseType;
}

- (NSString)splatProductVersionExtra
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 27LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 27LL);
  splatProductVersionExtra = v2->_splatProductVersionExtra;
  v2->_splatProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatProductVersionExtra;
}

- (void)reloadDevice
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice adjustTargetingSystemVolume:](self, "adjustTargetingSystemVolume:", v3);
}

- (BOOL)isCorrectlyFormattedBuildVersion:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x189607A00];
  id v4 = a3;
  [v3 regularExpressionWithPattern:@"^([0-9]+)[a-zA-Z]([0-9]+)[a-z]?$" options:0 error:0];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v7 = v6 != 0LL;
  return v7;
}

- (BOOL)isCorrectlyFormattedProductVersion:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x189607A00];
  id v4 = a3;
  [v3 regularExpressionWithPattern:@"^([0-9]+).([0-9]+)(.[0-9]+)?$" options:0 error:0];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v7 = v6 != 0LL;
  return v7;
}

- (BOOL)isMinorOSUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreDevice buildVersion](self, "buildVersion");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUCoreDevice _getMajorVersionFromBuildVersion:](self, "_getMajorVersionFromBuildVersion:", v5);
  -[SUCoreDevice _getMajorVersionFromBuildVersion:](self, "_getMajorVersionFromBuildVersion:", v4);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v6 intValue];
    int v11 = [v7 intValue];
    int v12 = [v6 intValue];
    int v13 = [v7 intValue];
    uint64_t v14 = @"NO";
    v18[0] = 67109634;
    v18[1] = v10;
    if (v12 == v13) {
      uint64_t v14 = @"YES";
    }
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_impl( &dword_187139000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Build version comparison found current version %d, build version %d, isMinorOSUpdate: %{public}@",  (uint8_t *)v18,  0x18u);
  }

  BOOL v15 = 0;
  if (v6 && v7)
  {
    int v16 = [v6 intValue];
    BOOL v15 = v16 == [v7 intValue];
  }

  return v15;
}

- (BOOL)isMajorOSUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreDevice buildVersion](self, "buildVersion");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUCoreDevice _getMajorVersionFromBuildVersion:](self, "_getMajorVersionFromBuildVersion:", v5);
  -[SUCoreDevice _getMajorVersionFromBuildVersion:](self, "_getMajorVersionFromBuildVersion:", v4);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v6 intValue];
    int v11 = [v7 intValue];
    int v12 = [v6 intValue];
    int v13 = [v7 intValue];
    uint64_t v14 = @"NO";
    v18[0] = 67109634;
    v18[1] = v10;
    if (v12 < v13) {
      uint64_t v14 = @"YES";
    }
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_impl( &dword_187139000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] Build version comparison found current version %d, build version %d, isMajorOSUpdate: %{public}@",  (uint8_t *)v18,  0x18u);
  }

  BOOL v15 = 0;
  if (v6 && v7)
  {
    int v16 = [v6 intValue];
    BOOL v15 = v16 < (int)[v7 intValue];
  }

  return v15;
}

- (id)_getMajorVersionFromBuildVersion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    [MEMORY[0x189607A00] regularExpressionWithPattern:@"^([0-9]+).*" options:0 error:0];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && [v5 numberOfRanges])
    {
      uint64_t v7 = [v6 rangeAtIndex:1];
      objc_msgSend(v3, "substringWithRange:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 oslog];
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _getMajorVersionFromBuildVersion:].cold.2();
      }

      v9 = 0LL;
    }
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _getMajorVersionFromBuildVersion:].cold.1((os_log_s *)v4, v13, v14, v15, v16, v17, v18, v19);
    }
    v9 = 0LL;
  }

  return v9;
}

- (id)_copySplatCryptex1SystemVersionPath
{
  return 0LL;
}

- (id)_copySplatCryptex1RestoreVersionPath
{
  return 0LL;
}

- (id)_copySplatRollbackObjectsPath
{
  return 0LL;
}

- (id)_copySplatRollbackSystemVersionPath
{
  return 0LL;
}

- (id)_copySplatRollbackRestoreVersionPath
{
  return 0LL;
}

- (BOOL)hasSemiSplatActive
{
  return 0;
}

- (BOOL)hasEligibleRollback
{
  return 0;
}

- (NSString)splatRollbackRestoreVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 28LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 28LL);
  splatRollbackRestoreVersion = v2->_splatRollbackRestoreVersion;
  v2->_splatRollbackRestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackRestoreVersion;
}

- (NSString)splatRollbackProductVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 29LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 29LL);
  splatRollbackProductVersion = v2->_splatRollbackProductVersion;
  v2->_splatRollbackProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackProductVersion;
}

- (NSString)splatRollbackProductVersionExtra
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 30LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 30LL);
  splatRollbackProductVersionExtra = v2->_splatRollbackProductVersionExtra;
  v2->_splatRollbackProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackProductVersionExtra;
}

- (NSString)splatRollbackBuildVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 31LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 31LL);
  splatRollbackBuildVersion = v2->_splatRollbackBuildVersion;
  v2->_splatRollbackBuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackBuildVersion;
}

- (NSString)splatRollbackReleaseType
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 32LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 32LL);
  splatRollbackReleaseType = v2->_splatRollbackReleaseType;
  v2->_splatRollbackReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatRollbackReleaseType;
}

- (NSString)splatCryptex1RestoreVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 33LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 33LL);
  splatCryptex1RestoreVersion = v2->_splatCryptex1RestoreVersion;
  v2->_splatCryptex1RestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1RestoreVersion;
}

- (NSString)splatCryptex1ProductVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 34LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 34LL);
  splatCryptex1ProductVersion = v2->_splatCryptex1ProductVersion;
  v2->_splatCryptex1ProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1ProductVersion;
}

- (NSString)splatCryptex1ProductVersionExtra
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 35LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 35LL);
  splatCryptex1ProductVersionExtra = v2->_splatCryptex1ProductVersionExtra;
  v2->_splatCryptex1ProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1ProductVersionExtra;
}

- (NSString)splatCryptex1BuildVersion
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 36LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 36LL);
  splatCryptex1BuildVersion = v2->_splatCryptex1BuildVersion;
  v2->_splatCryptex1BuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1BuildVersion;
}

- (NSString)splatCryptex1BuildVersionOverride
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 37LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 37LL);
  splatCryptex1BuildVersionOverride = v2->_splatCryptex1BuildVersionOverride;
  v2->_splatCryptex1BuildVersionOverride = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1BuildVersionOverride;
}

- (NSString)splatCryptex1ReleaseType
{
  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDevice _reloadPlistContentsForKey:](v2, "_reloadPlistContentsForKey:", 38LL);
  uint64_t v3 = -[SUCoreDevice _copyStringValueForKey:](v2, "_copyStringValueForKey:", 38LL);
  splatCryptex1ReleaseType = v2->_splatCryptex1ReleaseType;
  v2->_splatCryptex1ReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  return v2->_splatCryptex1ReleaseType;
}

- (BOOL)_supportsMobileGestalt
{
  return 1;
}

- (BOOL)_supportsCoreServices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice systemVersionPlistPath](self, "systemVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsAppleInternalVariant
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice appleInternalVariantPlistPath](self, "appleInternalVariantPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsRestoreVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice restoreVersionPlistPath](self, "restoreVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSFRSystemVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrSystemVersionPlistPath](self, "sfrSystemVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSFRRestoreVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrRestoreVersionPlistPath](self, "sfrRestoreVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSFR
{
  return 0;
}

- (BOOL)_supportsRecoveryOSSystemVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSSystemVersionPlistPath](self, "recoveryOSSystemVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsRecoveryOSRestoreVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSRestoreVersionPlistPath](self, "recoveryOSRestoreVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsFactoryVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice factoryVersionPlistPath](self, "factoryVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsPreservedFactoryVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice preservedFactoryVersionPlistPath](self, "preservedFactoryVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSplatRestoreVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatRestoreVersionPlistPath](self, "splatRestoreVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSplatSystemVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatSystemVersionPlistPath](self, "splatSystemVersionPlistPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsRecoveryOS
{
  return 0;
}

- (BOOL)_supportsSplat
{
  return 0;
}

- (BOOL)_hasSplatOnlyUpdateInstalled
{
  return 0;
}

- (BOOL)requiresDocAssetForUpdate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:@"AppleTV"];

  return v3 ^ 1;
}

- (id)_copyDeviceBoardID
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_initializeBridgeOSProperties
{
  if (MEMORY[0x189611EB0]) {
    BOOL v2 = MEMORY[0x189611EB8] == 0LL;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || MEMORY[0x189611EA0] == 0LL || MEMORY[0x189611EE8] == 0LL)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  v7,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] RemoteServiceDiscovery methods are not available on this platform (initializeBridgeOSProperties)",  buf,  2u);
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)remote_device_copy_unique_of_type();
    if (*__error() == 35)
    {
      uint64_t v8 = remote_device_copy_unique_of_type();

      uint64_t v7 = (os_log_s *)v8;
    }

    if (v7)
    {
      v9 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v9 oslog];
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl( &dword_187139000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] RemoteServiceDiscovery indicates that this is a T2 bridgeOS device via REMOTE_DEVICE_TYPE_BRIDG E_COPROC (initializeBridgeOSProperties)",  v17,  2u);
      }

      -[SUCoreDevice setHasBridgeOS:](self, "setHasBridgeOS:", 1LL);
LABEL_26:
      -[SUCoreDevice _parseBridgeOSBuildInformationFromDevice:](self, "_parseBridgeOSBuildInformationFromDevice:", v7);
      goto LABEL_27;
    }

    uint64_t v7 = (os_log_s *)remote_device_copy_unique_of_type();
    if (*__error() == 35)
    {
      uint64_t v11 = remote_device_copy_unique_of_type();

      uint64_t v7 = (os_log_s *)v11;
    }

    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v14)
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl( &dword_187139000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] RemoteServiceDiscovery indicates that this is a T1 bridgeOS device via REMOTE_DEVICE_TYPE_EOS(initializeBridgeOSProperties)",  v16,  2u);
      }

      -[SUCoreDevice setHasEmbeddedOS:](self, "setHasEmbeddedOS:", 1LL);
      goto LABEL_26;
    }

    if (v14)
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl( &dword_187139000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] RemoteServiceDiscovery indicates that this is not a bridgeOS device (initializeBridgeOSProperties)",  v15,  2u);
    }

    uint64_t v7 = v13;
  }

- (void)_parseBridgeOSBuildInformationFromDevice:(id)a3
{
  id v10 = a3;
  uint64_t v4 = remote_device_copy_bridge_version_string();
  if (v4)
  {
    char v5 = (void *)v4;
    v6 = (void *)[objc_alloc(NSString) initWithUTF8String:v4];
    -[SUCoreDevice setBridgeRestoreVersion:](self, "setBridgeRestoreVersion:", v6);

    free(v5);
  }

  uint64_t v7 = remote_device_copy_os_build();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = (void *)[objc_alloc(NSString) initWithUTF8String:v7];
    -[SUCoreDevice setBridgeBuildVersion:](self, "setBridgeBuildVersion:", v9);

    free(v8);
  }

  -[SUCoreDevice setIsBridgeInternal:](self, "setIsBridgeInternal:", remote_device_copy_internal_build());
}

- (id)getSystemRecoveryNSIHDirectory
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl( &dword_187139000,  v3,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] SystemRecoveryNSIH: Device does not support variable boot policy",  v5,  2u);
  }

  return 0LL;
}

- (void)_reloadPlistContentsForKey:(int64_t)a3
{
  switch(a3)
  {
    case 23LL:
      id v10 = objc_alloc(MEMORY[0x189603F68]);
      -[SUCoreDevice splatRestoreVersionPlistPath](self, "splatRestoreVersionPlistPath");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      char v5 = (void *)[v10 initWithContentsOfFile:v13];
      -[SUCoreDevice setSplatRestoreVersionPlistContents:](self, "setSplatRestoreVersionPlistContents:", v5);
      goto LABEL_11;
    case 24LL:
    case 25LL:
    case 26LL:
    case 27LL:
      id v6 = objc_alloc(MEMORY[0x189603F68]);
      -[SUCoreDevice splatSystemVersionPlistPath](self, "splatSystemVersionPlistPath");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      char v5 = (void *)[v6 initWithContentsOfFile:v13];
      -[SUCoreDevice setSplatSystemVersionPlistContents:](self, "setSplatSystemVersionPlistContents:", v5);
      goto LABEL_11;
    case 28LL:
      id v11 = objc_alloc(MEMORY[0x189603F68]);
      -[SUCoreDevice splatRollbackRestoreVersionPlistPath](self, "splatRollbackRestoreVersionPlistPath");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      char v5 = (void *)[v11 initWithContentsOfFile:v13];
      -[SUCoreDevice setSplatRollbackRestoreVersionPlistContents:]( self,  "setSplatRollbackRestoreVersionPlistContents:",  v5);
      goto LABEL_11;
    case 29LL:
    case 30LL:
    case 31LL:
    case 32LL:
      id v7 = objc_alloc(MEMORY[0x189603F68]);
      -[SUCoreDevice splatRollbackSystemVersionPlistPath](self, "splatRollbackSystemVersionPlistPath");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      char v5 = (void *)[v7 initWithContentsOfFile:v13];
      -[SUCoreDevice setSplatRollbackSystemVersionPlistContents:]( self,  "setSplatRollbackSystemVersionPlistContents:",  v5);
      goto LABEL_11;
    case 33LL:
      id v12 = objc_alloc(MEMORY[0x189603F68]);
      -[SUCoreDevice splatCryptex1RestoreVersionPlistPath](self, "splatCryptex1RestoreVersionPlistPath");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      char v5 = (void *)[v12 initWithContentsOfFile:v13];
      -[SUCoreDevice setSplatCryptex1RestoreVersionPlistContents:]( self,  "setSplatCryptex1RestoreVersionPlistContents:",  v5);
      goto LABEL_11;
    case 34LL:
    case 35LL:
    case 36LL:
    case 37LL:
    case 38LL:
      id v4 = objc_alloc(MEMORY[0x189603F68]);
      -[SUCoreDevice splatCryptex1SystemVersionPlistPath](self, "splatCryptex1SystemVersionPlistPath");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      char v5 = (void *)[v4 initWithContentsOfFile:v13];
      -[SUCoreDevice setSplatCryptex1SystemVersionPlistContents:]( self,  "setSplatCryptex1SystemVersionPlistContents:",  v5);
LABEL_11:

      break;
    default:
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 oslog];
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _reloadPlistContentsForKey:].cold.1();
      }

      break;
  }

- (id)_copyStringValueForKey:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int64_t v5 = -[SUCoreDevice _queryMethodForKey:](self, "_queryMethodForKey:");
  switch(v5)
  {
    case 1LL:
      id result = -[SUCoreDevice _copyGestaltValueForKey:](self, "_copyGestaltValueForKey:", a3);
      break;
    case 2LL:
      id result = -[SUCoreDevice _copyCoreServicesValueForKey:](self, "_copyCoreServicesValueForKey:", a3);
      break;
    case 3LL:
      id result = -[SUCoreDevice _copyCoreServicesAppleInternalValue](self, "_copyCoreServicesAppleInternalValue");
      break;
    case 4LL:
      id result = -[SUCoreDevice _copyRestoreVersionValueForKey:](self, "_copyRestoreVersionValueForKey:", a3);
      break;
    case 5LL:
      id result = -[SUCoreDevice _copySysCtlValueForKey:](self, "_copySysCtlValueForKey:", a3);
      break;
    case 6LL:
      id result = -[SUCoreDevice _copySFRSystemVersionValueForKey:](self, "_copySFRSystemVersionValueForKey:", a3);
      break;
    case 7LL:
      id result = -[SUCoreDevice _copySFRRestoreVersionValueForKey:](self, "_copySFRRestoreVersionValueForKey:", a3);
      break;
    case 8LL:
      id result = -[SUCoreDevice _copyRecoveryOSSystemVersionValueForKey:]( self,  "_copyRecoveryOSSystemVersionValueForKey:",  a3);
      break;
    case 9LL:
      id result = -[SUCoreDevice _copyRecoveryOSRestoreVersionValueForKey:]( self,  "_copyRecoveryOSRestoreVersionValueForKey:",  a3);
      break;
    case 10LL:
      id result = -[SUCoreDevice _copyFactoryVersionValueForKey:](self, "_copyFactoryVersionValueForKey:", a3);
      break;
    case 11LL:
      id result = -[SUCoreDevice _copySplatValueForKey:](self, "_copySplatValueForKey:", a3);
      break;
    case 12LL:
      id result = -[SUCoreDevice _copySplatRollbackValueForKey:](self, "_copySplatRollbackValueForKey:", a3);
      break;
    case 13LL:
      id result = -[SUCoreDevice _copySplatCryptex1ValueForKey:](self, "_copySplatCryptex1ValueForKey:", a3);
      break;
    default:
      int64_t v7 = v5;
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 oslog];
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[SUCoreDevice _nameForQueryMethod:](self, "_nameForQueryMethod:", v7);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDevice _nameForQueryKey:](self, "_nameForQueryKey:", a3);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = 138543618;
        id v13 = v10;
        __int16 v14 = 2114;
        uint64_t v15 = v11;
        _os_log_error_impl( &dword_187139000,  v9,  OS_LOG_TYPE_ERROR,  "[SUCoreDevice] Unsupported query method %{public}@ attempted for key %{public}@",  (uint8_t *)&v12,  0x16u);
      }

      id result = 0LL;
      break;
  }

  return result;
}

- (int64_t)_queryMethodForKey:(int64_t)a3
{
  int64_t v3 = a3;
  switch(a3)
  {
    case 0LL:
      return v3;
    case 1LL:
    case 2LL:
      if (-[SUCoreDevice deviceSupportsMultiVolumeBoot](self, "deviceSupportsMultiVolumeBoot")) {
        int64_t v3 = 2LL;
      }
      else {
        int64_t v3 = 1LL;
      }
      break;
    case 3LL:
    case 5LL:
    case 6LL:
    case 7LL:
      int64_t v3 = 1LL;
      break;
    case 4LL:
      int64_t v3 = 5LL;
      break;
    case 8LL:
      if (-[SUCoreDevice deviceSupportsMultiVolumeBoot](self, "deviceSupportsMultiVolumeBoot")) {
        int64_t v3 = 3LL;
      }
      else {
        int64_t v3 = 1LL;
      }
      break;
    case 9LL:
    case 10LL:
      int64_t v3 = 4LL;
      break;
    case 11LL:
    case 12LL:
    case 13LL:
      int64_t v3 = 6LL;
      break;
    case 14LL:
    case 15LL:
      int64_t v3 = 7LL;
      break;
    case 16LL:
    case 17LL:
    case 18LL:
      int64_t v3 = 8LL;
      break;
    case 19LL:
    case 20LL:
      int64_t v3 = 9LL;
      break;
    case 21LL:
    case 22LL:
      int64_t v3 = 10LL;
      break;
    case 23LL:
    case 24LL:
    case 25LL:
    case 26LL:
    case 27LL:
      int64_t v3 = 11LL;
      break;
    case 28LL:
    case 29LL:
    case 30LL:
    case 31LL:
    case 32LL:
      int64_t v3 = 12LL;
      break;
    case 33LL:
    case 34LL:
    case 35LL:
    case 36LL:
    case 37LL:
    case 38LL:
      int64_t v3 = 13LL;
      break;
    default:
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 oslog];
      int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _queryMethodForKey:].cold.1();
      }

      int64_t v3 = 0LL;
      break;
  }

  return v3;
}

- (id)_copyGestaltValueForKey:(int64_t)a3
{
  return (id)MGCopyAnswer();
}

- (id)_copyCoreServicesValueForKey:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice systemVersionPlistContents](self, "systemVersionPlistContents");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copyRestoreVersionValueForKey:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice restoreVersionPlistContents](self, "restoreVersionPlistContents");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copyCoreServicesAppleInternalValue
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 safeULLForKey:@"AppleInternal"];

  if (v3 == 1) {
    return (id)[objc_alloc(NSString) initWithString:@"Internal"];
  }
  else {
    return 0LL;
  }
}

- (id)_copySysCtlValueForKey:(int64_t)a3
{
  v3 = size_t v12 = 0LL;
  else {
    BOOL v4 = v12 == 0;
  }
  if (v4)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _copySysCtlValueForKey:].cold.2();
    }

    int64_t v7 = 0LL;
  }

  else
  {
    uint64_t v8 = calloc(v12 + 1, 1uLL);
    if (sysctlbyname((const char *)[v3 UTF8String], v8, &v12, 0, 0))
    {
      v9 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v9 oslog];
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _copySysCtlValueForKey:].cold.1();
      }

      int64_t v7 = 0LL;
    }

    else
    {
      [NSString stringWithUTF8String:v8];
      int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    free(v8);
  }

  return v7;
}

- (id)_copySFRSystemVersionValueForKey:(int64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrSystemVersionPlistContents](self, "sfrSystemVersionPlistContents");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copySFRRestoreVersionValueForKey:(int64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice sfrRestoreVersionPlistContents](self, "sfrRestoreVersionPlistContents");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copyRecoveryOSSystemVersionValueForKey:(int64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSSystemVersionPlistContents](self, "recoveryOSSystemVersionPlistContents");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copyFactoryVersionValueForKey:(int64_t)a3
{
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _factoryVersionPlistContentsForKey:](self, "_factoryVersionPlistContentsForKey:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 safeStringForKey:v5];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (id)_copyRecoveryOSRestoreVersionValueForKey:(int64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice recoveryOSRestoreVersionPlistContents](self, "recoveryOSRestoreVersionPlistContents");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copySplatValueForKey:(int64_t)a3
{
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _splatVersionPlistContentsForKey:](self, "_splatVersionPlistContentsForKey:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 safeStringForKey:v5];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (id)_copySplatRollbackValueForKey:(int64_t)a3
{
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _splatRollbackVersionPlistContentsForKey:](self, "_splatRollbackVersionPlistContentsForKey:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 safeStringForKey:v5];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (id)_copySplatCryptex1ValueForKey:(int64_t)a3
{
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice _splatCryptex1VersionPlistContentsForKey:](self, "_splatCryptex1VersionPlistContentsForKey:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 safeStringForKey:v5];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (__CFString)_gestaltKeyForQueryKey:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _gestaltKeyForQueryKey:].cold.1();
  }

  return 0LL;
}

- (id)_coreServicesKeyForQueryKey:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _coreServicesKeyForQueryKey:].cold.1();
  }

  return 0LL;
}

- (id)_restoreVersionKeyForQueryKey:(int64_t)a3
{
  int64_t v3 = a3 - 9;
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _restoreVersionKeyForQueryKey:].cold.1();
  }

  return 0LL;
}

- (id)_factoryVersionKeyForQueryKey:(int64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _factoryVersionKeyForQueryKey:].cold.1();
  }

  return 0LL;
}

- (id)_factoryVersionPlistContentsForKey:(int64_t)a3
{
  if (a3 == 22)
  {
    -[SUCoreDevice preservedFactoryVersionPlistContents](self, "preservedFactoryVersionPlistContents");
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (a3 == 21)
  {
    -[SUCoreDevice factoryVersionPlistContents](self, "factoryVersionPlistContents");
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _factoryVersionPlistContentsForKey:].cold.1();
    }

    int64_t v3 = 0LL;
  }

  return v3;
}

- (id)_sysCtlKeyForQueryKey:(int64_t)a3
{
  switch(a3)
  {
    case 3LL:
      return @"hw.model";
    case 7LL:
      return @"hw.product";
    case 4LL:
      return @"hw.target";
  }

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _sysCtlKeyForQueryKey:].cold.1();
  }

  return 0LL;
}

- (id)_splatVersionKeyForQueryKey:(int64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _splatVersionKeyForQueryKey:].cold.1();
  }

  return 0LL;
}

- (id)_splatVersionPlistContentsForKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 24) >= 4)
  {
    if (a3 == 23)
    {
      -[SUCoreDevice splatRestoreVersionPlistContents](self, "splatRestoreVersionPlistContents");
      int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 oslog];
      int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _splatVersionPlistContentsForKey:].cold.1();
      }

      int64_t v3 = 0LL;
    }
  }

  else
  {
    -[SUCoreDevice splatSystemVersionPlistContents](self, "splatSystemVersionPlistContents");
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_splatRollbackVersionPlistContentsForKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 29) >= 4)
  {
    if (a3 == 28)
    {
      -[SUCoreDevice splatRollbackRestoreVersionPlistContents](self, "splatRollbackRestoreVersionPlistContents");
      int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 oslog];
      int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _splatRollbackVersionPlistContentsForKey:].cold.1();
      }

      int64_t v3 = 0LL;
    }
  }

  else
  {
    -[SUCoreDevice splatRollbackSystemVersionPlistContents](self, "splatRollbackSystemVersionPlistContents");
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_splatCryptex1VersionPlistContentsForKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 34) >= 5)
  {
    if (a3 == 33)
    {
      -[SUCoreDevice splatCryptex1RestoreVersionPlistContents](self, "splatCryptex1RestoreVersionPlistContents");
      int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 oslog];
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _splatCryptex1VersionPlistContentsForKey:].cold.1();
      }

      int64_t v3 = 0LL;
    }
  }

  else
  {
    -[SUCoreDevice splatCryptex1SystemVersionPlistContents](self, "splatCryptex1SystemVersionPlistContents");
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_nameForQueryMethod:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_nameForQueryKey:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  id v60 = (id)NSString;
  v82 = -[SUCoreDevice targetedSystemVolume](self, "targetedSystemVolume");
  if (-[SUCoreDevice deviceSupportsMobileGestalt](self, "deviceSupportsMobileGestalt")) {
    int64_t v3 = @"YES";
  }
  else {
    int64_t v3 = @"NO";
  }
  v59 = v3;
  if (-[SUCoreDevice deviceSupportsCoreServices](self, "deviceSupportsCoreServices")) {
    BOOL v4 = @"YES";
  }
  else {
    BOOL v4 = @"NO";
  }
  v58 = v4;
  if (-[SUCoreDevice deviceSupportsAppleInternalVariant](self, "deviceSupportsAppleInternalVariant")) {
    int64_t v5 = @"YES";
  }
  else {
    int64_t v5 = @"NO";
  }
  v57 = v5;
  if (-[SUCoreDevice deviceSupportsRestoreVersion](self, "deviceSupportsRestoreVersion")) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  v56 = v6;
  if (-[SUCoreDevice deviceSupportsSFRSystemVersion](self, "deviceSupportsSFRSystemVersion")) {
    int64_t v7 = @"YES";
  }
  else {
    int64_t v7 = @"NO";
  }
  v55 = v7;
  if (-[SUCoreDevice deviceSupportsSFRRestoreVersion](self, "deviceSupportsSFRRestoreVersion")) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  v54 = v8;
  if (-[SUCoreDevice deviceSupportsMultiVolumeBoot](self, "deviceSupportsMultiVolumeBoot")) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v53 = v9;
  if (-[SUCoreDevice deviceSupportsSplatRestoreVersion](self, "deviceSupportsSplatRestoreVersion")) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  v52 = v10;
  if (-[SUCoreDevice deviceSupportsSplatSystemVersion](self, "deviceSupportsSplatSystemVersion")) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  v51 = v11;
  v81 = -[SUCoreDevice buildVersion](self, "buildVersion");
  -[SUCoreDevice productVersion](self, "productVersion");
  id v80 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[SUCoreDevice hwModelString](self, "hwModelString");
  v79 = -[SUCoreDevice deviceClass](self, "deviceClass");
  -[SUCoreDevice marketingProductName](self, "marketingProductName");
  id v77 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[SUCoreDevice productType](self, "productType");
  -[SUCoreDevice releaseType](self, "releaseType");
  id v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = -[SUCoreDevice deviceBoardID](self, "deviceBoardID");
  v73 = -[SUCoreDevice hwTarget](self, "hwTarget");
  if (-[SUCoreDevice isInternal](self, "isInternal")) {
    size_t v12 = @"YES";
  }
  else {
    size_t v12 = @"NO";
  }
  v50 = v12;
  if (-[SUCoreDevice isBootedOSSecureInternal](self, "isBootedOSSecureInternal")) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  v49 = v13;
  v72 = -[SUCoreDevice restoreVersion](self, "restoreVersion");
  if (-[SUCoreDevice hasEmbeddedOS](self, "hasEmbeddedOS")) {
    __int16 v14 = @"YES";
  }
  else {
    __int16 v14 = @"NO";
  }
  v48 = v14;
  if (-[SUCoreDevice hasBridgeOS](self, "hasBridgeOS")) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  v47 = v15;
  v71 = -[SUCoreDevice bridgeBuildVersion](self, "bridgeBuildVersion");
  v70 = -[SUCoreDevice bridgeRestoreVersion](self, "bridgeRestoreVersion");
  if (-[SUCoreDevice isBridgeInternal](self, "isBridgeInternal")) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  v45 = v16;
  if (-[SUCoreDevice hasSFR](self, "hasSFR")) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  v46 = v17;
  v69 = -[SUCoreDevice sfrProductVersion](self, "sfrProductVersion");
  v66 = -[SUCoreDevice sfrBuildVersion](self, "sfrBuildVersion");
  v68 = -[SUCoreDevice sfrRestoreVersion](self, "sfrRestoreVersion");
  v67 = -[SUCoreDevice sfrReleaseType](self, "sfrReleaseType");
  if (-[SUCoreDevice hasRecoveryOS](self, "hasRecoveryOS")) {
    uint64_t v18 = @"YES";
  }
  else {
    uint64_t v18 = @"NO";
  }
  v41 = v18;
  v63 = -[SUCoreDevice recoveryOSProductVersion](self, "recoveryOSProductVersion");
  v65 = -[SUCoreDevice recoveryOSBuildVersion](self, "recoveryOSBuildVersion");
  v64 = -[SUCoreDevice recoveryOSRestoreVersion](self, "recoveryOSRestoreVersion");
  v44 = -[SUCoreDevice recoveryOSReleaseType](self, "recoveryOSReleaseType");
  v43 = -[SUCoreDevice factoryRestoreVersion](self, "factoryRestoreVersion");
  v42 = -[SUCoreDevice preservedFactoryRestoreVersion](self, "preservedFactoryRestoreVersion");
  if (-[SUCoreDevice hasSplat](self, "hasSplat")) {
    uint64_t v19 = @"YES";
  }
  else {
    uint64_t v19 = @"NO";
  }
  v36 = v19;
  if (-[SUCoreDevice hasSplatOnlyUpdateInstalled](self, "hasSplatOnlyUpdateInstalled")) {
    int v20 = @"YES";
  }
  else {
    int v20 = @"NO";
  }
  v33 = v20;
  v62 = -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
  v40 = -[SUCoreDevice splatProductVersion](self, "splatProductVersion");
  v39 = -[SUCoreDevice splatProductVersionExtra](self, "splatProductVersionExtra");
  v38 = -[SUCoreDevice splatBuildVersion](self, "splatBuildVersion");
  v37 = -[SUCoreDevice splatReleaseType](self, "splatReleaseType");
  if (-[SUCoreDevice hasEligibleRollback](self, "hasEligibleRollback")) {
    __int16 v21 = @"YES";
  }
  else {
    __int16 v21 = @"NO";
  }
  v22 = -[SUCoreDevice splatRollbackRestoreVersion](self, "splatRollbackRestoreVersion");
  v35 = -[SUCoreDevice splatRollbackProductVersion](self, "splatRollbackProductVersion");
  v34 = -[SUCoreDevice splatRollbackProductVersionExtra](self, "splatRollbackProductVersionExtra");
  v32 = -[SUCoreDevice splatRollbackBuildVersion](self, "splatRollbackBuildVersion");
  -[SUCoreDevice splatRollbackReleaseType](self, "splatRollbackReleaseType");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice hasSemiSplatActive](self, "hasSemiSplatActive")) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  v31 = -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
  v30 = -[SUCoreDevice splatCryptex1ProductVersion](self, "splatCryptex1ProductVersion");
  v29 = -[SUCoreDevice splatCryptex1ProductVersionExtra](self, "splatCryptex1ProductVersionExtra");
  -[SUCoreDevice splatCryptex1BuildVersion](self, "splatCryptex1BuildVersion");
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1BuildVersionOverride](self, "splatCryptex1BuildVersionOverride");
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice splatCryptex1ReleaseType](self, "splatCryptex1ReleaseType");
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v60,  "stringWithFormat:",  @"\n[>>>\n               targetedSystemVolume: %@\n        deviceSupportsMobileGestalt: %@\n         deviceSupportsCoreServices: %@\n deviceSupportsAppleInternalVariant: %@\n       deviceSupportsRestoreVersion: %@\n     deviceSupportsSFRSystemVersion: %@\n    deviceSupportsSFRRestoreVersion: %@\n      deviceSupportsMultiVolumeBoot: %@\n  deviceSupportsSplatRestoreVersion: %@\n   deviceSupportsSplatSystemVersion: %@\n                       buildVersion: %@\n                     productVersion: %@\n                      hwModelString: %@\n                        deviceClass: %@\n               marketingProductName: %@\n                        productType: %@\n                        releaseType: %@\n                      deviceBoardID: %@\n                           hwTarget: %@\n                         isInternal: %@\n           isBootedOSSecureInternal: %@\n                     restoreVersion: %@\n                      hasEmbeddedOS: %@\n                        hasBridgeOS: %@\n                 bridgeBuildVersion: %@\n               bridgeRestoreVersion: %@\n                   isBridgeInternal: %@\n                             hasSFR: %@\n                  sfrProductVersion: %@\n                    sfrBuildVersion: %@\n                  sfrRestoreVersion: %@\n                     sfrReleaseType: %@\n                      hasRecoveryOS: %@\n           recoveryOSProductVersion: %@\n             recoveryOSBuildVersion: %@\n           recoveryOSRestoreVersion: %@\n              recoveryOSReleaseType: %@\n              factoryRestoreVersion: %@\n     preservedFactoryRestoreVersion: %@\n                           hasSplat: %@\n        hasSplatOnlyUpdateInstalled: %@\n                splatRestoreVersion: %@\n                splatProductVersion: %@\n           splatProductVersionExtra: %@\n                  splatBuildVersion: %@\n                   splatReleaseType: %@\n                hasEligibleRollback: %@\n        splatRollbackRestoreVersion: %@\n        splatRollbackProductVersion: %@\n   splatRollbackProductVersionExtra: %@\n          splatRollbackBuildVersion: %@\n           splatRollbackReleaseType: %@\n                 hasSemiSplatActive: %@\n        splatCryptex1RestoreVersion: %@\n        splatCryptex1ProductVersion: %@\n   splatCryptex1ProductVersionExtra: %@\n          splatCryptex1BuildVersion: %@\n  splatCryptex1BuildVersionOverride: %@\n           splatCryptex1ReleaseType: %@\n<<<]",  v82,  v59,  v58,  v57,  v56,  v55,  v54,  v53,  v52,  v51,  v81,  v80,  v78,  v79,  v77,  v76,  v74,  v75,  v73,  v50,  v49,  v72,  v48,  v47,  v71,  v70,  v45,  v46,  v69,  v66,  v68,  v67,  v41,  v63,  v65,  v64,  v44,  v43,  v42,  v36,  v33,  v62,  v40,  v39,  v38,  v37,
    v21,
    v22,
    v35,
    v34,
    v32,
    v23,
    v24,
    v31,
    v30,
    v29,
    v28,
    v27,
    v26);
  id v61 = (id)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)summary
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  -[SUCoreDevice targetedSystemVolume](self, "targetedSystemVolume");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"SystemVolume(TargetedSystemVolume:%@)", v4];

  BOOL v5 = -[SUCoreDevice deviceSupportsRestoreVersion](self, "deviceSupportsRestoreVersion");
  -[SUCoreDevice buildVersion](self, "buildVersion");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[SUCoreDevice productVersion](self, "productVersion");
  uint64_t v8 = (void *)v7;
  if (v5)
  {
    v9 = -[SUCoreDevice restoreVersion](self, "restoreVersion");
    [v3 appendFormat:@" Build(BuildVersion:%@|ProductVersion:%@|RestoreVersion:%@)", v6, v8, v9];
  }

  else
  {
    [v3 appendFormat:@" Build(BuildVersion:%@|ProductVersion:%@)", v6, v7];
  }

  -[SUCoreDevice deviceClass](self, "deviceClass");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice marketingProductName](self, "marketingProductName");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice productType](self, "productType");
  size_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDevice hwModelString](self, "hwModelString");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@" Device(DeviceClass:%@|MarketingProductName:%@|ProductType:%@|HWModelStr:%@)", v10, v11, v12, v13];

  -[SUCoreDevice releaseType](self, "releaseType");
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDevice isInternal](self, "isInternal")) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  if (-[SUCoreDevice isBootedOSSecureInternal](self, "isBootedOSSecureInternal")) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  [v3 appendFormat:@" ReleaseType(ReleaseType:%@|Internal:%@|BootedOSSecureInternal:%@)", v14, v15, v16];

  if (-[SUCoreDevice hasEmbeddedOS](self, "hasEmbeddedOS"))
  {
    -[SUCoreDevice bridgeBuildVersion](self, "bridgeBuildVersion");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice bridgeRestoreVersion](self, "bridgeRestoreVersion");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUCoreDevice isBridgeInternal](self, "isBridgeInternal")) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    [v3 appendFormat:@" EmbeddedOS(Build:%@|RestoreVersion:%@|Internal:%@)", v17, v18, v19];
  }

  if (-[SUCoreDevice hasBridgeOS](self, "hasBridgeOS"))
  {
    -[SUCoreDevice bridgeBuildVersion](self, "bridgeBuildVersion");
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice bridgeRestoreVersion](self, "bridgeRestoreVersion");
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUCoreDevice isBridgeInternal](self, "isBridgeInternal")) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    [v3 appendFormat:@" BridgeOS(Build:%@|RestoreVersion:%@|Internal:%@)", v20, v21, v22];
  }

  if (-[SUCoreDevice hasSFR](self, "hasSFR"))
  {
    -[SUCoreDevice sfrBuildVersion](self, "sfrBuildVersion");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SUCoreDevice sfrProductVersion](self, "sfrProductVersion");
    -[SUCoreDevice sfrRestoreVersion](self, "sfrRestoreVersion");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice sfrReleaseType](self, "sfrReleaseType");
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendFormat:@" SFR(Build:%@|ProductVersion:%@|RestoreVersion:%@|ReleaseType:%@)", v23, v24, v25, v26];
  }

  if (-[SUCoreDevice hasRecoveryOS](self, "hasRecoveryOS"))
  {
    -[SUCoreDevice recoveryOSBuildVersion](self, "recoveryOSBuildVersion");
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDevice recoveryOSProductVersion](self, "recoveryOSProductVersion");
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[SUCoreDevice recoveryOSRestoreVersion](self, "recoveryOSRestoreVersion");
    v30 = -[SUCoreDevice recoveryOSReleaseType](self, "recoveryOSReleaseType");
    [v3 appendFormat:@" RecoveryOS(Build:%@|ProductVersion:%@|RestoreVersion:%@|ReleaseType:%@)", v27, v28, v29, v30];
  }

  if (-[SUCoreDevice deviceSupportsFactoryVersion](self, "deviceSupportsFactoryVersion")
    || -[SUCoreDevice deviceSupportsPreservedFactoryVersion](self, "deviceSupportsPreservedFactoryVersion"))
  {
    v31 = -[SUCoreDevice factoryRestoreVersion](self, "factoryRestoreVersion");
    v32 = v31;
    if (v31)
    {
      id v33 = v31;
    }

    else
    {
      -[SUCoreDevice preservedFactoryRestoreVersion](self, "preservedFactoryRestoreVersion");
      id v33 = (id)objc_claimAutoreleasedReturnValue();
    }

    v34 = v33;
    v35 = -[SUCoreDevice preservedFactoryRestoreVersion](self, "preservedFactoryRestoreVersion");
    if (v35) {
      v36 = @"YES";
    }
    else {
      v36 = @"NO";
    }
    [v3 appendFormat:@" FactoryVersion(Version:%@|Preserved:%@)", v34, v36];
  }

  if (-[SUCoreDevice hasSplat](self, "hasSplat"))
  {
    v37 = -[SUCoreDevice splatRestoreVersion](self, "splatRestoreVersion");
    v38 = -[SUCoreDevice splatProductVersion](self, "splatProductVersion");
    v39 = -[SUCoreDevice splatProductVersionExtra](self, "splatProductVersionExtra");
    v40 = -[SUCoreDevice splatBuildVersion](self, "splatBuildVersion");
    v41 = -[SUCoreDevice splatReleaseType](self, "splatReleaseType");
    if (-[SUCoreDevice hasSplatOnlyUpdateInstalled](self, "hasSplatOnlyUpdateInstalled")) {
      v42 = @"YES";
    }
    else {
      v42 = @"NO";
    }
    [v3 appendFormat:@" Splat(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|ReleaseType:%@|HasSplatOnlyUpdateInstalled:%@)", v37, v38, v39, v40, v41, v42];
    v43 = -[SUCoreDevice splatRollbackRestoreVersion](self, "splatRollbackRestoreVersion");
    v44 = -[SUCoreDevice splatRollbackProductVersion](self, "splatRollbackProductVersion");
    v45 = -[SUCoreDevice splatRollbackProductVersionExtra](self, "splatRollbackProductVersionExtra");
    v46 = -[SUCoreDevice splatRollbackBuildVersion](self, "splatRollbackBuildVersion");
    v47 = -[SUCoreDevice splatRollbackReleaseType](self, "splatRollbackReleaseType");
    if (-[SUCoreDevice hasEligibleRollback](self, "hasEligibleRollback")) {
      v48 = @"YES";
    }
    else {
      v48 = @"NO";
    }
    [v3 appendFormat:@" SplatRollback(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|ReleaseType:%@|HasEligibleRollback:%@)", v43, v44, v45, v46, v47, v48];
    v49 = -[SUCoreDevice splatCryptex1RestoreVersion](self, "splatCryptex1RestoreVersion");
    v50 = -[SUCoreDevice splatCryptex1ProductVersion](self, "splatCryptex1ProductVersion");
    v51 = -[SUCoreDevice splatCryptex1ProductVersionExtra](self, "splatCryptex1ProductVersionExtra");
    v52 = -[SUCoreDevice splatCryptex1BuildVersion](self, "splatCryptex1BuildVersion");
    v53 = -[SUCoreDevice splatCryptex1BuildVersionOverride](self, "splatCryptex1BuildVersionOverride");
    v54 = -[SUCoreDevice splatCryptex1ReleaseType](self, "splatCryptex1ReleaseType");
    if (-[SUCoreDevice hasSemiSplatActive](self, "hasSemiSplatActive")) {
      v55 = @"YES";
    }
    else {
      v55 = @"NO";
    }
    [v3 appendFormat:@" SplatCryptex1(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|BuildVersionOverride:%@|ReleaseType:%@|HasSemiSplatActive:%@)", v49, v50, v51, v52, v53, v54, v55];
  }

  [NSString stringWithString:v3];
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

- (NSString)targetedSystemVolume
{
  return self->_targetedSystemVolume;
}

- (void)setTargetedSystemVolume:(id)a3
{
}

- (NSString)systemVersionPlistPath
{
  return self->_systemVersionPlistPath;
}

- (void)setSystemVersionPlistPath:(id)a3
{
}

- (NSDictionary)systemVersionPlistContents
{
  return self->_systemVersionPlistContents;
}

- (void)setSystemVersionPlistContents:(id)a3
{
}

- (NSString)restoreVersionPlistPath
{
  return self->_restoreVersionPlistPath;
}

- (void)setRestoreVersionPlistPath:(id)a3
{
}

- (NSDictionary)restoreVersionPlistContents
{
  return self->_restoreVersionPlistContents;
}

- (void)setRestoreVersionPlistContents:(id)a3
{
}

- (NSString)appleInternalVariantPlistPath
{
  return self->_appleInternalVariantPlistPath;
}

- (void)setAppleInternalVariantPlistPath:(id)a3
{
}

- (NSDictionary)appleInternalVariantPlistContents
{
  return self->_appleInternalVariantPlistContents;
}

- (void)setAppleInternalVariantPlistContents:(id)a3
{
}

- (NSString)sfrSystemVersionPlistPath
{
  return self->_sfrSystemVersionPlistPath;
}

- (void)setSfrSystemVersionPlistPath:(id)a3
{
}

- (NSDictionary)sfrSystemVersionPlistContents
{
  return self->_sfrSystemVersionPlistContents;
}

- (void)setSfrSystemVersionPlistContents:(id)a3
{
}

- (NSString)sfrRestoreVersionPlistPath
{
  return self->_sfrRestoreVersionPlistPath;
}

- (void)setSfrRestoreVersionPlistPath:(id)a3
{
}

- (NSDictionary)sfrRestoreVersionPlistContents
{
  return self->_sfrRestoreVersionPlistContents;
}

- (void)setSfrRestoreVersionPlistContents:(id)a3
{
}

- (NSString)recoveryOSSystemVersionPlistPath
{
  return self->_recoveryOSSystemVersionPlistPath;
}

- (void)setRecoveryOSSystemVersionPlistPath:(id)a3
{
}

- (NSDictionary)recoveryOSSystemVersionPlistContents
{
  return self->_recoveryOSSystemVersionPlistContents;
}

- (void)setRecoveryOSSystemVersionPlistContents:(id)a3
{
}

- (NSString)recoveryOSRestoreVersionPlistPath
{
  return self->_recoveryOSRestoreVersionPlistPath;
}

- (void)setRecoveryOSRestoreVersionPlistPath:(id)a3
{
}

- (NSDictionary)recoveryOSRestoreVersionPlistContents
{
  return self->_recoveryOSRestoreVersionPlistContents;
}

- (void)setRecoveryOSRestoreVersionPlistContents:(id)a3
{
}

- (NSString)factoryVersionPlistPath
{
  return self->_factoryVersionPlistPath;
}

- (void)setFactoryVersionPlistPath:(id)a3
{
}

- (NSDictionary)factoryVersionPlistContents
{
  return self->_factoryVersionPlistContents;
}

- (void)setFactoryVersionPlistContents:(id)a3
{
}

- (NSString)preservedFactoryVersionPlistPath
{
  return self->_preservedFactoryVersionPlistPath;
}

- (void)setPreservedFactoryVersionPlistPath:(id)a3
{
}

- (NSDictionary)preservedFactoryVersionPlistContents
{
  return self->_preservedFactoryVersionPlistContents;
}

- (void)setPreservedFactoryVersionPlistContents:(id)a3
{
}

- (NSString)splatRestoreVersionPlistPath
{
  return self->_splatRestoreVersionPlistPath;
}

- (void)setSplatRestoreVersionPlistPath:(id)a3
{
}

- (NSDictionary)splatRestoreVersionPlistContents
{
  return self->_splatRestoreVersionPlistContents;
}

- (void)setSplatRestoreVersionPlistContents:(id)a3
{
}

- (NSString)splatSystemVersionPlistPath
{
  return self->_splatSystemVersionPlistPath;
}

- (void)setSplatSystemVersionPlistPath:(id)a3
{
}

- (NSDictionary)splatSystemVersionPlistContents
{
  return self->_splatSystemVersionPlistContents;
}

- (void)setSplatSystemVersionPlistContents:(id)a3
{
}

- (NSString)splatRollbackRestoreVersionPlistPath
{
  return self->_splatRollbackRestoreVersionPlistPath;
}

- (void)setSplatRollbackRestoreVersionPlistPath:(id)a3
{
}

- (void)setSplatRollbackRestoreVersionPlistContents:(id)a3
{
}

- (NSString)splatRollbackSystemVersionPlistPath
{
  return self->_splatRollbackSystemVersionPlistPath;
}

- (void)setSplatRollbackSystemVersionPlistPath:(id)a3
{
}

- (void)setSplatRollbackSystemVersionPlistContents:(id)a3
{
}

- (NSString)splatCryptex1RestoreVersionPlistPath
{
  return self->_splatCryptex1RestoreVersionPlistPath;
}

- (void)setSplatCryptex1RestoreVersionPlistPath:(id)a3
{
}

- (void)setSplatCryptex1RestoreVersionPlistContents:(id)a3
{
}

- (NSString)splatCryptex1SystemVersionPlistPath
{
  return self->_splatCryptex1SystemVersionPlistPath;
}

- (void)setSplatCryptex1SystemVersionPlistPath:(id)a3
{
}

- (void)setSplatCryptex1SystemVersionPlistContents:(id)a3
{
}

- (BOOL)deviceSupportsMobileGestalt
{
  return self->_deviceSupportsMobileGestalt;
}

- (void)setDeviceSupportsMobileGestalt:(BOOL)a3
{
  self->_deviceSupportsMobileGestalt = a3;
}

- (BOOL)deviceSupportsCoreServices
{
  return self->_deviceSupportsCoreServices;
}

- (void)setDeviceSupportsCoreServices:(BOOL)a3
{
  self->_deviceSupportsCoreServices = a3;
}

- (BOOL)deviceSupportsAppleInternalVariant
{
  return self->_deviceSupportsAppleInternalVariant;
}

- (void)setDeviceSupportsAppleInternalVariant:(BOOL)a3
{
  self->_deviceSupportsAppleInternalVariant = a3;
}

- (BOOL)deviceSupportsSFRSystemVersion
{
  return self->_deviceSupportsSFRSystemVersion;
}

- (void)setDeviceSupportsSFRSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSFRSystemVersion = a3;
}

- (BOOL)deviceSupportsSFRRestoreVersion
{
  return self->_deviceSupportsSFRRestoreVersion;
}

- (void)setDeviceSupportsSFRRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSFRRestoreVersion = a3;
}

- (BOOL)deviceSupportsRecoveryOSSystemVersion
{
  return self->_deviceSupportsRecoveryOSSystemVersion;
}

- (void)setDeviceSupportsRecoveryOSSystemVersion:(BOOL)a3
{
  self->_deviceSupportsRecoveryOSSystemVersion = a3;
}

- (BOOL)deviceSupportsRecoveryOSRestoreVersion
{
  return self->_deviceSupportsRecoveryOSRestoreVersion;
}

- (void)setDeviceSupportsRecoveryOSRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsRecoveryOSRestoreVersion = a3;
}

- (BOOL)deviceSupportsFactoryVersion
{
  return self->_deviceSupportsFactoryVersion;
}

- (void)setDeviceSupportsFactoryVersion:(BOOL)a3
{
  self->_deviceSupportsFactoryVersion = a3;
}

- (BOOL)deviceSupportsPreservedFactoryVersion
{
  return self->_deviceSupportsPreservedFactoryVersion;
}

- (void)setDeviceSupportsPreservedFactoryVersion:(BOOL)a3
{
  self->_deviceSupportsPreservedFactoryVersion = a3;
}

- (BOOL)deviceSupportsRestoreVersion
{
  return self->_deviceSupportsRestoreVersion;
}

- (void)setDeviceSupportsRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsRestoreVersion = a3;
}

- (BOOL)deviceSupportsMultiVolumeBoot
{
  return self->_deviceSupportsMultiVolumeBoot;
}

- (void)setDeviceSupportsMultiVolumeBoot:(BOOL)a3
{
  self->_deviceSupportsMultiVolumeBoot = a3;
}

- (BOOL)deviceSupportsSplatRestoreVersion
{
  return self->_deviceSupportsSplatRestoreVersion;
}

- (void)setDeviceSupportsSplatRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatSystemVersion
{
  return self->_deviceSupportsSplatSystemVersion;
}

- (void)setDeviceSupportsSplatSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatSystemVersion = a3;
}

- (BOOL)deviceSupportsSplatRollbackRestoreVersion
{
  return self->_deviceSupportsSplatRollbackRestoreVersion;
}

- (void)setDeviceSupportsSplatRollbackRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRollbackRestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatRollbackSystemVersion
{
  return self->_deviceSupportsSplatRollbackSystemVersion;
}

- (void)setDeviceSupportsSplatRollbackSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRollbackSystemVersion = a3;
}

- (BOOL)deviceSupportsSplatCryptex1RestoreVersion
{
  return self->_deviceSupportsSplatCryptex1RestoreVersion;
}

- (void)setDeviceSupportsSplatCryptex1RestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatCryptex1RestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatCryptex1SystemVersion
{
  return self->_deviceSupportsSplatCryptex1SystemVersion;
}

- (void)setDeviceSupportsSplatCryptex1SystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatCryptex1SystemVersion = a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)hwModelString
{
  return self->_hwModelString;
}

- (void)setHwModelString:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)marketingProductName
{
  return self->_marketingProductName;
}

- (void)setMarketingProductName:(id)a3
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

- (NSString)deviceBoardID
{
  return self->_deviceBoardID;
}

- (void)setDeviceBoardID:(id)a3
{
}

- (NSString)hwTarget
{
  return self->_hwTarget;
}

- (void)setHwTarget:(id)a3
{
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
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

- (BOOL)isBootedOSSecureInternal
{
  return self->_isBootedOSSecureInternal;
}

- (void)setIsBootedOSSecureInternal:(BOOL)a3
{
  self->_isBootedOSSecureInternal = a3;
}

- (BOOL)hasEmbeddedOS
{
  return self->_hasEmbeddedOS;
}

- (void)setHasEmbeddedOS:(BOOL)a3
{
  self->_hasEmbeddedOS = a3;
}

- (BOOL)hasBridgeOS
{
  return self->_hasBridgeOS;
}

- (void)setHasBridgeOS:(BOOL)a3
{
  self->_hasBridgeOS = a3;
}

- (NSString)bridgeBuildVersion
{
  return self->_bridgeBuildVersion;
}

- (void)setBridgeBuildVersion:(id)a3
{
}

- (NSString)bridgeRestoreVersion
{
  return self->_bridgeRestoreVersion;
}

- (void)setBridgeRestoreVersion:(id)a3
{
}

- (BOOL)isBridgeInternal
{
  return self->_isBridgeInternal;
}

- (void)setIsBridgeInternal:(BOOL)a3
{
  self->_isBridgeInternal = a3;
}

- (BOOL)hasSFR
{
  return self->_hasSFR;
}

- (void)setHasSFR:(BOOL)a3
{
  self->_hasSFR = a3;
}

- (NSString)sfrBuildVersion
{
  return self->_sfrBuildVersion;
}

- (void)setSfrBuildVersion:(id)a3
{
}

- (NSString)sfrProductVersion
{
  return self->_sfrProductVersion;
}

- (void)setSfrProductVersion:(id)a3
{
}

- (NSString)sfrRestoreVersion
{
  return self->_sfrRestoreVersion;
}

- (void)setSfrRestoreVersion:(id)a3
{
}

- (NSString)sfrReleaseType
{
  return self->_sfrReleaseType;
}

- (void)setSfrReleaseType:(id)a3
{
}

- (BOOL)hasRecoveryOS
{
  return self->_hasRecoveryOS;
}

- (void)setHasRecoveryOS:(BOOL)a3
{
  self->_hasRecoveryOS = a3;
}

- (NSString)recoveryOSBuildVersion
{
  return self->_recoveryOSBuildVersion;
}

- (void)setRecoveryOSBuildVersion:(id)a3
{
}

- (NSString)recoveryOSProductVersion
{
  return self->_recoveryOSProductVersion;
}

- (void)setRecoveryOSProductVersion:(id)a3
{
}

- (NSString)recoveryOSRestoreVersion
{
  return self->_recoveryOSRestoreVersion;
}

- (void)setRecoveryOSRestoreVersion:(id)a3
{
}

- (NSString)recoveryOSReleaseType
{
  return self->_recoveryOSReleaseType;
}

- (void)setRecoveryOSReleaseType:(id)a3
{
}

- (NSString)factoryRestoreVersion
{
  return self->_factoryRestoreVersion;
}

- (void)setFactoryRestoreVersion:(id)a3
{
}

- (NSString)preservedFactoryRestoreVersion
{
  return self->_preservedFactoryRestoreVersion;
}

- (void)setPreservedFactoryRestoreVersion:(id)a3
{
}

- (BOOL)hasSplat
{
  return self->_hasSplat;
}

- (void)setHasSplat:(BOOL)a3
{
  self->_hasSplat = a3;
}

- (void)setSplatRestoreVersion:(id)a3
{
}

- (void)setSplatProductVersion:(id)a3
{
}

- (void)setSplatProductVersionExtra:(id)a3
{
}

- (void)setSplatBuildVersion:(id)a3
{
}

- (void)setSplatReleaseType:(id)a3
{
}

- (void)setHasSplatOnlyUpdateInstalled:(BOOL)a3
{
  self->_hasSplatOnlyUpdateInstalled = a3;
}

- (void)setSplatRollbackRestoreVersion:(id)a3
{
}

- (void)setSplatRollbackProductVersion:(id)a3
{
}

- (void)setSplatRollbackProductVersionExtra:(id)a3
{
}

- (void)setSplatRollbackBuildVersion:(id)a3
{
}

- (void)setSplatRollbackReleaseType:(id)a3
{
}

- (void)setSplatCryptex1RestoreVersion:(id)a3
{
}

- (void)setSplatCryptex1ProductVersion:(id)a3
{
}

- (void)setSplatCryptex1ProductVersionExtra:(id)a3
{
}

- (void)setSplatCryptex1BuildVersion:(id)a3
{
}

- (void)setSplatCryptex1BuildVersionOverride:(id)a3
{
}

- (void)setSplatCryptex1ReleaseType:(id)a3
{
}

- (NSString)bridgeVersionPlistPath
{
  return self->_bridgeVersionPlistPath;
}

- (void)setBridgeVersionPlistPath:(id)a3
{
}

- (NSDictionary)bridgeVersionPlistContents
{
  return self->_bridgeVersionPlistContents;
}

- (void)setBridgeVersionPlistContents:(id)a3
{
}

- (NSString)bridgeVersion
{
  return self->_bridgeVersion;
}

- (void)setBridgeVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

- (void)initTargetingSystemVolume:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_5( &dword_187139000,  a1,  a3,  "[SUCoreDevice] No system volume provided, returning no initialized device",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_11();
}

- (void)adjustTargetingSystemVolume:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_5( &dword_187139000,  a1,  a3,  "[SUCoreDevice] No system volume provided, returning",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_11();
}

- (void)adjustTargetingSystemVolume:.cold.2()
{
  OUTLINED_FUNCTION_7( &dword_187139000,  v0,  v1,  "[SUCoreDevice] Unable to determine RecoveryOS restore version (recoveryOSRestoreVersion=%{public}@, recoveryOSRestor eBuildGroup=%{public}@)");
  OUTLINED_FUNCTION_10();
}

- (void)adjustTargetingSystemVolume:.cold.3()
{
  OUTLINED_FUNCTION_7( &dword_187139000,  v0,  v1,  "[SUCoreDevice] Unable to determine SFR restore version (sfrRestoreVersion=%{public}@, sfrRestoreBuildGroup=%{public}@)");
  OUTLINED_FUNCTION_10();
}

- (void)_getMajorVersionFromBuildVersion:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_getMajorVersionFromBuildVersion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl( &dword_187139000,  v0,  OS_LOG_TYPE_ERROR,  "[SUCoreDevice] Build version comparison was unable to find a build regex match for %{public}@",  v1,  0xCu);
  OUTLINED_FUNCTION_10();
}

- (void)_reloadPlistContentsForKey:.cold.1()
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to reload plist contents",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_queryMethodForKey:.cold.1()
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_187139000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_copySysCtlValueForKey:.cold.1()
{
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6( &dword_187139000,  v1,  v2,  "[SUCoreDevice] sysctlbyname failed to set buffer for key %{public}@ with code %d (%s) buffer size %ld",  v3,  v4,  v5,  v6,  v7);
  OUTLINED_FUNCTION_8();
}

- (void)_copySysCtlValueForKey:.cold.2()
{
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6( &dword_187139000,  v1,  v2,  "[SUCoreDevice] sysctlbyname failed for key %{public}@ with code %d (%s) buffer size %ld",  v3,  v4,  v5,  v6,  v7);
  OUTLINED_FUNCTION_8();
}

- (void)_gestaltKeyForQueryKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a gestalt key",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_coreServicesKeyForQueryKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a core services key",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_restoreVersionKeyForQueryKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a restore version key",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_factoryVersionKeyForQueryKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a factory version key.",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_factoryVersionPlistContentsForKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain factory version plist contents.",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_sysCtlKeyForQueryKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a sysctl value",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_splatVersionKeyForQueryKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatVersion/SplatRollbackVersion/SplatCryptex1Version value",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_splatVersionPlistContentsForKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatVersion value",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_splatRollbackVersionPlistContentsForKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatRollback value",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)_splatCryptex1VersionPlistContentsForKey:.cold.1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0( &dword_187139000,  v2,  v3,  "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatCryptex1 value",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

@end