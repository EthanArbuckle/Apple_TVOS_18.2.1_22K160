@interface MIPlaceholderConstructor
+ (id)_infoPlistKeysToLoad;
- (BOOL)_constructPlaceholdersForDirectory:(id)a3 itemsWithPathExtension:(id)a4 appendingToArray:(id)a5 bundleType:(unint64_t)a6 error:(id *)a7;
- (BOOL)_copyInfoPlistLoctableToPlaceholder:(id)a3 error:(id *)a4;
- (BOOL)_copyStringsToPlaceholder:(id)a3 onlyDirectories:(BOOL)a4 error:(id *)a5;
- (BOOL)_introspectWithError:(id *)a3;
- (BOOL)_loadInfoPlistContentWithError:(id *)a3;
- (BOOL)_materializeConstructors:(id)a3 intoBundle:(id)a4 error:(id *)a5;
- (BOOL)_populateAppExtensionPlaceholderConstructorsWithError:(id *)a3;
- (BOOL)_populateEmbeddedAppClipPlaceholderConstructorsWithError:(id *)a3;
- (BOOL)_populateEmbeddedWatchAppPlaceholderConstructorsWithError:(id *)a3;
- (BOOL)_transferAndUpdateInstallSessionIDsToPlaceholder:(id)a3 error:(id *)a4;
- (BOOL)_writeIconToPlaceholder:(id)a3 infoPlistIconContent:(id *)a4 error:(id *)a5;
- (BOOL)_writeInfoPlistToPlaceholder:(id)a3 substitutingIconContent:(id)a4 withError:(id *)a5;
- (BOOL)basicIOSPlaceholderForWatchOSLessThanSix;
- (BOOL)includeAppClipPlaceholders;
- (BOOL)includeWatchAppPlaceholders;
- (BOOL)isLaunchProhibited;
- (BOOL)materializeIntoBundleDirectory:(id)a3 error:(id *)a4;
- (BOOL)performPlaceholderInstallActions;
- (BOOL)preserveFullInfoPlist;
- (MIPlaceholderConstructor)firstNetworkExtension;
- (MIPlaceholderConstructor)initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 error:(id *)a5;
- (NSArray)appExtensionPlaceholderConstructors;
- (NSArray)embeddedAppClipPlaceholderConstructors;
- (NSArray)embeddedWatchAppPlaceholderConstructors;
- (NSData)installSessionUUID;
- (NSData)installUUID;
- (NSDictionary)entitlements;
- (NSDictionary)infoPlistContent;
- (NSString)bundleID;
- (NSURL)bundleURL;
- (id)_entitlementsForPath:(id)a3 error:(id *)a4;
- (id)_initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 forBundleType:(unint64_t)a5 error:(id *)a6;
- (unint64_t)placeholderType;
- (void)setAppExtensionPlaceholderConstructors:(id)a3;
- (void)setBasicIOSPlaceholderForWatchOSLessThanSix:(BOOL)a3;
- (void)setBundleURL:(id)a3;
- (void)setEmbeddedAppClipPlaceholderConstructors:(id)a3;
- (void)setEmbeddedWatchAppPlaceholderConstructors:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setIncludeAppClipPlaceholders:(BOOL)a3;
- (void)setIncludeWatchAppPlaceholders:(BOOL)a3;
- (void)setInfoPlistContent:(id)a3;
- (void)setInstallSessionUUID:(id)a3;
- (void)setInstallUUID:(id)a3;
- (void)setPerformPlaceholderInstallActions:(BOOL)a3;
- (void)setPlaceholderType:(unint64_t)a3;
- (void)setPreserveFullInfoPlist:(BOOL)a3;
@end

@implementation MIPlaceholderConstructor

- (MIPlaceholderConstructor)initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 error:(id *)a5
{
  return (MIPlaceholderConstructor *)-[MIPlaceholderConstructor _initWithSource:byPreservingFullInfoPlist:forBundleType:error:]( self,  "_initWithSource:byPreservingFullInfoPlist:forBundleType:error:",  a3,  a4,  0LL,  a5);
}

- (id)_initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 forBundleType:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MIPlaceholderConstructor;
  v11 = -[MIPlaceholderConstructor init](&v24, sel_init);
  v12 = v11;
  if (!v11)
  {
    id v15 = 0LL;
    if (!a6) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }

  -[MIPlaceholderConstructor setBundleURL:](v11, "setBundleURL:", v10);
  [v10 pathExtension];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPlaceholderConstructor setPlaceholderType:](v12, "setPlaceholderType:", a5);
  if (a5 > 4) {
    v14 = 0LL;
  }
  else {
    v14 = *(&off_189E42230 + a5);
  }
  if ([v14 isEqualToString:v13])
  {
    v16 = (void *)MEMORY[0x186E388C0](-[MIPlaceholderConstructor setPreserveFullInfoPlist:](v12, "setPreserveFullInfoPlist:", v8));
    id v23 = 0LL;
    BOOL v17 = -[MIPlaceholderConstructor _introspectWithError:](v12, "_introspectWithError:", &v23);
    id v15 = v23;
    if (!v17)
    {

      v12 = 0LL;
    }

    objc_autoreleasePoolPop(v16);
  }

  else
  {

    v18 = (void *)*MEMORY[0x189610040];
    if (a5 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown PlaceholderBundleType value %lu", a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v19 = *(&off_189E42258 + a5);
    }

    [v10 path];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _initWithSource:byPreservingFullInfoPlist:forBundleType:error:]",  122LL,  v18,  4LL,  0LL,  0LL,  @"The provided placeholder type of %@ does not match the path extension for the bundle at %@",  v20,  (uint64_t)v19);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0LL;
  }

  if (a6)
  {
LABEL_16:
    if (!v12) {
      *a6 = v15;
    }
  }

- (NSString)bundleID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*MEMORY[0x189604E00]];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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

- (MIPlaceholderConstructor)firstNetworkExtension
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        objc_msgSend(v6, "entitlements", (void)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        MICopyNetworkExtensionEntitlement(v7);
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          id v3 = v6;

          goto LABEL_11;
        }
      }

      id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)isLaunchProhibited
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"LSApplicationLaunchProhibited"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = MIBooleanValue(v3, 0LL);

  return v4;
}

- (id)_entitlementsForPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFDictionaryRef information = 0LL;
  SecStaticCodeRef staticCode = 0LL;
  if (SecStaticCodeCreateWithPath((CFURLRef)v5, 0, &staticCode))
  {
    v6 = (void *)*MEMORY[0x189610040];
    [v5 path];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _entitlementsForPath:error:]",  180LL,  v6,  13LL,  0LL,  0LL,  @"Failed to construct SecStaticCode for %@ : %d",  v8,  (uint64_t)v7);
LABEL_5:
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v12 = 0LL;
    __int128 v13 = 0LL;
LABEL_6:

    goto LABEL_7;
  }

  if (SecCodeCopySigningInformation(staticCode, 4u, &information))
  {
    v9 = (void *)*MEMORY[0x189610040];
    [v5 path];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _entitlementsForPath:error:]",  186LL,  v9,  13LL,  0LL,  0LL,  @"SecCodeCopySigningInformation for %@ returned error %d",  v10,  (uint64_t)v7);
    goto LABEL_5;
  }

  CFDictionaryRef v12 = information;
  CFDictionaryRef information = 0LL;
  -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *MEMORY[0x18960BBB0]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v7 = v15;
    __int128 v13 = (void *)[v15 copy];
    __int128 v11 = 0LL;
    goto LABEL_6;
  }

  __int128 v11 = 0LL;
  __int128 v13 = (void *)MEMORY[0x189604A60];
LABEL_7:
  if (information)
  {
    CFRelease(information);
    CFDictionaryRef information = 0LL;
  }

  if (staticCode)
  {
    CFRelease(staticCode);
    SecStaticCodeRef staticCode = 0LL;
  }

  if (a4 && !v13) {
    *a4 = v11;
  }

  return v13;
}

+ (id)_infoPlistKeysToLoad
{
  if (_infoPlistKeysToLoad_onceToken != -1) {
    dispatch_once(&_infoPlistKeysToLoad_onceToken, &__block_literal_global_2);
  }
  return (id)_infoPlistKeysToLoad_keysSet;
}

void __48__MIPlaceholderConstructor__infoPlistKeysToLoad__block_invoke()
{
  uint64_t v0 = objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  *MEMORY[0x189604E00],  *MEMORY[0x189604DF8],  *MEMORY[0x189604AC8],  *MEMORY[0x189604E18],  *MEMORY[0x189604E10],  *MEMORY[0x189604AA0],  @"MinimumOSVersion",  @"LSApplicationLaunchProhibited",  @"NSExtension",  @"EXAppExtensionAttributes",  @"UIRequiredDeviceCapabilities",  @"SBAppTags",  @"LSCounterpartIdentifiers",  @"SBIconMasqueradeIdentifier",  @"WKCompanionAppBundleIdentifier",  @"WKWatchOnly",  @"WKRunsIndependentlyOfCompanionApp",  @"NSApplicationRequiresArcade",  0);
  v1 = (void *)_infoPlistKeysToLoad_keysSet;
  _infoPlistKeysToLoad_keysSet = v0;
}

- (BOOL)_loadInfoPlistContentWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIPlaceholderConstructor preserveFullInfoPlist](self, "preserveFullInfoPlist")
    || ([(id)objc_opt_class() _infoPlistKeysToLoad], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    MILoadRawInfoPlist();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = 0LL;
    uint64_t v8 = (void *)[v7 mutableCopy];
  }

  else
  {
    v7 = (void *)v6;
    MILoadInfoPlistWithError();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = 0LL;
  }

  if (v8)
  {
    if ([v8 count])
    {
      uint64_t v10 = (void *)[v8 copy];
      -[MIPlaceholderConstructor setInfoPlistContent:](self, "setInfoPlistContent:", v10);

      BOOL v11 = 1;
      goto LABEL_13;
    }

    uint64_t v15 = (void *)*MEMORY[0x189610040];
    [v5 path];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _loadInfoPlistContentWithError:]",  272LL,  v15,  4LL,  0LL,  0LL,  @"Found no keys in Info.plist in bundle at %@",  v16,  (uint64_t)v13);
  }

  else
  {
    CFDictionaryRef v12 = (void *)*MEMORY[0x189610040];
    [v5 path];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _loadInfoPlistContentWithError:]",  267LL,  v12,  4LL,  v9,  0LL,  @"Failed to load Info.plist from %@",  v14,  (uint64_t)v13);
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    id v9 = v17;
    BOOL v11 = 0;
    *a3 = v9;
  }

  else
  {
    BOOL v11 = 0;
    id v9 = v17;
  }

- (BOOL)_constructPlaceholdersForDirectory:(id)a3 itemsWithPathExtension:(id)a4 appendingToArray:(id)a5 bundleType:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  id v33 = 0LL;
  [MEMORY[0x1896100A8] defaultManager];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __120__MIPlaceholderConstructor__constructPlaceholdersForDirectory_itemsWithPathExtension_appendingToArray_bundleType_error___block_invoke;
  v22[3] = &unk_189E421E8;
  id v16 = v13;
  id v23 = v16;
  objc_super v24 = self;
  v26 = &v28;
  unint64_t v27 = a6;
  id v17 = v14;
  id v25 = v17;
  [v15 enumerateURLsForItemsInDirectoryAtURL:v12 ignoreSymlinks:1 withBlock:v22];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)v29[5];
  if (v19)
  {
    id v20 = v19;

    v18 = v20;
  }

  if (a7 && v18) {
    *a7 = v18;
  }

  _Block_object_dispose(&v28, 8);
  return v18 == 0LL;
}

BOOL __120__MIPlaceholderConstructor__constructPlaceholdersForDirectory_itemsWithPathExtension_appendingToArray_bundleType_error___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3 == 4
    && ([v5 pathExtension],
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:*(void *)(a1 + 32)],
        v7,
        v8))
  {
    id v9 = objc_alloc((Class)objc_opt_class());
    uint64_t v10 = [*(id *)(a1 + 40) preserveFullInfoPlist];
    uint64_t v11 = *(void *)(a1 + 64);
    id v17 = 0LL;
    id v12 = (void *)[v9 _initWithSource:v6 byPreservingFullInfoPlist:v10 forBundleType:v11 error:&v17];
    id v13 = v17;
    id v14 = v17;
    BOOL v15 = v12 != 0LL;
    if (v12) {
      [*(id *)(a1 + 48) addObject:v12];
    }
    else {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v13);
    }
  }

  else
  {
    BOOL v15 = 1LL;
  }

  return v15;
}

- (BOOL)_populateAppExtensionPlaceholderConstructorsWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896100A8] defaultManager];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)objc_opt_new();
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v7 = [&unk_189E46D88 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v22 = a3;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(&unk_189E46D88);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "unsignedIntegerValue", v22);
        -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        id v14 = v13;
        else {
          uint64_t v15 = (uint64_t)*(&off_189E42280 + v12 - 1);
        }
        [v13 URLByAppendingPathComponent:v15 isDirectory:1];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (([v5 itemDoesNotExistOrIsNotDirectoryAtURL:v16] & 1) == 0)
        {
          id v23 = v9;
          BOOL v17 = -[MIPlaceholderConstructor _constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:]( self,  "_constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:",  v16,  @"appex",  v6,  v12,  &v23);
          id v18 = v23;

          if (!v17)
          {

            if (v22)
            {
              id v18 = v18;
              BOOL v19 = 0;
              id *v22 = v18;
            }

            else
            {
              BOOL v19 = 0;
            }

            goto LABEL_20;
          }

          id v9 = v18;
        }
      }

      uint64_t v8 = [&unk_189E46D88 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  id v20 = (void *)[v6 copy];
  -[MIPlaceholderConstructor setAppExtensionPlaceholderConstructors:]( self,  "setAppExtensionPlaceholderConstructors:",  v20);

  BOOL v19 = 1;
  id v18 = v9;
LABEL_20:

  return v19;
}

- (BOOL)_populateEmbeddedWatchAppPlaceholderConstructorsWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIPlaceholderConstructor placeholderType](self, "placeholderType"))
  {
    id v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
LABEL_6:
    BOOL v13 = 1;
    goto LABEL_7;
  }

  uint64_t v8 = (void *)objc_opt_new();
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URLByAppendingPathComponent:@"Watch" isDirectory:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = 0LL;
  if (![v5 itemIsDirectoryAtURL:v7 error:0]
    || (id v15 = 0LL,
        BOOL v10 = -[MIPlaceholderConstructor _constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:]( self,  "_constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:",  v7,  @"app",  v8,  3LL,  &v15),  v11 = v15,  v6 = v11,  v10))
  {
    uint64_t v12 = (void *)[v8 copy];
    -[MIPlaceholderConstructor setEmbeddedWatchAppPlaceholderConstructors:]( self,  "setEmbeddedWatchAppPlaceholderConstructors:",  v12);

    goto LABEL_6;
  }

  if (a3)
  {
    id v6 = v11;
    BOOL v13 = 0;
    *a3 = v6;
  }

  else
  {
    BOOL v13 = 0;
  }

- (BOOL)_populateEmbeddedAppClipPlaceholderConstructorsWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIPlaceholderConstructor placeholderType](self, "placeholderType"))
  {
    id v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_10;
  }

  uint64_t v8 = (void *)objc_opt_new();
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URLByAppendingPathComponent:@"AppClips" isDirectory:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v5 itemExistsAtURL:v7])
  {
    id v6 = 0LL;
    goto LABEL_8;
  }

  id v15 = 0LL;
  BOOL v10 = -[MIPlaceholderConstructor _constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:]( self,  "_constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:",  v7,  @"app",  v8,  4LL,  &v15);
  id v11 = v15;
  id v6 = v11;
  if (v10)
  {
LABEL_8:
    BOOL v13 = (void *)[v8 copy];
    -[MIPlaceholderConstructor setEmbeddedAppClipPlaceholderConstructors:]( self,  "setEmbeddedAppClipPlaceholderConstructors:",  v13);

    goto LABEL_9;
  }

  if (a3)
  {
    id v6 = v11;
    BOOL v12 = 0;
    *a3 = v6;
  }

  else
  {
    BOOL v12 = 0;
  }

- (BOOL)_introspectWithError:(id *)a3
{
  id v18 = 0LL;
  BOOL v5 = -[MIPlaceholderConstructor _loadInfoPlistContentWithError:](self, "_loadInfoPlistContentWithError:", &v18);
  id v6 = v18;
  if (v5)
  {
    -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = v6;
    -[MIPlaceholderConstructor _entitlementsForPath:error:](self, "_entitlementsForPath:error:", v7, &v17);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v17;

    if (!v8) {
      goto LABEL_9;
    }
    -[MIPlaceholderConstructor setEntitlements:](self, "setEntitlements:", v8);
    id v16 = v9;
    BOOL v10 = -[MIPlaceholderConstructor _populateAppExtensionPlaceholderConstructorsWithError:]( self,  "_populateAppExtensionPlaceholderConstructorsWithError:",  &v16);
    id v6 = v16;

    if (!v10)
    {
      BOOL v12 = 0;
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }

    id v15 = v6;
    BOOL v11 = -[MIPlaceholderConstructor _populateEmbeddedWatchAppPlaceholderConstructorsWithError:]( self,  "_populateEmbeddedWatchAppPlaceholderConstructorsWithError:",  &v15);
    id v9 = v15;

    if (v11)
    {
      id v14 = v9;
      BOOL v12 = -[MIPlaceholderConstructor _populateEmbeddedAppClipPlaceholderConstructorsWithError:]( self,  "_populateEmbeddedAppClipPlaceholderConstructorsWithError:",  &v14);
      id v6 = v14;

      if (!a3) {
        goto LABEL_14;
      }
    }

    else
    {
LABEL_9:
      BOOL v12 = 0;
      id v6 = v9;
      if (!a3) {
        goto LABEL_14;
      }
    }
  }

  else
  {
    BOOL v12 = 0;
    uint64_t v8 = 0LL;
    if (!a3) {
      goto LABEL_14;
    }
  }

- (void)setPerformPlaceholderInstallActions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  self->_performPlaceholderInstallActions = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors", 0LL);
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPerformPlaceholderInstallActions:v3];
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)setInstallUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)&self->_installUUID, a3);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setInstallUUID:v5];
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)setInstallSessionUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)&self->_installSessionUUID, a3);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setInstallSessionUUID:v5];
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (BOOL)_writeInfoPlistToPlaceholder:(id)a3 substitutingIconContent:(id)a4 withError:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  -[MIPlaceholderConstructor infoPlistContent](self, "infoPlistContent");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = (void *)[v10 mutableCopy];
  [v12 setObject:@"Executable" forKeyedSubscript:*MEMORY[0x189604DF8]];
  if (MEMORY[0x189610010])
  {
    __int128 v26 = a5;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    IFTopLevelAppBundlePlistKeys();
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          [v12 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * v17++)];
        }

        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v15);
    }

    a5 = v26;
    if (v9) {
      [v12 addEntriesFromDictionary:v9];
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  if (-[MIPlaceholderConstructor performPlaceholderInstallActions](self, "performPlaceholderInstallActions"))
  {
    MICopyCurrentBuildVersion();
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v18 forKeyedSubscript:@"CF_MIEmergencyOffloadVersion"];
  }

  id v27 = 0LL;
  char v19 = objc_msgSend(v12, "MI_writeToURL:format:options:error:", v11, 200, 0x10000000, &v27);
  id v20 = v27;
  if ((v19 & 1) == 0)
  {
    v21 = (void *)*MEMORY[0x189610040];
    [v11 path];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _writeInfoPlistToPlaceholder:substitutingIconContent:withError:]",  560LL,  v21,  4LL,  v20,  0LL,  @"Failed to write Info.plist file to %@",  v23,  (uint64_t)v22);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v20 = v24;
      *a5 = v20;
    }

    else
    {
      id v20 = v24;
    }
  }

  return v19;
}

- (BOOL)_copyStringsToPlaceholder:(id)a3 onlyDirectories:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v25 = 0LL;
  __int128 v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  __int128 v28 = __Block_byref_object_copy__1;
  __int128 v29 = __Block_byref_object_dispose__1;
  id v30 = 0LL;
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896100A8] defaultManager];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __76__MIPlaceholderConstructor__copyStringsToPlaceholder_onlyDirectories_error___block_invoke;
  v20[3] = &unk_189E42210;
  id v11 = v8;
  id v21 = v11;
  id v12 = v10;
  id v22 = v12;
  uint64_t v23 = &v25;
  BOOL v24 = a4;
  [v12 enumerateURLsForItemsInDirectoryAtURL:v9 ignoreSymlinks:1 withBlock:v20];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v13;
  if (!v26[5])
  {
    if (!v13)
    {
      BOOL v16 = 1;
      goto LABEL_8;
    }

    uint64_t v17 = _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]",  621LL,  (void *)*MEMORY[0x189610040],  4LL,  v13,  0LL,  @"Encountered error while enumerating %@ to copy strings",  v14,  (uint64_t)v9);
    id v18 = (void *)v26[5];
    v26[5] = v17;

    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v16 = 0;
    goto LABEL_8;
  }

  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  BOOL v16 = 0;
  *a5 = (id) v26[5];
LABEL_8:

  _Block_object_dispose(&v25, 8);
  return v16;
}

uint64_t __76__MIPlaceholderConstructor__copyStringsToPlaceholder_onlyDirectories_error___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3 == 4)
  {
    [v5 pathExtension];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = [v7 isEqualToString:@"lproj"];

    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = [v6 lastPathComponent];
      [v9 URLByAppendingPathComponent:v10 isDirectory:1];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      id v12 = *(void **)(a1 + 40);
      id v28 = 0LL;
      LOBYTE(v10) = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:0 mode:493 error:&v28];
      id v14 = v28;
      if ((v10 & 1) != 0)
      {
        if (*(_BYTE *)(a1 + 56))
        {
          uint64_t v15 = 1LL;
LABEL_10:

          goto LABEL_11;
        }

        [v6 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (([*(id *)(a1 + 40) itemDoesNotExistAtURL:v18] & 1) == 0)
        {
          [v11 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          id v22 = *(void **)(a1 + 40);
          id v27 = v14;
          uint64_t v15 = [v22 copyItemAtURL:v18 toURL:v21 error:&v27];
          id v19 = v27;

          if ((v15 & 1) == 0)
          {
            uint64_t v24 = _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]_block_invoke",  609LL,  (void *)*MEMORY[0x189610040],  4LL,  v19,  0LL,  @"Failed to copy InfoPlist.strings from \"%@\" to \"%@\"",  v23,  (uint64_t)v18);
            uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8LL);
            __int128 v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v24;
          }

          goto LABEL_9;
        }

        uint64_t v15 = 1LL;
      }

      else
      {
        uint64_t v16 = _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]_block_invoke",  592LL,  (void *)*MEMORY[0x189610040],  4LL,  v14,  0LL,  @"Failed to create destination lproj directory at \"%@\"",  v13,  (uint64_t)v11);
        uint64_t v15 = 0LL;
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;
      }

      id v19 = v14;
LABEL_9:

      id v14 = v19;
      goto LABEL_10;
    }
  }

  uint64_t v15 = 1LL;
LABEL_11:

  return v15;
}

- (BOOL)_copyInfoPlistLoctableToPlaceholder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 URLByAppendingPathComponent:@"InfoPlist.loctable" isDirectory:0];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 URLByAppendingPathComponent:@"InfoPlist.loctable" isDirectory:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896100A8] defaultManager];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  char v11 = [v10 copyItemAtURL:v8 toURL:v9 error:&v15];
  id v12 = v15;
  uint64_t v13 = v12;
  if (a4 && (v11 & 1) == 0) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_writeIconToPlaceholder:(id)a3 infoPlistIconContent:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!MEMORY[0x189610008])
  {
    id v13 = 0LL;
    id v11 = 0LL;
LABEL_12:
    if (!a4)
    {
LABEL_14:
      BOOL v14 = 1;
      goto LABEL_15;
    }

- (BOOL)_transferAndUpdateInstallSessionIDsToPlaceholder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x1896100A8] defaultManager];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPlaceholderConstructor installSessionUUID](self, "installSessionUUID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = -[MIPlaceholderConstructor installUUID](self, "installUUID");
  char v10 = (void *)v9;
  if (v8)
  {
    id v11 = 0LL;
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  -[MIPlaceholderConstructor infoPlistContent](self, "infoPlistContent");
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:*MEMORY[0x189604DF8]];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    id v18 = (void *)*MEMORY[0x189610040];
    -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 path];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _transferAndUpdateInstallSessionIDsToPlaceholder:error:]",  720LL,  v18,  4LL,  0LL,  0LL,  @"Failed to get CFBundleExecutable key from Info.plist of %@",  v21,  (uint64_t)v20);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    id v13 = 0LL;
    goto LABEL_15;
  }

  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 URLByAppendingPathComponent:v15 isDirectory:0];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v27 = 0LL;
  [v7 dataForExtendedAttributeNamed:@"com.apple.install_session_uuid" length:16 fromURL:v13 error:&v27];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v27;
  id v11 = v17;
  if (v8) {
    goto LABEL_8;
  }
  [v17 domain];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v22 isEqualToString:*MEMORY[0x189607688]])
  {

    goto LABEL_15;
  }

  uint64_t v23 = [v11 code];

  if (v23 != 93)
  {
LABEL_15:

    LOBYTE(v12) = 0;
    id v8 = 0LL;
    goto LABEL_16;
  }

  _UUIDData();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = 0LL;
LABEL_8:
  -[MIPlaceholderConstructor setInstallSessionUUID:](self, "setInstallSessionUUID:", v8);

  if (!v10)
  {
LABEL_3:
    _UUIDData();
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPlaceholderConstructor setInstallUUID:](self, "setInstallUUID:", v10);
  }

- (BOOL)_materializeConstructors:(id)a3 intoBundle:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v30 = a4;
  [MEMORY[0x1896100A8] defaultManager];
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)objc_opt_new();
  if (v7 && [v7 count])
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v26 = v7;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v25 = a5;
      id v11 = 0LL;
      uint64_t v28 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v14 = [v13 placeholderType];
          if ((unint64_t)(v14 - 1) >= 4)
          {
            _CreateAndLogError( (uint64_t)"-[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:]",  785LL,  (void *)*MEMORY[0x189610040],  4LL,  0LL,  0LL,  @"Unknown placeholder type %lu",  v15,  v14);
            id v18 = (id)objc_claimAutoreleasedReturnValue();
            id v17 = v11;
            goto LABEL_23;
          }

          uint64_t v16 = (uint64_t)*(&off_189E42280 + v14 - 1);
          [v30 URLByAppendingPathComponent:v16 isDirectory:1];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v8 containsObject:v16])
          {
            id v18 = v11;
          }

          else
          {
            id v32 = v11;
            int v19 = [v29 createDirectoryAtURL:v17 withIntermediateDirectories:0 mode:493 error:&v32];
            id v18 = v32;

            if (!v19) {
              goto LABEL_23;
            }
            [v8 addObject:v16];
          }

          [v13 bundleURL];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 lastPathComponent];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 URLByAppendingPathComponent:v21 isDirectory:1];
          id v22 = (void *)objc_claimAutoreleasedReturnValue();

          id v31 = v18;
          LODWORD(v20) = [v13 materializeIntoBundleDirectory:v22 error:&v31];
          id v11 = v31;

          if (!(_DWORD)v20)
          {
            id v18 = v11;
LABEL_23:

            id v7 = v26;
            if (v25)
            {
              id v18 = v18;
              BOOL v23 = 0;
              *id v25 = v18;
            }

            else
            {
              BOOL v23 = 0;
            }

            goto LABEL_18;
          }
        }

        uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v11 = 0LL;
    }

    BOOL v23 = 1;
    id v18 = v11;
    id v7 = v26;
  }

  else
  {
    id v18 = 0LL;
    BOOL v23 = 1;
  }

- (BOOL)materializeIntoBundleDirectory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x1896100A8] defaultManager];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v50 = 0LL;
  int v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:0 mode:493 class:4 error:&v50];
  id v9 = v50;
  uint64_t v10 = v9;
  if (!v8)
  {
    id v16 = 0LL;
    id v13 = v9;
LABEL_14:
    id v20 = 0LL;
    goto LABEL_15;
  }

  -[MIPlaceholderConstructor entitlements](self, "entitlements");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v49 = v10;
  int v12 = MIWritePlaceholderEntitlements(v6, v11, (uint64_t)&v49);
  id v13 = v49;

  if (!v12)
  {
    id v16 = 0LL;
    goto LABEL_14;
  }

  id v48 = 0LL;
  BOOL v14 = -[MIPlaceholderConstructor _copyInfoPlistLoctableToPlaceholder:error:]( self,  "_copyInfoPlistLoctableToPlaceholder:error:",  v6,  &v48);
  id v15 = v48;
  id v16 = v15;
  if (v14) {
    goto LABEL_4;
  }
  [v15 domain];
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v29 isEqualToString:*MEMORY[0x189607688]] & 1) == 0)
  {

LABEL_29:
    id v16 = v16;

    id v20 = 0LL;
    id v13 = v16;
    goto LABEL_15;
  }

  uint64_t v30 = [v16 code];

  if (v30 != 2) {
    goto LABEL_29;
  }
LABEL_4:
  id v47 = v13;
  BOOL v17 = -[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]( self,  "_copyStringsToPlaceholder:onlyDirectories:error:",  v6,  v14,  &v47);
  id v18 = v47;

  if (!v17)
  {
    id v20 = 0LL;
    goto LABEL_27;
  }

  id v45 = v18;
  id v46 = 0LL;
  BOOL v19 = -[MIPlaceholderConstructor _writeIconToPlaceholder:infoPlistIconContent:error:]( self,  "_writeIconToPlaceholder:infoPlistIconContent:error:",  v6,  &v46,  &v45);
  id v20 = v46;
  id v21 = v45;

  if (!v19)
  {
    id v13 = v21;
    goto LABEL_15;
  }

  id v44 = v21;
  BOOL v22 = -[MIPlaceholderConstructor _writeInfoPlistToPlaceholder:substitutingIconContent:withError:]( self,  "_writeInfoPlistToPlaceholder:substitutingIconContent:withError:",  v6,  v20,  &v44);
  id v13 = v44;

  if (!v22) {
    goto LABEL_15;
  }
  if (-[MIPlaceholderConstructor performPlaceholderInstallActions](self, "performPlaceholderInstallActions"))
  {
    id v43 = v13;
    BOOL v23 = -[MIPlaceholderConstructor _transferAndUpdateInstallSessionIDsToPlaceholder:error:]( self,  "_transferAndUpdateInstallSessionIDsToPlaceholder:error:",  v6,  &v43);
    id v18 = v43;

    if (v23)
    {
      id v42 = v18;
      int v24 = [v7 markBundleAsPlaceholder:v6 withError:&v42];
      id v13 = v42;

      if (!v24) {
        goto LABEL_15;
      }
      goto LABEL_10;
    }

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (BOOL)performPlaceholderInstallActions
{
  return self->_performPlaceholderInstallActions;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (BOOL)includeWatchAppPlaceholders
{
  return self->_includeWatchAppPlaceholders;
}

- (void)setIncludeWatchAppPlaceholders:(BOOL)a3
{
  self->_includeWatchAppPlaceholders = a3;
}

- (BOOL)includeAppClipPlaceholders
{
  return self->_includeAppClipPlaceholders;
}

- (void)setIncludeAppClipPlaceholders:(BOOL)a3
{
  self->_includeAppClipPlaceholders = a3;
}

- (BOOL)basicIOSPlaceholderForWatchOSLessThanSix
{
  return self->_basicIOSPlaceholderForWatchOSLessThanSix;
}

- (void)setBasicIOSPlaceholderForWatchOSLessThanSix:(BOOL)a3
{
  self->_basicIOSPlaceholderForWatchOSLessThanSix = a3;
}

- (NSArray)appExtensionPlaceholderConstructors
{
  return self->_appExtensionPlaceholderConstructors;
}

- (void)setAppExtensionPlaceholderConstructors:(id)a3
{
}

- (NSArray)embeddedWatchAppPlaceholderConstructors
{
  return self->_embeddedWatchAppPlaceholderConstructors;
}

- (void)setEmbeddedWatchAppPlaceholderConstructors:(id)a3
{
}

- (NSArray)embeddedAppClipPlaceholderConstructors
{
  return self->_embeddedAppClipPlaceholderConstructors;
}

- (void)setEmbeddedAppClipPlaceholderConstructors:(id)a3
{
}

- (unint64_t)placeholderType
{
  return self->_placeholderType;
}

- (void)setPlaceholderType:(unint64_t)a3
{
  self->_placeholderType = a3;
}

- (NSDictionary)infoPlistContent
{
  return self->_infoPlistContent;
}

- (void)setInfoPlistContent:(id)a3
{
}

- (NSData)installUUID
{
  return self->_installUUID;
}

- (NSData)installSessionUUID
{
  return self->_installSessionUUID;
}

- (BOOL)preserveFullInfoPlist
{
  return self->_preserveFullInfoPlist;
}

- (void)setPreserveFullInfoPlist:(BOOL)a3
{
  self->_preserveFullInfoPlist = a3;
}

- (void).cxx_destruct
{
}

@end