@interface MIInstalledInfoGatherer
- (BOOL)_populateBundleRecord:(id)a3 error:(id *)a4;
- (BOOL)_populateBundleRecordValues:(id)a3 signingInfo:(id)a4 error:(id *)a5;
- (MIBundleContainer)bundleContainer;
- (MIExecutableBundle)builtInAppParallelPlaceholderBundle;
- (MIExecutableBundle)bundle;
- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainer:(id)a5;
- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5;
- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainer:(id)a4;
- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainers:(id)a4;
- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainer:(id)a4;
- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainers:(id)a4;
- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersona:(id)a4;
- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersonas:(id)a4;
- (NSArray)dataContainers;
- (NSArray)personaUniqueStrings;
- (NSString)owningBundleIdentifier;
- (NSURL)parentBundleURL;
- (id)_buildBundlePersonaRecordWithDataContainer:(id)a3;
- (id)_groupContainersDictionaryForPersona:(id)a3;
- (id)_sandboxEnvironmentForDataContainer:(id)a3;
- (id)_stashedAppRecordForStashedContainer:(id)a3;
- (id)_staticDiskUsage;
- (id)bundleRecordWithError:(id *)a3;
- (void)_fixUpForBuiltInAppParallelPlaceholder;
- (void)_initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5;
- (void)_initWithBundle:(id)a3 dataContainers:(id)a4;
- (void)_initWithBundleContainer:(id)a3 dataContainers:(id)a4;
- (void)_initWithBundleContainer:(id)a3 forPersonas:(id)a4;
- (void)_populateAppExtensionRecordValues:(id)a3;
- (void)_populateAppRecordValues:(id)a3;
- (void)_populatePlaceholderRecordValues:(id)a3 signingInfo:(id)a4;
@end

@implementation MIInstalledInfoGatherer

- (void)_fixUpForBuiltInAppParallelPlaceholder
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  v3 = -[MIInstalledInfoGatherer bundle](self, "bundle");
  char v4 = [v3 isRemovableSystemApp];

  if ((v4 & 1) == 0)
  {
    v5 = -[MIInstalledInfoGatherer bundle](self, "bundle");
    unsigned int v6 = [v5 bundleType];

    if (v6 <= 5 && ((1 << v6) & 0x26) != 0)
    {
      v7 = -[MIInstalledInfoGatherer bundle](self, "bundle");
      int v8 = [v7 isPlaceholder];

      if (!v8)
      {
        -[MIInstalledInfoGatherer bundle](self, "bundle");
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
LABEL_62:

          return;
        }
        v15 = -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
        if (!v15)
        {
          v16 = -[MIInstalledInfoGatherer bundle](self, "bundle");
          [v16 identifier];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          id v60 = 0LL;
          v18 = +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v17,  0LL,  0LL,  &v60);
          id v14 = v60;

          if (v18)
          {
            [v18 bundle];
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            int v20 = [v19 isPlaceholder];

            if (v20)
            {
              [v18 bundle];
              v21 = (MIExecutableBundle *)objc_claimAutoreleasedReturnValue();
              builtInAppParallelPlaceholderBundle = self->_builtInAppParallelPlaceholderBundle;
              self->_builtInAppParallelPlaceholderBundle = v21;
            }

            goto LABEL_62;
          }

          [v14 domain];
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v52 isEqualToString:@"MIContainerManagerErrorDomain"])
          {
            uint64_t v53 = [v14 code];

            if (v53 == 21) {
              goto LABEL_62;
            }
          }

          else
          {
          }

          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v54 = -[MIInstalledInfoGatherer bundle](self, "bundle");
            [v54 identifier];
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();
          }

          goto LABEL_62;
        }

- (void)_initWithBundle:(id)a3 dataContainers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (NSArray *)[v8 copy];

  dataContainers = self->_dataContainers;
  self->_dataContainers = v9;

  -[MIInstalledInfoGatherer _fixUpForBuiltInAppParallelPlaceholder](self, "_fixUpForBuiltInAppParallelPlaceholder");
}

- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIInstalledInfoGatherer;
  id v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  v9 = v8;
  if (v8) {
    -[MIInstalledInfoGatherer _initWithBundle:dataContainers:](v8, "_initWithBundle:dataContainers:", v6, v7);
  }

  return v9;
}

- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainer:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIInstalledInfoGatherer;
  id v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v9 = 0LL;
    }

    -[MIInstalledInfoGatherer _initWithBundle:dataContainers:](v8, "_initWithBundle:dataContainers:", v6, v9);
  }

  return v8;
}

- (void)_initWithBundleContainer:(id)a3 forPersonas:(id)a4
{
  id v6 = (MIBundleContainer *)a3;
  id v7 = a4;
  -[MIBundleContainer bundle](v6, "bundle");
  id v8 = (MIExecutableBundle *)objc_claimAutoreleasedReturnValue();
  bundle = self->_bundle;
  self->_bundle = v8;

  bundleContainer = self->_bundleContainer;
  self->_bundleContainer = v6;
  objc_super v11 = v6;

  v12 = (NSArray *)[v7 copy];
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v12;

  -[MIInstalledInfoGatherer _fixUpForBuiltInAppParallelPlaceholder](self, "_fixUpForBuiltInAppParallelPlaceholder");
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersonas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIInstalledInfoGatherer;
  id v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  v9 = v8;
  if (v8) {
    -[MIInstalledInfoGatherer _initWithBundleContainer:forPersonas:]( v8,  "_initWithBundleContainer:forPersonas:",  v6,  v7);
  }

  return v9;
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersona:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIInstalledInfoGatherer;
  id v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v9 = 0LL;
    }

    -[MIInstalledInfoGatherer _initWithBundleContainer:forPersonas:]( v8,  "_initWithBundleContainer:forPersonas:",  v6,  v9);
  }

  return v8;
}

- (void)_initWithBundleContainer:(id)a3 dataContainers:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_opt_new();
  [v7 bundle];
  v10 = (MIExecutableBundle *)objc_claimAutoreleasedReturnValue();
  bundle = self->_bundle;
  self->_bundle = v10;

  objc_storeStrong((id *)&self->_bundleContainer, a3);
  v12 = (NSArray *)[v8 copy];
  dataContainers = self->_dataContainers;
  self->_dataContainers = v12;

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v19, "personaUniqueString", (void)v24);
        int v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          [v19 personaUniqueString];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 addObject:v21];
        }
      }

      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v16);
  }

  v22 = (NSArray *)[v9 copy];
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v22;

  -[MIInstalledInfoGatherer _fixUpForBuiltInAppParallelPlaceholder](self, "_fixUpForBuiltInAppParallelPlaceholder");
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainer:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIInstalledInfoGatherer;
  id v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v9 = 0LL;
    }

    -[MIInstalledInfoGatherer _initWithBundleContainer:dataContainers:]( v8,  "_initWithBundleContainer:dataContainers:",  v6,  v9);
  }

  return v8;
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIInstalledInfoGatherer;
  id v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  v9 = v8;
  if (v8) {
    -[MIInstalledInfoGatherer _initWithBundleContainer:dataContainers:]( v8,  "_initWithBundleContainer:dataContainers:",  v6,  v7);
  }

  return v9;
}

- (void)_initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_opt_new();
  objc_storeStrong((id *)&self->_bundle, a3);
  v13 = (NSArray *)[v11 copy];
  dataContainers = self->_dataContainers;
  self->_dataContainers = v13;

  objc_storeStrong((id *)&self->_owningBundleIdentifier, a4);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        int v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v20, "personaUniqueString", (void)v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          [v20 personaUniqueString];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 addObject:v22];
        }
      }

      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v17);
  }

  v23 = (NSArray *)[v12 copy];
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v23;
}

- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MIInstalledInfoGatherer;
  id v11 = -[MIInstalledInfoGatherer init](&v14, sel_init);
  v12 = v11;
  if (v11) {
    -[MIInstalledInfoGatherer _initWithAppExtensionBundle:inBundleIdentifier:dataContainers:]( v11,  "_initWithAppExtensionBundle:inBundleIdentifier:dataContainers:",  v8,  v9,  v10);
  }

  return v12;
}

- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainer:(id)a5
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MIInstalledInfoGatherer;
  id v11 = -[MIInstalledInfoGatherer init](&v14, sel_init);
  if (v11)
  {
    if (v10)
    {
      v15[0] = v10;
      [MEMORY[0x189603F18] arrayWithObjects:v15 count:1];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v12 = 0LL;
    }

    -[MIInstalledInfoGatherer _initWithAppExtensionBundle:inBundleIdentifier:dataContainers:]( v11,  "_initWithAppExtensionBundle:inBundleIdentifier:dataContainers:",  v8,  v9,  v12);
  }

  return v11;
}

- (id)_sandboxEnvironmentForDataContainer:(id)a3
{
  v11[3] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  [a3 containerURL];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"tmp" isDirectory:1];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 path];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    v10[0] = @"HOME";
    v10[1] = @"CFFIXED_USER_HOME";
    v11[0] = v5;
    v11[1] = v5;
    v10[2] = @"TMPDIR";
    [v4 path];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_groupContainersDictionaryForPersona:(id)a3
{
  id v4 = a3;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MIInstalledInfoGatherer dataContainers](self, "dataContainers");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v15 = 0LL;
    +[MIContainer groupContainerURLsForBundleIdentifier:forPersona:error:]( &OBJC_CLASS___MIContainer,  "groupContainerURLsForBundleIdentifier:forPersona:error:",  v6,  v4,  &v15);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v15;
    if (!v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      id v13 = v4;
      id v14 = v9;
      v12 = v6;
      MOLogWrite();
    }

    id v10 = (void *)objc_msgSend(v8, "copy", v12, v13, v14);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)_staticDiskUsage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = (void *)MEMORY[0x189607968];
    -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "diskUsage"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_stashedAppRecordForStashedContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_opt_new();
  id v6 = objc_alloc(&OBJC_CLASS___MIInstalledInfoGatherer);
  -[MIInstalledInfoGatherer personaUniqueStrings](self, "personaUniqueStrings");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[MIInstalledInfoGatherer initWithBundleContainer:forPersonas:]( v6,  "initWithBundleContainer:forPersonas:",  v4,  v7);

  id v18 = 0LL;
  LOBYTE(v6) = -[MIInstalledInfoGatherer _populateBundleRecord:error:](v8, "_populateBundleRecord:error:", v5, &v18);
  id v9 = v18;
  id v10 = v9;
  if ((v6 & 1) != 0)
  {
    id v17 = v9;
    [v4 stashMetadataWithError:&v17];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v17;

    if (v11)
    {
      [v11 dateStashed];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setStashedAtTimestamp:v13];

      [v11 dateOriginallyInstalled];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setStashOriginalInstallTimestamp:v14];
    }

    else
    {
      id v14 = v12;
      id v12 = 0LL;
    }

    id v15 = v5;
    id v10 = v12;
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)_buildBundlePersonaRecordWithDataContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_opt_new();
  [v4 personaUniqueString];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containerURL];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setDataContainerURL:v7];

  -[MIInstalledInfoGatherer _sandboxEnvironmentForDataContainer:](self, "_sandboxEnvironmentForDataContainer:", v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 setEnvironmentVariables:v8];
  -[MIInstalledInfoGatherer _groupContainersDictionaryForPersona:](self, "_groupContainersDictionaryForPersona:", v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setGroupContainerURLs:v9];

  return v5;
}

- (BOOL)_populateBundleRecordValues:(id)a3 signingInfo:(id)a4 error:(id *)a5
{
  uint64_t v121 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = self;
  -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = [v9 bundleType];
  int v108 = [v9 isPlaceholder];
  objc_msgSend(v7, "setIsPlaceholder:");
  [v9 identifier];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setBundleIdentifier:v12];

  [v9 bundleVersion];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setBundleVersion:v13];

  [v9 bundleShortVersion];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setBundleShortVersion:v14];

  [v9 bundleURL];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setBundleURL:v15];

  unsigned int v16 = v11 - 1;
  else {
    uint64_t v17 = qword_183DC13D8[(char)v16];
  }
  [v7 setApplicationType:v17];
  [v9 counterpartIdentifiers];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setCounterpartIdentifiers:v18];

  objc_msgSend(v7, "setCompatibilityState:", objc_msgSend(v9, "compatibilityState"));
  [v7 setIsOnMountedDiskImage:v11 == 3];
  [v8 signatureVersion];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if (v16 < 6 || v11 == 9)
    {
      [v9 bundleSignatureVersionWithError:0];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v19 = 0LL;
    }
  }

  [v7 setSignatureVersion:v19];
  objc_msgSend(v7, "setIsContainerized:", objc_msgSend(v9, "needsDataContainer"));
  if (v8)
  {
    [v8 entitlements];
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setHasAppGroupContainers:MIHasAnyApplicationGroupEntitlements(v20)];

    [v8 entitlements];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setHasSystemContainer:MIHasSystemContainerEntitlement(v21)];

    [v8 entitlements];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setHasSystemGroupContainers:MIHasAnySystemGroupEntitlements(v22)];

    uint64_t v23 = [v9 codeSignatureVerificationState];
    if ((unint64_t)(v23 - 1) <= 1)
    {
      __int128 v24 = v19;
      id v119 = 0LL;
      char v25 = [v9 updateMCMWithCodeSigningInfoAsAdvanceCopy:0 withError:&v119];
      id v26 = v119;
      if ((v25 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        [v9 identifier];
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        id v99 = v26;
        MOLogWrite();
      }

      v19 = v24;
    }

    if ((objc_msgSend(v8, "signingInfoSource", v98, v99) & 0xFFFFFFFFFFFFFFFELL) != 2) {
      [v7 setCodeSigningInfoNotAuthoritative:1];
    }
    if (v23 == 1)
    {

      id v8 = 0LL;
    }

    [v8 entitlements];
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setEntitlements:v27];

    [v8 signerIdentity];
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v8 codeSignerType];
    else {
      uint64_t v30 = v29;
    }
    [v7 setCodeSignerType:v30];
    uint64_t v31 = [v8 codeSignerType];
    if (v28)
    {
      uint64_t v32 = v31;
      [v7 setSignerIdentity:v28];
      if (v32 == 3)
      {
        uint64_t v33 = [v8 profileValidationType];
        else {
          uint64_t v34 = v33;
        }
        [v7 setProfileValidationType:v34];
      }

      [v8 signerOrganization];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setSignerOrganization:v35];
    }

    [v8 teamIdentifier];
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setTeamIdentifier:v36];

    [v8 codeInfoIdentifier];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setCodeInfoIdentifier:v37];
  }

  else
  {
    [v7 setCodeSigningInfoNotAuthoritative:1];
  }

  if ([v9 codeSignatureVerificationState] == 6)
  {
    [v7 setIsNoLongerCompatible:1];
  }

  else if ([v9 codeSignatureVerificationState] != 1)
  {
    [v9 identifier];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setCodeInfoIdentifier:v38];
  }

  uint64_t v39 = -[MIInstalledInfoGatherer dataContainers](v112, "dataContainers");
  v40 = (void *)v39;
  if (v11 == 6 && !v39)
  {
    [v9 bundleURL];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]",  598LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Discovered app extension without data containers %@",  v42,  (uint64_t)v41);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }

  id v43 = 0LL;
  int v102 = v11;
  v107 = (void *)v39;
  if (v11 == 4)
  {
    v52 = @"user";
    if (!v10)
    {
LABEL_105:
      [v9 bundleURL];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]",  637LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Discovered %@ app without bundle container %@",  v96,  (uint64_t)v52);
      goto LABEL_106;
    }
  }

  else
  {
    if (v11 != 1) {
      goto LABEL_48;
    }
    v45 = v19;
    v104 = v10;
    [v9 bundleParentDirectoryURL];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 path];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    [v48 systemAppsDirectory];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 path];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    char v51 = [v47 isEqualToString:v50];

    if ((v51 & 1) != 0)
    {
      id v43 = 0LL;
      id v10 = v104;
      v19 = v45;
      v40 = v107;
      goto LABEL_48;
    }

    if (v108)
    {
      id v118 = 0LL;
      [v9 lsInstallTypeWithError:&v118];
      __int128 v62 = (void *)objc_claimAutoreleasedReturnValue();
      id v63 = v118;
      __int128 v64 = v63;
      v19 = v45;
      v40 = v107;
      if (v62)
      {
        id v65 = v63;
        if ([v62 unsignedIntegerValue] == 7)
        {
          uint64_t v66 = 3LL;
        }

        else if ([v62 unsignedIntegerValue] == 8)
        {
          uint64_t v66 = 4LL;
        }

        else
        {
          uint64_t v66 = 1LL;
        }
      }

      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v98 = v9;
          id v99 = v63;
          MOLogWrite();
        }

        id v65 = 0LL;
        uint64_t v66 = 1LL;
      }
      v69 = +[MISystemAppState sharedList](&OBJC_CLASS___MISystemAppState, "sharedList", v98, v99);
      [v9 identifier];
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      [v69 addIdentifier:v95 withState:v66];

      id v10 = v104;
      id v43 = v65;
    }

    else
    {
      +[MISystemAppState sharedList](&OBJC_CLASS___MISystemAppState, "sharedList");
      __int128 v62 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 identifier];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      [v62 addIdentifier:v69 withState:1];
      id v43 = 0LL;
      id v10 = v104;
      v19 = v45;
      v40 = v107;
    }

    v52 = @"system";
    if (!v10) {
      goto LABEL_105;
    }
  }

  if (!v40 && [v10 shouldHaveCorrespondingDataContainer])
  {
    [v9 bundleURL];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]",  642LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Discovered %@ app without data container %@",  v53,  (uint64_t)v52);
    uint64_t v97 = LABEL_106:;

    id v43 = (id)v97;
LABEL_37:

    if (a5)
    {
      id v43 = v43;
      BOOL v44 = 0;
      *a5 = v43;
    }

    else
    {
      BOOL v44 = 0;
    }

    goto LABEL_95;
  }

- (void)_populateAppRecordValues:(id)a3
{
  v20[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 bundleType];
  -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 allowsInternalSecurityPolicy];

    if (v9)
    {
      [v7 stashedBundleContainerWithError:0];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[MIInstalledInfoGatherer _stashedAppRecordForStashedContainer:]( self,  "_stashedAppRecordForStashedContainer:",  v10);
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v11;
        [MEMORY[0x189603F18] arrayWithObjects:v20 count:1];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setStashedVersions:v12];
      }
    }

    uint64_t v13 = [v7 containerURL];
    if (v13)
    {
      id v14 = (void *)v13;
      int v15 = [v7 hasParallelPlaceholder];

      if (v15)
      {
        [v7 parallelPlaceholderURL];
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setParallelPlaceholderURL:v16];
      }
    }

    [v4 setIsUpdatedSystemApp:(v6 & 0xFFFFFFFB) == 1];
  }

  else
  {
    -[MIInstalledInfoGatherer builtInAppParallelPlaceholderBundle](self, "builtInAppParallelPlaceholderBundle");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[MIInstalledInfoGatherer builtInAppParallelPlaceholderBundle](self, "builtInAppParallelPlaceholderBundle");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 bundleURL];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setParallelPlaceholderURL:v19];
    }
  }
}

- (void)_populateAppExtensionRecordValues:(id)a3
{
  id v4 = a3;
  -[MIInstalledInfoGatherer owningBundleIdentifier](self, "owningBundleIdentifier");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setExtensionOwnerBundleID:v5];
}

- (void)_populatePlaceholderRecordValues:(id)a3 signingInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v8 bundleType];
  [v7 entitlements];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 setIsOnDemandInstallCapable:MIHasOnDemandInstallCapableEntitlement(v11)];
  MICopyParentIdentifiersEntitlement(v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setParentIdentifiers:v12];

  [v6 setIsSwiftPlaygroundsApp:MIHasSwiftPlaygroundsAppEntitlement(v11)];
  MICopyAppManagementDomainEntitlement(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setAppManagementDomain:v13];

  [v6 setIsWebNotificationBundle:MIHasWebKitPushBundleEntitlement(v11)];
  [v6 setIsBeta:MIHasBetaReportsActiveEntitlement(v11)];
  [v6 setIsMarketplace:MIHasMarketplaceEntitlement(v11)];
  if ((v10 - 1) >= 5 && v10 != 9)
  {
    unsigned int v16 = 0LL;
    if (!v9) {
      goto LABEL_40;
    }
    goto LABEL_16;
  }

  objc_msgSend(v6, "setIsDeletable:", objc_msgSend(v8, "isDeletable"));
  id v36 = 0LL;
  [v8 installationIdentitySettingIfNotSet:0 withError:&v36];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v36;
  unsigned int v16 = v15;
  if (v14)
  {
    [v14 uniqueInstallID];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setUniqueInstallID:v17];

    [v14 installSessionID];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setInstallSessionID:v18];
    goto LABEL_15;
  }

  [v15 domain];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v19 isEqualToString:*MEMORY[0x189607688]])
  {

    goto LABEL_11;
  }

  uint64_t v20 = [v16 code];

  if (v20 != 93)
  {
LABEL_11:
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v30 = v8;
      uint64_t v32 = v16;
      MOLogWrite();
    }
  }

  id v18 = v16;
  unsigned int v16 = 0LL;
LABEL_15:

  if (!v9) {
    goto LABEL_40;
  }
LABEL_16:
  id v35 = 0LL;
  objc_msgSend(v9, "bundleMetadataWithError:", &v35, v30, v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v35;
  if (!v21)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v31 = v9;
      id v33 = v22;
      MOLogWrite();
    }

    if (objc_msgSend(v8, "isPlaceholder", v31, v33)) {
      goto LABEL_28;
    }
    goto LABEL_23;
  }

  [v21 alternateIconName];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setAlternateIconName:v23];

  [v21 linkedParentBundleID];
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setLinkedParentBundleID:v24];

  [v21 installDate];
  char v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setInstallDate:v25];

  if (![v8 isPlaceholder])
  {
LABEL_23:
    [v8 fairPlaySinfInfoWithError:0];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      if ([v8 needsSinf])
      {
        id v26 = (void *)objc_opt_new();
        [v26 setIsMissingRequiredSINF:1];
      }

      else
      {
        id v26 = 0LL;
      }
    }

    [v6 setSinfInfo:v26];

    goto LABEL_28;
  }

  objc_msgSend(v6, "setPlaceholderFailureReason:", objc_msgSend(v21, "placeholderFailureReason"));
LABEL_28:
  [v9 containerURL];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    [v6 setBundleContainerURL:v27];
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    uint64_t v31 = v9;
    MOLogWrite();
  }

  id v34 = v16;
  objc_msgSend(v8, "lsInstallTypeWithError:", &v34, v31);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = v34;

  if (v28)
  {
    [v6 setLsInstallType:v28];
  }

  else
  {

    id v29 = 0LL;
  }

  unsigned int v16 = v29;
LABEL_40:
}

- (id)bundleRecordWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch([v5 bundleType])
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      id v6 = (ICLSystemAppPlaceholderRecord *)objc_opt_new();
      goto LABEL_3;
    case 9u:
      [v5 bundleURL];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIInstalledInfoGatherer bundleRecordWithError:]",  983LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Embedded watch apps don't get reported to Launch Services: %@",  v13,  (uint64_t)v11);
      goto LABEL_9;
    case 0xAu:
      id v6 = objc_alloc(&OBJC_CLASS___ICLSystemAppPlaceholderRecord);
LABEL_3:
      id v7 = v6;
      id v15 = 0LL;
      BOOL v8 = -[MIInstalledInfoGatherer _populateBundleRecord:error:](self, "_populateBundleRecord:error:", v6, &v15);
      id v9 = v15;
      if (!v8) {
        goto LABEL_10;
      }
      id v7 = v7;
      int v10 = v7;
      if (!a3) {
        goto LABEL_13;
      }
      goto LABEL_11;
    default:
      [v5 bundleURL];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIInstalledInfoGatherer bundleRecordWithError:]",  987LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Unable to determine application type for %@",  v12,  (uint64_t)v11);
LABEL_9:
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      id v7 = 0LL;
LABEL_10:
      int v10 = 0LL;
      if (a3)
      {
LABEL_11:
        if (!v10) {
          *a3 = v9;
        }
      }

- (BOOL)_populateBundleRecord:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 identifier];
  BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[MIInstalledInfoGatherer bundle](self, "bundle");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (MILogHandleForSignpost_onceToken != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken, &__block_literal_global_3);
  }
  int v10 = (os_log_s *)MILogHandleForSignpost_logHandle;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v27 = v8;
    _os_signpost_emit_with_name_impl( &dword_183D22000,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "GenerateDict",  "Generating ICL bundle record for %@",  buf,  0xCu);
  }

  id v25 = 0LL;
  [v9 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApp licable:0 skippingProfileIDValidation:0 error:&v25];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v25;
  uint64_t v13 = v12;
  if (!v11)
  {
    [v12 domain];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v14 isEqualToString:@"MIInstallerErrorDomain"]
      && [v13 code] == 71)
    {
      int v15 = [v9 bundleType];

      if (v15 == 7) {
        goto LABEL_14;
      }
    }

    else
    {
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
    {
      [v9 bundleURL];
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 path];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (MIExecutableBundle)builtInAppParallelPlaceholderBundle
{
  return self->_builtInAppParallelPlaceholderBundle;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (NSArray)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (NSArray)dataContainers
{
  return self->_dataContainers;
}

- (NSString)owningBundleIdentifier
{
  return self->_owningBundleIdentifier;
}

- (NSURL)parentBundleURL
{
  return self->_parentBundleURL;
}

- (void).cxx_destruct
{
}

@end