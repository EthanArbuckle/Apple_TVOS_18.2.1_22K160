@interface MIExecutableBundle
+ (BOOL)isGrandfatheredNonContainerizedForSigningInfo:(id)a3;
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)_hasNoConflictWithSystemAppsForSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_hasNonContainerizingEntitlement:(id)a3 checkSeatbeltProfiles:(BOOL)a4;
- (BOOL)_validateWithError:(id *)a3;
- (BOOL)allowsAppleAppExtensionsNotInExtensionCache;
- (BOOL)executableExistsWithError:(id *)a3;
- (BOOL)getSinfDataType:(unsigned int *)a3 withError:(id *)a4;
- (BOOL)hasExecutableSliceForCPUType:(int)a3 subtype:(int)a4 error:(id *)a5;
- (BOOL)hasExecutableSliceForPlatform:(unsigned int)a3 error:(id *)a4;
- (BOOL)hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:(id)a3 forPersona:(id)a4 error:(id *)a5;
- (BOOL)hasSinf;
- (BOOL)makeAndSetNewInstallationIdentityWithError:(id *)a3;
- (BOOL)makeExecutableWithError:(id *)a3;
- (BOOL)needsDataContainer;
- (BOOL)needsSinf;
- (BOOL)onlyHasExecutableSlicesForPlatform:(unsigned int)a3 error:(id *)a4;
- (BOOL)replicateRootSinfWithError:(id *)a3;
- (BOOL)setLaunchWarningData:(id)a3 withError:(id *)a4;
- (BOOL)setSinfDataType:(unsigned int)a3 withError:(id *)a4;
- (BOOL)sinfDataTypeIsSet;
- (BOOL)transferInstallationIdentityFromBundle:(id)a3 error:(id *)a4;
- (BOOL)updateMCMWithCodeSigningInfoAsAdvanceCopy:(BOOL)a3 withError:(id *)a4;
- (BOOL)updateSinfWithData:(id)a3 error:(id *)a4;
- (BOOL)validateSinfWithError:(id *)a3;
- (Class)dataContainerClass;
- (MIBundleContainer)bundleContainer;
- (MICodeSigningInfo)codeSigningInfo;
- (MIExecutableBundle)initWithBundleInContainer:(id)a3 withExtension:(id)a4 error:(id *)a5;
- (MIInstallationIdentity)installationIdentity;
- (MIPluginKitBundle)watchKitPlugin;
- (NSArray)counterpartIdentifiers;
- (NSArray)executableImageSlices;
- (NSError)codeSigningInfoError;
- (NSError)wk2AppBundleError;
- (NSString)executableName;
- (NSString)watchKitAppExecutableHash;
- (NSURL)executableURL;
- (NSURL)relativeExecutablePath;
- (NSURL)rootSinfURL;
- (NSURL)rootSupfURL;
- (NSURL)rootSuppURL;
- (__CFBundle)cfBundle;
- (id)_codeSigningInfoFromMCM;
- (id)_dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 checkIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8;
- (id)_nameListForPlatformSet:(id)a3;
- (id)bundleSignatureVersionWithError:(id *)a3;
- (id)codeSigningInfoByValidatingResources:(BOOL)a3 performingOnlineAuthorization:(BOOL)a4 ignoringCachedSigningInfo:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 skippingProfileIDValidation:(BOOL)a7 error:(id *)a8;
- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
- (id)dataContainerForPersona:(id)a3 error:(id *)a4;
- (id)enumerateDylibsWithBlock:(id)a3;
- (id)executableImageSlicesWithError:(id *)a3;
- (id)executablePlatformsWithError:(id *)a3;
- (id)fairPlaySinfInfoWithError:(id *)a3;
- (id)initForTesting;
- (id)installationIdentitySettingIfNotSet:(BOOL)a3 withError:(id *)a4;
- (id)lsInstallTypeWithError:(id *)a3;
- (id)updateAndValidateSinf:(id)a3 error:(id *)a4;
- (id)updateAndValidateSinf:(id)a3 withRollback:(BOOL)a4 error:(id *)a5;
- (int)_installEmbeddedProvisioningProfileAtURL:(id)a3 withProgress:(id)a4;
- (int)dataProtectionClass;
- (int)installEmbeddedProvisioningProfileWithProgress:(id)a3;
- (unint64_t)codeSignatureVerificationState;
- (unint64_t)compatibilityState;
- (unint64_t)dataContainerContentClass;
- (unint64_t)estimatedMemoryUsageToValidate;
- (unint64_t)lsInstallType;
- (unsigned)maxLinkedSDKVersion;
- (unsigned)sinfDataType;
- (void)bestEffortRollbackSinfData:(id)a3;
- (void)dealloc;
- (void)removeSinf;
- (void)setBundleContainer:(id)a3;
- (void)setBundleParentDirectoryURL:(id)a3;
- (void)setCodeSigningInfo:(id)a3;
- (void)setCodeSigningInfoError:(id)a3;
- (void)setExecutableImageSlices:(id)a3;
- (void)setInstallationIdentity:(id)a3;
- (void)setLsInstallType:(unint64_t)a3;
- (void)setSinfDataType:(unsigned int)a3;
- (void)setSinfDataTypeIsSet:(BOOL)a3;
- (void)setWatchKitAppExecutableHash:(id)a3;
- (void)setWatchKitPlugin:(id)a3;
- (void)setWk2AppBundleError:(id)a3;
@end

@implementation MIExecutableBundle

- (void)dealloc
{
  cfBundle = self->_cfBundle;
  if (cfBundle)
  {
    CFRelease(cfBundle);
    self->_cfBundle = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MIExecutableBundle;
  -[MIExecutableBundle dealloc](&v4, sel_dealloc);
}

- (BOOL)_validateWithError:(id *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MIExecutableBundle;
  id v24 = 0LL;
  unsigned __int8 v5 = -[MIBundle _validateWithError:](&v23, sel__validateWithError_, &v24);
  id v6 = v24;
  id v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    [v8 objectForKeyedSubscript:*MEMORY[0x189604DF8]];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }

    if (!v11) {
      goto LABEL_11;
    }
    if (![v11 length]) {
      goto LABEL_11;
    }
    v13 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    v14 = -[MIBundle bundleURL](self, "bundleURL");
    [v14 URLByAppendingPathComponent:v11 isDirectory:0];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MIBundle bundleURL](self, "bundleURL");
    [v13 realPathForURL:v15 ifChildOfURL:v16];
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      BOOL v12 = 1;
    }

    else
    {
LABEL_11:
      v18 = -[MIBundle bundleURL](self, "bundleURL");
      [v18 path];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIExecutableBundle _validateWithError:]",  108LL,  @"MIInstallerErrorDomain",  11LL,  0LL,  &unk_189D64790,  @"Bundle at path %@ has missing or invalid CFBundleExecutable in its Info.plist",  v20,  (uint64_t)v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
      {
        id v7 = v21;
        BOOL v12 = 0;
        *a3 = v7;
      }

      else
      {
        BOOL v12 = 0;
        id v7 = v21;
      }
    }
  }

  else if (a3)
  {
    id v7 = v6;
    BOOL v12 = 0;
    *a3 = v7;
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIExecutableBundle;
  return -[MIBundle initForTesting](&v3, sel_initForTesting);
}

- (MIExecutableBundle)initWithBundleInContainer:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 containerURL];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MIExecutableBundle;
  id v11 = -[MIBundle initWithBundleInDirectory:withExtension:error:]( &v13,  sel_initWithBundleInDirectory_withExtension_error_,  v10,  v9,  a5);

  if (v11) {
    objc_storeWeak((id *)&v11->_bundleContainer, v8);
  }

  return v11;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MIExecutableBundle;
  objc_msgSendSuper2(&v7, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)allowsAppleAppExtensionsNotInExtensionCache
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIExecutableBundle;
  return -[MIBundle allowsAppleAppExtensionsNotInExtensionCache](&v3, sel_allowsAppleAppExtensionsNotInExtensionCache);
}

- (NSString)executableName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v3 = v2;
  if (v2)
  {
    [v2 objectForKeyedSubscript:*MEMORY[0x189604DF8]];
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return (NSString *)v6;
}

- (NSURL)executableURL
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:v4 isDirectory:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSURL)relativeExecutablePath
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByAppendingPathComponent:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (__CFBundle)cfBundle
{
  result = self->_cfBundle;
  if (!result)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cfBundle = (__CFBundle *)_CFBundleCreateUnique();

    return self->_cfBundle;
  }

  return result;
}

- (id)executableImageSlicesWithError:(id *)a3
{
  if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle executableImageSlicesWithError:]",  198LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"This bundle is a placeholder and so does not have an executable, so executable image slices are not available.",  v5,  v17);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = 0LL;
    goto LABEL_3;
  }

  p_executableImageSlices = &self->_executableImageSlices;
  executableImageSlices = self->_executableImageSlices;
  if (executableImageSlices) {
    return executableImageSlices;
  }
  id v12 = -[MIExecutableBundle executableURL](self, "executableURL");
  objc_super v13 = (const char *)[v12 fileSystemRepresentation];

  id v18 = 0LL;
  MIMachOFileImageSlices(v13, &v18);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v18;
  if (!v7) {
    goto LABEL_3;
  }
  if (![v7 count])
  {
    uint64_t v16 = _CreateAndLogError( (uint64_t)"-[MIExecutableBundle executableImageSlicesWithError:]",  213LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Executable at %s contained no image slices",  v14,  (uint64_t)v13);

    id v6 = (id)v16;
LABEL_3:
    if (a3)
    {
      id v6 = v6;
      id v8 = 0LL;
      *a3 = v6;
    }

    else
    {
      id v8 = 0LL;
    }

    goto LABEL_11;
  }

  objc_storeStrong((id *)p_executableImageSlices, v7);
  id v7 = v7;
  id v8 = v7;
LABEL_11:
  id v15 = v8;

  return v15;
}

- (NSArray)executableImageSlices
{
  return (NSArray *)-[MIExecutableBundle executableImageSlicesWithError:](self, "executableImageSlicesWithError:", 0LL);
}

- (id)executablePlatformsWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)objc_opt_new();
  id v20 = 0LL;
  -[MIExecutableBundle executableImageSlicesWithError:](self, "executableImageSlicesWithError:", &v20);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v20;
  if (!v6)
  {
    uint64_t v14 = 0LL;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "platform", (void)v16));
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 addObject:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v10);
  }

  uint64_t v14 = (void *)[v5 copy];
  if (a3)
  {
LABEL_12:
    if (!v14) {
      *a3 = v7;
    }
  }

- (BOOL)hasExecutableSliceForPlatform:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v18 = 0LL;
  -[MIExecutableBundle executablePlatformsWithError:](self, "executablePlatformsWithError:", &v18);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v18;
  if (v7)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:v5];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v7 containsObject:v9];

    if ((v10 & 1) != 0)
    {
      BOOL v11 = 1;
      goto LABEL_8;
    }

    MIMachOStringForPlatform(v5);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle executableURL](self, "executableURL");
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 path];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = _CreateError( (uint64_t)"-[MIExecutableBundle hasExecutableSliceForPlatform:error:]",  269LL,  @"MIInstallerErrorDomain",  198LL,  0LL,  0LL,  @"Executable at %@ did not contain a slice built for platform %@.",  v15,  (uint64_t)v14);

    id v8 = (id)v16;
  }

  if (a4)
  {
    id v8 = v8;
    BOOL v11 = 0;
    *a4 = v8;
  }

  else
  {
    BOOL v11 = 0;
  }

- (id)_nameListForPlatformSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_super v4 = (void *)objc_opt_new();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        MIMachOStringForPlatform(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "unsignedIntValue", (void)v14));
        char v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v10];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  [v4 allObjects];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", @", ");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)onlyHasExecutableSlicesForPlatform:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  MIMachOStringForPlatform(*(uint64_t *)&a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v25 = 0LL;
  -[MIExecutableBundle executablePlatformsWithError:](self, "executablePlatformsWithError:", &v25);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v25;
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v10 = [v8 count];
  [MEMORY[0x189607968] numberWithUnsignedInt:v5];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v8 containsObject:v11];

  if (v10 == 1)
  {
    if ((v12 & 1) != 0)
    {
      BOOL v13 = 1;
      goto LABEL_14;
    }

    [v8 allObjects];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 firstObject];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

    MIMachOStringForPlatform([v14 unsignedIntValue]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle executableURL](self, "executableURL");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 path];
    _CreateError( (uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]",  325LL,  @"MIInstallerErrorDomain",  198LL,  0LL,  0LL,  @"Executable at %@ did not contain a slice built for platform %@ (found only platform %@).",  v21,  v18);
  }

  else
  {
    if (!v12)
    {
      -[MIExecutableBundle _nameListForPlatformSet:](self, "_nameListForPlatformSet:", v8);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIExecutableBundle executableURL](self, "executableURL");
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 path];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = _CreateError( (uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]",  318LL,  @"MIInstallerErrorDomain",  198LL,  0LL,  0LL,  @"Expected to find one or more platform slices for %@ in executable at %@ but only found other platforms: %@",  v23,  (uint64_t)v7);
      goto LABEL_10;
    }

    __int128 v14 = (void *)[v8 mutableCopy];
    [MEMORY[0x189607968] numberWithUnsignedInt:v5];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 removeObject:v15];

    -[MIExecutableBundle _nameListForPlatformSet:](self, "_nameListForPlatformSet:", v14);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle executableURL](self, "executableURL");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 path];
    _CreateError( (uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]",  313LL,  @"MIInstallerErrorDomain",  198LL,  0LL,  0LL,  @"Expected to find only one or more platform slices for %@ in executable at %@ but also found other platforms: %@",  v19,  (uint64_t)v7);
  }
  uint64_t v22 = ;

  id v9 = (id)v18;
LABEL_10:

  id v9 = (id)v22;
LABEL_11:
  if (a4)
  {
    id v9 = v9;
    BOOL v13 = 0;
    *a4 = v9;
  }

  else
  {
    BOOL v13 = 0;
  }

- (BOOL)hasExecutableSliceForCPUType:(int)a3 subtype:(int)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v30 = 0LL;
  -[MIExecutableBundle executableImageSlicesWithError:](self, "executableImageSlicesWithError:", &v30);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v30;
  BOOL v11 = v10;
  if (!v9)
  {
    BOOL v21 = 0;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }

  id v24 = v10;
  id v25 = a5;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        __int128 v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v18 = [v17 cpuSubtype];
        if ([v17 cpuType] == (_DWORD)v7 && (v18 & 0xFFFFFF) == a4)
        {
          BOOL v21 = 1;
          BOOL v11 = v24;
          goto LABEL_15;
        }
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  -[MIBundle bundleURL](self, "bundleURL");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v12 path];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError( (uint64_t)"-[MIExecutableBundle hasExecutableSliceForCPUType:subtype:error:]",  356LL,  @"MIInstallerErrorDomain",  198LL,  0LL,  0LL,  @"Did not find at least one executable slice with CPU type %d and subtype %d in bundle %@",  v20,  v7);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v21 = 0;
LABEL_15:

  a5 = v25;
  if (v25)
  {
LABEL_18:
    if (!v21) {
      *a5 = v11;
    }
  }

- (id)lsInstallTypeWithError:(id *)a3
{
  if (self->_lsInstallType)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:");
    return (id)objc_claimAutoreleasedReturnValue();
  }

  -[MIExecutableBundle bundleContainer](self, "bundleContainer");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v6;
  if (!v6)
  {
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]",  430LL,  @"MIInstallerErrorDomain",  158LL,  0LL,  0LL,  @"Could not get install type because no bundle container relation is set on %@",  v7,  (uint64_t)self);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = 0LL;
    goto LABEL_11;
  }

  id v19 = 0LL;
  [v6 bundleMetadataWithError:&v19];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v19;
  if (!v9)
  {
    uint64_t v16 = _CreateAndLogError( (uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]",  436LL,  @"MIInstallerErrorDomain",  158LL,  v11,  0LL,  @"Could not get install type because bundle metadata could not be read from %@",  v10,  (uint64_t)v8);
LABEL_10:
    uint64_t v15 = (void *)v16;

LABEL_11:
    +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 installTypeFromExtendedAttributeOnBundle:v18 error:a3];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14) {
      self->_lsInstallType = [v14 unsignedIntegerValue];
    }
    goto LABEL_13;
  }

  unint64_t v12 = [v9 installType];
  if (!v12)
  {
    uint64_t v16 = _CreateError( (uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]",  442LL,  @"MIInstallerErrorDomain",  158LL,  0LL,  0LL,  @"Install type not set in bundle metadata for %@",  v13,  (uint64_t)v8);
    goto LABEL_10;
  }

  self->_lsInstallType = v12;
  [MEMORY[0x189607968] numberWithUnsignedInteger:v12];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v14;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIExecutableBundle;
  -[MIBundle setBundleParentDirectoryURL:](&v3, sel_setBundleParentDirectoryURL_, a3);
}

- (id)installationIdentitySettingIfNotSet:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  -[MIExecutableBundle installationIdentity](self, "installationIdentity");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MIExecutableBundle installationIdentity](self, "installationIdentity");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    +[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:]( &OBJC_CLASS___MIInstallationIdentity,  "installationIdentityForBundle:settingIfNotSet:error:",  self,  v5,  a4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle setInstallationIdentity:](self, "setInstallationIdentity:", v8);
  }

  return v8;
}

- (BOOL)transferInstallationIdentityFromBundle:(id)a3 error:(id *)a4
{
  id v14 = 0LL;
  +[MIInstallationIdentity identityForUpdateOfBundle:error:]( &OBJC_CLASS___MIInstallationIdentity,  "identityForUpdateOfBundle:error:",  a3,  &v14);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v14;
  uint64_t v8 = v7;
  if (v6)
  {
    id v13 = v7;
    char v9 = [v6 writeToBundle:self error:&v13];
    id v10 = v13;

    if ((v9 & 1) != 0)
    {
      -[MIExecutableBundle setInstallationIdentity:](self, "setInstallationIdentity:", v6);
      BOOL v11 = 1;
      goto LABEL_8;
    }
  }

  else
  {
    id v10 = v7;
  }

  if (a4) {
    *a4 = v10;
  }
  -[MIExecutableBundle setInstallationIdentity:](self, "setInstallationIdentity:", 0LL);
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)makeAndSetNewInstallationIdentityWithError:(id *)a3
{
  id v5 = +[MIInstallationIdentity newIdentityForBundle:]( &OBJC_CLASS___MIInstallationIdentity,  "newIdentityForBundle:",  self);
  int v6 = [v5 writeToBundle:self error:a3];
  if (v6) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }
  -[MIExecutableBundle setInstallationIdentity:](self, "setInstallationIdentity:", v7);

  return v6;
}

- (unsigned)maxLinkedSDKVersion
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = -[MIExecutableBundle executableImageSlices](self, "executableImageSlices", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unsigned int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) sdkVersion];
        if (v5 <= v8) {
          unsigned int v5 = v8;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (unint64_t)estimatedMemoryUsageToValidate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"_CodeSignature/CodeResources" isDirectory:0];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v9, 0, sizeof(v9));
  id v4 = v3;
  if (lstat((const char *)[v4 fileSystemRepresentation], &v9))
  {
    int v5 = *__error();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v4 path];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v5);
      MOLogWrite();
    }

    unint64_t v7 = 0LL;
  }

  else
  {
    unint64_t v7 = (unint64_t)((double)v9.st_size * 3.9);
  }

  return v7;
}

- (unint64_t)compatibilityState
{
  if (-[MIBundle isPlaceholder](self, "isPlaceholder")
    || -[MIBundle bundleType](self, "bundleType") == 7
    || -[MIBundle bundleType](self, "bundleType") == 9)
  {
    id v3 = 0LL;
LABEL_5:
    unint64_t v4 = 0LL;
    goto LABEL_6;
  }

  id v6 = -[MIExecutableBundle executableURL](self, "executableURL");
  id v11 = 0LL;
  char v7 = MIMachOFileMatchesMyArchitecture((const char *)[v6 fileSystemRepresentation], &v11);
  id v3 = v11;

  if ((v7 & 1) != 0) {
    goto LABEL_5;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    -[MIBundle identifier](self, "identifier");
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    stat v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 path];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  id v3 = 0LL;
  unint64_t v4 = 2LL;
LABEL_6:

  return v4;
}

+ (BOOL)isGrandfatheredNonContainerizedForSigningInfo:(id)a3
{
  uint64_t v3 = isGrandfatheredNonContainerizedForSigningInfo__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isGrandfatheredNonContainerizedForSigningInfo__onceToken, &__block_literal_global_6);
  }
  int v5 = (void *)isGrandfatheredNonContainerizedForSigningInfo__grandfatheredSigningIDs;
  [v4 codeInfoIdentifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __68__MIExecutableBundle_isGrandfatheredNonContainerizedForSigningInfo___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604010] setWithArray:&unk_189D64D98];
  v1 = (void *)isGrandfatheredNonContainerizedForSigningInfo__grandfatheredSigningIDs;
  isGrandfatheredNonContainerizedForSigningInfo__grandfatheredSigningIDs = v0;
}

- (BOOL)_hasNonContainerizingEntitlement:(id)a3 checkSeatbeltProfiles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 entitlements];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = MIHasNoContainerEntitlement(v7);

  if (v8)
  {
    if (![(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v6]
      || !gLogHandle
      || *(int *)(gLogHandle + 44) < 7)
    {
      goto LABEL_17;
    }

    goto LABEL_16;
  }

  [v6 entitlements];
  stat v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = MIHasNoSandboxEntitlement(v9);

  if (v10)
  {
    if (![(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v6]
      || !gLogHandle
      || *(int *)(gLogHandle + 44) < 7)
    {
      goto LABEL_17;
    }

    goto LABEL_16;
  }

  if (!v4
    || ([v6 entitlements],
        id v11 = (void *)objc_claimAutoreleasedReturnValue(),
        BOOL v12 = MIHasSeatbeltProfilesEntitlement(v11),
        v11,
        !v12))
  {
    BOOL v14 = 0;
    goto LABEL_18;
  }

  if ([(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v6]
    && gLogHandle
    && *(int *)(gLogHandle + 44) >= 7)
  {
LABEL_16:
    -[MIBundle identifier](self, "identifier");
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

- (BOOL)needsDataContainer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = 0;
  switch(-[MIBundle bundleType](self, "bundleType"))
  {
    case 1u:
      if (!v3)
      {
LABEL_19:
        char v4 = 1;
        goto LABEL_22;
      }

      [v3 entitlements];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = MIHasContainerRequiredEntitlement(v6);

      if (v7)
      {
        if ([(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v3]
          && gLogHandle
          && *(int *)(gLogHandle + 44) >= 7)
        {
LABEL_18:
          -[MIBundle identifier](self, "identifier");
          stat v9 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

          goto LABEL_19;
        }

        goto LABEL_19;
      }

      if (-[MIExecutableBundle _hasNonContainerizingEntitlement:checkSeatbeltProfiles:]( self,  "_hasNonContainerizingEntitlement:checkSeatbeltProfiles:",  v3,  1LL))
      {
LABEL_21:
        char v4 = 0;
      }

      else
      {
        char v8 = [(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v3];
LABEL_12:
        char v4 = v8 ^ 1;
      }

- (int)dataProtectionClass
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v2 = -[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]( self,  "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApp licable:skippingProfileIDValidation:error:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
  [v2 entitlements];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  MICopyDataProtectionIfAvailableEntitlement(v3);
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    goto LABEL_23;
  }
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
    objc_opt_class();
    id v8 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }

    if (v9)
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            int v15 = _ProtectionClassForString(*(void **)(*((void *)&v19 + 1) + 8 * i));
            if (v15)
            {
              int v7 = v15;
              goto LABEL_22;
            }
          }

          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      int v7 = 0;
LABEL_22:

      if (v7) {
        goto LABEL_30;
      }
    }

- (BOOL)updateMCMWithCodeSigningInfoAsAdvanceCopy:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  if (-[MIExecutableBundle codeSignatureVerificationState](self, "codeSignatureVerificationState") - 1 >= 2)
  {
    goto LABEL_17;
  }

  if (-[MIBundle bundleType](self, "bundleType") - 1 > 5)
  {
LABEL_17:
    id v16 = 0LL;
    BOOL v17 = 1;
    goto LABEL_18;
  }

  int v7 = (void *)objc_opt_new();
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[MIExecutableBundle dataContainerContentClass](self, "dataContainerContentClass"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v8 forKeyedSubscript:@"com.apple.MobileContainerManager.DataContainerClass"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIBundle parentBundleID](self, "parentBundleID");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v9 forKeyedSubscript:@"com.apple.MobileContainerManager.ParentBundleID"];
  }

  if (-[MIBundle isPlaceholder](self, "isPlaceholder")) {
    [v7 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"com.apple.MobileContainerManager.PlaceholderEntitlements"];
  }
  if (v5) {
    [v7 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"com.apple.MobileContainerManager.AdvanceCopy"];
  }
  -[MIExecutableBundle codeSigningInfo](self, "codeSigningInfo");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 dictionaryRepresentation];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    -[MIBundle identifier](self, "identifier");
    uint64_t v23 = v11;
    uint64_t v24 = v7;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  id v12 = -[MIBundle identifier](self, "identifier", v22, v23, v24);
  [v12 UTF8String];
  uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v15 = container_set_code_signing_info_for_identifier();

  if (v15 == 1)
  {

    goto LABEL_17;
  }

  [MEMORY[0x189607870] errorWithDomain:@"MIContainerManagerErrorDomain" code:v15 userInfo:0];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle isPlaceholder](self, "isPlaceholder");
  _CreateAndLogError( (uint64_t)"-[MIExecutableBundle updateMCMWithCodeSigningInfoAsAdvanceCopy:withError:]",  955LL,  @"MIInstallerErrorDomain",  110LL,  v19,  0LL,  @"Failed to set code signing info with MCM for %@, isPlaceholder: %c",  v21,  (uint64_t)v20);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v17 = 0;
  if (a4 && v16)
  {
    id v16 = v16;
    BOOL v17 = 0;
    *a4 = v16;
  }

- (id)_codeSigningInfoFromMCM
{
  id v3 = -[MIBundle identifier](self, "identifier");
  [v3 UTF8String];
  char v4 = (void *)container_copy_code_signing_info_for_identifier();

  if (!v4)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    id v6 = 0LL;
    goto LABEL_16;
  }

  BOOL v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  id v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0LL;
  }

  if (!v7)
  {
LABEL_16:
    id v9 = 0LL;
    goto LABEL_17;
  }

  id v9 = -[MICodeSigningInfo initWithDictionaryRepresentation:fromSource:]( objc_alloc(&OBJC_CLASS___MICodeSigningInfo),  "initWithDictionaryRepresentation:fromSource:",  v6,  3LL);
LABEL_17:
  id v10 = v9;

  return v10;
}

- (id)codeSigningInfoByValidatingResources:(BOOL)a3 performingOnlineAuthorization:(BOOL)a4 ignoringCachedSigningInfo:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 skippingProfileIDValidation:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  BOOL v13 = a3;
  unint64_t v15 = -[MIExecutableBundle codeSignatureVerificationState](self, "codeSignatureVerificationState");
  if (a5 || v15 - 3 < 0xFFFFFFFFFFFFFFFELL)
  {
    if (v15 == 6 || v15 == 3)
    {
      if (a8)
      {
        -[MIExecutableBundle codeSigningInfoError](self, "codeSigningInfoError");
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        return 0LL;
      }

      return 0LL;
    }

    if (!a5 && -[MIBundle bundleType](self, "bundleType") == 4)
    {
      uint64_t v18 = -[MIExecutableBundle _codeSigningInfoFromMCM](self, "_codeSigningInfoFromMCM");
      if (v18)
      {
        __int128 v19 = (void *)v18;
        -[MIExecutableBundle setCodeSigningInfo:](self, "setCodeSigningInfo:", v18);
        self->_codeSignatureVerificationState = 5LL;
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          v68 = -[MIBundle identifier](self, "identifier");
          MOLogWrite();
        }

        return v19;
      }
    }

    BOOL v20 = -[MIBundle isStaticContent](self, "isStaticContent");
    if (v20 && -[MIBundle bundleType](self, "bundleType") == 7)
    {
      +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIExecutableBundle executableURL](self, "executableURL");
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = [v21 itemDoesNotExistAtURL:v22];

      if (v23)
      {
        self->_codeSignatureVerificationState = 4LL;
        _CreateError( (uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCache dSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]",  1042LL,  @"MIInstallerErrorDomain",  71LL,  0LL,  0LL,  @"Built in framework is expectedly missing its bundle executable.",  v24,  (uint64_t)v67);
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v26 = v25;
        if (a8) {
          *a8 = v25;
        }

        return 0LL;
      }
    }

    if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
    {
      self->_codeSignatureVerificationState = 1LL;
      __int128 v27 = objc_alloc(&OBJC_CLASS___MICodeSigningInfo);
      -[MIBundle identifier](self, "identifier");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle bundleURL](self, "bundleURL");
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
      MICopyPlaceholderEntitlements(v28);
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
      id v30 = -[MICodeSigningInfo initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:]( v27,  "initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements: signerType:profileType:signingInfoSource:launchWarningData:",  @"Unsigned Placeholder",  @"Unsigned Placeholder",  v16,  @"Unsigned Placeholder",  &unk_189D64E40,  v29,  6LL,  1LL,  1LL,  0LL);
      -[MIExecutableBundle setCodeSigningInfo:](self, "setCodeSigningInfo:", v30);

      goto LABEL_25;
    }
    v31 = +[MICodeSigningVerifier codeSigningVerifierForBundle:]( &OBJC_CLASS___MICodeSigningVerifier,  "codeSigningVerifierForBundle:",  self);
    uint64_t v32 = v31;
    if (!v31)
    {
      v37 = -[MIBundle bundleURL](self, "bundleURL");
      _CreateAndLogError( (uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedS igningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]",  1065LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to create verifier for executable %@",  v38,  (uint64_t)v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (a8) {
        *a8 = v39;
      }

      __int128 v19 = 0LL;
      goto LABEL_78;
    }

    if (v13)
    {
      [v31 setValidateResources:1];
      if (!v12)
      {
LABEL_31:
        if (!v9) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }

    else if (!v12)
    {
      goto LABEL_31;
    }

    [v32 setPerformOnlineAuthorization:1];
    if (!v9)
    {
LABEL_33:
      v33 = -[MIBundle parentBundle](self, "parentBundle");
      v34 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
      int v35 = [v34 codeSigningEnforcementIsDisabled];

      if (v35)
      {
        [v32 setAllowAdhocSigning:1];
        [v32 setVerifyTrustCachePresence:0];
        [v32 setValidateUsingDetachedSignature:0];
        if (-[MIBundle isRemovableSystemApp](self, "isRemovableSystemApp")
          || [v33 isRemovableSystemApp])
        {
          [v32 setValidateResources:0];
        }

        if (!v20 && !-[MIBundle isRemovableSystemApp](self, "isRemovableSystemApp"))
        {
          int v36 = [v33 isRemovableSystemApp] ^ 1;
          if (a6) {
            goto LABEL_60;
          }
          goto LABEL_59;
        }

        goto LABEL_58;
      }

      if (-[MIBundle isRemovableSystemApp](self, "isRemovableSystemApp"))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          v67 = -[MIBundle identifier](self, "identifier");
          MOLogWrite();
        }

        objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
        v40 = v32;
        uint64_t v41 = 1LL;
      }

      else
      {
        if (![v33 isRemovableSystemApp])
        {
          if (v20)
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              v67 = -[MIBundle identifier](self, "identifier");
              MOLogWrite();
            }

            objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
            [v32 setVerifyTrustCachePresence:1];
            [v32 setValidateResources:0];
          }

          else
          {
            if (!MGGetBoolAnswer())
            {
              char v74 = 0;
              v63 = +[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance");
              id v73 = 0LL;
              char v64 = [v63 isRunningInTestMode:&v74 outError:&v73];
              id v65 = v73;

              if ((v64 & 1) == 0)
              {
                if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                {
                  v67 = v65;
                  MOLogWrite();
                }

                char v74 = 0;

                id v65 = 0LL;
              }

              int v36 = v74 != 0;
              if (v74)
              {
                if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
                {
                  v66 = -[MIBundle bundleURL](self, "bundleURL", v67);
                  [v66 path];
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  MOLogWrite();
                }

                objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
              }

              if (a6)
              {
LABEL_60:
                id v72 = 0LL;
                char v42 = objc_msgSend(v32, "performValidationWithError:", &v72, v67);
                id v43 = v72;
                if ((v42 & 1) != 0)
                {
                  [v32 signingInfo];
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  [v44 codeInfoIdentifier];
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = -[MIBundle identifier](self, "identifier");
                  char v47 = [v45 isEqualToString:v46];

                  if ((v47 & 1) != 0)
                  {
                    self->_codeSignatureVerificationState = 2LL;
                    [v32 signingInfo];
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MIExecutableBundle setCodeSigningInfo:](self, "setCodeSigningInfo:", v48);

                    if (v36)
                    {
                      v49 = -[MIExecutableBundle codeSigningInfo](self, "codeSigningInfo");
                      uint64_t v50 = [v49 codeSignerType];

                      if (v50 == 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
                      {
                        v51 = -[MIBundle bundleURL](self, "bundleURL");
                        [v51 path];
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        MOLogWrite();
                      }
                    }

                    -[MIExecutableBundle codeSigningInfo](self, "codeSigningInfo", v69);
                    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_77;
                  }

                  v71 = v33;
                  self->_codeSignatureVerificationState = 6LL;
                  [v32 signingInfo];
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  [v52 codeInfoIdentifier];
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = -[MIBundle identifier](self, "identifier");
                  v55 = -[MIBundle bundleURL](self, "bundleURL");
                  [v55 path];
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  _CreateAndLogError( (uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ign oringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]",  1166LL,  @"MIInstallerErrorDomain",  77LL,  0LL,  &unk_189D647B8,  @"Code signing identifier (%@) does not match bundle identifier (%@) for %@",  v56,  (uint64_t)v53);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MIExecutableBundle setCodeSigningInfoError:](self, "setCodeSigningInfoError:", v57);

                  if (a8)
                  {
                    -[MIExecutableBundle codeSigningInfoError](self, "codeSigningInfoError");
                    *a8 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  id v58 = -[MIExecutableBundle executableURL](self, "executableURL");
                  int v59 = lchmod((const char *)[v58 fileSystemRepresentation], 0x1A4u);

                  v33 = v71;
                  if (v59 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
                  {
                    id v60 = -[MIExecutableBundle executableURL](self, "executableURL");
                    [v60 fileSystemRepresentation];
                    v61 = __error();
                    strerror(*v61);
                    MOLogWrite();
                  }
                }

                else
                {
                  self->_codeSignatureVerificationState = 3LL;
                  -[MIExecutableBundle setCodeSigningInfoError:](self, "setCodeSigningInfoError:", v43);
                  if (a8)
                  {
                    __int128 v19 = 0LL;
                    *a8 = v43;
LABEL_77:

LABEL_78:
                    return v19;
                  }
                }

                __int128 v19 = 0LL;
                goto LABEL_77;
              }

- (int)_installEmbeddedProvisioningProfileAtURL:(id)a3 withProgress:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, const __CFString *, void))a4;
  id v7 = v5;
  if (lstat((const char *)[v7 fileSystemRepresentation], &v11))
  {
    int v8 = *__error();
    if (v8 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      [v7 fileSystemRepresentation];
      strerror(v8);
      MOLogWrite();
    }

    int v9 = 0;
  }

  else
  {
    if (v6) {
      v6[2](v6, @"InstallingEmbeddedProfile", 0LL);
    }
    int v9 = MIInstallProfileAtURL(v7);
  }

  return v9;
}

- (int)installEmbeddedProvisioningProfileWithProgress:(id)a3
{
  id v4 = a3;
  -[MIBundle bundleURL](self, "bundleURL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 URLByAppendingPathComponent:@"embedded.mobileprovision" isDirectory:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = -[MIExecutableBundle _installEmbeddedProvisioningProfileAtURL:withProgress:]( self,  "_installEmbeddedProvisioningProfileAtURL:withProgress:",  v6,  v4);
  return (int)self;
}

- (BOOL)_hasNoConflictWithSystemAppsForSigningInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MIBundle bundleTypeDescription](self, "bundleTypeDescription");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIBundle bundleType](self, "bundleType") == 1)
  {
    [v6 entitlements];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = MIHasSystemApplicationEntitlement(v8);

    if (v9)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        -[MIBundle identifier](self, "identifier");
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
      }

      +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance", v26);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 systemAppPlaceholderXPCServiceBundleIDs];
      stat v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (_hasNoConflictWithSystemAppBundleIDs(v11, v12, @"System App XPC Service", v7, a4))
      {
        +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 systemAppPlaceholderAppExtensionBundleIDs];
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIBundle identifier](self, "identifier");
        unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        char hasNoConflictWithSystemAppBundleIDs = _hasNoConflictWithSystemAppBundleIDs( v14,  v15,  @"System App Extension",  v7,  a4);

        goto LABEL_19;
      }

      char hasNoConflictWithSystemAppBundleIDs = 0;
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
  }

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 systemAppPlaceholderBundleIDs];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v20 = _hasNoConflictWithSystemAppBundleIDs(v18, v19, @"System App", v7, a4);

  if (v20)
  {
    -[MIBundle parentBundle](self, "parentBundle");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v10 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheI fApplicable:0 skippingProfileIDValidation:0 error:0];
      stat v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 entitlements];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = MIHasSystemApplicationEntitlement(v21);

      if (v22)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
        {
          char hasNoConflictWithSystemAppBundleIDs = 1;
          goto LABEL_23;
        }

        -[MIBundle identifier](self, "identifier");
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
        char hasNoConflictWithSystemAppBundleIDs = 1;
        goto LABEL_22;
      }
    }

    +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    stat v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 systemAppPlaceholderXPCServiceBundleIDs];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_hasNoConflictWithSystemAppBundleIDs(v12, v13, @"System App XPC Service", v7, a4))
    {
      char hasNoConflictWithSystemAppBundleIDs = 0;
      goto LABEL_21;
    }

    +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 systemAppPlaceholderAppExtensionBundleIDs];
    int v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    char hasNoConflictWithSystemAppBundleIDs = _hasNoConflictWithSystemAppBundleIDs( v23,  v24,  @"System App Extension",  v7,  a4);

LABEL_19:
LABEL_21:

    goto LABEL_22;
  }

  char hasNoConflictWithSystemAppBundleIDs = 0;
LABEL_24:

  return hasNoConflictWithSystemAppBundleIDs;
}

- (BOOL)hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  -[MIBundle bundleTypeDescription](self, "bundleTypeDescription");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = -[MIBundle bundleType](self, "bundleType");
  if ((v11 - 1) < 4)
  {
    -[MIBundle identifier](self, "identifier");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v34 = 0LL;
    int v15 = _checkIdentifierForConflict(v14, (uint64_t)v9, 4LL, @"App Extension", v10, &v34);
    id v16 = v34;

    if (!v15)
    {
      id v13 = v16;
      if (a5)
      {
LABEL_18:
        id v13 = v13;
        BOOL v18 = 0;
        *a5 = v13;
        goto LABEL_21;
      }

- (unint64_t)dataContainerContentClass
{
  unsigned int v2 = -[MIBundle bundleType](self, "bundleType");
  if (v2 > 0xA) {
    return 0LL;
  }
  else {
    return qword_183DC1458[(char)v2];
  }
}

- (Class)dataContainerClass
{
  return (Class)objc_opt_class();
}

- (id)dataContainerForPersona:(id)a3 error:(id *)a4
{
  return -[MIExecutableBundle _dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:]( self,  "_dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:",  0LL,  a3,  0LL,  0LL,  0LL,  a4);
}

- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  return -[MIExecutableBundle _dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:]( self,  "_dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:",  a3,  a4,  a5,  1LL,  a6,  a7);
}

- (id)_dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 checkIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a3;
  id v14 = a4;
  if (v10 && !-[MIExecutableBundle needsDataContainer](self, "needsDataContainer"))
  {
    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle _dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:]",  1534LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Asked for data container for %@ but none is needed.",  v24,  (uint64_t)v23);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    int v15 = 0LL;
    if (a8) {
      goto LABEL_29;
    }
LABEL_23:
    id v20 = 0LL;
    goto LABEL_30;
  }

  id v34 = 0LL;
  -[objc_class dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:]( -[MIExecutableBundle dataContainerClass](self, "dataContainerClass"),  "dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:",  self,  v14,  v12,  0LL,  a7,  &v34);
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v34;
  BOOL v17 = v16;
  if (!v15)
  {
    if (!v12)
    {
      [v16 domain];
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v21 isEqualToString:@"MIContainerManagerErrorDomain"])
      {
        uint64_t v22 = [v17 code];

        if (v22 == 21) {
          goto LABEL_28;
        }
      }

      else
      {
      }
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

- (BOOL)executableExistsWithError:(id *)a3
{
  if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    id v5 = 0LL;
LABEL_4:
    BOOL v9 = 1;
    goto LABEL_5;
  }

  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableURL](self, "executableURL");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  char v8 = [v6 itemExistsAtURL:v7 error:&v15];
  id v5 = v15;

  if ((v8 & 1) != 0) {
    goto LABEL_4;
  }
  -[MIBundle relativePath](self, "relativePath");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle relativeExecutablePath](self, "relativeExecutablePath");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError( (uint64_t)"-[MIExecutableBundle executableExistsWithError:]",  1580LL,  @"MIInstallerErrorDomain",  71LL,  v5,  0LL,  @"%@ is missing its bundle executable. Please check your build settings to make sure that a bundle executable is produced at the path %@.",  v12,  (uint64_t)v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    id v5 = v13;
    BOOL v9 = 0;
    *a3 = v5;
  }

  else
  {
    BOOL v9 = 0;
    id v5 = v13;
  }

- (BOOL)makeExecutableWithError:(id *)a3
{
  if (-[MIBundle isLaunchProhibited](self, "isLaunchProhibited")
    || -[MIBundle isPlaceholder](self, "isPlaceholder")
    || (-[MIExecutableBundle executableURL](self, "executableURL"),
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = lchmod((const char *)[v5 fileSystemRepresentation], 0x1EDu),
        v5,
        !v6))
  {
    id v12 = 0LL;
    BOOL v13 = 1;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle executableURL](self, "executableURL");
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 path];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = __error();
    strerror(*v10);
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle makeExecutableWithError:]",  1618LL,  @"MIInstallerErrorDomain",  4LL,  v7,  &unk_189D647E0,  @"Failed to chmod %@ : %s",  v11,  (uint64_t)v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v12 = v12;
      BOOL v13 = 0;
      *a3 = v12;
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)setLaunchWarningData:(id)a3 withError:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = 0LL;
  -[MIBundle thisBundleAndAllContainedBundlesWithError:](self, "thisBundleAndAllContainedBundlesWithError:", &v31);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v31;
  if (v7)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v23 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v22 = a4;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 mayHaveExecutableProgram])
          {
            [v14 executableURL];
            id v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6)
            {
              id v26 = v8;
              char v16 = [v24 setData:v6 forExtendedAttributeNamed:@"com.apple.mis.warning" onURL:v15 error:&v26];
              id v17 = v26;

              if ((v16 & 1) == 0) {
                goto LABEL_18;
              }
            }

            else
            {
              id v25 = v8;
              int v18 = [v24 removeExtendedAttributeNamed:@"com.apple.mis.warning" fromURL:v15 error:&v25];
              id v17 = v25;

              if (!v18)
              {
LABEL_18:
                id v8 = v15;
                a4 = v22;
                id v7 = v23;
                goto LABEL_19;
              }
            }

            id v8 = v17;
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    BOOL v19 = 1;
    id v17 = v8;
    id v7 = v23;
  }

  else
  {
    -[MIBundle identifier](self, "identifier");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle setLaunchWarningData:withError:]",  1640LL,  @"MIInstallerErrorDomain",  4LL,  v8,  0LL,  @"Failed to get all bundles within app %@",  v20,  (uint64_t)v9);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    if (a4)
    {
      id v17 = v17;
      BOOL v19 = 0;
      *a4 = v17;
    }

    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (id)bundleSignatureVersionWithError:(id *)a3
{
  unsigned int v13 = 0;
  -[MIExecutableBundle executableURL](self, "executableURL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  MIFetchSignatureVersionForExecutableURL(v5, &v13);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[MIExecutableBundle executableURL](self, "executableURL");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    MIErrorStringForMISError(v13);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle bundleSignatureVersionWithError:]",  1715LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to fetch signature version for executable at %@ with libMIS error %@",  v9,  (uint64_t)v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3) {
      *a3 = v10;
    }
  }

  return v6;
}

- (id)enumerateDylibsWithBlock:(id)a3
{
  id v4 = a3;
  -[MIBundle bundleURL](self, "bundleURL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 URLByAppendingPathComponent:@"Frameworks" isDirectory:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __47__MIExecutableBundle_enumerateDylibsWithBlock___block_invoke;
  v16[3] = &unk_189D49070;
  id v17 = v4;
  id v8 = v4;
  [v7 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v16];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v9 domain];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v10 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v11 = [v9 code];

      if (v11 == 2)
      {
        uint64_t v12 = 0LL;
LABEL_8:

        goto LABEL_9;
      }
    }

    else
    {
    }

    uint64_t v13 = [v6 path];
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle enumerateDylibsWithBlock:]",  1746LL,  @"MIInstallerErrorDomain",  54LL,  v9,  0LL,  @"Failed to discover dylibs in directory %@",  v14,  v13);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = (void *)v13;
    goto LABEL_8;
  }

  uint64_t v12 = 0LL;
LABEL_9:

  return v12;
}

uint64_t __47__MIExecutableBundle_enumerateDylibsWithBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 8
    && ([v5 pathExtension],
        id v7 = (void *)objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"dylib"],
        v7,
        v8))
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v9 = 1LL;
  }

  return v9;
}

- (NSURL)rootSinfURL
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"SC_Info" isDirectory:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)NSString;
  -[MIExecutableBundle executableName](self, "executableName");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"%@.sinf", v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 URLByAppendingPathComponent:v7 isDirectory:0];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (NSURL)rootSuppURL
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"SC_Info" isDirectory:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)NSString;
  -[MIExecutableBundle executableName](self, "executableName");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"%@.supp", v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 URLByAppendingPathComponent:v7 isDirectory:0];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (NSURL)rootSupfURL
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"SC_Info" isDirectory:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)NSString;
  -[MIExecutableBundle executableName](self, "executableName");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"%@.supf", v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 URLByAppendingPathComponent:v7 isDirectory:0];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (BOOL)updateSinfWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = [v7 uid];

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v10 = [v9 gid];

  -[MIBundle bundleURL](self, "bundleURL");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  char v13 = MIUpdateSinfWithData(v6, v11, v12, v8, v10, &v16);

  id v14 = v16;
  if (a4 && (v13 & 1) == 0) {
    *a4 = v14;
  }

  return v13;
}

- (void)bestEffortRollbackSinfData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = 0LL;
    BOOL v5 = -[MIExecutableBundle updateSinfWithData:error:](self, "updateSinfWithData:error:", v4, &v9);
    id v6 = v9;
    if (!v5 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      -[MIBundle identifier](self, "identifier");
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    -[MIExecutableBundle removeSinf](self, "removeSinf", v7);
    id v6 = 0LL;
  }
}

- (id)updateAndValidateSinf:(id)a3 error:(id *)a4
{
  return -[MIExecutableBundle updateAndValidateSinf:withRollback:error:]( self,  "updateAndValidateSinf:withRollback:error:",  a3,  1LL,  a4);
}

- (id)updateAndValidateSinf:(id)a3 withRollback:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!v6)
  {
    uint64_t v11 = 0LL;
    goto LABEL_12;
  }

  id v9 = (void *)MEMORY[0x189603F48];
  -[MIExecutableBundle rootSinfURL](self, "rootSinfURL");
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = 0LL;
  [v9 dataWithContentsOfURL:v10 options:2 error:&v31];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v31;

  if (!v11)
  {
    [v12 domain];
    char v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 isEqualToString:*MEMORY[0x189607460]])
    {
      uint64_t v14 = [v12 code];

      if (v14 == 260) {
        goto LABEL_11;
      }
    }

    else
    {
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIExecutableBundle rootSinfURL](self, "rootSinfURL");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 path];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      id v27 = v12;
      id v25 = v16;
      MOLogWrite();
    }
  }

- (BOOL)replicateRootSinfWithError:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = [v7 uid];
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = MIReplicateRootSinf(v5, v6, v8, [v9 gid], a3);

  return (char)a3;
}

- (void)removeSinf
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  MIRemoveSinf(v4, v3);
}

- (BOOL)needsSinf
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle rootSuppURL](self, "rootSuppURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 itemExistsAtURL:v4])
  {
    char v5 = 1;
  }

  else
  {
    +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle rootSupfURL](self, "rootSupfURL");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v6 itemExistsAtURL:v7];
  }

  return v5;
}

- (BOOL)hasSinf
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle rootSinfURL](self, "rootSinfURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 itemExistsAtURL:v4];

  return v5;
}

- (id)fairPlaySinfInfoWithError:(id *)a3
{
  int v38 = -1;
  id v37 = 0LL;
  BOOL v5 = -[MIExecutableBundle getSinfDataType:withError:](self, "getSinfDataType:withError:", &v38, &v37);
  id v6 = v37;
  id v7 = v6;
  if (!v5)
  {
    id v9 = 0LL;
    id v11 = v6;
    goto LABEL_5;
  }

  if (v38)
  {
    unsigned int v8 = (void *)objc_opt_new();
    [v8 setIsMissingRequiredSINF:0];
    id v9 = 0LL;
    id v10 = 0LL;
    goto LABEL_29;
  }

  -[MIExecutableBundle rootSinfURL](self, "rootSinfURL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v36 = v7;
  [MEMORY[0x189603F48] dataWithContentsOfURL:v9 options:2 error:&v36];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v36;

  if (!v12)
  {
    [v11 domain];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v16 isEqualToString:*MEMORY[0x189607460]])
    {
      uint64_t v17 = [v11 code];

      if (v17 == 260) {
        goto LABEL_5;
      }
    }

    else
    {
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v9 path];
      id v31 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

- (BOOL)setSinfDataType:(unsigned int)a3 withError:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!-[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    uint64_t v39 = 0LL;
    v40 = (id *)&v39;
    uint64_t v41 = 0x3032000000LL;
    char v42 = __Block_byref_object_copy__7;
    id v43 = __Block_byref_object_dispose__7;
    id v44 = 0LL;
    -[MIExecutableBundle setSinfDataType:](self, "setSinfDataType:", v5);
    -[MIExecutableBundle setSinfDataTypeIsSet:](self, "setSinfDataTypeIsSet:", 1LL);
    if (-[MIBundle isAppTypeBundle](self, "isAppTypeBundle"))
    {
      BOOL v8 = -[MIExecutableBundle needsSinf](self, "needsSinf");
      if ((_DWORD)v5) {
        BOOL v9 = v8;
      }
      else {
        BOOL v9 = 0;
      }
      if (!v9) {
        goto LABEL_8;
      }
    }

    else if (!(_DWORD)v5)
    {
LABEL_8:
      id v10 = 0LL;
      BOOL v7 = 1;
LABEL_31:

      _Block_object_dispose(&v39, 8);
      return v7;
    }

    id v11 = v40 + 5;
    id obj = v40[5];
    -[MIBundle thisBundleAndAllContainedBundlesWithError:](self, "thisBundleAndAllContainedBundlesWithError:", &obj);
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = a4;
    objc_storeStrong(v11, obj);
    if (v29)
    {
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v12 = v29;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
      id v30 = v12;
      if (v13)
      {
        uint64_t v14 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v16 executableURL];
              id v17 = (id)objc_claimAutoreleasedReturnValue();
              int v18 = v40 + 5;
              id v33 = v40[5];
              char v19 = MISetSinfDataType(v17, v5, &v33);
              objc_storeStrong(v18, v33);
              if ((v19 & 1) == 0) {
                goto LABEL_28;
              }
              if ([v16 isAppTypeBundle])
              {
                id v20 = v40[5];
                v40[5] = 0LL;

                v31[0] = MEMORY[0x1895F87A8];
                v31[1] = 3221225472LL;
                v31[2] = __48__MIExecutableBundle_setSinfDataType_withError___block_invoke;
                v31[3] = &unk_189D49098;
                int v32 = v5;
                v31[4] = &v39;
                -[MIExecutableBundle enumerateDylibsWithBlock:](self, "enumerateDylibsWithBlock:", v31);
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
                int v22 = v21;
                if (v40[5]) {
                  goto LABEL_27;
                }
                if (v21)
                {
                  objc_storeStrong(v40 + 5, v21);
LABEL_27:

                  goto LABEL_28;
                }
              }

              id v12 = v30;
            }
          }

          uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      BOOL v7 = 1;
      id v10 = v30;
    }

    else
    {
      id v23 = v40[5];
      uint64_t v24 = -[MIBundle identifier](self, "identifier");
      uint64_t v26 = _CreateAndLogError( (uint64_t)"-[MIExecutableBundle setSinfDataType:withError:]",  1993LL,  @"MIInstallerErrorDomain",  4LL,  v23,  0LL,  @"Failed to get all bundles within app %@",  v25,  v24);
      id v30 = (void *)v24;
      id v17 = v40[5];
      v40[5] = (id)v26;
LABEL_28:

      BOOL v7 = 0;
      if (v28) {
        *id v28 = v40[5];
      }
      id v10 = v29;
    }

    goto LABEL_31;
  }

  return 1;
}

uint64_t __48__MIExecutableBundle_setSinfDataType_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 40);
  id v9 = 0LL;
  uint64_t v5 = MISetSinfDataType(a2, v4, &v9);
  id v6 = v9;
  id v7 = v9;
  if ((v5 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v6);
  }

  return v5;
}

- (BOOL)getSinfDataType:(unsigned int *)a3 withError:(id *)a4
{
  if (-[MIExecutableBundle sinfDataTypeIsSet](self, "sinfDataTypeIsSet"))
  {
    if (*a3) {
      *a3 = -[MIExecutableBundle sinfDataType](self, "sinfDataType");
    }
    return 1;
  }

  else
  {
    -[MIExecutableBundle executableURL](self, "executableURL");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = MIGetSinfDataType(v8, a3, a4);

    return v9;
  }

- (BOOL)validateSinfWithError:(id *)a3
{
  if (!-[MIExecutableBundle hasSinf](self, "hasSinf") || -[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    id v5 = 0LL;
LABEL_4:
    BOOL v6 = 1;
    goto LABEL_5;
  }

  int v21 = -1;
  id v20 = 0LL;
  BOOL v8 = -[MIExecutableBundle getSinfDataType:withError:](self, "getSinfDataType:withError:", &v21, &v20);
  id v5 = v20;
  if (v8)
  {
    if (v21) {
      goto LABEL_4;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      int v18 = self;
      MOLogWrite();
    }

    id v9 = -[MIExecutableBundle executableURL](self, "executableURL", v18);
    [v9 fileSystemRepresentation];
    mm0Euuzhc();
    int v11 = v10;

    switch(v11)
    {
      case -42057:
        -[MIBundle bundleURL](self, "bundleURL");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 path];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MIExecutableBundle validateSinfWithError:]",  2089LL,  @"MIInstallerErrorDomain",  174LL,  0LL,  &unk_189D64830,  @"The SINF provided for the bundle at %@ does not have a matching key in the FairPlay keybag.",  v15,  (uint64_t)v13);
        break;
      case 0:
        goto LABEL_4;
      case -42056:
        -[MIBundle bundleURL](self, "bundleURL");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 path];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MIExecutableBundle validateSinfWithError:]",  2086LL,  @"MIInstallerErrorDomain",  120LL,  0LL,  &unk_189D64808,  @"The SINF provided for the bundle at %@ is not valid so this application will not run.",  v14,  (uint64_t)v13);
        break;
      default:
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          -[MIBundle bundleURL](self, "bundleURL");
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 path];
          char v19 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();
        }

        goto LABEL_4;
    }
    uint64_t v16 = ;

    id v5 = (id)v16;
  }

  if (a3)
  {
    id v5 = v5;
    BOOL v6 = 0;
    *a3 = v5;
  }

  else
  {
    BOOL v6 = 0;
  }

- (void)setExecutableImageSlices:(id)a3
{
}

- (MIBundleContainer)bundleContainer
{
  return (MIBundleContainer *)objc_loadWeakRetained((id *)&self->_bundleContainer);
}

- (void)setBundleContainer:(id)a3
{
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (unint64_t)codeSignatureVerificationState
{
  return self->_codeSignatureVerificationState;
}

- (NSError)wk2AppBundleError
{
  return self->_wk2AppBundleError;
}

- (void)setWk2AppBundleError:(id)a3
{
}

- (MICodeSigningInfo)codeSigningInfo
{
  return self->_codeSigningInfo;
}

- (void)setCodeSigningInfo:(id)a3
{
}

- (NSError)codeSigningInfoError
{
  return self->_codeSigningInfoError;
}

- (void)setCodeSigningInfoError:(id)a3
{
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
}

- (MIPluginKitBundle)watchKitPlugin
{
  return self->_watchKitPlugin;
}

- (void)setWatchKitPlugin:(id)a3
{
}

- (MIInstallationIdentity)installationIdentity
{
  return self->_installationIdentity;
}

- (void)setInstallationIdentity:(id)a3
{
}

- (unint64_t)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(unint64_t)a3
{
  self->_lsInstallType = a3;
}

- (unsigned)sinfDataType
{
  return self->_sinfDataType;
}

- (void)setSinfDataType:(unsigned int)a3
{
  self->_sinfDataType = a3;
}

- (BOOL)sinfDataTypeIsSet
{
  return self->_sinfDataTypeIsSet;
}

- (void)setSinfDataTypeIsSet:(BOOL)a3
{
  self->_sinfDataTypeIsSet = a3;
}

- (void).cxx_destruct
{
}

@end