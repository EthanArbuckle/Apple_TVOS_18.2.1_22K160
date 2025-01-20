@interface SUControllerConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)_loadBooleanFromDefaults:(id)a3 usingDefault:(BOOL)a4 isStoredInverted:(BOOL)a5;
- (BOOL)_runningOnAppleTV;
- (BOOL)_storeBooleanToDefaults:(id)a3 toValue:(BOOL)a4 isStoredInverted:(BOOL)a5;
- (BOOL)allowSameVersionUpdates;
- (BOOL)autoAcceptTermsAndConditions;
- (BOOL)downloadDocAsset;
- (BOOL)expiredSpecifiedAsExpired;
- (BOOL)hideIndicationMayReboot;
- (BOOL)ignoreRamping;
- (BOOL)installWindowAsDeltas;
- (BOOL)internalDefaultsAsExternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)performAutoDownloadAndPrepare;
- (BOOL)performAutoInstall;
- (BOOL)performAutoScan;
- (BOOL)requirePrepareSize;
- (BOOL)restrictToFullReplacement;
- (BOOL)supervisedMDM;
- (BOOL)useSUCore;
- (BOOL)useSpecifiedInstallWindow;
- (BOOL)vpnOnDemandAsInternal;
- (NSString)asReleaseType;
- (NSString)installPhaseOSBackgroundImagePath;
- (NSString)prerequisiteBuildVersion;
- (NSString)prerequisiteProductVersion;
- (NSString)requestedPMV;
- (NSString)simulatorCommandsFile;
- (NSString)updateMetricContext;
- (SUControllerConfig)init;
- (SUControllerConfig)initWithCoder:(id)a3;
- (id)_copyStringFromDefaults:(id)a3 usingDefault:(id)a4;
- (id)_storeStringToDefaults:(id)a3 toValue:(id)a4;
- (id)changeSummary:(int64_t)a3;
- (id)copy;
- (id)description;
- (id)initFromDefaults:(int64_t)a3;
- (id)summary;
- (int64_t)_decodeInteger:(id)a3 forKey:(id)a4 withLimit:(int64_t)a5;
- (int64_t)_limitedInteger:(id)a3 checkingValue:(int64_t)a4 forKey:(id)a5 withLimit:(int64_t)a6;
- (int64_t)_loadBooleanFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(BOOL)a5 internalDefault:(BOOL)a6 isStoredInverted:(BOOL)a7;
- (int64_t)_loadIntegerFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(int64_t)a5 internalDefault:(int64_t)a6 withLimit:(int64_t)a7;
- (int64_t)_loadIntegerFromDefaults:(id)a3 usingDefault:(int64_t)a4 withLimit:(int64_t)a5;
- (int64_t)_storeIntegerToDefaults:(id)a3 toValue:(int64_t)a4;
- (int64_t)autoActivityCheckPeriod;
- (int64_t)autoInstallForceMaxWait;
- (int64_t)autoInstallWindowBeginHour;
- (int64_t)autoInstallWindowBeginMinute;
- (int64_t)autoInstallWindowEndHour;
- (int64_t)autoInstallWindowEndMinute;
- (int64_t)delayPeriod;
- (int64_t)preservePreparedMaxAttempts;
- (void)encodeWithCoder:(id)a3;
- (void)modify:(id)a3 usingMask:(int64_t)a4;
- (void)setAllowSameVersionUpdates:(BOOL)a3;
- (void)setAsReleaseType:(id)a3;
- (void)setAutoAcceptTermsAndConditions:(BOOL)a3;
- (void)setAutoActivityCheckPeriod:(int64_t)a3;
- (void)setAutoInstallForceMaxWait:(int64_t)a3;
- (void)setAutoInstallWindowBeginHour:(int64_t)a3;
- (void)setAutoInstallWindowBeginMinute:(int64_t)a3;
- (void)setAutoInstallWindowEndHour:(int64_t)a3;
- (void)setAutoInstallWindowEndMinute:(int64_t)a3;
- (void)setDelayPeriod:(int64_t)a3;
- (void)setDownloadDocAsset:(BOOL)a3;
- (void)setExpiredSpecifiedAsExpired:(BOOL)a3;
- (void)setHideIndicationMayReboot:(BOOL)a3;
- (void)setIgnoreRamping:(BOOL)a3;
- (void)setInstallPhaseOSBackgroundImagePath:(id)a3;
- (void)setInstallWindowAsDeltas:(BOOL)a3;
- (void)setInternalDefaultsAsExternal:(BOOL)a3;
- (void)setPerformAutoDownloadAndPrepare:(BOOL)a3;
- (void)setPerformAutoInstall:(BOOL)a3;
- (void)setPerformAutoScan:(BOOL)a3;
- (void)setPrerequisiteBuildVersion:(id)a3;
- (void)setPrerequisiteProductVersion:(id)a3;
- (void)setPreservePreparedMaxAttempts:(int64_t)a3;
- (void)setRequestedPMV:(id)a3;
- (void)setRequirePrepareSize:(BOOL)a3;
- (void)setRestrictToFullReplacement:(BOOL)a3;
- (void)setSimulatorCommandsFile:(id)a3;
- (void)setSupervisedMDM:(BOOL)a3;
- (void)setUpdateMetricContext:(id)a3;
- (void)setUseSUCore:(BOOL)a3;
- (void)setUseSpecifiedInstallWindow:(BOOL)a3;
- (void)setVpnOnDemandAsInternal:(BOOL)a3;
@end

@implementation SUControllerConfig

- (SUControllerConfig)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SUControllerConfig;
  v2 = -[SUControllerConfig init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_useSUCore = 16842753;
    v2->_performAutoInstall = 0;
    v2->_autoAcceptTermsAndConditions = sub_1000384C4() ^ 1;
    *(_OWORD *)&v3->_autoActivityCheckPeriod = xmmword_100049D00;
    *(_OWORD *)&v3->_autoInstallWindowBeginHour = xmmword_100049D10;
    *(_OWORD *)&v3->_autoInstallWindowEndHour = xmmword_100049D20;
    *(_WORD *)&v3->_downloadDocAsset = 0;
    v3->_supervisedMDM = 0;
    requestedPMV = v3->_requestedPMV;
    v3->_requestedPMV = 0LL;

    v3->_delayPeriod = 0LL;
    installPhaseOSBackgroundImagePath = v3->_installPhaseOSBackgroundImagePath;
    v3->_installPhaseOSBackgroundImagePath = 0LL;

    *(void *)&v3->_restrictToFullReplacement = 0LL;
    updateMetricContext = v3->_updateMetricContext;
    v3->_updateMetricContext = 0LL;

    prerequisiteBuildVersion = v3->_prerequisiteBuildVersion;
    v3->_prerequisiteBuildVersion = 0LL;

    prerequisiteProductVersion = v3->_prerequisiteProductVersion;
    v3->_prerequisiteProductVersion = 0LL;

    asReleaseType = v3->_asReleaseType;
    v3->_asReleaseType = 0LL;

    simulatorCommandsFile = v3->_simulatorCommandsFile;
    v3->_simulatorCommandsFile = 0LL;
  }

  return v3;
}

- (id)initFromDefaults:(int64_t)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SUControllerConfig;
  v4 = -[SUControllerConfig init](&v21, "init");
  v5 = v4;
  if (v4)
  {
    v4->_internalDefaultsAsExternal = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v4,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUInternalDefaultsAsExternal",  0LL,  0LL);
    v5->_useSUCore = 1;
    v5->_vpnOnDemandAsInternal = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUVPNOnDemandAsInternal",  0LL,  0LL);
    *(_WORD *)&v5->_performAutoScan = 257;
    v5->_performAutoInstall = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUDisableAutoInstall",  0LL,  1LL);
    v5->_autoAcceptTermsAndConditions = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUAutoAcceptTermsAndConditions",  sub_1000384C4() ^ 1,  0LL);
    v5->_autoActivityCheckPeriod = -[SUControllerConfig _loadIntegerFromDefaults:releaseType:externalDefault:internalDefault:withLimit:]( v5,  "_loadIntegerFromDefaults:releaseType:externalDefault:internalDefault:withLimit:",  @"SUAutoActivityCheckPeriod",  a3,  10080LL,  240LL,  44640LL);
    v5->_autoInstallForceMaxWait = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:]( v5,  "_loadIntegerFromDefaults:usingDefault:withLimit:",  @"SUAutoInstallForceMaxWait",  20LL,  1440LL);
    v5->_autoInstallWindowBeginHour = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:]( v5,  "_loadIntegerFromDefaults:usingDefault:withLimit:",  @"SUAutoInstallWindowBeginHour",  2LL,  23LL);
    v5->_autoInstallWindowBeginMinute = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:]( v5,  "_loadIntegerFromDefaults:usingDefault:withLimit:",  @"SUAutoInstallWindowBeginMinute",  0LL,  59LL);
    v5->_autoInstallWindowEndHour = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:]( v5,  "_loadIntegerFromDefaults:usingDefault:withLimit:",  @"SUAutoInstallWindowEndHour",  4LL,  23LL);
    v5->_autoInstallWindowEndMinute = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:]( v5,  "_loadIntegerFromDefaults:usingDefault:withLimit:",  @"SUAutoInstallWindowEndMinute",  0LL,  59LL);
    v5->_downloadDocAsset = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUDownloadDocAsset",  0LL,  0LL);
    v5->_ignoreRamping = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUIgnoreRamping",  0LL,  0LL);
    v5->_supervisedMDM = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"supervisedMDM",  0LL,  0LL);
    v6 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:]( v5,  "_copyStringFromDefaults:usingDefault:",  @"requestedPMV",  0LL);
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = v6;

    v5->_delayPeriod = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:]( v5,  "_loadIntegerFromDefaults:usingDefault:withLimit:",  @"delayPeriod",  0LL,  90LL);
    v8 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:]( v5,  "_copyStringFromDefaults:usingDefault:",  @"installPhaseOSBackgroundImagePath",  0LL);
    installPhaseOSBackgroundImagePath = v5->_installPhaseOSBackgroundImagePath;
    v5->_installPhaseOSBackgroundImagePath = v8;

    v5->_restrictToFullReplacement = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SURestrictToFullReplacement",  0LL,  0LL);
    v5->_allowSameVersionUpdates = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUAllowSameVersionUpdates",  0LL,  0LL);
    v10 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:]( v5,  "_copyStringFromDefaults:usingDefault:",  @"SUUpdateMetricContext",  0LL);
    updateMetricContext = v5->_updateMetricContext;
    v5->_updateMetricContext = v10;

    objc_super v12 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:]( v5,  "_copyStringFromDefaults:usingDefault:",  @"SUPrerequisiteBuildVersion",  0LL);
    prerequisiteBuildVersion = v5->_prerequisiteBuildVersion;
    v5->_prerequisiteBuildVersion = v12;

    v14 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:]( v5,  "_copyStringFromDefaults:usingDefault:",  @"SUPrerequisiteProductVersion",  0LL);
    prerequisiteProductVersion = v5->_prerequisiteProductVersion;
    v5->_prerequisiteProductVersion = v14;

    v16 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:]( v5,  "_copyStringFromDefaults:usingDefault:",  @"SUAsReleaseType",  0LL);
    asReleaseType = v5->_asReleaseType;
    v5->_asReleaseType = v16;

    v18 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:]( v5,  "_copyStringFromDefaults:usingDefault:",  @"SUSimulatorCommandsFile",  0LL);
    simulatorCommandsFile = v5->_simulatorCommandsFile;
    v5->_simulatorCommandsFile = v18;

    v5->_useSpecifiedInstallWindow = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUUseSpecifiedInstallWindow",  0LL,  0LL);
    v5->_expiredSpecifiedAsExpired = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUExpiredSpecifiedAsExpired",  0LL,  0LL);
    v5->_hideIndicationMayReboot = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUHideIndicationMayReboot",  0LL,  0LL);
    v5->_requirePrepareSize = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SURequirePrepareSize",  0LL,  0LL);
    v5->_installWindowAsDeltas = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:]( v5,  "_loadBooleanFromDefaults:usingDefault:isStoredInverted:",  @"SUInstallWindowAsDeltas",  0LL,  0LL);
  }

  return v5;
}

- (SUControllerConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SUControllerConfig;
  v5 = -[SUControllerConfig init](&v30, "init");
  v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = 1;
    v5->_useSUCore = 1;
    v5->_vpnOnDemandAsInternal = [v4 decodeBoolForKey:@"vpnOnDemandAsInternal"];
    if (-[SUControllerConfig _runningOnAppleTV](v6, "_runningOnAppleTV")) {
      unsigned __int8 v7 = [v4 decodeBoolForKey:@"performAutoScan"];
    }
    v6->_performAutoScan = v7;
    v6->_performAutoDownloadAndPrepare = [v4 decodeBoolForKey:@"performAutoDownloadAndPrepare"];
    v6->_performAutoInstall = [v4 decodeBoolForKey:@"performAutoInstall"];
    v6->_autoAcceptTermsAndConditions = [v4 decodeBoolForKey:@"autoAcceptTermsAndConditions"];
    v6->_autoActivityCheckPeriod = -[SUControllerConfig _decodeInteger:forKey:withLimit:]( v6,  "_decodeInteger:forKey:withLimit:",  v4,  @"autoActivityCheckPeriod",  44640LL);
    v6->_autoInstallForceMaxWait = -[SUControllerConfig _decodeInteger:forKey:withLimit:]( v6,  "_decodeInteger:forKey:withLimit:",  v4,  @"autoInstallForceMaxWait",  1440LL);
    v6->_autoInstallWindowBeginHour = -[SUControllerConfig _decodeInteger:forKey:withLimit:]( v6,  "_decodeInteger:forKey:withLimit:",  v4,  @"autoInstallWindowBeginHour",  23LL);
    v6->_autoInstallWindowBeginMinute = -[SUControllerConfig _decodeInteger:forKey:withLimit:]( v6,  "_decodeInteger:forKey:withLimit:",  v4,  @"autoInstallWindowBeginMinute",  59LL);
    v6->_autoInstallWindowEndHour = -[SUControllerConfig _decodeInteger:forKey:withLimit:]( v6,  "_decodeInteger:forKey:withLimit:",  v4,  @"autoInstallWindowEndHour",  23LL);
    v6->_autoInstallWindowEndMinute = -[SUControllerConfig _decodeInteger:forKey:withLimit:]( v6,  "_decodeInteger:forKey:withLimit:",  v4,  @"autoInstallWindowEndMinute",  59LL);
    v6->_downloadDocAsset = [v4 decodeBoolForKey:@"downloadDocAsset"];
    v6->_ignoreRamping = [v4 decodeBoolForKey:@"ignoreRamping"];
    v6->_supervisedMDM = [v4 decodeBoolForKey:@"supervisedMDM"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"requestedPMV"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    requestedPMV = v6->_requestedPMV;
    v6->_requestedPMV = (NSString *)v9;

    v6->_delayPeriod = -[SUControllerConfig _decodeInteger:forKey:withLimit:]( v6,  "_decodeInteger:forKey:withLimit:",  v4,  @"delayPeriod",  90LL);
    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"installPhaseOSBackgroundImagePath"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    installPhaseOSBackgroundImagePath = v6->_installPhaseOSBackgroundImagePath;
    v6->_installPhaseOSBackgroundImagePath = (NSString *)v12;

    v6->_restrictToFullReplacement = [v4 decodeBoolForKey:@"restrictToFullReplacement"];
    v6->_allowSameVersionUpdates = [v4 decodeBoolForKey:@"allowSameVersionUpdates"];
    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"updateMetricContext"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    updateMetricContext = v6->_updateMetricContext;
    v6->_updateMetricContext = (NSString *)v15;

    id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"prerequisiteBuildVersion"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    prerequisiteBuildVersion = v6->_prerequisiteBuildVersion;
    v6->_prerequisiteBuildVersion = (NSString *)v18;

    id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"prerequisiteProductVersion"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    prerequisiteProductVersion = v6->_prerequisiteProductVersion;
    v6->_prerequisiteProductVersion = (NSString *)v21;

    id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"asReleaseType"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    asReleaseType = v6->_asReleaseType;
    v6->_asReleaseType = (NSString *)v24;

    id v26 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"simulatorCommandsFile"];
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    simulatorCommandsFile = v6->_simulatorCommandsFile;
    v6->_simulatorCommandsFile = (NSString *)v27;

    v6->_useSpecifiedInstallWindow = [v4 decodeBoolForKey:@"useSpecifiedInstallWindow"];
    v6->_expiredSpecifiedAsExpired = [v4 decodeBoolForKey:@"expiredSpecifiedAsExpired"];
    v6->_hideIndicationMayReboot = [v4 decodeBoolForKey:@"hideIndicationMayReboot"];
    v6->_internalDefaultsAsExternal = [v4 decodeBoolForKey:@"internalDefaultsAsExternal"];
    v6->_requirePrepareSize = [v4 decodeBoolForKey:@"requirePrepareSize"];
    v6->_installWindowAsDeltas = [v4 decodeBoolForKey:@"installWindowAsDeltas"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig useSUCore](self, "useSUCore"), @"useSUCore");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal"),  @"vpnOnDemandAsInternal");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig performAutoScan](self, "performAutoScan"),  @"performAutoScan");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare"),  @"performAutoDownloadAndPrepare");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig performAutoInstall](self, "performAutoInstall"),  @"performAutoInstall");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions"),  @"autoAcceptTermsAndConditions");
  objc_msgSend( v11,  "encodeInteger:forKey:",  -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod"),  @"autoActivityCheckPeriod");
  objc_msgSend( v11,  "encodeInteger:forKey:",  -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait"),  @"autoInstallForceMaxWait");
  objc_msgSend( v11,  "encodeInteger:forKey:",  -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour"),  @"autoInstallWindowBeginHour");
  objc_msgSend( v11,  "encodeInteger:forKey:",  -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute"),  @"autoInstallWindowBeginMinute");
  objc_msgSend( v11,  "encodeInteger:forKey:",  -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour"),  @"autoInstallWindowEndHour");
  objc_msgSend( v11,  "encodeInteger:forKey:",  -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute"),  @"autoInstallWindowEndMinute");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig downloadDocAsset](self, "downloadDocAsset"),  @"downloadDocAsset");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig ignoreRamping](self, "ignoreRamping"),  @"ignoreRamping");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig supervisedMDM](self, "supervisedMDM"),  @"supervisedMDM");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig requestedPMV](self, "requestedPMV"));
  [v11 encodeObject:v4 forKey:@"requestedPMV"];

  objc_msgSend( v11,  "encodeInteger:forKey:",  -[SUControllerConfig delayPeriod](self, "delayPeriod"),  @"delayPeriod");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath"));
  [v11 encodeObject:v5 forKey:@"installPhaseOSBackgroundImagePath"];

  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement"),  @"restrictToFullReplacement");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates"),  @"allowSameVersionUpdates");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig updateMetricContext](self, "updateMetricContext"));
  [v11 encodeObject:v6 forKey:@"updateMetricContext"];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion"));
  [v11 encodeObject:v7 forKey:@"prerequisiteBuildVersion"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion"));
  [v11 encodeObject:v8 forKey:@"prerequisiteProductVersion"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig asReleaseType](self, "asReleaseType"));
  [v11 encodeObject:v9 forKey:@"asReleaseType"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile"));
  [v11 encodeObject:v10 forKey:@"simulatorCommandsFile"];

  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow"),  @"useSpecifiedInstallWindow");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired"),  @"expiredSpecifiedAsExpired");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot"),  @"hideIndicationMayReboot");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig internalDefaultsAsExternal](self, "internalDefaultsAsExternal"),  @"internalDefaultsAsExternal");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig requirePrepareSize](self, "requirePrepareSize"),  @"requirePrepareSize");
  objc_msgSend( v11,  "encodeBool:forKey:",  -[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas"),  @"installWindowAsDeltas");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  0LL));
  id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___SUControllerConfig),  v2,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)modify:(id)a3 usingMask:(int64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = v6;
  v35 = v6;
  if ((v4 & 0x10000) != 0)
  {
    unsigned __int8 v8 = [v6 useSUCore];
    unsigned __int8 v7 = v35;
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
      v10 = objc_alloc(&OBJC_CLASS___NSString);
      unsigned int v11 = [v35 useSUCore];
      uint64_t v12 = @"NO";
      if (v11) {
        uint64_t v12 = @"YES";
      }
      v13 = -[NSString initWithFormat:]( v10,  "initWithFormat:",  @"attempt to set %@ to %@ (only supported value is %@ [as of 4.2.1])",  @"useSUCore",  v12,  @"YES");
      [v9 trackAnomaly:@"[CONFIG]" forReason:v13 withResult:8102 withError:0];

      unsigned __int8 v7 = v35;
    }
  }

  if ((v4 & 0x8000000) != 0)
  {
    -[SUControllerConfig setVpnOnDemandAsInternal:]( self,  "setVpnOnDemandAsInternal:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUVPNOnDemandAsInternal",  [v7 vpnOnDemandAsInternal],  0));
    unsigned __int8 v7 = v35;
  }

  if ((v4 & 1) != 0)
  {
    unsigned int v14 = -[SUControllerConfig _runningOnAppleTV](self, "_runningOnAppleTV");
    id v15 = [v35 performAutoScan];
    if (v14)
    {
      -[SUControllerConfig setPerformAutoScan:]( self,  "setPerformAutoScan:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUDisableAutoScan",  v15,  1LL));
    }

    else
    {
      unsigned __int8 v7 = v35;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
      id v17 = objc_alloc(&OBJC_CLASS___NSString);
      unsigned int v18 = [v35 performAutoScan];
      v19 = @"NO";
      if (v18) {
        v19 = @"YES";
      }
      id v20 = -[NSString initWithFormat:]( v17,  "initWithFormat:",  @"attempt to set %@ to %@ (only supported value is %@ [as of 4.2.1])",  @"performAutoScan",  v19,  @"YES");
      [v16 trackAnomaly:@"[CONFIG]" forReason:v20 withResult:8102 withError:0];
    }

    unsigned __int8 v7 = v35;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SUControllerConfig useSUCore](self, "useSUCore");
  unsigned int v6 = -[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal");
  unsigned int v7 = -[SUControllerConfig performAutoScan](self, "performAutoScan");
  unsigned int v8 = -[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare");
  unsigned int v9 = -[SUControllerConfig performAutoInstall](self, "performAutoInstall");
  unsigned int v10 = -[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions");
  id v11 = -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod");
  if (v11 != [v4 autoActivityCheckPeriod]) {
    goto LABEL_16;
  }
  id v12 = -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait");
  if (v12 != [v4 autoInstallForceMaxWait]) {
    goto LABEL_16;
  }
  id v13 = -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour");
  if (v13 == [v4 autoInstallWindowBeginHour]
    && (id v14 = -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute"),
        v14 == [v4 autoInstallWindowBeginMinute])
    && (id v15 = -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour"),
        v15 == [v4 autoInstallWindowEndHour])
    && (id v16 = -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute"),
        v16 == [v4 autoInstallWindowEndMinute])
    && (unsigned int v17 = -[SUControllerConfig downloadDocAsset](self, "downloadDocAsset"),
        v17 == [v4 downloadDocAsset])
    && (unsigned int v18 = -[SUControllerConfig ignoreRamping](self, "ignoreRamping"),
        v18 == [v4 ignoreRamping])
    && (unsigned int v19 = -[SUControllerConfig supervisedMDM](self, "supervisedMDM"),
        v19 == [v4 supervisedMDM]))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig requestedPMV](self, "requestedPMV"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 requestedPMV]);
    if (sub_100038458(v22, v23)
      && (id v24 = -[SUControllerConfig delayPeriod](self, "delayPeriod"), v24 == [v4 delayPeriod]))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 installPhaseOSBackgroundImagePath]);
      unsigned int v27 = -[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement");
      unsigned int v28 = -[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates");
      if (v28 == [v4 allowSameVersionUpdates]
        && (unsigned int v29 = -[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow"),
            v29 == [v4 useSpecifiedInstallWindow])
        && (unsigned int v30 = -[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired"),
            v30 == [v4 expiredSpecifiedAsExpired])
        && (unsigned int v31 = -[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot"),
            v31 == [v4 hideIndicationMayReboot])
        && (unsigned int v32 = -[SUControllerConfig internalDefaultsAsExternal](self, "internalDefaultsAsExternal"),
            v32 == [v4 internalDefaultsAsExternal])
        && (unsigned int v33 = -[SUControllerConfig requirePrepareSize](self, "requirePrepareSize"),
            v33 == [v4 requirePrepareSize])
        && (unsigned int v34 = -[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas"),
            v34 == [v4 installWindowAsDeltas]))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig updateMetricContext](self, "updateMetricContext"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v4 updateMetricContext]);
        if (sub_100038458(v35, v36))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion"));
          v38 = (void *)objc_claimAutoreleasedReturnValue([v4 prerequisiteBuildVersion]);
          v47 = v37;
          if (sub_100038458(v37, v38))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion"));
            v45 = (void *)objc_claimAutoreleasedReturnValue([v4 prerequisiteProductVersion]);
            v46 = v39;
            if (sub_100038458(v39, v45))
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig asReleaseType](self, "asReleaseType"));
              v43 = (void *)objc_claimAutoreleasedReturnValue([v4 asReleaseType]);
              v44 = v40;
              if (sub_100038458(v40, v43))
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile"));
                v41 = (void *)objc_claimAutoreleasedReturnValue([v4 simulatorCommandsFile]);
                char v20 = sub_100038458(v42, v41);
              }

              else
              {
                char v20 = 0;
              }
            }

            else
            {
              char v20 = 0;
            }
          }

          else
          {
            char v20 = 0;
          }
        }

        else
        {
          char v20 = 0;
        }
      }

      else
      {
LABEL_29:
        char v20 = 0;
      }
    }

    else
    {
      char v20 = 0;
    }
  }

  else
  {
LABEL_16:
    char v20 = 0;
  }

  return v20;
}

- (id)description
{
  if (-[SUControllerConfig useSUCore](self, "useSUCore")) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  v59 = v3;
  if (-[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v58 = v4;
  if (-[SUControllerConfig performAutoScan](self, "performAutoScan")) {
    unsigned int v5 = @"YES";
  }
  else {
    unsigned int v5 = @"NO";
  }
  v56 = v5;
  if (-[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare")) {
    unsigned int v6 = @"YES";
  }
  else {
    unsigned int v6 = @"NO";
  }
  v55 = v6;
  if (-[SUControllerConfig performAutoInstall](self, "performAutoInstall")) {
    unsigned int v7 = @"YES";
  }
  else {
    unsigned int v7 = @"NO";
  }
  v54 = v7;
  if (-[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions")) {
    unsigned int v8 = @"YES";
  }
  else {
    unsigned int v8 = @"NO";
  }
  v52 = v8;
  int64_t v51 = -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod");
  int64_t v49 = -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait");
  int64_t v48 = -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour");
  int64_t v47 = -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute");
  int64_t v46 = -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour");
  int64_t v45 = -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute");
  if (-[SUControllerConfig downloadDocAsset](self, "downloadDocAsset")) {
    unsigned int v9 = @"YES";
  }
  else {
    unsigned int v9 = @"NO";
  }
  v43 = v9;
  if (-[SUControllerConfig ignoreRamping](self, "ignoreRamping")) {
    unsigned int v10 = @"YES";
  }
  else {
    unsigned int v10 = @"NO";
  }
  v42 = v10;
  if (-[SUControllerConfig supervisedMDM](self, "supervisedMDM")) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  v40 = v11;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SUControllerConfig requestedPMV](self, "requestedPMV"));
  if (v12) {
    id v13 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig requestedPMV](self, "requestedPMV"));
  }
  else {
    id v13 = @"(default)";
  }
  int64_t v38 = -[SUControllerConfig delayPeriod](self, "delayPeriod");
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath"));
  if (v14) {
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig installPhaseOSBackgroundImagePath]( self,  "installPhaseOSBackgroundImagePath"));
  }
  else {
    v50 = @"(default)";
  }
  if (-[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement")) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  v35 = v15;
  if (-[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates")) {
    id v16 = @"YES";
  }
  else {
    id v16 = @"NO";
  }
  unsigned int v33 = v16;
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[SUControllerConfig updateMetricContext](self, "updateMetricContext"));
  if (v17) {
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig updateMetricContext](self, "updateMetricContext"));
  }
  else {
    v41 = @"(default)";
  }
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion"));
  if (v18) {
    unsigned int v19 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion"));
  }
  else {
    unsigned int v19 = @"(default)";
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion"));
  v60 = (void *)v12;
  if (v36) {
    char v20 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion"));
  }
  else {
    char v20 = @"(default)";
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig asReleaseType](self, "asReleaseType"));
  v53 = (void *)v14;
  if (v21) {
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig asReleaseType](self, "asReleaseType"));
  }
  else {
    v61 = @"(default)";
  }
  v44 = (void *)v17;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile"));
  v57 = (__CFString *)v13;
  v39 = (void *)v18;
  v37 = (__CFString *)v19;
  unsigned int v34 = (__CFString *)v20;
  if (v22) {
    id v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile"));
  }
  else {
    id v23 = @"(default)";
  }
  if (-[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow")) {
    id v24 = @"YES";
  }
  else {
    id v24 = @"NO";
  }
  unsigned int v32 = v24;
  if (-[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired")) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  if (-[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot")) {
    id v26 = @"YES";
  }
  else {
    id v26 = @"NO";
  }
  else {
    unsigned int v27 = @"NO";
  }
  if (-[SUControllerConfig requirePrepareSize](self, "requirePrepareSize")) {
    unsigned int v28 = @"YES";
  }
  else {
    unsigned int v28 = @"NO";
  }
  if (-[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas")) {
    unsigned int v29 = @"YES";
  }
  else {
    unsigned int v29 = @"NO";
  }
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\nuseSUCore: %@\nVPNOnDemandAsInternal: %@\nPerformAutoScan: %@\nPerformAutoDownloadAndPrepare: %@\nPerformAutoInstall: %@\nAutoAcceptTermsAndConditions: %@\nAutoActivityCheckPeriod: %d minutes\nAutoInstallForceMaxWait: %d minutes\nAutoInstallWindowBegin: %02d:%02d\nAutoInstallWindowEnd: %02d:%02d\nDownloadDocAsset: %@\nIgnoreRamping: %@\nSupervisedMDM: %@\nRequestedPMV: %@\nDelayPeriod: %d days\nInstallPhaseOSBackgroundImagePath: %@\nRestrictToFullReplacement: %@\nAllowSameVersionUpdates: %@\nUpdateMetricContext: %@\nPrerequisiteBuildVersion: %@\nPrerequisiteProductVersion: %@\nAsReleaseType: %@\nsimulatorCommandsFile: %@\nuseSpecifiedInstallWindow: %@\nexpiredSpecifiedAsExpired: %@\nHideIndicationMayReboot: %@\nInternalDefaultsAsExternal: %@\nRequirePrepareSize: %@\nInstallWindowAsDeltas: %@",  v59,  v58,  v56,  v55,  v54,  v52,  v51,  v49,  v48,  v47,  v46,  v45,  v43,  v42,  v40,  v57,  v38,  v50,  v35,  v33,  v41,  v37,  v34,  v61,  v23,  v32,  v25,  v26,  v27,  v28,  v29));
  if (v22) {

  }
  if (v21) {
  if (v36)
  }

  if (v39) {
  if (v44)
  }

  if (v53) {
  if (v60)
  }

  return v30;
}

- (id)summary
{
  if (-[SUControllerConfig useSUCore](self, "useSUCore")) {
    id v3 = @"Y";
  }
  else {
    id v3 = @"N";
  }
  v59 = v3;
  if (-[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal")) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v58 = v4;
  if (-[SUControllerConfig performAutoScan](self, "performAutoScan")) {
    unsigned int v5 = @"Y";
  }
  else {
    unsigned int v5 = @"N";
  }
  v56 = v5;
  if (-[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare")) {
    unsigned int v6 = @"Y";
  }
  else {
    unsigned int v6 = @"N";
  }
  v55 = v6;
  if (-[SUControllerConfig performAutoInstall](self, "performAutoInstall")) {
    unsigned int v7 = @"Y";
  }
  else {
    unsigned int v7 = @"N";
  }
  v54 = v7;
  if (-[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions")) {
    unsigned int v8 = @"Y";
  }
  else {
    unsigned int v8 = @"N";
  }
  v52 = v8;
  int64_t v51 = -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod");
  int64_t v49 = -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait");
  int64_t v48 = -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour");
  int64_t v47 = -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute");
  int64_t v46 = -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour");
  int64_t v45 = -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute");
  if (-[SUControllerConfig downloadDocAsset](self, "downloadDocAsset")) {
    unsigned int v9 = @"Y";
  }
  else {
    unsigned int v9 = @"N";
  }
  v43 = v9;
  if (-[SUControllerConfig ignoreRamping](self, "ignoreRamping")) {
    unsigned int v10 = @"Y";
  }
  else {
    unsigned int v10 = @"N";
  }
  v42 = v10;
  if (-[SUControllerConfig supervisedMDM](self, "supervisedMDM")) {
    id v11 = @"Y";
  }
  else {
    id v11 = @"N";
  }
  v40 = v11;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SUControllerConfig requestedPMV](self, "requestedPMV"));
  if (v12) {
    id v13 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig requestedPMV](self, "requestedPMV"));
  }
  else {
    id v13 = @"!";
  }
  int64_t v38 = -[SUControllerConfig delayPeriod](self, "delayPeriod");
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath"));
  if (v14) {
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig installPhaseOSBackgroundImagePath]( self,  "installPhaseOSBackgroundImagePath"));
  }
  else {
    v50 = @"!";
  }
  if (-[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement")) {
    id v15 = @"Y";
  }
  else {
    id v15 = @"N";
  }
  v35 = v15;
  if (-[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates")) {
    id v16 = @"Y";
  }
  else {
    id v16 = @"N";
  }
  unsigned int v33 = v16;
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[SUControllerConfig updateMetricContext](self, "updateMetricContext"));
  if (v17) {
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig updateMetricContext](self, "updateMetricContext"));
  }
  else {
    v41 = @"!";
  }
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion"));
  if (v18) {
    unsigned int v19 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion"));
  }
  else {
    unsigned int v19 = @"!";
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion"));
  v60 = (void *)v12;
  if (v36) {
    char v20 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion"));
  }
  else {
    char v20 = @"!";
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig asReleaseType](self, "asReleaseType"));
  v53 = (void *)v14;
  if (v21) {
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig asReleaseType](self, "asReleaseType"));
  }
  else {
    v61 = @"!";
  }
  v44 = (void *)v17;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile"));
  v57 = (__CFString *)v13;
  v39 = (void *)v18;
  v37 = (__CFString *)v19;
  unsigned int v34 = (__CFString *)v20;
  if (v22) {
    id v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile"));
  }
  else {
    id v23 = @"!";
  }
  if (-[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow")) {
    id v24 = @"Y";
  }
  else {
    id v24 = @"N";
  }
  unsigned int v32 = v24;
  if (-[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired")) {
    v25 = @"Y";
  }
  else {
    v25 = @"N";
  }
  if (-[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot")) {
    id v26 = @"Y";
  }
  else {
    id v26 = @"N";
  }
  else {
    unsigned int v27 = @"N";
  }
  if (-[SUControllerConfig requirePrepareSize](self, "requirePrepareSize")) {
    unsigned int v28 = @"Y";
  }
  else {
    unsigned int v28 = @"N";
  }
  if (-[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas")) {
    unsigned int v29 = @"Y";
  }
  else {
    unsigned int v29 = @"N";
  }
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"useSUCore:%@,vpnAsInternal:%@,autoScan:%@,autoDownload:%@,autoInstall:%@,autoAccept:%@,activityPeriod:%d,forceMaxWait:%d,windowBegin:%02d:%02d,windowEnd:%02d:%02d,downloadDoc:%@,ignoreRamp:%@,supervisedMDM:%@,requestedPMV:%@,delayPeriod:%d,installPhaseBGImgPath:%@,restrictToFull:%@,allowSame:%@,context:%@,asBuild:%@,asProduct:%@,asRelease:%@,simFile:%@,useInstallWindow:%@,expiredAsExpired:%@,hideMayReboot:%@,asExternal:%@,requirePrepSize:%@,windowDeltas:%@",  v59,  v58,  v56,  v55,  v54,  v52,  v51,  v49,  v48,  v47,  v46,  v45,  v43,  v42,  v40,  v57,  v38,  v50,  v35,  v33,  v41,  v37,  v34,  v61,  v23,  v32,  v25,  v26,  v27,  v28,  v29));
  if (v22) {

  }
  if (v21) {
  if (v36)
  }

  if (v39) {
  if (v44)
  }

  if (v53) {
  if (v60)
  }

  return v30;
}

- (id)changeSummary:(int64_t)a3
{
  int v3 = a3;
  if ((a3 & 0x8000000) != 0)
  {
    unsigned int v6 = objc_alloc(&OBJC_CLASS___NSString);
    if (-[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal")) {
      unsigned int v7 = @"Y";
    }
    else {
      unsigned int v7 = @"N";
    }
    unsigned int v8 = -[NSString initWithFormat:](v6, "initWithFormat:", @"|vpnAsInternal:%@", v7);
    unsigned int v5 = (__CFString *)objc_claimAutoreleasedReturnValue([&stru_100066480 stringByAppendingString:v8]);

    if ((v3 & 1) == 0) {
      goto LABEL_13;
    }
  }

  else
  {
    unsigned int v5 = &stru_100066480;
    if ((a3 & 1) == 0) {
      goto LABEL_13;
    }
  }

  if (-[SUControllerConfig _runningOnAppleTV](self, "_runningOnAppleTV"))
  {
    unsigned int v9 = objc_alloc(&OBJC_CLASS___NSString);
    if (-[SUControllerConfig performAutoScan](self, "performAutoScan")) {
      unsigned int v10 = @"Y";
    }
    else {
      unsigned int v10 = @"N";
    }
    id v11 = -[NSString initWithFormat:](v9, "initWithFormat:", @"|autoScan:%@", v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v11));

    unsigned int v5 = (__CFString *)v12;
  }

- (BOOL)_loadBooleanFromDefaults:(id)a3 usingDefault:(BOOL)a4 isStoredInverted:(BOOL)a5
{
  BOOL v5 = a5;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( (CFStringRef)a3,  @"com.apple.SUController",  &keyExistsAndHasValidFormat);
  BOOL v8 = AppBooleanValue != 0;
  if (v5) {
    BOOL v8 = AppBooleanValue == 0;
  }
  if (keyExistsAndHasValidFormat) {
    return v8;
  }
  else {
    return a4;
  }
}

- (int64_t)_loadBooleanFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(BOOL)a5 internalDefault:(BOOL)a6 isStoredInverted:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( (CFStringRef)a3,  @"com.apple.SUController",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    BOOL v13 = AppBooleanValue != 0;
    if (v7) {
      return AppBooleanValue == 0;
    }
  }

  else if (self->_internalDefaultsAsExternal || (unint64_t)(a4 - 1) >= 2)
  {
    return v9;
  }

  else
  {
    return v8;
  }

  return v13;
}

- (int64_t)_loadIntegerFromDefaults:(id)a3 usingDefault:(int64_t)a4 withLimit:(int64_t)a5
{
  BOOL v8 = (__CFString *)a3;
  BOOL v9 = (void *)CFPreferencesCopyAppValue(v8, @"com.apple.SUController");
  unsigned int v10 = v9;
  if (v9) {
    a4 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:]( self,  "_limitedInteger:checkingValue:forKey:withLimit:",  @"load",  (int)[v9 intValue],  v8,  a5);
  }

  return a4;
}

- (int64_t)_loadIntegerFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(int64_t)a5 internalDefault:(int64_t)a6 withLimit:(int64_t)a7
{
  uint64_t v12 = (__CFString *)a3;
  BOOL v13 = (void *)CFPreferencesCopyAppValue(v12, @"com.apple.SUController");
  uint64_t v14 = v13;
  if (v13)
  {
    int64_t v15 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:]( self,  "_limitedInteger:checkingValue:forKey:withLimit:",  @"load",  (int)[v13 intValue],  v12,  a7);
  }

  else if (self->_internalDefaultsAsExternal || (unint64_t)(a4 - 1) >= 2)
  {
    int64_t v15 = a5;
  }

  else
  {
    int64_t v15 = a6;
  }

  return v15;
}

- (id)_copyStringFromDefaults:(id)a3 usingDefault:(id)a4
{
  id v5 = a4;
  CFPropertyListRef v6 = CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.SUController");
  id v7 = (id)v6;
  if (v5 && !v6) {
    id v7 = [v5 copy];
  }

  return v7;
}

- (BOOL)_storeBooleanToDefaults:(id)a3 toValue:(BOOL)a4 isStoredInverted:(BOOL)a5
{
  if (a4 != a5) {
    CFPropertyListRef v6 = @"true";
  }
  else {
    CFPropertyListRef v6 = @"false";
  }
  CFPreferencesSetAppValue((CFStringRef)a3, v6, @"com.apple.SUController");
  return a4;
}

- (int64_t)_storeIntegerToDefaults:(id)a3 toValue:(int64_t)a4
{
  id v5 = (__CFString *)a3;
  CFPropertyListRef v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", a4));
  if (v6) {
    CFPreferencesSetAppValue(v5, v6, @"com.apple.SUController");
  }

  return a4;
}

- (id)_storeStringToDefaults:(id)a3 toValue:(id)a4
{
  id v5 = a4;
  CFPreferencesSetAppValue((CFStringRef)a3, v5, @"com.apple.SUController");
  return v5;
}

- (int64_t)_decodeInteger:(id)a3 forKey:(id)a4 withLimit:(int64_t)a5
{
  id v8 = a4;
  int64_t v9 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:]( self,  "_limitedInteger:checkingValue:forKey:withLimit:",  @"decode",  [a3 decodeIntegerForKey:v8],  v8,  a5);

  return v9;
}

- (int64_t)_limitedInteger:(id)a3 checkingValue:(int64_t)a4 forKey:(id)a5 withLimit:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a4 < 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    uint64_t v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"attempt to %@ %@ to negative value(%ld) - using value of 0",  v9,  v10,  a4);
    [v11 trackAnomaly:@"[CONFIG]" forReason:v12 withResult:8102 withError:0];
    a6 = 0LL;
    goto LABEL_6;
  }

  if (a6 && a4 > a6)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    uint64_t v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"attempt to %@ %@ to over-limit value(%ld) - using value of %ld",  v9,  v10,  a4,  a6);
    [v11 trackAnomaly:@"[CONFIG]" forReason:v12 withResult:8102 withError:0];
LABEL_6:

    a4 = a6;
  }

  return a4;
}

- (BOOL)_runningOnAppleTV
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 deviceClass]);
  unsigned __int8 v4 = [v3 isEqualToString:@"AppleTV"];

  return v4;
}

- (BOOL)useSUCore
{
  return self->_useSUCore;
}

- (void)setUseSUCore:(BOOL)a3
{
  self->_useSUCore = a3;
}

- (int64_t)preservePreparedMaxAttempts
{
  return self->_preservePreparedMaxAttempts;
}

- (void)setPreservePreparedMaxAttempts:(int64_t)a3
{
  self->_preservePreparedMaxAttempts = a3;
}

- (BOOL)vpnOnDemandAsInternal
{
  return self->_vpnOnDemandAsInternal;
}

- (void)setVpnOnDemandAsInternal:(BOOL)a3
{
  self->_vpnOnDemandAsInternal = a3;
}

- (BOOL)performAutoScan
{
  return self->_performAutoScan;
}

- (void)setPerformAutoScan:(BOOL)a3
{
  self->_performAutoScan = a3;
}

- (BOOL)performAutoDownloadAndPrepare
{
  return self->_performAutoDownloadAndPrepare;
}

- (void)setPerformAutoDownloadAndPrepare:(BOOL)a3
{
  self->_performAutoDownloadAndPrepare = a3;
}

- (BOOL)performAutoInstall
{
  return self->_performAutoInstall;
}

- (void)setPerformAutoInstall:(BOOL)a3
{
  self->_performAutoInstall = a3;
}

- (BOOL)autoAcceptTermsAndConditions
{
  return self->_autoAcceptTermsAndConditions;
}

- (void)setAutoAcceptTermsAndConditions:(BOOL)a3
{
  self->_autoAcceptTermsAndConditions = a3;
}

- (int64_t)autoActivityCheckPeriod
{
  return self->_autoActivityCheckPeriod;
}

- (void)setAutoActivityCheckPeriod:(int64_t)a3
{
  self->_autoActivityCheckPeriod = a3;
}

- (int64_t)autoInstallForceMaxWait
{
  return self->_autoInstallForceMaxWait;
}

- (void)setAutoInstallForceMaxWait:(int64_t)a3
{
  self->_autoInstallForceMaxWait = a3;
}

- (int64_t)autoInstallWindowBeginHour
{
  return self->_autoInstallWindowBeginHour;
}

- (void)setAutoInstallWindowBeginHour:(int64_t)a3
{
  self->_autoInstallWindowBeginHour = a3;
}

- (int64_t)autoInstallWindowBeginMinute
{
  return self->_autoInstallWindowBeginMinute;
}

- (void)setAutoInstallWindowBeginMinute:(int64_t)a3
{
  self->_autoInstallWindowBeginMinute = a3;
}

- (int64_t)autoInstallWindowEndHour
{
  return self->_autoInstallWindowEndHour;
}

- (void)setAutoInstallWindowEndHour:(int64_t)a3
{
  self->_autoInstallWindowEndHour = a3;
}

- (int64_t)autoInstallWindowEndMinute
{
  return self->_autoInstallWindowEndMinute;
}

- (void)setAutoInstallWindowEndMinute:(int64_t)a3
{
  self->_autoInstallWindowEndMinute = a3;
}

- (BOOL)downloadDocAsset
{
  return self->_downloadDocAsset;
}

- (void)setDownloadDocAsset:(BOOL)a3
{
  self->_downloadDocAsset = a3;
}

- (BOOL)ignoreRamping
{
  return self->_ignoreRamping;
}

- (void)setIgnoreRamping:(BOOL)a3
{
  self->_ignoreRamping = a3;
}

- (NSString)installPhaseOSBackgroundImagePath
{
  return self->_installPhaseOSBackgroundImagePath;
}

- (void)setInstallPhaseOSBackgroundImagePath:(id)a3
{
}

- (BOOL)supervisedMDM
{
  return self->_supervisedMDM;
}

- (void)setSupervisedMDM:(BOOL)a3
{
  self->_supervisedMDM = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (BOOL)restrictToFullReplacement
{
  return self->_restrictToFullReplacement;
}

- (void)setRestrictToFullReplacement:(BOOL)a3
{
  self->_restrictToFullReplacement = a3;
}

- (BOOL)allowSameVersionUpdates
{
  return self->_allowSameVersionUpdates;
}

- (void)setAllowSameVersionUpdates:(BOOL)a3
{
  self->_allowSameVersionUpdates = a3;
}

- (BOOL)useSpecifiedInstallWindow
{
  return self->_useSpecifiedInstallWindow;
}

- (void)setUseSpecifiedInstallWindow:(BOOL)a3
{
  self->_useSpecifiedInstallWindow = a3;
}

- (BOOL)expiredSpecifiedAsExpired
{
  return self->_expiredSpecifiedAsExpired;
}

- (void)setExpiredSpecifiedAsExpired:(BOOL)a3
{
  self->_expiredSpecifiedAsExpired = a3;
}

- (BOOL)hideIndicationMayReboot
{
  return self->_hideIndicationMayReboot;
}

- (void)setHideIndicationMayReboot:(BOOL)a3
{
  self->_hideIndicationMayReboot = a3;
}

- (BOOL)internalDefaultsAsExternal
{
  return self->_internalDefaultsAsExternal;
}

- (void)setInternalDefaultsAsExternal:(BOOL)a3
{
  self->_internalDefaultsAsExternal = a3;
}

- (BOOL)requirePrepareSize
{
  return self->_requirePrepareSize;
}

- (void)setRequirePrepareSize:(BOOL)a3
{
  self->_requirePrepareSize = a3;
}

- (BOOL)installWindowAsDeltas
{
  return self->_installWindowAsDeltas;
}

- (void)setInstallWindowAsDeltas:(BOOL)a3
{
  self->_installWindowAsDeltas = a3;
}

- (NSString)updateMetricContext
{
  return self->_updateMetricContext;
}

- (void)setUpdateMetricContext:(id)a3
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

- (NSString)asReleaseType
{
  return self->_asReleaseType;
}

- (void)setAsReleaseType:(id)a3
{
}

- (NSString)simulatorCommandsFile
{
  return self->_simulatorCommandsFile;
}

- (void)setSimulatorCommandsFile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end