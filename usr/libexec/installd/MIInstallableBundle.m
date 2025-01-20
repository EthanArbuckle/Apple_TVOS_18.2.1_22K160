@interface MIInstallableBundle
+ (BOOL)_getEligibilityForDomain:(unint64_t)a3 forBundle:(id)a4 isEligible:(BOOL *)a5 ineligibilityReason:(id *)a6 error:(id *)a7;
+ (BOOL)_shouldSkipEligibilityChecksForAppWithSigningInfo:(id)a3;
+ (BOOL)_shouldSkipEligibilityChecksForAuthorizingAppWithBundleID:(id)a3 persona:(id)a4;
+ (BOOL)_shouldSkipEligibilityChecksForInstallRequestorWithAuditToken:(id *)a3 persona:(id)a4 authorizingBundleID:(id *)a5;
+ (unint64_t)_domainForBrowserEligibilityForApp:(id)a3 withSigningInfo:(id)a4 distributorInfo:(id)a5 isWebDistribution:(BOOL)a6 operationType:(unint64_t)a7;
+ (unint64_t)_domainForMarketplaceEligibilityForApp:(id)a3 withSigningInfo:(id)a4 isWebDistribution:(BOOL)a5 distributorInfo:(id)a6 operationType:(unint64_t)a7;
- (BOOL)_captureDataFromStagingRootOrBundle:(id)a3 toContainer:(id)a4 withError:(id *)a5;
- (BOOL)_checkCanInstallWithError:(id *)a3;
- (BOOL)_checkEligibilityForAppWithSigningInfo:(id)a3 distributorInfo:(id)a4 isWebDistribution:(BOOL)a5 withError:(id *)a6;
- (BOOL)_getLinkedParentBundleID:(id *)a3 withError:(id *)a4;
- (BOOL)_handleStashMode:(unint64_t)a3 withError:(id *)a4;
- (BOOL)_handleStashOptionWithError:(id *)a3;
- (BOOL)_installEmbeddedProfilesWithError:(id *)a3;
- (BOOL)_linkToParentApplication:(id *)a3;
- (BOOL)_performAppClipSpecificValidationForEntitlements:(id)a3 isAppClip:(BOOL *)a4 withError:(id *)a5;
- (BOOL)_performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_performBuiltInAppUpgradeValidationWithSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_postFlightAppExtensionsWithError:(id *)a3;
- (BOOL)_preserveExistingPlaceholderAsParallelPlaceholderWithError:(id *)a3;
- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4;
- (BOOL)_setBundleMetadataWithError:(id *)a3;
- (BOOL)_setLaunchWarningDataWithError:(id *)a3;
- (BOOL)_setLinkageInBundleMetadata:(id)a3 error:(id *)a4;
- (BOOL)_validateAppManagementDomainForSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_validateApplicationIdentifierForNewBundleSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_validateITunesMetadataOptionWithError:(id *)a3;
- (BOOL)_validateLinkedParentForSigningInfo:(id)a3 appManagementDomainValue:(unint64_t)a4 error:(id *)a5;
- (BOOL)_validateSinfsWithError:(id *)a3;
- (BOOL)_validateiTunesMetadataWithError:(id *)a3;
- (BOOL)_verifyBundleMetadataWithError:(id *)a3;
- (BOOL)_writeData:(id)a3 toFile:(id)a4 inContainerAtURL:(id)a5 legacyErrorString:(id)a6 error:(id *)a7;
- (BOOL)_writeOptionsDataToBundle:(id)a3 orContainer:(id)a4 error:(id *)a5;
- (BOOL)finalizeInstallationWithError:(id *)a3;
- (BOOL)isPlaceholderInstall;
- (BOOL)performInstallationWithError:(id *)a3;
- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3;
- (BOOL)performPreflightWithError:(id *)a3;
- (BOOL)performVerificationWithError:(id *)a3;
- (BOOL)postFlightInstallationWithError:(id *)a3;
- (BOOL)stageBackgroundUpdate:(id *)a3 withError:(id *)a4;
- (BOOL)xpcServiceBundlesEnabled;
- (MIBundleContainer)bundleContainer;
- (MIBundleContainer)existingBundleContainer;
- (MICodeSigningInfo)bundleSigningInfo;
- (MIDataContainer)dataContainer;
- (MIInstallableBundle)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 existingBundleContainer:(id)a9 operationType:(unint64_t)a10 error:(id *)a11;
- (MIInstallationJournalEntry)journalEntry;
- (NSArray)appExtensionBundles;
- (NSArray)appExtensionDataContainers;
- (NSArray)frameworkBundles;
- (NSArray)xpcServiceBundles;
- (NSMutableDictionary)identifiersMap;
- (NSURL)upgradingBuiltInAppAtURL;
- (id)_builtInAppUpgradeFailureError;
- (id)_createJournalEntry;
- (id)_noLongerPresentAppExtensionDataContainers;
- (id)_validateBundle:(id)a3 validatingResources:(BOOL)a4 performingOnlineAuthorization:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 allowingFreeProfileValidation:(BOOL)a7 skippingProfileIDValidation:(BOOL)a8 error:(id *)a9;
- (id)launchServicesBundleRecordsWithError:(id *)a3;
- (id)recordPromise;
- (unint64_t)_installationJournalOperationType;
- (unint64_t)eligibilityOperationType;
- (void)dealloc;
- (void)setAppExtensionBundles:(id)a3;
- (void)setAppExtensionDataContainers:(id)a3;
- (void)setBundleContainer:(id)a3;
- (void)setBundleSigningInfo:(id)a3;
- (void)setDataContainer:(id)a3;
- (void)setFrameworkBundles:(id)a3;
- (void)setIdentifiersMap:(id)a3;
- (void)setJournalEntry:(id)a3;
- (void)setUpgradingBuiltInAppAtURL:(id)a3;
- (void)setXpcServiceBundles:(id)a3;
- (void)setXpcServiceBundlesEnabled:(BOOL)a3;
@end

@implementation MIInstallableBundle

- (id)recordPromise
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle journalEntry](self, "journalEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 recordPromise]);

  return v3;
}

- (MIInstallableBundle)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 existingBundleContainer:(id)a9 operationType:(unint64_t)a10 error:(id *)a11
{
  uint64_t v13 = a5;
  id v17 = a8;
  id v21 = a9;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  v18 = -[MIInstallable initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:operationType:error:]( &v22,  "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:operationType:error:",  a3,  a4,  v13,  a6,  a7,  v17,  a10,  a11);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_existingBundleContainer, a9);
  }

  return v19;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  sub_10003926C(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle dataContainer](self, "dataContainer"));
  sub_10003926C(v4);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionDataContainers](self, "appExtensionDataContainers"));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_10003926C(*(void **)(*((void *)&v11 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  -[MIInstallableBundle dealloc](&v10, "dealloc");
}

- (unint64_t)eligibilityOperationType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v4 = [v3 installIntent];

  if (v4 == (id)3) {
    return 2LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundle]);
    unint64_t v5 = [v8 isPlaceholder] ^ 1;
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)_verifyBundleMetadataWithError:(id *)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
  {
    id v6 = 0LL;
  }

  else
  {
    id v23 = 0LL;
    unsigned int v10 = [v5 isApplicableToCurrentDeviceFamilyWithError:&v23];
    id v11 = v23;
    id v12 = v11;
    if (!v10) {
      goto LABEL_16;
    }
    id v22 = v11;
    unsigned __int8 v13 = [v5 isApplicableToCurrentOSVersionWithError:&v22];
    id v6 = v22;

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
        MOLogWrite(v14);
      }

      goto LABEL_17;
    }
  }

  unsigned int v7 = [v5 bundleType];
  if (v7 - 1 < 5 || v7 == 9)
  {
    id v21 = v6;
    unsigned int v8 = [v5 validateAppMetadataWithError:&v21];
    id v9 = v21;

    id v6 = v9;
    if (!v8) {
      goto LABEL_17;
    }
  }

  if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
  {
    BOOL v16 = 1;
    goto LABEL_20;
  }

  id v20 = v6;
  unsigned __int8 v17 = [v5 thinningMatchesCurrentDeviceWithError:&v20];
  id v12 = v20;

  if ((v17 & 1) != 0)
  {
    BOOL v16 = 1;
    id v6 = v12;
    goto LABEL_20;
  }

- (BOOL)_installEmbeddedProfilesWithError:(id *)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  id v7 = [v5 installEmbeddedProvisioningProfileWithProgress:v6];

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v9 = [v8 provisioningProfileInstallFailureIsFatal];

  if (MIIsFatalMISProfileInstallationError(v7, v9))
  {
    unsigned int v10 = (void *)MIInstallerErrorDomain;
    v56[0] = @"LegacyErrorString";
    v56[1] = MILibMISErrorNumberKey;
    v57[0] = @"ApplicationVerificationFailed";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    v57[1] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  2LL));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    uint64_t v15 = MIErrorStringForMISError(v7);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v18 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _installEmbeddedProfilesWithError:]",  321LL,  v10,  13LL,  0LL,  v12,  @"Failed to install embedded profile for %@ : 0x%08x (%@)",  v17,  (uint64_t)v14);
LABEL_23:
    v34 = (void *)objc_claimAutoreleasedReturnValue(v18);

    BOOL v33 = 0;
  }

  else
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    id v19 = [v11 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v47;
      while (2)
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v47 != v21) {
            objc_enumerationMutation(v11);
          }
          id v23 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
          id v25 = [v23 installEmbeddedProvisioningProfileWithProgress:v24];

          if ((MIIsFatalMISProfileInstallationError(v25, v9) & 1) != 0)
          {
            v35 = (void *)MIInstallerErrorDomain;
            v53[0] = @"LegacyErrorString";
            v53[1] = MILibMISErrorNumberKey;
            v54[0] = @"ApplicationVerificationFailed";
            id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v25));
            v54[1] = v12;
            unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  2LL));
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
            uint64_t v36 = MIErrorStringForMISError(v25);
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v36);
            uint64_t v41 = (uint64_t)v14;
            uint64_t v38 = 328LL;
LABEL_22:
            id v18 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _installEmbeddedProfilesWithError:]",  v38,  v35,  13LL,  0LL,  v13,  @"Failed to install embedded profile for %@ : 0x%08x (%@)",  v37,  v41);
            goto LABEL_23;
          }
        }

        id v20 = [v11 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
    id v26 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v43;
      while (2)
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v11);
          }
          v30 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
          id v32 = [v30 installEmbeddedProvisioningProfileWithProgress:v31];

          if (MIIsFatalMISProfileInstallationError(v32, v9))
          {
            v35 = (void *)MIInstallerErrorDomain;
            v50[0] = @"LegacyErrorString";
            v50[1] = MILibMISErrorNumberKey;
            v51[0] = @"ApplicationVerificationFailed";
            id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v32));
            v51[1] = v12;
            unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  2LL));
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
            uint64_t v39 = MIErrorStringForMISError(v32);
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v39);
            uint64_t v41 = (uint64_t)v14;
            uint64_t v38 = 336LL;
            goto LABEL_22;
          }
        }

        id v27 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
        BOOL v33 = 1;
        if (v27) {
          continue;
        }
        break;
      }

      v34 = 0LL;
    }

    else
    {
      v34 = 0LL;
      BOOL v33 = 1;
    }
  }

  if (a3 && !v33) {
    *a3 = v34;
  }

  return v33;
}

- (BOOL)_checkCanInstallWithError:(id *)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  unsigned int v6 = [v5 bundleType];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 builtInFrameworkBundleIDs]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  unsigned int v11 = [v8 containsObject:v10];

  if (v11)
  {
    id v12 = (void *)MIInstallerErrorDomain;
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    id v16 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]",  383LL,  v12,  57LL,  0LL,  &off_10008ABD8,  @"A system framework has the bundle ID %@ so an app with the same identifier cannot be installed.",  v15,  (uint64_t)v14);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);

LABEL_3:
    id v18 = 0LL;
    goto LABEL_4;
  }

  id v17 = 0LL;
  BOOL v19 = 1;
  unsigned int v20 = v6 - 1;
  id v18 = 0LL;
  switch(v20)
  {
    case 0u:
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 systemAppBundleIDToInfoMap]);

      if (v22) {
        goto LABEL_14;
      }
      v24 = (void *)MIInstallerErrorDomain;
      id v25 = @"Failed to get system app map";
      uint64_t v26 = 398LL;
      goto LABEL_44;
    case 1u:
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v27 internalAppBundleIDToInfoMap]);

      if (v22) {
        goto LABEL_14;
      }
      v24 = (void *)MIInstallerErrorDomain;
      id v25 = @"Failed to get internal app map";
      uint64_t v26 = 420LL;
      goto LABEL_44;
    case 2u:
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MIDiskImageManager sharedInstance](&OBJC_CLASS___MIDiskImageManager, "sharedInstance"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
      uint64_t v30 = objc_claimAutoreleasedReturnValue([v22 diskImageAppInfoForBundleID:v29]);
      goto LABEL_15;
    case 3u:
      goto LABEL_41;
    case 4u:
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v31 coreServicesAppBundleIDToInfoMap]);

      if (!v22)
      {
        v24 = (void *)MIInstallerErrorDomain;
        id v25 = @"Failed to get core services app map";
        uint64_t v26 = 406LL;
LABEL_44:
        id v61 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]",  v26,  v24,  4LL,  0LL,  0LL,  v25,  v23,  (uint64_t)v65);
        id v17 = (id)objc_claimAutoreleasedReturnValue(v61);
        goto LABEL_3;
      }

- (BOOL)_validateITunesMetadataOptionWithError:(id *)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sinfData]);

  if (!v7 || (id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 iTunesMetadata])) == 0)
  {
    id v19 = 0LL;
    id v18 = 0LL;
    id v12 = 0LL;
    id v16 = 0LL;
    unsigned int v10 = 0LL;
    BOOL v20 = 1;
    goto LABEL_11;
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleVersion]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByTrimmingCharactersInSet:v5]);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleVersion]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByTrimmingCharactersInSet:v5]);

  if (v10 && v12 && ([v10 isEqualToString:v12] & 1) == 0)
  {
    id v23 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateITunesMetadataOptionWithError:]",  517LL,  MIInstallerErrorDomain,  79LL,  0LL,  &off_10008AC28,  @"iTunesMetadata.plist content supplied to install command specified bundleVersion (%@) that did not match app's CFBundleVersion (%@).",  v13,  (uint64_t)v12);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v23);
    id v16 = 0LL;
    id v18 = 0LL;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleShortVersion]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByTrimmingCharactersInSet:v5]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleShortVersionString]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByTrimmingCharactersInSet:v5]);

  id v19 = 0LL;
  BOOL v20 = 1;
  if (v16 && v18)
  {
    if ([v16 isEqualToString:v18])
    {
      id v19 = 0LL;
      goto LABEL_11;
    }

    id v24 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateITunesMetadataOptionWithError:]",  525LL,  MIInstallerErrorDomain,  79LL,  0LL,  &off_10008AC50,  @"iTunesMetadata.plist content supplied to install command specified bundleShortVersionString (%@) that did not match app's CFBundleShortVersionString (%@).",  v21,  (uint64_t)v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v24);
    if (!a3)
    {
LABEL_15:
      BOOL v20 = 0;
      goto LABEL_11;
    }

- (BOOL)performPreflightWithError:(id *)a3
{
  unsigned int v5 = -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall");
  unsigned int v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(void, const __CFString *, uint64_t))v6)[2](v6, @"PreflightingApplication", 30LL);

  v130.receiver = self;
  v130.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  id v131 = 0LL;
  unsigned int v7 = -[MIInstallable performPreflightWithError:](&v130, "performPreflightWithError:", &v131);
  id v8 = v131;
  if (!v7) {
    goto LABEL_63;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  unsigned int v10 = v9;
  if (v5)
  {
    id v129 = v8;
    unsigned __int8 v11 = [v9 setIsPlaceholderWithError:&v129];
    id v12 = v129;

    if ((v11 & 1) == 0)
    {
LABEL_65:
      BOOL v61 = 0;
      id v8 = v12;
      if (!a3) {
        goto LABEL_68;
      }
      goto LABEL_66;
    }
  }

  else
  {
    id v128 = v8;
    unsigned int v13 = [v9 executableExistsWithError:&v128];
    id v12 = v128;

    if (!v13) {
      goto LABEL_65;
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  unsigned int v15 = [v14 bundleType];

  if (v15 - 1 < 5 || v15 == 9)
  {
    id v127 = v12;
    unsigned int v16 = -[MIInstallableBundle _validateITunesMetadataOptionWithError:]( self,  "_validateITunesMetadataOptionWithError:",  &v127);
    id v8 = v127;

    if (v16)
    {
      id v12 = v8;
      goto LABEL_10;
    }

- (id)_validateBundle:(id)a3 validatingResources:(BOOL)a4 performingOnlineAuthorization:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 allowingFreeProfileValidation:(BOOL)a7 skippingProfileIDValidation:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v15 = a3;
  id v34 = 0LL;
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 codeSigningInfoByValidatingResources:v13 performingOnlineAuthorization:v12 ignoringCachedSigningInfo:1 checkin gTrustCacheIfApplicable:v11 skippingProfileIDValidation:v9 error:&v34]);
  id v17 = v34;
  id v18 = v17;
  if (v16)
  {
    if (!-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall")
      && [v15 codeSignatureVerificationState] != (id)2
      || -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall")
      && [v15 codeSignatureVerificationState] != (id)1)
    {
      uint64_t v28 = (void *)MIInstallerErrorDomain;
      id v29 = [v15 codeSignatureVerificationState];
      id v31 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingT rustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]",  1077LL,  v28,  4LL,  0LL,  0LL,  @"Unexpectedly failed to validate code signing (status %lu) for %@",  v30,  (uint64_t)v29);
      id v22 = (id)objc_claimAutoreleasedReturnValue(v31);
      goto LABEL_15;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 personaUniqueString]);
    id v33 = v18;
    unsigned int v21 = [v15 hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:v16 forPersona:v20 error:&v33];
    id v22 = v33;

    if (v21)
    {
      if ([v15 codeSignatureVerificationState] != (id)2
        || [v16 profileValidationType] != (id)3
        || a7)
      {
        id v27 = v16;
        goto LABEL_18;
      }

      id v23 = (void *)MIInstallerErrorDomain;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
      id v25 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingT rustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]",  1086LL,  v23,  111LL,  0LL,  &off_10008ACF0,  @"The bundle being installed with bundle ID %@ is authorized by a free provisioning profile, but apps validated by those are not allowed to be installed from this source.",  v24,  (uint64_t)v18);
      uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);

      id v22 = (id)v26;
LABEL_15:

      if (!a9) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
  }

  else
  {
    id v22 = v17;
  }

  if (!a9)
  {
LABEL_16:
    id v27 = 0LL;
    goto LABEL_18;
  }

- (BOOL)_validateApplicationIdentifierForNewBundleSigningInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 entitlements]);
  id v8 = sub_100045820(v7);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9) {
    goto LABEL_2;
  }
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  if ([v28 codeSigningEnforcementIsDisabled])
  {
    id v29 = [v6 codeSignerType];

    if (v29 == (id)1)
    {
      uint64_t v31 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v56 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
        MOLogWrite(v31);
      }

- (BOOL)_getLinkedParentBundleID:(id *)a3 withError:(id *)a4
{
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 linkedParentBundleID]);

  id v11 = 0LL;
  if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall") && !v10)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    BOOL v13 = v12;
    if (v12)
    {
      id v20 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleMetadataWithError:&v20]);
      id v16 = v20;
      if (!v14)
      {
        id v19 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _getLinkedParentBundleID:withError:]",  1375LL,  MIInstallerErrorDomain,  4LL,  v16,  0LL,  @"Failed to read previously set bundle metadata for %@",  v15,  (uint64_t)v8);
        id v11 = (id)objc_claimAutoreleasedReturnValue(v19);

        if (a4)
        {
          id v11 = v11;
          id v10 = 0LL;
          BOOL v17 = 0;
          *a4 = v11;
        }

        else
        {
          id v10 = 0LL;
          BOOL v17 = 0;
        }

        goto LABEL_11;
      }

      id v10 = (id)objc_claimAutoreleasedReturnValue([v14 linkedParentBundleID]);
    }

    else
    {
      id v10 = 0LL;
      id v16 = 0LL;
    }

    id v11 = v16;
  }

  if (a3)
  {
    id v10 = v10;
    *a3 = v10;
  }

  BOOL v17 = 1;
LABEL_11:

  return v17;
}

- (BOOL)_validateLinkedParentForSigningInfo:(id)a3 appManagementDomainValue:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned int v9 = -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v11 = [v10 localSigningIsUnrestricted];

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

  id v14 = [v8 codeSignerType];
  id v41 = 0LL;
  id v42 = 0LL;
  LODWORD(self) = -[MIInstallableBundle _getLinkedParentBundleID:withError:]( self,  "_getLinkedParentBundleID:withError:",  &v42,  &v41);
  id v15 = v42;
  id v17 = v41;
  if (!(_DWORD)self) {
    goto LABEL_43;
  }
  v40 = a5;
  if (!v15)
  {
    LOBYTE(v19) = 0;
    goto LABEL_17;
  }

  id v18 = v15;
  if ([v18 isEqualToString:@"com.apple.Playgrounds"])
  {

    LOBYTE(v19) = 1;
    goto LABEL_17;
  }

  uint64_t v39 = (uint64_t)v13;
  char v44 = 0;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
  id v43 = 0LL;
  unsigned int v21 = [v20 isRunningInTestMode:&v44 outError:&v43];
  id v38 = v43;

  if (!v21)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      MOLogWrite(qword_100095BF8);
      id v22 = v38;
      unsigned int v19 = 0;
      BOOL v13 = (void *)v39;
      goto LABEL_14;
    }

    goto LABEL_12;
  }

  if (!v44)
  {
LABEL_12:
    unsigned int v19 = 0;
    goto LABEL_13;
  }

  unsigned int v19 = [v18 isEqualToString:@"com.apple.mock.Playgrounds"];
LABEL_13:
  id v22 = v38;
  BOOL v13 = (void *)v39;
LABEL_14:

  if (((v19 | v11) & 1) == 0)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
    unsigned __int8 v24 = [v23 testFlagsAreSet:4];

    if ((v24 & 1) == 0)
    {
      BOOL v13 = (void *)v39;
      id v35 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]",  1418LL,  MIInstallerErrorDomain,  195LL,  0LL,  &off_10008AD68,  @"App %@ specified %@ as its linked parent app but that app isn't an allowed parent app.",  v16,  v39);
      goto LABEL_41;
    }

    LOBYTE(v19) = 0;
    BOOL v13 = (void *)v39;
  }

- (BOOL)_validateAppManagementDomainForSigningInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 entitlements]);
  uint64_t v10 = sub_100045A80(v9);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned __int8 v12 = [v11 localSigningIsUnrestricted];

  if (v10 || (v12 & 1) != 0)
  {
    id v21 = 0LL;
    BOOL v18 = -[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]( self,  "_validateLinkedParentForSigningInfo:appManagementDomainValue:error:",  v6,  v10,  &v21);
    id v17 = v21;
    if (!a4) {
      goto LABEL_8;
    }
  }

  else
  {
    BOOL v13 = (void *)MIInstallerErrorDomain;
    id v14 = sub_1000459A8(v9);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateAppManagementDomainForSigningInfo:error:]",  1480LL,  v13,  194LL,  0LL,  0LL,  @"App %@ has a value for its %@ entitlement that is not allowed: %@.",  v15,  (uint64_t)v8);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);

    BOOL v18 = 0;
    if (!a4) {
      goto LABEL_8;
    }
  }

  if (!v18) {
    *a4 = v17;
  }
LABEL_8:

  return v18;
}

- (BOOL)_performAppClipSpecificValidationForEntitlements:(id)a3 isAppClip:(BOOL *)a4 withError:(id *)a5
{
  unsigned int v8 = sub_100045768(a3);
  if (v8)
  {
    unsigned int v9 = (void *)MIInstallerErrorDomain;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v13 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]",  1592LL,  v9,  156LL,  0LL,  &off_10008AE58,  @"Attempted to install an app clip with bundleID %@ on a platform that doesn't support it",  v12,  (uint64_t)v11);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  id v14 = 0LL;
  if (a4) {
LABEL_5:
  }
    *a4 = v8;
LABEL_6:
  if (a5 && v8) {
    *a5 = v14;
  }

  return v8 ^ 1;
}

- (BOOL)_performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v103 = 0LL;
  id v104 = &v103;
  uint64_t v105 = 0x3032000000LL;
  id v106 = sub_10003C904;
  id v107 = sub_10003C914;
  id v108 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 entitlements]);
  unsigned int v8 = sub_100045F68(v7);
  v81 = v5;
  unsigned int v82 = v6;
  if (((sub_100045F78(v7) ^ 1 | v8) & 1) == 0)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 relativePath]);
    id v16 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]",  1625LL,  MIInstallerErrorDomain,  216LL,  0LL,  0LL,  @"%@ has the %@ entitlement, but it does not have the %@ entitlement. The %@ entitlement is only available to apps with the %@ entitlement.",  v15,  (uint64_t)v11);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_5;
  }

  unsigned int v9 = sub_100045E40(v7);
  unsigned int v10 = sub_100045E50(v7);
  if ((v9 & v10) == 1)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 relativePath]);
    id v13 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]",  1636LL,  MIInstallerErrorDomain,  212LL,  0LL,  0LL,  @"%@ has both the %@ entitlement and the %@ entitlement. Only one of these entitlements may be present at a time. Remove one of these entitlements to allow this app to be installed.",  v12,  (uint64_t)v11);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
LABEL_5:
    id v17 = (id)v104[5];
    v104[5] = v14;
LABEL_6:

    BOOL v18 = 0;
    goto LABEL_7;
  }

  if ((v10 & v8) == 1)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 relativePath]);
    id v22 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]",  1643LL,  MIInstallerErrorDomain,  214LL,  0LL,  0LL,  @"%@ has the %@ entitlement so it may not also have the %@ entitlement. Remove one of these entitlements to allow this app to be installed.",  v21,  (uint64_t)v11);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v22);
    goto LABEL_5;
  }

  if (!v9) {
    goto LABEL_22;
  }
  if (MGGetBoolAnswer(@"li+w2foswFu0srn5UxdOug"))
  {
    if (![(id)objc_opt_class(self) _shouldSkipEligibilityChecksForAppWithSigningInfo:v5])
    {
      if ((v8 & 1) != 0)
      {
        v40 = (id *)(v104 + 5);
        id v102 = (id)v104[5];
        unsigned __int8 v41 = [v6 hasExecutableSliceForCPUType:16777228 subtype:2 error:&v102];
        objc_storeStrong(v40, v102);
        if ((v41 & 1) == 0)
        {
          id v49 = (void *)v104[5];
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 relativePath]);
          id v51 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]",  1676LL,  MIInstallerErrorDomain,  202LL,  v49,  0LL,  @"%@ is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.",  v50,  (uint64_t)v11);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(v51);
          goto LABEL_5;
        }

        id v42 = (void *)v104[5];
        v104[5] = 0LL;

        v99[0] = _NSConcreteStackBlock;
        v99[1] = 3221225472LL;
        v99[2] = sub_10003C91C;
        v99[3] = &unk_100081858;
        v101 = &v103;
        id v100 = v6;
        id v43 = (void *)objc_claimAutoreleasedReturnValue([v100 enumerateDylibsWithBlock:v99]);
        unsigned int v11 = v43;
        char v44 = v104;
        if (!v104[5])
        {
          if (!v43)
          {
            __int128 v97 = 0u;
            __int128 v98 = 0u;
            __int128 v95 = 0u;
            __int128 v96 = 0u;
            unsigned int v52 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
            id v53 = [v52 countByEnumeratingWithState:&v95 objects:v111 count:16];
            if (v53)
            {
              uint64_t v54 = *(void *)v96;
              id v80 = v52;
              while (2)
              {
                for (i = 0LL; i != v53; i = (char *)i + 1)
                {
                  if (*(void *)v96 != v54) {
                    objc_enumerationMutation(v80);
                  }
                  v56 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)i);
                  v57 = (id *)(v104 + 5);
                  id v94 = (id)v104[5];
                  unsigned __int8 v58 = [v56 hasExecutableSliceForCPUType:16777228 subtype:2 error:&v94];
                  objc_storeStrong(v57, v94);
                  if ((v58 & 1) == 0)
                  {
                    v67 = (void *)v104[5];
                    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v56 relativePath]);
                    id v70 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]",  1715LL,  MIInstallerErrorDomain,  202LL,  v67,  0LL,  @"%@ is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.",  v69,  (uint64_t)v68);
                    uint64_t v71 = objc_claimAutoreleasedReturnValue(v70);
                    uint64_t v72 = (void *)v104[5];
                    v104[5] = v71;

LABEL_66:
                    BOOL v46 = v80;
                    goto LABEL_67;
                  }
                }

                unsigned int v52 = v80;
                id v53 = [v80 countByEnumeratingWithState:&v95 objects:v111 count:16];
                if (v53) {
                  continue;
                }
                break;
              }
            }

            if (sub_1000453D8(v7))
            {
              __int128 v93 = 0u;
              __int128 v91 = 0u;
              __int128 v92 = 0u;
              __int128 v90 = 0u;
              id v59 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
              id v60 = [v59 countByEnumeratingWithState:&v90 objects:v110 count:16];
              id v80 = v59;
              if (v60)
              {
                uint64_t v61 = *(void *)v91;
                while (2)
                {
                  id v62 = v60;
                  for (j = 0LL; j != v62; j = (char *)j + 1)
                  {
                    if (*(void *)v91 != v61) {
                      objc_enumerationMutation(v80);
                    }
                    id v64 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)j);
                    v65 = (id *)(v104 + 5);
                    id v89 = (id)v104[5];
                    unsigned __int8 v66 = [v64 hasExecutableSliceForCPUType:16777228 subtype:2 error:&v89];
                    objc_storeStrong(v65, v89);
                    if ((v66 & 1) == 0)
                    {
                      v73 = (void *)v104[5];
                      v74 = (void *)objc_claimAutoreleasedReturnValue([v64 relativePath]);
                      id v76 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSi gningInfo:error:]",  1734LL,  MIInstallerErrorDomain,  202LL,  v73,  0LL,  @"%@ is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.",  v75,  (uint64_t)v74);
                      uint64_t v77 = objc_claimAutoreleasedReturnValue(v76);
                      uint64_t v78 = (void *)v104[5];
                      v104[5] = v77;

                      goto LABEL_66;
                    }
                  }

                  id v60 = [v80 countByEnumeratingWithState:&v90 objects:v110 count:16];
                  if (v60) {
                    continue;
                  }
                  break;
                }
              }
            }

            int v24 = 1;
            goto LABEL_23;
          }

          id v45 = v43;
          BOOL v46 = (void *)v44[5];
          v44[5] = (uint64_t)v45;
LABEL_67:
        }

        id v17 = v100;
        goto LABEL_6;
      }

- (id)_builtInAppUpgradeFailureError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle upgradingBuiltInAppAtURL](self, "upgradingBuiltInAppAtURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v6 = [v5 hasInternalContent];

  unsigned int v7 = (void *)MIInstallerErrorDomain;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v6) {
  else
  }
    id v11 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _builtInAppUpgradeFailureError]",  1841LL,  v7,  58LL,  0LL,  &off_10008AEA8,  @"This app has the same bundle identifier, %@, as a built-in system app located at %@. However, this app is not configured correctly to allow it to upgrade that system app.",  v9,  (uint64_t)v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (BOOL)_performBuiltInAppUpgradeValidationWithSigningInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle upgradingBuiltInAppAtURL](self, "upgradingBuiltInAppAtURL"));

  if (v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 entitlements]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle upgradingBuiltInAppAtURL](self, "upgradingBuiltInAppAtURL"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByDeletingLastPathComponent]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 systemAppsDirectory]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
    unsigned int v15 = [v11 isEqualToString:v14];

    if (v15
      && !+[MIExecutableBundle isGrandfatheredNonContainerizedForSigningInfo:]( &OBJC_CLASS___MIExecutableBundle,  "isGrandfatheredNonContainerizedForSigningInfo:",  v6)
      || (sub_10003CD6C(v8) & 1) != 0)
    {
      id v16 = 0LL;
      BOOL v17 = 1;
    }

    else
    {
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _builtInAppUpgradeFailureError](self, "_builtInAppUpgradeFailureError"));
      id v16 = v18;
      if (a4)
      {
        id v16 = v18;
        BOOL v17 = 0;
        *a4 = v16;
      }

      else
      {
        BOOL v17 = 0;
      }
    }
  }

  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)performVerificationWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  unsigned int v6 = -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall");
  v343.receiver = self;
  v343.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  if (!-[MIInstallable performVerificationWithError:](&v343, "performVerificationWithError:", a3))
  {
    id v11 = 0LL;
    id v12 = 0LL;
    goto LABEL_81;
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));

  if (v7)
  {
    unsigned int v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
    ((void (**)(void, const __CFString *, uint64_t))v8)[2](v8, @"VerifyingApplication", 40LL);
  }

  if ([v5 installTargetType] == (id)1)
  {
    unsigned int v9 = [v5 isDeveloperInstall];
    unsigned int v10 = [v5 isSystemAppInstall];
  }

  else
  {
    unsigned int v10 = 0;
    unsigned int v9 = 0;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  if ((([v13 codeSigningEnforcementIsDisabled] | v6) & 1) != 0 || v10)
  {
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    unsigned int v15 = [v14 isRemovableSystemApp];

    if (v15)
    {
      id v17 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  1926LL,  MIInstallerErrorDomain,  25LL,  0LL,  &off_10008AED0,  @"Attempted to install a deletable system app with incorrect install type.",  v16,  v252);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v17);
      id v11 = 0LL;
      goto LABEL_79;
    }
  }

  unsigned int v270 = v10;
  unsigned int v271 = v6;
  id v18 = [v5 allowLocalProvisioned];
  char v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v342 = 0LL;
  v253 = &v342;
  unsigned int v275 = v9 ^ 1;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]( self,  "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:all owingFreeProfileValidation:skippingProfileIDValidation:error:",  v19,  v9 ^ 1,  1LL,  1LL,  v18,  0LL));
  id v12 = v342;

  if (!v11) {
    goto LABEL_79;
  }
  id v20 = [v11 codeSignerType];
  if (!v9) {
    goto LABEL_35;
  }
  id v21 = v20;
  if ([v11 profileValidationType] != (id)2 && v21 != (id)2)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 entitlements]);
    if (sub_1000453E8(v22))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      char v24 = [v23 codeSigningEnforcementIsDisabled] ^ 1;
    }

    else
    {
      char v24 = 0;
    }

    if ((v24 & 1) == 0 && v21 != (id)5) {
      goto LABEL_35;
    }
  }

  if ([v11 codeSignerType] == (id)2)
  {
    uint64_t v25 = qword_100095BF8;
  }

  else
  {
    id v26 = [v11 profileValidationType];
    uint64_t v25 = qword_100095BF8;
    if (v26 == (id)2)
    {
    }

    else if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 5)
    {
      goto LABEL_33;
    }
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v253 = (id *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  MOLogWrite(v25);

LABEL_33:
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle", v253));
  id v341 = v12;
  v253 = &v341;
  uint64_t v29 = objc_claimAutoreleasedReturnValue( -[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]( self,  "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFre eProfileValidation:skippingProfileIDValidation:error:",  v28,  1LL,  1LL,  1LL,  v18,  0LL));
  id v30 = v341;

  if (!v29)
  {
    id v11 = 0LL;
    goto LABEL_61;
  }

  id v11 = (void *)v29;
  id v12 = v30;
LABEL_35:
  id v31 = v12;
  -[MIInstallableBundle setBundleSigningInfo:](self, "setBundleSigningInfo:", v11);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v11 entitlements]);
  id v340 = v12;
  int v34 = sub_10003EC48(v32, v33, &v340);
  id v12 = v340;

  if (!v34) {
    goto LABEL_79;
  }
  v273 = v11;
  v274 = a3;
  v262 = v5;
  __int128 v338 = 0u;
  __int128 v339 = 0u;
  __int128 v336 = 0u;
  __int128 v337 = 0u;
  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
  id v36 = [v35 countByEnumeratingWithState:&v336 objects:v353 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v337;
    do
    {
      uint64_t v39 = 0LL;
      v40 = v12;
      do
      {
        if (*(void *)v337 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v41 = *(void *)(*((void *)&v336 + 1) + 8LL * (void)v39);
        id v335 = v40;
        id v42 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]( self,  "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicab le:allowingFreeProfileValidation:skippingProfileIDValidation:error:",  v41,  v275,  0LL,  1LL,  v18,  1LL,  &v335));
        id v12 = v335;

        if (!v42)
        {

          goto LABEL_57;
        }

        uint64_t v39 = (char *)v39 + 1;
        v40 = v12;
      }

      while (v37 != v39);
      id v37 = [v35 countByEnumeratingWithState:&v336 objects:v353 count:16];
    }

    while (v37);
  }

  __int128 v333 = 0u;
  __int128 v334 = 0u;
  __int128 v331 = 0u;
  __int128 v332 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  id v263 = [obj countByEnumeratingWithState:&v331 objects:v352 count:16];
  if (!v263)
  {
    id v11 = v273;
    goto LABEL_63;
  }

  uint64_t v266 = *(void *)v332;
  do
  {
    for (i = 0LL; i != v263; i = (char *)i + 1)
    {
      if (*(void *)v332 != v266) {
        objc_enumerationMutation(obj);
      }
      char v44 = *(void **)(*((void *)&v331 + 1) + 8LL * (void)i);
      id v330 = v12;
      id v45 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]( self,  "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable :allowingFreeProfileValidation:skippingProfileIDValidation:error:",  v44,  v275,  0LL,  1LL,  v18,  0LL,  &v330));
      id v46 = v330;

      if (!v45) {
        goto LABEL_78;
      }
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v45 entitlements]);
      id v329 = v46;
      unsigned int v48 = [v44 validateHasCorrespondingEntitlements:v47 error:&v329];
      id v49 = v329;

      if (!v48) {
        goto LABEL_77;
      }
      id v328 = v49;
      int v50 = sub_10003EE28(v44, v47, &v328);
      id v12 = v328;

      if (!v50)
      {
        id v49 = v12;
LABEL_77:

        id v46 = v49;
        a3 = v274;
LABEL_78:

        id v12 = v46;
        id v5 = v262;
        id v11 = v273;
        goto LABEL_79;
      }

      if (sub_100045408(v47))
      {
        uint64_t v68 = (void *)MIInstallerErrorDomain;
        uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v44 relativePath]);
        id v71 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2035LL,  v68,  210LL,  0LL,  0LL,  @"The app extension at %@ has the %@ entitlement, which is not allowed on an app extension.",  v70,  (uint64_t)v69);
        id v49 = (id)objc_claimAutoreleasedReturnValue(v71);

        goto LABEL_77;
      }

      id v11 = v273;
      a3 = v274;
    }

    id v263 = [obj countByEnumeratingWithState:&v331 objects:v352 count:16];
  }

  while (v263);
LABEL_63:

  id v51 = (void *)objc_claimAutoreleasedReturnValue([v11 entitlements]);
  unsigned int v52 = sub_1000453D8(v51);

  if (v52)
  {
    id v53 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    id v327 = v12;
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 xpcServiceBundlesWithError:&v327]);
    id v55 = v327;

    -[MIInstallableBundle setXpcServiceBundles:](self, "setXpcServiceBundles:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));

    id v5 = v262;
    if (!v56)
    {
      id v12 = v55;
      goto LABEL_79;
    }

    __int128 v325 = 0u;
    __int128 v326 = 0u;
    __int128 v323 = 0u;
    __int128 v324 = 0u;
    id v264 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
    id v57 = [v264 countByEnumeratingWithState:&v323 objects:v351 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v267 = *(void *)v324;
      id v12 = v55;
      do
      {
        id v59 = 0LL;
        id v60 = v12;
        do
        {
          if (*(void *)v324 != v267) {
            objc_enumerationMutation(v264);
          }
          uint64_t v61 = *(void **)(*((void *)&v323 + 1) + 8LL * (void)v59);
          id v322 = v60;
          unsigned int v62 = [v61 executableExistsWithError:&v322];
          id v12 = v322;

          if (!v62) {
            goto LABEL_163;
          }
          uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v61 identifier]);
          id v64 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
          v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:v63]);

          if (v65)
          {
            v150 = (void *)MIInstallerErrorDomain;
            v151 = (void *)objc_claimAutoreleasedReturnValue([v61 bundleURL]);
            v152 = (void *)objc_claimAutoreleasedReturnValue([v151 path]);
            v153 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
            v154 = (void *)objc_claimAutoreleasedReturnValue([v153 objectForKeyedSubscript:v63]);
            v259 = (void *)objc_claimAutoreleasedReturnValue([v154 path]);
            id v156 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2094LL,  v150,  57LL,  0LL,  &off_10008AEF8,  @"Found bundle at %@ with the same identifier (%@) as bundle at %@",  v155,  (uint64_t)v152);
            uint64_t v157 = objc_claimAutoreleasedReturnValue(v156);

            id v12 = (id)v157;
LABEL_163:

            goto LABEL_58;
          }

          unsigned __int8 v66 = (void *)objc_claimAutoreleasedReturnValue([v61 bundleURL]);
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
          [v67 setObject:v66 forKeyedSubscript:v63];

          id v59 = (char *)v59 + 1;
          id v60 = v12;
        }

        while (v58 != v59);
        id v58 = [v264 countByEnumeratingWithState:&v323 objects:v351 count:16];
        id v11 = v273;
      }

      while (v58);
    }

    else
    {
      id v12 = v55;
    }

    if (v271)
    {
      __int128 v320 = 0u;
      __int128 v321 = 0u;
      __int128 v318 = 0u;
      __int128 v319 = 0u;
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
      id v75 = [v74 countByEnumeratingWithState:&v318 objects:v350 count:16];
      if (v75)
      {
        id v76 = v75;
        uint64_t v77 = *(void *)v319;
        do
        {
          uint64_t v78 = 0LL;
          v79 = v12;
          do
          {
            if (*(void *)v319 != v77) {
              objc_enumerationMutation(v74);
            }
            id v80 = *(void **)(*((void *)&v318 + 1) + 8LL * (void)v78);
            id v317 = v79;
            unsigned int v81 = [v80 setIsPlaceholderWithError:&v317];
            id v12 = v317;

            if (!v81)
            {

              id v5 = v262;
              goto LABEL_59;
            }

            uint64_t v78 = (char *)v78 + 1;
            v79 = v12;
          }

          while (v76 != v78);
          id v76 = [v74 countByEnumeratingWithState:&v318 objects:v350 count:16];
        }

        while (v76);
      }
    }

    __int128 v315 = 0u;
    __int128 v316 = 0u;
    __int128 v313 = 0u;
    __int128 v314 = 0u;
    unsigned int v82 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
    id v83 = [v82 countByEnumeratingWithState:&v313 objects:v349 count:16];
    if (v83)
    {
      id v84 = v83;
      uint64_t v85 = *(void *)v314;
      do
      {
        for (j = 0LL; j != v84; j = (char *)j + 1)
        {
          if (*(void *)v314 != v85) {
            objc_enumerationMutation(v82);
          }
          __int128 v87 = *(void **)(*((void *)&v313 + 1) + 8LL * (void)j);
          __int128 v88 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
          [v87 installEmbeddedProvisioningProfileWithProgress:v88];
        }

        id v84 = [v82 countByEnumeratingWithState:&v313 objects:v349 count:16];
      }

      while (v84);
    }

    __int128 v311 = 0u;
    __int128 v312 = 0u;
    __int128 v309 = 0u;
    __int128 v310 = 0u;
    id obja = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
    id v265 = [obja countByEnumeratingWithState:&v309 objects:v348 count:16];
    if (v265)
    {
      uint64_t v268 = *(void *)v310;
      a3 = v274;
      do
      {
        for (k = 0LL; k != v265; k = (char *)k + 1)
        {
          if (*(void *)v310 != v268) {
            objc_enumerationMutation(obja);
          }
          __int128 v90 = *(void **)(*((void *)&v309 + 1) + 8LL * (void)k);
          id v308 = v12;
          __int128 v91 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]( self,  "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplic able:allowingFreeProfileValidation:skippingProfileIDValidation:error:",  v90,  v275,  0LL,  1LL,  v18,  0LL,  &v308));
          id v92 = v308;
          __int128 v93 = v12;
          id v12 = v92;

          if (!v91)
          {
            id v5 = v262;
            id v11 = v273;
            goto LABEL_176;
          }

          id v94 = (void *)objc_claimAutoreleasedReturnValue([v91 entitlements]);
          id v307 = v12;
          int v95 = sub_10003EE28(v90, v94, &v307);
          id v96 = v307;

          if (!v95) {
            goto LABEL_173;
          }
          id v306 = v96;
          int v97 = sub_10003EC48(v90, v94, &v306);
          id v12 = v306;

          if (!v97)
          {
            id v96 = v12;
LABEL_173:
            id v5 = v262;
LABEL_175:

            id v12 = v96;
            id v11 = v273;
            a3 = v274;
LABEL_176:

            goto LABEL_79;
          }

          id v5 = v262;
          if (sub_100045408(v94))
          {
            v171 = (void *)MIInstallerErrorDomain;
            v172 = (void *)objc_claimAutoreleasedReturnValue([v90 relativePath]);
            id v174 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2140LL,  v171,  210LL,  0LL,  0LL,  @"The XPCService extension at %@ has the %@ entitlement, which is not allowed on an XPCService.",  v173,  (uint64_t)v172);
            id v96 = (id)objc_claimAutoreleasedReturnValue(v174);

            goto LABEL_175;
          }

          a3 = v274;
        }

        id v265 = [obja countByEnumeratingWithState:&v309 objects:v348 count:16];
      }

      while (v265);
    }

    __int128 v304 = 0u;
    __int128 v305 = 0u;
    __int128 v302 = 0u;
    __int128 v303 = 0u;
    id v276 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
    id v98 = [v276 countByEnumeratingWithState:&v302 objects:v347 count:16];
    if (v98)
    {
      id v99 = v98;
      uint64_t v100 = *(void *)v303;
      do
      {
        for (m = 0LL; m != v99; m = (char *)m + 1)
        {
          if (*(void *)v303 != v100) {
            objc_enumerationMutation(v276);
          }
          id v102 = *(void **)(*((void *)&v302 + 1) + 8LL * (void)m);
          uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue([v102 infoPlistSubset]);
          id v104 = (void *)objc_claimAutoreleasedReturnValue([v103 objectForKeyedSubscript:@"XPCService"]);

          if (v104)
          {
            objc_opt_class(&OBJC_CLASS___NSDictionary);
            id v105 = sub_100015E2C(v104);
            id v106 = (void *)objc_claimAutoreleasedReturnValue(v105);

            if (!v106)
            {
              v176 = v12;
              v177 = (void *)MIInstallerErrorDomain;
              id v107 = (void *)objc_claimAutoreleasedReturnValue([v102 bundleURL]);
              v178 = (void *)objc_claimAutoreleasedReturnValue([v107 path]);
              v179 = (objc_class *)objc_opt_class(v104);
              v180 = NSStringFromClass(v179);
              v181 = (void *)objc_claimAutoreleasedReturnValue(v180);
              id v183 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2149LL,  v177,  113LL,  0LL,  0LL,  @"XPCService key in Info.plist of XPC service at %@ has illegal value type: %@",  v182,  (uint64_t)v178);
              goto LABEL_191;
            }

            id v107 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"ServiceType"]);
            if (v107)
            {
              objc_opt_class(&OBJC_CLASS___NSString);
              id v108 = sub_100015E2C(v107);
              id v109 = (void *)objc_claimAutoreleasedReturnValue(v108);

              if (!v109)
              {
                v193 = (void *)MIInstallerErrorDomain;
                v178 = (void *)objc_claimAutoreleasedReturnValue([v102 bundleURL]);
                v181 = (void *)objc_claimAutoreleasedReturnValue([v178 path]);
                v194 = (objc_class *)objc_opt_class(v107);
                v195 = NSStringFromClass(v194);
                uint64_t v257 = objc_claimAutoreleasedReturnValue(v195);
                id v197 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2156LL,  v193,  51LL,  0LL,  0LL,  @"XPCService's ServiceType key in Info.plist of service at %@ has illegal value type: %@",  v196,  (uint64_t)v181);
                uint64_t v198 = objc_claimAutoreleasedReturnValue(v197);
                v199 = v12;
                id v12 = (id)v198;

                v176 = (void *)v257;
                goto LABEL_192;
              }

              if (([v107 isEqualToString:@"Application"] & 1) == 0)
              {
                v176 = v12;
                v200 = (void *)MIInstallerErrorDomain;
                v178 = (void *)objc_claimAutoreleasedReturnValue([v102 bundleURL]);
                v181 = (void *)objc_claimAutoreleasedReturnValue([v178 path]);
                id v183 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2161LL,  v200,  51LL,  0LL,  0LL,  @"XPCService's ServiceType key in Info.plist of service at %@ has illegal value: %@ (must be Application)",  v201,  (uint64_t)v181);
LABEL_191:
                id v12 = (id)objc_claimAutoreleasedReturnValue(v183);
LABEL_192:

LABEL_161:
LABEL_57:
                id v5 = v262;
LABEL_58:
                id v11 = v273;
LABEL_59:
                a3 = v274;
LABEL_79:
                if (a3)
                {
                  id v12 = v12;
                  BOOL v72 = 0;
                  *a3 = v12;
                  goto LABEL_82;
                }

- (BOOL)_writeData:(id)a3 toFile:(id)a4 inContainerAtURL:(id)a5 legacyErrorString:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a5 URLByAppendingPathComponent:a4 isDirectory:0]);
  id v25 = 0LL;
  unsigned int v14 = [v11 writeToURL:v13 options:268435457 error:&v25];
  id v15 = v25;
  if (v14)
  {
    uint64_t v16 = qword_100095BF8;
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
    {
      [v11 length];
      char v24 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
      MOLogWrite(v16);
    }
  }

  else
  {
    id v17 = (void *)MIInstallerErrorDomain;
    id v26 = @"LegacyErrorString";
    id v27 = v12;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    char v19 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
    id v21 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _writeData:toFile:inContainerAtURL:legacyErrorString:error:]",  2489LL,  v17,  24LL,  v15,  v18,  @"Failed to write data to %@",  v20,  (uint64_t)v19);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (a7)
    {
      id v15 = v22;
      *a7 = v15;
    }

    else
    {
      id v15 = v22;
    }
  }

  return v14;
}

- (BOOL)_writeOptionsDataToBundle:(id)a3 orContainer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v34 = (void *)objc_claimAutoreleasedReturnValue([v9 containerURL]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 iTunesMetadata]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 iTunesMetadata]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 distributorInfo]);

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 sinfData]);
  if (v13)
  {
    unsigned int v14 = (void *)v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 distributorID]);
    if (v15 && ![v12 distributorIsFirstPartyApple])
    {
      unsigned int v23 = [v10 sinfDataType];

      if (v23 != 1)
      {
        uint64_t v24 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
          MOLogWrite(v24);
        }

        objc_msgSend(v10, "setSinfDataType:", 1, v32);
      }
    }

    else
    {
    }
  }

  id v40 = 0LL;
  unsigned int v16 = objc_msgSend(v8, "setSinfDataType:withError:", objc_msgSend(v10, "sinfDataType"), &v40);
  id v17 = v40;
  if (!v16)
  {
    id v18 = 0LL;
LABEL_10:
    id v20 = v17;
    goto LABEL_11;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 sinfData]);
  if (v18)
  {
    id v39 = v17;
    unsigned __int8 v19 = [v8 updateSinfWithData:v18 error:&v39];
    id v20 = v39;

    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
  }

  else
  {
    id v38 = v17;
    unsigned int v26 = [v8 replicateRootSinfWithError:&v38];
    id v20 = v38;

    if (!v26)
    {
      id v18 = 0LL;
      goto LABEL_11;
    }
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v10 geoJSONData]);

  if (v27)
  {
    id v37 = v20;
    unsigned int v28 = -[MIInstallableBundle _writeData:toFile:inContainerAtURL:legacyErrorString:error:]( self,  "_writeData:toFile:inContainerAtURL:legacyErrorString:error:",  v27,  @"GeoJSON",  v34,  @"GeoJSONCaptureFailed",  &v37);
    id v17 = v37;

    if (!v28)
    {
      id v18 = v27;
      goto LABEL_10;
    }
  }

  else
  {
    id v17 = v20;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 iTunesArtworkData]);

  if (v18)
  {
    id v36 = v17;
    unsigned int v29 = -[MIInstallableBundle _writeData:toFile:inContainerAtURL:legacyErrorString:error:]( self,  "_writeData:toFile:inContainerAtURL:legacyErrorString:error:",  v18,  @"iTunesArtwork",  v34,  @"iTunesArtworkCaptureFailed",  &v36);
    id v20 = v36;

    if (!v29) {
      goto LABEL_11;
    }
  }

  else
  {
    id v20 = v17;
  }

  if (!v33)
  {
    BOOL v21 = 1;
    goto LABEL_14;
  }

  id v35 = v20;
  unsigned __int8 v30 = [v9 writeiTunesMetadata:v33 error:&v35];
  id v31 = v35;

  if ((v30 & 1) != 0)
  {
    BOOL v21 = 1;
    id v20 = v31;
    goto LABEL_14;
  }

  id v20 = v31;
LABEL_11:
  if (a5)
  {
    id v20 = v20;
    BOOL v21 = 0;
    *a5 = v20;
  }

  else
  {
    BOOL v21 = 0;
  }

- (BOOL)_captureDataFromStagingRootOrBundle:(id)a3 toContainer:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 iTunesMetadata]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable stagingRootURL](self, "stagingRootURL"));
  unsigned int v13 = [v9 captureStoreDataFromDirectory:v12 doCopy:1 failureIsFatal:1 includeiTunesMetadata:v11 == 0 withError:a5];

  BOOL v14 = v13
     && (-[MIInstallable packageFormat](self, "packageFormat") != 2
      || [v9 captureStoreDataFromDirectory:v8 doCopy:1 failureIsFatal:1 includeiTunesMetadata:v11 == 0 withError:a5]);

  return v14;
}

- (BOOL)_validateSinfsWithError:(id *)a3
{
  if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
  {
    id v5 = 0LL;
    id v6 = 0LL;
  }

  else
  {
    unsigned int v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    -[NSMutableArray addObject:](v7, "addObject:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v9);

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
      -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v12);
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v5 = v7;
    id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v13)
    {
      id v14 = v13;
      id v6 = 0LL;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        unsigned int v16 = 0LL;
        id v17 = v6;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v5);
          }
          id v18 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v16);
          id v22 = v17;
          unsigned int v19 = [v18 validateSinfWithError:&v22];
          id v6 = v22;

          if (!v19)
          {

            if (a3)
            {
              id v6 = v6;
              BOOL v20 = 0;
              *a3 = v6;
            }

            else
            {
              BOOL v20 = 0;
            }

            goto LABEL_19;
          }

          unsigned int v16 = (char *)v16 + 1;
          id v17 = v6;
        }

        while (v14 != v16);
        id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
        if (v14) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v6 = 0LL;
    }
  }

  BOOL v20 = 1;
LABEL_19:

  return v20;
}

+ (BOOL)_shouldSkipEligibilityChecksForAppWithSigningInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 codeSignerType];
  char v18 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
  id v6 = v5;
  if (v4 == (id)3)
  {
    if ([v3 profileValidationType] == (id)4)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 entitlements]);
      unsigned __int8 v11 = sub_1000458E0(v10);

      if ((v11 & 1) == 0)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
        unsigned int v13 = [v12 requireEligibilityChecksForAppsInDevelopment];

        if (!v13)
        {
LABEL_19:
          BOOL v7 = 1;
          goto LABEL_18;
        }

        uint64_t v14 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 codeInfoIdentifier]);
          MOLogWrite(v14);
        }
      }
    }

    goto LABEL_17;
  }

  BOOL v7 = 0;
  if (v4 == (id)1)
  {
    else {
      BOOL v8 = 1;
    }
    if (!v8 && [v6 testFlagsAreSet:256])
    {
      uint64_t v9 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v3 codeInfoIdentifier]);
        MOLogWrite(v9);
      }

      goto LABEL_19;
    }

+ (BOOL)_shouldSkipEligibilityChecksForAuthorizingAppWithBundleID:(id)a3 persona:(id)a4
{
  id v6 = a3;
  id v20 = 0LL;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:",  v6,  a4,  1LL,  0LL,  0LL,  &v20));
  id v8 = v20;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    if ([v15 isEqualToString:MIContainerManagerErrorDomain])
    {
      id v16 = [v9 code];

      if (v16 == (id)21)
      {
        uint64_t v17 = qword_100095BF8;
        goto LABEL_16;
      }
    }

    else
    {
    }

    uint64_t v17 = qword_100095BF8;
LABEL_16:
    MOLogWrite(v17);
LABEL_17:
    unsigned __int8 v14 = 0;
    unsigned __int8 v11 = 0LL;
    goto LABEL_23;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
  if (!v10)
  {
    uint64_t v17 = qword_100095BF8;
    goto LABEL_16;
  }

  unsigned __int8 v11 = v10;
  id v19 = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkin gTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v19]);
  id v13 = v19;

  if (v12)
  {
    unsigned __int8 v14 = [a1 _shouldSkipEligibilityChecksForAppWithSigningInfo:v12];
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  uint64_t v9 = v13;
LABEL_23:

  return v14;
}

+ (BOOL)_shouldSkipEligibilityChecksForInstallRequestorWithAuditToken:(id *)a3 persona:(id)a4 authorizingBundleID:(id *)a5
{
  id v8 = a4;
  __int128 v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v19.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v19.val[4] = v9;
  id v18 = 0LL;
  __int128 v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[MICodeSigningInfo signingIdentifierForAuditToken:error:]( &OBJC_CLASS___MICodeSigningInfo,  "signingIdentifierForAuditToken:error:",  &atoken,  &v18));
  id v12 = v18;
  if (v11)
  {
    LOBYTE(atoken.val[0]) = 0;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
    if ([v11 isEqualToString:@"com.apple.mi-test-runner"]
      && [v13 isRunningInTestMode:&atoken outError:0]
      && LOBYTE(atoken.val[0])
      && [v13 testFlagsAreSet:512])
    {
      unsigned int v14 = 1;
    }

    else
    {
      unsigned int v14 = [a1 _shouldSkipEligibilityChecksForAuthorizingAppWithBundleID:v11 persona:v8];
    }

    if (a5 && v14) {
      *a5 = v11;
    }
  }

  else
  {
    uint64_t v15 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      audit_token_t atoken = v19;
      audit_token_to_pid(&atoken);
      MOLogWrite(v15);
    }

    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (unint64_t)_domainForBrowserEligibilityForApp:(id)a3 withSigningInfo:(id)a4 distributorInfo:(id)a5 isWebDistribution:(BOOL)a6 operationType:(unint64_t)a7
{
  id v9 = a4;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 entitlements]);

  if (sub_100045E40(v11))
  {
    switch(a7)
    {
      case 2uLL:
        uint64_t v13 = qword_100095BF8;
        break;
      case 1uLL:
        uint64_t v13 = qword_100095BF8;
        if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 5)
        {
LABEL_24:
          unint64_t v12 = 4LL;
          goto LABEL_32;
        }

        break;
      case 0uLL:
        unint64_t v12 = 7LL;
        goto LABEL_32;
      default:
LABEL_17:
        unint64_t v12 = 0LL;
        goto LABEL_32;
    }

    MOLogWrite(v13);
    goto LABEL_24;
  }

  if (a7 == 2)
  {
    uint64_t v14 = qword_100095BF8;
LABEL_30:
    MOLogWrite(v14);
LABEL_31:
    unint64_t v12 = 6LL;
    goto LABEL_32;
  }

  if (a7 == 1)
  {
    uint64_t v14 = qword_100095BF8;
    goto LABEL_30;
  }

  if (a7) {
    goto LABEL_17;
  }
  unint64_t v12 = 23LL;
LABEL_32:

  return v12;
}

+ (unint64_t)_domainForMarketplaceEligibilityForApp:(id)a3 withSigningInfo:(id)a4 isWebDistribution:(BOOL)a5 distributorInfo:(id)a6 operationType:(unint64_t)a7
{
  BOOL v8 = a5;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 entitlements]);

  unsigned int v15 = sub_100045408(v14);
  unsigned int v16 = [v11 distributorIsThirdParty];
  if ((v15 & 1) == 0 && !v16) {
    goto LABEL_3;
  }
  if (((!v8 | v15) & 1) != 0)
  {
    if ((v15 & 1) != 0)
    {
      id v18 = @"marketplace";
    }

    else
    {
      audit_token_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 distributorID]);
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"app distributed by marketplace %@,",  v19));
    }

    if (a7 == 2)
    {
      uint64_t v21 = qword_100095BF8;
    }

    else
    {
      if (a7 != 1)
      {
        if (a7)
        {
          unint64_t v17 = 0LL;
        }

        else
        {
          unint64_t v17 = 2LL;
        }

        goto LABEL_37;
      }

      uint64_t v21 = qword_100095BF8;
      if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 5)
      {
LABEL_35:
        unint64_t v17 = 3LL;
LABEL_37:

        goto LABEL_38;
      }
    }

    MOLogWrite(v21);
    goto LABEL_35;
  }

  if (a7 == 2)
  {
    uint64_t v20 = qword_100095BF8;
LABEL_27:
    MOLogWrite(v20);
LABEL_28:
    unint64_t v17 = 20LL;
    goto LABEL_38;
  }

  if (a7 == 1)
  {
    uint64_t v20 = qword_100095BF8;
    goto LABEL_27;
  }

  if (a7)
  {
LABEL_3:
    unint64_t v17 = 0LL;
    goto LABEL_38;
  }

  unint64_t v17 = 19LL;
LABEL_38:

  return v17;
}

+ (BOOL)_getEligibilityForDomain:(unint64_t)a3 forBundle:(id)a4 isEligible:(BOOL *)a5 ineligibilityReason:(id *)a6 error:(id *)a7
{
  uint64_t v46 = 0LL;
  id v44 = 0LL;
  uint64_t v45 = 0LL;
  id v43 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a4 identifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIEligibilityManager sharedInstance](&OBJC_CLASS___MIEligibilityManager, "sharedInstance"));
  id v42 = 0LL;
  unsigned int v13 = [v12 getEligibilityForDomain:a3 answer:&v46 source:&v45 status:&v44 context:&v43 error:&v42];
  id v14 = v42;

  if (!v13)
  {
    id v17 = sub_1000130F4( (uint64_t)"+[MIInstallableBundle _getEligibilityForDomain:forBundle:isEligible:ineligibilityReason:error:]",  2861LL,  MIInstallerErrorDomain,  4LL,  v14,  0LL,  @"Failed to get eligibility for domain %llu for %@",  v15,  a3);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (a7)
    {
      id v14 = v18;
      unsigned int v16 = 0LL;
      *a7 = v14;
    }

    else
    {
      unsigned int v16 = 0LL;
      id v14 = v18;
    }

    goto LABEL_31;
  }

  if (v46 != 4)
  {
    uint64_t v19 = v45;
    id v20 = v44;
    uint64_t v21 = v20;
    if (v19 != 1)
    {
      if (v19 == 2)
      {
        uint64_t v22 = qword_100095BF8;
      }

      else
      {
        uint64_t v22 = qword_100095BF8;
      }

- (BOOL)_checkEligibilityForAppWithSigningInfo:(id)a3 distributorInfo:(id)a4 isWebDistribution:(BOOL)a5 withError:(id *)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  uint64_t v65 = objc_claimAutoreleasedReturnValue([v11 displayName]);
  unint64_t v12 = -[MIInstallableBundle eligibilityOperationType](self, "eligibilityOperationType");
  unsigned __int8 v66 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  unsigned int v13 = (void *)objc_opt_class(self);
  id v14 = objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  uint64_t v15 = (audit_token_t *)[v14 installationRequestorAuditToken];

  unint64_t v16 = (unint64_t)[v13 _domainForBrowserEligibilityForApp:v11 withSigningInfo:v9 distributorInfo:v10 isWebDistribution:v6 operationType:v12];
  unint64_t v17 = (unint64_t)[v13 _domainForMarketplaceEligibilityForApp:v11 withSigningInfo:v9 isWebDistribution:v6 distributorInfo:v10 operationType:v12];
  if (!(v16 | v17))
  {
    id v18 = 0LL;
    uint64_t v19 = 0LL;
LABEL_3:
    BOOL v20 = 1;
LABEL_4:
    uint64_t v21 = (void *)v65;
    goto LABEL_5;
  }

  unint64_t v23 = v17;
  uint64_t v63 = v10;
  if (v6 && v15)
  {
    id v62 = v9;
    audit_token_t v75 = *v15;
    id v73 = 0LL;
    id v74 = 0LL;
    audit_token_t atoken = v75;
    unsigned __int8 v24 = +[MICodeSigningInfo getValue:forEntitlement:fromProcessWithAuditToken:error:]( &OBJC_CLASS___MICodeSigningInfo,  "getValue:forEntitlement:fromProcessWithAuditToken:error:",  &v74,  @"com.apple.developer.browser.app-installation",  &atoken,  &v73);
    id v25 = v74;
    id v18 = (__CFString *)v73;
    if ((v24 & 1) == 0)
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        id v57 = @"com.apple.developer.browser.app-installation";
        id v58 = v18;
        MOLogWrite(qword_100095BF8);
      }

      unsigned int v28 = 0;
      uint64_t v19 = 0LL;
      id v18 = 0LL;
      id v10 = v63;
      goto LABEL_37;
    }

    if (v25)
    {
      id v10 = v63;
      if ((objc_opt_respondsToSelector(v25, "BOOLValue") & 1) != 0)
      {
        id v61 = v25;
        if ([v25 BOOLValue])
        {
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 personaUniqueString]);

          id v10 = v63;
          id v71 = 0LL;
          unsigned int v28 = [v13 _shouldSkipEligibilityChecksForInstallRequestorWithAuditToken:v15 persona:v27 authorizingBundleID:&v71];
          uint64_t v19 = (__CFString *)v71;
        }

        else
        {
          unsigned int v28 = 0;
          uint64_t v19 = 0LL;
        }

        id v25 = v61;
        goto LABEL_37;
      }

      uint64_t v32 = qword_100095BF8;
      if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
      {
LABEL_30:
        unsigned int v28 = 0;
        uint64_t v19 = 0LL;
LABEL_37:

        id v9 = v62;
        goto LABEL_38;
      }
    }

    else
    {
      uint64_t v32 = qword_100095BF8;
      id v10 = v63;
    }

    audit_token_t atoken = v75;
    id v57 = (const __CFString *)audit_token_to_pid(&atoken);
    id v58 = @"com.apple.developer.browser.app-installation";
    MOLogWrite(v32);
    goto LABEL_30;
  }

  if ([v13 _shouldSkipEligibilityChecksForAppWithSigningInfo:v9])
  {
    uint64_t v19 = 0LL;
    id v18 = 0LL;
    unsigned int v28 = 1;
  }

  else
  {
    if (![v10 distributorIsThirdParty])
    {
      if (!v16)
      {
        id v18 = 0LL;
        if (!v23)
        {
          BOOL v20 = 1;
          uint64_t v19 = 0LL;
          goto LABEL_4;
        }

        uint64_t v19 = 0LL;
        goto LABEL_67;
      }

      uint64_t v19 = 0LL;
      id v18 = 0LL;
      goto LABEL_48;
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v10 distributorID]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 personaUniqueString]);
    unsigned int v28 = [v13 _shouldSkipEligibilityChecksForAuthorizingAppWithBundleID:v29 persona:v31];

    if (v28) {
      uint64_t v19 = v29;
    }
    else {
      uint64_t v19 = 0LL;
    }

    id v18 = 0LL;
    id v10 = v63;
  }

- (BOOL)_validateiTunesMetadataWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 displayName]);

  id v63 = 0LL;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 iTunesMetadataWithError:&v63]);
  id v9 = v63;
  id v10 = v9;
  uint64_t v58 = v7;
  if (v8)
  {
    id v11 = v9;
    goto LABEL_3;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
  if (![v22 isEqualToString:NSCocoaErrorDomain])
  {

LABEL_24:
    id v56 = 0LL;
    id v59 = 0LL;
    BOOL v8 = 0LL;
    id v27 = 0LL;
    id v13 = 0LL;
    unint64_t v12 = 0LL;
    goto LABEL_57;
  }

  id v23 = [v11 code];

  if (v23 != (id)260) {
    goto LABEL_24;
  }

  id v11 = 0LL;
LABEL_3:
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 distributorInfo]);
  id v13 = (id)objc_claimAutoreleasedReturnValue([v12 distributorID]);
  id v14 = [v12 distributorType];
  if (v5)
  {
    uint64_t v15 = v4;
    id v62 = v11;
    unint64_t v16 = v5;
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 iTunesMetadataWithError:&v62]);
    id v10 = v62;

    uint64_t v55 = (void *)v17;
    if (v17)
    {
LABEL_5:
      id v5 = v16;
      id v4 = v15;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v55 distributorInfo]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 distributorID]);
      id v59 = v18;
      id v20 = [v18 distributorType];
      id v11 = v10;
      goto LABEL_10;
    }

    id v51 = v8;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v33 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    if ([v33 isEqualToString:NSCocoaErrorDomain])
    {
      int v34 = v16;
      id v35 = [v11 code];

      BOOL v36 = v35 == (id)260;
      unint64_t v16 = v34;
      if (v36)
      {

        id v10 = 0LL;
        BOOL v8 = v51;
        goto LABEL_5;
      }
    }

    else
    {
    }

    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
    {
      id v56 = 0LL;
      id v59 = 0LL;
      id v27 = 0LL;
      BOOL v8 = v51;
      id v5 = v16;
    }

    else
    {
      id v5 = v16;
      MOLogWrite(qword_100095BF8);
      id v56 = 0LL;
      id v59 = 0LL;
      id v27 = 0LL;
      BOOL v8 = v51;
    }

    id v4 = v15;
    goto LABEL_57;
  }

  id v20 = 0LL;
  uint64_t v19 = 0LL;
  id v59 = 0LL;
  uint64_t v55 = 0LL;
LABEL_10:
  id v56 = v19;
  if (v13 && !v19) {
    goto LABEL_12;
  }
  if (!v13 && v19)
  {
    id v54 = v20;
    id v24 = [v59 copy];

    id v13 = v19;
    if (!v8) {
      BOOL v8 = (void *)objc_opt_new(&OBJC_CLASS___MIStoreMetadata);
    }
    [v8 setDistributorInfo:v24];
    id v61 = v11;
    unsigned __int8 v26 = [v4 writeiTunesMetadata:v8 error:&v61];
    id v10 = v61;

    if ((v26 & 1) == 0)
    {
      id v56 = v13;
      id v27 = v55;
      goto LABEL_58;
    }

    goto LABEL_13;
  }

  if (!v13
    || !v19
    || (id v37 = v20, ([v13 isEqualToString:v19] & 1) != 0)
    || v14 == (id)2
    || v37 == (id)2)
  {
LABEL_12:
    id v54 = v14;
    id v24 = v12;
    id v10 = v11;
LABEL_13:
    if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
    {
      id v25 = (void *)v58;
LABEL_48:
      -[MIInstallable setInstalledDistributorID:](self, "setInstalledDistributorID:", v13);
      BOOL v48 = 1;
      id v27 = v55;
      goto LABEL_61;
    }

    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleSigningInfo](self, "bundleSigningInfo"));
    unsigned int v52 = v5;
    id v53 = v4;
    id v30 = v8;
    if (v13) {
      id v31 = [v11 isEqualToString:v13];
    }
    else {
      id v31 = 0LL;
    }
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v29 entitlements]);
    unsigned int v43 = sub_100045408(v42);

    if (!v13 || !v43 || (v31 & 1) != 0 || v54 == (id)2)
    {
      id v60 = v10;
      unsigned __int8 v47 = -[MIInstallableBundle _checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:]( self,  "_checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:",  v29,  v24,  v31,  &v60);
      id v46 = v60;

      if ((v47 & 1) != 0)
      {

        id v10 = v46;
        id v5 = v52;
        id v4 = v53;
        id v25 = (void *)v58;
        BOOL v8 = v30;
        goto LABEL_48;
      }
    }

    else
    {
      id v45 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]",  3138LL,  MIInstallerErrorDomain,  211LL,  0LL,  0LL,  @"The marketplace %@ may not be installed by the distributor ID %@.",  v44,  v58);
      id v46 = (id)objc_claimAutoreleasedReturnValue(v45);
    }

    id v4 = v53;

    unint64_t v12 = v24;
    id v10 = v46;
    id v5 = v52;
    BOOL v8 = v30;
    goto LABEL_50;
  }

  int IsThirdParty = MIDistributorTypeIsThirdParty(v14);
  int v39 = MIDistributorTypeIsThirdParty(v37);
  if (IsThirdParty && v37 == (id)1)
  {
    id v41 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]",  3106LL,  MIInstallerErrorDomain,  199LL,  0LL,  0LL,  @"The app being installed, %@, is distributed by a third party (distributor ID %@) but its existing installation is distributed by Apple (distributor ID %@). An app cannot change its distribution source from Apple to a third party once installed. Uninstall this app, then try installing it again.",  v40,  v58);
  }

  else
  {
    if (v14 == (id)1) {
      int v50 = v39;
    }
    else {
      int v50 = 0;
    }
    if (v50 == 1)
    {
      id v41 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]",  3109LL,  MIInstallerErrorDomain,  199LL,  0LL,  0LL,  @"The app being installed, %@, is distributed by Apple (distributor ID %@) but its existing installation is distributed by a third party (distributor ID %@). An app cannot change its distribution source from a third party to Apple once installed. Uninstall this app, then try installing it again.",  v40,  v58);
    }

    else if ((IsThirdParty & v39) == 1)
    {
      id v41 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]",  3112LL,  MIInstallerErrorDomain,  199LL,  0LL,  0LL,  @"The app being installed, %@, is distributed by %@ but its existing installation is distributed by %@. An app cannot change its third party distribution source once installed. Uninstall this app, then try installing it again.",  v40,  v58);
    }

    else
    {
      id v41 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]",  3116LL,  MIInstallerErrorDomain,  199LL,  0LL,  0LL,  @"The app being installed, %@, is distributed by %@ but its existing installation is distributed by %@. An app cannot change its distribution source once installed, except to/from TestFlight. Uninstall this app, then try installing it again.",  v40,  v58);
    }
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(v41);
LABEL_50:
  id v27 = v55;
LABEL_57:

  id v24 = v12;
LABEL_58:
  id v25 = (void *)v58;
  if (a3)
  {
    id v10 = v10;
    BOOL v48 = 0;
    *a3 = v10;
  }

  else
  {
    BOOL v48 = 0;
  }

- (BOOL)_setLinkageInBundleMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 linkedParentBundleID]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  id v10 = v9;
  if (v9)
  {
    id v40 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleMetadataWithError:&v40]);
    id v12 = v40;
    if (!v11)
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        MOLogWrite(qword_100095BF8);
        if (a4)
        {
LABEL_19:
          id v25 = v12;
          BOOL v28 = 0;
          *a4 = v25;
          goto LABEL_33;
        }

- (BOOL)_setBundleMetadataWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  id v40 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleMetadataWithError:&v40]);
  id v8 = v40;

  if (!v7)
  {
    id v12 = 0LL;
    unsigned __int8 v15 = 0;
    if (!a3) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v7 setInstallDate:v9];

  id v10 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v11 = v10;
  id v12 = 0LL;
  if ((objc_opt_isKindOfClass(v11) & 1) != 0) {
    id v12 = v11;
  }

  if (v12)
  {
    [v7 setInstallBuildVersion:v12];
    id v14 = [v5 lsInstallType];
    if (v14)
    {
      [v7 setInstallType:v14];
LABEL_22:
      id v38 = v8;
      unsigned int v27 = -[MIInstallableBundle _setLinkageInBundleMetadata:error:]( self,  "_setLinkageInBundleMetadata:error:",  v7,  &v38,  v33,  v35);
      id v28 = v38;

      if (!v27)
      {
        unsigned __int8 v15 = 0;
        id v8 = v28;
        if (!a3) {
          goto LABEL_34;
        }
        goto LABEL_32;
      }

      id v8 = (id)objc_claimAutoreleasedReturnValue([v5 alternateIconName]);
      if (v8)
      {
        uint64_t v29 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          int v34 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
          id v36 = v8;
          MOLogWrite(v29);
        }

        objc_msgSend(v7, "setAlternateIconName:", v8, v34, v36);
      }

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
      id v37 = v28;
      unsigned __int8 v15 = [v31 saveBundleMetadata:v7 withError:&v37];
      id v17 = v37;

      goto LABEL_29;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));

    if (!v18) {
      goto LABEL_22;
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bundle]);
    id v39 = v8;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lsInstallTypeWithError:&v39]);
    id v22 = v39;

    if (v21)
    {
      objc_msgSend(v7, "setInstallType:", objc_msgSend(v21, "unsignedIntegerValue"));
LABEL_21:

      id v8 = v22;
      goto LABEL_22;
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 domain]);
    if ([v23 isEqualToString:MIInstallerErrorDomain])
    {
      id v24 = [v22 code];

      if (v24 == (id)158)
      {
LABEL_20:

        id v22 = 0LL;
        goto LABEL_21;
      }
    }

    else
    {
    }

    uint64_t v25 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v26 bundle]);
      id v35 = v22;
      MOLogWrite(v25);
    }

    goto LABEL_20;
  }

  id v16 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _setBundleMetadataWithError:]",  3239LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to copy build version for %@",  v13,  (uint64_t)self);
  id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
  unsigned __int8 v15 = 0;
LABEL_29:

  id v8 = v17;
  if (!a3) {
    goto LABEL_34;
  }
LABEL_32:
  if ((v15 & 1) == 0) {
    *a3 = v8;
  }
LABEL_34:

  return v15;
}

- (BOOL)_handleStashMode:(unint64_t)a3 withError:(id *)a4
{
  if (a3 == 2)
  {
    uint64_t v11 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      MOLogWrite(v11);
    }

    id v13 = 0LL;
    goto LABEL_11;
  }

  if (a3 == 1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    id v18 = 0LL;
    unsigned __int8 v9 = [v7 stashBundleContainerContents:v8 error:&v18];
    id v10 = v18;
  }

  else
  {
    if (a3)
    {
      id v15 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _handleStashMode:withError:]",  3329LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Unknown stash mode specified in options: %lu",  v4,  a3);
      id v13 = (id)objc_claimAutoreleasedReturnValue(v15);
      goto LABEL_13;
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    uint64_t v19 = 0LL;
    unsigned __int8 v9 = [v7 transferExistingStashesFromContainer:v8 error:&v19];
    id v10 = v19;
  }

  id v13 = v10;

  if ((v9 & 1) != 0)
  {
LABEL_11:
    BOOL v14 = 1;
    goto LABEL_16;
  }

- (BOOL)_linkToParentApplication:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 linkedParentBundleID]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  -[MIInstallable installationDomain](self, "installationDomain")));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v13 = 0LL;
    unsigned __int8 v10 = [v7 linkChild:v9 toParent:v6 error:&v13];
    id v11 = v13;

    if (a3 && (v10 & 1) == 0)
    {
      id v11 = v11;
      unsigned __int8 v10 = 0;
      *a3 = v11;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    id v11 = 0LL;
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)_handleStashOptionWithError:(id *)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = (void *)v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
  if ([v8 isPlaceholder])
  {

LABEL_11:
    id v15 = 0LL;
LABEL_12:
    BOOL v16 = 1;
    goto LABEL_13;
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v10 = [v9 allowsInternalSecurityPolicy];

  if (!v10) {
    goto LABEL_11;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  id v12 = [v11 stashMode];
  if ([v11 installTargetType] == (id)3) {
    uint64_t v13 = 2LL;
  }
  else {
    uint64_t v13 = (uint64_t)v12;
  }
  id v18 = 0LL;
  unsigned __int8 v14 = -[MIInstallableBundle _handleStashMode:withError:](self, "_handleStashMode:withError:", v13, &v18);
  id v15 = v18;

  if ((v14 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    id v15 = v15;
    BOOL v16 = 0;
    *a3 = v15;
  }

  else
  {
    BOOL v16 = 0;
  }

- (BOOL)_preserveExistingPlaceholderAsParallelPlaceholderWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 hasParallelPlaceholder];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundle]);
    unsigned __int8 v9 = [v8 isPlaceholder];

    if ((v9 & 1) == 0 && (v7 & 1) == 0)
    {
      unsigned int v10 = (void *)MIInstallerErrorDomain;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      uint64_t v13 = MIStringForInstallationDomain(-[MIInstallable installationDomain](self, "installationDomain"));
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v16 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]",  3416LL,  v10,  190LL,  0LL,  0LL,  @"Existing installed bundle for %@ in %@ was not a placeholder or did not have a parallel placeholder.",  v15,  (uint64_t)v12);
      goto LABEL_6;
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v23 parallelPlaceholderURL]);

    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    if (v7)
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 parallelPlaceholderURL]);
      id v39 = 0LL;
      unsigned __int8 v26 = [v24 copyItemAtURL:v25 toURL:v21 error:&v39];
      id v20 = v39;

      if ((v26 & 1) == 0)
      {
        id v28 = (void *)MIInstallerErrorDomain;
        uint64_t v29 = @"Could not copy existing parallel placeholder to new bundle container.";
        uint64_t v30 = 3426LL;
        goto LABEL_14;
      }
    }

    else
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v6 bundle]);
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 bundleURL]);
      id v38 = 0LL;
      unsigned __int8 v33 = [v24 copyItemAtURL:v32 toURL:v21 error:&v38];
      id v20 = v38;

      if ((v33 & 1) == 0)
      {
        id v28 = (void *)MIInstallerErrorDomain;
        uint64_t v29 = @"Could not copy existing placeholder to parallel placeholder.";
        uint64_t v30 = 3431LL;
LABEL_14:
        id v34 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]",  v30,  v28,  4LL,  v20,  0LL,  v29,  v27,  v37);
        uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);

        id v20 = (id)v35;
        if (a3) {
          goto LABEL_7;
        }
LABEL_15:
        BOOL v22 = 0;
        goto LABEL_16;
      }
    }

    BOOL v22 = 1;
    goto LABEL_16;
  }

  id v17 = (void *)MIInstallerErrorDomain;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  uint64_t v18 = MIStringForInstallationDomain(-[MIInstallable installationDomain](self, "installationDomain"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v16 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]",  3409LL,  v17,  190LL,  0LL,  0LL,  @"Did not find existing bundle container for %@ in %@ from which to preserve placeholder.",  v19,  (uint64_t)v12);
LABEL_6:
  id v20 = (id)objc_claimAutoreleasedReturnValue(v16);

  uint64_t v21 = 0LL;
  if (!a3) {
    goto LABEL_15;
  }
LABEL_7:
  id v20 = v20;
  BOOL v22 = 0;
  *a3 = v20;
LABEL_16:

  return v22;
}

- (BOOL)performInstallationWithError:(id *)a3
{
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  if (!-[MIInstallable performInstallationWithError:](&v55, "performInstallationWithError:"))
  {
    id v17 = 0LL;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }

  uint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(void, const __CFString *, uint64_t))v5)[2](v5, @"CreatingContainer", 50LL);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  unsigned int v7 = [v6 bundleType];

  if (v7 <= 5 && ((1 << v7) & 0x36) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v54 = 0LL;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer tempAppBundleContainerWithIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "tempAppBundleContainerWithIdentifier:inDomain:withError:",  v9,  -[MIInstallable installationDomain](self, "installationDomain"),  &v54));
    id v11 = v54;
    -[MIInstallableBundle setBundleContainer:](self, "setBundleContainer:", v10);
  }

  else
  {
    uint64_t v42 = (void *)MIInstallerErrorDomain;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    unsigned int v43 = [v8 bundleType];
    id v45 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performInstallationWithError:]",  3478LL,  v42,  4LL,  0LL,  0LL,  @"Don't know how to create bundle container for installable type %d",  v44,  v43);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v45);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  if (!v12)
  {
    id v36 = (void *)MIInstallerErrorDomain;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
    id v40 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performInstallationWithError:]",  3483LL,  v36,  21LL,  v11,  &off_10008AFE8,  @"Failed to create container for %@",  v39,  (uint64_t)v38);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v40);

    goto LABEL_19;
  }

  uint64_t v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(void, const __CFString *, uint64_t))v13)[2](v13, @"InstallingApplication", 60LL);

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v53 = v11;
  unsigned int v16 = [v14 captureBundleByMoving:v15 withError:&v53];
  id v17 = v53;

  if (!v16) {
    goto LABEL_19;
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundle]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleURL]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  id v52 = v17;
  unsigned int v22 = -[MIInstallableBundle _captureDataFromStagingRootOrBundle:toContainer:withError:]( self,  "_captureDataFromStagingRootOrBundle:toContainer:withError:",  v20,  v21,  &v52);
  id v23 = v52;

  if (!v22) {
    goto LABEL_21;
  }
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundle]);
  unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  id v51 = v23;
  unsigned int v27 = -[MIInstallableBundle _writeOptionsDataToBundle:orContainer:error:]( self,  "_writeOptionsDataToBundle:orContainer:error:",  v25,  v26,  &v51);
  id v17 = v51;

  if (!v27) {
    goto LABEL_19;
  }
  id v50 = v17;
  unsigned int v28 = -[MIInstallableBundle _validateiTunesMetadataWithError:](self, "_validateiTunesMetadataWithError:", &v50);
  id v23 = v50;

  if (!v28) {
    goto LABEL_21;
  }
  id v49 = v23;
  unsigned int v29 = -[MIInstallableBundle _setBundleMetadataWithError:](self, "_setBundleMetadataWithError:", &v49);
  id v17 = v49;

  if (!v29) {
    goto LABEL_19;
  }
  id v48 = v17;
  unsigned int v30 = -[MIInstallableBundle _validateSinfsWithError:](self, "_validateSinfsWithError:", &v48);
  id v23 = v48;

  if (!v30) {
    goto LABEL_21;
  }
  id v47 = v23;
  unsigned int v31 = -[MIInstallableBundle _handleStashOptionWithError:](self, "_handleStashOptionWithError:", &v47);
  id v17 = v47;

  if (!v31)
  {
LABEL_19:
    if (!a3)
    {
LABEL_22:
      BOOL v35 = 0;
      goto LABEL_23;
    }

- (BOOL)_postFlightAppExtensionsWithError:(id *)a3
{
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  id v34 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v34)
  {
    id v32 = a3;
    id v6 = 0LL;
    uint64_t v35 = *(void *)v40;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v40 != v35) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      unsigned __int8 v10 = [v9 isPlaceholder];

      if ((v10 & 1) != 0)
      {
        id v11 = v6;
      }

      else
      {
        id v38 = v6;
        unsigned int v12 = [v8 makeExecutableWithError:&v38];
        id v11 = v38;

        if (!v12) {
          goto LABEL_22;
        }
      }

      id v37 = 0LL;
      unsigned __int8 v13 = [v8 updateMCMWithCodeSigningInfoAsAdvanceCopy:1 withError:&v37];
      id v14 = v37;
      if ((v13 & 1) == 0) {
        break;
      }
      uint64_t v15 = v5;
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 personaUniqueString]);
      id v36 = v11;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [v8 dataContainerCreatingIfNeeded:1 forPersona:v17 makeLive:0 created:0 error:&v36]);
      id v6 = v36;

      if (!v18)
      {
        unsigned __int8 v26 = (void *)MIInstallerErrorDomain;
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        id v28 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _postFlightAppExtensionsWithError:]",  3578LL,  v26,  21LL,  v6,  &off_10008B010,  @"Failed to create plugin data container for plugin %@",  v27,  (uint64_t)v22);
        uint64_t v25 = objc_claimAutoreleasedReturnValue(v28);
        id v11 = v6;
        uint64_t v5 = v15;
LABEL_21:

        id v11 = (id)v25;
LABEL_22:

        if (v32)
        {
          id v11 = v11;
          BOOL v19 = 0;
          *id v32 = v11;
        }

        else
        {
          BOOL v19 = 0;
        }

        goto LABEL_25;
      }

      uint64_t v5 = v15;
      -[NSMutableArray addObject:](v15, "addObject:", v18);

      if (v34 == (id)++v7)
      {
        id v34 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v34) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }

    uint64_t v20 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      id v31 = v14;
      MOLogWrite(v20);
    }

    uint64_t v21 = (void *)MIInstallerErrorDomain;
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier", v30, v31));
    [v8 isPlaceholder];
    id v24 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _postFlightAppExtensionsWithError:]",  3571LL,  v21,  110LL,  v14,  0LL,  @"Failed to set app extension code signing info with container manager for %@, isPlaceholder: %c",  v23,  (uint64_t)v22);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_21;
  }

  id v6 = 0LL;
LABEL_15:

  -[MIInstallableBundle setAppExtensionDataContainers:](self, "setAppExtensionDataContainers:", v5);
  BOOL v19 = 1;
  id v11 = v6;
LABEL_25:

  return v19;
}

- (BOOL)_setLaunchWarningDataWithError:(id *)a3
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleSigningInfo](self, "bundleSigningInfo"));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 launchWarningData]);
    id v14 = 0LL;
    unsigned __int8 v9 = [v7 setLaunchWarningData:v8 withError:&v14];
    id v10 = v14;

    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    id v11 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _setLaunchWarningDataWithError:]",  3605LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Unexpectedly missing bundle signing information",  v5,  v13);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v11);
    unsigned __int8 v9 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if ((v9 & 1) == 0) {
    *a3 = v10;
  }
LABEL_7:

  return v9;
}

- (BOOL)postFlightInstallationWithError:(id *)a3
{
  uint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(void, const __CFString *, uint64_t))v5)[2](v5, @"PostflightingApplication", 70LL);

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  if (!-[MIInstallable postFlightInstallationWithError:](&v39, "postFlightInstallationWithError:", a3))
  {
    id v12 = 0LL;
    if (a3)
    {
LABEL_25:
      id v14 = v12;
      BOOL v17 = 0;
      *a3 = v14;
      goto LABEL_28;
    }

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!-[MIInstallable shouldModifyExistingContainers](self, "shouldModifyExistingContainers")
    || [v6 status] != (id)1)
  {
    id v9 = 0LL;
LABEL_8:
    BOOL v13 = 1;
    goto LABEL_9;
  }

  id v16 = 0LL;
  unsigned int v7 = [v6 regenerateDirectoryUUIDWithError:&v16];
  id v8 = v16;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 containerURL]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      MOLogWrite(v10);
    }

    goto LABEL_8;
  }

  if (a4)
  {
    id v9 = v8;
    BOOL v13 = 0;
    *a4 = v9;
  }

  else
  {
    BOOL v13 = 0;
  }

- (unint64_t)_installationJournalOperationType
{
  if ((id)-[MIInstallable installOperationType](self, "installOperationType") == (id)1) {
    return 5LL;
  }
  if (!-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall")) {
    return 1LL;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  uint64_t v5 = v4;
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundle]),
        unsigned __int8 v7 = [v6 isPlaceholder],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
    id v9 = [v8 installTargetType];

    if (v9 == (id)3) {
      unint64_t v3 = 4LL;
    }
    else {
      unint64_t v3 = 3LL;
    }
  }

  else
  {
    unint64_t v3 = 2LL;
  }

  return v3;
}

- (id)_noLongerPresentAppExtensionDataContainers
{
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundle]);

  id v46 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appExtensionBundlesWithError:&v46]);
  id v6 = v46;
  if (v5)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v35 = self;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    id v9 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v42 + 1) + 8 * (void)i) identifier]);
          [v7 addObject:v13];
        }

        id v10 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v10);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id obj = v5;
    id v14 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v14)
    {
      id v15 = v14;
      __int128 v32 = v5;
      __int128 v33 = v4;
      uint64_t v16 = *(void *)v39;
      do
      {
        BOOL v17 = 0LL;
        uint64_t v18 = v6;
        do
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(obj);
          }
          unsigned int v19 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v17);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier", v30, v31));
          unsigned __int8 v21 = [v7 containsObject:v20];

          if ((v21 & 1) != 0)
          {
            id v6 = v18;
          }

          else
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](v35, "identity"));
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 personaUniqueString]);
            id v37 = v18;
            id v24 = (void *)objc_claimAutoreleasedReturnValue( [v19 dataContainerCreatingIfNeeded:0 forPersona:v23 makeLive:0 created:0 error:&v37]);
            id v25 = v37;

            uint64_t v26 = qword_100095BF8;
            if (v24)
            {
              if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
              {
                id v30 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
                MOLogWrite(v26);
              }

              objc_msgSend(v34, "addObject:", v24, v30);
            }

            else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
              id v31 = v25;
              MOLogWrite(v26);
            }

            id v6 = v25;
            uint64_t v18 = v25;
          }

          BOOL v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      }

      while (v15);
      uint64_t v5 = v32;
      uint64_t v4 = v33;
    }

    goto LABEL_31;
  }

  uint64_t v27 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleURL]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    id v31 = v6;
    id obj = v30;
    MOLogWrite(v27);
LABEL_31:
  }

  id v28 = objc_msgSend(v34, "copy", v30, v31);

  return v28;
}

- (id)_createJournalEntry
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  if (v4 && !-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall")) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstallableBundle _noLongerPresentAppExtensionDataContainers]( self,  "_noLongerPresentAppExtensionDataContainers"));
  }
  else {
    uint64_t v5 = 0LL;
  }
  unint64_t v6 = -[MIInstallableBundle _installationJournalOperationType](self, "_installationJournalOperationType");
  unsigned __int8 v7 = objc_alloc(&OBJC_CLASS___MIInstallationJournalEntry);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  unint64_t v10 = -[MIInstallable installationDomain](self, "installationDomain");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleSigningInfo](self, "bundleSigningInfo"));
  id v12 = -[MIInstallationJournalEntry initWithIdentity:bundleContainer:existingBundleContainer:installationDomain:operationType:installOptions:bundleSigningInfo:]( v7,  "initWithIdentity:bundleContainer:existingBundleContainer:installationDomain:operationType:installOptions:bundleSigningInfo:",  v8,  v9,  v4,  v10,  v6,  v3,  v11);

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  -[MIInstallationJournalEntry setProgressBlock:](v12, "setProgressBlock:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 linkedParentBundleID]);
  -[MIInstallationJournalEntry setLinkToParentBundleID:](v12, "setLinkToParentBundleID:", v14);

  -[MIInstallationJournalEntry setNoLongerPresentAppExtensionDataContainers:]( v12,  "setNoLongerPresentAppExtensionDataContainers:",  v5);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle dataContainer](self, "dataContainer"));
  -[MIInstallationJournalEntry setDataContainer:](v12, "setDataContainer:", v15);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  id v17 = [v16 copy];
  -[MIInstallationJournalEntry setAppExtensionBundles:](v12, "setAppExtensionBundles:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionDataContainers](self, "appExtensionDataContainers"));
  id v19 = [v18 copy];
  -[MIInstallationJournalEntry setAppExtensionDataContainers:](v12, "setAppExtensionDataContainers:", v19);

  return v12;
}

- (BOOL)finalizeInstallationWithError:(id *)a3
{
  uint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(void, const __CFString *, uint64_t))v5)[2](v5, @"SandboxingApplication", 80LL);

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  id v16 = 0LL;
  unsigned int v6 = -[MIInstallable finalizeInstallationWithError:](&v15, "finalizeInstallationWithError:", &v16);
  id v7 = v16;
  id v8 = v7;
  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _createJournalEntry](self, "_createJournalEntry"));
    id v14 = v8;
    unsigned int v10 = [v9 finalizeContainersWithError:&v14];
    id v11 = v14;

    if (v10)
    {
      -[MIInstallableBundle setJournalEntry:](self, "setJournalEntry:", v9);
      BOOL v12 = 1;
      goto LABEL_8;
    }
  }

  else
  {
    id v9 = 0LL;
    id v11 = v7;
  }

  if (a3)
  {
    id v11 = v11;
    BOOL v12 = 0;
    *a3 = v11;
  }

  else
  {
    BOOL v12 = 0;
  }

- (BOOL)stageBackgroundUpdate:(id *)a3 withError:(id *)a4
{
  id v24 = 0LL;
  id v25 = 0LL;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  unsigned int v7 = -[MIInstallable stageBackgroundUpdate:withError:](&v23, "stageBackgroundUpdate:withError:", &v25, &v24);
  id v8 = v25;
  id v9 = v24;
  unsigned int v10 = v9;
  if (!v7)
  {
    id v11 = 0LL;
    id v13 = v9;
    if (!a4)
    {
LABEL_15:
      BOOL v15 = 0;
      goto LABEL_17;
    }

- (id)launchServicesBundleRecordsWithError:(id *)a3
{
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MIInstallableBundle;
  id v6 = -[MIInstallable launchServicesBundleRecordsWithError:](&v12, "launchServicesBundleRecordsWithError:", a3);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle journalEntry](self, "journalEntry"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleRecordsToRegister]);
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v9);

    id v10 = -[NSMutableArray copy](v5, "copy");
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle journalEntry](self, "journalEntry"));
  LOBYTE(a3) = [v4 performLaunchServicesRegistrationWithError:a3];

  return (char)a3;
}

- (BOOL)isPlaceholderInstall
{
  return self->_isPlaceholderInstall;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (void)setBundleContainer:(id)a3
{
}

- (MIDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
}

- (NSArray)appExtensionBundles
{
  return self->_appExtensionBundles;
}

- (void)setAppExtensionBundles:(id)a3
{
}

- (NSArray)appExtensionDataContainers
{
  return self->_appExtensionDataContainers;
}

- (void)setAppExtensionDataContainers:(id)a3
{
}

- (NSArray)frameworkBundles
{
  return self->_frameworkBundles;
}

- (void)setFrameworkBundles:(id)a3
{
}

- (NSArray)xpcServiceBundles
{
  return self->_xpcServiceBundles;
}

- (void)setXpcServiceBundles:(id)a3
{
}

- (NSURL)upgradingBuiltInAppAtURL
{
  return self->_upgradingBuiltInAppAtURL;
}

- (void)setUpgradingBuiltInAppAtURL:(id)a3
{
}

- (NSMutableDictionary)identifiersMap
{
  return self->_identifiersMap;
}

- (void)setIdentifiersMap:(id)a3
{
}

- (BOOL)xpcServiceBundlesEnabled
{
  return self->_xpcServiceBundlesEnabled;
}

- (void)setXpcServiceBundlesEnabled:(BOOL)a3
{
  self->_xpcServiceBundlesEnabled = a3;
}

- (MICodeSigningInfo)bundleSigningInfo
{
  return self->_bundleSigningInfo;
}

- (void)setBundleSigningInfo:(id)a3
{
}

- (MIInstallationJournalEntry)journalEntry
{
  return self->_journalEntry;
}

- (void)setJournalEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end