@interface MIFilesystemScanner
- (BOOL)_scanAppsDirectory:(id)a3 withError:(id *)a4;
- (BOOL)_scanBundleContainersWithClass:(unint64_t)a3 withError:(id *)a4 ignoredErrorOccurredOnOneOrMoreItems:(BOOL *)a5;
- (BOOL)_scanExtensionKitDirectory:(id)a3 withError:(id *)a4;
- (BOOL)_scanExtensionKitLocations:(id)a3 withError:(id *)a4;
- (BOOL)_scanFrameworkDirectory:(id)a3 withError:(id *)a4;
- (BOOL)_scanFrameworksLocationsWithError:(id *)a3;
- (BOOL)performScanWithError:(id *)a3;
- (MIFilesystemScanner)init;
- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3;
- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3 personaUniqueString:(id)a4;
- (MIFilesystemScannerDelegate)delegate;
- (NSString)personaUniqueString;
- (id)builtInExtensionKitExtensionsDirectories;
- (unint64_t)options;
- (void)setDelegate:(id)a3;
@end

@implementation MIFilesystemScanner

- (BOOL)_scanAppsDirectory:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  v7 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __52__MIFilesystemScanner__scanAppsDirectory_withError___block_invoke;
  v16[3] = &unk_189D48910;
  v16[4] = self;
  v16[5] = v17;
  [v7 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v16];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      [v6 path];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    id v8 = 0LL;
    goto LABEL_9;
  }

  [v8 domain];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v9 isEqualToString:*MEMORY[0x189607688]])
  {

    goto LABEL_11;
  }

  uint64_t v10 = [v8 code];

  if (v10 == 2)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_14;
  }

uint64_t __52__MIFilesystemScanner__scanAppsDirectory_withError___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    [v5 pathExtension];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v7 isEqualToString:@"app"])
    {
LABEL_18:

      goto LABEL_19;
    }

    id v22 = 0LL;
    +[MIBundle bundleForURL:error:](&OBJC_CLASS___MIExecutableBundle, "bundleForURL:error:", v6, &v22);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v22;
    uint64_t v10 = v9;
    if (v8)
    {
      if (([v8 isPlaceholder] & 1) != 0
        || (+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"),
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(),
            [v8 executableURL],
            BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(),
            int v13 = [v11 itemDoesNotExistAtURL:v12],
            v12,
            v11,
            !v13))
      {
        [*(id *)(a1 + 32) delegate];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) personaUniqueString];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        id v21 = v10;
        int v17 = [v15 scanExecutableBundle:v8 inContainer:0 forPersona:v16 withError:&v21];
        id v18 = v21;

        if (v17) {
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        }
        uint64_t v10 = v18;
        goto LABEL_17;
      }

      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_17:

        goto LABEL_18;
      }

      [v8 executableURL];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 path];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    else
    {
      [v6 path];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    goto LABEL_17;
  }

- (BOOL)_scanFrameworkDirectory:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  v7 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __57__MIFilesystemScanner__scanFrameworkDirectory_withError___block_invoke;
  v16[3] = &unk_189D48910;
  v16[4] = self;
  v16[5] = v17;
  [v7 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v16];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      [v6 path];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    id v8 = 0LL;
    goto LABEL_9;
  }

  [v8 domain];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v9 isEqualToString:*MEMORY[0x189607688]])
  {

    goto LABEL_11;
  }

  uint64_t v10 = [v8 code];

  if (v10 == 2)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_14;
  }

uint64_t __57__MIFilesystemScanner__scanFrameworkDirectory_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 pathExtension];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqualToString:@"framework"]
    && !+[MIBundle bundleIsInDenyList:](&OBJC_CLASS___MIBundle, "bundleIsInDenyList:", v3))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16LL);
    if ((v5 & 0x80) != 0)
    {
      [v3 URLByAppendingPathComponent:@"PlugIns" isDirectory:1];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
      int v8 = [v7 itemDoesNotExistAtURL:v6];

      if (v8)
      {
        [v3 URLByAppendingPathComponent:@"Extensions" isDirectory:1];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 itemDoesNotExistAtURL:v9];

        if ((v11 & 1) != 0)
        {

          goto LABEL_21;
        }
      }
    }

    id v24 = 0LL;
    +[MIBundle bundleForURL:error:](&OBJC_CLASS___MIExecutableBundle, "bundleForURL:error:", v3, &v24);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v24;
    v14 = v13;
    if (!v12)
    {
      [v3 path];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }

    [*(id *)(a1 + 32) delegate];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v5 & 0x80) != 0)
    {
      id v23 = v14;
      char v20 = [v15 scanAppExtensionsInFrameworkBundle:v12 withError:&v23];
      id v19 = v23;

      if ((v20 & 1) == 0)
      {
LABEL_18:
        v14 = v19;
        goto LABEL_19;
      }
    }

    else
    {
      [*(id *)(a1 + 32) personaUniqueString];
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = v14;
      int v18 = [v16 scanExecutableBundle:v12 inContainer:0 forPersona:v17 withError:&v22];
      id v19 = v22;

      if (!v18) {
        goto LABEL_18;
      }
    }

    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    goto LABEL_18;
  }

- (BOOL)_scanFrameworksLocationsWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v4 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance", a3);
  [v4 allFrameworksDirectories];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        id v16 = 0LL;
        BOOL v12 = -[MIFilesystemScanner _scanFrameworkDirectory:withError:]( self,  "_scanFrameworkDirectory:withError:",  v11,  &v16);
        id v13 = v16;
        if (!v12)
        {
          v14 = -[MIFilesystemScanner delegate](self, "delegate");
          [v14 errorOccurred:v13];
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  return 1;
}

- (BOOL)_scanExtensionKitDirectory:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __60__MIFilesystemScanner__scanExtensionKitDirectory_withError___block_invoke;
  v16[3] = &unk_189D48910;
  v16[4] = self;
  v16[5] = v17;
  [v7 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v16];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      [v6 path];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    id v8 = 0LL;
    goto LABEL_9;
  }

  [v8 domain];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v9 isEqualToString:*MEMORY[0x189607688]])
  {

    goto LABEL_11;
  }

  uint64_t v10 = [v8 code];

  if (v10 == 2)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_14;
  }

uint64_t __60__MIFilesystemScanner__scanExtensionKitDirectory_withError___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    [v5 pathExtension];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v7 isEqualToString:@"appex"])
    {
LABEL_9:

      goto LABEL_10;
    }

    id v17 = 0LL;
    +[MIBundle bundleForURL:error:](&OBJC_CLASS___MIExtensionKitBundle, "bundleForURL:error:", v6, &v17);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v17;
    uint64_t v10 = v9;
    if (v8)
    {
      [*(id *)(a1 + 32) delegate];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) personaUniqueString];
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v10;
      int v13 = [v11 scanExecutableBundle:v8 inContainer:0 forPersona:v12 withError:&v16];
      id v14 = v16;

      if (v13) {
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      uint64_t v10 = v14;
    }

    else
    {
      [v6 path];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

LABEL_8:
    goto LABEL_9;
  }

- (id)builtInExtensionKitExtensionsDirectories
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 builtInExtensionKitExtensionsDirectories];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_scanExtensionKitLocations:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        id v15 = 0LL;
        BOOL v11 = -[MIFilesystemScanner _scanExtensionKitDirectory:withError:]( self,  "_scanExtensionKitDirectory:withError:",  v10,  &v15);
        id v12 = v15;
        if (!v11)
        {
          -[MIFilesystemScanner delegate](self, "delegate");
          int v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 errorOccurred:v12];
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return 1;
}

- (BOOL)_scanBundleContainersWithClass:(unint64_t)a3 withError:(id *)a4 ignoredErrorOccurredOnOneOrMoreItems:(BOOL *)a5
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v9 = (void *)MEMORY[0x186E26FA4](self, a2);
  v37 = self;
  -[MIFilesystemScanner personaUniqueString](self, "personaUniqueString");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v45 = 0LL;
    BOOL v11 = (id *)&v45;
    uint64_t v12 = +[MIContainer containersWithClass:personaUniqueString:error:]( &OBJC_CLASS___MIBundleContainer,  "containersWithClass:personaUniqueString:error:",  a3,  v10,  &v45);
  }

  else
  {
    uint64_t v44 = 0LL;
    BOOL v11 = (id *)&v44;
    uint64_t v12 = +[MIContainer containersWithClass:error:](&OBJC_CLASS___MIBundleContainer, "containersWithClass:error:", a3, &v44);
  }

  int v13 = (void *)v12;
  id v15 = *v11;
  if (v13)
  {
    v32 = v10;
    v38 = -[MIFilesystemScanner delegate](v37, "delegate");
    context = v9;
    v34 = v13;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id obj = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v36 = 0LL;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(obj);
          }
          __int128 v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v21 = (void *)MEMORY[0x186E26FA4]();
          [v20 bundle];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            [v20 bundle];
            id v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MIFilesystemScanner personaUniqueString](v37, "personaUniqueString");
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            id v39 = v15;
            char v25 = [v38 scanExecutableBundle:v23 inContainer:v20 forPersona:v24 withError:&v39];
            id v26 = v39;

            if ((v25 & 1) != 0)
            {
              ++v36;
            }

            else if (a5)
            {
              *a5 = 1;
            }

            id v15 = v26;
          }

          else
          {
            if (a5) {
              *a5 = 1;
            }
            [v20 identifier];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"-[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:]",  288LL,  @"MIInstallerErrorDomain",  36LL,  0LL,  0LL,  @"No bundle found in container %@; skipping.",
              v28,
              (uint64_t)v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            [v38 errorOccurred:v29];
          }

          objc_autoreleasePoolPop(v21);
        }

        uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }

      while (v17);
    }

    objc_autoreleasePoolPop(context);
    int v13 = v34;
  }

  else
  {
    _CreateAndLogError( (uint64_t)"-[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:]",  275LL,  @"MIInstallerErrorDomain",  4LL,  v15,  0LL,  @"Failed to scan for bundle containers of content class %ld",  v14,  a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
    if (a4)
    {
      id v15 = v30;
      *a4 = v15;
    }

    else
    {
      id v15 = v30;
    }
  }

  return v13 != 0LL;
}

- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3 personaUniqueString:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIFilesystemScanner;
  uint64_t v8 = -[MIFilesystemScanner init](&v11, sel_init);
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_options = a3;
    objc_storeStrong((id *)&v8->_personaUniqueString, a4);
  }

  return v9;
}

- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 primaryPersonaString];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[MIFilesystemScanner initWithScanOptions:personaUniqueString:]( self,  "initWithScanOptions:personaUniqueString:",  a3,  v6);

  return v7;
}

- (MIFilesystemScanner)init
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 primaryPersonaString];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[MIFilesystemScanner initWithScanOptions:personaUniqueString:]( self,  "initWithScanOptions:personaUniqueString:",  3967LL,  v4);

  return v5;
}

- (BOOL)performScanWithError:(id *)a3
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  v4 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager", a3);
  v80 = -[MIFilesystemScanner delegate](self, "delegate");
  __int16 v5 = -[MIFilesystemScanner options](self, "options");
  if ((v5 & 1) != 0)
  {
    id v101 = 0LL;
    BOOL v7 = -[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:]( self,  "_scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:",  1LL,  &v101,  0LL);
    id v6 = v101;
    if (!v7) {
      [v80 errorOccurred:v6];
    }
  }

  else
  {
    id v6 = 0LL;
  }

  v79 = self;
  if ((v5 & 2) == 0)
  {
    id v8 = v6;
    if ((v5 & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_23:
    id v12 = v8;
    if ((v5 & 8) != 0) {
      goto LABEL_10;
    }
LABEL_24:
    id v16 = v12;
    if ((v5 & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    id v20 = v16;
    if ((v5 & 0x10) != 0) {
      goto LABEL_16;
    }
    goto LABEL_26;
  }

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 systemAppsDirectory];
  char v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v100 = v6;
  BOOL v26 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v25, &v100);
  id v8 = v100;

  if (!v26) {
    [v80 errorOccurred:v8];
  }
  if ((v5 & 0x20) == 0) {
    goto LABEL_23;
  }
LABEL_7:
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 coreServicesDirectory];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v99 = v8;
  BOOL v11 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v10, &v99);
  id v12 = v99;

  if (!v11) {
    [v80 errorOccurred:v12];
  }
  if ((v5 & 8) == 0) {
    goto LABEL_24;
  }
LABEL_10:
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 internalAppsDirectory];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v98 = v12;
  BOOL v15 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v14, &v98);
  id v16 = v98;

  if (!v15) {
    [v80 errorOccurred:v16];
  }
  if ((v5 & 0x40) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 systemAppPlaceholdersDirectory];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v97 = v16;
  BOOL v19 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v18, &v97);
  id v20 = v97;

  if (!v19) {
    [v80 errorOccurred:v20];
  }
  if ((v5 & 0x10) != 0)
  {
LABEL_16:
    id v96 = v20;
    BOOL v21 = -[MIFilesystemScanner _scanFrameworksLocationsWithError:](self, "_scanFrameworksLocationsWithError:", &v96);
    id v22 = v96;

    if (!v21) {
      [v80 errorOccurred:v22];
    }
    if ((v5 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

- (MIFilesystemScannerDelegate)delegate
{
  return (MIFilesystemScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
}

@end