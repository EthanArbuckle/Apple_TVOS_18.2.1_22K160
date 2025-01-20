@interface SKFilesystem
+ (BOOL)_shouldShowFilesystemWithType:(id)a3 key:(id)a4 personality:(id)a5;
+ (NSArray)allFilesystems;
+ (NSArray)extensionFilesystems;
+ (NSArray)installedFilesystems;
+ (NSMutableDictionary)cachedFilesystems;
+ (NSMutableDictionary)extensionFilesystemsMapping;
+ (NSMutableDictionary)installedFilesystemsMapping;
+ (id)_skfilesystemTypeWithPersonality:(id)a3;
+ (id)buildSpecialFilesystems;
+ (id)collectFilesystemsWithPersonalityMapping:(id)a3;
+ (id)fileSystems3rdPartyWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5;
+ (id)fileSystemsAPFSWithPersonalityKey:(id)a3 bundle:(id)a4;
+ (id)fileSystemsHFSWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5;
+ (id)filesystemFor:(id)a3;
+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4;
+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5;
+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5 isExtension:(BOOL)a6;
+ (id)filesystemsFromBundle:(id)a3;
+ (id)filesystemsWithBundle:(id)a3 filesystemPersonality:(id)a4 userVisibleName:(id)a5;
+ (id)getExtensionFilesystems;
+ (void)setCachedFilesystems:(id)a3;
- (BOOL)defaultEffaceable;
- (BOOL)isCaseSensitive;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtension;
- (BOOL)isExtensionInsensitiveEqual:(id)a3;
- (BOOL)isJournaled;
- (BOOL)isValidName:(id)a3 error:(id *)a4;
- (BOOL)shouldShow;
- (NSBundle)bundle;
- (NSString)contentMask;
- (NSString)dmPersonality;
- (NSString)formatArgs;
- (NSString)liveVerificationArgs;
- (NSString)localizedKey;
- (NSString)localizedName;
- (NSString)majorType;
- (NSString)repairArgs;
- (NSString)type;
- (NSString)unlocalizedEncryptedName;
- (NSString)unlocalizedName;
- (NSString)verificationArgs;
- (NSString)xmlOutputArg;
- (NSURL)formatExecutable;
- (NSURL)repairExecutable;
- (NSURL)verificationExecutable;
- (SKFilesystem)initWithDictionaryRepresentation:(id)a3;
- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 caseSensitive:(BOOL)a7 encrypted:(BOOL)a8 personalityKey:(id)a9 sortPriority:(int)a10;
- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 encrypted:(BOOL)a7 personalityKey:(id)a8 sortPriority:(int)a9;
- (SKFilesystem)initWithSpecialFilesystem:(id)a3 majorType:(id)a4 localizedName:(id)a5;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initEncryptedFSWithUnencryptedFS:(id)a3 localizedName:(id)a4 sortPriority:(int)a5;
- (int)sortPriority;
- (unint64_t)minimumSize;
- (void)setContentMask:(id)a3;
- (void)setDefaultEffaceable:(BOOL)a3;
- (void)setDmPersonality:(id)a3;
- (void)setIsCaseSensitive:(BOOL)a3;
- (void)setIsEncrypted:(BOOL)a3;
- (void)setIsJournaled:(BOOL)a3;
- (void)setLocalizedKey:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMajorType:(id)a3;
- (void)setMinimumSize:(unint64_t)a3;
- (void)setShouldShow:(BOOL)a3;
- (void)setSortPriority:(int)a3;
- (void)setType:(id)a3;
- (void)setUnlocalizedEncryptedName:(id)a3;
- (void)setUnlocalizedName:(id)a3;
@end

@implementation SKFilesystem

+ (NSArray)allFilesystems
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__SKFilesystem_allFilesystems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allFilesystems_onceToken != -1) {
    dispatch_once(&allFilesystems_onceToken, block);
  }
  return (NSArray *)(id)_allFilesystems;
}

void __30__SKFilesystem_allFilesystems__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) extensionFilesystems];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 arrayByAddingObjectsFromArray:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v4 mutableCopy];

  [v5 sortWithOptions:16 usingComparator:&__block_literal_global_2];
  v6 = (void *)_allFilesystems;
  _allFilesystems = (uint64_t)v5;
}

uint64_t __30__SKFilesystem_allFilesystems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortPriority];
  if (v6 >= (int)[v5 sortPriority])
  {
    int v8 = [v4 sortPriority];
    uint64_t v7 = v8 > (int)[v5 sortPriority];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

+ (NSMutableDictionary)extensionFilesystemsMapping
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (_extensionFilesystemsMapping && [(id)_extensionFilesystemsMapping count])
  {
    id v3 = (id)_extensionFilesystemsMapping;
    objc_sync_exit(v2);
  }

  else
  {
    uint64_t v4 = +[SKFilesystem getExtensionFilesystems](&OBJC_CLASS___SKFilesystem, "getExtensionFilesystems");
    id v5 = (void *)_extensionFilesystemsMapping;
    _extensionFilesystemsMapping = v4;

    objc_sync_exit(v2);
    id v3 = (id)_extensionFilesystemsMapping;
  }

  return (NSMutableDictionary *)v3;
}

+ (NSArray)extensionFilesystems
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (_extensionFilesystems && [(id)_extensionFilesystems count])
  {
    id v4 = (id)_extensionFilesystems;
    objc_sync_exit(v3);
  }

  else
  {
    [a1 extensionFilesystemsMapping];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = +[SKFilesystem collectFilesystemsWithPersonalityMapping:]( &OBJC_CLASS___SKFilesystem,  "collectFilesystemsWithPersonalityMapping:",  v5);
    uint64_t v7 = (void *)_extensionFilesystems;
    _extensionFilesystems = v6;

    objc_sync_exit(v3);
    id v4 = (id)_extensionFilesystems;
  }

  return (NSArray *)v4;
}

+ (NSMutableDictionary)installedFilesystemsMapping
{
  if (installedFilesystemsMapping_onceToken != -1) {
    dispatch_once(&installedFilesystemsMapping_onceToken, &__block_literal_global_13);
  }
  return (NSMutableDictionary *)(id)_installedFilesystemsMapping;
}

void __43__SKFilesystem_installedFilesystemsMapping__block_invoke()
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604030] fileURLWithPath:@"/System/Library/Filesystems"];
  v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  BundlesFromDirectory = CFBundleCreateBundlesFromDirectory(0LL, v2, @"fs");
  if (BundlesFromDirectory)
  {
    id v4 = BundlesFromDirectory;
    if (CFArrayGetCount(BundlesFromDirectory) >= 1)
    {
      CFIndex v5 = 0LL;
      do
      {
        ValueAtIndex = (__CFBundle *)CFArrayGetValueAtIndex(v4, v5);
        uint64_t v7 = (void *)MEMORY[0x1896077F8];
        CFURLRef v8 = CFBundleCopyBundleURL(ValueAtIndex);
        [v7 bundleWithURL:v8];
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        [v9 bundlePath];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 hasSuffix:@"apfs_userfs.fs"];

        if ((v11 & 1) == 0) {
          [v1 addObject:v9];
        }

        ++v5;
      }

      while (v5 < CFArrayGetCount(v4));
    }

    CFRelease(v4);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = v1;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    uint64_t v16 = *MEMORY[0x189604E10];
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(id *)(*((void *)&v23 + 1) + 8 * v17);
        objc_msgSend(v18, "infoDictionary", (void)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 objectForKey:v16];
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = +[SKFilesystem filesystemsFromBundle:](&OBJC_CLASS___SKFilesystem, "filesystemsFromBundle:", v18);
          [v0 setObject:v21 forKeyedSubscript:v20];
        }

        ++v17;
      }

      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v14);
  }

  v22 = (void *)_installedFilesystemsMapping;
  _installedFilesystemsMapping = (uint64_t)v0;
}

+ (NSArray)installedFilesystems
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__SKFilesystem_installedFilesystems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (installedFilesystems_onceToken != -1) {
    dispatch_once(&installedFilesystems_onceToken, block);
  }
  return (NSArray *)(id)_installedFilesystems;
}

void __36__SKFilesystem_installedFilesystems__block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[SKFilesystem collectFilesystemsWithPersonalityMapping:]( &OBJC_CLASS___SKFilesystem,  "collectFilesystemsWithPersonalityMapping:",  v3);
  v2 = (void *)_installedFilesystems;
  _installedFilesystems = v1;
}

+ (id)collectFilesystemsWithPersonalityMapping:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  objc_msgSend(v3, "allValues", 0);
  CFIndex v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObjectsFromArray:*(void *)(*((void *)&v12 + 1) + 8 * v9++)];
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
  v10 = +[SKFilesystem buildSpecialFilesystems](&OBJC_CLASS___SKFilesystem, "buildSpecialFilesystems");
  [v4 addObjectsFromArray:v10];

  [v4 sortWithOptions:16 usingComparator:&__block_literal_global_18];
  return v4;
}

uint64_t __57__SKFilesystem_collectFilesystemsWithPersonalityMapping___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortPriority];
  if (v6 >= (int)[v5 sortPriority])
  {
    int v8 = [v4 sortPriority];
    uint64_t v7 = v8 > (int)[v5 sortPriority];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

+ (id)getExtensionFilesystems
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v18 = (id)objc_opt_new();
  uint64_t v17 = (void *)objc_opt_new();
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  id v31 = (id)objc_opt_new();
  if (v17)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __39__SKFilesystem_getExtensionFilesystems__block_invoke;
    v23[3] = &unk_18A323540;
    __int128 v25 = &v26;
    id v3 = v2;
    __int128 v24 = v3;
    [v17 installedExtensionsSync:v23];
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = (id)v27[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = (void *)MEMORY[0x1896077F8];
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v7), "url", v17);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 bundleWithURL:v9];
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          [v10 infoDictionary];
          char v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 objectForKeyedSubscript:kExtensionAttributesKey];
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            [v12 objectForKeyedSubscript:@"FSShortName"];
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v14 = v13;
            if (v13 && ([v13 isEqualToString:@"hfs"] & 1) == 0)
            {
              +[SKFilesystem filesystemsFromBundle:](&OBJC_CLASS___SKFilesystem, "filesystemsFromBundle:", v10);
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 setObject:v15 forKeyedSubscript:v14];
            }
          }
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v32 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __39__SKFilesystem_getExtensionFilesystems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_25];

    SKGetOSLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_188F75000, v9, OS_LOG_TYPE_FAULT, "Failed to get extensions %@", (uint8_t *)&v10, 0xCu);
    }
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __39__SKFilesystem_getExtensionFilesystems__block_invoke_2()
{
  v4[1] = *MEMORY[0x1895F89C0];
  id v3 = @"faultCode";
  base64Encode((uint64_t)"SKFilesystem.m", 221LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (NSMutableDictionary)cachedFilesystems
{
  dispatch_semaphore_t v2 = (void *)_cachedFilesystems;
  if (!_cachedFilesystems)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)_cachedFilesystems;
    _cachedFilesystems = v3;

    dispatch_semaphore_t v2 = (void *)_cachedFilesystems;
  }

  return (NSMutableDictionary *)v2;
}

+ (void)setCachedFilesystems:(id)a3
{
}

- (SKFilesystem)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___SKFilesystem;
  uint64_t v5 = -[SKFilesystem init](&v51, sel_init);
  if (v5)
  {
    [v4 objectForKey:@"localizedKey"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      [v4 objectForKey:@"localizedKey"];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKFilesystem setLocalizedKey:](v5, "setLocalizedKey:", v7);

      +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKFilesystem localizedKey](v5, "localizedKey");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 localizedStringForKey:v9 value:&stru_18A323F58 table:0];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKFilesystem setLocalizedName:](v5, "setLocalizedName:", v10);
    }

    else
    {
      [v4 objectForKey:@"localizedName"];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKFilesystem setLocalizedName:](v5, "setLocalizedName:", v8);
    }

    [v4 objectForKey:@"type"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setType:](v5, "setType:", v11);

    [v4 objectForKey:@"majorType"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setMajorType:](v5, "setMajorType:", v12);

    [v4 objectForKey:@"isEncrypted"];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setIsEncrypted:](v5, "setIsEncrypted:", [v13 BOOLValue]);

    [v4 objectForKey:@"defaultEffaceable"];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setDefaultEffaceable:](v5, "setDefaultEffaceable:", [v14 BOOLValue]);

    [v4 objectForKey:@"isCaseSensitive"];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setIsCaseSensitive:](v5, "setIsCaseSensitive:", [v15 BOOLValue]);

    [v4 objectForKey:@"isJournaled"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setIsJournaled:](v5, "setIsJournaled:", [v16 BOOLValue]);

    [v4 objectForKey:@"shouldShow"];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setShouldShow:](v5, "setShouldShow:", [v17 BOOLValue]);

    [v4 objectForKey:@"dmPersonality"];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setDmPersonality:](v5, "setDmPersonality:", v18);

    [v4 objectForKey:@"sortPriority"];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setSortPriority:](v5, "setSortPriority:", [v19 intValue]);

    [v4 objectForKey:@"minimumSize"];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setMinimumSize:](v5, "setMinimumSize:", [v20 unsignedLongLongValue]);

    [v4 objectForKey:@"unlocalizedName"];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setUnlocalizedName:](v5, "setUnlocalizedName:", v21);

    [v4 objectForKey:@"unlocalizedEncryptedName"];
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setUnlocalizedEncryptedName:](v5, "setUnlocalizedEncryptedName:", v22);

    [v4 objectForKey:@"contentMask"];
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setContentMask:](v5, "setContentMask:", v23);

    uint64_t v24 = [v4 objectForKey:@"formatArgs"];
    formatArgs = v5->_formatArgs;
    v5->_formatArgs = (NSString *)v24;

    uint64_t v26 = (void *)MEMORY[0x189604030];
    [v4 objectForKey:@"formatExecutable"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v26 URLWithString:v27];
    formatExecutable = v5->_formatExecutable;
    v5->_formatExecutable = (NSURL *)v28;

    uint64_t v30 = [v4 objectForKey:@"repairArgs"];
    repairArgs = v5->_repairArgs;
    v5->_repairArgs = (NSString *)v30;

    v32 = (void *)MEMORY[0x189604030];
    [v4 objectForKey:@"repairExecutable"];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = [v32 URLWithString:v33];
    repairExecutable = v5->_repairExecutable;
    v5->_repairExecutable = (NSURL *)v34;

    uint64_t v36 = [v4 objectForKey:@"verificationArgs"];
    verificationArgs = v5->_verificationArgs;
    v5->_verificationArgs = (NSString *)v36;

    uint64_t v38 = [v4 objectForKey:@"liveVerificationArgs"];
    liveVerificationArgs = v5->_liveVerificationArgs;
    v5->_liveVerificationArgs = (NSString *)v38;

    v40 = (void *)MEMORY[0x189604030];
    [v4 objectForKey:@"verificationExecutable"];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v42 = [v40 URLWithString:v41];
    verificationExecutable = v5->_verificationExecutable;
    v5->_verificationExecutable = (NSURL *)v42;

    uint64_t v44 = [v4 objectForKey:@"xmlOutputArg"];
    xmlOutputArg = v5->_xmlOutputArg;
    v5->_xmlOutputArg = (NSString *)v44;

    v46 = (void *)MEMORY[0x1896077F8];
    [v4 objectForKey:@"bundle"];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = [v46 bundleWithPath:v47];
    bundle = v5->_bundle;
    v5->_bundle = (NSBundle *)v48;
  }

  return v5;
}

- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 encrypted:(BOOL)a7 personalityKey:(id)a8 sortPriority:(int)a9
{
  BOOL v9 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  getPersonalityDict(v18, v15);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = a9;
  __int128 v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:]( self,  "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:",  v19,  v18,  v17,  v16,  getCaseSensitive(v20, v15),  v9,  v15,  v23);

  return v21;
}

- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 caseSensitive:(BOOL)a7 encrypted:(BOOL)a8 personalityKey:(id)a9 sortPriority:(int)a10
{
  BOOL v10 = a8;
  BOOL v66 = a7;
  id v69 = a3;
  id obj = a4;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___SKFilesystem;
  id v19 = -[SKFilesystem init](&v70, sel_init);
  [v15 infoDictionary];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 objectForKey:*MEMORY[0x189604E10]];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  [v68 componentsSeparatedByString:@"."];
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 lastObject];
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v23 = v15;
  getPersonalityDict(v15, v18);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v65 = v20;
    -[SKFilesystem setLocalizedName:](v19, "setLocalizedName:", v16);
    -[SKFilesystem setLocalizedKey:](v19, "setLocalizedKey:", v17);
    [v24 objectForKeyedSubscript:@"FSName"];
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v25);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setUnlocalizedName:](v19, "setUnlocalizedName:", v26);

    [v24 objectForKeyedSubscript:@"FSEncryptionName"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v27);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setUnlocalizedEncryptedName:](v19, "setUnlocalizedEncryptedName:", v28);

    -[SKFilesystem setType:](v19, "setType:", v69);
    v29 = v22;
    -[SKFilesystem setMajorType:](v19, "setMajorType:", v22);
    -[SKFilesystem setIsCaseSensitive:](v19, "setIsCaseSensitive:", v66);
    -[SKFilesystem setIsEncrypted:](v19, "setIsEncrypted:", v10);
    -[SKFilesystem setDefaultEffaceable:](v19, "setDefaultEffaceable:", v10 ^ 1);
    [v24 objectForKeyedSubscript:@"FSFormatMinimumSize"];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setMinimumSize:](v19, "setMinimumSize:", NSNumberToULongLong(v30));

    -[SKFilesystem setSortPriority:](v19, "setSortPriority:", a10);
    -[SKFilesystem setDmPersonality:](v19, "setDmPersonality:", v18);
    [v24 objectForKeyedSubscript:@"FSFormatContentMask"];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setContentMask:](v19, "setContentMask:", v32);

    [v24 objectForKeyedSubscript:@"FSRepairArguments"];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = NSStringOrEmpty(v33);
    repairArgs = v19->_repairArgs;
    v19->_repairArgs = (NSString *)v34;

    [v23 resourceURL];
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 objectForKeyedSubscript:@"FSRepairExecutable"];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v37);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = [v36 URLByAppendingPathComponent:v38];
    repairExecutable = v19->_repairExecutable;
    v19->_repairExecutable = (NSURL *)v39;

    [v24 objectForKeyedSubscript:@"FSFormatArguments"];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v42 = NSStringOrEmpty(v41);
    formatArgs = v19->_formatArgs;
    v19->_formatArgs = (NSString *)v42;

    [v23 resourceURL];
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 objectForKeyedSubscript:@"FSFormatExecutable"];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v47 = [v44 URLByAppendingPathComponent:v46];
    formatExecutable = v19->_formatExecutable;
    v19->_formatExecutable = (NSURL *)v47;

    [v24 objectForKeyedSubscript:@"FSVerificationArguments"];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = NSStringOrEmpty(v49);
    verificationArgs = v19->_verificationArgs;
    v19->_verificationArgs = (NSString *)v50;

    [v24 objectForKeyedSubscript:@"FSLiveVerificationArguments"];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v53 = NSStringOrEmpty(v52);
    liveVerificationArgs = v19->_liveVerificationArgs;
    v19->_liveVerificationArgs = (NSString *)v53;

    [v23 resourceURL];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 objectForKeyedSubscript:@"FSVerificationExecutable"];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v58 = [v55 URLByAppendingPathComponent:v57];
    verificationExecutable = v19->_verificationExecutable;
    v19->_verificationExecutable = (NSURL *)v58;

    [v24 objectForKeyedSubscript:@"FSXMLOutputArgument"];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v61 = NSStringOrEmpty(v60);
    xmlOutputArg = v19->_xmlOutputArg;
    v19->_xmlOutputArg = (NSString *)v61;

    objc_storeStrong((id *)&v19->_bundle, obj);
    if (+[SKFilesystem _shouldShowFilesystemWithType:key:personality:]( &OBJC_CLASS___SKFilesystem,  "_shouldShowFilesystemWithType:key:personality:",  v29,  v18,  v24))
    {
      __int128 v22 = v29;
      uint64_t v63 = 1LL;
    }

    else
    {
      __int128 v22 = v29;
      if (-[SKFilesystem isExtension](v19, "isExtension")) {
        uint64_t v63 = [v29 isEqualToString:@"apfs"];
      }
      else {
        uint64_t v63 = 0LL;
      }
    }

    __int128 v20 = v65;
    -[SKFilesystem setShouldShow:](v19, "setShouldShow:", v63);
  }

  return v19;
}

- (id)initEncryptedFSWithUnencryptedFS:(id)a3 localizedName:(id)a4 sortPriority:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  [v8 dictionaryRepresentation];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = -[SKFilesystem initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v10);
  uint64_t v12 = v11;
  if (v11)
  {
    -[SKFilesystem setIsEncrypted:](v11, "setIsEncrypted:", 1LL);
    -[SKFilesystem setDefaultEffaceable:](v12, "setDefaultEffaceable:", 0LL);
    -[SKFilesystem setLocalizedName:](v12, "setLocalizedName:", v9);
    __int128 v13 = (void *)NSString;
    [v8 localizedKey];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 stringWithFormat:@"%@ Encrypted", v14];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setLocalizedKey:](v12, "setLocalizedKey:", v15);

    -[SKFilesystem setSortPriority:](v12, "setSortPriority:", v5);
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKFilesystem localizedName](self, "localizedName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SKFilesystem localizedName](self, "localizedName");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKey:@"localizedName"];
  }

  -[SKFilesystem localizedKey](self, "localizedKey");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKFilesystem localizedKey](self, "localizedKey");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKey:@"localizedKey"];
  }

  -[SKFilesystem type](self, "type");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKey:@"type"];

  -[SKFilesystem majorType](self, "majorType");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SKFilesystem majorType](self, "majorType");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v10 forKey:@"majorType"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKFilesystem isEncrypted](self, "isEncrypted"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v11 forKey:@"isEncrypted"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKFilesystem defaultEffaceable](self, "defaultEffaceable"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v12 forKey:@"defaultEffaceable"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKFilesystem isCaseSensitive](self, "isCaseSensitive"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKey:@"isCaseSensitive"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKFilesystem shouldShow](self, "shouldShow"));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v14 forKey:@"shouldShow"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKFilesystem isJournaled](self, "isJournaled"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v15 forKey:@"isJournaled"];

  -[SKFilesystem dmPersonality](self, "dmPersonality");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v16 forKey:@"dmPersonality"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[SKFilesystem sortPriority](self, "sortPriority"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v17 forKey:@"sortPriority"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKFilesystem minimumSize](self, "minimumSize"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v18 forKey:@"minimumSize"];

  -[SKFilesystem unlocalizedName](self, "unlocalizedName");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v19 forKey:@"unlocalizedName"];

  -[SKFilesystem unlocalizedEncryptedName](self, "unlocalizedEncryptedName");
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v20 forKey:@"unlocalizedEncryptedName"];

  -[SKFilesystem contentMask](self, "contentMask");
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v21 forKey:@"contentMask"];

  -[SKFilesystem formatArgs](self, "formatArgs");
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v22 forKey:@"formatArgs"];

  -[SKFilesystem formatExecutable](self, "formatExecutable");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 absoluteString];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v24 forKey:@"formatExecutable"];

  -[SKFilesystem repairArgs](self, "repairArgs");
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v25 forKey:@"repairArgs"];

  -[SKFilesystem repairExecutable](self, "repairExecutable");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 absoluteString];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v27 forKey:@"repairExecutable"];

  -[SKFilesystem verificationArgs](self, "verificationArgs");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v28 forKey:@"verificationArgs"];
  v29 = -[SKFilesystem liveVerificationArgs](self, "liveVerificationArgs");
  [v3 setValue:v29 forKey:@"liveVerificationArgs"];

  -[SKFilesystem verificationExecutable](self, "verificationExecutable");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 absoluteString];
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v31 forKey:@"verificationExecutable"];
  v32 = -[SKFilesystem xmlOutputArg](self, "xmlOutputArg");
  [v3 setValue:v32 forKey:@"xmlOutputArg"];

  -[SKFilesystem bundle](self, "bundle");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 bundlePath];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v34 forKey:@"bundle"];

  return v3;
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  -[SKFilesystem localizedName](self, "localizedName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = -[SKFilesystem shouldShow](self, "shouldShow");
  id v6 = @"NO";
  if (v5) {
    id v6 = @"YES";
  }
  [v3 stringWithFormat:@"%@ - Show: %@", v4, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isExtensionInsensitiveEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    -[SKFilesystem type](self, "type");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 type];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isEqualToString:v7])
    {
      -[SKFilesystem dmPersonality](self, "dmPersonality");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 dmPersonality];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v8 isEqualToString:v9]
        && (int v10 = -[SKFilesystem isEncrypted](self, "isEncrypted"), v10 == [v5 isEncrypted])
        && (int v11 = -[SKFilesystem defaultEffaceable](self, "defaultEffaceable"),
            v11 == [v5 defaultEffaceable])
        && (int v12 = -[SKFilesystem isJournaled](self, "isJournaled"), v12 == [v5 isJournaled]))
      {
        BOOL v15 = -[SKFilesystem isCaseSensitive](self, "isCaseSensitive");
        int v13 = v15 ^ [v5 isCaseSensitive] ^ 1;
      }

      else
      {
        LOBYTE(v13) = 0;
      }
    }

    else
    {
      LOBYTE(v13) = 0;
    }
  }

  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (-[SKFilesystem isExtensionInsensitiveEqual:](self, "isExtensionInsensitiveEqual:", v4))
  {
    BOOL v5 = -[SKFilesystem isExtension](self, "isExtension");
    int v6 = v5 ^ [v4 isExtension] ^ 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5 isExtension:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  [NSString stringWithFormat:@"%@_%d_%d_%d", v10, v8, v7, v6];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 cachedFilesystems];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKey:v11];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    __int128 v14 = -[SKFilesystem initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___SKFilesystem),  "initWithDictionaryRepresentation:",  v13);
    goto LABEL_26;
  }

  id v39 = a1;
  if ([v10 isEqualToString:@"apfs"])
  {
    BOOL v15 = @"apfs.fs";
  }

  else if ([v10 isEqualToString:@"hfs"])
  {
    BOOL v15 = @"hfs.fs";
  }

  else if ([v10 isEqualToString:@"msdos"])
  {
    BOOL v15 = @"msdos.fs";
  }

  else if ([v10 isEqualToString:@"exfat"])
  {
    BOOL v15 = @"exfat.fs";
  }

  else
  {
    if (![v10 isEqualToString:@"free"])
    {
      __int128 v14 = 0LL;
      goto LABEL_26;
    }

    BOOL v15 = &stru_18A323F58;
  }

  +[SKFilesystem getExtensionFilesystems](&OBJC_CLASS___SKFilesystem, "getExtensionFilesystems");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v16;
  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v18 = [v16 objectForKeyedSubscript:v10];
  if (!v18) {
    goto LABEL_18;
  }
  v37 = (void *)v18;
  [v17 objectForKeyedSubscript:v10];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_134];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 filteredArrayUsingPredicate:v20];
  uint64_t v38 = v15;
  __int128 v21 = v17;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = [v22 count];

  id v17 = v21;
  BOOL v15 = v38;

  if (v36)
  {
    [v17 objectForKeyedSubscript:v10];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
LABEL_20:
      [v17 objectForKeyedSubscript:v10];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        uint64_t v28 = [v17 objectForKeyedSubscript:v10];

        uint64_t v23 = (void *)v28;
      }

      goto LABEL_22;
    }
  }

  else
  {
LABEL_18:
    [NSString stringWithFormat:@"%@/%@", @"/System/Library/Filesystems", v15];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896077F8] bundleWithPath:v24];
    __int128 v25 = v17;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKFilesystem filesystemsFromBundle:](&OBJC_CLASS___SKFilesystem, "filesystemsFromBundle:", v26);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

    id v17 = v25;
    if (!v23) {
      goto LABEL_20;
    }
  }

  if (![v23 count]) {
    goto LABEL_20;
  }
LABEL_22:
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_2;
  v40[3] = &__block_descriptor_35_e39_B24__0__SKFilesystem_8__NSDictionary_16l;
  BOOL v41 = v7;
  BOOL v42 = v8;
  BOOL v43 = v6;
  [MEMORY[0x1896079C8] predicateWithBlock:v40];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 filteredArrayUsingPredicate:v29];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v30 count])
  {
    [v30 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_138];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 cachedFilesystems];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 objectAtIndexedSubscript:0];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 dictionaryRepresentation];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 setValue:v34 forKey:v11];

    [v31 objectAtIndexedSubscript:0];
    __int128 v14 = (SKFilesystem *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v14 = 0LL;
  }

LABEL_26:
  return v14;
}

uint64_t __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 shouldShow];
}

BOOL __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_2( unsigned __int8 *a1,  void *a2)
{
  id v3 = a2;
  BOOL v4 = a1[32] == [v3 isEncrypted]

  return v4;
}

uint64_t __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortPriority];
  if (v6 >= (int)[v5 sortPriority])
  {
    int v8 = [v4 sortPriority];
    uint64_t v7 = v8 > (int)[v5 sortPriority];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if ([v7 isEqualToString:@"msdos"]) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = [v7 isEqualToString:@"exfat"];
  }
  +[SKFilesystem filesystemFor:caseSensitive:encrypted:isExtension:]( &OBJC_CLASS___SKFilesystem,  "filesystemFor:caseSensitive:encrypted:isExtension:",  v7,  v6,  v5,  v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4
{
  return +[SKFilesystem filesystemFor:caseSensitive:encrypted:]( &OBJC_CLASS___SKFilesystem,  "filesystemFor:caseSensitive:encrypted:",  a3,  a4,  0LL);
}

+ (id)filesystemFor:(id)a3
{
  return +[SKFilesystem filesystemFor:caseSensitive:]( &OBJC_CLASS___SKFilesystem,  "filesystemFor:caseSensitive:",  a3,  0LL);
}

+ (id)fileSystemsHFSWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5
{
  v71[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  getPersonalityDict(v8, v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 infoDictionary];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:*MEMORY[0x189604E10]];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 componentsSeparatedByString:@"."];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 lastObject];

  BOOL v66 = v10;
  uint64_t CaseSensitive = getCaseSensitive(v10, v7);
  v64 = (void *)v13;
  if ([v7 isEqualToString:@"Journaled HFS+"])
  {
    BOOL v15 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    id v16 = v8;
    id v17 = kSKDiskFileSystemHFS[0];
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v61 = v9;
    [v18 localizedStringForKey:@"HFS Generic" value:&stru_18A323F58 table:0];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 2;
    __int128 v20 = v17;
    id v8 = v16;
    __int128 v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:]( v15,  "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:",  v20,  v16,  v19,  @"HFS Generic",  CaseSensitive,  0LL,  v7,  v60);

    -[SKFilesystem setIsJournaled:](v21, "setIsJournaled:", 1LL);
    __int128 v22 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 localizedStringForKey:@"HFS Generic Encrypted" value:&stru_18A323F58 table:0];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:]( v22,  "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:",  v21,  v24,  3LL);

    id v9 = v61;
    v71[0] = v21;
    v71[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x189603F18];
    v27 = v71;
LABEL_9:
    [v26 arrayWithObjects:v27 count:2];
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }

  if ([v7 isEqualToString:@"Case-sensitive Journaled HFS+"])
  {
    uint64_t v28 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    v29 = kSKDiskFileSystemHFS[0];
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    id v30 = v9;
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 localizedStringForKey:@"HFS Case-sensitive" value:&stru_18A323F58 table:0];
    id v32 = v8;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 4;
    __int128 v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:]( v28,  "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:",  v29,  v32,  v33,  @"HFS Case-sensitive",  CaseSensitive,  0LL,  v7,  v60);

    id v8 = v32;
    -[SKFilesystem setIsJournaled:](v21, "setIsJournaled:", 1LL);
    uint64_t v34 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    v35 = +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    [v35 localizedStringForKey:@"HFS Case-sensitive Encrypted" value:&stru_18A323F58 table:0];
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:]( v34,  "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:",  v21,  v36,  5LL);

    id v9 = v30;
    v70[0] = v21;
    v70[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x189603F18];
    v27 = v70;
    goto LABEL_9;
  }

  if ([v7 isEqualToString:@"HFS+"])
  {
    uint64_t v37 = CaseSensitive;
    uint64_t v38 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    +[SKFilesystem _skfilesystemTypeWithPersonality:]( &OBJC_CLASS___SKFilesystem,  "_skfilesystemTypeWithPersonality:",  v7);
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    id v62 = v9;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 localizedStringForKey:@"HFS Not Journaled" value:&stru_18A323F58 table:0];
    id v41 = v8;
    BOOL v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 8;
    __int128 v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:]( v38,  "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:",  v39,  v41,  v42,  @"HFS Not Journaled",  v37,  0LL,  v7,  v60);

    id v8 = v41;
    BOOL v43 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 localizedStringForKey:@"HFS Not Journaled Encrypted" value:&stru_18A323F58 table:0];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:]( v43,  "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:",  v21,  v45,  8LL);

    id v9 = v62;
    v69[0] = v21;
    v69[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x189603F18];
    v27 = v69;
    goto LABEL_9;
  }

  if ([v7 isEqualToString:@"Case-sensitive HFS+"])
  {
    uint64_t v46 = CaseSensitive;
    uint64_t v47 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    +[SKFilesystem _skfilesystemTypeWithPersonality:]( &OBJC_CLASS___SKFilesystem,  "_skfilesystemTypeWithPersonality:",  v7);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    id v63 = v9;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 localizedStringForKey:@"HFS Case-sensitive Not Journaled" value:&stru_18A323F58 table:0];
    id v50 = v8;
    objc_super v51 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 8;
    __int128 v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:]( v47,  "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:",  v48,  v50,  v51,  @"HFS Case-sensitive Not Journaled",  v46,  0LL,  v7,  v60);

    id v8 = v50;
    v52 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 localizedStringForKey:@"HFS Case-sensitive Not Journaled Encrypted" value:&stru_18A323F58 table:0];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:]( v52,  "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:",  v21,  v54,  8LL);

    id v9 = v63;
    v68[0] = v21;
    v68[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x189603F18];
    v27 = v68;
    goto LABEL_9;
  }

  if (+[SKFilesystem _shouldShowFilesystemWithType:key:personality:]( &OBJC_CLASS___SKFilesystem,  "_shouldShowFilesystemWithType:key:personality:",  v13,  v7,  v10))
  {
    int v57 = 6;
  }

  else
  {
    int v57 = 8;
  }

  uint64_t v58 = objc_alloc(&OBJC_CLASS___SKFilesystem);
  v59 = +[SKFilesystem _skfilesystemTypeWithPersonality:](&OBJC_CLASS___SKFilesystem, "_skfilesystemTypeWithPersonality:", v7);
  LODWORD(v60) = v57;
  __int128 v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:]( v58,  "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:",  v59,  v8,  v9,  0LL,  0LL,  0LL,  v7,  v60);

  v67 = v21;
  [MEMORY[0x189603F18] arrayWithObjects:&v67 count:1];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v55;
}

+ (id)fileSystemsAPFSWithPersonalityKey:(id)a3 bundle:(id)a4
{
  v25[2] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  id v6 = a3;
  getPersonalityDict(v5, v6);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  char CaseSensitive = getCaseSensitive(v24, v6);
  id v7 = objc_alloc(&OBJC_CLASS___SKFilesystem);
  id v8 = kSKDiskFileSystemAPFS[0];
  +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 localizedStringForKey:@"APFS" value:&stru_18A323F58 table:0];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1;
  int v11 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:encrypted:personalityKey:sortPriority:]( v7,  "initWithSKFilesystem:bundle:localizedName:localizedKey:encrypted:personalityKey:sortPriority:",  v8,  v5,  v10,  @"APFS",  0LL,  v6,  v22);

  int v12 = objc_alloc(&OBJC_CLASS___SKFilesystem);
  +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 localizedStringForKey:@"APFS Encrypted" value:&stru_18A323F58 table:0];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:]( v12,  "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:",  v11,  v14,  1LL);

  [v15 setLocalizedKey:@"APFS Encrypted"];
  if ((CaseSensitive & 1) == 0)
  {
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 localizedStringForKey:@"Case-insensitive APFS" value:&stru_18A323F58 table:0];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setLocalizedName:](v11, "setLocalizedName:", v17);

    -[SKFilesystem setLocalizedKey:](v11, "setLocalizedKey:", @"Case-insensitive APFS");
    -[SKFilesystem setSortPriority:](v11, "setSortPriority:", 0LL);
    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 localizedStringForKey:@"Case-insensitive APFS Encrypted" value:&stru_18A323F58 table:0];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setLocalizedName:v19];

    [v15 setLocalizedKey:@"Case-insensitive APFS Encrypted"];
    [v15 setSortPriority:0];
  }

  v25[0] = v11;
  v25[1] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v25 count:2];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)fileSystems3rdPartyWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  getPersonalityDict(v8, v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 infoDictionary];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:*MEMORY[0x189604E10]];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 componentsSeparatedByString:@"."];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 lastObject];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[SKFilesystem _shouldShowFilesystemWithType:key:personality:]( &OBJC_CLASS___SKFilesystem,  "_shouldShowFilesystemWithType:key:personality:",  v14,  v9,  v10))
  {
    int v15 = 7;
  }

  else
  {
    int v15 = 9;
  }

  id v16 = objc_alloc(&OBJC_CLASS___SKFilesystem);
  +[SKFilesystem _skfilesystemTypeWithPersonality:](&OBJC_CLASS___SKFilesystem, "_skfilesystemTypeWithPersonality:", v9);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v15;
  uint64_t v18 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:encrypted:personalityKey:sortPriority:]( v16,  "initWithSKFilesystem:bundle:localizedName:localizedKey:encrypted:personalityKey:sortPriority:",  v17,  v8,  v7,  0LL,  0LL,  v9,  v21);

  v22[0] = v18;
  [MEMORY[0x189603F18] arrayWithObjects:v22 count:1];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)filesystemsWithBundle:(id)a3 filesystemPersonality:(id)a4 userVisibleName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 infoDictionary];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:*MEMORY[0x189604E10]];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 componentsSeparatedByString:@"."];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 lastObject];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v14 isEqualToString:@"hfs"])
  {
    uint64_t v15 = [a1 fileSystemsHFSWithPersonalityKey:v9 bundle:v8 userVisibleName:v10];
  }

  else
  {
    else {
    uint64_t v15 = [a1 fileSystems3rdPartyWithPersonalityKey:v9 bundle:v8 userVisibleName:v10];
    }
  }

  id v16 = (void *)v15;

  return v16;
}

- (SKFilesystem)initWithSpecialFilesystem:(id)a3 majorType:(id)a4 localizedName:(id)a5
{
  v17[8] = *MEMORY[0x1895F89C0];
  v16[0] = @"type";
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[SKFilesystem _skfilesystemTypeWithPersonality:]( &OBJC_CLASS___SKFilesystem,  "_skfilesystemTypeWithPersonality:",  v10);
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = v9;
  v16[1] = @"majorType";
  v16[2] = @"localizedName";
  v17[2] = v8;
  v17[3] = MEMORY[0x189604A80];
  v16[3] = @"isCaseSensitive";
  v16[4] = @"isEncrypted";
  v17[4] = MEMORY[0x189604A80];
  v17[5] = MEMORY[0x189604A80];
  v16[5] = @"shouldShow";
  v16[6] = @"dmPersonality";
  v17[6] = v10;
  v16[7] = @"sortPriority";
  [MEMORY[0x189607968] numberWithInt:9];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:8];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v14 = -[SKFilesystem initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v13);
  return v14;
}

+ (id)buildSpecialFilesystems
{
  v16[3] = *MEMORY[0x1895F89C0];
  dispatch_semaphore_t v2 = objc_alloc(&OBJC_CLASS___SKFilesystem);
  +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 localizedStringForKey:@"Free Space" value:&stru_18A323F58 table:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[SKFilesystem initWithSpecialFilesystem:majorType:localizedName:]( v2,  "initWithSpecialFilesystem:majorType:localizedName:",  @"Free Space",  @"FREE_SPACE",  v4);

  id v6 = objc_alloc(&OBJC_CLASS___SKFilesystem);
  +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 localizedStringForKey:@"Linux Swap" value:&stru_18A323F58 table:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = -[SKFilesystem initWithSpecialFilesystem:majorType:localizedName:]( v6,  "initWithSpecialFilesystem:majorType:localizedName:",  @"Linux Swap",  @"Linux Swap",  v8);

  id v10 = objc_alloc(&OBJC_CLASS___SKFilesystem);
  +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 localizedStringForKey:@"Linux Native" value:&stru_18A323F58 table:0];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = -[SKFilesystem initWithSpecialFilesystem:majorType:localizedName:]( v10,  "initWithSpecialFilesystem:majorType:localizedName:",  @"Linux Native",  @"Linux Native",  v12);

  v16[0] = v5;
  v16[1] = v9;
  v16[2] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v16 count:3];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)filesystemsFromBundle:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FA8] array];
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v3;
  [v3 infoDictionary];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:kExtensionAttributesKey];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:kExtensionAttributesKey];

    id v4 = (void *)v6;
  }

  uint64_t v21 = v4;
  [v4 objectForKeyedSubscript:@"FSPersonalities"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForInfoDictionaryKey:@"FSPersonalities"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        [v9 objectForKeyedSubscript:v14];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 objectForKeyedSubscript:v14];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 objectForKeyedSubscript:@"FSName"];
        id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          uint64_t v18 = [v15 objectForKeyedSubscript:@"FSName"];
          if (v18) {
            id v17 = (__CFString *)v18;
          }
          else {
            id v17 = &stru_18A323F58;
          }
        }

        +[SKFilesystem filesystemsWithBundle:filesystemPersonality:userVisibleName:]( &OBJC_CLASS___SKFilesystem,  "filesystemsWithBundle:filesystemPersonality:userVisibleName:",  v23,  v14,  v17);
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 addObjectsFromArray:v19];
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v11);
  }

  return v22;
}

+ (id)_skfilesystemTypeWithPersonality:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"kSKDiskFileSystem_%@", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_shouldShowFilesystemWithType:(id)a3 key:(id)a4 personality:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 objectForKeyedSubscript:@"FSServerOnly"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = NSNumberToBool(v10);

  if (v11 && (uint64_t v12 = (void *)_CFCopyServerVersionDictionary(), v12, !v12))
  {
  }

  else
  {
    [v9 objectForKeyedSubscript:@"FSFormatExecutable"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13) {
      goto LABEL_4;
    }
  }

  [v9 objectForKeyedSubscript:@"FSFormatInteractive"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isValidNSNumber(v15) & 1) == 0)
  {

LABEL_14:
    LOBYTE(v14) = 0;
    goto LABEL_15;
  }

  char v16 = [v15 BOOLValue];

  if ((v16 & 1) != 0) {
    goto LABEL_14;
  }
LABEL_4:
  if ([v7 isEqualToString:@"hfs"]
    && ![v8 containsString:@"Journaled"]
    || [v7 isEqualToString:@"msdos"]
    && ![v8 isEqualToString:@"MS-DOS"])
  {
    goto LABEL_14;
  }

  int v14 = [v7 isEqualToString:@"udf"] ^ 1;
LABEL_15:

  return v14;
}

- (BOOL)isExtension
{
  dispatch_semaphore_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 infoDictionary];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:kExtensionAttributesKey];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (BOOL)isValidName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  __int128 v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0LL;
  if (v6 && [v6 length])
  {
    if (-[SKFilesystem isExtension](self, "isExtension"))
    {
      id v8 = (void *)objc_opt_new();
      if (v8)
      {
        -[SKFilesystem bundle](self, "bundle");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 bundleIdentifier];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1895F87A8];
        v14[1] = 3221225472LL;
        v14[2] = __34__SKFilesystem_isValidName_error___block_invoke;
        v14[3] = &unk_18A3235E8;
        char v16 = &v17;
        int v11 = v7;
        uint64_t v15 = v11;
        [v8 validateVolumeName:v6 usingBundle:v10 volumeID:0 replyHandler:v14];

        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        if (a4) {
          *a4 = (id) v18[5];
        }
        BOOL v12 = v18[5] == 0;
      }

      else if (a4)
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
        BOOL v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        BOOL v12 = 0;
      }
    }

    else
    {
      BOOL v12 = 1;
    }
  }

  else if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v17, 8);

  return v12;
}

void __34__SKFilesystem_isValidName_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setType:(id)a3
{
}

- (NSString)majorType
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMajorType:(id)a3
{
}

- (NSString)dmPersonality
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDmPersonality:(id)a3
{
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)defaultEffaceable
{
  return self->_defaultEffaceable;
}

- (void)setDefaultEffaceable:(BOOL)a3
{
  self->_defaultEffaceable = a3;
}

- (BOOL)isCaseSensitive
{
  return self->_isCaseSensitive;
}

- (void)setIsCaseSensitive:(BOOL)a3
{
  self->_ischar CaseSensitive = a3;
}

- (BOOL)isJournaled
{
  return self->_isJournaled;
}

- (void)setIsJournaled:(BOOL)a3
{
  self->_isJournaled = a3;
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void)setShouldShow:(BOOL)a3
{
  self->_shouldShow = a3;
}

- (unint64_t)minimumSize
{
  return self->_minimumSize;
}

- (void)setMinimumSize:(unint64_t)a3
{
  self->_minimumSize = a3;
}

- (NSString)contentMask
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setContentMask:(id)a3
{
}

- (NSString)localizedKey
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLocalizedKey:(id)a3
{
}

- (int)sortPriority
{
  return self->_sortPriority;
}

- (void)setSortPriority:(int)a3
{
  self->_sortPriority = a3;
}

- (NSString)unlocalizedName
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setUnlocalizedName:(id)a3
{
}

- (NSString)unlocalizedEncryptedName
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setUnlocalizedEncryptedName:(id)a3
{
}

- (NSString)formatArgs
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSURL)formatExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSString)repairArgs
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSURL)repairExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSString)verificationArgs
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSString)liveVerificationArgs
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (NSURL)verificationExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 144LL, 1);
}

- (NSString)xmlOutputArg
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 160LL, 1);
}

- (void).cxx_destruct
{
}

@end