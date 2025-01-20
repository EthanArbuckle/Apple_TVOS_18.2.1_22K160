@interface SUCoreDescriptor
+ (BOOL)isEmergencyUpdate:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)cleanProductVersion:(id)a3;
+ (id)nameForDescriptorAudienceType:(int64_t)a3;
+ (id)nameForDescriptorPreferredUpdateType:(int64_t)a3;
+ (id)nameForDescriptorType:(int64_t)a3;
- (BOOL)allowAutoDownloadOnBattery;
- (BOOL)autoDownloadAllowableOverCellular;
- (BOOL)autoUpdateEnabled;
- (BOOL)containsSFRContent;
- (BOOL)criticalCellularOverride;
- (BOOL)criticalOutOfBoxOnly;
- (BOOL)criticalUpdate;
- (BOOL)disableAppDemotion;
- (BOOL)disableCDLevel4;
- (BOOL)disableInstallTonight;
- (BOOL)disableRecoveryOSUpdates;
- (BOOL)disableRosettaUpdates;
- (BOOL)disableSiriVoiceDeletion;
- (BOOL)disableSplatCombo;
- (BOOL)downloadAllowableOverCellular;
- (BOOL)downloadable;
- (BOOL)enableAlternateAssetAudience;
- (BOOL)enablePreSUStaging;
- (BOOL)enablePreSUStagingForOptionalAssets;
- (BOOL)forcePasscodeRequired;
- (BOOL)fullReplacement;
- (BOOL)granularlyRamped;
- (BOOL)isEqual:(id)a3;
- (BOOL)mandatoryUpdateEligible;
- (BOOL)mandatoryUpdateOptional;
- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox;
- (BOOL)notificationEnabled;
- (BOOL)notifyAfter;
- (BOOL)oneShotBuddyDisabled;
- (BOOL)promoteAlternateUpdate;
- (BOOL)rampEnabled;
- (BOOL)recommendedUpdateApplicable;
- (BOOL)recommendedUpdateEnabled;
- (BOOL)requireInstallAssistantUpdate;
- (BOOL)requiresDocumentationReload;
- (BOOL)requiresSoftwareUpdateAssetReload;
- (BOOL)revoked;
- (BOOL)semiSplatEnabled;
- (BOOL)semiSplatRestartNow;
- (BOOL)splatOnly;
- (BOOL)streamingZipCapable;
- (MAAbsoluteAssetId)documentationAssetAbsoluteID;
- (MAAbsoluteAssetId)softwareUpdateAssetAbsoluteID;
- (MAAsset)documentationAsset;
- (MAAsset)softwareUpdateAsset;
- (NSArray)oneShotBuddyDisabledBuilds;
- (NSArray)semiSplatMustQuitApps;
- (NSArray)supportedDevices;
- (NSData)measurement;
- (NSData)rsepDigest;
- (NSData)rsepTBMDigests;
- (NSData)sepDigest;
- (NSData)sepTBMDigests;
- (NSDate)releaseDate;
- (NSDictionary)bundleAttributes;
- (NSDictionary)systemPartitionPadding;
- (NSNumber)recommendedUpdateNotificationFrequencyDays;
- (NSString)alternateAssetAudienceUUID;
- (NSString)assetAudienceUUID;
- (NSString)assetID;
- (NSString)documentationAssetPurpose;
- (NSString)documentationAssetType;
- (NSString)documentationID;
- (NSString)humanReadableMoreInfoLink;
- (NSString)humanReadableUpdateName;
- (NSString)humanReadableUpdateTitle;
- (NSString)humanReadableUpdateVersion;
- (NSString)lastEmergencyBuild;
- (NSString)lastEmergencyOSVersion;
- (NSString)mandatoryUpdateBodyString;
- (NSString)mandatoryUpdateVersionMax;
- (NSString)mandatoryUpdateVersionMin;
- (NSString)measurementAlgorithm;
- (NSString)minimumBridgeVersion;
- (NSString)notificationBodyString;
- (NSString)notificationTitleString;
- (NSString)prerequisiteBuild;
- (NSString)prerequisiteOSVersion;
- (NSString)productBuildVersion;
- (NSString)productSystemName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)productVersionExtra;
- (NSString)publisher;
- (NSString)rawProductVersion;
- (NSString)recommendedUpdateAlertBodyString;
- (NSString)recommendedUpdateMaxOSVersion;
- (NSString)recommendedUpdateMinOSVersion;
- (NSString)recommendedUpdateTitleString;
- (NSString)releaseType;
- (NSString)restoreVersion;
- (NSString)setupCritical;
- (NSString)softwareUpdateAssetPurpose;
- (NSString)softwareUpdateAssetType;
- (NSString)softwareUpdateURL;
- (NSString)targetUpdateBridgeVersion;
- (NSString)targetUpdateSFRVersion;
- (NSString)trainName;
- (NSString)uniqueBuildID;
- (NSString)updateBrainPath;
- (NSString)updateBundlePath;
- (SUCoreDescriptor)associatedSplatDescriptor;
- (SUCoreDescriptor)initWithCoder:(id)a3;
- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 defaultValues:(id)a5;
- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 prepareSize:(id)a5 applySize:(id)a6 defaultValues:(id)a7;
- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5;
- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5 descriptorType:(int64_t)a6;
- (SUCoreDocumentation)documentation;
- (SUCoreMAIdentifier)documentationAssetIdentifier;
- (SUCoreMAIdentifier)softwareUpdateAssetIdentifier;
- (id)criticalOverrideCellularPolicy;
- (id)description;
- (id)initSemiSplatDescriptor;
- (id)overview;
- (id)overviewWithMaxValueLength:(unint64_t)a3 providingSubstitutionMap:(id)a4;
- (id)summary;
- (id)updateTypeName;
- (int64_t)descriptorAudienceType;
- (int64_t)descriptorType;
- (int64_t)hideInstallAlert;
- (int64_t)preferredUpdateType;
- (int64_t)updateType;
- (unint64_t)autoDownloadOnBatteryDelay;
- (unint64_t)autoDownloadOnBatteryMinBattery;
- (unint64_t)autoInstallDelay;
- (unint64_t)downloadSize;
- (unint64_t)installAlertInterval;
- (unint64_t)installationSize;
- (unint64_t)mdmDelayInterval;
- (unint64_t)minimumSystemPartitionSize;
- (unint64_t)msuPrepareSize;
- (unint64_t)preSUStagingOptionalSize;
- (unint64_t)preSUStagingRequiredSize;
- (unint64_t)preparationSize;
- (unint64_t)refreshInstallationSize;
- (unint64_t)refreshPrepareSize;
- (unint64_t)refreshTotalRequiredFreeSpace;
- (unint64_t)suDownloadSize;
- (unint64_t)totalRequiredFreeSpace;
- (unint64_t)unarchivedSize;
- (void)assignDescriptorAudienceType:(int64_t)a3 descriptorPreferredUpdateType:(int64_t)a4 assetAudienceUUID:(id)a5;
- (void)assignDocumentationFromAsset:(id)a3;
- (void)assignDocumentationFromAsset:(id)a3 extendingBundleProperties:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowAutoDownloadOnBattery:(BOOL)a3;
- (void)setAlternateAssetAudienceUUID:(id)a3;
- (void)setAssetAudienceUUID:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setAssociatedSplatDescriptor:(id)a3;
- (void)setAutoDownloadAllowableOverCellular:(BOOL)a3;
- (void)setAutoDownloadOnBatteryDelay:(unint64_t)a3;
- (void)setAutoDownloadOnBatteryMinBattery:(unint64_t)a3;
- (void)setAutoInstallDelay:(unint64_t)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)setBundleAttributes:(id)a3;
- (void)setContainsSFRContent:(BOOL)a3;
- (void)setCriticalCellularOverride:(BOOL)a3;
- (void)setCriticalOutOfBoxOnly:(BOOL)a3;
- (void)setCriticalUpdate:(BOOL)a3;
- (void)setDescriptorAudienceType:(int64_t)a3;
- (void)setDescriptorType:(int64_t)a3;
- (void)setDisableAppDemotion:(BOOL)a3;
- (void)setDisableCDLevel4:(BOOL)a3;
- (void)setDisableInstallTonight:(BOOL)a3;
- (void)setDisableRosettaUpdates:(BOOL)a3;
- (void)setDisableSiriVoiceDeletion:(BOOL)a3;
- (void)setDisableSplatCombo:(BOOL)a3;
- (void)setDocumentation:(id)a3;
- (void)setDocumentationAsset:(id)a3;
- (void)setDocumentationAssetAbsoluteID:(id)a3;
- (void)setDocumentationAssetIdentifier:(id)a3;
- (void)setDocumentationAssetPurpose:(id)a3;
- (void)setDocumentationAssetType:(id)a3;
- (void)setDocumentationID:(id)a3;
- (void)setDownloadAllowableOverCellular:(BOOL)a3;
- (void)setDownloadable:(BOOL)a3;
- (void)setEnableAlternateAssetAudience:(BOOL)a3;
- (void)setEnablePreSUStaging:(BOOL)a3;
- (void)setEnablePreSUStagingForOptionalAssets:(BOOL)a3;
- (void)setForcePasscodeRequired:(BOOL)a3;
- (void)setGranularlyRamped:(BOOL)a3;
- (void)setHideInstallAlert:(int64_t)a3;
- (void)setInstallAlertInterval:(unint64_t)a3;
- (void)setInstallationSize:(unint64_t)a3;
- (void)setLastEmergencyBuild:(id)a3;
- (void)setLastEmergencyOSVersion:(id)a3;
- (void)setMandatoryUpdateEligible:(BOOL)a3;
- (void)setMandatoryUpdateOptional:(BOOL)a3;
- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3;
- (void)setMandatoryUpdateVersionMax:(id)a3;
- (void)setMandatoryUpdateVersionMin:(id)a3;
- (void)setMdmDelayInterval:(unint64_t)a3;
- (void)setMeasurement:(id)a3;
- (void)setMeasurementAlgorithm:(id)a3;
- (void)setMinimumBridgeVersion:(id)a3;
- (void)setMinimumSystemPartitionSize:(unint64_t)a3;
- (void)setMsuPrepareSize:(unint64_t)a3;
- (void)setNotifyAfter:(BOOL)a3;
- (void)setPreSUStagingOptionalSize:(unint64_t)a3;
- (void)setPreSUStagingRequiredSize:(unint64_t)a3;
- (void)setPreferredUpdateType:(int64_t)a3;
- (void)setPrerequisiteBuild:(id)a3;
- (void)setPrerequisiteOSVersion:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductSystemName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setProductVersionExtra:(id)a3;
- (void)setPromoteAlternateUpdate:(BOOL)a3;
- (void)setPublisher:(id)a3;
- (void)setRampEnabled:(BOOL)a3;
- (void)setRawProductVersion:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestoreVersion:(id)a3;
- (void)setRsepDigest:(id)a3;
- (void)setRsepTBMDigests:(id)a3;
- (void)setSepDigest:(id)a3;
- (void)setSepTBMDigests:(id)a3;
- (void)setSetupCritical:(id)a3;
- (void)setSoftwareUpdateAsset:(id)a3;
- (void)setSoftwareUpdateAssetAbsoluteID:(id)a3;
- (void)setSoftwareUpdateAssetIdentifier:(id)a3;
- (void)setSoftwareUpdateAssetPurpose:(id)a3;
- (void)setSoftwareUpdateAssetType:(id)a3;
- (void)setSoftwareUpdateURL:(id)a3;
- (void)setStreamingZipCapable:(BOOL)a3;
- (void)setSuDownloadSize:(unint64_t)a3;
- (void)setSupportedDevices:(id)a3;
- (void)setSystemPartitionPadding:(id)a3;
- (void)setTargetUpdateBridgeVersion:(id)a3;
- (void)setTargetUpdateSFRVersion:(id)a3;
- (void)setTrainName:(id)a3;
- (void)setUnarchivedSize:(unint64_t)a3;
- (void)setUniqueBuildID:(id)a3;
- (void)setUpdateBrainPath:(id)a3;
- (void)setUpdateBundlePath:(id)a3;
- (void)setUpdateType:(int64_t)a3;
- (void)transferNonAssetPropertiesFromDescriptor:(id)a3;
@end

@implementation SUCoreDescriptor

- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 defaultValues:(id)a5
{
  return -[SUCoreDescriptor initWithSUAsset:releaseDate:prepareSize:applySize:defaultValues:]( self,  "initWithSUAsset:releaseDate:prepareSize:applySize:defaultValues:",  a3,  a4,  0LL,  0LL,  a5);
}

- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 prepareSize:(id)a5 applySize:(id)a6 defaultValues:(id)a7
{
  uint64_t v151 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    objc_msgSend(v13, "SUCoreBorder_attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ([v18 count])
      {
        v148.receiver = self;
        v148.super_class = (Class)&OBJC_CLASS___SUCoreDescriptor;
        v20 = -[SUCoreDescriptor init](&v148, sel_init);
        v21 = v20;
        if (!v20)
        {
LABEL_45:
          self = v21;
          v64 = self;
          goto LABEL_46;
        }

        v146 = v16;
        v147 = v15;
        v20->_descriptorType = 1LL;
        [v13 assetType];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = [v22 isEqualToString:@"com.apple.MobileAsset.SFRSoftwareUpdate"];

        if (v23) {
          v21->_descriptorType = 3LL;
        }
        v21->_descriptorAudienceType = 0LL;
        v21->_preferredUpdateType = 0LL;
        uint64_t v24 = [v13 assetId];
        assetID = v21->_assetID;
        v21->_assetID = (NSString *)v24;

        objc_storeStrong((id *)&v21->_bundleAttributes, v19);
        uint64_t v26 = [v13 assetType];
        softwareUpdateAssetType = v21->_softwareUpdateAssetType;
        v21->_softwareUpdateAssetType = (NSString *)v26;

        documentationAssetType = v21->_documentationAssetType;
        v21->_documentationAssetType = 0LL;

        uint64_t v29 = [v13 absoluteAssetId];
        softwareUpdateAssetAbsoluteID = v21->_softwareUpdateAssetAbsoluteID;
        v21->_softwareUpdateAssetAbsoluteID = (MAAbsoluteAssetId *)v29;

        uint64_t v31 = [v13 purpose];
        softwareUpdateAssetPurpose = v21->_softwareUpdateAssetPurpose;
        v21->_softwareUpdateAssetPurpose = (NSString *)v31;

        documentationAssetAbsoluteID = v21->_documentationAssetAbsoluteID;
        v21->_documentationAssetAbsoluteID = 0LL;

        documentationAssetPurpose = v21->_documentationAssetPurpose;
        v21->_documentationAssetPurpose = 0LL;

        uint64_t v35 = [v19 safeStringForKey:@"UniqueBuildID"];
        uniqueBuildID = v21->_uniqueBuildID;
        v21->_uniqueBuildID = (NSString *)v35;

        uint64_t v37 = [v19 safeStringForKey:@"OSVersion"];
        rawProductVersion = v21->_rawProductVersion;
        v21->_rawProductVersion = (NSString *)v37;

        uint64_t v39 = +[SUCoreDescriptor cleanProductVersion:]( &OBJC_CLASS___SUCoreDescriptor,  "cleanProductVersion:",  v21->_rawProductVersion);
        productVersion = v21->_productVersion;
        v21->_productVersion = (NSString *)v39;

        uint64_t v41 = [v19 safeStringForKey:@"Build"];
        productBuildVersion = v21->_productBuildVersion;
        v21->_productBuildVersion = (NSString *)v41;

        uint64_t v43 = [v19 safeStringForKey:@"ProductVersionExtra"];
        productVersionExtra = v21->_productVersionExtra;
        v21->_productVersionExtra = (NSString *)v43;

        uint64_t v45 = [v19 safeStringForKey:@"SUProductSystemName"];
        productSystemName = v21->_productSystemName;
        v21->_productSystemName = (NSString *)v45;

        uint64_t v47 = [v19 safeStringForKey:@"ReleaseType"];
        releaseType = v21->_releaseType;
        v21->_releaseType = (NSString *)v47;

        uint64_t v49 = [v19 safeStringForKey:@"SUPublisher"];
        publisher = v21->_publisher;
        v21->_publisher = (NSString *)v49;

        uint64_t v51 = [v19 safeStringForKey:@"RestoreVersion"];
        restoreVersion = v21->_restoreVersion;
        v21->_restoreVersion = (NSString *)v51;

        uint64_t v53 = [v19 safeStringForKey:@"TargetBridgeUpdateVersion"];
        targetUpdateBridgeVersion = v21->_targetUpdateBridgeVersion;
        v21->_targetUpdateBridgeVersion = (NSString *)v53;

        uint64_t v55 = [v19 safeStringForKey:@"TargetSFRUpdateVersion"];
        targetUpdateSFRVersion = v21->_targetUpdateSFRVersion;
        v21->_targetUpdateSFRVersion = (NSString *)v55;

        uint64_t v57 = [v19 safeStringForKey:@"TrainName"];
        trainName = v21->_trainName;
        v21->_trainName = (NSString *)v57;

        p_releaseDate = (id *)&v21->_releaseDate;
        releaseDate = v21->_releaseDate;
        v21->_releaseDate = 0LL;

        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            id v61 = v14;
            id v62 = *p_releaseDate;
            id *p_releaseDate = v61;
LABEL_19:

            goto LABEL_20;
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            id v62 = objc_alloc_init(MEMORY[0x189607848]);
            [v62 setDateFormat:@"yyyy-MM-dd"];
            v144 = (void *)[objc_alloc(MEMORY[0x189603F90]) initWithLocaleIdentifier:@"en_US_POSIX"];
            objc_msgSend(v62, "setLocale:");
            [v62 dateFromString:v14];
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (v68)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0) {
                objc_storeStrong((id *)&v21->_releaseDate, v68);
              }
            }

            goto LABEL_19;
          }
        }

- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5
{
  return -[SUCoreDescriptor initWithUpdateBrainPath:updateBundlePath:bundleAttributes:descriptorType:]( self,  "initWithUpdateBrainPath:updateBundlePath:bundleAttributes:descriptorType:",  a3,  a4,  a5,  2LL);
}

- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5 descriptorType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v13;
  if (!v11)
  {
    [MEMORY[0x189612778] sharedDiag];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    char v89 = v88;
    v90 = @"no update brain path was provided on descriptor initialization";
LABEL_14:
    [v88 trackError:@"[DESCRIPTOR]" forReason:v90 withResult:8100 withError:0];

    uint64_t v87 = 0LL;
    goto LABEL_15;
  }

  if (!v12)
  {
    [MEMORY[0x189612778] sharedDiag];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    char v89 = v88;
    v90 = @"no update bundle path was provided on descriptor initialization";
    goto LABEL_14;
  }

  if (!v13)
  {
    [MEMORY[0x189612778] sharedDiag];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    char v89 = v88;
    v90 = @"no update bundle attributes were provided on descriptor initialization";
    goto LABEL_14;
  }

  v92.receiver = self;
  v92.super_class = (Class)&OBJC_CLASS___SUCoreDescriptor;
  id v15 = -[SUCoreDescriptor init](&v92, sel_init);
  id v16 = v15;
  if (v15)
  {
    v15->_descriptorAudienceType = 0LL;
    v15->_preferredUpdateType = 0LL;
    v15->_descriptorType = a6;
    objc_storeStrong((id *)&v15->_updateBrainPath, a3);
    objc_storeStrong((id *)&v16->_updateBundlePath, a4);
    objc_storeStrong((id *)&v16->_bundleAttributes, a5);
    assetID = v16->_assetID;
    v16->_assetID = 0LL;

    uint64_t v18 = [v14 safeStringForKey:@"UniqueBuildID"];
    uniqueBuildID = v16->_uniqueBuildID;
    v16->_uniqueBuildID = (NSString *)v18;

    releaseDate = v16->_releaseDate;
    v16->_releaseDate = 0LL;

    uint64_t v21 = [v14 safeStringForKey:@"OSVersion"];
    rawProductVersion = v16->_rawProductVersion;
    v16->_rawProductVersion = (NSString *)v21;

    int v23 = v16->_rawProductVersion;
    if (!v23)
    {
      uint64_t v24 = [v14 safeStringForKey:@"ProductVersion"];
      v25 = v16->_rawProductVersion;
      v16->_rawProductVersion = (NSString *)v24;

      int v23 = v16->_rawProductVersion;
    }

    uint64_t v26 = +[SUCoreDescriptor cleanProductVersion:](&OBJC_CLASS___SUCoreDescriptor, "cleanProductVersion:", v23);
    productVersion = v16->_productVersion;
    v16->_productVersion = (NSString *)v26;

    uint64_t v28 = [v14 safeStringForKey:@"Build"];
    productBuildVersion = v16->_productBuildVersion;
    v16->_productBuildVersion = (NSString *)v28;

    if (!v16->_productBuildVersion)
    {
      uint64_t v30 = [v14 safeStringForKey:@"TargetUpdate"];
      uint64_t v31 = v16->_productBuildVersion;
      v16->_productBuildVersion = (NSString *)v30;
    }

    uint64_t v32 = [v14 safeStringForKey:@"ProductVersionExtra"];
    productVersionExtra = v16->_productVersionExtra;
    v16->_productVersionExtra = (NSString *)v32;

    uint64_t v34 = [v14 safeStringForKey:@"SUProductSystemName"];
    productSystemName = v16->_productSystemName;
    v16->_productSystemName = (NSString *)v34;

    uint64_t v36 = [v14 safeStringForKey:@"ReleaseType"];
    releaseType = v16->_releaseType;
    v16->_releaseType = (NSString *)v36;

    uint64_t v38 = [v14 safeStringForKey:@"SUPublisher"];
    publisher = v16->_publisher;
    v16->_publisher = (NSString *)v38;

    uint64_t v40 = [v14 safeStringForKey:@"RestoreVersion"];
    restoreVersion = v16->_restoreVersion;
    v16->_restoreVersion = (NSString *)v40;

    uint64_t v42 = [v14 safeStringForKey:@"TargetBridgeUpdateVersion"];
    targetUpdateBridgeVersion = v16->_targetUpdateBridgeVersion;
    v16->_targetUpdateBridgeVersion = (NSString *)v42;

    uint64_t v44 = [v14 safeStringForKey:@"TargetSFRUpdateVersion"];
    targetUpdateSFRVersion = v16->_targetUpdateSFRVersion;
    v16->_targetUpdateSFRVersion = (NSString *)v44;

    uint64_t v46 = [v14 safeStringForKey:@"TrainName"];
    trainName = v16->_trainName;
    v16->_trainName = (NSString *)v46;

    uint64_t v48 = [v14 safeStringForKey:@"PrerequisiteBuild"];
    prerequisiteBuild = v16->_prerequisiteBuild;
    v16->_prerequisiteBuild = (NSString *)v48;

    uint64_t v50 = [v14 safeStringForKey:@"PrerequisiteOSVersion"];
    prerequisiteOSVersion = v16->_prerequisiteOSVersion;
    v16->_prerequisiteOSVersion = (NSString *)v50;

    uint64_t v52 = [v14 safeObjectForKey:@"SupportedDevices" ofClass:objc_opt_class()];
    supportedDevices = v16->_supportedDevices;
    v16->_supportedDevices = (NSArray *)v52;

    v16->_suDownloadSize = 0LL;
    v16->_unarchivedSize = 0LL;
    systemPartitionPadding = v16->_systemPartitionPadding;
    v16->_minimumSystemPartitionSize = 0LL;
    v16->_systemPartitionPadding = 0LL;
    v16->_streamingZipCapable = 0;

    *(_WORD *)&v16->_disableCDLevel4 = 0;
    *(_DWORD *)&v16->_autoDownloadAllowableOverCellular = 0;
    v16->_preSUStagingRequiredSize = 0LL;
    v16->_preSUStagingOptionalSize = 0LL;
    v16->_disableInstallTonight = 1;
    *(_DWORD *)&v16->_forcePasscodeRequired = 0;
    *(_OWORD *)&v16->_mdmDelayInterval = xmmword_187AF10C0;
    v16->_containsSFRContent = [v14 safeBooleanForKey:@"ContainsSFRContent"];
    v16->_allowAutoDownloadOnBattery = 0;
    *(_OWORD *)&v16->_installAlertInterval = xmmword_187AF10D0;
    setupCritical = v16->_setupCritical;
    v16->_autoDownloadOnBatteryMinBattery = 80LL;
    v16->_setupCritical = 0LL;

    *(_WORD *)&v16->_criticalCellularOverride = 0;
    lastEmergencyBuild = v16->_lastEmergencyBuild;
    v16->_lastEmergencyBuild = 0LL;

    lastEmergencyOSVersion = v16->_lastEmergencyOSVersion;
    v16->_lastEmergencyOSVersion = 0LL;

    v16->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v16->_mandatoryUpdateVersionMin;
    v16->_mandatoryUpdateVersionMin = 0LL;

    mandatoryUpdateVersionMax = v16->_mandatoryUpdateVersionMax;
    v16->_mandatoryUpdateVersionMax = 0LL;

    *(_WORD *)&v16->_mandatoryUpdateOptional = 0;
    v16->_oneShotBuddyDisabled = 0;
    oneShotBuddyDisabledBuilds = v16->_oneShotBuddyDisabledBuilds;
    v16->_oneShotBuddyDisabledBuilds = 0LL;

    v16->_criticalUpdate = 0;
    productType = v16->_productType;
    v16->_productType = 0LL;

    minimumBridgeVersion = v16->_minimumBridgeVersion;
    v16->_autoInstallDelay = 0LL;
    v16->_minimumBridgeVersion = 0LL;
    v16->_notifyAfter = 0;

    *(_WORD *)&v16->_disableRosettaUpdates = 0;
    v16->_requireInstallAssistantUpdate = 0;
    sepDigest = v16->_sepDigest;
    v16->_sepDigest = 0LL;

    sepTBMDigests = v16->_sepTBMDigests;
    v16->_sepTBMDigests = 0LL;

    rsepDigest = v16->_rsepDigest;
    v16->_rsepDigest = 0LL;

    rsepTBMDigests = v16->_rsepTBMDigests;
    v16->_rsepTBMDigests = 0LL;

    documentationID = v16->_documentationID;
    v16->_documentationID = 0LL;

    softwareUpdateURL = v16->_softwareUpdateURL;
    v16->_softwareUpdateURL = 0LL;

    measurement = v16->_measurement;
    v16->_measurement = 0LL;

    measurementAlgorithm = v16->_measurementAlgorithm;
    v16->_measurementAlgorithm = 0LL;

    v16->_updateType = 0LL;
    v16->_msuPrepareSize = 0LL;
    v16->_installationSize = 0LL;
    softwareUpdateAsset = v16->_softwareUpdateAsset;
    v16->_softwareUpdateAsset = 0LL;

    softwareUpdateAssetType = v16->_softwareUpdateAssetType;
    v16->_softwareUpdateAssetType = 0LL;

    softwareUpdateAssetAbsoluteID = v16->_softwareUpdateAssetAbsoluteID;
    v16->_softwareUpdateAssetAbsoluteID = 0LL;

    softwareUpdateAssetPurpose = v16->_softwareUpdateAssetPurpose;
    v16->_softwareUpdateAssetPurpose = 0LL;

    documentationAsset = v16->_documentationAsset;
    v16->_documentationAsset = 0LL;

    documentationAssetType = v16->_documentationAssetType;
    v16->_documentationAssetType = 0LL;

    documentationAssetAbsoluteID = v16->_documentationAssetAbsoluteID;
    v16->_documentationAssetAbsoluteID = 0LL;

    documentationAssetPurpose = v16->_documentationAssetPurpose;
    v16->_documentationAssetPurpose = 0LL;

    documentation = v16->_documentation;
    v16->_documentation = 0LL;

    softwareUpdateAssetIdentifier = v16->_softwareUpdateAssetIdentifier;
    v16->_softwareUpdateAssetIdentifier = 0LL;

    documentationAssetIdentifier = v16->_documentationAssetIdentifier;
    v16->_documentationAssetIdentifier = 0LL;

    *(_WORD *)&v16->_promoteAlternateUpdate = 0;
    alternateAssetAudienceUUID = v16->_alternateAssetAudienceUUID;
    v16->_alternateAssetAudienceUUID = 0LL;

    assetAudienceUUID = v16->_assetAudienceUUID;
    v16->_assetAudienceUUID = 0LL;

    v16->_splatOnly = [v14 safeBooleanForKey:@"SplatOnly"];
    v16->_semiSplatEnabled = [v14 safeBooleanForKey:@"SemiSplatEnabled"];
    uint64_t v84 = [v14 safeObjectForKey:@"SemiSplatMustQuitApps" ofClass:objc_opt_class()];
    semiSplatMustQuitApps = v16->_semiSplatMustQuitApps;
    v16->_semiSplatMustQuitApps = (NSArray *)v84;

    v16->_revoked = [v14 safeBooleanForKey:@"Revoked"];
    v16->_semiSplatRestartNow = 0;
    associatedSplatDescriptor = v16->_associatedSplatDescriptor;
    v16->_associatedSplatDescriptor = 0LL;

    *(_WORD *)&v16->_disableSplatCombo = 0;
    v16->_enablePreSUStagingForOptionalAssets = 0;
  }

  self = v16;
  uint64_t v87 = self;
LABEL_15:

  return v87;
}

- (id)initSemiSplatDescriptor
{
  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___SUCoreDescriptor;
  v2 = -[SUCoreDescriptor init](&v76, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_descriptorAudienceType = 0LL;
    v2->_preferredUpdateType = 0LL;
    v2->_descriptorType = 6LL;
    updateBrainPath = v2->_updateBrainPath;
    v2->_updateBrainPath = 0LL;

    updateBundlePath = v3->_updateBundlePath;
    v3->_updateBundlePath = 0LL;

    bundleAttributes = v3->_bundleAttributes;
    v3->_bundleAttributes = 0LL;

    assetID = v3->_assetID;
    v3->_assetID = 0LL;

    uniqueBuildID = v3->_uniqueBuildID;
    v3->_uniqueBuildID = 0LL;

    releaseDate = v3->_releaseDate;
    v3->_releaseDate = 0LL;

    publisher = v3->_publisher;
    v3->_publisher = 0LL;

    [MEMORY[0x189612770] sharedDevice];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 splatCryptex1ProductVersion];
    rawProductVersion = v3->_rawProductVersion;
    v3->_rawProductVersion = (NSString *)v12;

    [MEMORY[0x189612770] sharedDevice];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 splatCryptex1ProductVersion];
    productVersion = v3->_productVersion;
    v3->_productVersion = (NSString *)v15;

    [MEMORY[0x189612770] sharedDevice];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 splatCryptex1BuildVersionOverride];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
      productBuildVersion = v3->_productBuildVersion;
      v3->_productBuildVersion = v20;
    }

    else
    {
      [MEMORY[0x189612770] sharedDevice];
      productBuildVersion = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [productBuildVersion splatCryptex1BuildVersion];
      int v23 = v3->_productBuildVersion;
      v3->_productBuildVersion = (NSString *)v22;
    }

    [MEMORY[0x189612770] sharedDevice];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 splatCryptex1ProductVersionExtra];
    productVersionExtra = v3->_productVersionExtra;
    v3->_productVersionExtra = (NSString *)v25;

    productSystemName = v3->_productSystemName;
    v3->_productSystemName = (NSString *)@"Security Response";

    [MEMORY[0x189612770] sharedDevice];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 splatCryptex1ReleaseType];
    releaseType = v3->_releaseType;
    v3->_releaseType = (NSString *)v29;

    [MEMORY[0x189612770] sharedDevice];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v31 splatCryptex1RestoreVersion];
    restoreVersion = v3->_restoreVersion;
    v3->_restoreVersion = (NSString *)v32;

    targetUpdateBridgeVersion = v3->_targetUpdateBridgeVersion;
    v3->_targetUpdateBridgeVersion = 0LL;

    targetUpdateSFRVersion = v3->_targetUpdateSFRVersion;
    v3->_targetUpdateSFRVersion = 0LL;

    trainName = v3->_trainName;
    v3->_trainName = 0LL;

    prerequisiteBuild = v3->_prerequisiteBuild;
    v3->_prerequisiteBuild = 0LL;

    prerequisiteOSVersion = v3->_prerequisiteOSVersion;
    v3->_prerequisiteOSVersion = 0LL;

    supportedDevices = v3->_supportedDevices;
    v3->_supportedDevices = 0LL;

    v3->_suDownloadSize = 0LL;
    v3->_unarchivedSize = 0LL;
    systemPartitionPadding = v3->_systemPartitionPadding;
    v3->_minimumSystemPartitionSize = 0LL;
    v3->_systemPartitionPadding = 0LL;
    v3->_streamingZipCapable = 0;

    *(_DWORD *)&v3->_forcePasscodeRequired = 0;
    *(void *)&v3->_autoDownloadAllowableOverCellular = 0LL;
    v3->_preSUStagingRequiredSize = 0LL;
    v3->_preSUStagingOptionalSize = 0LL;
    *(_WORD *)&v3->_containsSFRContent = 0;
    *(_OWORD *)&v3->_mdmDelayInterval = xmmword_187AF10C0;
    *(_OWORD *)&v3->_installAlertInterval = xmmword_187AF10D0;
    setupCritical = v3->_setupCritical;
    v3->_autoDownloadOnBatteryMinBattery = 80LL;
    v3->_setupCritical = 0LL;

    *(_WORD *)&v3->_criticalCellularOverride = 0;
    lastEmergencyBuild = v3->_lastEmergencyBuild;
    v3->_lastEmergencyBuild = 0LL;

    lastEmergencyOSVersion = v3->_lastEmergencyOSVersion;
    v3->_lastEmergencyOSVersion = 0LL;

    v3->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v3->_mandatoryUpdateVersionMin;
    v3->_mandatoryUpdateVersionMin = 0LL;

    mandatoryUpdateVersionMax = v3->_mandatoryUpdateVersionMax;
    v3->_mandatoryUpdateVersionMax = 0LL;

    *(_WORD *)&v3->_mandatoryUpdateOptional = 0;
    v3->_oneShotBuddyDisabled = 0;
    oneShotBuddyDisabledBuilds = v3->_oneShotBuddyDisabledBuilds;
    v3->_oneShotBuddyDisabledBuilds = 0LL;

    v3->_criticalUpdate = 0;
    productType = v3->_productType;
    v3->_productType = 0LL;

    minimumBridgeVersion = v3->_minimumBridgeVersion;
    v3->_autoInstallDelay = 0LL;
    v3->_minimumBridgeVersion = 0LL;
    v3->_notifyAfter = 0;

    *(_WORD *)&v3->_disableRosettaUpdates = 0;
    v3->_requireInstallAssistantUpdate = 0;
    sepDigest = v3->_sepDigest;
    v3->_sepDigest = 0LL;

    sepTBMDigests = v3->_sepTBMDigests;
    v3->_sepTBMDigests = 0LL;

    rsepDigest = v3->_rsepDigest;
    v3->_rsepDigest = 0LL;

    rsepTBMDigests = v3->_rsepTBMDigests;
    v3->_rsepTBMDigests = 0LL;

    documentationID = v3->_documentationID;
    v3->_documentationID = 0LL;

    softwareUpdateURL = v3->_softwareUpdateURL;
    v3->_softwareUpdateURL = 0LL;

    measurement = v3->_measurement;
    v3->_measurement = 0LL;

    measurementAlgorithm = v3->_measurementAlgorithm;
    v3->_measurementAlgorithm = 0LL;

    v3->_updateType = 0LL;
    v3->_msuPrepareSize = 0LL;
    v3->_installationSize = 0LL;
    softwareUpdateAsset = v3->_softwareUpdateAsset;
    v3->_softwareUpdateAsset = 0LL;

    softwareUpdateAssetType = v3->_softwareUpdateAssetType;
    v3->_softwareUpdateAssetType = 0LL;

    softwareUpdateAssetAbsoluteID = v3->_softwareUpdateAssetAbsoluteID;
    v3->_softwareUpdateAssetAbsoluteID = 0LL;

    softwareUpdateAssetPurpose = v3->_softwareUpdateAssetPurpose;
    v3->_softwareUpdateAssetPurpose = 0LL;

    documentationAsset = v3->_documentationAsset;
    v3->_documentationAsset = 0LL;

    documentationAssetType = v3->_documentationAssetType;
    v3->_documentationAssetType = 0LL;

    documentationAssetAbsoluteID = v3->_documentationAssetAbsoluteID;
    v3->_documentationAssetAbsoluteID = 0LL;

    documentationAssetPurpose = v3->_documentationAssetPurpose;
    v3->_documentationAssetPurpose = 0LL;

    documentation = v3->_documentation;
    v3->_documentation = 0LL;

    softwareUpdateAssetIdentifier = v3->_softwareUpdateAssetIdentifier;
    v3->_softwareUpdateAssetIdentifier = 0LL;

    documentationAssetIdentifier = v3->_documentationAssetIdentifier;
    v3->_documentationAssetIdentifier = 0LL;

    *(_WORD *)&v3->_promoteAlternateUpdate = 0;
    alternateAssetAudienceUUID = v3->_alternateAssetAudienceUUID;
    v3->_alternateAssetAudienceUUID = 0LL;

    assetAudienceUUID = v3->_assetAudienceUUID;
    v3->_assetAudienceUUID = 0LL;

    *(_WORD *)&v3->_splatOnly = 257;
    semiSplatMustQuitApps = v3->_semiSplatMustQuitApps;
    v3->_semiSplatMustQuitApps = (NSArray *)&unk_18A1126A0;

    *(_WORD *)&v3->_revoked = 256;
    associatedSplatDescriptor = v3->_associatedSplatDescriptor;
    v3->_associatedSplatDescriptor = 0LL;

    *(_WORD *)&v3->_disableSplatCombo = 0;
    v3->_enablePreSUStagingForOptionalAssets = 0;
    v72 = +[SUCoreDocumentationDataManager sharedManager](&OBJC_CLASS___SUCoreDocumentationDataManager, "sharedManager");
    uint64_t v73 = [v72 getDocumentationForInstalledUpdateType:1 withError:0];
    v74 = v3->_documentation;
    v3->_documentation = (SUCoreDocumentation *)v73;
  }

  return v3;
}

- (void)assignDocumentationFromAsset:(id)a3
{
}

- (void)assignDocumentationFromAsset:(id)a3 extendingBundleProperties:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[SUCoreDescriptor setDocumentationAsset:](self, "setDocumentationAsset:", v6);
  [v6 assetType];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetType:](self, "setDocumentationAssetType:", v7);

  [v6 absoluteAssetId];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetAbsoluteID:](self, "setDocumentationAssetAbsoluteID:", v8);

  [v6 purpose];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetPurpose:](self, "setDocumentationAssetPurpose:", v9);

  v10 = -[SUCoreDocumentation initWithDocumentationAsset:]( objc_alloc(&OBJC_CLASS___SUCoreDocumentation),  "initWithDocumentationAsset:",  v6);
  -[SUCoreDescriptor setDocumentation:](self, "setDocumentation:", v10);

  id v11 = objc_alloc(MEMORY[0x1896127A8]);
  -[SUCoreDescriptor documentation](self, "documentation");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 serverAssetMeasurement];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor documentation](self, "documentation");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 serverAssetAlgorithm];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = (void *)[v11 initWithProductVersion:0 productBuildVersion:0 releaseType:0 measurement:v13 measurementAlgorithm:v15];
  -[SUCoreDescriptor setDocumentationAssetIdentifier:](self, "setDocumentationAssetIdentifier:", v16);

  if (v4)
  {
    -[SUCoreDescriptor documentation](self, "documentation");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = (id)[v18 extendDocumentationProperties];
  }

- (void)assignDescriptorAudienceType:(int64_t)a3 descriptorPreferredUpdateType:(int64_t)a4 assetAudienceUUID:(id)a5
{
  id v9 = a5;
  -[SUCoreDescriptor setDescriptorAudienceType:](self, "setDescriptorAudienceType:", a3);
  -[SUCoreDescriptor setPreferredUpdateType:](self, "setPreferredUpdateType:", a4);
  v8 = v9;
  if (v9)
  {
    -[SUCoreDescriptor setAssetAudienceUUID:](self, "setAssetAudienceUUID:", v9);
    v8 = v9;
  }
}

- (NSString)humanReadableUpdateName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 humanReadableUpdateName];
  BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    uint64_t v10 = -[SUCoreDescriptor productSystemName](self, "productSystemName");
    if (!v10
      || (id v11 = (void *)v10,
          -[SUCoreDescriptor productVersion](self, "productVersion"),
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      BOOL v4 = @"Software Update";
      goto LABEL_12;
    }

    BOOL v13 = -[SUCoreDescriptor splatOnly](self, "splatOnly");
    id v14 = objc_alloc(NSString);
    v7 = -[SUCoreDescriptor productSystemName](self, "productSystemName");
    uint64_t v15 = -[SUCoreDescriptor productVersion](self, "productVersion");
    v8 = (void *)v15;
    if (v13)
    {
      -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = (__CFString *)[v14 initWithFormat:@"%@ Security Response %@ %@", v7, v8, v16];
    }

    else
    {
      BOOL v4 = (__CFString *)[v14 initWithFormat:@"%@ %@", v7, v15];
    }

    goto LABEL_11;
  }

  if (-[SUCoreDescriptor splatOnly](self, "splatOnly"))
  {
    v5 = -[SUCoreDescriptor productVersion](self, "productVersion");
    if (v5)
    {
      id v6 = objc_alloc(NSString);
      v7 = -[SUCoreDescriptor productVersion](self, "productVersion");
      v8 = -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
      uint64_t v9 = [v6 initWithFormat:@"%@ %@ %@", v4, v7, v8];

      BOOL v4 = (__CFString *)v9;
LABEL_11:
    }
  }

- (NSString)humanReadableUpdateTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 humanReadableUpdateTitle];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)humanReadableUpdateVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 humanReadableUpdateVersion];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCoreDescriptor splatOnly](self, "splatOnly"))
  {
    uint64_t v5 = -[SUCoreDescriptor productVersion](self, "productVersion");
    if (v5)
    {
      id v6 = (void *)v5;
      v7 = -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
      if (v7)
      {
        id v8 = objc_alloc(NSString);
        -[SUCoreDescriptor productVersion](self, "productVersion");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v8 initWithFormat:@"%@ %@", v9, v10];

        BOOL v4 = (void *)v11;
      }
    }
  }

  [MEMORY[0x189612770] sharedDevice];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    goto LABEL_12;
  }
  uint64_t v14 = -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
  if (!v14) {
    goto LABEL_12;
  }
  uint64_t v15 = (void *)v14;
  id v16 = objc_alloc(MEMORY[0x189612768]);
  id v17 = (void *)[v16 initWithProjectName:*MEMORY[0x189612850]];
  char v18 = [v17 getBoolConfigForKey:*MEMORY[0x189612808]];

  if ((v18 & 1) == 0)
  {
    id v19 = objc_alloc(NSString);
    -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 initWithFormat:@"%@ (%@)", v4, v12];

    BOOL v4 = (void *)v20;
LABEL_12:
  }

  return (NSString *)v4;
}

- (NSString)humanReadableMoreInfoLink
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 humanReadableMoreInfoLink];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)notificationEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 notificationEnabled];

  return v3;
}

- (NSString)notificationTitleString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 notificationTitleString];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)notificationBodyString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 notificationBodyString];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)recommendedUpdateEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 recommendedUpdateEnabled];

  return v3;
}

- (BOOL)recommendedUpdateApplicable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 recommendedUpdateApplicable];

  return v3;
}

- (NSNumber)recommendedUpdateNotificationFrequencyDays
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 recommendedUpdateNotificationFrequencyDays];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)recommendedUpdateMinOSVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 recommendedUpdateMinOSVersion];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recommendedUpdateMaxOSVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 recommendedUpdateMaxOSVersion];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recommendedUpdateTitleString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 recommendedUpdateTitleString];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recommendedUpdateAlertBodyString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 recommendedUpdateAlertBodyString];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)mandatoryUpdateBodyString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 mandatoryUpdateBodyString];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)publisher
{
  if (self->_publisher) {
    return self->_publisher;
  }
  else {
    return (NSString *)@"Apple, Inc.";
  }
}

- (NSString)productSystemName
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  productSystemName = self->_productSystemName;
  if (productSystemName) {
    return productSystemName;
  }
  [MEMORY[0x189612770] sharedDevice];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 marketingProductName];
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      int v11 = 138543362;
      uint64_t v12 = v5;
      _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "Falling back to marketingProductName:%{public}@",  (uint8_t *)&v11,  0xCu);
    }

    [NSString stringWithString:v5];
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v8)
    {
      int v11 = 138543362;
      uint64_t v12 = @"OS";
      _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "Falling back to kSUProductSystemNameDefault:%{public}@",  (uint8_t *)&v11,  0xCu);
    }

    [MEMORY[0x189612778] sharedDiag];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 trackAnomaly:@"SUCoreDescriptor" forReason:@"Falling back to kSUProductSystemNameDefault due to no SUCoreDevice marketingProductName" withResult:8116 withError:0];

    uint64_t v9 = @"OS";
  }

  return (NSString *)v9;
}

- (BOOL)fullReplacement
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    BOOL v4 = 0;
  }

  else
  {
    -[SUCoreDescriptor prerequisiteOSVersion](self, "prerequisiteOSVersion");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v4 = v5 == 0LL;
  }

  return v4;
}

- (unint64_t)unarchivedSize
{
  unint64_t unarchivedSize = self->_unarchivedSize;
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    unarchivedSize += [v5 unarchivedSize];
  }

  return unarchivedSize;
}

- (unint64_t)installationSize
{
  unint64_t installationSize = self->_installationSize;
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    return installationSize + 32000000;
  }
  else {
    return installationSize;
  }
}

- (unint64_t)preparationSize
{
  unint64_t v3 = -[SUCoreDescriptor unarchivedSize](self, "unarchivedSize");
  return -[SUCoreDescriptor msuPrepareSize](self, "msuPrepareSize") + v3;
}

- (unint64_t)refreshPrepareSize
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  SUCoreBorder_MSUAssetCalculatePrepareSize(v3);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v5,  "trackAnomaly:forReason:withResult:withError:",  @"[DESCRIPTOR]",  @"unable to determine refreshed prepare size, using preexisting value",  8100,  v4);
  }

  else
  {
    self->_msuPrepareSize = 0LL;
  }

  unint64_t v6 = -[SUCoreDescriptor msuPrepareSize](self, "msuPrepareSize");

  return v6;
}

- (unint64_t)refreshInstallationSize
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  SUCoreBorder_MSUAssetCalculateApplySize(v3);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v5,  "trackAnomaly:forReason:withResult:withError:",  @"[DESCRIPTOR]",  @"unable to determine refreshed apply size for installation, using preexisting value",  8100,  v4);
  }

  else
  {
    self->_unint64_t installationSize = 0LL;
  }

  unint64_t v6 = -[SUCoreDescriptor installationSize](self, "installationSize");

  return v6;
}

- (unint64_t)refreshTotalRequiredFreeSpace
{
  return -[SUCoreDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace");
}

- (unint64_t)totalRequiredFreeSpace
{
  unint64_t v3 = -[SUCoreDescriptor preparationSize](self, "preparationSize");
  unint64_t v4 = -[SUCoreDescriptor installationSize](self, "installationSize") + v3;
  if (!-[SUCoreDescriptor streamingZipCapable](self, "streamingZipCapable")) {
    v4 += -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize");
  }
  uint64_t v5 = -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    v7 = -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
    char v8 = [v7 streamingZipCapable];

    if ((v8 & 1) == 0)
    {
      -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 += [v9 suDownloadSize];
    }
  }

  if (-[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging")) {
    v4 += -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
  }
  return v4;
}

- (unint64_t)downloadSize
{
  unint64_t v3 = -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize");
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 += [v5 suDownloadSize];
  }

  if (-[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging")) {
    v3 += -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
  }
  return v3;
}

- (id)criticalOverrideCellularPolicy
{
  if (-[SUCoreDescriptor criticalCellularOverride](self, "criticalCellularOverride")) {
    return @"WifiAndCellular";
  }
  else {
    return @"WifiOnly";
  }
}

- (id)updateTypeName
{
  unint64_t v2 = -[SUCoreDescriptor updateType](self, "updateType");
  if (v2 > 5) {
    return @"unknown";
  }
  else {
    return off_18A0F0CB8[v2];
  }
}

+ (BOOL)isEmergencyUpdate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    [MEMORY[0x189612770] sharedDevice];
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 buildVersion];
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 oslog];
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "isEmergencyUpdate returns NO because currentBuild is nil",  (uint8_t *)&v26,  2u);
      }

      BOOL v15 = 0;
      goto LABEL_34;
    }

    [MEMORY[0x189612770] sharedDevice];
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 productVersion];
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      char v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 oslog];
      char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "isEmergencyUpdate returns NO because currentOSVersion is nil",  (uint8_t *)&v26,  2u);
      }

      BOOL v15 = 0;
      goto LABEL_33;
    }

    [v3 safeObjectForKey:@"LastEmergencyBuild" ofClass:objc_opt_class()];
    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v3 safeObjectForKey:@"LastEmergencyOSVersion" ofClass:objc_opt_class()];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v9;
    if (v8 && v9)
    {
      if ([v9 compare:v7 options:64] == -1)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 oslog];
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138543618;
          char v27 = v10;
          __int16 v28 = 2114;
          uint64_t v29 = v7;
          uint64_t v21 = "isEmergencyUpdate returns NO because lastEmergencyOSVersion:%{public}@ is less than currentOSVersion:%{public}@";
LABEL_29:
          uint64_t v22 = v13;
          uint32_t v23 = 22;
LABEL_30:
          _os_log_impl(&dword_187A54000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, v23);
        }
      }

      else
      {
        uint64_t v11 = -[os_log_s compare:options:](v8, "compare:options:", v5, 64LL);
        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 oslog];
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v11 != -1)
        {
          if (v14)
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_187A54000, v13, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate: YES", (uint8_t *)&v26, 2u);
          }

          BOOL v15 = 1;
          goto LABEL_32;
        }

        if (v14)
        {
          int v26 = 138543618;
          char v27 = v8;
          __int16 v28 = 2114;
          uint64_t v29 = v5;
          uint64_t v21 = "isEmergencyUpdate returns NO because lastEmergencyBuild:%{public}@ is less than currentBuild:%{public}@";
          goto LABEL_29;
        }
      }
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (v8) {
          uint64_t v20 = @"LastEmergencyOSVersion";
        }
        else {
          uint64_t v20 = @"LastEmergencyBuild";
        }
        int v26 = 138543362;
        char v27 = (void *)v20;
        uint64_t v21 = "isEmergencyUpdate returns NO because asset attributes does no contain %{public}@";
        uint64_t v22 = v13;
        uint32_t v23 = 12;
        goto LABEL_30;
      }
    }

    BOOL v15 = 0;
LABEL_32:

LABEL_33:
LABEL_34:

    goto LABEL_35;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 oslog];
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "isEmergencyUpdate returns NO because assetAttributes is nil",  (uint8_t *)&v26,  2u);
  }

  BOOL v15 = 0;
LABEL_35:

  return v15;
}

+ (id)nameForDescriptorType:(int64_t)a3
{
  else {
    return off_18A0F0CE8[a3];
  }
}

+ (id)nameForDescriptorAudienceType:(int64_t)a3
{
  else {
    return off_18A0F0D20[a3];
  }
}

+ (id)nameForDescriptorPreferredUpdateType:(int64_t)a3
{
  else {
    return off_18A0F0D38[a3];
  }
}

+ (id)cleanProductVersion:(id)a3
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

- (BOOL)requiresSoftwareUpdateAssetReload
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUCoreDescriptor softwareUpdateAsset](self, "softwareUpdateAsset");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = v4 == 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)requiresDocumentationReload
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUCoreDescriptor documentationAsset](self, "documentationAsset");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = v4 == 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)transferNonAssetPropertiesFromDescriptor:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1896127A0];
  id v5 = a3;
  [v4 sharedLogger];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v15 = 0;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "Transferring non-asset attribute properties from other descriptor",  v15,  2u);
  }

  -[SUCoreDescriptor setDescriptorAudienceType:]( self,  "setDescriptorAudienceType:",  [v5 descriptorAudienceType]);
  -[SUCoreDescriptor setPreferredUpdateType:](self, "setPreferredUpdateType:", [v5 preferredUpdateType]);
  [v5 assetAudienceUUID];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setAssetAudienceUUID:](self, "setAssetAudienceUUID:", v8);

  -[SUCoreDescriptor setPreSUStagingRequiredSize:]( self,  "setPreSUStagingRequiredSize:",  [v5 preSUStagingRequiredSize]);
  -[SUCoreDescriptor setPreSUStagingOptionalSize:]( self,  "setPreSUStagingOptionalSize:",  [v5 preSUStagingOptionalSize]);
  [v5 documentation];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentation:](self, "setDocumentation:", v9);

  [v5 documentationAsset];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAsset:](self, "setDocumentationAsset:", v10);

  [v5 documentationAssetType];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetType:](self, "setDocumentationAssetType:", v11);

  [v5 documentationAssetIdentifier];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetIdentifier:](self, "setDocumentationAssetIdentifier:", v12);

  [v5 documentationAssetAbsoluteID];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetAbsoluteID:](self, "setDocumentationAssetAbsoluteID:", v13);

  [v5 documentationAssetPurpose];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreDescriptor setDocumentationAssetPurpose:](self, "setDocumentationAssetPurpose:", v14);
}

- (SUCoreDescriptor)initWithCoder:(id)a3
{
  v141[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v140.receiver = self;
  v140.super_class = (Class)&OBJC_CLASS___SUCoreDescriptor;
  id v5 = -[SUCoreDescriptor init](&v140, sel_init);
  if (v5)
  {
    v5->_descriptorType = (int)[v4 decodeIntForKey:@"DescriptorType"];
    v5->_descriptorAudienceType = (int)[v4 decodeIntForKey:@"DescriptorAudienceType"];
    v5->_preferredUpdateType = (int)[v4 decodeIntForKey:@"PreferredUpdateType"];
    v5->_updateType = (int)[v4 decodeIntForKey:@"UpdateType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssetID"];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetType"];
    softwareUpdateAssetType = v5->_softwareUpdateAssetType;
    v5->_softwareUpdateAssetType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetType"];
    documentationAssetType = v5->_documentationAssetType;
    v5->_documentationAssetType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetAbsoluteID"];
    softwareUpdateAssetAbsoluteID = v5->_softwareUpdateAssetAbsoluteID;
    v5->_softwareUpdateAssetAbsoluteID = (MAAbsoluteAssetId *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetAbsoluteID"];
    documentationAssetAbsoluteID = v5->_documentationAssetAbsoluteID;
    v5->_documentationAssetAbsoluteID = (MAAbsoluteAssetId *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetPurpose"];
    softwareUpdateAssetPurpose = v5->_softwareUpdateAssetPurpose;
    v5->_softwareUpdateAssetPurpose = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetPurpose"];
    documentationAssetPurpose = v5->_documentationAssetPurpose;
    v5->_documentationAssetPurpose = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniqueBuildID"];
    uniqueBuildID = v5->_uniqueBuildID;
    v5->_uniqueBuildID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductBuildVersion"];
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductVersionExtra"];
    productVersionExtra = v5->_productVersionExtra;
    v5->_productVersionExtra = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductSystemName"];
    productSystemName = v5->_productSystemName;
    v5->_productSystemName = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseType"];
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Publisher"];
    publisher = v5->_publisher;
    v5->_publisher = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseDate"];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RestoreVersion"];
    restoreVersion = v5->_restoreVersion;
    v5->_restoreVersion = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetUpdateBridgeVersion"];
    targetUpdateBridgeVersion = v5->_targetUpdateBridgeVersion;
    v5->_targetUpdateBridgeVersion = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetUpdateSFRVersion"];
    targetUpdateSFRVersion = v5->_targetUpdateSFRVersion;
    v5->_targetUpdateSFRVersion = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TrainName"];
    trainName = v5->_trainName;
    v5->_trainName = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteBuild"];
    prerequisiteBuild = v5->_prerequisiteBuild;
    v5->_prerequisiteBuild = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteOSVersion"];
    prerequisiteOSVersion = v5->_prerequisiteOSVersion;
    v5->_prerequisiteOSVersion = (NSString *)v46;

    uint64_t v48 = (void *)MEMORY[0x189604010];
    uint64_t v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = [v4 decodeObjectOfClasses:v50 forKey:@"SupportedDevices"];
    supportedDevices = v5->_supportedDevices;
    v5->_supportedDevices = (NSArray *)v51;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUDownloadSize"];
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_suDownloadSize = [v53 unsignedLongLongValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnarchiveSize"];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t unarchivedSize = [v54 unsignedLongLongValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSUPrepareSize"];
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_msuPrepareSize = [v55 unsignedLongLongValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstallationSize"];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t installationSize = [v56 unsignedLongLongValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinimumSystemPartitionSize"];
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minimumSystemPartitionSize = [v57 unsignedLongLongValue];

    v5->_streamingZipCapable = [v4 decodeBoolForKey:@"StreamingZipCapable"];
    v58 = (void *)MEMORY[0x189604010];
    v141[0] = objc_opt_class();
    v141[1] = objc_opt_class();
    v141[2] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v141 count:3];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    [v58 setWithArray:v59];
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v60 = [v4 decodeObjectOfClasses:v139 forKey:@"SystemPartitionPadding"];
    systemPartitionPadding = v5->_systemPartitionPadding;
    v5->_systemPartitionPadding = (NSDictionary *)v60;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSUSRequiredSize"];
    id v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preSUStagingRequiredSize = [v62 unsignedLongLongValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSUSOptionalSize"];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preSUStagingOptionalSize = [v63 unsignedLongLongValue];

    v5->_autoDownloadAllowableOverCellular = [v4 decodeBoolForKey:@"AutoDownloadAllowableOverCellular"];
    v5->_downloadAllowableOverCellular = [v4 decodeBoolForKey:@"DownloadAllowableOverCellular"];
    v5->_downloadable = [v4 decodeBoolForKey:@"Downloadable"];
    v5->_disableSiriVoiceDeletion = [v4 decodeBoolForKey:@"DisableSiriVoiceDeletion"];
    v5->_disableCDLevel4 = [v4 decodeBoolForKey:@"DisableCDLevel4"];
    v5->_disableAppDemotion = [v4 decodeBoolForKey:@"DisableAppDemotion"];
    v5->_disableInstallTonight = [v4 decodeBoolForKey:@"DisableInstallTonight"];
    v5->_forcePasscodeRequired = [v4 decodeBoolForKey:@"ForcePasscodeRequired"];
    v5->_rampEnabled = [v4 decodeBoolForKey:@"RampEnabled"];
    v5->_granularlyRamped = [v4 decodeBoolForKey:@"GranularlyRamped"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MDMDelayInterval"];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mdmDelayInterval = [v64 unsignedLongLongValue];

    v5->_autoUpdateEnabled = [v4 decodeBoolForKey:@"AutoUpdateEnabled"];
    v5->_hideInstallAlert = [v4 decodeIntegerForKey:@"HideInstallAlert"];
    v5->_containsSFRContent = [v4 decodeBoolForKey:@"ContainsSFRContent"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstallAlertInterval"];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installAlertInterval = [v65 unsignedLongLongValue];

    v5->_allowAutoDownloadOnBattery = [v4 decodeBoolForKey:@"AllowAutoDownloadOnBattery"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoDownloadOnBatteryDelay"];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoDownloadOnBatteryDelay = [v66 unsignedLongLongValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoDownloadOnBatteryMinBattery"];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoDownloadOnBatteryMinBattery = [v67 unsignedLongLongValue];

    uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SetupCritical"];
    setupCritical = v5->_setupCritical;
    v5->_setupCritical = (NSString *)v68;

    v5->_criticalCellularOverride = [v4 decodeBoolForKey:@"CriticalCellularOverride"];
    v5->_criticalOutOfBoxOnly = [v4 decodeBoolForKey:@"CriticalOutOfBoxOnly"];
    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastEmergencyBuild"];
    lastEmergencyBuild = v5->_lastEmergencyBuild;
    v5->_lastEmergencyBuild = (NSString *)v70;

    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastEmergencyOSVersion"];
    lastEmergencyOSVersion = v5->_lastEmergencyOSVersion;
    v5->_lastEmergencyOSVersion = (NSString *)v72;

    v5->_mandatoryUpdateEligible = [v4 decodeBoolForKey:@"MandatoryUpdateEligible"];
    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MandatoryUpdateVersionMin"];
    mandatoryUpdateVersionMin = v5->_mandatoryUpdateVersionMin;
    v5->_mandatoryUpdateVersionMin = (NSString *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MandatoryUpdateVersionMax"];
    mandatoryUpdateVersionMax = v5->_mandatoryUpdateVersionMax;
    v5->_mandatoryUpdateVersionMax = (NSString *)v76;

    v5->_mandatoryUpdateOptional = [v4 decodeBoolForKey:@"MandatoryUpdateOptional"];
    v5->_mandatoryUpdateRestrictedToOutOfTheBox = [v4 decodeBoolForKey:@"MandatoryUpdateRestrictedToOutOfTheBox"];
    v5->_oneShotBuddyDisabled = [v4 decodeBoolForKey:@"OneShotBuddyDisabled"];
    v78 = (void *)MEMORY[0x189604010];
    uint64_t v79 = objc_opt_class();
    objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v81 = [v4 decodeObjectOfClasses:v80 forKey:@"OneShotBuddyDisabledBuilds"];
    oneShotBuddyDisabledBuilds = v5->_oneShotBuddyDisabledBuilds;
    v5->_oneShotBuddyDisabledBuilds = (NSArray *)v81;

    v5->_criticalUpdate = [v4 decodeBoolForKey:@"CriticalUpdate"];
    uint64_t v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v83;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoInstallDelay"];
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoInstallDelay = [v85 unsignedLongLongValue];

    v5->_notifyAfter = [v4 decodeBoolForKey:@"NotifyAfter"];
    uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinimumBridgeVersion"];
    minimumBridgeVersion = v5->_minimumBridgeVersion;
    v5->_minimumBridgeVersion = (NSString *)v86;

    v5->_disableRosettaUpdates = [v4 decodeBoolForKey:@"DisableRosettaUpdates"];
    v5->_disableRecoveryOSUpdates = [v4 decodeBoolForKey:@"DisableRecoveryOSUpdates"];
    v5->_requireInstallAssistantUpdate = [v4 decodeBoolForKey:@"RequireInstallAssistantUpdate"];
    uint64_t v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SEPDigest"];
    sepDigest = v5->_sepDigest;
    v5->_sepDigest = (NSData *)v88;

    uint64_t v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SEPTBMDigests"];
    sepTBMDigests = v5->_sepTBMDigests;
    v5->_sepTBMDigests = (NSData *)v90;

    uint64_t v92 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RSEPDigest"];
    rsepDigest = v5->_rsepDigest;
    v5->_rsepDigest = (NSData *)v92;

    uint64_t v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RSEPTBMDigests"];
    rsepTBMDigests = v5->_rsepTBMDigests;
    v5->_rsepTBMDigests = (NSData *)v94;

    uint64_t v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationID"];
    documentationID = v5->_documentationID;
    v5->_documentationID = (NSString *)v96;

    uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Documentation"];
    documentation = v5->_documentation;
    v5->_documentation = (SUCoreDocumentation *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateURL"];
    softwareUpdateURL = v5->_softwareUpdateURL;
    v5->_softwareUpdateURL = (NSString *)v100;

    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Measurement"];
    measurement = v5->_measurement;
    v5->_measurement = (NSData *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MeasurementAlgorithm"];
    measurementAlgorithm = v5->_measurementAlgorithm;
    v5->_measurementAlgorithm = (NSString *)v104;

    uint64_t v106 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetIdentifier"];
    softwareUpdateAssetIdentifier = v5->_softwareUpdateAssetIdentifier;
    v5->_softwareUpdateAssetIdentifier = (SUCoreMAIdentifier *)v106;

    uint64_t v108 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetIdentifier"];
    documentationAssetIdentifier = v5->_documentationAssetIdentifier;
    v5->_documentationAssetIdentifier = (SUCoreMAIdentifier *)v108;

    v5->_promoteAlternateUpdate = [v4 decodeBoolForKey:@"PromoteAlternateUpdate"];
    v5->_enableAlternateAssetAudience = [v4 decodeBoolForKey:@"EnableAlternateAssetAudienceUUID"];
    uint64_t v110 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlternateAssetAudienceUUID"];
    alternateAssetAudienceUUID = v5->_alternateAssetAudienceUUID;
    v5->_alternateAssetAudienceUUID = (NSString *)v110;

    uint64_t v112 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssetAudienceUUID"];
    assetAudienceUUID = v5->_assetAudienceUUID;
    v5->_assetAudienceUUID = (NSString *)v112;

    uint64_t v114 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateBrainPath"];
    updateBrainPath = v5->_updateBrainPath;
    v5->_updateBrainPath = (NSString *)v114;

    uint64_t v116 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateBundlePath"];
    updateBundlePath = v5->_updateBundlePath;
    v5->_updateBundlePath = (NSString *)v116;

    v5->_splatOnly = [v4 decodeBoolForKey:@"SplatOnly"];
    v5->_semiSplatEnabled = [v4 decodeBoolForKey:@"SemiSplatEnabled"];
    v118 = (void *)MEMORY[0x189604010];
    uint64_t v119 = objc_opt_class();
    objc_msgSend(v118, "setWithObjects:", v119, objc_opt_class(), 0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v121 = [v4 decodeObjectOfClasses:v120 forKey:@"SemiSplatMustQuitApps"];
    semiSplatMustQuitApps = v5->_semiSplatMustQuitApps;
    v5->_semiSplatMustQuitApps = (NSArray *)v121;

    v5->_revoked = [v4 decodeBoolForKey:@"Revoked"];
    v5->_semiSplatRestartNow = [v4 decodeBoolForKey:@"SemiSplatRestartNow"];
    v5->_disableSplatCombo = [v4 decodeBoolForKey:@"DisableSplombo"];
    uint64_t v123 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssociatedSplatDescriptor"];
    associatedSplatDescriptor = v5->_associatedSplatDescriptor;
    v5->_associatedSplatDescriptor = (SUCoreDescriptor *)v123;

    v125 = (void *)MEMORY[0x189604010];
    uint64_t v126 = objc_opt_class();
    uint64_t v127 = objc_opt_class();
    uint64_t v128 = objc_opt_class();
    uint64_t v129 = objc_opt_class();
    uint64_t v130 = objc_opt_class();
    uint64_t v131 = objc_opt_class();
    uint64_t v132 = objc_opt_class();
    objc_msgSend(v125, "setWithObjects:", v126, v127, v128, v129, v130, v131, v132, objc_opt_class(), 0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v134 = [v4 decodeObjectOfClasses:v133 forKey:@"BundleAttributes"];
    bundleAttributes = v5->_bundleAttributes;
    v5->_bundleAttributes = (NSDictionary *)v134;

    softwareUpdateAsset = v5->_softwareUpdateAsset;
    v5->_softwareUpdateAsset = 0LL;

    documentationAsset = v5->_documentationAsset;
    v5->_documentationAsset = 0LL;

    v5->_enablePreSUStaging = [v4 decodeBoolForKey:@"EnablePSUS"];
    v5->_enablePreSUStagingForOptionalAssets = [v4 decodeBoolForKey:@"EnablePSUSForOptionalAssets"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v65 = a3;
  objc_msgSend( v65,  "encodeInt:forKey:",  -[SUCoreDescriptor descriptorType](self, "descriptorType"),  @"DescriptorType");
  objc_msgSend( v65,  "encodeInt:forKey:",  -[SUCoreDescriptor descriptorAudienceType](self, "descriptorAudienceType"),  @"DescriptorAudienceType");
  objc_msgSend( v65,  "encodeInt:forKey:",  -[SUCoreDescriptor preferredUpdateType](self, "preferredUpdateType"),  @"PreferredUpdateType");
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor updateType](self, "updateType"), @"UpdateType");
  -[SUCoreDescriptor assetID](self, "assetID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v4 forKey:@"AssetID"];

  -[SUCoreDescriptor softwareUpdateAssetType](self, "softwareUpdateAssetType");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v5 forKey:@"SoftwareUpdateAssetType"];

  -[SUCoreDescriptor documentationAssetType](self, "documentationAssetType");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v6 forKey:@"DocumentationAssetType"];
  v7 = -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](self, "softwareUpdateAssetAbsoluteID");
  [v65 encodeObject:v7 forKey:@"SoftwareUpdateAssetAbsoluteID"];

  -[SUCoreDescriptor documentationAssetAbsoluteID](self, "documentationAssetAbsoluteID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v8 forKey:@"DocumentationAssetAbsoluteID"];

  -[SUCoreDescriptor softwareUpdateAssetPurpose](self, "softwareUpdateAssetPurpose");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v9 forKey:@"SoftwareUpdateAssetPurpose"];

  -[SUCoreDescriptor documentationAssetPurpose](self, "documentationAssetPurpose");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v10 forKey:@"DocumentationAssetPurpose"];

  -[SUCoreDescriptor uniqueBuildID](self, "uniqueBuildID");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v11 forKey:@"UniqueBuildID"];

  -[SUCoreDescriptor productVersion](self, "productVersion");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v12 forKey:@"ProductVersion"];

  -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v13 forKey:@"ProductBuildVersion"];

  -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v14 forKey:@"ProductVersionExtra"];

  -[SUCoreDescriptor productSystemName](self, "productSystemName");
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v15 forKey:@"ProductSystemName"];

  -[SUCoreDescriptor releaseType](self, "releaseType");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v16 forKey:@"ReleaseType"];

  -[SUCoreDescriptor publisher](self, "publisher");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v17 forKey:@"Publisher"];

  -[SUCoreDescriptor releaseDate](self, "releaseDate");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v18 forKey:@"ReleaseDate"];

  -[SUCoreDescriptor restoreVersion](self, "restoreVersion");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v19 forKey:@"RestoreVersion"];

  -[SUCoreDescriptor targetUpdateBridgeVersion](self, "targetUpdateBridgeVersion");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v20 forKey:@"TargetUpdateBridgeVersion"];

  -[SUCoreDescriptor targetUpdateSFRVersion](self, "targetUpdateSFRVersion");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v21 forKey:@"TargetUpdateSFRVersion"];

  -[SUCoreDescriptor trainName](self, "trainName");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v22 forKey:@"TrainName"];

  -[SUCoreDescriptor prerequisiteBuild](self, "prerequisiteBuild");
  uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v23 forKey:@"PrerequisiteBuild"];

  -[SUCoreDescriptor prerequisiteOSVersion](self, "prerequisiteOSVersion");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v24 forKey:@"PrerequisiteOSVersion"];

  -[SUCoreDescriptor supportedDevices](self, "supportedDevices");
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v25 forKey:@"SupportedDevices"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v26 forKey:@"SUDownloadSize"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_unarchivedSize];
  char v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v27 forKey:@"UnarchiveSize"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor msuPrepareSize](self, "msuPrepareSize"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v28 forKey:@"MSUPrepareSize"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_installationSize];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v29 forKey:@"InstallationSize"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor minimumSystemPartitionSize](self, "minimumSystemPartitionSize"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v30 forKey:@"MinimumSystemPartitionSize"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor streamingZipCapable](self, "streamingZipCapable"),  @"StreamingZipCapable");
  -[SUCoreDescriptor systemPartitionPadding](self, "systemPartitionPadding");
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v31 forKey:@"SystemPartitionPadding"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v32 forKey:@"PSUSRequiredSize"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor preSUStagingOptionalSize](self, "preSUStagingOptionalSize"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v33 forKey:@"PSUSOptionalSize"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor autoDownloadAllowableOverCellular](self, "autoDownloadAllowableOverCellular"),  @"AutoDownloadAllowableOverCellular");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor downloadAllowableOverCellular](self, "downloadAllowableOverCellular"),  @"DownloadAllowableOverCellular");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor downloadable](self, "downloadable"), @"Downloadable");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor disableSiriVoiceDeletion](self, "disableSiriVoiceDeletion"),  @"DisableSiriVoiceDeletion");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor disableCDLevel4](self, "disableCDLevel4"),  @"DisableCDLevel4");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor disableAppDemotion](self, "disableAppDemotion"),  @"DisableAppDemotion");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor disableInstallTonight](self, "disableInstallTonight"),  @"DisableInstallTonight");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor forcePasscodeRequired](self, "forcePasscodeRequired"),  @"ForcePasscodeRequired");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor rampEnabled](self, "rampEnabled"), @"RampEnabled");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor granularlyRamped](self, "granularlyRamped"),  @"GranularlyRamped");
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor mdmDelayInterval](self, "mdmDelayInterval"));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v34 forKey:@"MDMDelayInterval"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor autoUpdateEnabled](self, "autoUpdateEnabled"),  @"AutoUpdateEnabled");
  objc_msgSend( v65,  "encodeInteger:forKey:",  -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"),  @"HideInstallAlert");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor containsSFRContent](self, "containsSFRContent"),  @"ContainsSFRContent");
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor installAlertInterval](self, "installAlertInterval"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v35 forKey:@"InstallAlertInterval"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery"),  @"AllowAutoDownloadOnBattery");
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor autoDownloadOnBatteryDelay](self, "autoDownloadOnBatteryDelay"));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v36 forKey:@"AutoDownloadOnBatteryDelay"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor autoDownloadOnBatteryMinBattery](self, "autoDownloadOnBatteryMinBattery"));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v37 forKey:@"AutoDownloadOnBatteryMinBattery"];

  -[SUCoreDescriptor setupCritical](self, "setupCritical");
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v38 forKey:@"SetupCritical"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor criticalCellularOverride](self, "criticalCellularOverride"),  @"CriticalCellularOverride");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor criticalOutOfBoxOnly](self, "criticalOutOfBoxOnly"),  @"CriticalOutOfBoxOnly");
  -[SUCoreDescriptor lastEmergencyBuild](self, "lastEmergencyBuild");
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v39 forKey:@"LastEmergencyBuild"];

  -[SUCoreDescriptor lastEmergencyOSVersion](self, "lastEmergencyOSVersion");
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v40 forKey:@"LastEmergencyOSVersion"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible"),  @"MandatoryUpdateEligible");
  -[SUCoreDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin");
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v41 forKey:@"MandatoryUpdateVersionMin"];

  -[SUCoreDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax");
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v42 forKey:@"MandatoryUpdateVersionMax"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional"),  @"MandatoryUpdateOptional");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox"),  @"MandatoryUpdateRestrictedToOutOfTheBox");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor oneShotBuddyDisabled](self, "oneShotBuddyDisabled"),  @"OneShotBuddyDisabled");
  -[SUCoreDescriptor oneShotBuddyDisabledBuilds](self, "oneShotBuddyDisabledBuilds");
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v43 forKey:@"OneShotBuddyDisabledBuilds"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor criticalUpdate](self, "criticalUpdate"),  @"CriticalUpdate");
  -[SUCoreDescriptor productType](self, "productType");
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v44 forKey:@"ProductType"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor autoInstallDelay](self, "autoInstallDelay"));
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v45 forKey:@"AutoInstallDelay"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor notifyAfter](self, "notifyAfter"), @"NotifyAfter");
  -[SUCoreDescriptor minimumBridgeVersion](self, "minimumBridgeVersion");
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v46 forKey:@"MinimumBridgeVersion"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor disableRosettaUpdates](self, "disableRosettaUpdates"),  @"DisableRosettaUpdates");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor disableRecoveryOSUpdates](self, "disableRecoveryOSUpdates"),  @"DisableRecoveryOSUpdates");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor requireInstallAssistantUpdate](self, "requireInstallAssistantUpdate"),  @"RequireInstallAssistantUpdate");
  -[SUCoreDescriptor sepDigest](self, "sepDigest");
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v47 forKey:@"SEPDigest"];

  -[SUCoreDescriptor sepTBMDigests](self, "sepTBMDigests");
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v48 forKey:@"SEPTBMDigests"];

  -[SUCoreDescriptor rsepDigest](self, "rsepDigest");
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v49 forKey:@"RSEPDigest"];

  -[SUCoreDescriptor rsepTBMDigests](self, "rsepTBMDigests");
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v50 forKey:@"RSEPTBMDigests"];

  -[SUCoreDescriptor documentationID](self, "documentationID");
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v51 forKey:@"DocumentationID"];

  -[SUCoreDescriptor documentation](self, "documentation");
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v52 forKey:@"Documentation"];

  -[SUCoreDescriptor softwareUpdateURL](self, "softwareUpdateURL");
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v53 forKey:@"SoftwareUpdateURL"];
  v54 = -[SUCoreDescriptor measurement](self, "measurement");
  [v65 encodeObject:v54 forKey:@"Measurement"];

  -[SUCoreDescriptor measurementAlgorithm](self, "measurementAlgorithm");
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v55 forKey:@"MeasurementAlgorithm"];
  v56 = -[SUCoreDescriptor softwareUpdateAssetIdentifier](self, "softwareUpdateAssetIdentifier");
  [v65 encodeObject:v56 forKey:@"SoftwareUpdateAssetIdentifier"];

  -[SUCoreDescriptor documentationAssetIdentifier](self, "documentationAssetIdentifier");
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v57 forKey:@"DocumentationAssetIdentifier"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor promoteAlternateUpdate](self, "promoteAlternateUpdate"),  @"PromoteAlternateUpdate");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor enableAlternateAssetAudience](self, "enableAlternateAssetAudience"),  @"EnableAlternateAssetAudienceUUID");
  v58 = -[SUCoreDescriptor alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  [v65 encodeObject:v58 forKey:@"AlternateAssetAudienceUUID"];
  v59 = -[SUCoreDescriptor assetAudienceUUID](self, "assetAudienceUUID");
  [v65 encodeObject:v59 forKey:@"AssetAudienceUUID"];

  -[SUCoreDescriptor updateBrainPath](self, "updateBrainPath");
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v60 forKey:@"UpdateBrainPath"];

  -[SUCoreDescriptor updateBundlePath](self, "updateBundlePath");
  id v61 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v61 forKey:@"UpdateBundlePath"];

  -[SUCoreDescriptor bundleAttributes](self, "bundleAttributes");
  id v62 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 encodeObject:v62 forKey:@"BundleAttributes"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor splatOnly](self, "splatOnly"), @"SplatOnly");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor semiSplatEnabled](self, "semiSplatEnabled"),  @"SemiSplatEnabled");
  v63 = -[SUCoreDescriptor semiSplatMustQuitApps](self, "semiSplatMustQuitApps");
  [v65 encodeObject:v63 forKey:@"SemiSplatMustQuitApps"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor revoked](self, "revoked"), @"Revoked");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor semiSplatRestartNow](self, "semiSplatRestartNow"),  @"SemiSplatRestartNow");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor disableSplatCombo](self, "disableSplatCombo"),  @"DisableSplombo");
  v64 = -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  [v65 encodeObject:v64 forKey:@"AssociatedSplatDescriptor"];

  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging"),  @"EnablePSUS");
  objc_msgSend( v65,  "encodeBool:forKey:",  -[SUCoreDescriptor enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"),  @"EnablePSUSForOptionalAssets");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCoreDescriptor *)a3;
  if (v4 == self)
  {
    char v19 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      int64_t v6 = -[SUCoreDescriptor descriptorType](self, "descriptorType");
      if (v6 == -[SUCoreDescriptor descriptorType](v5, "descriptorType"))
      {
        unint64_t v7 = -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
        if (v7 == -[SUCoreDescriptor preSUStagingRequiredSize](v5, "preSUStagingRequiredSize"))
        {
          unint64_t v8 = -[SUCoreDescriptor preSUStagingOptionalSize](self, "preSUStagingOptionalSize");
          if (v8 == -[SUCoreDescriptor preSUStagingOptionalSize](v5, "preSUStagingOptionalSize"))
          {
            -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
              uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCoreDescriptor associatedSplatDescriptor](v5, "associatedSplatDescriptor");
              uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
              char v12 = [v10 isEqual:v11];

              if ((v12 & 1) != 0)
              {
LABEL_8:
                if (-[SUCoreDescriptor descriptorType](self, "descriptorType") == 2
                  || -[SUCoreDescriptor descriptorType](self, "descriptorType") == 4)
                {
                  uint64_t v13 = (void *)MEMORY[0x189612760];
                  -[SUCoreDescriptor updateBrainPath](self, "updateBrainPath");
                  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SUCoreDescriptor updateBrainPath](v5, "updateBrainPath");
                  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
                  if ([v13 stringIsEqual:v14 to:v15])
                  {
                    uint64_t v16 = (void *)MEMORY[0x189612760];
                    -[SUCoreDescriptor updateBundlePath](self, "updateBundlePath");
                    id v17 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SUCoreDescriptor updateBundlePath](v5, "updateBundlePath");
                    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
                    char v19 = [v16 stringIsEqual:v17 to:v18];

LABEL_29:
                    goto LABEL_16;
                  }
                }

                else
                {
                  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[SUCoreDescriptor descriptorType](self, "descriptorType"));
                  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                  int v23 = [&unk_18A1126B8 containsObject:v22];

                  if (v23)
                  {
                    uint64_t v24 = (void *)MEMORY[0x189612760];
                    -[SUCoreDescriptor productVersion](self, "productVersion");
                    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SUCoreDescriptor productVersion](v5, "productVersion");
                    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
                    if ([v24 stringIsEqual:v14 to:v15])
                    {
                      id v25 = (void *)MEMORY[0x189612760];
                      -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
                      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SUCoreDescriptor productBuildVersion](v5, "productBuildVersion");
                      char v27 = (void *)objc_claimAutoreleasedReturnValue();
                      if ([v25 stringIsEqual:v26 to:v27])
                      {
                        uint64_t v28 = (void *)MEMORY[0x189612760];
                        -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
                        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                        uint64_t v60 = -[SUCoreDescriptor productVersionExtra](v5, "productVersionExtra");
                        id v61 = v29;
                        if (objc_msgSend(v28, "stringIsEqual:to:", v29))
                        {
                          uint64_t v30 = (void *)MEMORY[0x189612760];
                          uint64_t v31 = -[SUCoreDescriptor releaseType](self, "releaseType");
                          uint64_t v32 = -[SUCoreDescriptor releaseType](v5, "releaseType");
                          v33 = v30;
                          uint64_t v34 = (void *)v32;
                          v59 = (void *)v31;
                          if ([v33 stringIsEqual:v31 to:v32])
                          {
                            v58 = v34;
                            uint64_t v35 = (void *)MEMORY[0x189612760];
                            uint64_t v36 = -[SUCoreDescriptor restoreVersion](self, "restoreVersion");
                            uint64_t v37 = -[SUCoreDescriptor restoreVersion](v5, "restoreVersion");
                            uint64_t v38 = v35;
                            uint64_t v39 = (void *)v36;
                            uint64_t v57 = (void *)v37;
                            if (objc_msgSend(v38, "stringIsEqual:to:", v36))
                            {
                              v56 = (void *)v36;
                              uint64_t v40 = (void *)MEMORY[0x189612760];
                              uint64_t v41 = -[SUCoreDescriptor targetUpdateBridgeVersion](self, "targetUpdateBridgeVersion");
                              -[SUCoreDescriptor targetUpdateBridgeVersion](v5, "targetUpdateBridgeVersion");
                              v54 = (void *)v41;
                              uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v40, "stringIsEqual:to:", v41))
                              {
                                uint64_t v42 = (void *)MEMORY[0x189612760];
                                uint64_t v43 = -[SUCoreDescriptor targetUpdateSFRVersion](self, "targetUpdateSFRVersion");
                                uint64_t v44 = -[SUCoreDescriptor targetUpdateSFRVersion](v5, "targetUpdateSFRVersion");
                                uint64_t v53 = (void *)v43;
                                uint64_t v45 = v43;
                                uint64_t v46 = (void *)v44;
                                if (objc_msgSend(v42, "stringIsEqual:to:", v45))
                                {
                                  uint64_t v52 = (void *)MEMORY[0x189612760];
                                  -[SUCoreDescriptor trainName](self, "trainName");
                                  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[SUCoreDescriptor trainName](v5, "trainName");
                                  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
                                  char v19 = [v52 stringIsEqual:v47 to:v48];
                                }

                                else
                                {
                                  char v19 = 0;
                                }
                              }

                              else
                              {
                                char v19 = 0;
                              }

                              uint64_t v51 = (void *)v60;
                              uint64_t v29 = v61;
                              uint64_t v39 = v56;
                            }

                            else
                            {
                              char v19 = 0;
                              uint64_t v51 = (void *)v60;
                              uint64_t v29 = v61;
                            }

                            uint64_t v34 = v58;
                          }

                          else
                          {
                            char v19 = 0;
                            uint64_t v51 = (void *)v60;
                            uint64_t v29 = v61;
                          }
                        }

                        else
                        {
                          char v19 = 0;
                          uint64_t v51 = (void *)v60;
                        }
                      }

                      else
                      {
                        char v19 = 0;
                      }

                      goto LABEL_29;
                    }
                  }

                  else
                  {
                    id v49 = objc_alloc(NSString);
                    +[SUCoreDescriptor nameForDescriptorType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorType:",  -[SUCoreDescriptor descriptorType](self, "descriptorType"));
                    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v14 = (void *)[v49 initWithFormat:@"Unexpected descriptor type %@", v50];

                    [MEMORY[0x189612778] sharedDiag];
                    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
                    [v15 trackAnomaly:@"DescriptorIsEqual" forReason:v14 withResult:8116 withError:0];
                  }
                }

                char v19 = 0;
                goto LABEL_29;
              }
            }

            else
            {
              -[SUCoreDescriptor associatedSplatDescriptor](v5, "associatedSplatDescriptor");
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20) {
                goto LABEL_8;
              }
            }
          }
        }
      }

      char v19 = 0;
LABEL_16:

      goto LABEL_17;
    }

    char v19 = 0;
  }

- (id)description
{
  if (-[SUCoreDescriptor descriptorType](self, "descriptorType") == 2
    || -[SUCoreDescriptor descriptorType](self, "descriptorType") == 4)
  {
    id v3 = objc_alloc(NSString);
    +[SUCoreDescriptor nameForDescriptorType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorType:",  -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor updateBrainPath](self, "updateBrainPath");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor updateBundlePath](self, "updateBundlePath");
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor bundleAttributes](self, "bundleAttributes");
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = (void *)[v3 initWithFormat:@"\n[>>>\n    descriptorType: %@\n   updateBrainPath: %@\n  updateBundlePath: %@\n  bundleAttributes: %@\n<<<]", v4, v5, v6, v7];
  }

  else
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = [&unk_18A1126D0 containsObject:v10];

    id v12 = objc_alloc(NSString);
    uint64_t v13 = +[SUCoreDescriptor nameForDescriptorType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorType:",  -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    uint64_t v14 = (void *)v13;
    if (v11)
    {
      +[SUCoreDescriptor nameForDescriptorAudienceType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorAudienceType:",  -[SUCoreDescriptor descriptorAudienceType](self, "descriptorAudienceType"));
      uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorPreferredUpdateType:",  -[SUCoreDescriptor preferredUpdateType](self, "preferredUpdateType"));
      -[SUCoreDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
      uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = -[SUCoreDescriptor humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
      -[SUCoreDescriptor humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
      uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = -[SUCoreDescriptor humanReadableMoreInfoLink](self, "humanReadableMoreInfoLink");
      v59 = v12;
      if (-[SUCoreDescriptor notificationEnabled](self, "notificationEnabled")) {
        BOOL v15 = @"YES";
      }
      else {
        BOOL v15 = @"NO";
      }
      v58 = v15;
      -[SUCoreDescriptor notificationTitleString](self, "notificationTitleString");
      uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = -[SUCoreDescriptor notificationBodyString](self, "notificationBodyString");
      if (-[SUCoreDescriptor recommendedUpdateEnabled](self, "recommendedUpdateEnabled")) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      uint64_t v57 = v16;
      if (-[SUCoreDescriptor recommendedUpdateApplicable](self, "recommendedUpdateApplicable")) {
        id v17 = @"YES";
      }
      else {
        id v17 = @"NO";
      }
      v56 = v17;
      -[SUCoreDescriptor recommendedUpdateNotificationFrequencyDays](self, "recommendedUpdateNotificationFrequencyDays");
      uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = -[SUCoreDescriptor recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
      -[SUCoreDescriptor recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
      uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = -[SUCoreDescriptor recommendedUpdateTitleString](self, "recommendedUpdateTitleString");
      -[SUCoreDescriptor recommendedUpdateAlertBodyString](self, "recommendedUpdateAlertBodyString");
      uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = -[SUCoreDescriptor mandatoryUpdateBodyString](self, "mandatoryUpdateBodyString");
      -[SUCoreDescriptor updateTypeName](self, "updateTypeName");
      uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor assetID](self, "assetID");
      char v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateAssetType](self, "softwareUpdateAssetType");
      uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentationAssetType](self, "documentationAssetType");
      uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](self, "softwareUpdateAssetAbsoluteID");
      uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentationAssetAbsoluteID](self, "documentationAssetAbsoluteID");
      uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateAssetPurpose](self, "softwareUpdateAssetPurpose");
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentationAssetPurpose](self, "documentationAssetPurpose");
      uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor promoteAlternateUpdate](self, "promoteAlternateUpdate")) {
        uint64_t v18 = @"YES";
      }
      else {
        uint64_t v18 = @"NO";
      }
      uint64_t v55 = v18;
      if (-[SUCoreDescriptor enableAlternateAssetAudience](self, "enableAlternateAssetAudience")) {
        char v19 = @"YES";
      }
      else {
        char v19 = @"NO";
      }
      v54 = v19;
      v82 = -[SUCoreDescriptor alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
      -[SUCoreDescriptor assetAudienceUUID](self, "assetAudienceUUID");
      uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = -[SUCoreDescriptor uniqueBuildID](self, "uniqueBuildID");
      -[SUCoreDescriptor trainName](self, "trainName");
      uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = -[SUCoreDescriptor productVersion](self, "productVersion");
      -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
      uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor productSystemName](self, "productSystemName");
      uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor releaseType](self, "releaseType");
      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor publisher](self, "publisher");
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor restoreVersion](self, "restoreVersion");
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor targetUpdateBridgeVersion](self, "targetUpdateBridgeVersion");
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor targetUpdateSFRVersion](self, "targetUpdateSFRVersion");
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor releaseDate](self, "releaseDate");
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor prerequisiteBuild](self, "prerequisiteBuild");
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor prerequisiteOSVersion](self, "prerequisiteOSVersion");
      id v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor supportedDevices](self, "supportedDevices");
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor fullReplacement](self, "fullReplacement")) {
        uint64_t v20 = @"YES";
      }
      else {
        uint64_t v20 = @"NO";
      }
      uint64_t v47 = v20;
      unint64_t v46 = -[SUCoreDescriptor downloadSize](self, "downloadSize");
      unint64_t v45 = -[SUCoreDescriptor unarchivedSize](self, "unarchivedSize");
      unint64_t v44 = -[SUCoreDescriptor msuPrepareSize](self, "msuPrepareSize");
      unint64_t v43 = -[SUCoreDescriptor preparationSize](self, "preparationSize");
      unint64_t v42 = -[SUCoreDescriptor installationSize](self, "installationSize");
      unint64_t v41 = -[SUCoreDescriptor minimumSystemPartitionSize](self, "minimumSystemPartitionSize");
      unint64_t v40 = -[SUCoreDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace");
      if (-[SUCoreDescriptor streamingZipCapable](self, "streamingZipCapable")) {
        uint64_t v21 = @"YES";
      }
      else {
        uint64_t v21 = @"NO";
      }
      uint64_t v39 = v21;
      -[SUCoreDescriptor systemPartitionPadding](self, "systemPartitionPadding");
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v37 = -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
      unint64_t v36 = -[SUCoreDescriptor preSUStagingOptionalSize](self, "preSUStagingOptionalSize");
      unint64_t v35 = -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize");
      if (-[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging")) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      uint64_t v34 = v22;
      if (-[SUCoreDescriptor enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets")) {
        int v23 = @"YES";
      }
      else {
        int v23 = @"NO";
      }
      v33 = v23;
      -[SUCoreDescriptor autoDownloadAllowableOverCellular](self, "autoDownloadAllowableOverCellular");
      -[SUCoreDescriptor downloadAllowableOverCellular](self, "downloadAllowableOverCellular");
      -[SUCoreDescriptor downloadable](self, "downloadable");
      -[SUCoreDescriptor disableSiriVoiceDeletion](self, "disableSiriVoiceDeletion");
      -[SUCoreDescriptor disableCDLevel4](self, "disableCDLevel4");
      -[SUCoreDescriptor disableAppDemotion](self, "disableAppDemotion");
      -[SUCoreDescriptor disableInstallTonight](self, "disableInstallTonight");
      -[SUCoreDescriptor forcePasscodeRequired](self, "forcePasscodeRequired");
      -[SUCoreDescriptor rampEnabled](self, "rampEnabled");
      -[SUCoreDescriptor granularlyRamped](self, "granularlyRamped");
      -[SUCoreDescriptor mdmDelayInterval](self, "mdmDelayInterval");
      -[SUCoreDescriptor autoUpdateEnabled](self, "autoUpdateEnabled");
      objc_msgSend( MEMORY[0x189612760],  "stringFromTriState:",  -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"));
      uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor containsSFRContent](self, "containsSFRContent");
      -[SUCoreDescriptor installAlertInterval](self, "installAlertInterval");
      -[SUCoreDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery");
      -[SUCoreDescriptor autoDownloadOnBatteryDelay](self, "autoDownloadOnBatteryDelay");
      -[SUCoreDescriptor autoDownloadOnBatteryMinBattery](self, "autoDownloadOnBatteryMinBattery");
      -[SUCoreDescriptor disableSplatCombo](self, "disableSplatCombo");
      -[SUCoreDescriptor setupCritical](self, "setupCritical");
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor criticalCellularOverride](self, "criticalCellularOverride");
      -[SUCoreDescriptor criticalOutOfBoxOnly](self, "criticalOutOfBoxOnly");
      -[SUCoreDescriptor lastEmergencyBuild](self, "lastEmergencyBuild");
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor lastEmergencyOSVersion](self, "lastEmergencyOSVersion");
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible");
      v67 = -[SUCoreDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin");
      v66 = -[SUCoreDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax");
      -[SUCoreDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional");
      -[SUCoreDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox");
      -[SUCoreDescriptor oneShotBuddyDisabled](self, "oneShotBuddyDisabled");
      -[SUCoreDescriptor oneShotBuddyDisabledBuilds](self, "oneShotBuddyDisabledBuilds");
      id v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor criticalUpdate](self, "criticalUpdate");
      v64 = -[SUCoreDescriptor productType](self, "productType");
      -[SUCoreDescriptor autoInstallDelay](self, "autoInstallDelay");
      -[SUCoreDescriptor notifyAfter](self, "notifyAfter");
      v63 = -[SUCoreDescriptor minimumBridgeVersion](self, "minimumBridgeVersion");
      -[SUCoreDescriptor disableRosettaUpdates](self, "disableRosettaUpdates");
      -[SUCoreDescriptor disableRecoveryOSUpdates](self, "disableRecoveryOSUpdates");
      -[SUCoreDescriptor requireInstallAssistantUpdate](self, "requireInstallAssistantUpdate");
      -[SUCoreDescriptor sepDigest](self, "sepDigest");
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor sepTBMDigests](self, "sepTBMDigests");
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor rsepDigest](self, "rsepDigest");
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor rsepTBMDigests](self, "rsepTBMDigests");
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentationID](self, "documentationID");
      id v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentation](self, "documentation");
      id v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateURL](self, "softwareUpdateURL");
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor measurement](self, "measurement");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor measurementAlgorithm](self, "measurementAlgorithm");
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor bundleAttributes](self, "bundleAttributes");
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor splatOnly](self, "splatOnly");
      -[SUCoreDescriptor semiSplatEnabled](self, "semiSplatEnabled");
      -[SUCoreDescriptor semiSplatMustQuitApps](self, "semiSplatMustQuitApps");
      char v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor revoked](self, "revoked");
      -[SUCoreDescriptor semiSplatRestartNow](self, "semiSplatRestartNow");
      -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v8 = (void *)objc_msgSend( v59,  "initWithFormat:",  &cfstr_Descriptortype_1,  v14,  v104,  v103,  v102,  v101,  v100,  v99,  v58,  v98,  v97,  v57,  v56,  v96,  v95,  v94,  v93,  v92,  v91,  v90,  v89,  v88,  v87,  v86,  v85,  v84,  v83,  v55,  v54,  v82,  v81,  v80,  v79,  v78,  v77,  v76,  v75,  v74,  v73,  v72,  v53,  v52,  v51,  v50,  v49,  v48,  v47,
                     v46,
                     v45,
                     v44,
                     v43,
                     v42,
                     v41,
                     v40,
                     v39,
                     v38,
                     v37,
                     v36,
                     v35,
                     v34,
                     v33);

      id v4 = v14;
    }

    else
    {
      unint64_t v8 = (void *)[v12 initWithFormat:@"Unexpected descriptor type %@", v13];

      [MEMORY[0x189612778] sharedDiag];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 trackAnomaly:@"DescriptorDescription" forReason:v8 withResult:8116 withError:0];
    }
  }

  return v8;
}

- (id)overview
{
  return -[SUCoreDescriptor overviewWithMaxValueLength:providingSubstitutionMap:]( self,  "overviewWithMaxValueLength:providingSubstitutionMap:",  0LL,  0LL);
}

- (id)overviewWithMaxValueLength:(unint64_t)a3 providingSubstitutionMap:(id)a4
{
  id v6 = a4;
  if (-[SUCoreDescriptor descriptorType](self, "descriptorType") == 2
    || -[SUCoreDescriptor descriptorType](self, "descriptorType") == 4)
  {
    id v7 = objc_alloc(NSString);
    +[SUCoreDescriptor nameForDescriptorType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorType:",  -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (void *)MEMORY[0x189612760];
    -[SUCoreDescriptor updateBrainPath](self, "updateBrainPath");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 limitString:v10 toMaxLength:a3 providingSubstitutionMap:v6];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)MEMORY[0x189612760];
    -[SUCoreDescriptor updateBundlePath](self, "updateBundlePath");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 limitString:v13 toMaxLength:a3 providingSubstitutionMap:v6];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = (void *)[v7 initWithFormat:@"\n[>>>\n    descriptorType: %@\n   updateBrainPath: %@\n  updateBundlePath: %@\n<<<]", v8, v11, v14];
  }

  else
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [&unk_18A1126E8 containsObject:v17];

    id v19 = objc_alloc(NSString);
    uint64_t v20 = +[SUCoreDescriptor nameForDescriptorType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorType:",  -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    unint64_t v8 = (void *)v20;
    if (v18)
    {
      +[SUCoreDescriptor nameForDescriptorAudienceType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorAudienceType:",  -[SUCoreDescriptor descriptorAudienceType](self, "descriptorAudienceType"));
      uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorPreferredUpdateType:",  -[SUCoreDescriptor preferredUpdateType](self, "preferredUpdateType"));
      uint64_t v21 = (void *)MEMORY[0x189612760];
      v95 = -[SUCoreDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
      [v21 limitString:v95 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
      uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 limitString:v94 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = (void *)MEMORY[0x189612760];
      v93 = -[SUCoreDescriptor humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
      [v23 limitString:v93 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor humanReadableMoreInfoLink](self, "humanReadableMoreInfoLink");
      uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 limitString:v92 toMaxLength:a3 providingSubstitutionMap:v6];
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 = (void *)MEMORY[0x189612760];
      v91 = -[SUCoreDescriptor updateTypeName](self, "updateTypeName");
      [v25 limitString:v91 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor productVersion](self, "productVersion");
      uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 limitString:v90 toMaxLength:a3 providingSubstitutionMap:v6];
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      char v27 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
      char v89 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 limitString:v89 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor restoreVersion](self, "restoreVersion");
      uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 limitString:v88 toMaxLength:a3 providingSubstitutionMap:v6];
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor targetUpdateBridgeVersion](self, "targetUpdateBridgeVersion");
      uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 limitString:v87 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor targetUpdateSFRVersion](self, "targetUpdateSFRVersion");
      uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 limitString:v86 toMaxLength:a3 providingSubstitutionMap:v6];
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor releaseType](self, "releaseType");
      uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 limitString:v85 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor releaseDate](self, "releaseDate");
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
      [v84 description];
      uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 limitString:v83 toMaxLength:a3 providingSubstitutionMap:v6];
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x189612760];
      v82 = -[SUCoreDescriptor prerequisiteBuild](self, "prerequisiteBuild");
      [v33 limitString:v82 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor prerequisiteOSVersion](self, "prerequisiteOSVersion");
      uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 limitString:v81 toMaxLength:a3 providingSubstitutionMap:v6];
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v80 = -[SUCoreDescriptor downloadSize](self, "downloadSize");
      unint64_t v79 = -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
      unint64_t v78 = -[SUCoreDescriptor preSUStagingOptionalSize](self, "preSUStagingOptionalSize");
      unint64_t v77 = -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize");
      unint64_t v76 = -[SUCoreDescriptor unarchivedSize](self, "unarchivedSize");
      unint64_t v75 = -[SUCoreDescriptor preparationSize](self, "preparationSize");
      unint64_t v73 = -[SUCoreDescriptor installationSize](self, "installationSize");
      unint64_t v72 = -[SUCoreDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace");
      unint64_t v35 = @"YES";
      if (-[SUCoreDescriptor rampEnabled](self, "rampEnabled")) {
        unint64_t v36 = @"YES";
      }
      else {
        unint64_t v36 = @"NO";
      }
      uint64_t v71 = v36;
      if (-[SUCoreDescriptor granularlyRamped](self, "granularlyRamped")) {
        unint64_t v37 = @"YES";
      }
      else {
        unint64_t v37 = @"NO";
      }
      uint64_t v69 = v37;
      unint64_t v68 = -[SUCoreDescriptor mdmDelayInterval](self, "mdmDelayInterval");
      if (-[SUCoreDescriptor autoUpdateEnabled](self, "autoUpdateEnabled")) {
        uint64_t v38 = @"YES";
      }
      else {
        uint64_t v38 = @"NO";
      }
      v67 = v38;
      objc_msgSend( MEMORY[0x189612760],  "stringFromTriState:",  -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"));
      uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor containsSFRContent](self, "containsSFRContent")) {
        uint64_t v39 = @"YES";
      }
      else {
        uint64_t v39 = @"NO";
      }
      id v65 = v39;
      unint64_t v63 = -[SUCoreDescriptor installAlertInterval](self, "installAlertInterval");
      if (-[SUCoreDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery")) {
        unint64_t v40 = @"YES";
      }
      else {
        unint64_t v40 = @"NO";
      }
      id v61 = v40;
      if (-[SUCoreDescriptor disableSplatCombo](self, "disableSplatCombo")) {
        unint64_t v41 = @"YES";
      }
      else {
        unint64_t v41 = @"NO";
      }
      v59 = v41;
      unint64_t v42 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor setupCritical](self, "setupCritical");
      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 limitString:v74 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v43 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor documentationID](self, "documentationID");
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
      [v43 limitString:v70 toMaxLength:a3 providingSubstitutionMap:v6];
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v44 = (void *)MEMORY[0x189612760];
      v66 = -[SUCoreDescriptor softwareUpdateURL](self, "softwareUpdateURL");
      [v44 limitString:v66 toMaxLength:a3 providingSubstitutionMap:v6];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v45 = (void *)MEMORY[0x189612760];
      v64 = -[SUCoreDescriptor measurement](self, "measurement");
      [v64 description];
      id v62 = (void *)objc_claimAutoreleasedReturnValue();
      [v45 limitString:v62 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v46 = (void *)MEMORY[0x189612760];
      -[SUCoreDescriptor measurementAlgorithm](self, "measurementAlgorithm");
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
      [v46 limitString:v57 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor splatOnly](self, "splatOnly")) {
        uint64_t v47 = @"YES";
      }
      else {
        uint64_t v47 = @"NO";
      }
      uint64_t v53 = v19;
      if (-[SUCoreDescriptor semiSplatEnabled](self, "semiSplatEnabled")) {
        uint64_t v48 = @"YES";
      }
      else {
        uint64_t v48 = @"NO";
      }
      if (!-[SUCoreDescriptor revoked](self, "revoked")) {
        unint64_t v35 = @"NO";
      }
      id v49 = (void *)MEMORY[0x189612760];
      v54 = -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
      [v54 humanReadableUpdateName];
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v49 limitString:v50 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v15 = (void *)[v53 initWithFormat:@"\n[>>>\n             descriptorType: %@\n     descriptorAudienceType: %@\n        preferredUpdateType: %@\n    humanReadableUpdateName: %@\n   humanReadableUpdateTitle: %@\n humanReadableUpdateVersion: %@\n  humanReadableMoreInfoLink: %@\n                 updateType: %@\n             productVersion: %@\n        productBuildVersion: %@\n             restoreVersion: %@\n  targetUpdateBridgeVersion: %@\n     targetUpdateSFRVersion: %@\n                releaseType: %@\n                releaseDate: %@\n          prerequisiteBuild: %@\n      prerequisiteOSVersion: %@\n               downloadSize: %llu\n     psusRequiredAssetsSize: %llu\n     psusOptionalAssetsSize: %llu\n             suDownloadSize: %llu\n             unarchivedSize: %llu\n            preparationSize: %llu\n           installationSize: %llu\n     totalRequiredFreeSpace: %llu\n                rampEnabled: %@\n           granularlyRamped: %@\n           mdmDelayInterval: %llu\n          autoUpdateEnabled: %@\n           hideInstallAlert: %@\n         containsSFRContent: %@\n       installAlertInterval: %llu\n allowAutoDownloadOnBattery: %@\n             disableSplombo: %@\n              setupCritical: %@\n            documentationID: %@\n          softwareUpdateURL: %@\n                measurement: %@\n       measurementAlgorithm: %@\n                  splatOnly: %@\n           semiSplatEnabled: %@\n                    revoked: %@\n  associatedSplatDescriptor: %@\n<<<]", v8, v112, v111, v110, v109, v108, v107, v106, v105, v104, v103, v102, v101, v100, v99, v98, v97, v80, v79, v78, v77, v76, v75, v73, v72, v71, v69, v68, v67, v96, v65, v63, v61, v59, v60, v58, v56, v55, v52, v47, v48, v35, v51];
    }

    else
    {
      BOOL v15 = (void *)[v19 initWithFormat:@"Unexpected descriptor type %@", v20];

      [MEMORY[0x189612778] sharedDiag];
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 trackAnomaly:@"DescriptorOverview" forReason:v15 withResult:8116 withError:0];
    }
  }

  return v15;
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 isEqualToString:@"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain"])
  {

LABEL_4:
    id v6 = objc_alloc(NSString);
    -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = (void *)[v6 initWithFormat:@"%@", v7];
    goto LABEL_11;
  }

  -[SUCoreDescriptor softwareUpdateAssetType](self, "softwareUpdateAssetType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:@"com.apple.MobileAsset.MobileSoftwareUpdate.MacUpdateBrain"];

  if (v5) {
    goto LABEL_4;
  }
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = objc_alloc(NSString);
  -[SUCoreDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = -[SUCoreDescriptor releaseType](self, "releaseType");
  uint64_t v13 = (void *)v12;
  uint64_t v14 = @"Customer";
  if (v12) {
    uint64_t v14 = (const __CFString *)v12;
  }
  if (v9) {
    uint64_t v15 = [v10 initWithFormat:@"%@ %@ (SplatCombo) (%@)", v7, v11, v14];
  }
  else {
    uint64_t v15 = [v10 initWithFormat:@"%@ %@ (%@)", v7, v11, v14];
  }
  unint64_t v8 = (void *)v15;

LABEL_11:
  return v8;
}

- (void)setPublisher:(id)a3
{
}

- (void)setProductSystemName:(id)a3
{
}

- (int64_t)descriptorType
{
  return self->_descriptorType;
}

- (void)setDescriptorType:(int64_t)a3
{
  self->_descriptorType = a3;
}

- (int64_t)descriptorAudienceType
{
  return self->_descriptorAudienceType;
}

- (void)setDescriptorAudienceType:(int64_t)a3
{
  self->_descriptorAudienceType = a3;
}

- (int64_t)preferredUpdateType
{
  return self->_preferredUpdateType;
}

- (void)setPreferredUpdateType:(int64_t)a3
{
  self->_preferredUpdateType = a3;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(int64_t)a3
{
  self->_updateType = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)uniqueBuildID
{
  return self->_uniqueBuildID;
}

- (void)setUniqueBuildID:(id)a3
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

- (MAAbsoluteAssetId)softwareUpdateAssetAbsoluteID
{
  return self->_softwareUpdateAssetAbsoluteID;
}

- (void)setSoftwareUpdateAssetAbsoluteID:(id)a3
{
}

- (MAAbsoluteAssetId)documentationAssetAbsoluteID
{
  return self->_documentationAssetAbsoluteID;
}

- (void)setDocumentationAssetAbsoluteID:(id)a3
{
}

- (NSString)softwareUpdateAssetPurpose
{
  return self->_softwareUpdateAssetPurpose;
}

- (void)setSoftwareUpdateAssetPurpose:(id)a3
{
}

- (NSString)documentationAssetPurpose
{
  return self->_documentationAssetPurpose;
}

- (void)setDocumentationAssetPurpose:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)productVersionExtra
{
  return self->_productVersionExtra;
}

- (void)setProductVersionExtra:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
}

- (NSString)targetUpdateBridgeVersion
{
  return self->_targetUpdateBridgeVersion;
}

- (void)setTargetUpdateBridgeVersion:(id)a3
{
}

- (NSString)targetUpdateSFRVersion
{
  return self->_targetUpdateSFRVersion;
}

- (void)setTargetUpdateSFRVersion:(id)a3
{
}

- (NSString)trainName
{
  return self->_trainName;
}

- (void)setTrainName:(id)a3
{
}

- (NSString)prerequisiteBuild
{
  return self->_prerequisiteBuild;
}

- (void)setPrerequisiteBuild:(id)a3
{
}

- (NSString)prerequisiteOSVersion
{
  return self->_prerequisiteOSVersion;
}

- (void)setPrerequisiteOSVersion:(id)a3
{
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (void)setSupportedDevices:(id)a3
{
}

- (void)setUnarchivedSize:(unint64_t)a3
{
  self->_unint64_t unarchivedSize = a3;
}

- (unint64_t)msuPrepareSize
{
  return self->_msuPrepareSize;
}

- (void)setMsuPrepareSize:(unint64_t)a3
{
  self->_msuPrepareSize = a3;
}

- (void)setInstallationSize:(unint64_t)a3
{
  self->_unint64_t installationSize = a3;
}

- (unint64_t)minimumSystemPartitionSize
{
  return self->_minimumSystemPartitionSize;
}

- (void)setMinimumSystemPartitionSize:(unint64_t)a3
{
  self->_minimumSystemPartitionSize = a3;
}

- (BOOL)streamingZipCapable
{
  return self->_streamingZipCapable;
}

- (void)setStreamingZipCapable:(BOOL)a3
{
  self->_streamingZipCapable = a3;
}

- (NSDictionary)systemPartitionPadding
{
  return self->_systemPartitionPadding;
}

- (void)setSystemPartitionPadding:(id)a3
{
}

- (unint64_t)preSUStagingRequiredSize
{
  return self->_preSUStagingRequiredSize;
}

- (void)setPreSUStagingRequiredSize:(unint64_t)a3
{
  self->_preSUStagingRequiredSize = a3;
}

- (unint64_t)preSUStagingOptionalSize
{
  return self->_preSUStagingOptionalSize;
}

- (void)setPreSUStagingOptionalSize:(unint64_t)a3
{
  self->_preSUStagingOptionalSize = a3;
}

- (unint64_t)suDownloadSize
{
  return self->_suDownloadSize;
}

- (void)setSuDownloadSize:(unint64_t)a3
{
  self->_suDownloadSize = a3;
}

- (BOOL)autoDownloadAllowableOverCellular
{
  return self->_autoDownloadAllowableOverCellular;
}

- (void)setAutoDownloadAllowableOverCellular:(BOOL)a3
{
  self->_autoDownloadAllowableOverCellular = a3;
}

- (BOOL)downloadAllowableOverCellular
{
  return self->_downloadAllowableOverCellular;
}

- (void)setDownloadAllowableOverCellular:(BOOL)a3
{
  self->_downloadAllowableOverCellular = a3;
}

- (BOOL)downloadable
{
  return self->_downloadable;
}

- (void)setDownloadable:(BOOL)a3
{
  self->_downloadable = a3;
}

- (BOOL)disableSiriVoiceDeletion
{
  return self->_disableSiriVoiceDeletion;
}

- (void)setDisableSiriVoiceDeletion:(BOOL)a3
{
  self->_disableSiriVoiceDeletion = a3;
}

- (BOOL)disableCDLevel4
{
  return self->_disableCDLevel4;
}

- (void)setDisableCDLevel4:(BOOL)a3
{
  self->_disableCDLevel4 = a3;
}

- (BOOL)disableAppDemotion
{
  return self->_disableAppDemotion;
}

- (void)setDisableAppDemotion:(BOOL)a3
{
  self->_disableAppDemotion = a3;
}

- (BOOL)disableInstallTonight
{
  return self->_disableInstallTonight;
}

- (void)setDisableInstallTonight:(BOOL)a3
{
  self->_disableInstallTonight = a3;
}

- (BOOL)forcePasscodeRequired
{
  return self->_forcePasscodeRequired;
}

- (void)setForcePasscodeRequired:(BOOL)a3
{
  self->_forcePasscodeRequired = a3;
}

- (BOOL)rampEnabled
{
  return self->_rampEnabled;
}

- (void)setRampEnabled:(BOOL)a3
{
  self->_rampEnabled = a3;
}

- (BOOL)granularlyRamped
{
  return self->_granularlyRamped;
}

- (void)setGranularlyRamped:(BOOL)a3
{
  self->_granularlyRamped = a3;
}

- (unint64_t)mdmDelayInterval
{
  return self->_mdmDelayInterval;
}

- (void)setMdmDelayInterval:(unint64_t)a3
{
  self->_mdmDelayInterval = a3;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  self->_autoUpdateEnabled = a3;
}

- (int64_t)hideInstallAlert
{
  return self->_hideInstallAlert;
}

- (void)setHideInstallAlert:(int64_t)a3
{
  self->_hideInstallAlert = a3;
}

- (BOOL)containsSFRContent
{
  return self->_containsSFRContent;
}

- (void)setContainsSFRContent:(BOOL)a3
{
  self->_containsSFRContent = a3;
}

- (unint64_t)installAlertInterval
{
  return self->_installAlertInterval;
}

- (void)setInstallAlertInterval:(unint64_t)a3
{
  self->_installAlertInterval = a3;
}

- (BOOL)allowAutoDownloadOnBattery
{
  return self->_allowAutoDownloadOnBattery;
}

- (void)setAllowAutoDownloadOnBattery:(BOOL)a3
{
  self->_allowAutoDownloadOnBattery = a3;
}

- (unint64_t)autoDownloadOnBatteryDelay
{
  return self->_autoDownloadOnBatteryDelay;
}

- (void)setAutoDownloadOnBatteryDelay:(unint64_t)a3
{
  self->_autoDownloadOnBatteryDelay = a3;
}

- (unint64_t)autoDownloadOnBatteryMinBattery
{
  return self->_autoDownloadOnBatteryMinBattery;
}

- (void)setAutoDownloadOnBatteryMinBattery:(unint64_t)a3
{
  self->_autoDownloadOnBatteryMinBattery = a3;
}

- (NSString)setupCritical
{
  return self->_setupCritical;
}

- (void)setSetupCritical:(id)a3
{
}

- (BOOL)criticalCellularOverride
{
  return self->_criticalCellularOverride;
}

- (void)setCriticalCellularOverride:(BOOL)a3
{
  self->_criticalCellularOverride = a3;
}

- (BOOL)criticalOutOfBoxOnly
{
  return self->_criticalOutOfBoxOnly;
}

- (void)setCriticalOutOfBoxOnly:(BOOL)a3
{
  self->_criticalOutOfBoxOnly = a3;
}

- (NSString)lastEmergencyBuild
{
  return self->_lastEmergencyBuild;
}

- (void)setLastEmergencyBuild:(id)a3
{
}

- (NSString)lastEmergencyOSVersion
{
  return self->_lastEmergencyOSVersion;
}

- (void)setLastEmergencyOSVersion:(id)a3
{
}

- (BOOL)mandatoryUpdateEligible
{
  return self->_mandatoryUpdateEligible;
}

- (void)setMandatoryUpdateEligible:(BOOL)a3
{
  self->_mandatoryUpdateEligible = a3;
}

- (NSString)mandatoryUpdateVersionMin
{
  return self->_mandatoryUpdateVersionMin;
}

- (void)setMandatoryUpdateVersionMin:(id)a3
{
}

- (NSString)mandatoryUpdateVersionMax
{
  return self->_mandatoryUpdateVersionMax;
}

- (void)setMandatoryUpdateVersionMax:(id)a3
{
}

- (BOOL)mandatoryUpdateOptional
{
  return self->_mandatoryUpdateOptional;
}

- (void)setMandatoryUpdateOptional:(BOOL)a3
{
  self->_mandatoryUpdateOptional = a3;
}

- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox
{
  return self->_mandatoryUpdateRestrictedToOutOfTheBox;
}

- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3
{
  self->_mandatoryUpdateRestrictedToOutOfTheBox = a3;
}

- (BOOL)oneShotBuddyDisabled
{
  return self->_oneShotBuddyDisabled;
}

- (NSArray)oneShotBuddyDisabledBuilds
{
  return self->_oneShotBuddyDisabledBuilds;
}

- (BOOL)criticalUpdate
{
  return self->_criticalUpdate;
}

- (void)setCriticalUpdate:(BOOL)a3
{
  self->_criticalUpdate = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (unint64_t)autoInstallDelay
{
  return self->_autoInstallDelay;
}

- (void)setAutoInstallDelay:(unint64_t)a3
{
  self->_autoInstallDelay = a3;
}

- (BOOL)notifyAfter
{
  return self->_notifyAfter;
}

- (void)setNotifyAfter:(BOOL)a3
{
  self->_notifyAfter = a3;
}

- (NSString)minimumBridgeVersion
{
  return self->_minimumBridgeVersion;
}

- (void)setMinimumBridgeVersion:(id)a3
{
}

- (BOOL)disableRosettaUpdates
{
  return self->_disableRosettaUpdates;
}

- (void)setDisableRosettaUpdates:(BOOL)a3
{
  self->_disableRosettaUpdates = a3;
}

- (BOOL)disableRecoveryOSUpdates
{
  return self->_disableRecoveryOSUpdates;
}

- (BOOL)requireInstallAssistantUpdate
{
  return self->_requireInstallAssistantUpdate;
}

- (NSData)sepDigest
{
  return self->_sepDigest;
}

- (void)setSepDigest:(id)a3
{
}

- (NSData)sepTBMDigests
{
  return self->_sepTBMDigests;
}

- (void)setSepTBMDigests:(id)a3
{
}

- (NSData)rsepDigest
{
  return self->_rsepDigest;
}

- (void)setRsepDigest:(id)a3
{
}

- (NSData)rsepTBMDigests
{
  return self->_rsepTBMDigests;
}

- (void)setRsepTBMDigests:(id)a3
{
}

- (NSString)documentationID
{
  return self->_documentationID;
}

- (void)setDocumentationID:(id)a3
{
}

- (SUCoreDocumentation)documentation
{
  return (SUCoreDocumentation *)objc_getProperty(self, a2, 472LL, 1);
}

- (void)setDocumentation:(id)a3
{
}

- (NSString)softwareUpdateURL
{
  return self->_softwareUpdateURL;
}

- (void)setSoftwareUpdateURL:(id)a3
{
}

- (NSData)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
}

- (NSString)measurementAlgorithm
{
  return self->_measurementAlgorithm;
}

- (void)setMeasurementAlgorithm:(id)a3
{
}

- (SUCoreMAIdentifier)softwareUpdateAssetIdentifier
{
  return self->_softwareUpdateAssetIdentifier;
}

- (void)setSoftwareUpdateAssetIdentifier:(id)a3
{
}

- (SUCoreMAIdentifier)documentationAssetIdentifier
{
  return self->_documentationAssetIdentifier;
}

- (void)setDocumentationAssetIdentifier:(id)a3
{
}

- (BOOL)promoteAlternateUpdate
{
  return self->_promoteAlternateUpdate;
}

- (void)setPromoteAlternateUpdate:(BOOL)a3
{
  self->_promoteAlternateUpdate = a3;
}

- (BOOL)enableAlternateAssetAudience
{
  return self->_enableAlternateAssetAudience;
}

- (void)setEnableAlternateAssetAudience:(BOOL)a3
{
  self->_enableAlternateAssetAudience = a3;
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
}

- (NSString)assetAudienceUUID
{
  return self->_assetAudienceUUID;
}

- (void)setAssetAudienceUUID:(id)a3
{
}

- (NSString)updateBrainPath
{
  return self->_updateBrainPath;
}

- (void)setUpdateBrainPath:(id)a3
{
}

- (NSString)updateBundlePath
{
  return self->_updateBundlePath;
}

- (void)setUpdateBundlePath:(id)a3
{
}

- (NSDictionary)bundleAttributes
{
  return self->_bundleAttributes;
}

- (void)setBundleAttributes:(id)a3
{
}

- (BOOL)splatOnly
{
  return self->_splatOnly;
}

- (BOOL)semiSplatEnabled
{
  return self->_semiSplatEnabled;
}

- (NSArray)semiSplatMustQuitApps
{
  return self->_semiSplatMustQuitApps;
}

- (BOOL)revoked
{
  return self->_revoked;
}

- (BOOL)semiSplatRestartNow
{
  return self->_semiSplatRestartNow;
}

- (BOOL)disableSplatCombo
{
  return self->_disableSplatCombo;
}

- (void)setDisableSplatCombo:(BOOL)a3
{
  self->_disableSplatCombo = a3;
}

- (SUCoreDescriptor)associatedSplatDescriptor
{
  return self->_associatedSplatDescriptor;
}

- (void)setAssociatedSplatDescriptor:(id)a3
{
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

- (NSString)rawProductVersion
{
  return self->_rawProductVersion;
}

- (void)setRawProductVersion:(id)a3
{
}

- (MAAsset)softwareUpdateAsset
{
  return self->_softwareUpdateAsset;
}

- (void)setSoftwareUpdateAsset:(id)a3
{
}

- (MAAsset)documentationAsset
{
  return self->_documentationAsset;
}

- (void)setDocumentationAsset:(id)a3
{
}

- (void).cxx_destruct
{
}

@end