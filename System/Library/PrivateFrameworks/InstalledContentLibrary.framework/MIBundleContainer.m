@interface MIBundleContainer
+ (BOOL)purgeTransientBundleContainersWithError:(id *)a3;
+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentifier:(id)a4 error:(id *)a5;
+ (id)allAppBundleContainersWithError:(id *)a3;
+ (id)appBundleContainerForIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5;
+ (id)appBundleContainerForIdentifier:(id)a3 temporary:(BOOL)a4 inDomain:(unint64_t)a5 withError:(id *)a6;
+ (id)appBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6;
+ (id)pluginKitPluginBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6;
+ (id)tempAppBundleContainerWithIdentifier:(id)a3 error:(id *)a4;
+ (id)tempAppBundleContainerWithIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5;
+ (id)tempPluginKitPluginBundleContainerWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_configureBundleWithError:(id *)a3;
- (BOOL)_writeRawiTunesMetadataData:(id)a3 error:(id *)a4;
- (BOOL)bestEffortRollbackiTunesMetadata:(id)a3 error:(id *)a4;
- (BOOL)captureBundleByMoving:(id)a3 withError:(id *)a4;
- (BOOL)captureStoreDataFromDirectory:(id)a3 doCopy:(BOOL)a4 failureIsFatal:(BOOL)a5 includeiTunesMetadata:(BOOL)a6 withError:(id *)a7;
- (BOOL)cloneContentFromStashedBundleContainer:(id)a3 error:(id *)a4;
- (BOOL)hasParallelPlaceholder;
- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6;
- (BOOL)saveBundleMetadata:(id)a3 withError:(id *)a4;
- (BOOL)shouldHaveCorrespondingDataContainer;
- (BOOL)stashBundleContainerContents:(id)a3 error:(id *)a4;
- (BOOL)transferExistingStashesFromContainer:(id)a3 error:(id *)a4;
- (BOOL)writeiTunesMetadata:(id)a3 error:(id *)a4;
- (MIBundleContainer)initWithContainer:(id)a3 error:(id *)a4;
- (MIBundleContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MIBundleMetadata)bundleMetadata;
- (MIExecutableBundle)bundle;
- (MIStoreMetadata)iTunesMetadata;
- (NSURL)bundleMetadataURL;
- (NSURL)iTunesMetadataURL;
- (NSURL)parallelPlaceholderURL;
- (NSURL)referenceStorageURL;
- (NSURL)stashBaseURL;
- (id)_bundleExtensionForContainerClassWithError:(id *)a3;
- (id)_stashURLForIndex:(unint64_t)a3;
- (id)_stashedBundleContainerForIndex:(unint64_t)a3 error:(id *)a4;
- (id)bundleMetadataWithError:(id *)a3;
- (id)iTunesMetadataWithError:(id *)a3;
- (id)initForAppContainerWithURL:(id)a3;
- (id)stashedBundleContainerWithError:(id *)a3;
- (unsigned)bundleMaxLinkedSDKVersion;
- (void)setBundleMetadata:(id)a3;
- (void)setITunesMetadata:(id)a3;
@end

@implementation MIBundleContainer

+ (id)appBundleContainerForIdentifier:(id)a3 temporary:(BOOL)a4 inDomain:(unint64_t)a5 withError:(id *)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  if (a5 == 3)
  {
    v14 = @"Installation domain was set to MIInstallationDomainUserPrivate, but private apps aren't supported on this platform";
    uint64_t v15 = 72LL;
    uint64_t v16 = 161LL;
LABEL_7:
    uint64_t v18 = _CreateAndLogError( (uint64_t)"+[MIBundleContainer appBundleContainerForIdentifier:temporary:inDomain:withError:]",  v15,  @"MIInstallerErrorDomain",  v16,  0LL,  0LL,  v14,  v10,  v20);
    uint64_t v12 = 0LL;
    goto LABEL_10;
  }

  if (a5 != 2)
  {
    unint64_t v20 = a5;
    v14 = @"MIInstallationDomain was not set to either MIInstallationDomainSystemShared or MIInstallationDomainUserPrivate: %lu";
    uint64_t v15 = 79LL;
    uint64_t v16 = 4LL;
    goto LABEL_7;
  }

  if (v8)
  {
    v22 = 0LL;
    uint64_t v12 = [a1 tempAppBundleContainerWithIdentifier:v11 error:&v22];
    v13 = v22;
  }

  else
  {
    v21 = 0LL;
    uint64_t v12 = [a1 appBundleContainerWithIdentifier:v11 createIfNeeded:0 created:0 error:&v21];
    v13 = v21;
  }

  uint64_t v18 = v13;
LABEL_10:
  if (!(v12 | v18))
  {
    uint64_t v18 = _CreateAndLogError( (uint64_t)"+[MIBundleContainer appBundleContainerForIdentifier:temporary:inDomain:withError:]",  85LL,  @"MIInstallerErrorDomain",  26LL,  0LL,  0LL,  @"Could not find installed app with identifier %@ in domain %lu",  v17,  (uint64_t)v11);
  }

  if (a6 && !v12) {
    *a6 = (id) v18;
  }

  return (id)v12;
}

+ (id)appBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 primaryPersonaString];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 containerWithIdentifier:v10 forPersona:v12 ofContentClass:1 createIfNeeded:v8 created:a5 error:a6];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)pluginKitPluginBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 primaryPersonaString];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 containerWithIdentifier:v10 forPersona:v12 ofContentClass:3 createIfNeeded:v8 created:a5 error:a6];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)tempAppBundleContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
  [v7 primaryPersonaString];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 tempContainerWithIdentifier:v6 forPersona:v8 ofContentClass:1 error:a4];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)tempAppBundleContainerWithIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5
{
  return (id)[a1 appBundleContainerForIdentifier:a3 temporary:1 inDomain:a4 withError:a5];
}

+ (id)tempPluginKitPluginBundleContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
  [v7 primaryPersonaString];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 tempContainerWithIdentifier:v6 forPersona:v8 ofContentClass:3 error:a4];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)appBundleContainerForIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5
{
  return (id)[a1 appBundleContainerForIdentifier:a3 temporary:0 inDomain:a4 withError:a5];
}

+ (id)allAppBundleContainersWithError:(id *)a3
{
  return (id)[(id)objc_opt_class() containersWithClass:1 error:a3];
}

+ (BOOL)purgeTransientBundleContainersWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  v5 = (void *)objc_opt_new();
  id v6 = (void *)objc_opt_new();
  if (!+[ICLFeatureFlags transientBundleCleanupEnabled](&OBJC_CLASS___ICLFeatureFlags, "transientBundleCleanupEnabled"))
  {
    _CreateAndLogError( (uint64_t)"+[MIBundleContainer purgeTransientBundleContainersWithError:]",  157LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"%s is not enabled",  v7,  (uint64_t)"+[MIBundleContainer purgeTransientBundleContainersWithError:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0LL;
    BOOL v8 = 0LL;
    if (!a3) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }

  id v39 = 0LL;
  [(id)objc_opt_class() containersForIdentifier:0 groupContainerIdentifier:0 ofContentClass:1 forPersona:0 fetchTransient:1 createIfNeeded:0 error:&v39];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v39;
  if (!v8)
  {
    v22 = 0LL;
    if (!a3) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }

  id v38 = v9;
  uint64_t v10 = [(id)objc_opt_class() containersForIdentifier:0 groupContainerIdentifier:0 ofContentClass:14 forPersona:0 fetchTransient:1 createIfNeeded:0 error:&v38];
  id v11 = v38;

  if (!v10)
  {
    v22 = 0LL;
    id v9 = v11;
    if (!a3) {
      goto LABEL_27;
    }
LABEL_25:
    id v11 = v9;
    BOOL v23 = 0;
    *a3 = v11;
    goto LABEL_29;
  }

  v27 = a3;
  id v28 = a1;
  v30 = v8;
  [v5 addObjectsFromArray:v8];
  v29 = (void *)v10;
  [v5 addObjectsFromArray:v10];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (!v13) {
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v35;
  do
  {
    for (uint64_t i = 0LL; i != v14; ++i)
    {
      uint64_t v17 = v11;
      if (*(void *)v35 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      char v33 = 0;
      id v32 = v11;
      char v19 = objc_msgSend(v18, "isStagedUpdateContainer:withError:", &v33, &v32, v25);
      id v11 = v32;

      if ((v19 & 1) != 0)
      {
        if (v33) {
          continue;
        }
      }

      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v25 = v18;
          id v26 = v11;
          MOLogWrite();
        }

        char v33 = 0;
      }

      objc_msgSend(v6, "addObject:", v18, v25, v26);
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v25 = v18;
        MOLogWrite();
      }
    }

    uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  }

  while (v14);
LABEL_21:

  if (![v6 count])
  {
    BOOL v23 = 1;
    BOOL v8 = v30;
    v22 = v29;
    goto LABEL_29;
  }

  unint64_t v20 = (void *)[v6 copy];
  id v31 = v11;
  char v21 = [v28 removeContainers:v20 waitForDeletion:0 error:&v31];
  id v9 = v31;

  BOOL v8 = v30;
  v22 = v29;
  if ((v21 & 1) != 0)
  {
    BOOL v23 = 1;
    goto LABEL_28;
  }

  a3 = v27;
  if (v27) {
    goto LABEL_25;
  }
LABEL_27:
  BOOL v23 = 0;
LABEL_28:
  id v11 = v9;
LABEL_29:

  return v23;
}

- (BOOL)hasParallelPlaceholder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MIBundleContainer parallelPlaceholderURL](self, "parallelPlaceholderURL");
  char v5 = [v3 itemExistsAtURL:v4];

  return v5;
}

- (NSURL)parallelPlaceholderURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.mobileinstallation.placeholder" isDirectory:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)writeiTunesMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v15 = 0LL;
  [v6 propertyListDataWithError:&v15];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v15;
  id v9 = v8;
  if (v7)
  {
    id v14 = v8;
    BOOL v10 = -[MIBundleContainer _writeRawiTunesMetadataData:error:](self, "_writeRawiTunesMetadataData:error:", v7, &v14);
    id v11 = v14;

    if (v10)
    {
      -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", v6);
      BOOL v12 = 1;
      goto LABEL_8;
    }
  }

  else
  {
    id v11 = v8;
  }

  if (a4)
  {
    id v11 = v11;
    BOOL v12 = 0;
    *a4 = v11;
  }

  else
  {
    BOOL v12 = 0;
  }

- (BOOL)_writeRawiTunesMetadataData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MIBundleContainer iTunesMetadataURL](self, "iTunesMetadataURL");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = 0LL;
  char v8 = [v6 writeToURL:v7 options:268435457 error:&v14];

  id v9 = v14;
  if ((v8 & 1) == 0)
  {
    [v7 path];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIBundleContainer _writeRawiTunesMetadataData:error:]",  263LL,  @"MIInstallerErrorDomain",  124LL,  v9,  &unk_189D649E8,  @"Failed to write iTunesMetadata to %@",  v11,  (uint64_t)v10);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v9 = v12;
      *a4 = v9;
    }

    else
    {
      id v9 = v12;
    }
  }

  return v8;
}

- (BOOL)bestEffortRollbackiTunesMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v19 = 0LL;
    +[MIStoreMetadata metadataFromPlistData:error:]( &OBJC_CLASS___MIStoreMetadata,  "metadataFromPlistData:error:",  v6,  &v19);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v19;
    id v9 = v8;
    if (v7)
    {
      id v18 = v8;
      BOOL v10 = -[MIBundleContainer _writeRawiTunesMetadataData:error:]( self,  "_writeRawiTunesMetadataData:error:",  v6,  &v18);
      id v11 = v18;

      if (v10)
      {
        -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", v7);

LABEL_7:
        BOOL v15 = 1;
        goto LABEL_19;
      }
    }

    else
    {
      id v11 = v8;
    }
  }

  else
  {
    +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundleContainer iTunesMetadataURL](self, "iTunesMetadataURL");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = 0LL;
    char v14 = [v12 removeItemAtURL:v13 error:&v17];
    id v11 = v17;

    if ((v14 & 1) != 0)
    {
      -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", 0LL);
      goto LABEL_7;
    }
  }

  if (a4)
  {
    id v11 = v11;
    BOOL v15 = 0;
    *a4 = v11;
  }

  else
  {
    BOOL v15 = 0;
  }

+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v18 = 0LL;
  [a1 appBundleContainerWithIdentifier:a4 createIfNeeded:0 created:0 error:&v18];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v18;
  id v11 = v10;
  if (v9)
  {
    id v17 = v10;
    [v8 propertyListDataWithError:&v17];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v17;

    if (v12)
    {
      id v16 = v13;
      char v14 = [v9 writeiTunesMetadata:v8 error:&v16];
      id v11 = v16;

      if (!a5) {
        goto LABEL_10;
      }
    }

    else
    {
      char v14 = 0;
      id v11 = v13;
      if (!a5) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    char v14 = 0;
    if (!a5) {
      goto LABEL_10;
    }
  }

  if ((v14 & 1) == 0) {
    *a5 = v11;
  }
LABEL_10:

  return v14;
}

- (id)iTunesMetadataWithError:(id *)a3
{
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v6 = v5;
  }

  else
  {
    -[MIBundleContainer iTunesMetadataURL](self, "iTunesMetadataURL");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = 0LL;
    +[MIStoreMetadata metadataFromPlistAtURL:error:]( &OBJC_CLASS___MIStoreMetadata,  "metadataFromPlistAtURL:error:",  v7,  &v11);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v11;

    if (v6)
    {
      -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", v6);
      id v9 = v6;
    }

    else if (a3)
    {
      *a3 = v8;
    }
  }

  return v6;
}

- (id)_bundleExtensionForContainerClassWithError:(id *)a3
{
  uint64_t v5 = -[MIContainer containerClass](self, "containerClass");
  id v6 = 0LL;
  uint64_t v7 = @"app";
  if (v5 != 1 && v5 != 14)
  {
    _CreateAndLogError( (uint64_t)"-[MIBundleContainer _bundleExtensionForContainerClassWithError:]",  386LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"BundleContainer can't be created for container type %llu",  v4,  v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v6 = v6;
      uint64_t v7 = 0LL;
      *a3 = v6;
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  return (id)v7;
}

- (BOOL)_configureBundleWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  -[MIBundleContainer _bundleExtensionForContainerClassWithError:]( self,  "_bundleExtensionForContainerClassWithError:",  &v15);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v15;
  id v8 = v7;
  if (v6)
  {
    id v14 = v7;
    id v9 = -[MIExecutableBundle initWithBundleInContainer:withExtension:error:]( objc_alloc(&OBJC_CLASS___MIExecutableBundle),  "initWithBundleInContainer:withExtension:error:",  self,  v6,  &v14);
    id v10 = v14;

    bundle = self->_bundle;
    self->_bundle = v9;

    if (!self->_bundle && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      [v5 path];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else if (a3)
  {
    id v10 = v7;
    *a3 = v10;
  }

  else
  {
    id v10 = v7;
  }

  return v6 != 0LL;
}

- (MIBundleContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MIBundleContainer;
  id v27 = 0LL;
  id v9 = -[MIContainer initWithToken:options:error:](&v26, sel_initWithToken_options_error_, v8, a4, &v27);
  id v10 = v27;
  if (v9)
  {
    v25.receiver = v9;
    v25.super_class = (Class)&OBJC_CLASS___MIBundleContainer;
    -[MIContainer rawContainer](&v25, sel_rawContainer);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if ([v8 hasIdentifiedBundle])
      {
        id v24 = v10;
        BOOL v12 = -[MIBundleContainer _configureBundleWithError:](v9, "_configureBundleWithError:", &v24);
        id v13 = v24;

        id v10 = v13;
        if (!v12) {
          goto LABEL_5;
        }
      }

      else
      {
        id v13 = v10;
      }
    }

    else
    {
      id v15 = objc_alloc(&OBJC_CLASS___MIExecutableBundle);
      [v8 bundleURL];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v23 = v10;
      uint64_t v17 = -[MIBundle initWithBundleURL:error:](v15, "initWithBundleURL:error:", v16, &v23);
      id v13 = v23;

      bundle = v9->_bundle;
      v9->_bundle = (MIExecutableBundle *)v17;

      id v19 = v9->_bundle;
      if (!v19)
      {
        [v8 bundleURL];
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MIBundleContainer initWithToken:options:error:]",  433LL,  @"MIInstallerErrorDomain",  4LL,  v13,  0LL,  @"Failed to create app bundle from %@",  v21,  (uint64_t)v20);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (a5) {
          goto LABEL_6;
        }
LABEL_12:
        id v14 = 0LL;
        goto LABEL_13;
      }

      -[MIExecutableBundle setBundleContainer:](v19, "setBundleContainer:", v9);
    }

    id v14 = v9;
    id v10 = v13;
    goto LABEL_13;
  }

- (id)initForAppContainerWithURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MIBundleContainer;
  uint64_t v5 = -[MIContainer initWithContainerURL:](&v12, sel_initWithContainerURL_, v4);
  if (v5)
  {
    id v11 = 0LL;
    id v6 = -[MIExecutableBundle initWithBundleInContainer:withExtension:error:]( objc_alloc(&OBJC_CLASS___MIExecutableBundle),  "initWithBundleInContainer:withExtension:error:",  v5,  @"app",  &v11);
    id v7 = v11;
    bundle = v5->_bundle;
    v5->_bundle = v6;

    if (!v5->_bundle && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      [v4 path];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  return v5;
}

- (MIBundleContainer)initWithContainer:(id)a3 error:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MIBundleContainer;
  uint64_t v5 = -[MIContainer initWithContainer:error:](&v13, sel_initWithContainer_error_, a3);
  id v6 = v5;
  if (!v5 || -[MIContainer status](v5, "status") != 1)
  {
    id v9 = 0LL;
    goto LABEL_7;
  }

  id v12 = 0LL;
  BOOL v7 = -[MIBundleContainer _configureBundleWithError:](v6, "_configureBundleWithError:", &v12);
  id v8 = v12;
  id v9 = v8;
  if (v7)
  {
LABEL_7:
    id v10 = v6;
    goto LABEL_8;
  }

  if (a4)
  {
    id v9 = v8;
    id v10 = 0LL;
    *a4 = v9;
  }

  else
  {
    id v10 = 0LL;
  }

- (NSURL)iTunesMetadataURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)bundleMetadataURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"BundleMetadata.plist" isDirectory:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)bundleMetadataWithError:(id *)a3
{
  uint64_t v5 = -[MIBundleContainer bundleMetadata](self, "bundleMetadata");
  if (v5)
  {
    id v6 = (MIBundleMetadata *)v5;
    id v7 = 0LL;
LABEL_5:
    id v10 = (void *)-[MIBundleMetadata copy](v6, "copy");
    id v8 = v6;
    goto LABEL_6;
  }

  -[MIBundleContainer bundleMetadataURL](self, "bundleMetadataURL");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = 0LL;
  +[MIBundleMetadata metadataFromURL:error:](&OBJC_CLASS___MIBundleMetadata, "metadataFromURL:error:", v8, &v14);
  id v6 = (MIBundleMetadata *)objc_claimAutoreleasedReturnValue();
  id v9 = v14;
  id v7 = v9;
  if (v6)
  {
LABEL_4:
    -[MIBundleContainer setBundleMetadata:](self, "setBundleMetadata:", v6);

    goto LABEL_5;
  }

  [v9 domain];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v12 isEqualToString:*MEMORY[0x189607460]])
  {
    uint64_t v13 = [v7 code];

    if (v13 == 260)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___MIBundleMetadata);
      goto LABEL_4;
    }
  }

  else
  {
  }

  if (a3)
  {
    id v7 = v7;
    id v10 = 0LL;
    *a3 = v7;
  }

  else
  {
    id v10 = 0LL;
  }

- (BOOL)saveBundleMetadata:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  -[MIBundleContainer bundleMetadataURL](self, "bundleMetadataURL");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  int v8 = [v6 serializeToURL:v7 error:&v12];
  id v9 = v12;
  id v10 = v9;
  if (v8)
  {
    -[MIBundleContainer setBundleMetadata:](self, "setBundleMetadata:", v6);
  }

  else if (a4)
  {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)captureBundleByMoving:(id)a3 withError:(id *)a4
{
  id v7 = a3;
  -[MIContainer containerURL](self, "containerURL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _CreateAndLogError( (uint64_t)"-[MIBundleContainer captureBundleByMoving:withError:]",  562LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed get container URL from %@",  v8,  (uint64_t)self);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0LL;
    if (a4)
    {
LABEL_7:
      id v15 = v15;
      BOOL v16 = 0;
      *a4 = v15;
      goto LABEL_8;
    }

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  char v30 = 0;
  id v29 = 0LL;
  BOOL v11 = -[MIContainer isStagedUpdateContainer:withError:](self, "isStagedUpdateContainer:withError:", &v30, &v29);
  id v12 = v29;
  if (!v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v23 = self;
      id v25 = v12;
      MOLogWrite();
    }

    char v30 = 1;
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MIBundleContainer;
  id v28 = 0LL;
  BOOL v13 = -[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]( &v27,  sel_makeContainerLiveReplacingContainer_reason_waitForDeletion_withError_,  v10,  a4,  v7,  &v28,  v23,  v25);
  id v14 = v28;
  if (v13)
  {
    uint64_t v15 = -[MIContainer containerURL](self, "containerURL");
    LOBYTE(v13) = v15 != 0;
    if (v15)
    {
      uint64_t v17 = (void *)v15;
      -[MIBundleContainer bundle](self, "bundle");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setBundleParentDirectoryURL:v17];
    }

    else
    {
      _CreateAndLogError( (uint64_t)"-[MIBundleContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]",  602LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to get container URL from %@",  v16,  (uint64_t)self);
      uint64_t v17 = v14;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  if (v30)
  {
    id v26 = v12;
    BOOL v19 = -[MIContainer clearStagedUpdateContainerStatusWithError:]( self,  "clearStagedUpdateContainerStatusWithError:",  &v26);
    id v20 = v26;

    if (!v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      -[MIContainer identifier](self, "identifier");
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else
  {
    id v20 = v12;
  }

  if (a6) {
    char v21 = v13;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    *a6 = v14;
  }

  return v13;
}

- (unsigned)bundleMaxLinkedSDKVersion
{
  id v14 = 0LL;
  v3 = -[MIContainer infoValueForKey:error:]( self,  "infoValueForKey:error:",  @"com.apple.MobileInstallation.BundleMaxLinkedSDKVersion",  &v14);
  id v4 = v14;
  objc_opt_class();
  id v5 = v3;
  id v6 = 0LL;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }

  if (v6)
  {
    LODWORD(v7) = [v6 unsignedIntValue];
LABEL_5:
    id v8 = v4;
    goto LABEL_6;
  }

  -[MIBundleContainer bundle](self, "bundle");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v10 maxLinkedSDKVersion];

  if (!(_DWORD)v7) {
    goto LABEL_5;
  }
  [MEMORY[0x189607968] numberWithUnsignedInt:v7];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v4;
  BOOL v12 = -[MIContainer setInfoValue:forKey:error:]( self,  "setInfoValue:forKey:error:",  v11,  @"com.apple.MobileInstallation.BundleMaxLinkedSDKVersion",  &v13);
  id v8 = v13;

LABEL_6:
  return v7;
}

- (BOOL)shouldHaveCorrespondingDataContainer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 needsDataContainer];

  return v3;
}

- (BOOL)captureStoreDataFromDirectory:(id)a3 doCopy:(BOOL)a4 failureIsFatal:(BOOL)a5 includeiTunesMetadata:(BOOL)a6 withError:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v10 = a4;
  id v12 = a3;
  -[MIBundleContainer iTunesMetadataURL](self, "iTunesMetadataURL");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIContainer containerURL](self, "containerURL");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = 0LL;
    LODWORD(v10) = [v16 captureStoreDataFromDirectory:v12 toDirectory:v15 doCopy:v10 failureIsFatal:v9 includeiTunesMetadata:v8 withError:&v33];
    id v17 = v33;

    if ((_DWORD)v10) {
      BOOL v18 = !v8;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      BOOL v19 = 0LL;
      id v20 = v17;
      if (!a7) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }

    id v32 = v17;
    +[MIStoreMetadata metadataFromPlistAtURL:error:]( &OBJC_CLASS___MIStoreMetadata,  "metadataFromPlistAtURL:error:",  v13,  &v32);
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = v32;

    if (v19)
    {
      uint64_t v21 = [v19 distributorInfo];
      if (v21)
      {
        uint64_t v10 = v21;
        [v12 path];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MIBundleContainer captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]",  675LL,  @"MIInstallerErrorDomain",  215LL,  0LL,  0LL,  @"iTunesMetadata.plist captured from %@ has distributorInfo set; this is not allowed. Found distributorInfo: %@",
          v23,
        uint64_t v24 = (uint64_t)v22);

        LOBYTE(v10) = 0;
        id v20 = (id)v24;
        if (!a7) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }

- (NSURL)stashBaseURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.mobileinstallation.stash" isDirectory:1];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)_stashURLForIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 URLByAppendingPathComponent:v5 isDirectory:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stashedBundleContainerForIndex:(unint64_t)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = 0LL;
  char v8 = [v7 itemExistsAtURL:v6 error:&v21];
  id v9 = v21;

  if ((v8 & 1) != 0)
  {
    id v10 = -[MIBundleContainer initForAppContainerWithURL:]( objc_alloc(&OBJC_CLASS___MIStashedBundleContainer),  "initForAppContainerWithURL:",  v6);
    if (v10)
    {
      BOOL v11 = v10;
      id v12 = v9;
      goto LABEL_9;
    }

    BOOL v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 path];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer _stashedBundleContainerForIndex:error:]",  725LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to create %@ instance for %@",  v19,  (uint64_t)v14);
  }

  else
  {
    id v13 = (void *)*MEMORY[0x189607460];
    -[MIContainer containerURL](self, "containerURL");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 path];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = _CreateError( (uint64_t)"-[MIBundleContainer _stashedBundleContainerForIndex:error:]",  719LL,  v13,  260LL,  v9,  0LL,  @"No stash was found in bundle container %@ with index %lu (at %@)",  v16,  (uint64_t)v14);
  }

  id v12 = (id)v17;

  if (a4)
  {
    id v12 = v12;
    BOOL v11 = 0LL;
    *a4 = v12;
  }

  else
  {
    BOOL v11 = 0LL;
  }

- (id)stashedBundleContainerWithError:(id *)a3
{
  return -[MIBundleContainer _stashedBundleContainerForIndex:error:]( self,  "_stashedBundleContainerForIndex:error:",  0LL,  a3);
}

- (BOOL)cloneContentFromStashedBundleContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = __Block_byref_object_copy__8;
  id v31 = __Block_byref_object_dispose__8;
  id v32 = 0LL;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIContainer containerURL](self, "containerURL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    uint64_t v16 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]",  772LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed get container URL for %@ when trying to clone content from %@",  v8,  (uint64_t)self);
    id v10 = 0LL;
    id v13 = 0LL;
LABEL_7:
    uint64_t v17 = (void *)v28[5];
    v28[5] = v16;
    goto LABEL_9;
  }

  [v6 bundle];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    [v6 containerURL];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]",  778LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Could not locate bundle in stashed bundle container at %@",  v18,  (uint64_t)v17);
    id v20 = (void *)v28[5];
    v28[5] = v19;

    id v10 = 0LL;
    id v13 = 0LL;
LABEL_9:

    if (a4) {
      goto LABEL_5;
    }
LABEL_10:
    BOOL v15 = 0;
    goto LABEL_11;
  }

  [v6 containerURL];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __66__MIBundleContainer_cloneContentFromStashedBundleContainer_error___block_invoke;
  v23[3] = &unk_189D490D8;
  id v12 = v9;
  id v24 = v12;
  id v25 = v7;
  id v26 = &v27;
  [v25 enumerateURLsForItemsInDirectoryAtURL:v11 ignoreSymlinks:1 withBlock:v23];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28[5])
  {
    if (!v13)
    {
      objc_storeStrong((id *)&self->_bundle, v10);
      [v10 setBundleParentDirectoryURL:v12];
      [v10 setBundleContainer:self];
      id v13 = 0LL;
      BOOL v15 = 1;
      goto LABEL_11;
    }

    uint64_t v16 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]",  807LL,  @"MIInstallerErrorDomain",  4LL,  v13,  0LL,  @"Failed to enumerate stashed container",  v14,  v22);
    goto LABEL_7;
  }

  if (!a4) {
    goto LABEL_10;
  }
LABEL_5:
  BOOL v15 = 0;
  *a4 = (id) v28[5];
LABEL_11:

  _Block_object_dispose(&v27, 8);
  return v15;
}

uint64_t __66__MIBundleContainer_cloneContentFromStashedBundleContainer_error___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  id v5 = a2;
  [v5 lastPathComponent];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_ItemIsIgnoredContainerContentForStash(v6) & 1) != 0)
  {
    uint64_t v7 = 1LL;
  }

  else
  {
    [*(id *)(a1 + 32) URLByAppendingPathComponent:v6 isDirectory:a3 == 4];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = *(void **)(a1 + 40);
    id v18 = 0LL;
    uint64_t v7 = [v9 copyItemAtURL:v5 toURL:v8 alwaysClone:0 error:&v18];
    id v10 = v18;
    if ((v7 & 1) == 0)
    {
      [v5 path];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 path];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]_block_invoke",  794LL,  @"MIInstallerErrorDomain",  4LL,  v10,  0LL,  @"Failed to clone stashed item %@ to %@",  v12,  (uint64_t)v11);
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
      BOOL v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }

  return v7;
}

- (BOOL)transferExistingStashesFromContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stashBaseURL];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MIBundleContainer stashBaseURL](self, "stashBaseURL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 itemDoesNotExistAtURL:v8])
  {
    id v10 = 0LL;
LABEL_7:
    BOOL v13 = 1;
    goto LABEL_8;
  }

  id v21 = 0LL;
  int v11 = [v7 copyItemAtURL:v8 toURL:v9 alwaysClone:0 error:&v21];
  id v10 = v21;
  if (v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      -[MIBundleContainer bundle](self, "bundle");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 identifier];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    goto LABEL_7;
  }

  -[MIBundleContainer bundle](self, "bundle");
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 identifier];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 path];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError( (uint64_t)"-[MIBundleContainer transferExistingStashesFromContainer:error:]",  840LL,  @"MIInstallerErrorDomain",  4LL,  v10,  0LL,  @"Failed to preserve existing stashed version of app %@ at %@",  v17,  (uint64_t)v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    id v10 = v18;
    BOOL v13 = 0;
    *a4 = v10;
  }

  else
  {
    BOOL v13 = 0;
    id v10 = v18;
  }

- (BOOL)stashBundleContainerContents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  v53 = __Block_byref_object_copy__8;
  v54 = __Block_byref_object_dispose__8;
  id v55 = 0LL;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleContainer stashBaseURL](self, "stashBaseURL");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleContainer _stashURLForIndex:](self, "_stashURLForIndex:", 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (id *)(v51 + 5);
  id obj = (id)v51[5];
  char v11 = [v7 createDirectoryAtURL:v8 withIntermediateDirectories:0 mode:493 class:4 error:&obj];
  objc_storeStrong(v10, obj);
  if ((v11 & 1) == 0)
  {
    uint64_t v22 = (void *)v51[5];
    [v8 path];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]",  870LL,  @"MIInstallerErrorDomain",  4LL,  v22,  0LL,  @"Failed to create stash base directory at %@",  v24,  (uint64_t)v23);
LABEL_8:
    id v28 = (void *)v51[5];
    v51[5] = v25;

    uint64_t v16 = 0LL;
    id v18 = 0LL;
    uint64_t v19 = 0LL;
    id v20 = 0LL;
    goto LABEL_9;
  }

  uint64_t v12 = (id *)(v51 + 5);
  id v48 = (id)v51[5];
  char v13 = [v7 createDirectoryAtURL:v9 withIntermediateDirectories:0 mode:493 class:4 error:&v48];
  objc_storeStrong(v12, v48);
  if ((v13 & 1) == 0)
  {
    id v26 = (void *)v51[5];
    [v8 path];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]",  876LL,  @"MIInstallerErrorDomain",  4LL,  v26,  0LL,  @"Failed to create stash base directory at %@",  v27,  (uint64_t)v23);
    goto LABEL_8;
  }

  [v6 containerURL];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = __56__MIBundleContainer_stashBundleContainerContents_error___block_invoke;
  v44[3] = &unk_189D490D8;
  id v15 = v9;
  id v45 = v15;
  id v46 = v7;
  v47 = &v50;
  [v46 enumerateURLsForItemsInDirectoryAtURL:v14 ignoreSymlinks:1 withBlock:v44];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51[5])
  {
    id v18 = 0LL;
    uint64_t v19 = 0LL;
    id v20 = 0LL;
    if (!a4)
    {
LABEL_5:
      BOOL v21 = 0;
      goto LABEL_11;
    }

uint64_t __56__MIBundleContainer_stashBundleContainerContents_error___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  id v5 = a2;
  [v5 lastPathComponent];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_ItemIsIgnoredContainerContentForStash(v6) & 1) != 0)
  {
    uint64_t v7 = 1LL;
  }

  else
  {
    [*(id *)(a1 + 32) URLByAppendingPathComponent:v6 isDirectory:a3 == 4];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = *(void **)(a1 + 40);
    id v18 = 0LL;
    uint64_t v7 = [v9 copyItemAtURL:v5 toURL:v8 alwaysClone:0 error:&v18];
    id v10 = v18;
    if ((v7 & 1) == 0)
    {
      [v5 path];
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 path];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]_block_invoke",  893LL,  @"MIInstallerErrorDomain",  4LL,  v10,  0LL,  @"Failed to clone existing container item at path %@ to stash path %@",  v12,  (uint64_t)v11);
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }

  return v7;
}

- (NSURL)referenceStorageURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"References" isDirectory:1];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (MIBundleMetadata)bundleMetadata
{
  return self->_bundleMetadata;
}

- (void)setBundleMetadata:(id)a3
{
}

- (MIStoreMetadata)iTunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end