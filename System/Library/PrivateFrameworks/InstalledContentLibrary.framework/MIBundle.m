@interface MIBundle
+ (BOOL)bundleIsInDenyList:(id)a3;
+ (id)_URLOfFirstBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5;
+ (id)bundleForURL:(id)a3 error:(id *)a4;
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)_isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 requiredOS:(unint64_t)a5 error:(id *)a6;
- (BOOL)_validateAppNSPrivacyTrackingDomainsWithError:(id *)a3;
- (BOOL)_validateExtensions:(id)a3 error:(id *)a4;
- (BOOL)_validateWithError:(id *)a3;
- (BOOL)allowsAppleAppExtensionsNotInExtensionCache;
- (BOOL)getIsBuiltForiOSPlatform:(BOOL *)a3 error:(id *)a4;
- (BOOL)isAppTypeBundle;
- (BOOL)isApplicableToCurrentDeviceCapabilitiesWithError:(id *)a3;
- (BOOL)isApplicableToCurrentDeviceFamilyWithError:(id *)a3;
- (BOOL)isApplicableToCurrentOSVersionWithError:(id *)a3;
- (BOOL)isApplicableToOSVersion:(id)a3 error:(id *)a4;
- (BOOL)isApplicableToOSVersionEarlierThan:(id)a3;
- (BOOL)isCompatibleWithDeviceFamily:(int)a3;
- (BOOL)isDeletable;
- (BOOL)isLaunchProhibited;
- (BOOL)isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 error:(id *)a5;
- (BOOL)isPlaceholder;
- (BOOL)isPlaceholderStatusValid;
- (BOOL)isRemovableSystemApp;
- (BOOL)isStaticContent;
- (BOOL)isWatchApp;
- (BOOL)mayHaveExecutableProgram;
- (BOOL)needsDataContainer;
- (BOOL)sdkBuildVersionIsAtLeast:(id)a3;
- (BOOL)setIsPlaceholderWithError:(id *)a3;
- (BOOL)thinningMatchesCurrentDeviceWithError:(id *)a3;
- (BOOL)validateAppMetadataWithError:(id *)a3;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (BOOL)validateExtensionKitMetadataWithError:(id *)a3;
- (BOOL)validatePluginKitMetadataWithError:(id *)a3;
- (MIBundle)initWithBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5;
- (MIBundle)initWithBundleParentURL:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6;
- (MIBundle)initWithBundleURL:(id)a3 error:(id *)a4;
- (MIBundle)initWithParentBundle:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6;
- (MIBundle)parentBundle;
- (NSArray)deviceFamilies;
- (NSArray)extensionKitBundles;
- (NSArray)frameworkBundles;
- (NSArray)pluginKitBundles;
- (NSArray)supportedDevices;
- (NSArray)xpcServiceBundles;
- (NSDictionary)infoPlistSubset;
- (NSSet)siriIntents;
- (NSString)bundleName;
- (NSString)bundleParentSubdirectory;
- (NSString)bundleShortVersion;
- (NSString)bundleTypeDescription;
- (NSString)bundleVersion;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)minimumOSVersion;
- (NSString)parentBundleID;
- (NSString)relativePath;
- (NSString)sdkBuildVersion;
- (NSURL)bundleParentDirectoryURL;
- (NSURL)bundleURL;
- (id)_filterExtensionBundles:(id)a3 forValidationFlags:(unsigned __int8)a4;
- (id)_filterExtensionBundlesNotInCacheIfNeeded:(id)a3;
- (id)_infoPlistKeysToLoad;
- (id)appExtensionBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)appExtensionBundlesWithError:(id *)a3;
- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4;
- (id)description;
- (id)extensionKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)extensionKitBundlesWithError:(id *)a3;
- (id)frameworkBundlesWithError:(id *)a3;
- (id)initForTesting;
- (id)pluginKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)pluginKitBundlesWithError:(id *)a3;
- (id)thisBundleAndAllContainedBundlesWithError:(id *)a3;
- (id)xpcServiceBundlesWithError:(id *)a3;
- (unsigned)bundleType;
- (void)infoPlistSubsetForTesting:(id)a3;
- (void)setBundleParentDirectoryURL:(id)a3;
- (void)setExtensionKitBundles:(id)a3;
- (void)setFrameworkBundles:(id)a3;
- (void)setIsPlaceholderStatusValid:(BOOL)a3;
- (void)setPluginKitBundles:(id)a3;
- (void)setXpcServiceBundles:(id)a3;
@end

@implementation MIBundle

- (BOOL)_validateWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    [v5 objectForKeyedSubscript:*MEMORY[0x189604E00]];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v8 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }

    if (v9 && [v9 length])
    {
      if (![v9 containsString:@"/"])
      {
        id v15 = 0LL;
        BOOL v16 = 1;
        goto LABEL_14;
      }
      v17 = -[MIBundle bundleURL](self, "bundleURL");
      [v17 path];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIBundle _validateWithError:]",  79LL,  @"MIInstallerErrorDomain",  69LL,  0LL,  &unk_189D63F20,  @"Bundle at path %@ had an invalid CFBundleIdentifier in its Info.plist: %@",  v19,  (uint64_t)v18);
    }

    else
    {
      v17 = -[MIBundle bundleURL](self, "bundleURL");
      [v17 path];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIBundle _validateWithError:]",  71LL,  @"MIInstallerErrorDomain",  12LL,  0LL,  &unk_189D63EF8,  @"Bundle at path %@ did not have a CFBundleIdentifier in its Info.plist",  v20,  (uint64_t)v18);
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3) {
      goto LABEL_13;
    }
  }

  else
  {
    v10 = -[MIBundle bundleURL](self, "bundleURL");
    [v10 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v11 = -[MIBundle bundleURL](self, "bundleURL");
    [v11 path];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    [v13 debugDescriptionForItemAtURL:v9];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIBundle _validateWithError:]",  64LL,  @"MIInstallerErrorDomain",  35LL,  0LL,  &unk_189D63ED0,  @"Failed to load Info.plist from bundle at path %@; %@",
      v14,
      (uint64_t)v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
LABEL_13:
      id v15 = v15;
      BOOL v16 = 0;
      *a3 = v15;
      goto LABEL_14;
    }
  }

  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIBundle;
  return -[MIBundle init](&v3, sel_init);
}

- (void)infoPlistSubsetForTesting:(id)a3
{
}

- (MIBundle)initWithBundleParentURL:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MIBundle;
  uint64_t v14 = -[MIBundle init](&v20, sel_init);
  id v15 = v14;
  if (!v14) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v14->_bundleName, a5);
  objc_storeStrong((id *)&v15->_bundleParentSubdirectory, a4);
  objc_storeStrong((id *)&v15->_bundleParentDirectoryURL, a3);
  parentBundleID = v15->_parentBundleID;
  v15->_parentBundleID = 0LL;

  BOOL v17 = -[MIBundle _validateWithError:](v15, "_validateWithError:", a6);
  v18 = 0LL;
  if (v17) {
LABEL_3:
  }
    v18 = v15;

  return v18;
}

- (MIBundle)initWithParentBundle:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MIBundle;
  id v13 = -[MIBundle init](&v21, sel_init);
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v13->_bundleName, a5);
  objc_storeStrong((id *)&v14->_bundleParentSubdirectory, a4);
  uint64_t v15 = [v10 bundleURL];
  bundleParentDirectoryURL = v14->_bundleParentDirectoryURL;
  v14->_bundleParentDirectoryURL = (NSURL *)v15;

  uint64_t v17 = [v10 identifier];
  parentBundleID = v14->_parentBundleID;
  v14->_parentBundleID = (NSString *)v17;

  objc_storeWeak((id *)&v14->_parentBundle, v10);
  if (!-[MIBundle _validateWithError:](v14, "_validateWithError:", a6)) {
    uint64_t v19 = 0LL;
  }
  else {
LABEL_3:
  }
    uint64_t v19 = v14;

  return v19;
}

- (MIBundle)initWithBundleURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 URLByDeletingLastPathComponent];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 lastPathComponent];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = -[MIBundle initWithBundleParentURL:parentSubdirectory:bundleName:error:]( self,  "initWithBundleParentURL:parentSubdirectory:bundleName:error:",  v7,  0LL,  v8,  a4);
  return v9;
}

+ (id)_URLOfFirstBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  id v26 = 0LL;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __61__MIBundle__URLOfFirstBundleInDirectory_withExtension_error___block_invoke;
  v18[3] = &unk_189D48910;
  id v10 = v8;
  id v19 = v10;
  objc_super v20 = &v21;
  [v9 enumerateURLsForItemsInDirectoryAtURL:v7 ignoreSymlinks:1 withBlock:v18];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v12 = (void *)v22[5];
  if (!v12)
  {
    [v7 path];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"+[MIBundle _URLOfFirstBundleInDirectory:withExtension:error:]",  160LL,  @"MIInstallerErrorDomain",  36LL,  0LL,  0LL,  @"Failed to locate a bundle with extension %@ in directory %@",  v13,  (uint64_t)v10);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    id v12 = (void *)v22[5];
    if (!a5 || v12)
    {
      id v11 = v14;
    }

    else
    {
      id v11 = v14;
      *a5 = v11;
      id v12 = (void *)v22[5];
    }
  }

  id v15 = v12;

  _Block_object_dispose(&v21, 8);
  return v15;
}

uint64_t __61__MIBundle__URLOfFirstBundleInDirectory_withExtension_error___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  id v6 = a2;
  id v7 = v6;
  if (a3 == 4)
  {
    [v6 pathExtension];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];
    if (v9) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    }
    uint64_t v10 = v9 ^ 1u;
  }

  else
  {
    uint64_t v10 = 1LL;
  }

  return v10;
}

- (MIBundle)initWithBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  [(id)objc_opt_class() _URLOfFirstBundleInDirectory:v9 withExtension:v8 error:a5];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[MIBundle initWithBundleURL:error:](self, "initWithBundleURL:error:", v10, a5);
    id v11 = self;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)_infoPlistKeysToLoad
{
  if (_infoPlistKeysToLoad_onceToken != -1) {
    dispatch_once(&_infoPlistKeysToLoad_onceToken, &__block_literal_global_2);
  }
  return (id)_infoPlistKeysToLoad_keysSet;
}

void __32__MIBundle__infoPlistKeysToLoad__block_invoke()
{
  uint64_t v0 = objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  *MEMORY[0x189604DF8],  *MEMORY[0x189604E00],  *MEMORY[0x189604AC8],  *MEMORY[0x189604E18],  *MEMORY[0x189604AB8],  *MEMORY[0x189604E10],  *MEMORY[0x189604AA0],  @"MinimumProductVersion",  @"MinimumOSVersion",  @"UIDeviceFamily",  @"InstallDeviceClasses",  @"UIBackgroundModes",  @"XPCService",  @"NSExtension",  @"EXAppExtensionAttributes",  @"UIRequiredDeviceCapabilities",  @"UISupportedDevices",  @"SupportedDevices",  @"WKCompanionAppBundleIdentifier",  @"CLKComplicationPrincipalClass",  @"CLKComplicationSupportedFamilies",  @"WKApplication",  @"WKWatchKitApp",  @"WKWatchOnly",  @"WKRunsIndependentlyOfCompanionApp",  @"LSApplicationLaunchProhibited",  @"LSCounterpartIdentifiers",  @"INAlternativeAppNames",  @"INIntentsSupported",  @"ITSWatchOnlyContainer",  @"DTSDKBuild",  @"NSPrivacyTrackingDomains",  0);
  v1 = (void *)_infoPlistKeysToLoad_keysSet;
  _infoPlistKeysToLoad_keysSet = v0;
}

- (NSDictionary)infoPlistSubset
{
  infoPlistSubset = self->_infoPlistSubset;
  if (infoPlistSubset) {
    goto LABEL_4;
  }
  v4 = -[MIBundle bundleURL](self, "bundleURL");
  v5 = -[MIBundle _infoPlistKeysToLoad](self, "_infoPlistKeysToLoad");
  MILoadInfoPlist(v4, v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (NSDictionary *)[v6 copy];
  id v8 = self->_infoPlistSubset;
  self->_infoPlistSubset = v7;

  if (-[NSDictionary count](self->_infoPlistSubset, "count"))
  {
    infoPlistSubset = self->_infoPlistSubset;
LABEL_4:
    id v9 = infoPlistSubset;
    return v9;
  }

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 path];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  id v9 = 0LL;
  return v9;
}

- (NSString)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*MEMORY[0x189604E00]];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

- (NSString)bundleVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*MEMORY[0x189604E18]];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

- (NSString)bundleShortVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*MEMORY[0x189604AC8]];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

- (BOOL)isRemovableSystemApp
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 systemAppPlaceholderBundleIDToInfoMap];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6 != 0LL;

  return v7;
}

- (unsigned)bundleType
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    unsigned __int8 bundleType = self->_bundleType;
    if (!bundleType)
    {
      -[MIBundle bundleURL](self, "bundleURL");
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 pathExtension];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();

      MIDiskImageManagerProxy();
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v6 isEqualToString:@"app"])
      {
        if ([v6 isEqualToString:@"appex"]
          || [v6 isEqualToString:@"appex"])
        {
          unsigned __int8 v14 = 6;
        }

        else if ([v6 isEqualToString:@"framework"])
        {
          unsigned __int8 v14 = 7;
        }

        else
        {
          if (![v6 isEqualToString:@"xpc"])
          {
            self->_unsigned __int8 bundleType = 0;
            goto LABEL_15;
          }

          unsigned __int8 v14 = 8;
        }

        self->_unsigned __int8 bundleType = v14;
LABEL_15:

        unsigned __int8 bundleType = self->_bundleType;
        goto LABEL_16;
      }
      v41 = -[MIBundle bundleParentDirectoryURL](self, "bundleParentDirectoryURL");
      [v41 path];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 systemAppsDirectory];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 path];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v8 isEqualToString:v11];

      if ((v12 & 1) != 0) {
        goto LABEL_5;
      }
      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 internalAppsDirectory];
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 path];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      char v18 = [v8 isEqualToString:v17];

      if ((v18 & 1) != 0)
      {
        unsigned __int8 v13 = 2;
        goto LABEL_13;
      }

      id v19 = v41;
      if ([v7 URLIsOnKnownImageMount:v41])
      {
        unsigned __int8 v13 = 3;
        goto LABEL_14;
      }

      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 coreServicesDirectory];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 path];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      char v24 = [v8 hasPrefix:v23];

      if ((v24 & 1) != 0)
      {
LABEL_24:
        unsigned __int8 v13 = 5;
        goto LABEL_14;
      }
      v25 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      [v25 systemAppPlaceholdersDirectory];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 path];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      char v28 = [v8 hasPrefix:v27];

      if ((v28 & 1) != 0)
      {
        unsigned __int8 v13 = 10;
        goto LABEL_14;
      }
      v29 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      [v29 systemAppBundleIDToInfoMap];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 objectForKeyedSubscript:v3];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
      }

      else
      {
        v40 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
        [v40 systemAppPlaceholderBundleIDToInfoMap];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v32 objectForKeyedSubscript:v3];
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          v34 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
          [v34 coreServicesAppBundleIDToInfoMap];
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 objectForKeyedSubscript:v3];
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          id v19 = v41;
          if (!v36)
          {
            v37 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
            [v37 internalAppBundleIDToInfoMap];
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v38 objectForKeyedSubscript:v3];
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              unsigned __int8 v13 = 2;
            }

            else if ([v7 bundleIDIsOnKnownImageMount:v3])
            {
              unsigned __int8 v13 = 3;
            }

            else
            {
              unsigned __int8 v13 = 4;
            }

            goto LABEL_14;
          }

          goto LABEL_24;
        }
      }

- (BOOL)isStaticContent
{
  id v6 = self;
  uint64_t v55 = *MEMORY[0x1895F89C0];
  v2 = -[MIBundle bundleParentDirectoryURL](self, "bundleParentDirectoryURL");
  [v2 path];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  MIDiskImageManagerProxy();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v6 bundleType];
  LOBYTE(v6) = 0;
  switch(v5)
  {
    case 1:
      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      [v23 systemAppsDirectory];
      char v28 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 2:
      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      [v23 internalAppsDirectory];
      char v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v29 = v28;
      [v28 path];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      char v31 = [v3 isEqual:v30];
      goto LABEL_25;
    case 3:
      LOBYTE(v6) = [v4 URLIsOnKnownImageMount:v2];
      goto LABEL_38;
    case 5:
      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      [v23 coreServicesDirectory];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 path];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      char v31 = [v3 isEqualToString:v30];
LABEL_25:
      LOBYTE(v6) = v31;

      goto LABEL_26;
    case 6:
    case 8:
      if ([v4 URLIsOnKnownImageMount:v2]) {
        goto LABEL_37;
      }
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 allExtensionKitExtensionsDirectories];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (!v8) {
        goto LABEL_11;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
LABEL_5:
      uint64_t v11 = 0LL;
      while (1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * v11) path];
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        char v13 = [v3 hasPrefix:v12];

        if ((v13 & 1) != 0) {
          goto LABEL_36;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v6 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (v9) {
            goto LABEL_5;
          }
LABEL_11:

          +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 allFrameworksDirectories];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v16 = (void *)[v15 mutableCopy];

          +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 systemAppsDirectory];
          char v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 addObject:v18];

          +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 coreServicesDirectory];
          objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 addObject:v20];

          +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 internalAppsDirectory];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 addObject:v22];

          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          id v23 = v16;
          id v6 = (void *)[v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v6)
          {
            uint64_t v24 = *(void *)v45;
            while (2)
            {
              for (i = 0LL; i != v6; i = (char *)i + 1)
              {
                if (*(void *)v45 != v24) {
                  objc_enumerationMutation(v23);
                }
                [*(id *)(*((void *)&v44 + 1) + 8 * (void)i) path];
                id v26 = (void *)objc_claimAutoreleasedReturnValue();
                char v27 = [v3 hasPrefix:v26];

                if ((v27 & 1) != 0)
                {
                  LOBYTE(v6) = 1;
                  goto LABEL_40;
                }
              }

              id v6 = (void *)[v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
              if (v6) {
                continue;
              }
              break;
            }
          }

- (NSString)bundleTypeDescription
{
  unsigned int v2 = -[MIBundle bundleType](self, "bundleType") - 1;
  if (v2 > 9) {
    return (NSString *)@"unknown bundle type";
  }
  else {
    return &off_189D48A40[(char)v2]->isa;
  }
}

- (BOOL)isPlaceholder
{
  if (!-[MIBundle isPlaceholderStatusValid](self, "isPlaceholderStatusValid"))
  {
    if (-[MIBundle bundleType](self, "bundleType") == 10)
    {
      self->_isPlaceholder = 1;
    }

    else
    {
      -[MIBundle parentBundle](self, "parentBundle");
      objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
      id v4 = v3;
      if (v3 && [v3 isPlaceholder])
      {
        self->_isPlaceholder = 1;
      }

      else
      {
        +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
        int v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIBundle bundleURL](self, "bundleURL");
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isPlaceholder = [v5 bundleAtURLIsPlaceholder:v6];
      }
    }

    -[MIBundle setIsPlaceholderStatusValid:](self, "setIsPlaceholderStatusValid:", 1LL);
  }

  return self->_isPlaceholder;
}

- (BOOL)setIsPlaceholderWithError:(id *)a3
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle bundleURL](self, "bundleURL");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v5 markBundleAsPlaceholder:v6 withError:a3];

  if ((_DWORD)v7) {
    self->_isPlaceholder = 1;
  }
  -[MIBundle setIsPlaceholderStatusValid:](self, "setIsPlaceholderStatusValid:", v7);
  return v7;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = (void *)objc_opt_new();
  uint64_t v37 = 0LL;
  char v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  __int128 v40 = __Block_byref_object_copy__2;
  __int128 v41 = __Block_byref_object_dispose__2;
  id v42 = 0LL;
  [v10 bundleURL];
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 URLByAppendingPathComponent:v11 isDirectory:1];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __71__MIBundle_bundlesInParentBundle_subDirectory_matchingPredicate_error___block_invoke;
  v30[3] = &unk_189D48958;
  id v17 = v12;
  id v34 = v17;
  id v36 = a1;
  id v18 = v10;
  id v31 = v18;
  id v19 = v11;
  id v32 = v19;
  uint64_t v35 = &v37;
  id v20 = v13;
  id v33 = v20;
  [v16 enumerateURLsForItemsInDirectoryAtURL:v15 ignoreSymlinks:1 withBlock:v30];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38[5])
  {
LABEL_10:
    uint64_t v24 = 0LL;
    if (!a6) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  if (!v21) {
    goto LABEL_6;
  }
  [v21 domain];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v22 isEqualToString:*MEMORY[0x189607688]])
  {

    goto LABEL_9;
  }

  uint64_t v23 = [v21 code];

  if (v23 != 2)
  {
LABEL_9:
    [v15 path];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = _CreateAndLogError( (uint64_t)"+[MIBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:]",  540LL,  @"MIInstallerErrorDomain",  54LL,  v21,  0LL,  @"Failed to discover bundles in directory %@",  v26,  (uint64_t)v25);
    char v28 = (void *)v38[5];
    v38[5] = v27;

    goto LABEL_10;
  }

LABEL_6:
  uint64_t v24 = (void *)[v20 copy];
  uint64_t v21 = 0LL;
  if (!a6) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v24) {
    *a6 = (id) v38[5];
  }
LABEL_13:

  _Block_object_dispose(&v37, 8);
  return v24;
}

BOOL __71__MIBundle_bundlesInParentBundle_subDirectory_matchingPredicate_error___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  id v5 = a2;
  if (a3 == 4 && ((uint64_t v6 = *(void *)(a1 + 56)) == 0 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v5)))
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    [v5 lastPathComponent];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = 0LL;
    id v11 = (void *)[v7 initWithParentBundle:v8 parentSubdirectory:v9 bundleName:v10 error:&v16];
    id v12 = v16;
    id v13 = v16;

    BOOL v14 = v11 != 0LL;
    if (v11) {
      [*(id *)(a1 + 48) addObject:v11];
    }
    else {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v12);
    }
  }

  else
  {
    BOOL v14 = 1LL;
  }

  return v14;
}

- (BOOL)allowsAppleAppExtensionsNotInExtensionCache
{
  return 0;
}

- (BOOL)isDeletable
{
  int v3 = -[MIBundle bundleType](self, "bundleType");
  -[MIBundle bundleParentDirectoryURL](self, "bundleParentDirectoryURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 4) {
    goto LABEL_6;
  }
  if (v3 == 2)
  {
    +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 internalAppsDirectory];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 path];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v5 isEqualToString:v11] & 1) == 0)
    {
LABEL_10:
      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      char v8 = [v12 allowsInternalSecurityPolicy];

      goto LABEL_11;
    }

- (id)_filterExtensionBundlesNotInCacheIfNeeded:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!-[MIBundle allowsAppleAppExtensionsNotInExtensionCache](self, "allowsAppleAppExtensionsNotInExtensionCache"))
  {
    id v17 = v4;
    goto LABEL_23;
  }

  id v5 = (void *)objc_opt_new();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v20 = v4;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7) {
    goto LABEL_21;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v23;
  do
  {
    uint64_t v10 = 0LL;
    do
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      if (!objc_msgSend(v11, "targetsAppleExtensionPoint", v19))
      {
        id v13 = 0LL;
LABEL_13:
        [v5 addObject:v11];
        goto LABEL_14;
      }

      id v21 = 0LL;
      [v11 extensionCacheEntryWithError:&v21];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = v21;

      if (v12) {
        goto LABEL_13;
      }
      [v13 domain];
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v14 isEqualToString:@"MIInstallerErrorDomain"])
      {
        uint64_t v15 = [v13 code];

        if (v15 == 45) {
          goto LABEL_13;
        }
      }

      else
      {
      }

      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        [v11 identifier];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
      }

- (id)_filterExtensionBundles:(id)a3 forValidationFlags:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = v5;
  if (!v4)
  {
    __int128 v22 = (void *)[v5 copy];
    goto LABEL_34;
  }

  uint64_t v7 = (void *)objc_opt_new();
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v27 = v6;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v9) {
    goto LABEL_32;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v31;
  do
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if ((v4 & 2) == 0
        || ([*(id *)(*((void *)&v30 + 1) + 8 * i) isApplicableToCurrentOSVersionWithError:0] & 1) != 0)
      {
        if ((v4 & 1) == 0) {
          goto LABEL_12;
        }
        id v29 = 0LL;
        char v14 = [v13 isApplicableToCurrentDeviceCapabilitiesWithError:&v29];
        id v15 = v29;
        if ((v14 & 1) != 0)
        {
LABEL_11:

LABEL_12:
          objc_msgSend(v7, "addObject:", v13, v24, v25);
          continue;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_26;
        }
        [v13 minimumOSVersion];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v18 compare:@"8.2" options:64] == -1 && v15 != 0)
        {
          [v15 domain];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v20 isEqualToString:@"MIInstallerErrorDomain"])
          {
            uint64_t v28 = [v15 code];

            if (v28 == 66) {
              goto LABEL_11;
            }
            goto LABEL_26;
          }
        }

LABEL_26:
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          objc_msgSend(v13, "bundleTypeDescription", v24, v25);
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 identifier];
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
          id v26 = v15;
          __int128 v24 = v21;
          MOLogWrite();
        }

        continue;
      }

      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        objc_msgSend(v13, "bundleTypeDescription", v24, v25, v26);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 bundleURL];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 path];
        __int128 v24 = v16;
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
      }
    }

    uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }

  while (v10);
LABEL_32:

  __int128 v22 = (void *)[v7 copy];
  id v6 = v27;
LABEL_34:

  return v22;
}

- (id)pluginKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v7 = -[MIBundle pluginKitBundles](self, "pluginKitBundles");
  if (v7)
  {
    id v8 = (id)v7;
    id v9 = 0LL;
    goto LABEL_20;
  }

  id v31 = 0LL;
  +[MIPluginKitBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:]( &OBJC_CLASS___MIPluginKitBundle,  "bundlesInParentBundle:subDirectory:matchingPredicate:error:",  self,  @"PlugIns",  &__block_literal_global_120,  &v31);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v31;
  if (!v8)
  {
    id v17 = 0LL;
    id v18 = 0LL;
    if (!a4) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }

  if (!-[MIBundle isWatchApp](self, "isWatchApp"))
  {
LABEL_19:
    -[MIBundle setPluginKitBundles:](self, "setPluginKitBundles:", v8);
LABEL_20:
    -[MIBundle _filterExtensionBundles:forValidationFlags:](self, "_filterExtensionBundles:forValidationFlags:", v8, v5);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle _filterExtensionBundlesNotInCacheIfNeeded:](self, "_filterExtensionBundlesNotInCacheIfNeeded:", v17);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v8 = v8;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v10)
  {
LABEL_13:
    uint64_t v15 = (uint64_t)v8;
    id v16 = v9;
LABEL_18:

    id v8 = (id)v15;
    id v9 = v16;
    goto LABEL_19;
  }

  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v28;
LABEL_7:
  uint64_t v13 = 0LL;
  while (1)
  {
    if (*(void *)v28 != v12) {
      objc_enumerationMutation(v8);
    }
    char v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
    if (v11 == ++v13)
    {
      uint64_t v11 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v11) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }

  v32[0] = @"PlugIns";
  [v14 bundleName];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v19;
  v32[2] = @"PlugIns";
  [MEMORY[0x189603F18] arrayWithObjects:v32 count:3];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  [NSString pathWithComponents:v20];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 identifier];
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = v9;
  +[MIPluginKitBundle bundlesInParentBundle:overrideParentBundleIDForValidation:subDirectory:matchingPredicate:error:]( &OBJC_CLASS___MIPluginKitBundle,  "bundlesInParentBundle:overrideParentBundleIDForValidation:subDirectory:matchingPredicate:error:",  self,  v22,  v21,  &__block_literal_global_120,  &v26);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v26;

  if (v23)
  {
    uint64_t v15 = [v8 arrayByAddingObjectsFromArray:v23];

    goto LABEL_18;
  }

  id v17 = 0LL;
  id v18 = 0LL;
  id v9 = v16;
  if (a4)
  {
LABEL_21:
    if (!v18) {
      *a4 = v9;
    }
  }

uint64_t __67__MIBundle_pluginKitBundlesPerformingPlatformValidation_withError___block_invoke( uint64_t a1,  void *a2)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 isEqualToString:@"appex"];

  return v3;
}

- (id)pluginKitBundlesWithError:(id *)a3
{
  return -[MIBundle pluginKitBundlesPerformingPlatformValidation:withError:]( self,  "pluginKitBundlesPerformingPlatformValidation:withError:",  3LL,  a3);
}

- (BOOL)validatePluginKitMetadataWithError:(id *)a3
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  BOOL v5 = -[MIBundle isLaunchProhibited](self, "isLaunchProhibited");
  -[MIBundle identifier](self, "identifier");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isEqualToString:@"com.apple.MapsExternalComponents"];

  id v91 = 0LL;
  -[MIBundle pluginKitBundlesWithError:](self, "pluginKitBundlesWithError:", &v91);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v91;
  if (!v8)
  {
    v77 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    if (a3)
    {
LABEL_97:
      id v9 = v9;
      BOOL v14 = 0;
      *a3 = v9;
      goto LABEL_98;
    }

- (id)extensionKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v7 = -[MIBundle extensionKitBundles](self, "extensionKitBundles");
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = 0LL;
    goto LABEL_7;
  }

  -[MIBundle bundleURL](self, "bundleURL");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 URLByAppendingPathComponent:@"Extensions" isDirectory:1];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 itemDoesNotExistOrIsNotDirectoryAtURL:v11];

  if (v13)
  {
    id v8 = (void *)objc_opt_new();
    id v9 = 0LL;
LABEL_6:
    -[MIBundle setExtensionKitBundles:](self, "setExtensionKitBundles:", v8);

LABEL_7:
    -[MIBundle _filterExtensionBundles:forValidationFlags:](self, "_filterExtensionBundles:forValidationFlags:", v8, v5);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle _filterExtensionBundlesNotInCacheIfNeeded:](self, "_filterExtensionBundlesNotInCacheIfNeeded:", v14);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  id v18 = 0LL;
  +[MIExtensionKitBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:]( &OBJC_CLASS___MIExtensionKitBundle,  "bundlesInParentBundle:subDirectory:matchingPredicate:error:",  self,  @"Extensions",  &__block_literal_global_213,  &v18);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v18;
  if (v8) {
    goto LABEL_6;
  }

  BOOL v14 = 0LL;
  id v15 = 0LL;
  if (!a4) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v15) {
    *a4 = v9;
  }
LABEL_10:
  id v16 = v15;

  return v16;
}

uint64_t __70__MIBundle_extensionKitBundlesPerformingPlatformValidation_withError___block_invoke( uint64_t a1,  void *a2)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 isEqualToString:@"appex"];

  return v3;
}

- (id)extensionKitBundlesWithError:(id *)a3
{
  return -[MIBundle extensionKitBundlesPerformingPlatformValidation:withError:]( self,  "extensionKitBundlesPerformingPlatformValidation:withError:",  3LL,  a3);
}

- (BOOL)_validateExtensions:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v16 = v11;
        int v13 = [v12 validateBundleMetadataWithError:&v16];
        id v8 = v16;

        if (!v13)
        {

          if (a4)
          {
            id v8 = v8;
            BOOL v14 = 0;
            *a4 = v8;
          }

          else
          {
            BOOL v14 = 0;
          }

          goto LABEL_15;
        }

        ++v10;
        uint64_t v11 = v8;
      }

      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (BOOL)validateExtensionKitMetadataWithError:(id *)a3
{
  id v12 = 0LL;
  -[MIBundle extensionKitBundlesWithError:](self, "extensionKitBundlesWithError:", &v12);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v12;
  uint64_t v7 = v6;
  if (v5)
  {
    id v11 = v6;
    BOOL v8 = -[MIBundle _validateExtensions:error:](self, "_validateExtensions:error:", v5, &v11);
    id v9 = v11;

    uint64_t v7 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v8) {
    *a3 = v7;
  }
LABEL_7:

  return v8;
}

- (id)appExtensionBundlesWithError:(id *)a3
{
  return -[MIBundle appExtensionBundlesPerformingPlatformValidation:withError:]( self,  "appExtensionBundlesPerformingPlatformValidation:withError:",  3LL,  a3);
}

- (id)appExtensionBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v7 = (void *)objc_opt_new();
  -[MIBundle pluginKitBundlesPerformingPlatformValidation:withError:]( self,  "pluginKitBundlesPerformingPlatformValidation:withError:",  v5,  a4);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MIBundle extensionKitBundlesPerformingPlatformValidation:withError:]( self,  "extensionKitBundlesPerformingPlatformValidation:withError:",  v5,  a4);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      [v7 addObjectsFromArray:v8];
      [v7 addObjectsFromArray:v9];
      uint64_t v10 = (void *)[v7 copy];
    }

    else
    {
      uint64_t v10 = 0LL;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  return 1;
}

+ (BOOL)bundleIsInDenyList:(id)a3
{
  id v3 = a3;
  if (bundleIsInDenyList__onceToken != -1) {
    dispatch_once(&bundleIsInDenyList__onceToken, &__block_literal_global_217);
  }
  int v4 = (void *)bundleIsInDenyList__denylist;
  [v3 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v4 containsObject:v5];

  if (v6 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    [v3 path];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  return v6;
}

void __31__MIBundle_bundleIsInDenyList___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604010] setWithArray:&unk_189D64D80];
  v1 = (void *)bundleIsInDenyList__denylist;
  bundleIsInDenyList__denylist = v0;
}

- (id)frameworkBundlesWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = 0LL;
    goto LABEL_5;
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __38__MIBundle_frameworkBundlesWithError___block_invoke;
  v12[3] = &unk_189D48A00;
  v12[4] = self;
  uint64_t v7 = (void *)MEMORY[0x186E27154](v12);
  id v11 = 0LL;
  +[MIExecutableBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:]( &OBJC_CLASS___MIExecutableBundle,  "bundlesInParentBundle:subDirectory:matchingPredicate:error:",  self,  @"Frameworks",  v7,  &v11);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v11;
  if (v8)
  {
    -[MIBundle setFrameworkBundles:](self, "setFrameworkBundles:", v8);

LABEL_5:
    -[MIBundle frameworkBundles](self, "frameworkBundles");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

  id v9 = 0LL;
  if (!a3) {
    goto LABEL_8;
  }
LABEL_6:
  if (!v9) {
    *a3 = v6;
  }
LABEL_8:

  return v9;
}

uint64_t __38__MIBundle_frameworkBundlesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 pathExtension];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (id)xpcServiceBundlesWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = 0LL;
    goto LABEL_5;
  }

  id v10 = 0LL;
  +[MIExecutableBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:]( &OBJC_CLASS___MIExecutableBundle,  "bundlesInParentBundle:subDirectory:matchingPredicate:error:",  self,  @"XPCServices",  &__block_literal_global_248,  &v10);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v10;
  if (v7)
  {
    -[MIBundle setXpcServiceBundles:](self, "setXpcServiceBundles:", v7);

LABEL_5:
    -[MIBundle xpcServiceBundles](self, "xpcServiceBundles");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

  BOOL v8 = 0LL;
  if (!a3) {
    goto LABEL_8;
  }
LABEL_6:
  if (!v8) {
    *a3 = v6;
  }
LABEL_8:

  return v8;
}

uint64_t __39__MIBundle_xpcServiceBundlesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 isEqualToString:@"xpc"];

  return v3;
}

- (id)thisBundleAndAllContainedBundlesWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)objc_opt_new();
  [v5 addObject:self];
  if (-[MIBundle mayContainAppExtensions](self, "mayContainAppExtensions"))
  {
    id v54 = 0LL;
    -[MIBundle appExtensionBundlesPerformingPlatformValidation:withError:]( self,  "appExtensionBundlesPerformingPlatformValidation:withError:",  0LL,  &v54);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v54;
    if (!v6) {
      goto LABEL_40;
    }
    id v36 = a3;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      while (2)
      {
        uint64_t v12 = 0LL;
        int v13 = v7;
        do
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v14 = *(void **)(*((void *)&v50 + 1) + 8 * v12);
          id v49 = v13;
          objc_msgSend(v14, "thisBundleAndAllContainedBundlesWithError:", &v49, v36);
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v7 = v49;

          if (!v15)
          {

            id v26 = 0LL;
            a3 = v36;
            goto LABEL_41;
          }

          [v5 unionSet:v15];

          ++v12;
          int v13 = v7;
        }

        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v16 = v7;
    a3 = v36;
  }

  else
  {
    id v16 = 0LL;
  }

  if (!-[MIBundle isAppTypeBundle](self, "isAppTypeBundle", v36)) {
    goto LABEL_24;
  }
  id v48 = v16;
  -[MIBundle xpcServiceBundlesWithError:](self, "xpcServiceBundlesWithError:", &v48);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v48;

  if (!v17)
  {
LABEL_40:
    id v26 = 0LL;
    goto LABEL_41;
  }

  __int128 v47 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v44 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v45;
    while (2)
    {
      uint64_t v22 = 0LL;
      uint64_t v23 = v7;
      do
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(void **)(*((void *)&v44 + 1) + 8 * v22);
        id v43 = v23;
        [v24 thisBundleAndAllContainedBundlesWithError:&v43];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        id v7 = v43;

        if (!v25)
        {

          goto LABEL_40;
        }

        [v5 unionSet:v25];

        ++v22;
        uint64_t v23 = v7;
      }

      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  id v16 = v7;
LABEL_24:
  if (!-[MIBundle mayContainFrameworks](self, "mayContainFrameworks"))
  {
    id v7 = v16;
LABEL_36:
    id v26 = (void *)[v5 copy];
    goto LABEL_41;
  }

  id v42 = v16;
  -[MIBundle frameworkBundlesWithError:](self, "frameworkBundlesWithError:", &v42);
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v42;

  if (v26)
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v27 = v26;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v55 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v39;
      while (2)
      {
        uint64_t v31 = 0LL;
        uint64_t v32 = v7;
        do
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v33 = *(void **)(*((void *)&v38 + 1) + 8 * v31);
          id v37 = v32;
          [v33 thisBundleAndAllContainedBundlesWithError:&v37];
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
          id v7 = v37;

          if (!v34)
          {

            goto LABEL_40;
          }

          [v5 unionSet:v34];

          ++v31;
          uint64_t v32 = v7;
        }

        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v55 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }

    goto LABEL_36;
  }

- (NSURL)bundleParentDirectoryURL
{
  return self->_bundleParentDirectoryURL;
}

- (NSString)relativePath
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 relativePath];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MIBundle bundleParentSubdirectory](self, "bundleParentSubdirectory");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringByAppendingPathComponent:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 lastPathComponent];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringByAppendingPathComponent:v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 lastPathComponent];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (NSString)displayName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:*MEMORY[0x189604AA0]];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }

  if (!v6 || ![v6 length])
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:*MEMORY[0x189604E10]];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0LL;
    }

    if (v10 && [v10 length])
    {
      id v6 = v10;
    }

    else
    {
      -[MIBundle bundleURL](self, "bundleURL");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 lastPathComponent];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSString *)v6;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)&self->_bundleParentDirectoryURL, a3);
  -[MIBundle bundleURL](self, "bundleURL");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle pluginKitBundles](self, "pluginKitBundles");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v44;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * v12++) setBundleParentDirectoryURL:v6];
        }

        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
      }

      while (v10);
    }
  }

  -[MIBundle extensionKitBundles](self, "extensionKitBundles");
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = v13;
  if (v13)
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v18++) setBundleParentDirectoryURL:v6];
        }

        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v49 count:16];
      }

      while (v16);
    }
  }

  -[MIBundle frameworkBundles](self, "frameworkBundles");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v19;
  if (v19)
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        uint64_t v24 = 0LL;
        do
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v24++) setBundleParentDirectoryURL:v6];
        }

        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v48 count:16];
      }

      while (v22);
    }
  }

  -[MIBundle xpcServiceBundles](self, "xpcServiceBundles");
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = v25;
  if (v25)
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        uint64_t v30 = 0LL;
        do
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v30++) setBundleParentDirectoryURL:v6];
        }

        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v47 count:16];
      }

      while (v28);
    }
  }
}

- (NSURL)bundleURL
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MIBundle bundleParentDirectoryURL](self, "bundleParentDirectoryURL");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MIBundle bundleParentSubdirectory](self, "bundleParentSubdirectory");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 URLByAppendingPathComponent:v5 isDirectory:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MIBundle bundleName](self, "bundleName");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 URLByAppendingPathComponent:v7 isDirectory:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = v6;
  }

  else
  {
    -[MIBundle bundleName](self, "bundleName");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 URLByAppendingPathComponent:v7 isDirectory:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v8;
}

+ (id)bundleForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBundleURL:v5 error:a4];

  return v6;
}

- (BOOL)needsDataContainer
{
  return 0;
}

- (NSString)minimumOSVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"MinimumProductVersion"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }

  if (v6) {
    id v7 = v6;
  }
  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"MinimumOSVersion"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  id v12 = v6;
  if (v11)
  {
    id v12 = v11;
  }

  id v13 = v12;

  return (NSString *)v13;
}

- (NSArray)deviceFamilies
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"UIDeviceFamily"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  return (NSArray *)v5;
}

- (BOOL)isWatchApp
{
  return -[MIBundle isCompatibleWithDeviceFamily:](self, "isCompatibleWithDeviceFamily:", 4LL);
}

- (BOOL)isLaunchProhibited
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"LSApplicationLaunchProhibited"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    char v4 = [v3 BOOLValue];
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v5 = 0;
      goto LABEL_7;
    }

    char v4 = [v3 isEqualToString:@"YES"];
  }

  BOOL v5 = v4;
LABEL_7:

  return v5;
}

- (BOOL)isAppTypeBundle
{
  int v2 = -[MIBundle bundleType](self, "bundleType");
  return v2 == 9 || (v2 - 1) < 5;
}

- (BOOL)mayHaveExecutableProgram
{
  int v2 = -[MIBundle bundleType](self, "bundleType");
  return (v2 & 0xFE) == 8 || (v2 - 1) < 6;
}

- (BOOL)getIsBuiltForiOSPlatform:(BOOL *)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle deviceFamilies](self, "deviceFamilies");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = MIIsCompatibleWithAtLeastOneDeviceFamily(v7, v6, 1LL);

  if (a3) {
    *a3 = v8;
  }

  return 1;
}

- (BOOL)isCompatibleWithDeviceFamily:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[MIBundle deviceFamilies](self, "deviceFamilies");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = MIIsCompatibleWithDeviceFamily(v4, v3);

  return v3;
}

- (BOOL)isApplicableToCurrentDeviceFamilyWithError:(id *)a3
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = MIIsApplicableToCurrentDeviceFamilyWithError(v4, a3);

  return (char)a3;
}

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  id v7 = (void *)MGCopyAnswer();
  if (v7)
  {
    id v8 = 0LL;
    if (a3) {
      *a3 = 1LL;
    }
  }

  else
  {
    _CreateAndLogError( (uint64_t)"-[MIBundle currentOSVersionForValidationUsingPlatform:withError:]",  1527LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Could not get the product version from MobileGestalt.",  v6,  v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
  }

  return v7;
}

- (BOOL)isApplicableToCurrentOSVersionWithError:(id *)a3
{
  id v12 = 0LL;
  uint64_t v13 = 0LL;
  -[MIBundle currentOSVersionForValidationUsingPlatform:withError:]( self,  "currentOSVersionForValidationUsingPlatform:withError:",  &v13,  &v12);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v12;
  if (v5)
  {
    -[MIBundle minimumOSVersion](self, "minimumOSVersion");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v6;
    BOOL v8 = -[MIBundle _isMinimumOSVersion:applicableToOSVersion:requiredOS:error:]( self,  "_isMinimumOSVersion:applicableToOSVersion:requiredOS:error:",  v7,  v5,  v13,  &v11);
    id v9 = v11;

    id v6 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v8) {
    *a3 = v6;
  }
LABEL_7:

  return v8;
}

- (BOOL)isApplicableToOSVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MIBundle minimumOSVersion](self, "minimumOSVersion");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[MIBundle isMinimumOSVersion:applicableToOSVersion:error:]( self,  "isMinimumOSVersion:applicableToOSVersion:error:",  v7,  v6,  a4);

  return (char)a4;
}

- (BOOL)isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 error:(id *)a5
{
  return -[MIBundle _isMinimumOSVersion:applicableToOSVersion:requiredOS:error:]( self,  "_isMinimumOSVersion:applicableToOSVersion:requiredOS:error:",  a3,  a4,  1LL,  a5);
}

- (BOOL)_isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 requiredOS:(unint64_t)a5 error:(id *)a6
{
  v22[3] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v10 && [v11 compare:v10 options:64] == -1)
  {
    v21[0] = @"LegacyErrorString";
    v21[1] = @"RequiredOSVersion";
    v22[0] = @"DeviceOSVersionTooLow";
    v22[1] = v10;
    v21[2] = @"RequiredOS";
    [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v16;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:3];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 path];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError( (uint64_t)"-[MIBundle _isMinimumOSVersion:applicableToOSVersion:requiredOS:error:]",  1639LL,  @"MIInstallerErrorDomain",  9LL,  0LL,  v17,  @"The system version is lower than the minimum OS version specified for bundle at %@. Have %@; need %@",
      v20,
      (uint64_t)v19);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      id v13 = v13;
      BOOL v14 = 0;
      *a6 = v13;
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  else
  {
    id v13 = 0LL;
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)isApplicableToOSVersionEarlierThan:(id)a3
{
  id v4 = a3;
  -[MIBundle minimumOSVersion](self, "minimumOSVersion");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    BOOL v6 = [v4 compare:v5 options:64] == 1;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)isApplicableToCurrentDeviceCapabilitiesWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"UIRequiredDeviceCapabilities"];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    id v7 = 0LL;
    id v8 = 0LL;
    char v12 = 1;
    goto LABEL_14;
  }

  +[MICapabilitiesManager defaultManager](&OBJC_CLASS___MICapabilitiesManager, "defaultManager");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  [v6 checkCapabilities:v5 withOptions:0 error:&v16];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v16;

  if (!v7)
  {
    char v12 = 0;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  [v7 objectForKeyedSubscript:@"CapabilitiesMatch"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  char v12 = [v11 BOOLValue];
  if ((v12 & 1) == 0)
  {
    uint64_t v14 = _CreateError( (uint64_t)"-[MIBundle isApplicableToCurrentDeviceCapabilitiesWithError:]",  1686LL,  @"MIInstallerErrorDomain",  67LL,  0LL,  0LL,  @"Device capabilities do not match requirements: %@",  v13,  (uint64_t)v7);

    id v8 = (id)v14;
  }

  if (a3)
  {
LABEL_12:
    if ((v12 & 1) == 0)
    {
      id v8 = v8;
      char v12 = 0;
      *a3 = v8;
    }
  }

- (NSArray)supportedDevices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"UISupportedDevices"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }

  if (!v6)
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:@"SupportedDevices"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v9;
    }
    else {
      id v6 = 0LL;
    }
  }

  return (NSArray *)v6;
}

- (BOOL)thinningMatchesCurrentDeviceWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_4;
  }
  int v6 = -[MIBundle bundleType](self, "bundleType");
  if ((v6 - 1) >= 5 && v6 != 9)
  {
    _CreateAndLogError( (uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]",  1724LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Unexpectedly asked to validate thinning on a non-app bundle %@",  v7,  (uint64_t)self);
LABEL_14:
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0LL;
    goto LABEL_15;
  }

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 skipThinningCheck];

  if ((v9 & 1) != 0)
  {
LABEL_4:
    id v10 = 0LL;
    id v11 = 0LL;
LABEL_5:
    BOOL v12 = 1;
    goto LABEL_6;
  }

  objc_opt_class();
  if ((MIArrayContainsOnlyClass(v5) & 1) == 0)
  {
    _CreateAndLogError( (uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]",  1734LL,  @"MIInstallerErrorDomain",  87LL,  0LL,  &unk_189D64128,  @"The value of the UISupportedDevices key in this app's Info.plist key must contain only string values.",  v14,  v21);
    goto LABEL_14;
  }

  id v11 = (void *)MGCopyAnswer();
  if (!v11)
  {
    _CreateAndLogError( (uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]",  1744LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"MGCopyAnswer for kMGOCompatibleAppVariants returned NULL",  v15,  v21);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    BOOL v12 = 0;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }

  [v5 firstObjectCommonWithArray:v11];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    id v10 = 0LL;
    goto LABEL_5;
  }

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 alternateThinningModelIdentifier];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && [v5 containsObject:v18])
  {
    id v10 = 0LL;
    BOOL v12 = 1;
  }

  else
  {
    objc_msgSend(v5, "componentsJoinedByString:", @", ");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", @", ");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]",  1759LL,  @"MIInstallerErrorDomain",  86LL,  0LL,  &unk_189D64150,  @"This app is not compatibile with this device. This app specifies a value for UISupportedDevices in its Info.plist as [%@], but none of the identifiers in this device's compatibility list are present in this app's supported devices. This device is compatible with [%@].",  v20,  (uint64_t)v19);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v12 = 0;
  }

  if (a3)
  {
LABEL_16:
    if (!v12)
    {
      id v10 = v10;
      BOOL v12 = 0;
      *a3 = v10;
    }
  }

- (id)description
{
  uint64_t v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle bundleURL](self, "bundleURL");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 path];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle bundleTypeDescription](self, "bundleTypeDescription");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : path = %@ identifier = %@ type = %@>", v5, v7, v8, v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSSet)siriIntents
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v32 = 0LL;
  -[MIBundle pluginKitBundlesWithError:](self, "pluginKitBundlesWithError:", &v32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v32;
  id v5 = v4;
  if (v3)
  {
    id v26 = v4;
    uint64_t v27 = v3;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0LL;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          BOOL v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v12 isSiriIntentsExtension])
          {
            if (!v9) {
              char v9 = (void *)objc_opt_new();
            }
            [v12 extensionAttributes];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v14 = v13;
            if (v13)
            {
              [v13 objectForKeyedSubscript:@"IntentsSupported"];
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15) {
                [v9 addObjectsFromArray:v15];
              }
            }
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }

      while (v8);
    }

    else
    {
      char v9 = 0LL;
    }

    id v5 = v26;
    uint64_t v3 = v27;
  }

  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v22 = self;
      id v24 = v4;
      MOLogWrite();
    }

    char v9 = 0LL;
  }

  -[MIBundle infoPlistSubset](self, "infoPlistSubset", v22, v24);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 objectForKeyedSubscript:@"INIntentsSupported"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v18 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v19 = v18;
  }
  else {
    id v19 = 0LL;
  }

  if (v19)
  {
    objc_opt_class();
    if (MIArrayContainsOnlyClass(v19))
    {
      if (!v9) {
        char v9 = (void *)objc_opt_new();
      }
      [v9 addObjectsFromArray:v19];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v23 = self;
      id v25 = v19;
      MOLogWrite();
    }
  }

  uint64_t v20 = (void *)objc_msgSend(v9, "copy", v23, v25);

  return (NSSet *)v20;
}

- (BOOL)_validateAppNSPrivacyTrackingDomainsWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"NSPrivacyTrackingDomains"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_12:
    id v11 = 0LL;
    BOOL v12 = 1;
    goto LABEL_17;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
LABEL_5:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }

      id v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIBundle _validateAppNSPrivacyTrackingDomainsWithError:]",  1835LL,  @"MIInstallerErrorDomain",  193LL,  0LL,  0LL,  @"The NSPrivacyTrackingDomains key in the app's Info.plist must have an array value containing strings. An entry was found in that array of non-string type: %@",  v18,  (uint64_t)v17);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (a3) {
        goto LABEL_14;
      }
      goto LABEL_16;
    }

- (BOOL)validateAppMetadataWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"INAlternativeAppNames"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  if ((unint64_t)[v8 count] >= 4)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 path];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIBundle validateAppMetadataWithError:]",  1861LL,  @"MIInstallerErrorDomain",  132LL,  0LL,  &unk_189D64178,  @"Bundle at path %@ has %lu %@ in its Info.plist, maximum of %lu allowed",  v11,  (uint64_t)v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKeyedSubscript:@"ITSWatchOnlyContainer"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    _CreateAndLogError( (uint64_t)"-[MIBundle validateAppMetadataWithError:]",  1866LL,  @"MIInstallerErrorDomain",  137LL,  0LL,  &unk_189D641A0,  @"This app has the %@ key set in its Info.plist, which identifies it as a shell app surrounding a Watch-only app; these are not installable.",
      v15,
      (uint64_t)@"ITSWatchOnlyContainer");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    BOOL v16 = 0;
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  id v18 = 0LL;
  BOOL v16 = -[MIBundle _validateAppNSPrivacyTrackingDomainsWithError:]( self,  "_validateAppNSPrivacyTrackingDomainsWithError:",  &v18);
  id v12 = v18;
  if (!a3) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v16) {
    *a3 = v12;
  }
LABEL_11:

  return v16;
}

- (NSString)sdkBuildVersion
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"DTSDKBuild"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

- (BOOL)sdkBuildVersionIsAtLeast:(id)a3
{
  id v4 = a3;
  -[MIBundle sdkBuildVersion](self, "sdkBuildVersion");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5) {
    BOOL v7 = [v5 compare:v4 options:64] != -1;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)bundleParentSubdirectory
{
  return self->_bundleParentSubdirectory;
}

- (MIBundle)parentBundle
{
  return (MIBundle *)objc_loadWeakRetained((id *)&self->_parentBundle);
}

- (NSArray)pluginKitBundles
{
  return self->_pluginKitBundles;
}

- (void)setPluginKitBundles:(id)a3
{
}

- (NSArray)extensionKitBundles
{
  return self->_extensionKitBundles;
}

- (void)setExtensionKitBundles:(id)a3
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

- (BOOL)isPlaceholderStatusValid
{
  return self->_isPlaceholderStatusValid;
}

- (void)setIsPlaceholderStatusValid:(BOOL)a3
{
  self->_isPlaceholderStatusValid = a3;
}

- (void).cxx_destruct
{
}

@end