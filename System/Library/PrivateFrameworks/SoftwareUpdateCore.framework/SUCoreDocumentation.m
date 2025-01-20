@interface SUCoreDocumentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isRecommendedUpdateApplicable;
- (BOOL)notificationEnabled;
- (BOOL)recommendedUpdateApplicable;
- (BOOL)recommendedUpdateEnabled;
- (NSData)licenseAgreement;
- (NSData)releaseNotes;
- (NSData)releaseNotesSummary;
- (NSData)serverAssetMeasurement;
- (NSNumber)recommendedUpdateNotificationFrequencyDays;
- (NSNumber)slaVersion;
- (NSString)humanReadableMoreInfoLink;
- (NSString)humanReadableUpdateName;
- (NSString)humanReadableUpdateTitle;
- (NSString)humanReadableUpdateVersion;
- (NSString)language;
- (NSString)licenseAgreementFileName;
- (NSString)mandatoryUpdateBodyString;
- (NSString)notificationBodyString;
- (NSString)notificationTitleString;
- (NSString)preferencesIconFileName;
- (NSString)productVersion;
- (NSString)recommendedUpdateAlertBodyString;
- (NSString)recommendedUpdateMaxOSVersion;
- (NSString)recommendedUpdateMinOSVersion;
- (NSString)recommendedUpdateTitleString;
- (NSString)releaseNotesFileName;
- (NSString)releaseNotesSummaryFileName;
- (NSString)serverAssetAlgorithm;
- (NSURL)localBundleURL;
- (NSURL)serverAssetURL;
- (SUCoreDocumentation)initWithCoder:(id)a3;
- (SUCoreDocumentation)initWithDocumentationAsset:(id)a3;
- (SUCoreDocumentation)initWithLocalBundleURL:(id)a3 attributes:(id)a4;
- (id)_extendDocumentationProperties;
- (id)_extendDocumentationPropertiesWithSimulateEvent:(id)a3;
- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4;
- (id)description;
- (id)extendDocumentationProperties;
- (id)softwareUpdateIconImagePath;
- (id)summary;
- (int64_t)serverAssetChunkSize;
- (void)encodeWithCoder:(id)a3;
- (void)isRecommendedUpdateApplicable;
- (void)setHumanReadableMoreInfoLink:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setHumanReadableUpdateTitle:(id)a3;
- (void)setHumanReadableUpdateVersion:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLicenseAgreement:(id)a3;
- (void)setLicenseAgreementFileName:(id)a3;
- (void)setLocalBundleURL:(id)a3;
- (void)setMandatoryUpdateBodyString:(id)a3;
- (void)setNotificationBodyString:(id)a3;
- (void)setNotificationEnabled:(BOOL)a3;
- (void)setNotificationTitleString:(id)a3;
- (void)setPreferencesIconFileName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setRecommendedUpdateAlertBodyString:(id)a3;
- (void)setRecommendedUpdateApplicable:(BOOL)a3;
- (void)setRecommendedUpdateEnabled:(BOOL)a3;
- (void)setRecommendedUpdateMaxOSVersion:(id)a3;
- (void)setRecommendedUpdateMinOSVersion:(id)a3;
- (void)setRecommendedUpdateNotificationFrequencyDays:(id)a3;
- (void)setRecommendedUpdateTitleString:(id)a3;
- (void)setReleaseNotes:(id)a3;
- (void)setReleaseNotesFileName:(id)a3;
- (void)setReleaseNotesSummary:(id)a3;
- (void)setReleaseNotesSummaryFileName:(id)a3;
- (void)setServerAssetAlgorithm:(id)a3;
- (void)setServerAssetChunkSize:(int64_t)a3;
- (void)setServerAssetMeasurement:(id)a3;
- (void)setServerAssetURL:(id)a3;
- (void)setSlaVersion:(id)a3;
- (void)softwareUpdateIconImagePath;
@end

@implementation SUCoreDocumentation

- (SUCoreDocumentation)initWithDocumentationAsset:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    [MEMORY[0x189612778] sharedDiag];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = @"unable to create SU documentation: nil update asset";
    goto LABEL_21;
  }

  uint64_t v6 = [v4 attributes];
  if (!v6
    || (v7 = (void *)v6,
        [v5 attributes],
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        !v9))
  {
    [MEMORY[0x189612778] sharedDiag];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = @"unable to create SU documentation: documentation asset without attributes";
LABEL_21:
    [v26 trackError:@"[DOCUMENTATION]" forReason:v28 withResult:8100 withError:0];

    v25 = 0LL;
    goto LABEL_22;
  }

  [v5 getLocalUrl];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Attempting to create a documentation instance with no localBundleURL (non-fatal)",  buf,  2u);
    }
  }

  [v5 attributes];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SUCoreDocumentation initWithLocalBundleURL:attributes:](self, "initWithLocalBundleURL:attributes:", v10, v13);

  [v5 assetServerUrl];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation setServerAssetURL:](v14, "setServerAssetURL:", v15);

  [MEMORY[0x189612770] sharedDevice];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  int v17 = [v16 isBootedOSSecureInternal];

  if (v17)
  {
    [MEMORY[0x1896078A8] defaultManager];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v18 fileExistsAtPath:&stru_18A0F22B0] & 1) == 0)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187A54000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SU Documentation Preview] Plist not found... creating a default plist",  buf,  2u);
      }

      id v30 = 0LL;
      char v21 = [@"<?xml version=1.0 encoding=UTF-8?>     <!DOCTYPE plist PUBLIC -//Apple//DTD PLIST 1.0//EN http://www.apple.com/DTDs/PropertyList-1.0.dtd>     <plist version=1.0>     <dict>         <key>MobileAssetNewPath</key>         <string></string>     </dict>     </plist>" writeToFile:&stru_18A0F22B0 atomically:1 encoding:4 error:&v30];
      id v22 = v30;
      if ((v21 & 1) == 0)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 oslog];
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v22;
          _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "[SU Documentation Preview] Error creating plist: %@",  buf,  0xCu);
        }
      }
    }
  }

  self = v14;

  v25 = self;
LABEL_22:

  return v25;
}

- (SUCoreDocumentation)initWithLocalBundleURL:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v56.receiver = self;
    v56.super_class = (Class)&OBJC_CLASS___SUCoreDocumentation;
    uint64_t v9 = -[SUCoreDocumentation init](&v56, sel_init);
    if (v9)
    {
      uint64_t v10 = [v8 safeStringForKey:@"OSVersion"];
      productVersion = v9->_productVersion;
      v9->_productVersion = (NSString *)v10;

      uint64_t v12 = [v8 safeObjectForKey:@"SUSLAVersionRequired" ofClass:objc_opt_class()];
      slaVersion = v9->_slaVersion;
      v9->_slaVersion = (NSNumber *)v12;

      objc_storeStrong((id *)&v9->_localBundleURL, a3);
      serverAssetURL = v9->_serverAssetURL;
      v9->_serverAssetURL = 0LL;

      uint64_t v15 = [v8 safeDataForKey:@"_Measurement"];
      serverAssetMeasurement = v9->_serverAssetMeasurement;
      v9->_serverAssetMeasurement = (NSData *)v15;

      uint64_t v17 = [v8 safeStringForKey:@"_MeasurementAlgorithm"];
      serverAssetAlgorithm = v9->_serverAssetAlgorithm;
      v9->_serverAssetAlgorithm = (NSString *)v17;

      [v8 safeObjectForKey:@"_DownloadSize" ofClass:objc_opt_class()];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_serverAssetChunkSize = [v19 longLongValue];

      v9->_notificationEnabled = [v8 safeBooleanForKey:@"NotificationEnabled"];
      [v8 safeDictionaryForKey:@"RecommendedUpdate"];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      char v21 = v20;
      if (v20)
      {
        v9->_recommendedUpdateEnabled = [v20 safeBooleanForKey:@"Enabled"];
        uint64_t v22 = [v21 safeStringForKey:@"MinOSVersion"];
        recommendedUpdateMinOSVersion = v9->_recommendedUpdateMinOSVersion;
        v9->_recommendedUpdateMinOSVersion = (NSString *)v22;

        uint64_t v24 = [v21 safeStringForKey:@"MaxOSVersion"];
        recommendedUpdateMaxOSVersion = v9->_recommendedUpdateMaxOSVersion;
        v9->_recommendedUpdateMaxOSVersion = (NSString *)v24;

        v9->_recommendedUpdateApplicable = -[SUCoreDocumentation isRecommendedUpdateApplicable]( v9,  "isRecommendedUpdateApplicable");
        [v21 objectForKey:@"NotificationFrequencyDays"];
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26) {
          objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  objc_msgSend(v21, "safeIntegerForKey:", @"NotificationFrequencyDays"));
        }
        else {
        uint64_t v27 = [MEMORY[0x189607968] numberWithInt:3];
        }
        recommendedUpdateNotificationFrequencyDays = v9->_recommendedUpdateNotificationFrequencyDays;
        v9->_recommendedUpdateNotificationFrequencyDays = (NSNumber *)v27;
      }

      else
      {
        *(_WORD *)&v9->_recommendedUpdateEnabled = 0;
        id v30 = v9->_recommendedUpdateMinOSVersion;
        v9->_recommendedUpdateMinOSVersion = 0LL;

        v31 = v9->_recommendedUpdateMaxOSVersion;
        v9->_recommendedUpdateMaxOSVersion = 0LL;

        recommendedUpdateNotificationFrequencyDays = v9->_recommendedUpdateNotificationFrequencyDays;
        v9->_recommendedUpdateNotificationFrequencyDays = 0LL;
      }

      uint64_t v33 = [v8 safeStringForKey:@"ReleaseNotesSummaryFileName"];
      releaseNotesSummaryFileName = v9->_releaseNotesSummaryFileName;
      v9->_releaseNotesSummaryFileName = (NSString *)v33;

      if (!v9->_releaseNotesSummaryFileName)
      {
        v9->_releaseNotesSummaryFileName = (NSString *)@"ReadMeSummary";
      }

      uint64_t v35 = [v8 safeStringForKey:@"ReleaseNotesFileName"];
      releaseNotesFileName = v9->_releaseNotesFileName;
      v9->_releaseNotesFileName = (NSString *)v35;

      if (!v9->_releaseNotesFileName)
      {
        v9->_releaseNotesFileName = (NSString *)@"ReadMe";
      }

      uint64_t v37 = [v8 safeStringForKey:@"LicenseAgreementFileName"];
      licenseAgreementFileName = v9->_licenseAgreementFileName;
      v9->_licenseAgreementFileName = (NSString *)v37;

      if (!v9->_licenseAgreementFileName)
      {
        v9->_licenseAgreementFileName = (NSString *)@"License";
      }

      uint64_t v39 = [v8 safeStringForKey:@"PreferencesIconFileName"];
      preferencesIconFileName = v9->_preferencesIconFileName;
      v9->_preferencesIconFileName = (NSString *)v39;

      if (!v9->_preferencesIconFileName)
      {
        v9->_preferencesIconFileName = (NSString *)@"PreferencesIcon";
      }

      language = v9->_language;
      v9->_language = (NSString *)@"en";

      [MEMORY[0x189603F90] preferredLanguages];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v42 && [v42 count])
      {
        uint64_t v44 = [v43 objectAtIndex:0];
        v45 = v9->_language;
        v9->_language = (NSString *)v44;
      }

      humanReadableUpdateName = v9->_humanReadableUpdateName;
      v9->_humanReadableUpdateName = 0LL;

      humanReadableUpdateTitle = v9->_humanReadableUpdateTitle;
      v9->_humanReadableUpdateTitle = 0LL;

      humanReadableUpdateVersion = v9->_humanReadableUpdateVersion;
      v9->_humanReadableUpdateVersion = 0LL;

      humanReadableMoreInfoLink = v9->_humanReadableMoreInfoLink;
      v9->_humanReadableMoreInfoLink = 0LL;

      notificationTitleString = v9->_notificationTitleString;
      v9->_notificationTitleString = 0LL;

      notificationBodyString = v9->_notificationBodyString;
      v9->_notificationBodyString = 0LL;

      recommendedUpdateTitleString = v9->_recommendedUpdateTitleString;
      v9->_recommendedUpdateTitleString = 0LL;

      recommendedUpdateAlertBodyString = v9->_recommendedUpdateAlertBodyString;
      v9->_recommendedUpdateAlertBodyString = 0LL;

      mandatoryUpdateBodyString = v9->_mandatoryUpdateBodyString;
      v9->_mandatoryUpdateBodyString = 0LL;
    }

    self = v9;
    v29 = self;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 trackError:@"[DOCUMENTATION]" forReason:@"unable to create SU documentation with no attributes dictionary" withResult:8100 withError:0];

    v29 = 0LL;
  }

  return v29;
}

- (id)extendDocumentationProperties
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 begin:@"documentation" atFunction:@"extendDocumentationProperties"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[SUCoreDocumentation _extendDocumentationPropertiesWithSimulateEvent:]( self,  "_extendDocumentationPropertiesWithSimulateEvent:",  v4);
  }

  else
  {
    v5 = -[SUCoreDocumentation _extendDocumentationProperties](self, "_extendDocumentationProperties");
    [MEMORY[0x1896127C8] sharedSimulator];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 end:@"documentation" atFunction:@"extendDocumentationProperties"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      uint64_t v8 = -[SUCoreDocumentation _extendDocumentationPropertiesWithSimulateEvent:]( self,  "_extendDocumentationPropertiesWithSimulateEvent:",  v7);

      v5 = (void *)v8;
    }
  }

  return v5;
}

- (id)_extendDocumentationPropertiesWithSimulateEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 simAction];
  if (v5 == 3)
  {
    [MEMORY[0x189604030] URLWithString:@"SimulatedLocalBundelURL"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setLocalBundleURL:](self, "setLocalBundleURL:", v7);

    -[SUCoreDocumentation setHumanReadableUpdateName:]( self,  "setHumanReadableUpdateName:",  @"SimulatedHumanReadableUpdateName");
    -[SUCoreDocumentation setHumanReadableUpdateTitle:]( self,  "setHumanReadableUpdateTitle:",  @"SimulatedHumanReadableUpdateTitle");
    -[SUCoreDocumentation setHumanReadableUpdateVersion:]( self,  "setHumanReadableUpdateVersion:",  @"SimulatedHumanReadableUpdateVersion");
    -[SUCoreDocumentation setHumanReadableMoreInfoLink:]( self,  "setHumanReadableMoreInfoLink:",  @"SimulatedHumanReadableMoreInfoLink");
    -[SUCoreDocumentation setNotificationEnabled:](self, "setNotificationEnabled:", 1LL);
    -[SUCoreDocumentation setNotificationTitleString:]( self,  "setNotificationTitleString:",  @"SimulatedNotificationTitleString");
    -[SUCoreDocumentation setNotificationBodyString:]( self,  "setNotificationBodyString:",  @"SimulatedNotificationBodyString");
    -[SUCoreDocumentation setRecommendedUpdateEnabled:](self, "setRecommendedUpdateEnabled:", 1LL);
    -[SUCoreDocumentation setRecommendedUpdateApplicable:](self, "setRecommendedUpdateApplicable:", 1LL);
    [MEMORY[0x189607968] numberWithInt:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setRecommendedUpdateNotificationFrequencyDays:]( self,  "setRecommendedUpdateNotificationFrequencyDays:",  v8);

    -[SUCoreDocumentation setRecommendedUpdateMinOSVersion:]( self,  "setRecommendedUpdateMinOSVersion:",  @"SimulatedRecommendedUpdateMinOSVersion");
    -[SUCoreDocumentation setRecommendedUpdateMaxOSVersion:]( self,  "setRecommendedUpdateMaxOSVersion:",  @"SimulatedRecommendedUpdateMaxOSVersion");
    -[SUCoreDocumentation setRecommendedUpdateTitleString:]( self,  "setRecommendedUpdateTitleString:",  @"SimulatedRecommendedUpdateTitleString");
    -[SUCoreDocumentation setRecommendedUpdateAlertBodyString:]( self,  "setRecommendedUpdateAlertBodyString:",  @"SimulatedRecommendedUpdateAlertBodyString");
    -[SUCoreDocumentation setMandatoryUpdateBodyString:]( self,  "setMandatoryUpdateBodyString:",  @"SimulatedMandatoryUpdateBodyString");
    [@"SimulatedReleaseNotesSummary" dataUsingEncoding:4];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setReleaseNotesSummary:](self, "setReleaseNotesSummary:", v9);

    [@"SimulatedReleaseNotes" dataUsingEncoding:4];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setReleaseNotes:](self, "setReleaseNotes:", v10);

    [@"SimulatedLicenseAgreement" dataUsingEncoding:4];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation setLicenseAgreement:](self, "setLicenseAgreement:", v11);

LABEL_6:
    uint64_t v6 = 0LL;
    goto LABEL_7;
  }

  if (v5 != 1)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v4];
    [v12 trackAnomaly:@"_extendDocumentationPropertiesWithSimulateEvent" forReason:v13 withResult:8113 withError:0];

    goto LABEL_6;
  }

  [v4 buildErrorWithDescription:@"Simulated extendDocumentationProperties error"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (id)_extendDocumentationProperties
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189612770] sharedDevice];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isBootedOSSecureInternal];

  if (v4)
  {
    [MEMORY[0x189603F68] dictionaryWithContentsOfFile:&stru_18A0F22B0];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 valueForKey:@"MobileAssetNewPath"];
    uint64_t v6 = (SUCoreDocumentation *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      [MEMORY[0x1896078A8] defaultManager];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      int v8 = [v7 fileExistsAtPath:v6];

      [MEMORY[0x1896127A0] sharedLogger];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 oslog];
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SU Documentation Preview] Overriding documentation assets with custom path",  buf,  2u);
        }

        [MEMORY[0x189604030] fileURLWithPath:v6];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentation setLocalBundleURL:](self, "setLocalBundleURL:", v12);

        [MEMORY[0x1896127A0] sharedLogger];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 oslog];
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
          v14 = (SUCoreDocumentation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v88 = v14;
          _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SU Documentation Preview] New Local Bundle: %@",  buf,  0xCu);
        }

        goto LABEL_13;
      }

      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v88 = v6;
        v16 = "[SU Documentation Preview] Invalid Update path: %@";
        uint64_t v17 = v10;
        uint32_t v18 = 12;
        goto LABEL_12;
      }
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 oslog];
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "[SU Documentation Preview] Unable to find alternate local bundle URL";
        uint64_t v17 = v10;
        uint32_t v18 = 2;
LABEL_12:
        _os_log_impl(&dword_187A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }

- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4
{
  CFURLRef v4 = CFBundleCopyResourceURL(a3, (CFStringRef)a4, @"html", 0LL);
  if (v4)
  {
    [MEMORY[0x189603F48] dataWithContentsOfURL:v4];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)isRecommendedUpdateApplicable
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (-[SUCoreDocumentation recommendedUpdateEnabled](self, "recommendedUpdateEnabled"))
  {
    [MEMORY[0x189612770] sharedDevice];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 productVersion];
    CFURLRef v4 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
    if (v5
      && (uint64_t v6 = (void *)v5,
          -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion"),
          id v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7)
      && v4)
    {
      -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 compare:v4 options:64];

      -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v4 compare:v10 options:64];

      BOOL v13 = v9 != 1 && v11 != 1;
      [MEMORY[0x1896127A0] sharedLogger];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 oslog];
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
        uint64_t v17 = -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
        uint32_t v18 = (void *)v17;
        v19 = @"NO";
        int v30 = 138544130;
        v31 = v16;
        if (v13) {
          v19 = @"YES";
        }
        __int16 v32 = 2114;
        uint64_t v33 = v4;
        __int16 v34 = 2114;
        uint64_t v35 = v17;
        __int16 v36 = 2114;
        uint64_t v37 = v19;
        _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] recommendedUpdateMinOSVersion=%{public}@ <= currentOSVersion=%{public}@ <= recommendedUpdateMa xOSVersion=%{public}@ | isRecommendedUpdateApplicable=%{public}@",  (uint8_t *)&v30,  0x2Au);
      }
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 oslog];
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDocumentation isRecommendedUpdateApplicable].cold.1(self, (uint64_t)v4, v15);
      }
      LOBYTE(v13) = 0;
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    CFURLRef v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation isRecommendedUpdateApplicable].cold.2((os_log_s *)v4, v21, v22, v23, v24, v25, v26, v27);
    }
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)softwareUpdateIconImagePath
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v3 = -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  if (!v3)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation softwareUpdateIconImagePath].cold.1(v10, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_9;
  }

  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  CFURLRef v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation softwareUpdateIconImagePath].cold.2(v10, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_9:
    int v8 = 0LL;
    goto LABEL_10;
  }

  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringByAppendingPathComponent:v7];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138543362;
    v29 = v8;
    _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Using icon path: %{public}@",  (uint8_t *)&v28,  0xCu);
  }

- (SUCoreDocumentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___SUCoreDocumentation;
  uint64_t v5 = -[SUCoreDocumentation init](&v60, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseNotesSummary"];
    releaseNotesSummary = v5->_releaseNotesSummary;
    v5->_releaseNotesSummary = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseNotes"];
    releaseNotes = v5->_releaseNotes;
    v5->_releaseNotes = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LicenseAgreement"];
    licenseAgreement = v5->_licenseAgreement;
    v5->_licenseAgreement = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateName"];
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateTitle"];
    humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
    v5->_humanReadableUpdateTitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateVersion"];
    humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
    v5->_humanReadableUpdateVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableMoreInfoLink"];
    humanReadableMoreInfoLink = v5->_humanReadableMoreInfoLink;
    v5->_humanReadableMoreInfoLink = (NSString *)v18;

    v5->_notificationEnabled = [v4 decodeBoolForKey:@"NotificationEnabled"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NotificationTitleString"];
    notificationTitleString = v5->_notificationTitleString;
    v5->_notificationTitleString = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NotificationBodyString"];
    notificationBodyString = v5->_notificationBodyString;
    v5->_notificationBodyString = (NSString *)v22;

    v5->_recommendedUpdateEnabled = [v4 decodeBoolForKey:@"RecommendedUpdateEnabled"];
    v5->_recommendedUpdateApplicable = [v4 decodeBoolForKey:@"RecommendedUpdateApplicable"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateNotificationFrequencyDays"];
    recommendedUpdateNotificationFrequencyDays = v5->_recommendedUpdateNotificationFrequencyDays;
    v5->_recommendedUpdateNotificationFrequencyDays = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateMinOSVersion"];
    recommendedUpdateMinOSVersion = v5->_recommendedUpdateMinOSVersion;
    v5->_recommendedUpdateMinOSVersion = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateMaxOSVersion"];
    recommendedUpdateMaxOSVersion = v5->_recommendedUpdateMaxOSVersion;
    v5->_recommendedUpdateMaxOSVersion = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateTitleString"];
    recommendedUpdateTitleString = v5->_recommendedUpdateTitleString;
    v5->_recommendedUpdateTitleString = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateAlertBodyString"];
    recommendedUpdateAlertBodyString = v5->_recommendedUpdateAlertBodyString;
    v5->_recommendedUpdateAlertBodyString = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MandatoryUpdateBodyString"];
    mandatoryUpdateBodyString = v5->_mandatoryUpdateBodyString;
    v5->_mandatoryUpdateBodyString = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SLAVersion"];
    slaVersion = v5->_slaVersion;
    v5->_slaVersion = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalBundleURL"];
    localBundleURL = v5->_localBundleURL;
    v5->_localBundleURL = (NSURL *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAssetURL"];
    serverAssetURL = v5->_serverAssetURL;
    v5->_serverAssetURL = (NSURL *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAssetMeasurement"];
    serverAssetMeasurement = v5->_serverAssetMeasurement;
    v5->_serverAssetMeasurement = (NSData *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAssetAlgorithm"];
    serverAssetAlgorithm = v5->_serverAssetAlgorithm;
    v5->_serverAssetAlgorithm = (NSString *)v46;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAssetChuckSize"];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serverAssetChunkSize = [v48 longLongValue];

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseNotesSummaryFileName"];
    releaseNotesSummaryFileName = v5->_releaseNotesSummaryFileName;
    v5->_releaseNotesSummaryFileName = (NSString *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseNotesFileName"];
    releaseNotesFileName = v5->_releaseNotesFileName;
    v5->_releaseNotesFileName = (NSString *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LicenseAgreementFileName"];
    licenseAgreementFileName = v5->_licenseAgreementFileName;
    v5->_licenseAgreementFileName = (NSString *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreferencesIconFileName"];
    preferencesIconFileName = v5->_preferencesIconFileName;
    v5->_preferencesIconFileName = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Language"];
    language = v5->_language;
    v5->_language = (NSString *)v57;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SUCoreDocumentation releaseNotesSummary](self, "releaseNotesSummary");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"ReleaseNotesSummary"];

  -[SUCoreDocumentation releaseNotes](self, "releaseNotes");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"ReleaseNotes"];

  -[SUCoreDocumentation licenseAgreement](self, "licenseAgreement");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"LicenseAgreement"];

  -[SUCoreDocumentation humanReadableUpdateName](self, "humanReadableUpdateName");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"HumanReadableUpdateName"];

  -[SUCoreDocumentation humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"HumanReadableUpdateTitle"];

  -[SUCoreDocumentation humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"HumanReadableUpdateVersion"];

  -[SUCoreDocumentation humanReadableMoreInfoLink](self, "humanReadableMoreInfoLink");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:@"HumanReadableMoreInfoLink"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCoreDocumentation notificationEnabled](self, "notificationEnabled"),  @"NotificationEnabled");
  -[SUCoreDocumentation notificationTitleString](self, "notificationTitleString");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"NotificationTitleString"];

  -[SUCoreDocumentation notificationBodyString](self, "notificationBodyString");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"NotificationBodyString"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCoreDocumentation recommendedUpdateEnabled](self, "recommendedUpdateEnabled"),  @"RecommendedUpdateEnabled");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCoreDocumentation recommendedUpdateApplicable](self, "recommendedUpdateApplicable"),  @"RecommendedUpdateApplicable");
  -[SUCoreDocumentation recommendedUpdateNotificationFrequencyDays](self, "recommendedUpdateNotificationFrequencyDays");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"RecommendedUpdateNotificationFrequencyDays"];

  -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v15 forKey:@"RecommendedUpdateMinOSVersion"];

  -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v16 forKey:@"RecommendedUpdateMaxOSVersion"];

  -[SUCoreDocumentation recommendedUpdateTitleString](self, "recommendedUpdateTitleString");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v17 forKey:@"RecommendedUpdateTitleString"];

  -[SUCoreDocumentation recommendedUpdateAlertBodyString](self, "recommendedUpdateAlertBodyString");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v18 forKey:@"RecommendedUpdateAlertBodyString"];
  v19 = -[SUCoreDocumentation mandatoryUpdateBodyString](self, "mandatoryUpdateBodyString");
  [v4 encodeObject:v19 forKey:@"MandatoryUpdateBodyString"];

  -[SUCoreDocumentation productVersion](self, "productVersion");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v20 forKey:@"ProductVersion"];

  -[SUCoreDocumentation slaVersion](self, "slaVersion");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v21 forKey:@"SLAVersion"];

  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v22 forKey:@"LocalBundleURL"];

  -[SUCoreDocumentation serverAssetURL](self, "serverAssetURL");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v23 forKey:@"ServerAssetURL"];

  -[SUCoreDocumentation serverAssetMeasurement](self, "serverAssetMeasurement");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v24 forKey:@"ServerAssetMeasurement"];

  -[SUCoreDocumentation serverAssetAlgorithm](self, "serverAssetAlgorithm");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v25 forKey:@"ServerAssetAlgorithm"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  -[SUCoreDocumentation serverAssetChunkSize](self, "serverAssetChunkSize"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v26 forKey:@"ServerAssetChuckSize"];

  -[SUCoreDocumentation releaseNotesSummaryFileName](self, "releaseNotesSummaryFileName");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v27 forKey:@"ReleaseNotesSummaryFileName"];

  -[SUCoreDocumentation releaseNotesFileName](self, "releaseNotesFileName");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v28 forKey:@"ReleaseNotesFileName"];
  v29 = -[SUCoreDocumentation licenseAgreementFileName](self, "licenseAgreementFileName");
  [v4 encodeObject:v29 forKey:@"LicenseAgreementFileName"];

  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v30 forKey:@"PreferencesIconFileName"];

  -[SUCoreDocumentation language](self, "language");
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v31 forKey:@"Language"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v22 = objc_alloc(NSString);
  -[SUCoreDocumentation releaseNotesSummary](self, "releaseNotesSummary");
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation releaseNotes](self, "releaseNotes");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation licenseAgreement](self, "licenseAgreement");
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation humanReadableUpdateName](self, "humanReadableUpdateName");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation humanReadableMoreInfoLink](self, "humanReadableMoreInfoLink");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreDocumentation notificationEnabled](self, "notificationEnabled")) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  uint64_t v20 = v3;
  -[SUCoreDocumentation notificationTitleString](self, "notificationTitleString");
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SUCoreDocumentation notificationBodyString](self, "notificationBodyString");
  if (-[SUCoreDocumentation recommendedUpdateEnabled](self, "recommendedUpdateEnabled")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  uint64_t v18 = v4;
  if (-[SUCoreDocumentation recommendedUpdateApplicable](self, "recommendedUpdateApplicable")) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  uint64_t v17 = v5;
  -[SUCoreDocumentation recommendedUpdateNotificationFrequencyDays](self, "recommendedUpdateNotificationFrequencyDays");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[SUCoreDocumentation recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
  -[SUCoreDocumentation recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation recommendedUpdateTitleString](self, "recommendedUpdateTitleString");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation recommendedUpdateAlertBodyString](self, "recommendedUpdateAlertBodyString");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation mandatoryUpdateBodyString](self, "mandatoryUpdateBodyString");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation productVersion](self, "productVersion");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation slaVersion](self, "slaVersion");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation serverAssetURL](self, "serverAssetURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation serverAssetMeasurement](self, "serverAssetMeasurement");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation serverAssetAlgorithm](self, "serverAssetAlgorithm");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation language](self, "language");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation releaseNotesSummaryFileName](self, "releaseNotesSummaryFileName");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation releaseNotesFileName](self, "releaseNotesFileName");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation licenseAgreementFileName](self, "licenseAgreementFileName");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation preferencesIconFileName](self, "preferencesIconFileName");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = (void *)[v22 initWithFormat:@"\n[>>>\n                        releaseNotesSummary: %@\n                               releaseNotes: %@\n                           licenseAgreement: %@\n                    humanReadableUpdateName: %@\n                   humanReadableUpdateTitle: %@\n                 humanReadableUpdateVersion: %@\n                  humanReadableMoreInfoLink: %@\n                        notificationEnabled: %@\n                    notificationTitleString: %@\n                     notificationBodyString: %@\n                   recommendedUpdateEnabled: %@\n                recommendedUpdateApplicable: %@\n recommendedUpdateNotificationFrequencyDays: %@\n              recommendedUpdateMinOSVersion: %@\n              recommendedUpdateMaxOSVersion: %@\n               recommendedUpdateTitleString: %@\n           recommendedUpdateAlertBodyString: %@\n                  mandatoryUpdateBodyString: %@\n                             productVersion: %@\n                                 slaVersion: %@\n                             localBundleURL: %@\n                             serverAssetURL: %@\n                     serverAssetMeasurement: %@\n                       serverAssetAlgorithm: %@\n                                   language: %@\n                releaseNotesSummaryFileName: %@\n                       releaseNotesFileName: %@\n                   licenseAgreementFileName: %@\n                    preferencesIconFileName: %@\n<<<]", v35, v37, v32, v36, v34, v21, v33, v20, v31, v19, v18, v17, v30, v29, v28, v27, v26, v25, v24, v16, v15, v6, v7, v8, v9, v10, v11, v12, v13];

  return v23;
}

- (id)summary
{
  id v3 = objc_alloc(NSString);
  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation serverAssetURL](self, "serverAssetURL");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v3 initWithFormat:@"localBundleURL:%@, serverAssetURL:%@", v4, v5];

  return v6;
}

- (NSData)releaseNotesSummary
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setReleaseNotesSummary:(id)a3
{
}

- (NSData)releaseNotes
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setReleaseNotes:(id)a3
{
}

- (NSData)licenseAgreement
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLicenseAgreement:(id)a3
{
}

- (NSString)humanReadableUpdateName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSString)humanReadableUpdateTitle
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setHumanReadableUpdateTitle:(id)a3
{
}

- (NSString)humanReadableUpdateVersion
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setHumanReadableUpdateVersion:(id)a3
{
}

- (NSString)humanReadableMoreInfoLink
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setHumanReadableMoreInfoLink:(id)a3
{
}

- (BOOL)notificationEnabled
{
  return self->_notificationEnabled;
}

- (void)setNotificationEnabled:(BOOL)a3
{
  self->_notificationEnabled = a3;
}

- (NSString)notificationTitleString
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setNotificationTitleString:(id)a3
{
}

- (NSString)notificationBodyString
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setNotificationBodyString:(id)a3
{
}

- (BOOL)recommendedUpdateEnabled
{
  return self->_recommendedUpdateEnabled;
}

- (void)setRecommendedUpdateEnabled:(BOOL)a3
{
  self->_recommendedUpdateEnabled = a3;
}

- (BOOL)recommendedUpdateApplicable
{
  return self->_recommendedUpdateApplicable;
}

- (void)setRecommendedUpdateApplicable:(BOOL)a3
{
  self->_recommendedUpdateApplicable = a3;
}

- (NSNumber)recommendedUpdateNotificationFrequencyDays
{
  return (NSNumber *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setRecommendedUpdateNotificationFrequencyDays:(id)a3
{
}

- (NSString)recommendedUpdateMinOSVersion
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setRecommendedUpdateMinOSVersion:(id)a3
{
}

- (NSString)recommendedUpdateMaxOSVersion
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setRecommendedUpdateMaxOSVersion:(id)a3
{
}

- (NSString)recommendedUpdateTitleString
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setRecommendedUpdateTitleString:(id)a3
{
}

- (NSString)recommendedUpdateAlertBodyString
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setRecommendedUpdateAlertBodyString:(id)a3
{
}

- (NSString)mandatoryUpdateBodyString
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setMandatoryUpdateBodyString:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setProductVersion:(id)a3
{
}

- (NSNumber)slaVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setSlaVersion:(id)a3
{
}

- (NSURL)localBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setLocalBundleURL:(id)a3
{
}

- (NSURL)serverAssetURL
{
  return (NSURL *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setServerAssetURL:(id)a3
{
}

- (NSData)serverAssetMeasurement
{
  return (NSData *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setServerAssetMeasurement:(id)a3
{
}

- (NSString)serverAssetAlgorithm
{
  return (NSString *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setServerAssetAlgorithm:(id)a3
{
}

- (int64_t)serverAssetChunkSize
{
  return self->_serverAssetChunkSize;
}

- (void)setServerAssetChunkSize:(int64_t)a3
{
  self->_serverAssetChunkSize = a3;
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)releaseNotesSummaryFileName
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setReleaseNotesSummaryFileName:(id)a3
{
}

- (NSString)releaseNotesFileName
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setReleaseNotesFileName:(id)a3
{
}

- (NSString)licenseAgreementFileName
{
  return (NSString *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setLicenseAgreementFileName:(id)a3
{
}

- (NSString)preferencesIconFileName
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setPreferencesIconFileName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)isRecommendedUpdateApplicable
{
  OUTLINED_FUNCTION_0( &dword_187A54000,  a1,  a3,  "[DOCUMENTATION] recommendedUpdateEnabled=NO | isRecommendedUpdateApplicable=NO",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_2_1();
}

- (void)softwareUpdateIconImagePath
{
}

@end