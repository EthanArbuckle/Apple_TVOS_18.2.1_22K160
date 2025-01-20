@interface LSApplicationProxy
+ (BOOL)supportsSecureCoding;
+ (id)applicationProxyForBundleType:(unint64_t)a3 identifier:(id)a4 isCompanion:(BOOL)a5 URL:(id)a6 itemID:(id)a7 bundleUnit:(unsigned int *)a8;
+ (id)applicationProxyForBundleURL:(id)a3;
+ (id)applicationProxyForCompanionIdentifier:(id)a3;
+ (id)applicationProxyForIdentifier:(id)a3;
+ (id)applicationProxyForIdentifier:(id)a3 placeholder:(BOOL)a4;
+ (id)applicationProxyForIdentifier:(id)a3 withContext:(LSContext *)a4;
+ (id)applicationProxyForItemID:(id)a3;
+ (id)applicationProxyForSystemPlaceholder:(id)a3;
+ (id)applicationProxyWithBundleUnitID:(unsigned int)a3 withContext:(LSContext *)a4;
- (BOOL)UPPValidated;
- (BOOL)_usesSystemPersona;
- (BOOL)fileSharingEnabled;
- (BOOL)freeProfileValidated;
- (BOOL)gameCenterEverEnabled;
- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4;
- (BOOL)hasMIDBasedSINF;
- (BOOL)iconIsPrerendered;
- (BOOL)iconUsesAssetCatalog;
- (BOOL)isAppUpdate;
- (BOOL)isBetaApp;
- (BOOL)isDeletableIgnoringRestrictions;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isGameCenterEnabled;
- (BOOL)isInstalled;
- (BOOL)isNewsstandApp;
- (BOOL)isPlaceholder;
- (BOOL)isPurchasedReDownload;
- (BOOL)isRemoveableSystemApp;
- (BOOL)isRemovedSystemApp;
- (BOOL)isRestricted;
- (BOOL)isStandaloneWatchApp;
- (BOOL)isWatchKitApp;
- (BOOL)isWhitelisted;
- (BOOL)missingRequiredSINF;
- (BOOL)profileValidated;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)supportsODR;
- (BOOL)userInitiatedUninstall;
- (LSApplicationProxy)initWithCoder:(id)a3;
- (LSApplicationRecord)correspondingApplicationRecord;
- (NSArray)activityTypes;
- (NSArray)deviceFamily;
- (NSArray)plugInKitPlugins;
- (NSArray)requiredDeviceCapabilities;
- (NSArray)subgenres;
- (NSDate)registeredDate;
- (NSDictionary)siriActionDefinitionURLs;
- (NSNumber)ODRDiskUsage;
- (NSNumber)betaExternalVersionIdentifier;
- (NSNumber)downloaderDSID;
- (NSNumber)dynamicDiskUsage;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)familyID;
- (NSNumber)genreID;
- (NSNumber)installFailureReason;
- (NSNumber)itemID;
- (NSNumber)platform;
- (NSNumber)purchaserDSID;
- (NSNumber)ratingRank;
- (NSNumber)staticDiskUsage;
- (NSNumber)storeFront;
- (NSProgress)installProgress;
- (NSSet)claimedDocumentContentTypes;
- (NSSet)claimedURLSchemes;
- (NSString)appIDPrefix;
- (NSString)applicationDSID;
- (NSString)applicationVariant;
- (NSString)companionApplicationIdentifier;
- (NSString)complicationPrincipalClass;
- (NSString)genre;
- (NSString)itemName;
- (NSString)preferredArchitecture;
- (NSString)ratingLabel;
- (NSString)sourceAppIdentifier;
- (NSString)storeCohortMetadata;
- (NSString)teamID;
- (NSString)vendorName;
- (_LSApplicationState)appState;
- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleIdentifier:(id)a5;
- (id)_initWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 applicationRecord:(id)a5 bundleID:(id)a6 resolveAndDetach:(BOOL)a7;
- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4;
- (id)_managedPersonas;
- (id)_stringLocalizerForTable:(id)a3;
- (id)alternateIconName;
- (id)bundleType;
- (id)dataContainerURL;
- (id)description;
- (id)environmentVariables;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)getBundleMetadata;
- (id)groupContainerURLs;
- (id)handlerRankOfClaimForContentType:(id)a3;
- (id)iconDataForVariant:(int)a3;
- (id)iconDataForVariant:(int)a3 withOptions:(int)a4;
- (id)installProgressSync;
- (id)localizedNameForContext:(id)a3;
- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4;
- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4 useShortNameOnly:(BOOL)a5;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)primaryIconDataForVariant:(int)a3;
- (id)signerIdentity;
- (id)signerOrganization;
- (id)valueForUndefinedKey:(id)a3;
- (int)bundleModTime;
- (int64_t)deviceManagementPolicy;
- (unint64_t)installType;
- (unint64_t)originalInstallType;
- (void)clearAdvertisingIdentifier;
- (void)detach;
- (void)encodeWithCoder:(id)a3;
- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3;
- (void)setAlternateIconName:(id)a3 withResult:(id)a4;
- (void)setUserInitiatedUninstall:(BOOL)a3;
@end

@implementation LSApplicationProxy

+ (id)applicationProxyForIdentifier:(id)a3
{
  return (id)[a1 applicationProxyForBundleType:0 identifier:a3 isCompanion:0 URL:0 itemID:0 bundleUnit:0];
}

+ (id)applicationProxyForBundleType:(unint64_t)a3 identifier:(id)a4 isCompanion:(BOOL)a5 URL:(id)a6 itemID:(id)a7 bundleUnit:(unsigned int *)a8
{
  BOOL v11 = a5;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v36 = 0LL;
  v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  id v41 = 0LL;
  if (!v14 || v11 || ([a1 canInstantiateFromDatabase] & 1) != 0)
  {
    v34.db = 0LL;
    if (_LSContextInit((id *)&v34.db))
    {
      LODWORD(v17) = 0;
    }

    else
    {
      if (v16) {
        uint64_t v18 = [v16 unsignedLongLongValue];
      }
      else {
        uint64_t v18 = 0LL;
      }
      uint64_t v17 = _LSFindBundleWithInfo(&v34, a3, v14, v11, v15, v18, 0LL);
      id v26 = objc_alloc((Class)a1);
      if (v11) {
        id v27 = 0LL;
      }
      else {
        id v27 = v14;
      }
      uint64_t v28 = [v26 _initWithBundleUnit:v17 context:&v34 bundleIdentifier:v27];
      id v29 = v37[5];
      v37[5] = (id)v28;

      _LSContextDestroy((void **)&v34.db);
    }
  }

  else
  {
    [MEMORY[0x1896077F8] mainBundle];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 bundleIdentifier];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    int v21 = [v14 isEqual:v20];

    if (v21)
    {
      _LSDefaultLog();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[LSApplicationProxy applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:].cold.1(v22);
      }

      __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
      __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
      v23 = +[LSBundleProxy bundleProxyForCurrentProcess](&OBJC_CLASS___LSBundleProxy, "bundleProxyForCurrentProcess");
      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          objc_storeStrong(v37 + 5, v23);
        }
      }
    }

    if (!v37[5])
    {
      v24 = +[_LSApplicationProxyForIdentifierQuery queryWithIdentifier:]( &OBJC_CLASS____LSApplicationProxyForIdentifierQuery,  "queryWithIdentifier:",  v14);
      v25 = +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
      v35[0] = MEMORY[0x1895F87A8];
      v35[1] = 3221225472LL;
      v35[2] = __97__LSApplicationProxy_applicationProxyForBundleType_identifier_isCompanion_URL_itemID_bundleUnit___block_invoke;
      v35[3] = &unk_189D723E0;
      v35[4] = &v36;
      [v25 enumerateResolvedResultsOfQuery:v24 withBlock:v35];
    }

    LODWORD(v17) = 0;
  }

  if (!v37[5])
  {
    uint64_t v30 = [a1 applicationProxyForIdentifier:v14 withContext:0];
    id v31 = v37[5];
    v37[5] = (id)v30;
  }

  if (a8) {
    *a8 = v17;
  }
  id v32 = v37[5];
  _Block_object_dispose(&v36, 8);

  return v32;
}

- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if ((_DWORD)v6 && !a4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[LSApplicationProxy _initWithBundleUnit:context:bundleIdentifier:]"];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInFunction:v11, @"LSApplicationProxy.m", 290, @"Invalid parameter not satisfying: %@", @"bundleUnit == kCSStoreNullID || context != NULL" file lineNumber description];
    goto LABEL_10;
  }

  if (!(_DWORD)v6 || !a4)
  {
    if (!a4)
    {
LABEL_11:
      id v9 = 0LL;
      goto LABEL_12;
    }

    _LSDatabaseGetCacheGUID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedLongLong:_LSDatabaseGetSequenceNumber()];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDefaultLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      v19 = v10;
      __int16 v20 = 2112;
      int v21 = v11;
      _os_log_debug_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEBUG,  "LaunchServices: failed to find bundle record for %@ {%@ %@}",  buf,  0x20u);
    }

LABEL_10:
    goto LABEL_11;
  }

  uint64_t v15 = 0LL;
  id v9 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "_initWithContext:bundleID:bundleData:error:",  a4,  v6,  0LL,  &v15);
LABEL_12:
  id v13 = -[LSApplicationProxy _initWithContext:bundleUnit:applicationRecord:bundleID:resolveAndDetach:]( self,  "_initWithContext:bundleUnit:applicationRecord:bundleID:resolveAndDetach:",  a4,  v6,  v9,  v8,  1LL);

  return v13;
}

- (id)_initWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 applicationRecord:(id)a5 bundleID:(id)a6 resolveAndDetach:(BOOL)a7
{
  BOOL v30 = a7;
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  id v34 = a6;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3812000000LL;
  v48 = __Block_byref_object_copy__6;
  v49 = __Block_byref_object_dispose__7;
  uint64_t v50 = 256LL;
  id v51 = 0LL;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  int v44 = 0;
  if (v9)
  {
    v40[0] = MEMORY[0x1895F87A8];
    v40[1] = 3221225472LL;
    v40[2] = __94__LSApplicationProxy__initWithContext_bundleUnit_applicationRecord_bundleID_resolveAndDetach___block_invoke;
    v40[3] = &unk_189D72408;
    v40[4] = &v45;
    v40[5] = &v41;
    [v9 _performBlockWithContext:v40];
  }

  [v9 _iconFileNames];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x186E2A59C]();
  [v9 infoDictionary];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:@"CFBundleIcons" ofClass:objc_opt_class()];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)&OBJC_CLASS____LSLazyPropertyList, v12);
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v32 = 0LL;
  }

  objc_autoreleasePoolPop(v10);
  unsigned int v31 = *((_DWORD *)v42 + 6);
  id v13 = v46;
  else {
    uint64_t v14 = 1LL;
  }
  uint64_t v15 = [v9 bundleIdentifier];
  id v16 = (void *)v15;
  if (v15) {
    id v17 = (id)v15;
  }
  else {
    id v17 = v34;
  }
  [v9 bundleContainerURL];
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 _dataContainerURLFromDatabase];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URL];
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 exactBundleVersion];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___LSApplicationProxy;
  uint64_t v22 = -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:]( &v39,  sel__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version_,  v31,  v13 + 6,  v14,  v17,  0LL,  v18,  v19,  v20,  v32,  v33,  v21);

  if (v22)
  {
    if (v30 && _LSDatabaseContextGetDetachProxyObjects(v23))
    {
      [v9 _resolveAllProperties];
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      [v9 claimRecords];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v52 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t i = 0LL; i != v25; ++i)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * i) _resolveAllProperties];
          }

          uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v52 count:16];
        }

        while (v25);
      }

      [v9 detach];
    }

    objc_storeStrong(v22 + 19, a5);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v22;
}

void __94__LSApplicationProxy__initWithContext_bundleUnit_applicationRecord_bundleID_resolveAndDetach___block_invoke( uint64_t a1,  id *a2,  uint64_t a3,  int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a4;
}

- (_LSApplicationState)appState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }

  else
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS____LSApplicationState);
    v7 = -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    v5 = -[_LSApplicationState initWithBundleIdentifier:stateFlags:ratingRank:installType:]( v6,  "initWithBundleIdentifier:stateFlags:ratingRank:installType:",  v7,  0LL,  0LL,  0LL);
  }

  return v5;
}

- (LSApplicationRecord)correspondingApplicationRecord
{
  return self->_record;
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  return -[LSApplicationProxy localizedNameForContext:preferredLocalizations:useShortNameOnly:]( self,  "localizedNameForContext:preferredLocalizations:useShortNameOnly:",  0LL,  a3,  a4);
}

- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4 useShortNameOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if (v5)
    {
      _LSDefaultLog();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[LSApplicationProxy(Localization) localizedNameForContext:preferredLocalizations:useShortNameOnly:].cold.1( (uint64_t)v8,  v10);
      }
    }

    record = self->_record;
    if (v9) {
      -[LSApplicationRecord localizedNameWithContext:preferredLocalizations:]( record,  "localizedNameWithContext:preferredLocalizations:",  v8,  v9);
    }
    else {
      -[LSApplicationRecord localizedNameWithContext:](record, "localizedNameWithContext:", v8);
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v12 = self->_record;
    if (v5)
    {
      if (v9) {
        -[LSBundleRecord localizedShortNameWithPreferredLocalizations:]( v12,  "localizedShortNameWithPreferredLocalizations:",  v9);
      }
      else {
        -[LSBundleRecord localizedShortName](v12, "localizedShortName");
      }
    }

    else if (v9)
    {
      -[LSBundleRecord localizedNameWithPreferredLocalizations:](v12, "localizedNameWithPreferredLocalizations:", v9);
    }

    else
    {
      -[LSBundleRecord localizedName](v12, "localizedName");
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v13;
    if (![v13 length])
    {
      uint64_t v15 = -[LSBundleRecord _fallbackLocalizedName](self->_record, "_fallbackLocalizedName");

      uint64_t v14 = (void *)v15;
    }
  }

  return v14;
}

- (id)bundleType
{
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[LSApplicationProxy isInstalled](self, "isInstalled")) {
      v3 = @"User";
    }
    else {
      v3 = 0LL;
    }
  }

  return v3;
}

- (id)dataContainerURL
{
  return -[LSBundleRecord dataContainerURL](self->_record, "dataContainerURL");
}

- (BOOL)profileValidated
{
  return -[LSBundleRecord isProfileValidated](self->_record, "isProfileValidated");
}

- (BOOL)UPPValidated
{
  return -[LSBundleRecord isUPPValidated](self->_record, "isUPPValidated");
}

- (BOOL)freeProfileValidated
{
  return -[LSBundleRecord isFreeProfileValidated](self->_record, "isFreeProfileValidated");
}

- (NSString)teamID
{
  return -[LSBundleRecord teamIdentifier](self->_record, "teamIdentifier");
}

- (id)signerIdentity
{
  return -[LSBundleRecord signerIdentity](self->_record, "signerIdentity");
}

- (BOOL)isBetaApp
{
  return -[LSApplicationRecord isBeta](self->_record, "isBeta");
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v3 = self->_record;
  if (!v3)
  {
    if (forwardingTargetForSelector__once != -1) {
      dispatch_once(&forwardingTargetForSelector__once, &__block_literal_global_2);
    }
    v3 = (LSApplicationRecord *)(id)forwardingTargetForSelector__invalidRecord;
  }

  return v3;
}

- (NSArray)deviceFamily
{
  return -[LSApplicationRecord deviceFamilies](self->_record, "deviceFamilies");
}

- (NSArray)requiredDeviceCapabilities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __48__LSApplicationProxy_requiredDeviceCapabilities__block_invoke;
    v7[3] = &unk_189D72458;
    id v8 = v3;
    id v4 = v3;
    [v2 enumerateKeysAndObjectsUsingBlock:v7];
    BOOL v5 = (void *)[v4 copy];
  }

  else
  {
    BOOL v5 = 0LL;
  }

  return (NSArray *)v5;
}

void __48__LSApplicationProxy_requiredDeviceCapabilities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
}

- (NSNumber)ratingRank
{
  v2 = (void *)MEMORY[0x189607968];
  v3 = -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "ratingRank"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)itemID
{
  v2 = (void *)MEMORY[0x189607968];
  v3 = -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeItemIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[LSApplicationRecord applicationDSID](self->_record, "applicationDSID"));
}

- (NSNumber)downloaderDSID
{
  return (NSNumber *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[LSApplicationRecord applicationDownloaderDSID](self->_record, "applicationDownloaderDSID"));
}

- (int64_t)deviceManagementPolicy
{
  if (DeviceManagementLibrary_frameworkLibrary
    || (int64_t result = (int64_t)dlopen( "/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement",  2),  (DeviceManagementLibrary_frameworkLibrary = result) != 0))
  {
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    id v4 = (LaunchServices::DMFSupport *)objc_claimAutoreleasedReturnValue();
    int64_t v6 = _LSGetDMFPolicy(v4, v5);

    return v6;
  }

  return result;
}

- (id)environmentVariables
{
  return -[LSApplicationRecord additionalEnvironmentVariables](self->_record, "additionalEnvironmentVariables");
}

- (void).cxx_destruct
{
}

+ (id)applicationProxyForBundleURL:(id)a3
{
  return (id)[a1 applicationProxyForBundleType:0 identifier:0 isCompanion:0 URL:a3 itemID:0 bundleUnit:0];
}

+ (id)applicationProxyWithBundleUnitID:(unsigned int)a3 withContext:(LSContext *)a4
{
  id v4 = 0LL;
  if (a3 && a4)
  {
    uint64_t v6 = *(void *)&a3;
    if (_LSBundleGet(a4->db, a3))
    {
      id v8 = (void *)_CSStringCopyCFString();
      id v4 = (void *)[objc_alloc((Class)a1) _initWithBundleUnit:v6 context:a4 bundleIdentifier:v8];
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

+ (id)applicationProxyForIdentifier:(id)a3 withContext:(LSContext *)a4
{
  id v6 = a3;
  if (a4) {
    uint64_t v7 = _LSFindBundleWithInfo(a4, 0LL, v6, 0, 0LL, 0LL, 0LL);
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = (void *)[objc_alloc((Class)a1) _initWithBundleUnit:v7 context:a4 bundleIdentifier:v6];

  return v8;
}

void __97__LSApplicationProxy_applicationProxyForBundleType_identifier_isCompanion_URL_itemID_bundleUnit___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  *a4 = 1;
}

+ (id)applicationProxyForIdentifier:(id)a3 placeholder:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 1LL;
  }
  return (id)[a1 applicationProxyForBundleType:v5 identifier:a3 isCompanion:0 URL:0 itemID:0 bundleUnit:0];
}

+ (id)applicationProxyForCompanionIdentifier:(id)a3
{
  int v5 = 0;
  [a1 applicationProxyForBundleType:0 identifier:a3 isCompanion:1 URL:0 itemID:0 bundleUnit:&v5];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {

    v3 = 0LL;
  }

  return v3;
}

+ (id)applicationProxyForSystemPlaceholder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  int v8 = 0;
  [a1 applicationProxyForBundleType:7 identifier:v4 isCompanion:0 URL:0 itemID:0 bundleUnit:&v8];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !v8)
  {
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "No system placeholder found with identifier %@",  buf,  0xCu);
    }

    int v5 = 0LL;
  }

  return v5;
}

+ (id)applicationProxyForItemID:(id)a3
{
  int v5 = 0;
  [a1 applicationProxyForBundleType:1 identifier:0 isCompanion:0 URL:0 itemID:a3 bundleUnit:&v5];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {

    v3 = 0LL;
  }

  return v3;
}

- (NSString)companionApplicationIdentifier
{
  return 0LL;
}

- (NSDate)registeredDate
{
  return -[LSBundleRecord registrationDate](self->_record, "registrationDate");
}

- (NSString)vendorName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 artistName];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)itemName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 itemName];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)storeCohortMetadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 storeCohort];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)genre
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 genre];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)genreID
{
  v2 = (void *)MEMORY[0x189607968];
  v3 = -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "genreIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSArray)subgenres
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 subgenres];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)preferredArchitecture
{
  return -[LSApplicationRecord _preferredLaunchArchitecture](self->_record, "_preferredLaunchArchitecture");
}

- (void)clearAdvertisingIdentifier
{
}

- (NSProgress)installProgress
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isPlaceholder];

  if (v4)
  {
    +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 installProgressForBundleID:v6 makeSynchronous:0];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return (NSProgress *)v7;
}

- (NSNumber)staticDiskUsage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 staticUsage];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)dynamicDiskUsage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dynamicUsage];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LSApplicationProxy diskUsage](self, "diskUsage");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 onDemandResourcesUsage];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(v6, "unsignedLongLongValue") + objc_msgSend(v4, "unsignedLongLongValue"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v4) {
      int v8 = v4;
    }
    else {
      int v8 = v6;
    }
    id v7 = v8;
  }

  id v9 = v7;

  return (NSNumber *)v9;
}

- (NSNumber)ODRDiskUsage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 onDemandResourcesUsage];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (BOOL)isInstalled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isInstalled];

  return v3;
}

- (BOOL)isPlaceholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isPlaceholder];

  return v3;
}

- (BOOL)isRestricted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isRestricted];

  return v3;
}

- (BOOL)isRemovedSystemApp
{
  return 0;
}

- (NSArray)plugInKitPlugins
{
  v2 = self;
  objc_sync_enter(v2);
  plugInKitPlugins = v2->_plugInKitPlugins;
  if (!plugInKitPlugins)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v10 = MEMORY[0x1895F87A8];
    uint64_t v11 = 3221225472LL;
    v12 = __38__LSApplicationProxy_plugInKitPlugins__block_invoke;
    id v13 = &unk_189D72430;
    uint64_t v14 = v2;
    id v5 = v4;
    id v15 = v5;
    __LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__((uint64_t)&v10);
    uint64_t v6 = objc_msgSend(v5, "copy", v10, v11, v12, v13, v14);
    id v7 = v2->_plugInKitPlugins;
    v2->_plugInKitPlugins = (NSArray *)v6;

    plugInKitPlugins = v2->_plugInKitPlugins;
  }

  int v8 = plugInKitPlugins;
  objc_sync_exit(v2);

  return v8;
}

void __38__LSApplicationProxy_plugInKitPlugins__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "applicationExtensionRecords", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6) uniqueIdentifier];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[LSPlugInKitProxy pluginKitProxyForUUID:](&OBJC_CLASS___LSPlugInKitProxy, "pluginKitProxyForUUID:", v7);
        int v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8) {
          [*(id *)(a1 + 40) addObject:v8];
        }

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

- (NSString)applicationDSID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringValue];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)familyID
{
  return (NSNumber *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[LSApplicationRecord applicationFamilyID](self->_record, "applicationFamilyID"));
}

- (unint64_t)installType
{
  if (-[LSApplicationProxy isPlaceholder](self, "isPlaceholder")) {
    return -[LSApplicationProxy originalInstallType](self, "originalInstallType");
  }
  else {
    return 0LL;
  }
}

- (unint64_t)originalInstallType
{
  return -[LSApplicationRecord installType](self->_record, "installType");
}

- (NSArray)activityTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allObjects];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)appIDPrefix
{
  id v7 = 0LL;
  v2 = -[LSBundleRecord applicationIdentifier](self->_record, "applicationIdentifier");
  uint64_t v3 = v2;
  if (v2)
  {
    _LSSplitApplicationIdentifier(v2, &v7, 0LL);
    uint64_t v4 = v7;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  id v5 = v4;

  return (NSString *)v5;
}

- (NSNumber)storeFront
{
  v2 = (void *)MEMORY[0x189607968];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeFront"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)externalVersionIdentifier
{
  v2 = (void *)MEMORY[0x189607968];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "versionIdentifier"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)betaExternalVersionIdentifier
{
  v2 = (void *)MEMORY[0x189607968];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "betaVersionIdentifier"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSString)ratingLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 ratingLabel];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sourceAppIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 sourceApp];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)applicationVariant
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 variantID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isAppUpdate
{
  return -[LSApplicationRecord isUpdate](self->_record, "isUpdate");
}

- (BOOL)isNewsstandApp
{
  return (-[LSApplicationRecord _rawBundleFlags](self->_record, "_rawBundleFlags") >> 16) & 1;
}

- (BOOL)isWhitelisted
{
  uint64_t v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:]( v3,  v4,  -[LSApplicationRecord _rawBundleFlags](self->_record, "_rawBundleFlags")) ^ 1;

  return (char)self;
}

- (BOOL)isDeviceBasedVPP
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isDeviceBasedVPP];

  return v3;
}

- (BOOL)supportsODR
{
  return -[LSApplicationRecord supportsOnDemandResources](self->_record, "supportsOnDemandResources");
}

- (BOOL)fileSharingEnabled
{
  return -[LSApplicationRecord isFileSharingEnabled](self->_record, "isFileSharingEnabled");
}

- (BOOL)iconIsPrerendered
{
  return 0;
}

- (BOOL)iconUsesAssetCatalog
{
  return 0;
}

- (BOOL)isPurchasedReDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isPurchasedRedownload];

  return v3;
}

- (BOOL)hasMIDBasedSINF
{
  return -[LSApplicationRecord applicationHasMIDBasedSINF](self->_record, "applicationHasMIDBasedSINF");
}

- (BOOL)missingRequiredSINF
{
  return -[LSApplicationRecord applicationMissingRequiredSINF](self->_record, "applicationMissingRequiredSINF");
}

- (BOOL)isDeletableIgnoringRestrictions
{
  return (-[LSApplicationRecord _rawBundleFlags](self->_record, "_rawBundleFlags") >> 40) & 1;
}

- (id)_managedPersonas
{
  return -[LSApplicationRecord managedPersonas](self->_record, "managedPersonas");
}

- (BOOL)_usesSystemPersona
{
  return (-[LSApplicationRecord _rawBundleFlags](self->_record, "_rawBundleFlags") >> 56) & 1;
}

- (id)groupContainerURLs
{
  return -[LSBundleRecord groupContainerURLs](self->_record, "groupContainerURLs");
}

- (BOOL)isRemoveableSystemApp
{
  return 0;
}

- (BOOL)isWatchKitApp
{
  return 0;
}

- (NSString)complicationPrincipalClass
{
  return 0LL;
}

- (BOOL)isGameCenterEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isGameCenterEnabled];

  return v3;
}

- (BOOL)gameCenterEverEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 wasGameCenterEverEnabled];

  return v3;
}

- (NSNumber)installFailureReason
{
  return (NSNumber *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[LSApplicationRecord placeholderFailureReason](self->_record, "placeholderFailureReason"));
}

- (void)setAlternateIconName:(id)a3 withResult:(id)a4
{
}

- (id)alternateIconName
{
  return -[LSApplicationRecord alternateIconName](self->_record, "alternateIconName");
}

- (id)primaryIconDataForVariant:(int)a3
{
  return 0LL;
}

- (id)iconDataForVariant:(int)a3
{
  return -[LSApplicationProxy iconDataForVariant:withOptions:]( self,  "iconDataForVariant:withOptions:",  *(void *)&a3,  0LL);
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  return 0LL;
}

- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3
{
}

- (NSDictionary)siriActionDefinitionURLs
{
  return -[LSBundleRecord intentDefinitionURLs](self->_record, "intentDefinitionURLs");
}

- (NSSet)claimedDocumentContentTypes
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[LSBundleRecord claimRecords](self->_record, "claimRecords", 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8) typeIdentifiers];
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObjectsFromArray:v9];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)claimedURLSchemes
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[LSBundleRecord claimRecords](self->_record, "claimRecords", 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8) URLSchemes];
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObjectsFromArray:v9];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return (NSSet *)v3;
}

- (id)handlerRankOfClaimForContentType:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 handleFailureInMethod:a2, self, @"LSApplicationProxy.m", 966, @"Invalid parameter not satisfying: %@", @"typeIdentifier != nil" object file lineNumber description];
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  -[LSBundleRecord claimRecords](self->_record, "claimRecords");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    __int16 v9 = 0x8000;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        __int128 v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v11 typeIdentifiers];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          while (2)
          {
            for (uint64_t j = 0LL; j != v15; ++j)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              if (![*(id *)(*((void *)&v24 + 1) + 8 * j) caseInsensitiveCompare:v5])
              {
                [v11 handlerRank];
                __int16 v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
                int v19 = _LSNumericHandlerRankFromHandlerRankString(v18);

                if (v9 <= v19) {
                  __int16 v9 = v19;
                }
                goto LABEL_19;
              }
            }

            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

- (NSNumber)platform
{
  uint64_t v2 = -[LSBundleRecord platform](self->_record, "platform");
  if ((_DWORD)v2)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:v2];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = 0LL;
  }

  return (NSNumber *)v3;
}

- (BOOL)isStandaloneWatchApp
{
  return 0;
}

- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationProxy getGenericTranslocationTargetURL:error:]",  1016LL,  0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)getBundleMetadata
{
  return -[LSApplicationRecord bundleMetadataReturningError:](self->_record, "bundleMetadataReturningError:", 0LL);
}

- (id)installProgressSync
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isPlaceholder];

  if (v4)
  {
    +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 installProgressForBundleID:v6 makeSynchronous:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (int)bundleModTime
{
  return -[LSApplicationRecord _bundleModTime](self->_record, "_bundleModTime");
}

- (id)signerOrganization
{
  return -[LSBundleRecord signerOrganization](self->_record, "signerOrganization");
}

- (id)_stringLocalizerForTable:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  record = self->_record;
  id v5 = a3;
  uint64_t v6 = -[LSBundleRecord platform](record, "platform");
  -[LSBundleRecord SDKVersion](self->_record, "SDKVersion");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LSVersionNumberMakeWithString(v14, v7);
  uint64_t v8 = _LSMakeDYLDVersionFromVersionNumber(v14);

  BOOL v9 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:]( &OBJC_CLASS____LSStringLocalizer,  "useLegacyLocalizationListForPlatform:sdkVersion:",  v6,  v8);
  __int128 v10 = objc_alloc(&OBJC_CLASS____LSStringLocalizer);
  -[LSBundleProxy bundleURL](self, "bundleURL");
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = -[_LSStringLocalizer initWithBundleURL:stringsFile:legacyLocalizationList:]( v10,  "initWithBundleURL:stringsFile:legacyLocalizationList:",  v11,  v5,  v9);

  return v12;
}

- (id)description
{
  id v3 = (void *)NSString;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LSApplicationProxy;
  -[LSApplicationProxy description](&v11, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleURL](self, "bundleURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationProxy appState](self, "appState");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[LSApplicationProxy installType](self, "installType"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@ %@ %@ <%@:%@>", v4, v5, v6, v7, v8];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __50__LSApplicationProxy_forwardingTargetForSelector___block_invoke()
{
  id v0 = -[LSRecord _initInvalid](objc_alloc(&OBJC_CLASS___LSApplicationRecord), "_initInvalid");
  v1 = (void *)forwardingTargetForSelector__invalidRecord;
  forwardingTargetForSelector__invalidRecord = (uint64_t)v0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSApplicationProxy;
  if (-[LSApplicationProxy respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return +[LSApplicationRecord instancesRespondToSelector:]( &OBJC_CLASS___LSApplicationRecord,  "instancesRespondToSelector:",  a3);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LSApplicationProxy;
  -[LSApplicationProxy methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[LSApplicationRecord instanceMethodSignatureForSelector:]( &OBJC_CLASS___LSApplicationRecord,  "instanceMethodSignatureForSelector:",  a3);
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSApplicationProxy;
  id v4 = a3;
  -[LSBundleProxy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_record, @"record", v5.receiver, v5.super_class);
}

- (LSApplicationProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSApplicationProxy;
  objc_super v5 = -[LSBundleProxy initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"record");
    record = v5->_record;
    v5->_record = (LSApplicationRecord *)v6;
  }

  return v5;
}

- (void)detach
{
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)-[LSApplicationRecord valueForKey:](self->_record, "valueForKey:", a3);
}

- (BOOL)userInitiatedUninstall
{
  return self->_userInitiatedUninstall;
}

- (void)setUserInitiatedUninstall:(BOOL)a3
{
  self->_userInitiatedUninstall = a3;
}

- (id)localizedNameForContext:(id)a3
{
  return -[LSApplicationProxy localizedNameForContext:preferredLocalizations:useShortNameOnly:]( self,  "localizedNameForContext:preferredLocalizations:useShortNameOnly:",  a3,  0LL,  0LL);
}

- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4
{
  return -[LSApplicationProxy localizedNameForContext:preferredLocalizations:useShortNameOnly:]( self,  "localizedNameForContext:preferredLocalizations:useShortNameOnly:",  a3,  a4,  0LL);
}

+ (void)applicationProxyForBundleType:(os_log_t)log identifier:isCompanion:URL:itemID:bundleUnit:.cold.1( os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "+[LSApplicationProxy applicationProxyFor*] is not a supported method for getting the LSApplicationProxy for the curr ent process, use +[LSBundleProxy bundleProxyForCurrentProcess] instead.",  v1,  2u);
}

@end