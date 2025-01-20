@interface ControlManager
+ (id)getStringFromXpcMessage:(id)a3 forKey:(const char *)a4;
- (BOOL)allowSTExtractorPluginLoadFromDownloadedMABrain;
- (BOOL)associateFieldsFromRequest:(id)a3 withCommandTracker:(id)a4;
- (BOOL)beforeFirstUnlock;
- (BOOL)categorizeAssetResults:(id)a3 fromCatalogIds:(id)a4 repositoryIds:(id)a5 andPreinstalledIds:(id)a6 intoServerOnlyIds:(id *)a7 installedCatalogIds:(id *)a8 andObsoleteIds:(id *)a9;
- (BOOL)checkEntitlementAndRespondIfErrorForConnection:(id)a3 usingMessage:(id)a4 forAssetType:(id)a5 withCommand:(int64_t)a6;
- (BOOL)checkEntitlementAndRespondIfErrorForConnection:(id)a3 usingMessage:(id)a4 forAssetTypes:(id)a5 withCommand:(int64_t)a6;
- (BOOL)commandRequiresForcedSoftwareUpdateType:(id)a3;
- (BOOL)freedUpEnoughSpace:(int64_t)a3;
- (BOOL)hasOnlyAllowedDifferencesFrom:(id)a3 inAttributes:(id)a4 assetId:(id)a5 assetType:(id)a6 allowed:(id)a7 foundAbsoluteId:(id *)a8 foundDiff:(id *)a9;
- (BOOL)isAllowlistedForCommand:(int64_t)a3;
- (BOOL)isAssetInCatalog:(id)a3 assetId:(id)a4;
- (BOOL)isAssetInCatalog:(id)a3 assetId:(id)a4 withPurpose:(id)a5;
- (BOOL)isAssetTypeOptionalForCommand:(int64_t)a3;
- (BOOL)isAssetTypeRequiredForCommand:(int64_t)a3;
- (BOOL)isCommandAllowedForAllClientsWithoutAssetType:(int64_t)a3;
- (BOOL)isCommandRequiringForcedSoftwareUpdateType:(int64_t)a3;
- (BOOL)isEntitledForCommand:(int64_t)a3 forConnection:(id)a4 forAssetType:(id)a5;
- (BOOL)loadCatalog:(id)a3 catalogAssets:(id *)a4 assetIds:(id *)a5 postedDate:(id *)a6 lastFetchDate:(id *)a7 catalogInfo:(id *)a8;
- (BOOL)loadCatalog:(id)a3 catalogAssets:(id *)a4 assetIds:(id *)a5 postedDate:(id *)a6 lastFetchDate:(id *)a7 catalogInfo:(id *)a8 withPurpose:(id)a9;
- (BOOL)loadRepository:(id)a3 localIds:(id *)a4;
- (BOOL)loadRepository:(id)a3 localIds:(id *)a4 withPurpose:(id)a5;
- (BOOL)purgeAllAssetsInDirectory:(id)a3 clientName:(id)a4 exceptForAssetIds:(id)a5;
- (BOOL)purgeAllAssetsOfType:(id)a3 forPurpose:(id)a4 clientName:(id)a5 exceptForAssetIds:(id)a6;
- (BOOL)purgeCatalogOfType:(id)a3 clientName:(id)a4 withPurpose:(id)a5;
- (BOOL)reclaimSpace;
- (BOOL)returnTypeIncludesInstalledInCatalog:(int64_t)a3;
- (BOOL)returnTypeIncludesObsolete:(int64_t)a3 andHasCatalog:(BOOL)a4;
- (BOOL)returnTypeIncludesPreinstalled:(int64_t)a3;
- (BOOL)returnTypeIncludesServerOnly:(int64_t)a3;
- (ControlManager)init;
- (DownloadManager)downloadManager;
- (MADAnalyticsManager)analytics;
- (NSDictionary)lockedNeverRemoveAutoAssetDescriptors;
- (NSDictionary)lockedOverridableAutoAssetDescriptors;
- (NSDictionary)stagedAutoAssetDescriptors;
- (NSDictionary)unlockedReferencedDescriptors;
- (NSDictionary)unlockedUnreferencedDescriptors;
- (NSMutableDictionary)assetTypeDescriptors;
- (NSString)cacheDeleteOperationName;
- (NSString)garbageCollectionAlterAssetType;
- (NSString)garbageCollectionAlterBehavior;
- (NSString)reclaimUrgencyName;
- (NSString)reclaimVolume;
- (NSString)targetingAmountString;
- (OS_dispatch_queue)analyticsQueue;
- (OS_dispatch_queue)assetQueue;
- (OS_dispatch_queue)cachedeleteQueue;
- (OS_dispatch_queue)metaDataQueue;
- (double)alterSecondsBeforeCollection:(double)a3 forAssetTypeDir:(id)a4 determinedDescriptorType:(int64_t)a5 fromDescriptors:(id)a6 isAutoAsset:(BOOL *)a7 autoAssetDescriptor:(id *)a8 assetFilesystemSize:(int64_t *)a9 retentionPolicy:(int64_t)a10;
- (double)currentTimeInSeconds;
- (double)defaultNumberOfSeconds;
- (double)deltaToCurrentTimeSeconds;
- (double)preciousNumberOfSeconds;
- (id)alterGarbageColletionLevel:(id)a3 basedOnAssetDirectory:(id)a4;
- (id)applyPmvQuery:(id)a3 queryDict:(id)a4 explanation:(id *)a5;
- (id)associateOptionalFields:(int64_t)a3 fromRequest:(id)a4 toCommandRequest:(id)a5 forCommandTracker:(id)a6;
- (id)associateRequiredFields:(int64_t)a3 fromRequest:(id)a4 toCommandRequest:(id)a5 forCommandTracker:(id)a6;
- (id)checkEntitlement:(id)a3 forAssetType:(id)a4;
- (id)checkEntitlement:(id)a3 forAssetTypes:(id)a4;
- (id)chooseDescriptorsOfType:(int64_t)a3;
- (id)convertToArchiveable:(id)a3 incoming:(id)a4 overrideState:(int64_t)a5 filterToIds:(id)a6 withPurpose:(id)a7;
- (id)decodeXpcObject:(id)a3 ofClass:(Class)a4 dataKey:(id)a5 lengthKey:(id)a6 decodeClasses:(id)a7 error:(id *)a8;
- (id)determineBestMatchFor:(id)a3 absoluteId:(id)a4 allowedDifferences:(id)a5 fromResults:(id)a6 isExact:(BOOL *)a7 candidates:(unint64_t *)a8 bestMatch:(id *)a9 differencesFound:(id *)a10 missedTypeAndAssetIdMatch:(id *)a11;
- (id)dictionaryWithArrayOfStringValues:(id)a3 forXpcKey:(const char *)a4 andLengthKey:(const char *)a5 clientName:(id)a6;
- (id)dictionaryWithArrayOfStringValues:(id)a3 forXpcKey:(const char *)a4 andLengthKey:(const char *)a5 failureReason:(id *)a6;
- (id)getAssetAttributes:(id)a3;
- (id)getAssetAttributes:(id)a3 purpose:(id)a4 assetID:(id)a5;
- (id)getCatalogLastModifiedDate:(id)a3 ifFromXmlUrl:(id)a4 withPurpose:(id)a5;
- (id)getMetadataFromCatalog:(id)a3 key:(id)a4 withPurpose:(id)a5;
- (id)getSAFRegistrationBundleID:(id)a3;
- (id)hashToString:(id)a3;
- (id)locateDescriptorForAssetDirectory:(id)a3 fromDescriptors:(id)a4;
- (id)newCatalogLoad:(id)a3;
- (id)newCatalogLoad:(id)a3 withPurpose:(id)a4;
- (id)newExtractor:(id)a3 downloadOptions:(id)a4 sessionID:(id)a5 error:(id *)a6;
- (int)getNotEntitledResultForCommand:(unint64_t)a3;
- (int)reclaimUrgency;
- (int64_t)garbageCollectionDescriptorType:(id)a3;
- (int64_t)getStateOfAssetInCatalog:(id)a3 assetId:(id)a4 withPurpose:(id)a5;
- (int64_t)handleInstallAsset:(id)a3 forType:(id)a4;
- (int64_t)performCacheDeleteCollection:(id)a3 forCollectionType:(int64_t)a4 withGarbageCollectionTypes:(id)a5 cacheDeleteResults:(id)a6;
- (int64_t)performCacheDeleteForGroup:(id)a3 forAssetTypeDir:(id)a4 timeTaken:(double *)a5 cacheDeleteResults:(id)a6;
- (int64_t)performGarbageCollectionOfType:(int64_t)a3 forAssetTypeDir:(id)a4 fromDescriptors:(id)a5 cacheDeleteResults:(id)a6;
- (int64_t)removeDirectoryAtPath:(id)a3 firstRenamingWithExtension:(id)a4;
- (int64_t)targetingPurgeAmount;
- (int64_t)updateLastFetchedDate:(id)a3 assetType:(id)a4 withPurpose:(id)a5 with:(id)a6;
- (void)activityNotification:(id)a3 ofStatusChange:(unint64_t)a4 withReason:(id)a5;
- (void)applyDataVaults;
- (void)cancelDownload:(id)a3 using:(id)a4 for:(id)a5 assetType:(id)a6 purpose:(id)a7 withExtension:(id)a8;
- (void)checkAndInitiateDownloadForAssetType:(id)a3 message:(id)a4 forClientName:(id)a5 usingConnection:(id)a6 requiringClientExtractor:(BOOL)a7;
- (void)cleanObsoleteSURepo;
- (void)determineAssets:(id)a3 clientName:(id)a4 connection:(id)a5 downloadingTasks:(id)a6 message:(id)a7 resultTypes:(int64_t)a8 queryArray:(id)a9;
- (void)determineAssets:(id)a3 clientName:(id)a4 connection:(id)a5 downloadingTasks:(id)a6 message:(id)a7 resultTypes:(int64_t)a8 queryArray:(id)a9 isForSpecificAsset:(BOOL)a10 specificAssetId:(id)a11 specificAllowedDifferences:(id)a12;
- (void)determineOneAsset:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6 specificAssetId:(id)a7 specificAllowedDifferences:(id)a8;
- (void)determinePmv:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6 queryDict:(id)a7;
- (void)dumpClientUsage:(id)a3 using:(id)a4 and:(id)a5 clientName:(id)a6;
- (void)ensureProperDirectoryState;
- (void)ensureSUDownloadTempDir;
- (void)getProductMarketingVersions:(id)a3 and:(id)a4 clientName:(id)a5 assetType:(id)a6;
- (void)getStateOfAsset:(id)a3 incoming:(id)a4 assetType:(id)a5;
- (void)handleCacheDeleteMigration:(id)a3;
- (void)handleClientCommand:(id)a3;
- (void)handleClientConnection:(id)a3 on:(id)a4;
- (void)handleClientConnection:(id)a3 usingDispatchQueue:(id)a4;
- (void)handleDataMigrator:(id)a3 message:(id)a4 clientName:(id)a5;
- (void)handleEnsureDataVault:(id)a3 message:(id)a4 client:(id)a5 clientName:(id)a6;
- (void)handleGarbageCollect:(id)a3 and:(id)a4;
- (void)handleGetAllowNonUserInitiated:(id)a3 message:(id)a4 clientName:(id)a5;
- (void)handleGetMABrainInfo:(id)a3 message:(id)a4 clientName:(id)a5;
- (void)handleGetServerUrl:(id)a3 message:(id)a4 client:(id)a5 clientName:(id)a6;
- (void)handleLoadRequest:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6;
- (void)handleMigrateAssetsRequest:(id)a3 using:(id)a4 and:(id)a5;
- (void)handlePmvRequest:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6;
- (void)handleQueryRequest:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6;
- (void)handleReportingRequest:(id)a3 message:(id)a4 clientName:(id)a5;
- (void)handleSecureMABundleCommand:(id)a3 message:(id)a4 clientName:(id)a5;
- (void)handleServerUrlOverride:(id)a3 message:(id)a4 client:(id)a5 clientName:(id)a6;
- (void)handleUpdateClientUsage:(id)a3 using:(id)a4 and:(id)a5 clientName:(id)a6;
- (void)handleUpdateMABrain:(id)a3 message:(id)a4 clientName:(id)a5;
- (void)loadAssetTypeDescriptors;
- (void)maintainReclaimCountsByCollectionType:(int64_t)a3 reclaimAssetSpace:(int64_t)a4 cacheDeleteResults:(id)a5;
- (void)moveAssetIntoRepo:(id)a3 forType:(id)a4 forAsset:(id)a5 cleanUp:(id)a6 with:(id)a7;
- (void)overrideGCValue:(id)a3 using:(id)a4 and:(id)a5 clientName:(id)a6;
- (void)purgeAll:(id)a3 and:(id)a4 assetTypesList:(id)a5 clientName:(id)a6;
- (void)purgeCatalogs:(id)a3 and:(id)a4 assetTypesList:(id)a5 clientName:(id)a6;
- (void)registerForCacheDeleteMigration;
- (void)removeAllObsoletedV1Assets;
- (void)removeAssetDir:(id)a3 assetType:(id)a4 clientName:(id)a5 using:(id)a6;
- (void)removeDownloadsNotRecentlyInFlight:(id)a3;
- (void)respondToCacheDelete:(BOOL)a3 targetingPurgeAmount:(int64_t)a4 cacheDeleteResults:(id)a5 withUrgency:(int)a6 forVolume:(id)a7 then:(id)a8;
- (void)sendPmvResults:(id)a3 pmvInfo:(id)a4 postedDate:(id)a5 lastFetchedDate:(id)a6 result:(int64_t)a7 connection:(id)a8 message:(id)a9;
- (void)sendQueryResults:(id)a3 assetType:(id)a4 purpose:(id)a5 catalogInfo:(id)a6 returnTypes:(int64_t)a7 postedDate:(id)a8 lastFetchedDate:(id)a9 result:(int64_t)a10 isFiltered:(BOOL)a11 requireSpecificAsset:(BOOL)a12 connection:(id)a13 message:(id)a14 clientName:(id)a15;
- (void)sendStateOfAssetReply:(id)a3 incoming:(id)a4 with:(int64_t)a5;
- (void)setAllowSTExtractorPluginLoadFromDownloadedMABrain:(BOOL)a3;
- (void)setCacheDeleteOperationName:(id)a3;
- (void)setCurrentTimeInSeconds:(double)a3;
- (void)setDefaultNumberOfSeconds:(double)a3;
- (void)setDeltaToCurrentTimeSeconds:(double)a3;
- (void)setGarbageCollectionAlterAssetType:(id)a3;
- (void)setGarbageCollectionAlterBehavior:(id)a3;
- (void)setLockedNeverRemoveAutoAssetDescriptors:(id)a3;
- (void)setLockedOverridableAutoAssetDescriptors:(id)a3;
- (void)setPreciousNumberOfSeconds:(double)a3;
- (void)setPreferenceKeyAsync:(id)a3 andValue:(id)a4 allowNilToClear:(BOOL)a5 replyUsing:(id)a6 and:(id)a7;
- (void)setPreferenceKeySync:(id)a3 andValue:(id)a4 allowNilToClear:(BOOL)a5;
- (void)setPreferences:(id)a3 replyUsing:(id)a4 and:(id)a5;
- (void)setReclaimSpace:(BOOL)a3;
- (void)setReclaimUrgency:(int)a3;
- (void)setReclaimUrgencyName:(id)a3;
- (void)setReclaimVolume:(id)a3;
- (void)setServerConnectionHandler:(id)a3 with:(id)a4 and:(id)a5;
- (void)setStagedAutoAssetDescriptors:(id)a3;
- (void)setTargetingAmountString:(id)a3;
- (void)setTargetingPurgeAmount:(int64_t)a3;
- (void)setUnlockedReferencedDescriptors:(id)a3;
- (void)setUnlockedUnreferencedDescriptors:(id)a3;
- (void)writeDictionaryToFile:(id)a3 to:(id)a4 with:(id)a5;
- (void)writeJsonDictionaryToFile:(id)a3 to:(id)a4 with:(id)a5;
@end

@implementation ControlManager

void __54__ControlManager_setServerConnectionHandler_with_and___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  xpc_type_t type = xpc_get_type(v8);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    [*(id *)(a1 + 32) handleClientConnection:v8 on:*(void *)(a1 + 40)];
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v8 == &_xpc_error_connection_invalid)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager setServerConnectionHandler:with:and:]_block_invoke",  @"[%@] Connection invalid",  v4,  v5,  v6,  v7,  *(void *)(a1 + 48));
    }

    else if (v8 == &_xpc_error_termination_imminent)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager setServerConnectionHandler:with:and:]_block_invoke",  @"[%@] Termination imminent",  v4,  v5,  v6,  v7,  *(void *)(a1 + 48));
    }

    else if (v8 == &_xpc_error_connection_interrupted)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager setServerConnectionHandler:with:and:]_block_invoke",  @"[%@] Connection interrupted",  v4,  v5,  v6,  v7,  *(void *)(a1 + 48));
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager setServerConnectionHandler:with:and:]_block_invoke",  @"[%@] Received unknown event:%lld",  v4,  v5,  v6,  v7,  *(void *)(a1 + 48));
    }
  }

  else if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager setServerConnectionHandler:with:and:]_block_invoke",  @"Server connection handler received unknown type: %@",  v4,  v5,  v6,  v7,  (uint64_t)type);
  }
}

void __44__ControlManager_handleClientConnection_on___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_autoreleasePoolPush();
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v232 = v4;
    string = xpc_dictionary_get_string(v3, "clientName");
    if (string) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    }
    else {
      v12 = 0LL;
    }
    unsigned int uint64 = xpc_dictionary_get_uint64(v3, "messageAction");
    v15 = xpc_dictionary_get_string(v3, "AssetType");
    if (v15) {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
    }
    else {
      v16 = 0LL;
    }
    if ([*(id *)(a1 + 32) isCommandRequiringForcedSoftwareUpdateType:uint64])
    {
      if (v16
        && (-[__CFString isEqualToString:]( v16,  "isEqualToString:",  @"com.apple.MobileAsset.SoftwareUpdate") & 1) == 0)
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ provided asset type %@ when %@ was required",  v17,  v18,  v19,  v20,  (uint64_t)v12);
      }

      v16 = @"com.apple.MobileAsset.SoftwareUpdate";
    }

    if ((uint64 & 0xFFFFFFFD) == 0x18)
    {
      id v21 = extractorDecodeClasses();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      id ObjectFromMessageLogIfDesired = getObjectFromMessageLogIfDesired( v3,  "purgeAssetTypeListLength",  "purgeAssetTypeList",  v22,  0);
      v24 = (void *)objc_claimAutoreleasedReturnValue(ObjectFromMessageLogIfDesired);

      if (v24)
      {
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v24, v29) & 1) != 0)
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"purging all asset types in list: %@",  v30,  v31,  v32,  v33,  (uint64_t)v24);
          v237 = v24;
          id v34 = stringWithoutNewlines((uint64_t)v24);
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          v36 = stringForMAXpcCommand(uint64);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          v228 = (__CFString *)uint64;
          v229 = v37;
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"assetTypes: %@ client: %@, command: %lld (%@)",  v38,  v39,  v40,  v41,  (uint64_t)v35);
          char v42 = 0;
          goto LABEL_27;
        }
      }

      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"purging all asset types",  v25,  v26,  v27,  v28,  v224);
    }

    id v43 = stringWithoutNewlines((uint64_t)v16);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v44 = stringForMAXpcCommand(uint64);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v228 = (__CFString *)uint64;
    v229 = v37;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"assetType: %@ client: %@, command: %lld (%@)",  v45,  v46,  v47,  v48,  (uint64_t)v35);
    v237 = 0LL;
    char v42 = 1;
LABEL_27:

    uint64_t IsInternalAllowed = _MAPreferencesIsInternalAllowed();
    uint64_t v251 = 0LL;
    v252 = &v251;
    uint64_t v253 = 0x2020000000LL;
    char v254 = 0;
    v246[0] = _NSConcreteStackBlock;
    v246[1] = 3221225472LL;
    v246[2] = __44__ControlManager_handleClientConnection_on___block_invoke_2;
    v246[3] = &unk_34FF68;
    v249 = &v251;
    id v247 = *(id *)(a1 + 40);
    id v50 = v3;
    id v248 = v50;
    v235 = objc_retainBlock(v246);
    v240[0] = _NSConcreteStackBlock;
    v240[1] = 3221225472LL;
    v240[2] = __44__ControlManager_handleClientConnection_on___block_invoke_3;
    v240[3] = &unk_34FF90;
    v240[4] = *(void *)(a1 + 32);
    v51 = v16;
    v241 = v51;
    id v52 = v50;
    id v242 = v52;
    id v236 = v12;
    id v243 = v236;
    id v244 = *(id *)(a1 + 40);
    char v245 = 0;
    block = objc_retainBlock(v240);
    v53 = *(void **)(a1 + 32);
    uint64_t v54 = *(void *)(a1 + 40);
    v238 = v51;
    if ((v42 & 1) != 0)
    {
      if (([v53 checkEntitlementAndRespondIfErrorForConnection:v54 usingMessage:v52 forAssetType:v51 withCommand:uint64] & 1) == 0) {
        goto LABEL_41;
      }
    }

    else if (([v53 checkEntitlementAndRespondIfErrorForConnection:v54 usingMessage:v52 forAssetTypes:v237 withCommand:uint64] & 1) == 0)
    {

      v238 = 0LL;
LABEL_41:
      switch(uint64)
      {
        case 1u:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ issued query command for %@",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          [*(id *)(a1 + 32) handleQueryRequest:v238 clientName:v236 connection:*(void *)(a1 + 40) message:v52];
          break;
        case 2u:
          if (!v238) {
            goto LABEL_120;
          }
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ issued meta data download command",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          id DownloadManager = getDownloadManager();
          v69 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
          [v69 registerXmlDownloadJob:v238 using:*(void *)(a1 + 40) with:v52 clientName:v236];
          goto LABEL_148;
        case 3u:
          if (!v238)
          {
LABEL_120:
            sendClientResponse(*(void **)(a1 + 40), v52, 19LL);
            v230 = 0LL;
            v231 = 0LL;
            v234 = 0LL;
            v59 = 0LL;
            v60 = 0LL;
            id v61 = 0LL;
            v62 = 0LL;
            v63 = 0LL;
            v64 = 0LL;
            v65 = 0LL;
            v66 = 0LL;
            xpc_object_t reply = 0LL;
            v238 = 0LL;
            goto LABEL_38;
          }

          if (-[__CFString isEqualToString:]( v238,  "isEqualToString:",  @"com.apple.MobileAsset.SystemApp")) {
            [*(id *)(a1 + 32) isAllowlistedForCommand:uint64];
          }
          dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 48LL), block);
          break;
        case 4u:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"Query for existing NSURL tasks",  v55,  v56,  v57,  v58,  v225);
          BOOL v70 = xpc_dictionary_get_BOOL(v52, "NSUrlState");
          *((_BYTE *)v252 + 24) = v70;
          id v71 = getDownloadManager();
          v69 = (void *)objc_claimAutoreleasedReturnValue(v71);
          [v69 getCurrentInflightDownloads:v235];
          goto LABEL_148;
        case 5u:
          [*(id *)(a1 + 32) removeAssetDir:v52 assetType:v238 clientName:v236 using:*(void *)(a1 + 40)];
          break;
        case 6u:
          v72 = xpc_dictionary_get_string(v52, "AssetId");
          v77 = xpc_dictionary_get_string(v52, "Purpose");
          if (v72) {
            v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v72));
          }
          else {
            v78 = 0LL;
          }
          if (v77) {
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v77));
          }
          else {
            v60 = 0LL;
          }
          if (v78)
          {
            v230 = v78;
            if (isWellFormedAssetId(v78))
            {
              if (isWellFormedPurpose(v60))
              {
                [*(id *)(a1 + 32) cancelDownload:v52 using:*(void *)(a1 + 40) for:v236 assetType:v238 purpose:v60 withExtension:v78];
LABEL_183:
                v231 = 0LL;
                goto LABEL_184;
              }

              v209 = @"Cancel for: %@ of %@ id: %@ failed due to purpose that is not well formed";
            }

            else
            {
              v209 = @"Cancel for: %@ of %@ id: %@ failed due to asset ID that is not well formed";
            }

            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  v209,  v205,  v206,  v207,  v208,  (uint64_t)v236);
            sendClientResponse(*(void **)(a1 + 40), v52, 4LL);
            goto LABEL_183;
          }

          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"Cancel for: %@ of %@ id: %@ failed due to nil asset ID",  v73,  v74,  v75,  v76,  (uint64_t)v236);
          sendClientResponse(*(void **)(a1 + 40), v52, 4LL);
LABEL_159:
          v230 = 0LL;
          v231 = 0LL;
LABEL_184:
          v234 = 0LL;
          v59 = 0LL;
          goto LABEL_34;
        case 7u:
          createExtension(*(void **)(a1 + 40), v52, v238);
          break;
        case 8u:
          [*(id *)(a1 + 32) getStateOfAsset:*(void *)(a1 + 40) incoming:v52 assetType:v238];
          break;
        case 9u:
          v79 = xpc_dictionary_get_string(v52, "pallasUrl");
          if (xpc_dictionary_get_BOOL(v52, "serverOverrideClear"))
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Setting pallas url to nil for asset type '%@'",  v80,  v81,  v82,  v83,  (uint64_t)v236);
            uint64_t v84 = 0LL;
LABEL_126:
            uint64_t v188 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v238, v188) & 1) != 0)
            {
              v189 = @"PallasUrlOverrideV2";
              if ((-[__CFString isEqualToString:](v238, "isEqualToString:", &stru_355768) & 1) == 0) {
                v189 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"PallasUrlOverrideV2",  v238,  v228,  v229));
              }
            }

            else
            {
              v189 = @"PallasUrlOverrideV2";
            }

            [*(id *)(a1 + 32) setPreferenceKeyAsync:v189 andValue:v84 allowNilToClear:1 replyUsing:*(void *)(a1 + 40) and:v52];

            v230 = 0LL;
            v231 = 0LL;
            v234 = 0LL;
            v60 = 0LL;
            id v61 = 0LL;
            v62 = 0LL;
            v63 = 0LL;
            v64 = 0LL;
            v65 = 0LL;
            v59 = (void *)v84;
            goto LABEL_36;
          }

          if (v79)
          {
            uint64_t v84 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v79));
            if (v84)
            {
              v228 = v238;
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Setting pallas V2 url to '%@' for asset type '%@'",  v184,  v185,  v186,  v187,  (uint64_t)v236);
              goto LABEL_126;
            }

            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Setting pallas V2 url to %0x for asset type '%@' failed as the url cannot convert to string",  v184,  v185,  v186,  v187,  (uint64_t)v236);
          }

          else
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Setting pallas V2 url to nil failed for asset type '%@' as it must be cleared explicitly by the framework",  v80,  v81,  v82,  v83,  (uint64_t)v236);
          }

          sendClientResponse(*(void **)(a1 + 40), v52, 2LL);
          break;
        case 0xAu:
          v89 = xpc_dictionary_get_string(v52, "pallasAudience");
          if (v89)
          {
            uint64_t v90 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v89));
            if (!v90)
            {
              _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Setting pallas audience to %0x... cannot convert to string.",  v91,  v92,  v93,  v94,  (uint64_t)v236);
              sendClientResponse(*(void **)(a1 + 40), v52, 2LL);
              goto LABEL_176;
            }

            v228 = v238;
            v95 = (void *)v90;
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Setting Pallas audience to '%@' for asset type '%@'",  v91,  v92,  v93,  v94,  (uint64_t)v236);
          }

          else
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Setting Pallas audience to (null) for asset type '%@'",  v85,  v86,  v87,  v88,  (uint64_t)v236);
            v95 = 0LL;
          }

          v234 = v95;
          uint64_t v190 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v238, v190) & 1) != 0)
          {
            v191 = @"MobileAssetAssetAudience";
            if ((-[__CFString isEqualToString:](v238, "isEqualToString:", &stru_355768) & 1) == 0) {
              v191 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"MobileAssetAssetAudience",  v238,  v228,  v229));
            }
          }

          else
          {
            v191 = @"MobileAssetAssetAudience";
          }

          [*(id *)(a1 + 32) setPreferenceKeyAsync:v191 andValue:v234 allowNilToClear:1 replyUsing:*(void *)(a1 + 40) and:v52];

          v231 = 0LL;
          goto LABEL_32;
        case 0xBu:
          v96 = stringForMAXpcCommand(0xBu);
          v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"received command from client %@ that should be handled by MA XPC layer: %lld (%@)",  v98,  v99,  v100,  v101,  (uint64_t)v236);
          int64_t v102 = 5LL;
          goto LABEL_122;
        case 0xCu:
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"received MA_DUMP_CODE_COVERAGE [deprecated] from client %@",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          int64_t v102 = 5LL;
          goto LABEL_173;
        case 0xDu:
          [*(id *)(a1 + 32) handleServerUrlOverride:v238 message:v52 client:*(void *)(a1 + 40) clientName:v236];
          break;
        case 0xEu:
          if ([*(id *)(a1 + 32) beforeFirstUnlock])
          {
            _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"{handleClientConnection} [MA_REPAIR_STATE] Not able to attempt to repair NSURLSession state since device is before first-unlock",  v103,  v104,  v105,  v106,  v225);
            goto LABEL_172;
          }

          id v183 = getDownloadManager();
          v97 = (void *)objc_claimAutoreleasedReturnValue(v183);
          [v97 queryNSUrlSessiondAndUpdateState];
          int64_t v102 = 0LL;
LABEL_122:

          goto LABEL_173;
        case 0xFu:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"Migrating assets for %@ and %@",  v55,  v56,  v57,  v58,  (uint64_t)v238);
          [*(id *)(a1 + 32) handleMigrateAssetsRequest:v238 using:*(void *)(a1 + 40) and:v52];
          break;
        case 0x10u:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ issued clean v1 for %@",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          cleanV1Assets(*(void **)(a1 + 40), v52, v238);
          break;
        case 0x11u:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ issued space check",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          checkSpaceForDownload(*(void **)(a1 + 40), v52);
          break;
        case 0x12u:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ issued query for installed asset ids for %@",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          handleGetInstalledAssetIds(v238, v236, *(void **)(a1 + 40), v52);
          break;
        case 0x13u:
          id v107 = getDownloadManager();
          v69 = (void *)objc_claimAutoreleasedReturnValue(v107);
          [v69 configDownload:v238 clientName:v236 using:*(void *)(a1 + 40) with:v52];
          goto LABEL_148;
        case 0x14u:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ request asset audience for asset type %@",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          xpc_object_t reply = xpc_dictionary_create_reply(v52);
          _MAPreferencesSync(@"handleClientConnection", @"MA_GET_PALLAS_AUDIENCE");
          id v108 = getDownloadManager();
          v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
          id v61 = [v109 newAssetAudience:IsInternalAllowed assetType:v238];

          if (v61)
          {
            xpc_dictionary_set_string( reply, "pallasAudience", (const char *)[v61 UTF8String]);
            int64_t v114 = 0LL;
          }

          else
          {
            int64_t v114 = 2LL;
          }

          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ found Pallas asset audience %@ for asset type %@",  v110,  v111,  v112,  v113,  (uint64_t)v236);
          sendReply(*(void **)(a1 + 40), reply, v114);
          v230 = 0LL;
          v231 = 0LL;
          v234 = 0LL;
          v59 = 0LL;
          v60 = 0LL;
          goto LABEL_165;
        case 0x15u:
          [*(id *)(a1 + 32) handleUpdateClientUsage:v238 using:*(void *)(a1 + 40) and:v52 clientName:v236];
          break;
        case 0x16u:
          [*(id *)(a1 + 32) dumpClientUsage:v238 using:*(void *)(a1 + 40) and:v52 clientName:v236];
          break;
        case 0x17u:
          [*(id *)(a1 + 32) handleGarbageCollect:*(void *)(a1 + 40) and:v52];
          break;
        case 0x18u:
          [*(id *)(a1 + 32) purgeAll:*(void *)(a1 + 40) and:v52 assetTypesList:v237 clientName:v236];
          break;
        case 0x19u:
          [*(id *)(a1 + 32) overrideGCValue:v238 using:*(void *)(a1 + 40) and:v52 clientName:v236];
          break;
        case 0x1Au:
          [*(id *)(a1 + 32) purgeCatalogs:*(void *)(a1 + 40) and:v52 assetTypesList:v237 clientName:v236];
          break;
        case 0x1Bu:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ issued load command for %@",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          [*(id *)(a1 + 32) handleLoadRequest:v238 clientName:v236 connection:*(void *)(a1 + 40) message:v52];
          break;
        case 0x1Cu:
          v115 = xpc_dictionary_get_string(v52, "Purpose");
          if (v115) {
            v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v115));
          }
          else {
            v116 = 0LL;
          }
          if (isWellFormedPurpose(v116))
          {
            v60 = v116;
            [*(id *)(a1 + 32) cancelDownload:v52 using:*(void *)(a1 + 40) for:v236 assetType:v238 purpose:v116 withExtension:@"xml"];
          }

          else
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"Cancel for: %@ of %@ catalog failed due to purpose that is not well formed",  v192,  v193,  v194,  v195,  (uint64_t)v236);
            v60 = v116;
            sendClientResponse(*(void **)(a1 + 40), v52, 4LL);
          }

          goto LABEL_159;
        case 0x1Du:
          [*(id *)(a1 + 32) cancelDownload:v52 using:*(void *)(a1 + 40) for:v236 assetType:v238 purpose:0 withExtension:@"pmv"];
          v230 = 0LL;
          v231 = 0LL;
          v234 = 0LL;
          v59 = 0LL;
          v60 = 0LL;
          id v61 = 0LL;
          v62 = 0LL;
          v63 = 0LL;
          v64 = 0LL;
          v65 = 0LL;
          v66 = 0LL;
          xpc_object_t reply = 0LL;
          goto LABEL_38;
        case 0x1Eu:
          [*(id *)(a1 + 32) getProductMarketingVersions:*(void *)(a1 + 40) and:v52 clientName:v236 assetType:v238];
          break;
        case 0x1Fu:
          [*(id *)(a1 + 32) handlePmvRequest:v238 clientName:v236 connection:*(void *)(a1 + 40) message:v52];
          break;
        case 0x20u:
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ requested if Pallas is enabled for asset type %@",  v55,  v56,  v57,  v58,  (uint64_t)v236);
          _MAPreferencesSync(@"handleClientConnection", @"MA_GET_PALLAS_ENABLED");
          id v117 = getDownloadManager();
          v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
          unsigned __int8 v119 = [v118 getPallasEnabledForAssetType:v238];

          xpc_object_t v120 = xpc_dictionary_create_reply(v52);
          xpc_object_t reply = v120;
          if (v120)
          {
            xpc_dictionary_set_BOOL(v120, "pallasEnabled", v119);
            int64_t v125 = 0LL;
          }

          else
          {
            int64_t v125 = 2LL;
          }

          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ found Pallas enabled %@ for asset type %@",  v121,  v122,  v123,  v124,  (uint64_t)v236);
          sendReply(*(void **)(a1 + 40), reply, v125);
          goto LABEL_164;
        case 0x21u:
          BOOL v126 = xpc_dictionary_get_BOOL(v52, "pallasEnabled");
          v127 = @"off";
          if (v126) {
            v127 = @"on";
          }
          v128 = v127;
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Setting Pallas enabled to %@ for asset type %@",  v129,  v130,  v131,  v132,  (uint64_t)v236);
          uint64_t v133 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v238, v133) & 1) != 0)
          {
            v134 = @"EnableLiveAssetServerV2";
            if ((-[__CFString isEqualToString:](v238, "isEqualToString:", &stru_355768) & 1) == 0) {
              v134 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"EnableLiveAssetServerV2",  v238,  v238,  v229));
            }
          }

          else
          {
            v134 = @"EnableLiveAssetServerV2";
          }

          [*(id *)(a1 + 32) setPreferenceKeyAsync:v134 andValue:v128 allowNilToClear:0 replyUsing:*(void *)(a1 + 40) and:v52];

          v234 = 0LL;
          v59 = 0LL;
          v230 = 0LL;
          v231 = v128;
          goto LABEL_33;
        case 0x22u:
          v135 = xpc_dictionary_get_string(v52, "tokenPath");
          if (!v135)
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"Attempting to clear previously set tokenPath",  v136,  v137,  v138,  v139,  v225);
            v69 = 0LL;
            goto LABEL_142;
          }

          v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v135));
          v69 = v140;
          if (v140)
          {
            if ((isWellFormedTokenFileName(v140) & 1) != 0)
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"Attempting to set tokenPath to %@",  v145,  v146,  v147,  v148,  (uint64_t)v69);
LABEL_142:
              [*(id *)(a1 + 32) setPreferenceKeyAsync:@"MobileAssetTokenFile" andValue:v69 allowNilToClear:1 replyUsing:*(void *)(a1 + 40) and:v52];
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"Done setting tokenPath",  v196,  v197,  v198,  v199,  v226);
              goto LABEL_148;
            }

            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Token file name is not well formed and cannot be set",  v145,  v146,  v147,  v148,  (uint64_t)v236);
            sendClientResponse(*(void **)(a1 + 40), v52, 5LL);
          }

          else
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke",  @"%@ Attempting to set tokenPath, but cannot convert argument to string",  v141,  v142,  v143,  v144,  (uint64_t)v236);
            sendClientResponse(*(void **)(a1 + 40), v52, 2LL);
            v69 = 0LL;
          }

- (void)handleClientConnection:(id)a3 on:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __44__ControlManager_handleClientConnection_on___block_invoke;
  v9[3] = &unk_34FF40;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  xpc_connection_set_event_handler((xpc_connection_t)v8, v9);
  if (v7) {
    xpc_connection_set_target_queue((xpc_connection_t)v8, v7);
  }
  xpc_connection_activate((xpc_connection_t)v8);
}

- (BOOL)isCommandRequiringForcedSoftwareUpdateType:(int64_t)a3
{
  if ((a3 - 1) >= 0x2E)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager isCommandRequiringForcedSoftwareUpdateType:]",  @"Unknown Command: %ld (using default command behavior of not needing a software update asset type)",  v3,  v4,  v5,  v6,  a3);
    LOBYTE(v7) = 0;
  }

  else
  {
    return (0x70000000uLL >> (a3 - 1)) & 1;
  }

  return v7;
}

- (BOOL)checkEntitlementAndRespondIfErrorForConnection:(id)a3 usingMessage:(id)a4 forAssetType:(id)a5 withCommand:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v17 = -[ControlManager isEntitledForCommand:forConnection:forAssetType:]( self,  "isEntitledForCommand:forConnection:forAssetType:",  a6,  v10,  v12);
  if ((v17 & 1) == 0)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager checkEntitlementAndRespondIfErrorForConnection:usingMessage:forAssetType:withCommand:]",  @"failed entitlement check for: %lld %@",  v13,  v14,  v15,  v16,  a6);
    sendClientResponse( v10,  v11,  -[ControlManager getNotEntitledResultForCommand:](self, "getNotEntitledResultForCommand:", a6));
  }

  return v17 ^ 1;
}

- (BOOL)isEntitledForCommand:(int64_t)a3 forConnection:(id)a4 forAssetType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = -[ControlManager isAssetTypeRequiredForCommand:](self, "isAssetTypeRequiredForCommand:", a3);
  if (!v9 && -[ControlManager isAssetTypeOptionalForCommand:](self, "isAssetTypeOptionalForCommand:", a3))
  {
    if (_MobileAssetCheckConnectionEntitlementWithName( (uint64_t)v8,  @"com.apple.private.assets.change-daemon-config"))
    {
      id v11 = stringForMAXpcCommand(a3);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v11);
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager isEntitledForCommand:forConnection:forAssetType:]",  @"no global entitlement found, command %lld (%@) allows asset-type specific entitlement.",  v12,  v13,  v14,  v15,  a3);

      goto LABEL_6;
    }

    LOBYTE(v10) = 1;
LABEL_19:
    if (!-[ControlManager isCommandAllowedForAllClientsWithoutAssetType:]( self,  "isCommandAllowedForAllClientsWithoutAssetType:",  a3)
      && _MobileAssetCheckConnectionEntitlementWithName( (uint64_t)v8,  @"com.apple.private.assets.change-daemon-config"))
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager isEntitledForCommand:forConnection:forAssetType:]",  @"failed entitlement check for: configuration change",  v33,  v34,  v35,  v36,  v43);
      goto LABEL_23;
    }

- (BOOL)isAssetTypeRequiredForCommand:(int64_t)a3
{
  if ((a3 - 1) >= 0x2E)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager isAssetTypeRequiredForCommand:]",  @"Unknown Command: %lld (using default command behavior of needing an asset type)",  v3,  v4,  v5,  v6,  a3);
    LOBYTE(v7) = 1;
  }

  else
  {
    return (0x229FFB6D4F7uLL >> (a3 - 1)) & 1;
  }

  return v7;
}

- (BOOL)isAllowlistedForCommand:(int64_t)a3
{
  if (((1LL << a3) & 0x7BEFE6907610LL) == 0)
  {
    if (((1LL << a3) & 0x410196F89EELL) != 0)
    {
      if (-[ControlManager isAssetTypeRequiredForCommand:](self, "isAssetTypeRequiredForCommand:", a3)) {
        return 1;
      }
      if (a3 <= 0x2A)
      {
        if (((1LL << a3) & 0x7FFFFFDFFFELL) != 0)
        {
          uint64_t v13 = stringForMAXpcCommand(a3);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v13);
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager isAllowlistedForCommand:]",  @"Can't grant allowlist entitlement for %lld (%@)",  v14,  v15,  v16,  v17,  a3);

          return 0;
        }
      }

      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager isAllowlistedForCommand:]",  @"Unknown Command: %lld (not allowing the type to bypass entitlement)",  v8,  v9,  v10,  v11,  a3);
      return 0;
    }

- (BOOL)isAssetTypeOptionalForCommand:(int64_t)a3
{
  if ((a3 - 1) >= 0x2E)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager isAssetTypeOptionalForCommand:]",  @"Unknown Command: %lld (using default command behavior of needing an asset type)",  v3,  v4,  v5,  v6,  a3);
    LOBYTE(v7) = 0;
  }

  else
  {
    return (0x800001000uLL >> (a3 - 1)) & 1;
  }

  return v7;
}

- (int)getNotEntitledResultForCommand:(unint64_t)a3
{
  int v7 = 3;
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getNotEntitledResultForCommand:]",  @"Unknown Command: %lld (using default result for command that is not entitled)",  v3,  v4,  v5,  v6,  a3);
  return v7;
}

- (BOOL)isCommandAllowedForAllClientsWithoutAssetType:(int64_t)a3
{
  uint64_t v5 = stringForMAXpcCommand(a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v5);
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager isCommandAllowedForAllClientsWithoutAssetType:]",  @"Unknown Command: %lld (%@), using default command behavior of not allowing allowlist without asset type",  v6,  v7,  v8,  v9,  a3);

  return 0;
}

- (void)handleQueryRequest:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t uint64 = xpc_dictionary_get_uint64(v13, "returnAssetTypes");
  unsigned __int8 v15 = -[ControlManager beforeFirstUnlock](self, "beforeFirstUnlock");
  BOOL v16 = xpc_dictionary_get_BOOL(v13, "doNotBlockBeforeFirstUnlock");
  BOOL v17 = xpc_dictionary_get_BOOL(v13, "doNotBlockOnNetworkStatus");
  BOOL v18 = uint64 != 3 && ((v15 & v16 | v17) & 1) == 0;
  uint64_t v19 = stringForMAQueryReturnTypes(uint64);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v39 = uint64;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleQueryRequest:clientName:connection:message:]",  @"%@ queried for: %@ with returnType of: %lld (%@) - %@",  v20,  v21,  v22,  v23,  (uint64_t)v11);

  string = xpc_dictionary_get_string(v13, "Purpose");
  uint64_t v25 = normalizePurposeFromUtf8((uint64_t)string);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  if (!isWellFormedPurpose(v26))
  {
    uint64_t v36 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    LOWORD(v39) = 0;
    -[ControlManager sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requireSpecificAsset:connection:message:clientName:]( self,  "sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requireSpe cificAsset:connection:message:clientName:",  v36,  v10,  @"<invalid>",  0LL,  uint64,  0LL,  0LL,  8LL,  v39,  v12,  v13,  v11);
LABEL_12:

    goto LABEL_17;
  }

  data = xpc_dictionary_get_data(v13, (const char *)[@"QueryParams" UTF8String], length);
  if (!data)
  {
    uint64_t v36 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    LOWORD(v39) = 0;
    -[ControlManager sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requireSpecificAsset:connection:message:clientName:]( self,  "sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requireSpe cificAsset:connection:message:clientName:",  v36,  v10,  v26,  0LL,  uint64,  0LL,  0LL,  8LL,  v39,  v12,  v13,  v11);
    goto LABEL_12;
  }

  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  data,  length[0],  0LL));
  uint64_t v28 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v41,  0LL);
  id DecodeClasses = queryDecodeClasses();
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(DecodeClasses);
  uint64_t v42 = v28;
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v28,  "decodeObjectOfClasses:forKey:",  v30,  NSKeyedArchiveRootObjectKey));

  if (v31 && (uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v31, v32) & 1) == 0))
  {
    v37 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    LOWORD(v39) = 1;
    -[ControlManager sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requireSpecificAsset:connection:message:clientName:]( self,  "sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requireSpe cificAsset:connection:message:clientName:",  v37,  v10,  v26,  0LL,  uint64,  0LL,  0LL,  8LL,  v39,  v12,  v13,  v11);
  }

  else
  {
    -[NSKeyedUnarchiver finishDecoding](v42, "finishDecoding");
    if (v18)
    {
      id DownloadManager = getDownloadManager();
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = __67__ControlManager_handleQueryRequest_clientName_connection_message___block_invoke_2;
      v43[3] = &unk_34FDB0;
      v43[4] = self;
      id v44 = v10;
      id v45 = v11;
      id v46 = v12;
      id v47 = v13;
      uint64_t v49 = uint64;
      id v48 = v31;
      [v34 allDownloading:v43];

      uint64_t v35 = v44;
    }

    else
    {
      assetQueue = (dispatch_queue_s *)self->_assetQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __67__ControlManager_handleQueryRequest_clientName_connection_message___block_invoke;
      block[3] = &unk_34E330;
      block[4] = self;
      id v51 = v10;
      id v52 = v11;
      id v53 = v12;
      id v54 = v13;
      uint64_t v56 = uint64;
      id v55 = v31;
      dispatch_async(assetQueue, block);

      uint64_t v35 = v51;
    }
  }

LABEL_17:
}

- (BOOL)beforeFirstUnlock
{
  return +[DownloadManager isDeviceBeforeFirstUnlock](&OBJC_CLASS___DownloadManager, "isDeviceBeforeFirstUnlock");
}

void __67__ControlManager_handleQueryRequest_clientName_connection_message___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(dispatch_queue_s **)(v4 + 48);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __67__ControlManager_handleQueryRequest_clientName_connection_message___block_invoke_3;
  v11[3] = &unk_34FD88;
  v11[4] = v4;
  id v12 = v5;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = v3;
  id v7 = *(id *)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  id v16 = v7;
  uint64_t v18 = v8;
  id v17 = v9;
  id v10 = v3;
  dispatch_async(v6, v11);
}

id __67__ControlManager_handleQueryRequest_clientName_connection_message___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineAssets:*(void *)(a1 + 40) clientName:*(void *)(a1 + 48) connection:*(void *)(a1 + 56) downloadingTasks:*(void *)(a1 + 64) message:*(void *)(a1 + 72) resultTypes:*(void *)(a1 + 88) queryArray:*(void *)(a1 + 80)];
}

- (void)determineAssets:(id)a3 clientName:(id)a4 connection:(id)a5 downloadingTasks:(id)a6 message:(id)a7 resultTypes:(int64_t)a8 queryArray:(id)a9
{
  LOBYTE(v9) = 0;
  -[ControlManager determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:isForSpecificAsset:specificAssetId:specificAllowedDifferences:]( self,  "determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:isForSpecificAsset:specificAss etId:specificAllowedDifferences:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  v9,  0LL,  0LL);
}

- (void)determineAssets:(id)a3 clientName:(id)a4 connection:(id)a5 downloadingTasks:(id)a6 message:(id)a7 resultTypes:(int64_t)a8 queryArray:(id)a9 isForSpecificAsset:(BOOL)a10 specificAssetId:(id)a11 specificAllowedDifferences:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v157 = a9;
  int64_t v19 = a8;
  id v149 = a11;
  id v148 = a12;
  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  id v21 = a5;
  dispatch_assert_queue_V2(assetQueue);
  unsigned __int8 v119 = v18;
  uint64_t v22 = v18;
  uint64_t v23 = self;
  string = xpc_dictionary_get_string(v22, "Purpose");
  uint64_t v25 = normalizePurposeFromUtf8((uint64_t)string);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  BOOL v143 = isWellFormedPurpose(v26);
  id v116 = v16;
  uint64_t v156 = v17;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:isFo rSpecificAsset:specificAssetId:specificAllowedDifferences:]",  @"%@ queried for: %@ with returnType of: %lld with Purpose: %@",  v27,  v28,  v29,  v30,  (uint64_t)v17);
  LODWORD(assetQueue) = -[ControlManager returnTypeIncludesPreinstalled:](self, "returnTypeIncludesPreinstalled:", v19);
  id v172 = 0LL;
  v173[0] = 0LL;
  PreinstalledAssetIds = getPreinstalledAssetIds(v16, v173, &v172);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(PreinstalledAssetIds);
  id v142 = v173[0];
  id v141 = v172;
  uint64_t v133 = v21;
  int v144 = (int)assetQueue;
  if (v32) {
    uint64_t v123 = (char *)[v32 count];
  }
  else {
    uint64_t v123 = 0LL;
  }
  unsigned int v152 = -[ControlManager returnTypeIncludesInstalledInCatalog:](self, "returnTypeIncludesInstalledInCatalog:", v19);
  id v171 = 0LL;
  unsigned __int8 v33 = -[ControlManager loadRepository:localIds:withPurpose:]( self,  "loadRepository:localIds:withPurpose:",  v16,  &v171,  v26);
  id v38 = v171;
  if ((v33 & 1) == 0)
  {
    id v116 = v16;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:is ForSpecificAsset:specificAssetId:specificAllowedDifferences:]",  @"%@ unable to load repository for: %@",  v34,  v35,  v36,  v37,  (uint64_t)v17);
  }

  uint64_t v39 = v16;
  id v128 = [v38 count];
  unsigned int v150 = -[ControlManager returnTypeIncludesServerOnly:](v23, "returnTypeIncludesServerOnly:", v19);
  id v169 = 0LL;
  id v170 = 0LL;
  id v167 = 0LL;
  id v168 = 0LL;
  id v166 = 0LL;
  unsigned __int8 v40 = -[ControlManager loadCatalog:catalogAssets:assetIds:postedDate:lastFetchDate:catalogInfo:withPurpose:]( v23,  "loadCatalog:catalogAssets:assetIds:postedDate:lastFetchDate:catalogInfo:withPurpose:",  v16,  &v170,  &v169,  &v168,  &v167,  &v166,  v26,  v116,  v19,  v26);
  id v41 = v170;
  id v42 = v169;
  id v130 = v168;
  id v129 = v167;
  id v154 = v166;
  if ((v40 & 1) == 0) {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:is ForSpecificAsset:specificAssetId:specificAllowedDifferences:]",  @"%@ unable to load catalog for: %@",  v43,  v44,  v45,  v46,  (uint64_t)v17);
  }
  id v127 = [v42 count];
  id v47 = filterResults(v157, v41);
  v140 = (void *)objc_claimAutoreleasedReturnValue(v47);
  uint64_t v153 = [v140 count];
  id v48 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
  id v164 = 0LL;
  id v165 = 0LL;
  id v163 = 0LL;
  uint64_t v49 = v39;
  uint64_t v131 = v42;
  uint64_t v132 = v38;
  unsigned __int8 v50 = -[ControlManager categorizeAssetResults:fromCatalogIds:repositoryIds:andPreinstalledIds:intoServerOnlyIds:installedCatalogIds:andObsoleteIds:]( v23,  "categorizeAssetResults:fromCatalogIds:repositoryIds:andPreinstalledIds:intoServerOnlyIds:installedCatalogIds:andObsoleteIds:",  v39,  v42,  v38,  v32,  &v165,  &v164,  &v163);
  id v138 = v165;
  id v139 = v164;
  id v137 = v163;
  if ((v50 & 1) == 0) {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:is ForSpecificAsset:specificAssetId:specificAllowedDifferences:]",  @"%@ unable to categorize query results for: %@",  v51,  v52,  v53,  v54,  (uint64_t)v156);
  }
  unsigned int v55 = -[ControlManager returnTypeIncludesObsolete:andHasCatalog:]( v23,  "returnTypeIncludesObsolete:andHasCatalog:",  v19,  v41 != 0LL);
  unsigned int v56 = v55;
  uint64_t v146 = v41;
  v134 = v32;
  unint64_t v57 = v19;
  if (v152)
  {
    uint64_t v58 = repositoryPath(v39);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = dataFillInstalledWithPurpose(v39, v139, v41, v59, v26);
    id v61 = (void *)objc_claimAutoreleasedReturnValue(v60);

    id v62 = filterResults(v157, v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:]( v23,  "convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:",  v39,  v63,  2LL,  0LL,  v26));
    mergeDictionaries(v48, v64);
    v65 = (char *)[v61 count];
    id v147 = [v64 count];

    if (!v56)
    {
LABEL_12:
      id v122 = 0LL;
      v66 = v157;
      goto LABEL_15;
    }
  }

  else
  {
    id v147 = 0LL;
    v65 = 0LL;
    if (!v55) {
      goto LABEL_12;
    }
  }

  v67 = repositoryPath(v49);
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  v69 = dataFillInstalledWithPurpose(v49, v137, 0LL, v68, v26);
  BOOL v70 = (void *)objc_claimAutoreleasedReturnValue(v69);

  v66 = v157;
  id v71 = filterResults(v157, v70);
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:]( v23,  "convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:",  v49,  v72,  3LL,  0LL,  v26));
  mergeDictionaries(v48, v73);
  v65 = &v65[(void)[v70 count]];
  id v122 = [v73 count];

LABEL_15:
  BOOL v126 = v65;
  if (v144)
  {
    id RepositoryPath = getRepositoryPath(@"/System/Library/PreinstalledAssetsV2/RequiredByOs");
    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
    id PreInstalledAssets = getPreInstalledAssets(v75, v49, v66, 0LL);
    v77 = (void *)objc_claimAutoreleasedReturnValue(PreInstalledAssets);

    v78 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:]( v23,  "convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:",  v49,  v77,  5LL,  v142,  v26));
    mergeDictionaries(v48, v78);
    id v79 = getRepositoryPath(@"/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs");
    uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
    id v81 = getPreInstalledAssets(v80, v49, v66, 0LL);
    uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(v81);

    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:]( v23,  "convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:",  v49,  v82,  6LL,  v141,  v26));
    mergeDictionaries(v48, v83);
    id v121 = [v78 count];
    id v120 = [v83 count];
  }

  else
  {
    id v120 = 0LL;
    id v121 = 0LL;
  }

  if (v150)
  {
    uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:]( v23,  "convertToArchiveable:incoming:overrideState:filterToIds:withPurpose:",  v49,  v140,  1LL,  v138,  v26));
    mergeDictionaries(v48, v84);
    uint64_t v85 = (char *)[v84 count];
  }

  else
  {
    uint64_t v85 = 0LL;
  }

  if (v143) {
    unint64_t v86 = 0LL;
  }
  else {
    unint64_t v86 = 8LL;
  }
  uint64_t v162 = 0LL;
  char v161 = 0;
  uint64_t v87 = v48;
  uint64_t v88 = v87;
  if (a10)
  {
    id v159 = 0LL;
    id v160 = 0LL;
    id v158 = 0LL;
    v89 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[ControlManager determineBestMatchFor:absoluteId:allowedDifferences:fromResults:isExact:candidates:bestMatch:differencesFound:missedTypeAndAssetIdMatch:]( v23,  "determineBestMatchFor:absoluteId:allowedDifferences:fromResults:isExact:candidates: bestMatch:differencesFound:missedTypeAndAssetIdMatch:",  v49,  v149,  v148,  v87,  &v161,  &v162,  &v160,  &v159,  &v158));
    id v135 = v160;
    id v90 = v159;
    id v145 = v158;

    uint64_t v91 = (char *)-[NSMutableDictionary count](v88, "count");
    if ((unint64_t)v91 <= 1)
    {
      uint64_t v92 = v146;
      if (v91 == (_BYTE *)&dword_0 + 1)
      {
        if (v161) {
          unint64_t v86 = 0LL;
        }
        else {
          unint64_t v86 = 14LL;
        }
      }

      else
      {
        unint64_t v86 = 0LL;
      }

      goto LABEL_29;
    }

    unint64_t v86 = 13LL;
  }

  else
  {
    id v135 = 0LL;
    id v145 = 0LL;
    id v90 = 0LL;
    v89 = v87;
  }

  uint64_t v92 = v146;
LABEL_29:
  uint64_t v136 = v90;
  uint64_t v93 = v26;
  if (!v92 && !v161 && v57 != 3) {
    unint64_t v86 = 2LL;
  }
  uint64_t v124 = v89;
  id v95 = -[NSMutableDictionary count](v89, "count");
  int64_t v125 = v88;
  id v118 = -[NSMutableDictionary count](v88, "count");
  v96 = v85;
  int64_t v97 = v153 - &v85[(void)v147];
  uint64_t v98 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 512LL);
  uint64_t v99 = stringForMAQueryReturnTypes(v57);
  uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
  unint64_t v151 = v57;
  -[NSMutableString appendFormat:]( v98,  "appendFormat:",  @"%@ queried for: %@ with returnTypes %lld (%@) ",  v156,  v49,  v57,  v100);

  uint64_t v101 = stringForMAQueryResult(v86);
  int64_t v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
  -[NSMutableString appendFormat:]( v98,  "appendFormat:",  @"and found %ld assets with result %ld (%@) ",  v95,  v86,  v102);

  if (v93)
  {
    uint64_t v103 = @"which is not well-formed ";
    if (v143) {
      uint64_t v103 = &stru_355768;
    }
    -[NSMutableString appendFormat:](v98, "appendFormat:", @"for purpose (%@) %@", v93, v103);
  }

  uint64_t v104 = v93;
  -[NSMutableString appendFormat:]( v98,  "appendFormat:",  @"--> From %ld listed in the catalog and %ld local (%ld/%ld downloaded, %ld preinstalled)",  v127,  &v123[(void)v128],  v126,  v128,  v123);
  id v105 = stringWithoutNewlines((uint64_t)v154);
  uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
  -[NSMutableString appendFormat:](v98, "appendFormat:", @"--> Catalog info (%@) ", v106);

  id v107 = stringForMAQueryReturnTypes(v151);
  id v108 = (void *)objc_claimAutoreleasedReturnValue(v107);
  -[NSMutableString appendFormat:]( v98,  "appendFormat:",  @"--> Filtered for %@ to %ld in catalog (%ld installed, %ld server-only, %ld preinstalled), ",  v108,  v153,  v147,  v96,  v97);

  -[NSMutableString appendFormat:]( v98,  "appendFormat:",  @"%ld installedNotInCatalog, %ld installedWithOS, %ld requiredByOS; ",
    v122,
    v120,
    v121);
  char v109 = (char)v157;
  if (v157)
  {
    if ([v157 count])
    {
      Array = stringForQueryArray(v157);
      uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue(Array);
      -[NSMutableString appendFormat:](v98, "appendFormat:", @"the query params are: %@ ", v111);

      char v109 = 1;
    }

    else
    {
      char v109 = 0;
    }
  }

  -[NSMutableString appendFormat:](v98, "appendFormat:", @"--> Merged to %ld assets ", v118);
  if (a10)
  {
    -[NSMutableString appendFormat:]( v98,  "appendFormat:",  @"--> Matched %ld asset (%@) to requested ID (%@) ",  v95,  v135,  v149);
    if (v161) {
      -[NSMutableString appendFormat:](v98, "appendFormat:", @"exactMatch ");
    }
    -[NSMutableString appendFormat:]( v98,  "appendFormat:",  @". It was matched out of %ld candidates with allowedDifferences %@ ",  v162,  v148);
    if (v136) {
      -[NSMutableString appendFormat:](v98, "appendFormat:", @"(the matched asset differed by %@) ", v136);
    }
    if (v145) {
      -[NSMutableString appendFormat:]( v98,  "appendFormat:",  @"(another asset matched the assetType and assetId, but was not a match for the criteria: %@) ",  v145);
    }
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:isFo rSpecificAsset:specificAssetId:specificAllowedDifferences:]",  @"%@",  v112,  v113,  v114,  v115,  (uint64_t)v98);
  BYTE1(v117) = a10;
  LOBYTE(v117) = v109;
  -[ControlManager sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requireSpecificAsset:connection:message:clientName:]( v23,  "sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requireSpeci ficAsset:connection:message:clientName:",  v124,  v49,  v104,  v154,  v151,  v130,  v129,  v86,  v117,  v133,  v119,  v156);
}

- (BOOL)returnTypeIncludesPreinstalled:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

- (BOOL)returnTypeIncludesInstalledInCatalog:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x27u >> a3);
}

- (BOOL)loadRepository:(id)a3 localIds:(id *)a4 withPurpose:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v16 = normalizedAssetType((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = repositoryPath(v8);
  int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathComponent:v17]);
  if (v7)
  {
    id v21 = purposeDirectoryName(v7);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v20 stringByAppendingPathComponent:v22]);

    uint64_t v20 = (void *)v23;
  }

  InstalledAssetIds = getInstalledAssetIds(v20);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(InstalledAssetIds);
  uint64_t v26 = v25;
  if (a4) {
    *a4 = v25;
  }

  return v26 != 0LL;
}

- (BOOL)returnTypeIncludesServerOnly:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x35u >> a3);
}

- (BOOL)loadCatalog:(id)a3 catalogAssets:(id *)a4 assetIds:(id *)a5 postedDate:(id *)a6 lastFetchDate:(id *)a7 catalogInfo:(id *)a8 withPurpose:(id)a9
{
  id v11 = a3;
  id v12 = a9;
  uint64_t v13 = objc_autoreleasePoolPush();
  id v14 = -[ControlManager newCatalogLoad:withPurpose:](self, "newCatalogLoad:withPurpose:", v11, v12);
  int64_t v19 = v14;
  id v38 = v12;
  if (v14)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"lastTimeChecked"]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"postedDate"]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"catalogInfo"]);
    AssetsFromXml = getAssetsFromXml(v11, v19);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(AssetsFromXml);
    if (v28)
    {
      uint64_t v29 = objc_alloc(&OBJC_CLASS___NSMutableSet);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 allKeys]);
      uint64_t v31 = -[NSMutableSet initWithArray:](v29, "initWithArray:", v30);

      BOOL v32 = 1;
      goto LABEL_7;
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager loadCatalog:catalogAssets:assetIds:postedDate:lastFetchDate:catalogInfo:withPurpose:]",  @"Could not get asset list out of catalog for %@",  v24,  v25,  v26,  v27,  (uint64_t)v11);
    uint64_t v31 = 0LL;
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager loadCatalog:catalogAssets:assetIds:postedDate:lastFetchDate:catalogInfo:withPurpose:]",  @"Could not load catalog for %@",  v15,  v16,  v17,  v18,  (uint64_t)v11);
    id v21 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v31 = 0LL;
    uint64_t v28 = 0LL;
  }

  BOOL v32 = 0;
LABEL_7:

  objc_autoreleasePoolPop(v13);
  if (a4) {
    *a4 = v28;
  }
  if (a5) {
    *a5 = v31;
  }
  if (a6) {
    *a6 = v21;
  }
  if (a7) {
    *a7 = v20;
  }
  if (a8) {
    *a8 = v22;
  }

  return v32;
}

- (id)newCatalogLoad:(id)a3 withPurpose:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__15;
  uint64_t v26 = __Block_byref_object_dispose__15;
  id v27 = 0LL;
  id PathToAssetFileWithPurpose = getPathToAssetFileWithPurpose(v6, v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(PathToAssetFileWithPurpose);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager newCatalogLoad:withPurpose:]",  @"Catalog fileLocation: %@",  v10,  v11,  v12,  v13,  (uint64_t)v9);
  if (v9)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v15 = [v14 fileExistsAtPath:v9];

    if (v15)
    {
      metaDataQueue = (dispatch_queue_s *)self->_metaDataQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __45__ControlManager_newCatalogLoad_withPurpose___block_invoke;
      block[3] = &unk_34DB48;
      id v21 = &v22;
      id v20 = v9;
      dispatch_sync(metaDataQueue, block);
    }
  }

  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (BOOL)categorizeAssetResults:(id)a3 fromCatalogIds:(id)a4 repositoryIds:(id)a5 andPreinstalledIds:(id)a6 intoServerOnlyIds:(id *)a7 installedCatalogIds:(id *)a8 andObsoleteIds:(id *)a9
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [v15 mutableCopy];
  [v16 intersectSet:v14];
  id v17 = [v15 mutableCopy];
  [v17 minusSet:v14];
  [v17 minusSet:v13];

  id v18 = [v14 mutableCopy];
  [v18 minusSet:v15];

  if (a8) {
    *a8 = v16;
  }
  if (a7) {
    *a7 = v17;
  }
  if (a9) {
    *a9 = v18;
  }

  return 1;
}

- (BOOL)returnTypeIncludesObsolete:(int64_t)a3 andHasCatalog:(BOOL)a4
{
  BOOL v4 = a3 == 6 && a4;
  return (unint64_t)(a3 - 1) < 2 || v4;
}

- (id)convertToArchiveable:(id)a3 incoming:(id)a4 overrideState:(int64_t)a5 filterToIds:(id)a6 withPurpose:(id)a7
{
  id v29 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a7;
  id v27 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v28 = v10;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v13 = v10;
  id v14 = v12;
  id obj = (id)objc_claimAutoreleasedReturnValue([v13 allKeys]);
  id v31 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v33;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v15);
        id v17 = objc_autoreleasePoolPush();
        if (!v11 || [v11 containsObject:v16])
        {
          id v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          int64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v16]);
          id v20 = [v19 mutableCopy];

          if (v14) {
            [v20 setObject:v14 forKey:@"AssetPurpose"];
          }
          -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v20, @"AssetProperties");
          id v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v16, @"AssetId");
          -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v29, @"AssetType");
          uint64_t v22 = v14;
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
          -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v23, @"AssetState");

          id v14 = v22;
          -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v21, @"AssetAddedProperties");
          -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v18, v16);
        }

        objc_autoreleasePoolPop(v17);
        id v15 = (char *)v15 + 1;
      }

      while (v31 != v15);
      id v31 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v31);
  }

  return v27;
}

- (void)sendQueryResults:(id)a3 assetType:(id)a4 purpose:(id)a5 catalogInfo:(id)a6 returnTypes:(int64_t)a7 postedDate:(id)a8 lastFetchedDate:(id)a9 result:(int64_t)a10 isFiltered:(BOOL)a11 requireSpecificAsset:(BOOL)a12 connection:(id)a13 message:(id)a14 clientName:(id)a15
{
  id v19 = a3;
  id v58 = a4;
  id v56 = a5;
  id v20 = a6;
  unint64_t v21 = (unint64_t)a8;
  unint64_t v22 = (unint64_t)a9;
  uint64_t v23 = (_xpc_connection_s *)a13;
  id v24 = a14;
  id v25 = a15;
  uint64_t v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (v19)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 allValues]);
    -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, @"assetsToFrameWork");
  }

  v60 = (void *)v22;
  id v61 = (void *)v21;
  unsigned int v55 = v25;
  if (v21 | v22)
  {
    uint64_t v28 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v29 = v28;
    if (v21) {
      -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v21, @"postedDate");
    }
    if (v22) {
      -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v22, @"lastTimeChecked");
    }
    -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v29, @"metaToFrameWork");
    uint64_t v54 = v29;
    if (v20)
    {
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v20, v30) & 1) != 0) {
        -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v20, @"catalogInfoToFrameWork");
      }
    }
  }

  else
  {
    uint64_t v54 = 0LL;
  }

  v72[0] = 0LL;
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v26,  1LL,  v72));
  id v32 = v72[0];
  id v62 = v20;
  v59 = v24;
  unint64_t v57 = v26;
  if (!v32 && v31)
  {
    __int128 v33 = v23;
    __int128 v34 = v24;
    xpc_object_t reply = xpc_dictionary_create_reply(v34);
    if (!reply)
    {
      id v41 = self;
      int64_t v40 = a7;
      goto LABEL_19;
    }

    xpc_object_t v37 = reply;
    id v38 = (const char *)[@"xmlData" UTF8String];
    id v39 = v31;
    xpc_dictionary_set_data(v37, v38, [v39 bytes], (size_t)objc_msgSend(v39, "length"));
    id v41 = self;
    int64_t v40 = a7;
    goto LABEL_17;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:resu lt:isFiltered:requireSpecificAsset:connection:message:clientName:]",  @"returnXml Encoding error: %@",  v42,  v43,  v44,  v45,  (uint64_t)v32);
  __int128 v33 = v23;
  xpc_object_t v37 = xpc_dictionary_create_reply(v24);
  id v39 = 0LL;
  id v31 = 0LL;
  a10 = 10LL;
  id v41 = self;
  int64_t v40 = a7;
  if (v37)
  {
LABEL_17:
    xpc_dictionary_set_int64(v37, "Result", a10);
    xpc_connection_send_message(v33, v37);

    id v31 = v39;
  }

- (MADAnalyticsManager)analytics
{
  return self->_analytics;
}

- (void)handleGetServerUrl:(id)a3 message:(id)a4 client:(id)a5 clientName:(id)a6
{
  id v25 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (_isAssetTypeAllowedToGetServerUrl(v25))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ASAssetMetadataUpdatePolicy policy](&OBJC_CLASS___ASAssetMetadataUpdatePolicy, "policy"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serverURLForAssetType:v25]);

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleGetServerUrl:message:client:clientName:]",  @"client %@ requested server URL for asset type %@ and the url is %@",  v18,  v19,  v20,  v21,  (uint64_t)v11);
    xpc_object_t reply = xpc_dictionary_create_reply(v9);
    uint64_t v23 = reply;
    if (v17 && reply)
    {
      id v24 = objc_claimAutoreleasedReturnValue([v17 absoluteString]);
      xpc_dictionary_set_string(v23, "BaseUrlKey", (const char *)[v24 UTF8String]);
    }

    else if (!reply)
    {
      sendClientResponse(v10, v9, 2LL);
      goto LABEL_9;
    }

    sendReply(v10, v23, 0LL);
LABEL_9:

    goto LABEL_10;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleGetServerUrl:message:client:clientName:]",  @"client %@ requested server URL for asset type %@ and the asset type is not allowed.",  v12,  v13,  v14,  v15,  (uint64_t)v11);
  sendClientResponse(v10, v9, 3LL);
LABEL_10:
}

- (BOOL)checkEntitlementAndRespondIfErrorForConnection:(id)a3 usingMessage:(id)a4 forAssetTypes:(id)a5 withCommand:(int64_t)a6
{
  id v34 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v16 = v11;
  if (!v11)
  {
    BOOL v28 = 0;
    BOOL v29 = 0;
LABEL_16:
    if (!v29)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager checkEntitlementAndRespondIfErrorForConnection:usingMessage:forAssetTypes:withCommand:]",  @"failed entitlement check for: empty list %lld",  v12,  v13,  v14,  v15,  a6);
      sendClientResponse( v34,  v10,  -[ControlManager getNotEntitledResultForCommand:](self, "getNotEntitledResultForCommand:", a6));
      BOOL v28 = 1;
    }

    goto LABEL_18;
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v11;
  id v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    id v18 = v17;
    id v31 = v16;
    id v32 = v10;
    int v19 = 0;
    uint64_t v20 = *(void *)v36;
    while (2)
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        uint64_t v23 = objc_autoreleasePoolPush();
        if (!-[ControlManager isEntitledForCommand:forConnection:forAssetType:]( self,  "isEntitledForCommand:forConnection:forAssetType:",  a6,  v34,  v22))
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager checkEntitlementAndRespondIfErrorForConnection:usingMessage:forAssetTypes:withCommand:]",  @"failed entitlement check for: one %lld %@",  v24,  v25,  v26,  v27,  a6);
          id v10 = v32;
          sendClientResponse( v34,  v32,  -[ControlManager getNotEntitledResultForCommand:](self, "getNotEntitledResultForCommand:", a6));
          objc_autoreleasePoolPop(v23);
          BOOL v28 = 1;
          goto LABEL_12;
        }

        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager checkEntitlementAndRespondIfErrorForConnection:usingMessage:forAssetTypes:withCommand:]",  @"passed entitlement check for: one %lld %@",  v24,  v25,  v26,  v27,  a6);
        objc_autoreleasePoolPop(v23);
        int v19 = 1;
      }

      id v18 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v18) {
        continue;
      }
      break;
    }

    BOOL v28 = 0;
    id v10 = v32;
LABEL_12:
    uint64_t v16 = v31;
  }

  else
  {
    BOOL v28 = 0;
    int v19 = 0;
  }

  BOOL v29 = v19 != 0;
  if (!v28) {
    goto LABEL_16;
  }
LABEL_18:

  return v28;
}

- (void)purgeAll:(id)a3 and:(id)a4 assetTypesList:(id)a5 clientName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = -[ControlManager beforeFirstUnlock](self, "beforeFirstUnlock");
  id v77 = [v12 count];
  id v78 = v12;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeAll:and:assetTypesList:clientName:]",  @"{purgeAll} %@ requested purge-all | asset-types:%ld\n%@",  v15,  v16,  v17,  v18,  (uint64_t)v13);
  int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v12));
  uint64_t v85 = self;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager dictionaryWithArrayOfStringValues:forXpcKey:andLengthKey:clientName:]( self,  "dictionaryWithArrayOfStringValues:forXpcKey:andLengthKey:clientName:",  v11,  "purgeAssetTypePreservingList",  "purgeAssetTypePreservingListLength",  v13));
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  id v21 = v19;
  id v22 = [v21 countByEnumeratingWithState:&v108 objects:v114 count:16];
  uint64_t v92 = v10;
  if (v22)
  {
    id v23 = v22;
    unsigned int context = v14;
    unint64_t v86 = v20;
    uint64_t v88 = (uint64_t)v13;
    id v90 = v12;
    uint64_t v24 = v11;
    uint64_t v25 = 0LL;
    int v26 = 0;
    uint64_t v27 = *(void *)v109;
    while (2)
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v109 != v27) {
          objc_enumerationMutation(v21);
        }
        BOOL v29 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)i);
        uint64_t v30 = objc_autoreleasePoolPush();
        BOOL v31 = isWellFormedAssetType(v29);
        if (!v31)
        {
          id v13 = (id)v88;
          _MobileAssetLog( v31,  3,  (uint64_t)"-[ControlManager purgeAll:and:assetTypesList:clientName:]",  @"{purgeAll} %@ requested purge-all with an asset-type that is not well formed | assetType:%@",  v32,  v33,  v34,  v35,  v88);
          id v10 = v92;
          id v11 = v24;
          sendClientResponse(v92, v24, 5LL);
          objc_autoreleasePoolPop(v30);

          goto LABEL_17;
        }

        if ((isSoftwareUpdateType(v29) & 1) == 0)
        {
          if (v25) {
            __int128 v36 = v25;
          }
          else {
            __int128 v36 = v29;
          }
          id v37 = v36;

          int v26 = 1;
          uint64_t v25 = v37;
        }

        objc_autoreleasePoolPop(v30);
      }

      id v23 = [v21 countByEnumeratingWithState:&v108 objects:v114 count:16];
      if (v23) {
        continue;
      }
      break;
    }

    if ((v26 & context) == 1)
    {
      id v13 = (id)v88;
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAll:and:assetTypesList:clientName:]",  @"{purgeAll} %@ requested purge-all that cannot occur before first unlock | assetType:%@",  v38,  v39,  v40,  v41,  v88);
      id v10 = v92;
      id v11 = v24;
      sendClientResponse(v92, v24, 11LL);
LABEL_17:
      id v12 = v90;
      uint64_t v20 = v86;
      goto LABEL_44;
    }

    id v11 = v24;
    id v13 = (id)v88;
    id v12 = v90;
    uint64_t v20 = v86;
    id v10 = v92;
  }

  else
  {

    uint64_t v25 = 0LL;
  }

  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
  id v43 = [v42 countByEnumeratingWithState:&v104 objects:v113 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v105;
    id v81 = v11;
    uint64_t v82 = v42;
    uint64_t v89 = (uint64_t)v13;
    id v91 = v12;
    uint64_t v87 = v20;
    uint64_t v79 = *(void *)v105;
    while (2)
    {
      uint64_t v45 = 0LL;
      id v80 = v43;
      do
      {
        if (*(void *)v105 != v44) {
          objc_enumerationMutation(v42);
        }
        uint64_t v46 = *(void **)(*((void *)&v104 + 1) + 8LL * (void)v45);
        id v47 = objc_autoreleasePoolPush();
        if (!isWellFormedAssetType(v46))
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAll:and:assetTypesList:clientName:]",  @"{purgeAll} %@ requested purge-all with preserved asset type is not well formed | assetType:%@",  v48,  v49,  v50,  v51,  (uint64_t)v13);
          id v11 = v81;
          sendClientResponse(v10, v81, 5LL);
LABEL_39:
          objc_autoreleasePoolPop(v47);

          goto LABEL_44;
        }

        contexta = v47;
        __int128 v103 = 0u;
        __int128 v101 = 0u;
        __int128 v102 = 0u;
        __int128 v100 = 0u;
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v46]);
        id v53 = [v52 countByEnumeratingWithState:&v100 objects:v112 count:16];
        if (v53)
        {
          id v54 = v53;
          uint64_t v55 = *(void *)v101;
          while (2)
          {
            for (j = 0LL; j != v54; j = (char *)j + 1)
            {
              if (*(void *)v101 != v55) {
                objc_enumerationMutation(v52);
              }
              unint64_t v57 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)j);
              id v58 = objc_autoreleasePoolPush();
              BOOL v59 = isWellFormedAssetId(v57);
              if (!v59)
              {
                id v13 = (id)v89;
                _MobileAssetLog( v59,  3,  (uint64_t)"-[ControlManager purgeAll:and:assetTypesList:clientName:]",  @"{purgeAll} %@ requested purge-all with preserved asset ID that is not well formed | assetType:%@ | assetID:%@",  v60,  v61,  v62,  v63,  v89);
                id v10 = v92;
                id v11 = v81;
                sendClientResponse(v92, v81, 5LL);
                objc_autoreleasePoolPop(v58);

                id v12 = v91;
                uint64_t v20 = v87;
                uint64_t v42 = v82;
                id v47 = contexta;
                goto LABEL_39;
              }

              objc_autoreleasePoolPop(v58);
            }

            id v54 = [v52 countByEnumeratingWithState:&v100 objects:v112 count:16];
            if (v54) {
              continue;
            }
            break;
          }
        }

        objc_autoreleasePoolPop(contexta);
        uint64_t v45 = (char *)v45 + 1;
        uint64_t v44 = v79;
        id v12 = v91;
        id v10 = v92;
        uint64_t v20 = v87;
        id v13 = (id)v89;
        uint64_t v42 = v82;
      }

      while (v45 != v80);
      id v43 = [v82 countByEnumeratingWithState:&v104 objects:v113 count:16];
      id v11 = v81;
      if (v43) {
        continue;
      }
      break;
    }
  }

  string = xpc_dictionary_get_string(v11, "Purpose");
  id v65 = normalizePurposeFromUtf8((uint64_t)string);
  id v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  if (isWellFormedPurpose(v66))
  {
    if (!+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v66, @"auto"))
    {
      id DownloadManager = getDownloadManager();
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472LL;
      v93[2] = __57__ControlManager_purgeAll_and_assetTypesList_clientName___block_invoke;
      v93[3] = &unk_34FEF0;
      v93[4] = v85;
      id v94 = v12;
      id v95 = v20;
      id v96 = v66;
      id v97 = v13;
      id v98 = v92;
      id v99 = v11;
      objc_msgSend( v76,  "cancelAllDownloading:withPurpose:includingAssets:includingCatalog:includingOther:clientName:then:",  v21,  v96,  1,  0,  1,  v97,  v93,  v77,  v78);

      goto LABEL_43;
    }

    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAll:and:assetTypesList:clientName:]",  @"{purgeAll} %@ requested purge-all for purpose that does not support purge-all | purpose:%@",  v71,  v72,  v73,  v74,  (uint64_t)v13);
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAll:and:assetTypesList:clientName:]",  @"{purgeAll} %@ requested purge-all for purpose that is not well formed",  v67,  v68,  v69,  v70,  (uint64_t)v13);
  }

  sendClientResponse(v92, v11, 5LL);
LABEL_43:

  id v10 = v92;
LABEL_44:
}

- (id)dictionaryWithArrayOfStringValues:(id)a3 forXpcKey:(const char *)a4 andLengthKey:(const char *)a5 clientName:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = preservedIdsDecodeClasses();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id ObjectFromMessageLogIfDesired = getObjectFromMessageLogIfDesired(v9, a5, a4, v12, 0);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(ObjectFromMessageLogIfDesired);

  if (v14)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager dictionaryWithArrayOfStringValues:forXpcKey:andLengthKey:clientName:]",  @"%@ gave invalid preserved IDs dict",  v16,  v17,  v18,  v19,  (uint64_t)v10);

      unsigned int v14 = 0LL;
    }
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v20 = v14;
  id v21 = [v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
  id v22 = v20;
  if (!v21) {
    goto LABEL_28;
  }
  id v23 = v21;
  uint64_t v53 = (uint64_t)v10;
  id v54 = v9;
  uint64_t v24 = *(void *)v60;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  while (2)
  {
    int v26 = 0LL;
    id v52 = v23;
    do
    {
      if (*(void *)v60 != v24) {
        objc_enumerationMutation(v20);
      }
      uint64_t v27 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)v26);
      uint64_t v32 = objc_autoreleasePoolPush();
      if (!v27 || (uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v27, v33) & 1) == 0))
      {
        id v10 = (id)v53;
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager dictionaryWithArrayOfStringValues:forXpcKey:andLengthKey:clientName:]",  @"%@ gave invalid preserved IDs key",  v28,  v29,  v30,  v31,  v53);
        id v38 = v20;
LABEL_27:

        objc_autoreleasePoolPop(v32);
        id v22 = 0LL;
        id v9 = v54;
        goto LABEL_28;
      }

      id v38 = (id)objc_claimAutoreleasedReturnValue([v20 objectForKey:v27]);
      if (!v38 || (uint64_t v39 = objc_opt_class(p_ivars[153]), (objc_opt_isKindOfClass(v38, v39) & 1) == 0))
      {
        id v10 = (id)v53;
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager dictionaryWithArrayOfStringValues:forXpcKey:andLengthKey:clientName:]",  @"%@ gave invalid preserved IDs array for %@",  v34,  v35,  v36,  v37,  v53);

        goto LABEL_27;
      }

      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      id v38 = v38;
      id v40 = [v38 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v40)
      {
        id v45 = v40;
        uint64_t v46 = *(void *)v56;
        uint64_t v51 = v24;
        while (2)
        {
          for (i = 0LL; i != v45; i = (char *)i + 1)
          {
            if (*(void *)v56 != v46) {
              objc_enumerationMutation(v38);
            }
            uint64_t v48 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
            if (v48)
            {
              uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0) {
                continue;
              }
            }

            id v10 = (id)v53;
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager dictionaryWithArrayOfStringValues:forXpcKey:andLengthKey:clientName:]",  @"%@ gave invalid preserved ID %@ for %@",  v41,  v42,  v43,  v44,  v53);

            goto LABEL_27;
          }

          id v45 = [v38 countByEnumeratingWithState:&v55 objects:v63 count:16];
          uint64_t v24 = v51;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          if (v45) {
            continue;
          }
          break;
        }
      }

      if (!v20)
      {
        id v10 = (id)v53;
        goto LABEL_27;
      }

      objc_autoreleasePoolPop(v32);
      int v26 = (char *)v26 + 1;
    }

    while (v26 != v52);
    id v23 = [v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v23) {
      continue;
    }
    break;
  }

  id v22 = v20;
  id v10 = (id)v53;
  id v9 = v54;
LABEL_28:

  return v22;
}

void __57__ControlManager_purgeAll_and_assetTypesList_clientName___block_invoke(uint64_t a1, char a2)
{
  BOOL v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 48LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __57__ControlManager_purgeAll_and_assetTypesList_clientName___block_invoke_2;
  v8[3] = &unk_34FEC8;
  id v9 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  char v16 = a2;
  id v14 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 80);
  dispatch_async(v5, v8);
}

void __57__ControlManager_purgeAll_and_assetTypesList_clientName___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v9 = *(id *)(a1 + 32);
  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v10)
  {

    goto LABEL_12;
  }

  id v11 = v10;
  int v12 = 0;
  uint64_t v13 = *(void *)v36;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v36 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
      char v16 = objc_autoreleasePoolPush();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v15]);
      v12 |= [*(id *)(a1 + 48) purgeAllAssetsOfType:v15 forPurpose:*(void *)(a1 + 56) clientName:*(void *)(a1 + 64) exceptForAssetIds:v17] ^ 1;

      objc_autoreleasePoolPop(v16);
    }

    id v11 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  }

  while (v11);

  if ((v12 & 1) == 0)
  {
LABEL_12:
    uint64_t v24 = *(void *)(a1 + 64);
    [*(id *)(a1 + 32) count];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeAll:and:assetTypesList:clientName:]_block_invoke_2",  @"{purgeAll} %@ requested purge-all has finished successfully | asset-types:%ld\n%@",  v25,  v26,  v27,  v28,  v24);
    if (*(_BYTE *)(a1 + 88))
    {
      int64_t v23 = 0LL;
      goto LABEL_15;
    }

- (BOOL)purgeAllAssetsOfType:(id)a3 forPurpose:(id)a4 clientName:(id)a5 exceptForAssetIds:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = repositoryPath(v10);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (!v10 || (uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v10, v20) & 1) == 0))
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAllAssetsOfType:forPurpose:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsOfType} %@ attempted to purge on invalid asset-type",  v15,  v16,  v17,  v18,  (uint64_t)v12);
LABEL_10:
    char v44 = 0;
    goto LABEL_11;
  }

  id v24 = normalizedAssetType((uint64_t)v10, v21, v22, v23, v15, v16, v17, v18);
  uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
  if (!v25)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAllAssetsOfType:forPurpose:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsOfType} %@ specified asset-type that could not be normalized",  v26,  v27,  v28,  v29,  (uint64_t)v12);
    goto LABEL_10;
  }

  uint64_t v30 = (void *)v25;
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathComponent:v25]);
  if (v35)
  {
    if (v11)
    {
      if (!isWellFormedPurpose(v11))
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAllAssetsOfType:forPurpose:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsOfType} %@ specified invalid purpose:%@ | assetType:%@",  v36,  v37,  v38,  v39,  (uint64_t)v12);
        goto LABEL_17;
      }

      if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v11, @"auto"))
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAllAssetsOfType:forPurpose:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsOfType} %@ specified unsupported purpose:%@ | assetType:%@",  v40,  v41,  v42,  v43,  (uint64_t)v12);
LABEL_17:

        goto LABEL_10;
      }

      uint64_t v87 = v19;
      id v67 = purposeDirectoryName(v11);
      uint64_t v88 = v35;
      uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(v67);
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingPathComponent:"));
      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v68));
      unsigned __int8 v47 = -[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]( self,  "purgeAllAssetsInDirectory:clientName:exceptForAssetIds:");
      uint64_t v83 = v68;
      finishPartiallyPurgedAssets(v68, 1u, 0);
      uint64_t v46 = 0LL;
      __int128 v35 = 0LL;
    }

    else
    {
      uint64_t v48 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"purpose_%@",  @"auto");
      if ([v35 containsString:v48])
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAllAssetsOfType:forPurpose:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsOfType} %@ specified unsupported path:%@ | assetType:%@",  v49,  v50,  v51,  v52,  (uint64_t)v12);

        goto LABEL_17;
      }

      unint64_t v86 = v48;
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v35));
      unsigned __int8 v47 = -[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]( self,  "purgeAllAssetsInDirectory:clientName:exceptForAssetIds:",  v46,  v12,  v13);
      id PurposeDirectoriesAtPath = getPurposeDirectoriesAtPath(v46);
      uint64_t v54 = objc_claimAutoreleasedReturnValue(PurposeDirectoriesAtPath);
      uint64_t v87 = v19;
      uint64_t v88 = v35;
      uint64_t v79 = (void *)v54;
      if (v54)
      {
        id v80 = v46;
        uint64_t v89 = v30;
        id v84 = v10;
        __int128 v59 = (void *)v54;
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeAllAssetsOfType:forPurpose:clientName:exceptForAssetIds:]",  @"Found purpose directories to purge: %@",  v55,  v56,  v57,  v58,  v54);
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        id v60 = v59;
        id v61 = [v60 countByEnumeratingWithState:&v91 objects:v95 count:16];
        if (v61)
        {
          id v62 = v61;
          uint64_t v63 = *(void *)v92;
          do
          {
            for (i = 0LL; i != v62; i = (char *)i + 1)
            {
              if (*(void *)v92 != v63) {
                objc_enumerationMutation(v60);
              }
              uint64_t v65 = *(void *)(*((void *)&v91 + 1) + 8LL * (void)i);
              id v66 = objc_autoreleasePoolPush();
              if (!-[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]( self,  "purgeAllAssetsInDirectory:clientName:exceptForAssetIds:",  v65,  v12,  v13)) {
                unsigned __int8 v47 = 0;
              }
              objc_autoreleasePoolPop(v66);
            }

            id v62 = [v60 countByEnumeratingWithState:&v91 objects:v95 count:16];
          }

          while (v62);
        }

        id v11 = 0LL;
        id v10 = v84;
        __int128 v35 = v88;
        uint64_t v30 = v89;
        uint64_t v46 = v80;
      }

      finishPartiallyPurgedAssets(v35, 1u, 1);

      uint64_t v83 = 0LL;
      uint64_t v85 = 0LL;
      uint64_t v82 = 0LL;
      __int128 v35 = v79;
    }
  }

  else
  {
    uint64_t v87 = v19;
    uint64_t v88 = 0LL;
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAllAssetsOfType:forPurpose:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsOfType} %@ attempted to create asset-type directory to purge but failed | assetType:%@",  v31,  v32,  v33,  v34,  (uint64_t)v12);
    uint64_t v83 = 0LL;
    uint64_t v85 = 0LL;
    uint64_t v82 = 0LL;
    uint64_t v46 = 0LL;
    unsigned __int8 v47 = 0;
  }

  id v90 = v30;
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs");
  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v70 stringByAppendingPathComponent:v30]);

  if (v71)
  {
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v71));
    id v81 = v46;
    id v77 = v10;
    unsigned __int8 v78 = -[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]( self,  "purgeAllAssetsInDirectory:clientName:exceptForAssetIds:",  v76,  v12,  v13);
    finishPartiallyPurgedAssets(v71, 1u, 0);
    char v44 = v78 & v47;
    id v10 = v77;
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeAllAssetsOfType:forPurpose:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsOfType} %@ specified asset-type where could not determine pre-installed asset path | assetType:%@",  v72,  v73,  v74,  v75,  (uint64_t)v12);

    char v44 = 0;
  }

  uint64_t v19 = v87;
LABEL_11:

  return v44;
}

- (BOOL)purgeAllAssetsInDirectory:(id)a3 clientName:(id)a4 exceptForAssetIds:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int context = objc_autoreleasePoolPush();
  id AssetsAtPath = getAssetsAtPath(v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(AssetsAtPath);
  uint64_t v43 = v8;
  [v12 count];
  unsigned __int8 v47 = v9;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsInDirectory} %@ requested purge of %lld assets | assetTypeDirectory:%@",  v13,  v14,  v15,  v16,  (uint64_t)v9);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = v12;
  id v17 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v17)
  {
    id v18 = v17;
    char v44 = 1;
    uint64_t v46 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
        uint64_t v21 = objc_autoreleasePoolPush();
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 lastPathComponent]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByDeletingPathExtension]);

        if (v10 && [v10 containsObject:v23])
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsInDirectory} %@ requested purge (skipped purge of asset to be preserved) | assetDirectory:%@ | assetID:%@",  v24,  v25,  v26,  v27,  (uint64_t)v47);
        }

        else
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager getSAFRegistrationBundleID:](self, "getSAFRegistrationBundleID:", v20));
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
          unint64_t v30 = -[ControlManager removeDirectoryAtPath:firstRenamingWithExtension:]( self,  "removeDirectoryAtPath:firstRenamingWithExtension:",  v29,  @".purged");

          if (v30 == 3)
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsInDirectory} %@ requested purge (skipped purge [MAPurgeAssetDidntExist]) | assetDirectory:%@",  v31,  v32,  v33,  v34,  (uint64_t)v47);
          }

          else if (v30)
          {
            __int128 v35 = stringForMAPurgeResult(v30);
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v35);
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsInDirectory} %@ requested purge (failed) | assetDirectory:%@ | result:%lld(%@)",  v36,  v37,  v38,  v39,  (uint64_t)v47);

            char v44 = 0;
          }

          else
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeAllAssetsInDirectory:clientName:exceptForAssetIds:]",  @"{purgeAllAssetsInDirectory} %@ requested purge (successfully purged) | assetDirectory:%@",  v31,  v32,  v33,  v34,  (uint64_t)v47);
            -[ControlManager updateSpaceAttributionForBundleID:assetPath:doRegistration:]( self,  "updateSpaceAttributionForBundleID:assetPath:doRegistration:",  v28,  v20,  0LL);
          }
        }

        objc_autoreleasePoolPop(v21);
      }

      id v18 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }

    while (v18);
  }

  else
  {
    char v44 = 1;
  }

  objc_autoreleasePoolPop(context);
  return v44 & 1;
}

id __67__ControlManager_handleQueryRequest_clientName_connection_message___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineAssets:*(void *)(a1 + 40) clientName:*(void *)(a1 + 48) connection:*(void *)(a1 + 56) downloadingTasks:0 message:*(void *)(a1 + 64) resultTypes:*(void *)(a1 + 80) queryArray:*(void *)(a1 + 72)];
}

- (void)removeAllObsoletedV1Assets
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v3 = self->_assetTypeDescriptors;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
  if (v4)
  {
    id v5 = v4;
    id v6 = @"RemoveV1Assets";
    uint64_t v7 = *(void *)v29;
    uint64_t v27 = v3;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v8);
        id v10 = objc_autoreleasePoolPush();
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_assetTypeDescriptors, "objectForKey:", v9));
        id v12 = v11;
        if (v11)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v6]);
          if (v17
            && (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v17, v18) & 1) != 0)
            && [v17 BOOLValue])
          {
            uint64_t v19 = v6;
            uint64_t v20 = objc_claimAutoreleasedReturnValue([v12 objectForKey:@"Asset Type"]);
            uint64_t v25 = (void *)v20;
            if (v20)
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager removeAllObsoletedV1Assets]",  @"removeAllObsoletedV1Assets Checking: %@ for V1 Assets",  v21,  v22,  v23,  v24,  v20);
              cleanV1Assets(0LL, 0LL, v25);
            }

            else
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager removeAllObsoletedV1Assets]",  @"removeAllObsoletedV1Assets Skipping: %@ not removing its V1 assets as assetType is nil in descriptor",  v21,  v22,  v23,  v24,  v9);
            }

            id v6 = v19;
            id v3 = v27;
          }

          else
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager removeAllObsoletedV1Assets]",  @"removeAllObsoletedV1Assets Skipping: %@ not removing its V1 assets",  v13,  v14,  v15,  v16,  v9);
          }
        }

        objc_autoreleasePoolPop(v10);
        id v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      id v5 = v26;
    }

    while (v26);
  }
}

- (void)applyDataVaults
{
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v3 = self->_assetTypeDescriptors;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v30;
    __int128 v28 = v3;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v7);
        uint64_t v9 = objc_autoreleasePoolPush();
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_assetTypeDescriptors, "objectForKey:", v8));
        id v11 = v10;
        if (v10)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Make Repository Data Vault"]);
          if (v16
            && (uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v16, v17) & 1) != 0)
            && [v16 BOOLValue])
          {
            uint64_t v18 = objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Asset Type"]);
            uint64_t v23 = (void *)v18;
            if (v18)
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager applyDataVaults]",  @"Making: %@ into a datavault",  v19,  v20,  v21,  v22,  v18);
              id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
              id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v25));
              makeDataVaultAtUrl(v23, v26);

              id v3 = v28;
            }

            else
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager applyDataVaults]",  @"Skipping: %@ not making it a datavault as assetType is nil in descriptor",  v19,  v20,  v21,  v22,  v8);
            }
          }

          else
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager applyDataVaults]",  @"Skipping: %@ not making it a datavault",  v12,  v13,  v14,  v15,  v8);
          }
        }

        objc_autoreleasePoolPop(v9);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
      id v5 = v27;
    }

    while (v27);
  }
}

- (void)loadAssetTypeDescriptors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"/System/Library/AssetTypeDescriptors/"));
  NSURLResourceKey v31 = NSURLIsRegularFileKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  id v29 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v4 options:4 error:&v29]);
  id v6 = v29;

  if (v5)
  {
    id v21 = v6;
    uint64_t v22 = v5;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v11);
          uint64_t v13 = objc_autoreleasePoolPush();
          id v24 = 0LL;
          unsigned int v14 = [v12 getResourceValue:&v24 forKey:NSURLIsRegularFileKey error:0];
          id v15 = v24;
          uint64_t v16 = v15;
          if (!v14 || [v15 BOOLValue])
          {
            uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v12,  v21,  v22));
            if (v17)
            {
              uint64_t v18 = (void *)v17;
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByDeletingPathExtension]);

              -[NSMutableDictionary setObject:forKey:](self->_assetTypeDescriptors, "setObject:forKey:", v18, v20);
            }
          }

          objc_autoreleasePoolPop(v13);
          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }

      while (v9);
    }

    id v6 = v21;
    id v5 = v22;
  }
}

- (id)getSAFRegistrationBundleID:(id)a3
{
  return 0LL;
}

- (ControlManager)init
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___ControlManager;
  id v2 = -[ControlManager init](&v44, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileAsset.daemon.metaData", v4);
    id v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MobileAsset.daemon.asset", v8);
    uint64_t v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MobileAsset.daemon.cachedelete", v12);
    unsigned int v14 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v13;

    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.MobileAsset.daemon.analytics", v16);
    uint64_t v18 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v17;

    uint64_t v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v20 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v19;

    id v21 = (dispatch_queue_s *)*((void *)v2 + 6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __22__ControlManager_init__block_invoke;
    block[3] = &unk_34DBC0;
    id v22 = v2;
    id v43 = v22;
    dispatch_async(v21, block);
    [v22 ensureProperDirectoryState];
    dispatch_async(*((dispatch_queue_t *)v2 + 6), &__block_literal_global_751);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[MADAnalyticsManager getAnalyticsManager](&OBJC_CLASS___MADAnalyticsManager, "getAnalyticsManager"));
    id v24 = (void *)*((void *)v22 + 3);
    *((void *)v22 + 3) = v23;

    *((_BYTE *)v22 + 9) = 0;
    __int128 v25 = (void *)*((void *)v22 + 10);
    *((void *)v22 + 9) = 0LL;
    *((void *)v22 + 10) = 0LL;

    *((_DWORD *)v22 + 3) = -1;
    __int128 v26 = (void *)*((void *)v22 + 11);
    *((void *)v22 + 11) = 0LL;

    __int128 v27 = (void *)*((void *)v22 + 12);
    *((void *)v22 + 12) = 0LL;

    __int128 v28 = (void *)*((void *)v22 + 13);
    *((void *)v22 + 13) = 0LL;

    __asm { FMOV            V1.2D, #-1.0 }

    *((_OWORD *)v22 + 7) = xmmword_27ED40;
    *((_OWORD *)v22 + 8) = _Q1;
    uint64_t v34 = (void *)*((void *)v22 + 18);
    *((void *)v22 + 18) = 0LL;

    __int128 v35 = (void *)*((void *)v22 + 19);
    *((void *)v22 + 19) = 0LL;

    uint64_t v36 = (void *)*((void *)v22 + 20);
    *((void *)v22 + 20) = 0LL;

    uint64_t v37 = (void *)*((void *)v22 + 21);
    *((void *)v22 + 21) = 0LL;

    uint64_t v38 = (void *)*((void *)v22 + 22);
    *((void *)v22 + 22) = 0LL;

    uint64_t v39 = (void *)*((void *)v22 + 23);
    *((void *)v22 + 23) = 0LL;

    uint64_t v40 = (void *)*((void *)v22 + 24);
    *((void *)v22 + 24) = 0LL;

    *((_BYTE *)v22 + 8) = 1;
  }

  return (ControlManager *)v2;
}

void __22__ControlManager_init__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
}

void __22__ControlManager_init__block_invoke_2(id a1)
{
}

- (void)registerForCacheDeleteMigration
{
  if (usingCentralizedCachedelete()
    && (!&_os_variant_uses_ephemeral_storage || (os_variant_uses_ephemeral_storage("com.apple.MobileAsset", v3) & 1) == 0))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager cachedeleteQueue](self, "cachedeleteQueue"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = __49__ControlManager_registerForCacheDeleteMigration__block_invoke;
    v22[3] = &unk_34FD38;
    v22[4] = self;
    [v4 registerForTaskWithIdentifier:@"com.apple.MobileAsset.MigrateCacheDelete" usingQueue:v5 launchHandler:v22];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 taskRequestForIdentifier:@"com.apple.MobileAsset.MigrateCacheDelete"]);

    if (!v7)
    {
      id v8 = [[BGNonRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.MobileAsset.MigrateCacheDelete"];
      [v8 setRequiresNetworkConnectivity:0];
      [v8 setRequiresExternalPower:1];
      [v8 setScheduleAfter:60.0];
      [v8 setTrySchedulingBefore:3600.0];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
      id v21 = 0LL;
      unsigned __int8 v10 = [v9 submitTaskRequest:v8 error:&v21];
      id v11 = v21;

      if ((v10 & 1) == 0)
      {
        if (v11)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager registerForCacheDeleteMigration]",  @"Failed to submit task with error: %@",  v17,  v18,  v19,  v20,  (uint64_t)v16);
        }

        else
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager registerForCacheDeleteMigration]",  @"Failed to submit task with error: %@",  v12,  v13,  v14,  v15,  (uint64_t)@"Unknown Error");
        }
      }
    }
  }

id __49__ControlManager_registerForCacheDeleteMigration__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCacheDeleteMigration:a2];
}

- (void)handleCacheDeleteMigration:(id)a3
{
  id v3 = a3;
  uint64_t v31 = 0LL;
  __int128 v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = __45__ControlManager_handleCacheDeleteMigration___block_invoke;
  v30[3] = &unk_34F9A8;
  v30[4] = &v31;
  [v3 setExpirationHandler:v30];
  id AssetTypeDirectoriesForVolume = getAssetTypeDirectoriesForVolume(0LL);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(AssetTypeDirectoriesForVolume);
  uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v27;
    while (2)
    {
      uint64_t v9 = 0LL;
      unsigned __int8 v10 = &v6[(void)v7];
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*((_BYTE *)v32 + 24))
        {
          unsigned __int8 v10 = &v9[(void)v7];
          goto LABEL_14;
        }

        id v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v9);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        BOOL v13 = isDirStatsEnabledForDirectory(v12);

        if (!v13)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
          enableDirStatsForDirectory(v14);
        }

        ++v9;
      }

      while (v6 != v9);
      uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    unsigned __int8 v10 = 0LL;
  }

uint64_t __45__ControlManager_handleCacheDeleteMigration___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

- (void)sendPmvResults:(id)a3 pmvInfo:(id)a4 postedDate:(id)a5 lastFetchedDate:(id)a6 result:(int64_t)a7 connection:(id)a8 message:(id)a9
{
  id v26 = a3;
  id v14 = a4;
  unint64_t v15 = (unint64_t)a5;
  unint64_t v16 = (unint64_t)a6;
  uint64_t v17 = (_xpc_connection_s *)a8;
  id v18 = a9;
  uint64_t v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v20 = v19;
  if (v26) {
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v26, @"pmvEntriesToFrameWork");
  }
  if (v15 | v16)
  {
    uint64_t v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v22 = v21;
    if (v15) {
      -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v15, @"postedDate");
    }
    if (v16) {
      -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v16, @"lastTimeChecked");
    }
    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v22, @"metaToFrameWork");
    if (v14)
    {
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v14, v23) & 1) != 0) {
        -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v14, @"pmvInfoToFrameWork");
      }
    }
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v18);
  if (reply)
  {
    if (addObjectToMessage( v20,  reply,  "productMarketingVersionsListLength",  "productMarketingVersionsList")) {
      int64_t v25 = a7;
    }
    else {
      int64_t v25 = 10LL;
    }
    xpc_dictionary_set_int64(reply, "Result", v25);
    xpc_connection_send_message(v17, reply);
  }
}

void __173__ControlManager_sendQueryResults_assetType_purpose_catalogInfo_returnTypes_postedDate_lastFetchedDate_result_isFiltered_requireSpecificAsset_connection_message_clientName___block_invoke( uint64_t a1)
{
  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) analytics]);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  ResultString = queryResultString(*(void *)(a1 + 72));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(ResultString);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = stringForMAQueryReturnTypes(*(void *)(a1 + 80));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  LOWORD(_MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager init]_block_invoke_2",  @"[CONTROL_MANAGER_ASSET_QUEUE] {ControlManager:init} ...finishAllPartiallyPurgedAssets",  v5,  v6,  v7,  v8, v10) = *(_WORD *)(a1 + 88);
  objc_msgSend( v11,  "recordQueryAttemptForAssetType:clientName:purpose:result:assetCount:returnTypes:filtered:requireSpecificAsset:",  v2,  v3,  v4,  v6,  v7,  v9,  v10);
}

void __45__ControlManager_newCatalogLoad_withPurpose___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  *(void *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)newCatalogLoad:(id)a3
{
  return -[ControlManager newCatalogLoad:withPurpose:](self, "newCatalogLoad:withPurpose:", a3, 0LL);
}

- (id)getMetadataFromCatalog:(id)a3 key:(id)a4 withPurpose:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_autoreleasePoolPush();
  id v12 = -[ControlManager newCatalogLoad:withPurpose:](self, "newCatalogLoad:withPurpose:", v8, v10);
  BOOL v13 = v12;
  id v14 = 0LL;
  if (v9 && v12)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v9, v15) & 1) != 0) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v9]);
    }
    else {
      id v14 = 0LL;
    }
  }

  objc_autoreleasePoolPop(v11);
  return v14;
}

- (id)getCatalogLastModifiedDate:(id)a3 ifFromXmlUrl:(id)a4 withPurpose:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_autoreleasePoolPush();
  id v12 = -[ControlManager newCatalogLoad:withPurpose:](self, "newCatalogLoad:withPurpose:", v8, v10);
  if (v12)
  {
    uint64_t v17 = v12;
    id v90 = v11;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"DownloadedFromXml"]);
    uint64_t v92 = objc_claimAutoreleasedReturnValue([v17 objectForKey:@"DownloadedFrom"]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 objectForKey:@"DownloadedFromLive"]);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 objectForKey:@"catalogInfo"]);
    __int128 v91 = (void *)v19;
    if (v18)
    {
      uint64_t v89 = (void *)v20;
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v18, v25) & 1) == 0)
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog did not have a string for %@ (was %@) so we will not use a Last-Modified when downloading %@",  v26,  v27,  v28,  v29,  (uint64_t)@"DownloadedFromXml");
        id v47 = 0LL;
        uint64_t v40 = (void *)v92;
LABEL_26:
        id v11 = v90;
LABEL_27:
        __int128 v49 = v91;
LABEL_28:
        __int128 v48 = v89;
        goto LABEL_29;
      }

      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v18));
      __int128 v35 = v30;
      if (v30)
      {
        if ([v30 isEqual:v9])
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog had %@ which matches the URL, we will attempt to use a Last-Modified when downloading %@",  v36,  v37,  v38,  v39,  (uint64_t)@"DownloadedFromXml");
          uint64_t v40 = (void *)v92;
LABEL_7:
          id v11 = v90;
          goto LABEL_8;
        }

        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog had a different %@ URL: %@ so we will not use a Last-Modified when downloading %@",  v36,  v37,  v38,  v39,  (uint64_t)@"DownloadedFromXml");
      }

      else
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog did not have a URL string for %@ (was %@) so we will not use a Last-Modified when downloading %@",  v31,  v32,  v33,  v34,  (uint64_t)@"DownloadedFromXml");
      }

      uint64_t v40 = (void *)v92;

LABEL_25:
      id v47 = 0LL;
      goto LABEL_26;
    }

    if (v19)
    {
      __int128 v48 = (void *)v20;
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog had %@, so we will not use Last-Modified when downloading %@",  v21,  v22,  v23,  v24,  (uint64_t)@"DownloadedFromLive");
LABEL_14:
      id v47 = 0LL;
      __int128 v49 = (void *)v19;
      uint64_t v40 = (void *)v92;
      id v11 = v90;
LABEL_29:

      goto LABEL_30;
    }

    if (!v20)
    {
      uint64_t v89 = 0LL;
      if (!v92)
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog has no %@ or %@ or %@ or %@, so we will not use a Last-Modified when downloading %@",  v21,  v22,  v23,  v24,  (uint64_t)@"DownloadedFromXml");
        id v47 = 0LL;
        uint64_t v40 = 0LL;
        goto LABEL_26;
      }

      uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v40 = (void *)v92;
      if ((objc_opt_isKindOfClass(v92, v67) & 1) != 0)
      {
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v92));
        __int128 v35 = v72;
        if (v72)
        {
          if ([v72 isEqual:v9])
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog had %@ which matches the URL, we will attempt to use a Last-Modified when downloading %@",  v77,  v78,  v79,  v80,  (uint64_t)@"DownloadedFrom");
            goto LABEL_7;
          }

          uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByDeletingLastPathComponent]);
          uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v82 URLByDeletingLastPathComponent]);

          uint64_t v40 = (void *)v92;
          id v84 = [v35 isEqual:v83];
          id v11 = v90;
          if ((_DWORD)v84)
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog had a base %@ URL that matches: %@ so we will use a Last-Modified when downloading %@",  v85,  v86,  v87,  v88,  (uint64_t)@"DownloadedFrom");

LABEL_8:
            id v45 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"postedDate"]);
            if (v45 && (uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v45, v46) & 1) != 0))
            {
              id v47 = [v45 copy];
            }

            else
            {
              _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog has no or invalid %@ (was %@), so we will not use a Last-Modified when downloading %@",  v41,  v42,  v43,  v44,  (uint64_t)@"postedDate");
              id v47 = 0LL;
            }

            __int128 v49 = v91;

            goto LABEL_28;
          }

          _MobileAssetLog( (uint64_t)v84,  6,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog had a different base %@ URL: %@ so we will not use a Last-Modified when downloading %@",  v85,  v86,  v87,  v88,  (uint64_t)@"DownloadedFrom");
        }

        else
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog did not have a URL string for %@ (was %@) so we will not use a Last-Modified when downloading %@",  v73,  v74,  v75,  v76,  (uint64_t)@"DownloadedFrom");
          id v11 = v90;
        }

        id v47 = 0LL;
        goto LABEL_27;
      }

      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog did not have a string for %@ (was %@) so we will not use a Last-Modified when downloading %@",  v68,  v69,  v70,  v71,  (uint64_t)@"DownloadedFrom");
      goto LABEL_25;
    }

    __int128 v48 = (void *)v20;
    uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v48, v50) & 1) == 0)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog did not have have a dictionary for %@ and it did not have %@ so it looks like a corrupt catalog. We will not use a Last-Modified when downloading %@",  v51,  v52,  v53,  v54,  (uint64_t)@"catalogInfo");
      goto LABEL_14;
    }

    uint64_t v89 = v48;
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"isLiveServer"]);
    if (v59)
    {
      uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSNumber);
      uint64_t v40 = (void *)v92;
      if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0)
      {
        id v65 = [v59 BOOLValue];
        if ((_DWORD)v65)
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog was from Pallas: %@/%@. We will not use a Last-Modified when downloading %@",  v61,  v62,  v63,  v64,  (uint64_t)@"catalogInfo");
LABEL_45:
          id v11 = v90;
          __int128 v49 = v91;

          id v47 = 0LL;
          goto LABEL_28;
        }

        id v81 = @"Prior catalog had %@ and said it was not %@ ... yet also did not have %@ which makes it unclear if it came from XML. We will not use a Last-Modified when downloading %@";
      }

      else
      {
        id v81 = @"Prior catalog had a non-number for %@/%@ and it did not have %@ so it looks like a corrupt Pallas catalog. We will not use a Last-Modified when downloading %@";
        id v65 = 0LL;
      }

      _MobileAssetLog( (uint64_t)v65,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  v81,  v61,  v62,  v63,  v64,  (uint64_t)@"catalogInfo");
      goto LABEL_45;
    }

    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog had %@ and did not indicate %@ ... yet also did not have %@ which makes it unclear if it came from XML. We will not use a Last-Modified when downloading %@",  v55,  v56,  v57,  v58,  (uint64_t)@"catalogInfo");
    uint64_t v40 = (void *)v92;
    goto LABEL_45;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager getCatalogLastModifiedDate:ifFromXmlUrl:withPurpose:]",  @"Prior catalog could not be loaded (may not have been downloaded yet) for %@ so we will not use a Last-Modified when downloading %@",  v13,  v14,  v15,  v16,  (uint64_t)v8);
  id v47 = 0LL;
LABEL_30:
  objc_autoreleasePoolPop(v11);

  return v47;
}

- (BOOL)hasOnlyAllowedDifferencesFrom:(id)a3 inAttributes:(id)a4 assetId:(id)a5 assetType:(id)a6 allowed:(id)a7 foundAbsoluteId:(id *)a8 foundDiff:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = 0LL;
  BOOL v20 = 0;
  if (!v14 || !v15)
  {
    uint64_t v21 = 0LL;
LABEL_8:
    if (!a8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t v21 = 0LL;
  if (!v17) {
    goto LABEL_8;
  }
  uint64_t v21 = -[MAAbsoluteAssetId initWithAssetId:forAssetType:attributes:]( objc_alloc(&OBJC_CLASS___MAAbsoluteAssetId),  "initWithAssetId:forAssetType:attributes:",  v16,  v17,  v15);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 diffFrom:v21]);
  if ([v19 hasOnlyAllowedDifferences:v18])
  {
    BOOL v20 = 1;
    if (!a8) {
      goto LABEL_10;
    }
LABEL_9:
    *a8 = v21;
    goto LABEL_10;
  }

  BOOL v20 = 0;
  uint64_t v19 = 0LL;
  uint64_t v21 = 0LL;
  if (a8) {
    goto LABEL_9;
  }
LABEL_10:
  if (a9) {
    *a9 = v19;
  }

  return v20;
}

- (id)determineBestMatchFor:(id)a3 absoluteId:(id)a4 allowedDifferences:(id)a5 fromResults:(id)a6 isExact:(BOOL *)a7 candidates:(unint64_t *)a8 bestMatch:(id *)a9 differencesFound:(id *)a10 missedTypeAndAssetIdMatch:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v65 = a5;
  id v18 = a6;
  uint64_t v19 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
  if (!v17)
  {
    unint64_t v46 = 0LL;
    BOOL v48 = 0;
    id v67 = 0LL;
    id v45 = 0LL;
    id v60 = 0LL;
    goto LABEL_36;
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v20 = v18;
  id v66 = [v20 countByEnumeratingWithState:&v71 objects:v75 count:16];
  uint64_t v54 = v19;
  if (!v66)
  {
    id v44 = v18;

    id v60 = 0LL;
    id v45 = 0LL;
    id v67 = 0LL;
    uint64_t v43 = 0LL;
    uint64_t v42 = 0LL;
    char v47 = 0;
    unint64_t v46 = 0LL;
    goto LABEL_35;
  }

  uint64_t v51 = a7;
  uint64_t v52 = a8;
  id v53 = v18;
  uint64_t v62 = v20;
  unint64_t v63 = 0LL;
  int v58 = 0;
  id v67 = 0LL;
  uint64_t v68 = 0LL;
  __int128 v59 = 0LL;
  id v60 = 0LL;
  id v55 = 0LL;
  id v56 = v16;
  uint64_t v61 = *(void *)v72;
  id v57 = v17;
  do
  {
    for (i = 0LL; i != v66; i = (char *)i + 1)
    {
      if (*(void *)v72 != v61) {
        objc_enumerationMutation(v20);
      }
      uint64_t v22 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
      uint64_t v23 = objc_autoreleasePoolPush();
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v22]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"AssetProperties"]);
      id v69 = 0LL;
      id v70 = 0LL;
      unsigned int v26 = -[ControlManager hasOnlyAllowedDifferencesFrom:inAttributes:assetId:assetType:allowed:foundAbsoluteId:foundDiff:]( self,  "hasOnlyAllowedDifferencesFrom:inAttributes:assetId:assetType:allowed:foundAbsoluteId:foundDiff:",  v17,  v25,  v22,  v16,  v65,  &v70,  &v69);
      id v27 = v70;
      id v28 = v69;
      uint64_t v29 = v28;
      if (v26)
      {
        ++v63;
        if (!v68)
        {
          unsigned int v36 = [v28 isSameAssetId];
          int v37 = v58;
          if (v36) {
            int v37 = 1;
          }
LABEL_25:
          int v58 = v37;
LABEL_26:
          id v38 = v22;

          id v39 = v27;
          id v40 = v24;

          uint64_t v34 = v29;
          __int128 v35 = v67;
          id v67 = v29;
          uint64_t v68 = v38;
          __int128 v59 = v40;
          id v60 = v39;
          id v16 = v56;
LABEL_27:
          id v41 = v34;

          id v17 = v57;
          goto LABEL_28;
        }

        if ([v28 isSameForAllAttributes]
          && ![v67 isSameForAllAttributes]
          || [v29 isSameAssetId]
          && [v29 isSameDownloadContent]
          && (![v67 isSameAssetId]
           || ![v67 isSameDownloadContent])
          || [v29 isSameAssetId] && !objc_msgSend(v67, "isSameAssetId"))
        {
          int v37 = 1;
          goto LABEL_25;
        }

        if ([v29 isSameDownloadContent]
          && ([v67 isSameDownloadContent] & 1) == 0)
        {
          goto LABEL_26;
        }

        if ([v29 isSameAssetId] && objc_msgSend(v29, "isSameAssetType"))
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager determineBestMatchFor:absoluteId:allowedDifferences:fromResults:isExact:candidates :bestMatch:differencesFound:missedTypeAndAssetIdMatch:]",  @"Asset %@ %@ despite appearing to be a type + assetId match for the requested asset load, did not match allowed diff %@ because its diff was %@",  v30,  v31,  v32,  v33,  (uint64_t)v16);
          uint64_t v34 = v27;
          __int128 v35 = v55;
          id v55 = v27;
          goto LABEL_27;
        }
      }

- (id)applyPmvQuery:(id)a3 queryDict:(id)a4 explanation:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"includeSupervised"]);
  uint64_t v30 = v7;
  uint64_t v31 = (void *)v9;
  if (v9
    && (id v10 = (void *)v9, v11 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0))
  {
    int v29 = [v10 BOOLValue];
  }

  else
  {
    int v29 = 1;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"platformExactMatch"]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {

    id v12 = 0LL;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"versionPrefix"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {

    id v14 = 0LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"supportedDevicePrefix"]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {

    id v16 = 0LL;
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"postedBefore"]);
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"notExpiredBefore"]);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v18, v20) & 1) == 0)
  {

    uint64_t v18 = 0LL;
  }

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v19, v21) & 1) == 0)
  {

    uint64_t v19 = 0LL;
  }

  if (v18 | v19)
  {
    uint64_t v22 = a5;
    uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v23, "setDateFormat:", @"yyyy-MM-dd");
    if (v18)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v23, "dateFromString:", v18));
      if (v19)
      {
LABEL_18:
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v23, "dateFromString:", v19));
LABEL_22:

        a5 = v22;
        goto LABEL_23;
      }
    }

    else
    {
      uint64_t v24 = 0LL;
      if (v19) {
        goto LABEL_18;
      }
    }

    uint64_t v25 = 0LL;
    goto LABEL_22;
  }

  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
LABEL_23:
  unsigned int v26 = filterPMV(v30, v29, v12, v14, v16, v24, v25, a5);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  return v27;
}

- (BOOL)loadRepository:(id)a3 localIds:(id *)a4
{
  return -[ControlManager loadRepository:localIds:withPurpose:]( self,  "loadRepository:localIds:withPurpose:",  a3,  a4,  0LL);
}

- (BOOL)loadCatalog:(id)a3 catalogAssets:(id *)a4 assetIds:(id *)a5 postedDate:(id *)a6 lastFetchDate:(id *)a7 catalogInfo:(id *)a8
{
  return -[ControlManager loadCatalog:catalogAssets:assetIds:postedDate:lastFetchDate:catalogInfo:withPurpose:]( self,  "loadCatalog:catalogAssets:assetIds:postedDate:lastFetchDate:catalogInfo:withPurpose:",  a3,  a4,  a5,  a6,  a7,  a8,  0LL);
}

- (void)determinePmv:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6 queryDict:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v104 = a5;
  id v103 = a6;
  id v14 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetQueue);
  id PathToPmvFile = getPathToPmvFile((uint64_t)v12);
  uint64_t v20 = (char *)objc_claimAutoreleasedReturnValue(PathToPmvFile);
  __int128 v111 = v12;
  __int128 v105 = v13;
  __int128 v106 = self;
  __int128 v107 = v14;
  __int128 v102 = v20;
  if (!v20)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager determinePmv:clientName:connection:message:queryDict:]",  @"%@ Could not read PMV from: %@ error: no path for %@",  v16,  v17,  v18,  v19,  (uint64_t)v13);
    uint64_t v112 = 0LL;
    uint64_t v113 = 0LL;
    uint64_t v115 = 0LL;
    uint64_t v116 = 0LL;
    id v41 = 0LL;
    int v58 = 0LL;
    uint64_t v59 = 7LL;
LABEL_33:
    unint64_t v101 = v59;
    goto LABEL_72;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
  unsigned int v23 = [v21 fileExistsAtPath:v22];

  if (!v23)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager determinePmv:clientName:connection:message:queryDict:]",  @"%@ Could not read PMV from: %@ error: file does not exist",  v24,  v25,  v26,  v27,  (uint64_t)v13);
    uint64_t v20 = 0LL;
    uint64_t v112 = 0LL;
    uint64_t v113 = 0LL;
    uint64_t v115 = 0LL;
    uint64_t v116 = 0LL;
    id v41 = 0LL;
    int v58 = 0LL;
    uint64_t v59 = 2LL;
    goto LABEL_33;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
  int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v28));

  if (!v29)
  {
    unint64_t v101 = 3LL;
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager determinePmv:clientName:connection:message:queryDict:]",  @"%@ could not load PMV file: %@",  v30,  v31,  v32,  v33,  (uint64_t)v13);
    uint64_t v20 = 0LL;
    uint64_t v112 = 0LL;
    uint64_t v115 = 0LL;
    id v41 = 0LL;
LABEL_65:
    int v58 = 0LL;
    uint64_t v113 = 0LL;
    uint64_t v116 = 0LL;
    goto LABEL_72;
  }

  id v131 = 0LL;
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v29,  0LL,  &v131));
  id v39 = v131;
  if (v39)
  {
    id v40 = @"%@ could not load PMV JSON: %@ error: %@";
LABEL_6:
    unint64_t v101 = 3LL;
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager determinePmv:clientName:connection:message:queryDict:]",  v40,  v35,  v36,  v37,  v38,  (uint64_t)v13);
    id v41 = 0LL;
    goto LABEL_7;
  }

  if (!v34)
  {
    id v40 = @"%@ could not load PMV JSON: %@ error: nil after deserialization";
    goto LABEL_6;
  }

  uint64_t v79 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v34, v79) & 1) == 0)
  {
    id v40 = @"%@ could not load PMV JSON: %@ error: PMV file contents were not JSON dictionary";
    goto LABEL_6;
  }

  id v41 = v34;
  unint64_t v101 = 0LL;
LABEL_7:

  if (!v41)
  {
    uint64_t v20 = 0LL;
    uint64_t v112 = 0LL;
    uint64_t v115 = 0LL;
    goto LABEL_65;
  }

  id v42 = (id)objc_claimAutoreleasedReturnValue([v41 objectForKey:@"PublicAssetSets"]);
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  if (v42 && (uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v42, v44) & 1) != 0))
  {
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    __int128 v127 = 0u;
    __int128 v128 = 0u;
    id v42 = v42;
    id v45 = (char *)[v42 countByEnumeratingWithState:&v127 objects:v134 count:16];
    if (v45)
    {
      id v108 = v41;
      uint64_t v115 = 0LL;
      uint64_t v112 = 0LL;
      uint64_t v46 = 0LL;
      uint64_t v47 = *(void *)v128;
      do
      {
        for (i = 0LL; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v128 != v47) {
            objc_enumerationMutation(v42);
          }
          __int128 v49 = *(void **)(*((void *)&v127 + 1) + 8LL * (void)i);
          uint64_t v50 = objc_autoreleasePoolPush();
          if (v49)
          {
            uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v49, v51) & 1) != 0)
            {
              uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:v49]);
              if (v52)
              {
                uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSArray);
                if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0)
                {
                  if ([v49 isEqual:@"iOS"])
                  {
                    uint64_t v112 = (char *)[v52 count];
                  }

                  else
                  {
                    unsigned int v54 = [v49 isEqual:@"macOS"];
                    id v55 = (char *)[v52 count];
                    id v56 = v115;
                    if (v54) {
                      id v56 = v55;
                    }
                    uint64_t v115 = v56;
                    if (v54) {
                      id v57 = 0LL;
                    }
                    else {
                      id v57 = v55;
                    }
                    v46 += (uint64_t)v57;
                  }
                }
              }
            }
          }

          objc_autoreleasePoolPop(v50);
        }

        id v45 = (char *)[v42 countByEnumeratingWithState:&v127 objects:v134 count:16];
      }

      while (v45);

      id v45 = &v115[(void)v112 + v46];
      id v14 = v107;
      id v41 = v108;
      p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
      goto LABEL_37;
    }
  }

  else
  {
    id v45 = 0LL;
  }

  uint64_t v112 = 0LL;
  uint64_t v115 = 0LL;
LABEL_37:

  id v60 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:@"AssetSets"]);
  id v99 = v45;
  if (v60 && (uint64_t v61 = objc_opt_class(p_ivars[140]), (objc_opt_isKindOfClass(v60, v61) & 1) != 0))
  {
    id v109 = v41;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    id v62 = v60;
    id v63 = [v62 countByEnumeratingWithState:&v123 objects:v133 count:16];
    if (v63)
    {
      id v64 = v63;
      uint64_t v65 = 0LL;
      uint64_t v114 = 0LL;
      id v117 = 0LL;
      uint64_t v66 = *(void *)v124;
      do
      {
        for (j = 0LL; j != v64; j = (char *)j + 1)
        {
          if (*(void *)v124 != v66) {
            objc_enumerationMutation(v62);
          }
          uint64_t v68 = *(void **)(*((void *)&v123 + 1) + 8LL * (void)j);
          id v69 = objc_autoreleasePoolPush();
          if (v68)
          {
            uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v68, v70) & 1) != 0)
            {
              __int128 v71 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKey:v68]);
              if (v71)
              {
                uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSArray);
                if ((objc_opt_isKindOfClass(v71, v72) & 1) != 0)
                {
                  if ([v68 isEqual:@"iOS"])
                  {
                    uint64_t v114 = (char *)[v71 count];
                  }

                  else
                  {
                    unsigned int v73 = [v68 isEqual:@"macOS"];
                    id v74 = [v71 count];
                    if (v73) {
                      id v75 = 0LL;
                    }
                    else {
                      id v75 = v74;
                    }
                    v65 += (uint64_t)v75;
                    id v76 = v117;
                    if (v73) {
                      id v76 = v74;
                    }
                    id v117 = v76;
                  }
                }
              }
            }
          }

          objc_autoreleasePoolPop(v69);
        }

        id v64 = [v62 countByEnumeratingWithState:&v123 objects:v133 count:16];
      }

      while (v64);
    }

    else
    {
      uint64_t v65 = 0LL;
      uint64_t v114 = 0LL;
      id v117 = 0LL;
    }

    self = v106;
    id v14 = v107;
    id v41 = v109;
    uint64_t v77 = v114;
    uint64_t v78 = (uint64_t)v117;
  }

  else
  {
    uint64_t v65 = 0LL;
    uint64_t v77 = 0LL;
    uint64_t v78 = 0LL;
  }

  uint64_t v113 = v77;
  uint64_t v116 = v78;
  int v58 = &v77[v65 + v78];

  uint64_t v20 = v99;
LABEL_72:
  id v122 = @"No filter explanation";
  __int128 v110 = v41;
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager applyPmvQuery:queryDict:explanation:]( self,  "applyPmvQuery:queryDict:explanation:",  v41,  v14,  &v122));
  __int128 v100 = v122;
  id v81 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  id v82 = v80;
  id v83 = [v82 countByEnumeratingWithState:&v118 objects:v132 count:16];
  if (v83)
  {
    id v84 = v83;
    uint64_t v85 = *(void *)v119;
    do
    {
      for (k = 0LL; k != v84; k = (char *)k + 1)
      {
        if (*(void *)v119 != v85) {
          objc_enumerationMutation(v82);
        }
        uint64_t v87 = *(void *)(*((void *)&v118 + 1) + 8LL * (void)k);
        uint64_t v88 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v87, v88) & 1) != 0) {
          -[NSMutableArray addObject:](v81, "addObject:", v87);
        }
      }

      id v84 = [v82 countByEnumeratingWithState:&v118 objects:v132 count:16];
    }

    while (v84);
  }

  uint64_t v89 = &v20[(void)v58];

  id v90 = -[NSMutableArray count](v81, "count");
  __int128 v91 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 512LL);
  -[NSMutableString appendFormat:](v91, "appendFormat:", @"%@ queried PMV for: %@ ", v105, v111);
  uint64_t v92 = v20;
  __int128 v93 = stringForMAQueryResult(v101);
  __int128 v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
  -[NSMutableString appendFormat:]( v91,  "appendFormat:",  @"and found %ld versions with result %ld (%@) ",  v90,  v101,  v94);

  -[NSMutableString appendFormat:]( v91,  "appendFormat:",  @"--> From %ld listed in the PMV JSON (%ld public: %ld iOS %ld macOS, %ld supervised: %ld iOS %ld macOS)",  v89,  v92,  v112,  v115,  v58,  v113,  v116);
  -[NSMutableString appendFormat:](v91, "appendFormat:", @"--> %@ ", v100);
  -[NSMutableString appendFormat:](v91, "appendFormat:", @"--> Merged to %ld entries ", v90);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager determinePmv:clientName:connection:message:queryDict:]",  @"%@",  v95,  v96,  v97,  v98,  (uint64_t)v91);
  -[ControlManager sendPmvResults:pmvInfo:postedDate:lastFetchedDate:result:connection:message:]( v106,  "sendPmvResults:pmvInfo:postedDate:lastFetchedDate:result:connection:message:",  v81,  0LL,  0LL,  0LL,  v101,  v104,  v103);
}

- (void)determineOneAsset:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6 specificAssetId:(id)a7 specificAllowedDifferences:(id)a8
{
  LOBYTE(v8) = 1;
  -[ControlManager determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:isForSpecificAsset:specificAssetId:specificAllowedDifferences:]( self,  "determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:isForSpecificAsset:specificAss etId:specificAllowedDifferences:",  a3,  a4,  a5,  0LL,  a6,  2LL,  0LL,  v8,  a7,  a8);
}

- (void)handlePmvRequest:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handlePmvRequest:clientName:connection:message:]",  @"%@ issued PMV query command for %@",  v14,  v15,  v16,  v17,  (uint64_t)v11);
  if ((isSoftwareUpdateType(v10) & 1) == 0)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handlePmvRequest:clientName:connection:message:]",  @"Expected software update assetType",  v18,  v19,  v20,  v21,  v41);
    uint64_t v38 = v12;
    id v39 = v13;
    int64_t v40 = 7LL;
LABEL_7:
    sendClientResponse(v38, v39, v40);
    goto LABEL_10;
  }

  data = xpc_dictionary_get_data(v13, (const char *)[@"QueryParams" UTF8String], &length);
  if (!data)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handlePmvRequest:clientName:connection:message:]",  @"Expected query dictionary for %@",  v23,  v24,  v25,  v26,  (uint64_t)@"QueryParams");
    uint64_t v38 = v12;
    id v39 = v13;
    int64_t v40 = 3LL;
    goto LABEL_7;
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  data,  length,  0LL));
  id v28 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v27,  0LL);
  id DecodeClasses = queryDecodeClasses();
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(DecodeClasses);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v28,  "decodeObjectOfClasses:forKey:",  v30,  NSKeyedArchiveRootObjectKey));

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
  {
    -[NSKeyedUnarchiver finishDecoding](v28, "finishDecoding");
    assetQueue = (dispatch_queue_s *)self->_assetQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __65__ControlManager_handlePmvRequest_clientName_connection_message___block_invoke;
    block[3] = &unk_34F308;
    void block[4] = self;
    id v43 = v10;
    id v44 = v11;
    id v45 = v12;
    id v46 = v13;
    id v47 = v31;
    dispatch_async(assetQueue, block);
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handlePmvRequest:clientName:connection:message:]",  @"Expected query dictionary for %@",  v33,  v34,  v35,  v36,  (uint64_t)@"QueryParams");
    sendClientResponse(v12, v13, 3LL);
  }

LABEL_10:
}

void __65__ControlManager_handlePmvRequest_clientName_connection_message___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
}

- (id)decodeXpcObject:(id)a3 ofClass:(Class)a4 dataKey:(id)a5 lengthKey:(id)a6 decodeClasses:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v15)
  {
    unint64_t v17 = 0LL;
LABEL_5:
    size_t length = 0LL;
    id v19 = v14;
    data = xpc_dictionary_get_data(v13, (const char *)[v19 UTF8String], &length);
    if (data)
    {
      if (!v15 || length == v17)
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  data,  length,  0LL));
        id v46 = 0LL;
        int v29 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v26,  &v46);
        id v45 = v46;
        if (v45 || !v29)
        {
          uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"XPC data error: %@ is %zu bytes, but we failed to load",  v19,  length));
          uint64_t v35 = (void *)v30;
          if (a8)
          {
            id v36 = MAErrorWithUnderlying( @"com.apple.MobileAssetError.Xpc",  4LL,  v45,  @"%@",  v31,  v32,  v33,  v34,  v30);
            *a8 = (id)objc_claimAutoreleasedReturnValue(v36);
          }

          else
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager decodeXpcObject:ofClass:dataKey:lengthKey:decodeClasses:error:]",  @"%@ ----CausedBy---> %@",  v31,  v32,  v33,  v34,  v30);
          }
        }

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v29,  "decodeObjectOfClasses:forKey:",  v16,  NSKeyedArchiveRootObjectKey));
        -[NSKeyedUnarchiver finishDecoding](v29, "finishDecoding");
        if (!v18 || (objc_opt_isKindOfClass(v18, a4) & 1) == 0)
        {
          if (a8 && !*a8)
          {
            id v42 = MAError( @"com.apple.MobileAssetError.Xpc",  5LL,  @"Object is not expected class",  v37,  v38,  v39,  v40,  v41,  v44);
            *a8 = (id)objc_claimAutoreleasedReturnValue(v42);
          }

          else
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager decodeXpcObject:ofClass:dataKey:lengthKey:decodeClasses:error:]",  @"XPC data error: %@ is %zu bytes, but we failed to decode",  v38,  v39,  v40,  v41,  (uint64_t)v19);
          }

          uint64_t v18 = 0LL;
        }

        goto LABEL_28;
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"XPC size mismatch: %@ is %zu bytes,%@ but %@ specifies %zu bytes",  v19,  length,  &stru_355768,  v15,  v17));
      if (a8)
      {
        id v27 = MAError(@"com.apple.MobileAssetError.Xpc", 4LL, @"%@", v21, v22, v23, v24, v25, (uint64_t)v26);
LABEL_12:
        uint64_t v18 = 0LL;
        *a8 = (id)objc_claimAutoreleasedReturnValue(v27);
LABEL_28:

        goto LABEL_29;
      }
    }

    else
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"XPC failed to load data: %@ was expected to be %@ %zu bytes",  v19,  v15,  v17));
      if (a8)
      {
        id v27 = MAError(@"com.apple.MobileAssetError.Xpc", 6LL, @"%@", v28, v22, v23, v24, v25, (uint64_t)v26);
        goto LABEL_12;
      }
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager decodeXpcObject:ofClass:dataKey:lengthKey:decodeClasses:error:]",  @"%@",  v22,  v23,  v24,  v25,  (uint64_t)v26);
    uint64_t v18 = 0LL;
    goto LABEL_28;
  }

  unint64_t v17 = (unint64_t)xpc_dictionary_get_double( v13, (const char *)[v15 UTF8String]);
  if (v17) {
    goto LABEL_5;
  }
  uint64_t v18 = 0LL;
LABEL_29:

  return v18;
}

- (void)handleLoadRequest:(id)a3 clientName:(id)a4 connection:(id)a5 message:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id DecodeClasses = loadDecodeClasses();
  id v16 = (void *)objc_claimAutoreleasedReturnValue(DecodeClasses);
  id v68 = 0LL;
  unint64_t v17 = (MAAbsoluteAssetId *)objc_claimAutoreleasedReturnValue( -[ControlManager decodeXpcObject:ofClass:dataKey:lengthKey:decodeClasses:error:]( self,  "decodeXpcObject:ofClass:dataKey:lengthKey:decodeClasses:error:",  v13,  v14,  @"loadAssetId",  @"loadAssetIdLength",  v16,  &v68));
  id v18 = v68;

  if (v17) {
    BOOL v23 = v18 == 0LL;
  }
  else {
    BOOL v23 = 0;
  }
  if (v23)
  {
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___MAAbsoluteAssetId);
    if ((objc_opt_isKindOfClass(v17, v24) & 1) == 0)
    {
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v17, v25) & 1) != 0)
      {
        uint64_t v26 = -[MAAbsoluteAssetId initWithPlist:](objc_opt_new(&OBJC_CLASS___MAAbsoluteAssetId), "initWithPlist:", v17);

        unint64_t v17 = v26;
      }

      uint64_t v27 = objc_opt_class(&OBJC_CLASS___MAAbsoluteAssetId);
      if ((objc_opt_isKindOfClass(v17, v27) & 1) == 0)
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleLoadRequest:clientName:connection:message:]",  @"%@ issued load of: %@ ID '%@' causing ID error MAQueryParamsEncodeFailure due to the ID not having the correct type",  v28,  v29,  v30,  v31,  (uint64_t)v11);
        sendClientResponse(v12, v13, 8LL);
        id v18 = 0LL;
        goto LABEL_19;
      }
    }

    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v33 = loadDecodeClasses();
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    id v67 = 0LL;
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager decodeXpcObject:ofClass:dataKey:lengthKey:decodeClasses:error:]( self,  "decodeXpcObject:ofClass:dataKey:lengthKey:decodeClasses:error:",  v13,  v32,  @"allowedDifferences",  @"allowedDifferencesLength",  v34,  &v67));
    id v18 = v67;

    if (v18)
    {
      id v36 = stringWithoutNewlines((uint64_t)v35);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleLoadRequest:clientName:connection:message:]",  @"%@ issued load of: %@ ID %@ allowing for differences %@ causing ID error MAQueryParamsEncodeFailure %@",  v38,  v39,  v40,  v41,  (uint64_t)v11);
    }

    else
    {
      if (v35)
      {
        id v46 = -[MAAssetDiff initWithPlist:](objc_opt_new(&OBJC_CLASS___MAAssetDiff), "initWithPlist:", v35);
        if (!v46)
        {
          id v47 = stringWithoutNewlines((uint64_t)v35);
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v47);
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleLoadRequest:clientName:connection:message:]",  @"%@ issued load of: %@ ID %@ allowing for differences %@ causing ID error MAQueryParamsEncodeFailure because the allowed differences could not be instantiated",  v48,  v49,  v50,  v51,  (uint64_t)v11);

          sendClientResponse(v12, v13, 8LL);
        }

        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleLoadRequest:clientName:connection:message:]",  @"%@ issued load of: %@ ID %@ allowing for differences %@",  v42,  v43,  v44,  v45,  (uint64_t)v11);
        assetQueue = (dispatch_queue_s *)self->_assetQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __66__ControlManager_handleLoadRequest_clientName_connection_message___block_invoke;
        block[3] = &unk_34ECE0;
        void block[4] = self;
        id v61 = v10;
        id v62 = v11;
        id v63 = v12;
        id v64 = v13;
        uint64_t v65 = v17;
        uint64_t v66 = v46;
        uint64_t v53 = v46;
        dispatch_async(assetQueue, block);

        goto LABEL_17;
      }

      id v54 = stringWithoutNewlines(0LL);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v54);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleLoadRequest:clientName:connection:message:]",  @"%@ issued load of: %@ ID %@ allowing for differences %@ causing ID error MAQueryParamsEncodeFailure due to having nil for allowedDifferences",  v55,  v56,  v57,  v58,  (uint64_t)v11);
    }

    sendClientResponse(v12, v13, 8LL);
LABEL_17:

    goto LABEL_19;
  }

  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleLoadRequest:clientName:connection:message:]",  @"%@ issued load of: %@ ID %@ causing ID error MAQueryParamsEncodeFailure %@",  v19,  v20,  v21,  v22,  (uint64_t)v11);
  sendClientResponse(v12, v13, 8LL);
LABEL_19:
}

void __66__ControlManager_handleLoadRequest_clientName_connection_message___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
}

- (BOOL)commandRequiresForcedSoftwareUpdateType:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 command] - 1;
  if (v4 >= 0x2E)
  {
    +[MADActivityManager warningForActivity:fromMethod:leaderNote:warning:]( &OBJC_CLASS___MADActivityManager,  "warningForActivity:fromMethod:leaderNote:warning:",  v3,  @"isCommandRequiringForcedSoftwareUpdateType",  @"not covered",  @"Unknown Command (using default behavior of not needing a software update asset type)");
    LOBYTE(v5) = 0;
  }

  else
  {
    unint64_t v5 = (0x1F0000000uLL >> v4) & 1;
  }

  return v5;
}

- (id)checkEntitlement:(id)a3 forAssetType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 command];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 xpcConnection]);

  LOBYTE(v7) = -[ControlManager isEntitledForCommand:forConnection:forAssetType:]( self,  "isEntitledForCommand:forConnection:forAssetType:",  v8,  v9,  v6);
  else {
    uint64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed entitlement check for assetType:%@",  v6);
  }

  return v10;
}

- (id)checkEntitlement:(id)a3 forAssetTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v9 = (__CFString *)v7;
    uint64_t v10 = (NSString *)-[__CFString countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v21 = v8;
      id obj = v9;
      char v12 = 0;
      uint64_t v13 = *(void *)v24;
LABEL_4:
      uint64_t v14 = 0LL;
      while (1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v14);
        id v16 = objc_autoreleasePoolPush();
        uint64_t v17 = [v6 command];
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 xpcConnection]);
        LODWORD(v17) = -[ControlManager isEntitledForCommand:forConnection:forAssetType:]( self,  "isEntitledForCommand:forConnection:forAssetType:",  v17,  v18,  v15);

        if (!(_DWORD)v17) {
          break;
        }
        objc_autoreleasePoolPop(v16);
        uint64_t v14 = (NSString *)((char *)v14 + 1);
        char v12 = 1;
        if (v11 == v14)
        {
          uint64_t v19 = obj;
          uint64_t v11 = (NSString *)-[__CFString countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
          if (v11) {
            goto LABEL_4;
          }
          uint64_t v8 = v21;
          goto LABEL_16;
        }
      }

      uint64_t v19 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed entitlement check for assetType:%@",  v15);
      objc_autoreleasePoolPop(v16);

      uint64_t v8 = v21;
      if ((v12 & 1) == 0) {
        goto LABEL_15;
      }
    }

    else
    {

      uint64_t v19 = 0LL;
LABEL_15:
      uint64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed entitlement check for empty assetTypesList");
LABEL_16:

      uint64_t v19 = (__CFString *)v11;
    }
  }

  else
  {
    uint64_t v19 = @"Failed entitlement check (no asset types list provided)";
  }

  return v19;
}

- (void)ensureSUDownloadTempDir
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v2 = allRepositoryPathsForPurging(0);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)cleanObsoleteSURepo
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id SoftwareUpdateTypes = getSoftwareUpdateTypes();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(SoftwareUpdateTypes);
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v7);
        __int128 v9 = objc_autoreleasePoolPush();
        id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
        id v19 = normalizedAssetType(v8, v12, v13, v14, v15, v16, v17, v18);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v20, (void)v24));

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        LODWORD(v20) = [v22 fileExistsAtPath:v21];

        if ((_DWORD)v20)
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          [v23 removeItemAtPath:v21 error:0];
        }

        objc_autoreleasePoolPop(v9);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v5);
  }
}

- (void)removeDownloadsNotRecentlyInFlight:(id)a3
{
  id v4 = a3;
  if (!-[ControlManager beforeFirstUnlock](self, "beforeFirstUnlock"))
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:-691200.0]);

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v11 = allRepositoryPathsForPurging(0);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      int v15 = 0;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          id RepositoryStagingUrl = getRepositoryStagingUrl(v18, 0);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(RepositoryStagingUrl);
          id RepositoryDownloadsUrl = getRepositoryDownloadsUrl(v18, 0);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(RepositoryDownloadsUrl);
          if (v20) {
            v15 |= removeDownloadsNotRecentlyInFlight(v20, v10, v4);
          }
          if (v22) {
            v15 |= removeDownloadsNotRecentlyInFlight(v22, v10, v4);
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v14);

      if ((v15 & 1) == 0) {
        goto LABEL_17;
      }
      id DownloadManager = getDownloadManager();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
      objc_msgSend(v12, "queryNSUrlSessiondAndUpdateState", (void)v24);
    }

LABEL_17:
    goto LABEL_18;
  }

  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager removeDownloadsNotRecentlyInFlight:]",  @"{removeDownloadsNotRecentlyInFlight} Not able to remove content since device is before first-unlock",  v5,  v6,  v7,  v8,  v24);
LABEL_18:
}

- (void)ensureProperDirectoryState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = allRepositoryPathsForPurging(0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id RepositoryStagingUrl = getRepositoryStagingUrl(*(void **)(*((void *)&v12 + 1) + 8LL * (void)v9), 0);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(RepositoryStagingUrl);
        if (v11) {
          objc_msgSend(v3, "removeItemAtURL:error:", v11, 0, (void)v12);
        }

        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  [v3 removeItemAtPath:@"/private/var/MobileAsset/AssetsV2/SplunkRecords" error:0];
  -[ControlManager ensureSUDownloadTempDir](self, "ensureSUDownloadTempDir");
  -[ControlManager cleanObsoleteSURepo](self, "cleanObsoleteSURepo");
}

- (void)sendStateOfAssetReply:(id)a3 incoming:(id)a4 with:(int64_t)a5
{
  connection = (_xpc_connection_s *)a3;
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "Result", 0LL);
    xpc_dictionary_set_int64(v8, "StateResult", a5);
    xpc_connection_send_message(connection, v8);
  }
}

- (int64_t)getStateOfAssetInCatalog:(id)a3 assetId:(id)a4 withPurpose:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  LODWORD(self) = -[ControlManager isAssetInCatalog:assetId:withPurpose:]( self,  "isAssetInCatalog:assetId:withPurpose:",  v7,  v8,  v9);
  __int128 v11 = repositoryPath(v7);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  int IsValidWithPurpose = assetExistsAndIsValidWithPurpose(v12, v7, v8, v9);

  if (IsValidWithPurpose)
  {
    if ((_DWORD)self) {
      self = (ControlManager *)(&dword_0 + 2);
    }
    else {
      self = (ControlManager *)(&dword_0 + 3);
    }
  }

  else
  {
    id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs");
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
    int v16 = assetExistsAndIsValidWithPurpose(v15, v7, v8, v9);

    if ((v16 & 1) != 0)
    {
      self = (ControlManager *)(&dword_4 + 2);
    }

    else
    {
      id v17 = getRepositoryPath(@"/System/Library/PreinstalledAssetsV2/RequiredByOs");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v19 = assetExistsAndIsValidWithPurpose(v18, v7, v8, v9);

      if (v19) {
        self = (ControlManager *)(&dword_4 + 1);
      }
      else {
        self = (ControlManager *)self;
      }
    }
  }

  return (int64_t)self;
}

- (void)getStateOfAsset:(id)a3 incoming:(id)a4 assetType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __53__ControlManager_getStateOfAsset_incoming_assetType___block_invoke;
  v15[3] = &unk_34E358;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(assetQueue, v15);
}

void __53__ControlManager_getStateOfAsset_incoming_assetType___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v51 = 0LL;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  uint64_t v54 = 0LL;
  uint64_t v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472LL;
  uint64_t v45 = __53__ControlManager_getStateOfAsset_incoming_assetType___block_invoke_2;
  id v46 = &unk_34FDD8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  uint64_t v50 = &v51;
  uint64_t v47 = v9;
  id v48 = v10;
  id v49 = *(id *)(a1 + 48);
  __int128 v11 = objc_retainBlock(&v43);
  id v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 48), "AssetId"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v18 = v13;
  if (!*(void *)(a1 + 56))
  {
    uint64_t v40 = @"getStateOfAsset, attempting to get state on nil asset type";
LABEL_10:
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager getStateOfAsset:incoming:assetType:]_block_invoke",  v40,  v14,  v15,  v16,  v17,  (uint64_t)v43);
    uint64_t v21 = 0LL;
LABEL_11:
    [*(id *)(a1 + 32) sendStateOfAssetReply:*(void *)(a1 + 40) incoming:*(void *)(a1 + 48) with:v52[3]];
    id v33 = 0LL;
    goto LABEL_12;
  }

  if (!v13)
  {
    uint64_t v40 = @"getStateOfAsset, attempting to get state on nil asset ID";
    goto LABEL_10;
  }

  if (!isWellFormedAssetId(v13))
  {
    uint64_t v40 = @"getStateOfAsset, attempting to get state on asset ID that isn't well formed";
    goto LABEL_10;
  }

  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 48), "Purpose");
  uint64_t v20 = normalizePurposeFromUtf8((uint64_t)string);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (!isWellFormedPurpose(v21))
  {
    uint64_t v41 = @"getStateOfAsset, attempting to get state for a purpose that isn't well formed";
    int v42 = 3;
LABEL_15:
    _MobileAssetLog( 0LL,  v42,  (uint64_t)"-[ControlManager getStateOfAsset:incoming:assetType:]_block_invoke",  v41,  v22,  v23,  v24,  v25,  (uint64_t)v43);
    goto LABEL_11;
  }

  id v26 = objc_msgSend( *(id *)(a1 + 32),  "getStateOfAssetInCatalog:assetId:withPurpose:",  *(void *)(a1 + 56),  v18,  v21,  v43,  v44,  v45,  v46,  v47,  v48);
  v52[3] = (uint64_t)v26;
  if ((unint64_t)v26 >= 2)
  {
    uint64_t v41 = @"getStateOfAsset, don't need to check downloading status";
    int v42 = 6;
    goto LABEL_15;
  }

  id v30 = normalizedAssetType(*(void *)(a1 + 56), v27, v28, v29, v22, v23, v24, v25);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v32 = assembleTaskDescriptorWithPurpose((uint64_t)v31, (uint64_t)v18, v21);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  id DownloadManager = getDownloadManager();
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
  [v35 isDownloading:v33 then:v11];

LABEL_12:
  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager getStateOfAsset:incoming:assetType:]_block_invoke",  @"[CONTROL_MANAGER_ASSET_QUEUE] {getStateOfAsset} ...validating and getting asset state",  v36,  v37,  v38,  v39,  (uint64_t)v43);

  _Block_object_dispose(&v51, 8);
}

id __53__ControlManager_getStateOfAsset_incoming_assetType___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 4LL;
  }
  return [*(id *)(a1 + 32) sendStateOfAssetReply:*(void *)(a1 + 40) incoming:*(void *)(a1 + 48) with:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
}

- (BOOL)isAssetInCatalog:(id)a3 assetId:(id)a4 withPurpose:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v11 = objc_autoreleasePoolPush();
  id v12 = -[ControlManager newCatalogLoad:withPurpose:](self, "newCatalogLoad:withPurpose:", v8, v10);
  id AssetFromXml = getAssetFromXml(v8, v9, v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(AssetFromXml);
  BOOL v15 = v14 != 0LL;

  objc_autoreleasePoolPop(v11);
  return v15;
}

- (BOOL)isAssetInCatalog:(id)a3 assetId:(id)a4
{
  return -[ControlManager isAssetInCatalog:assetId:withPurpose:]( self,  "isAssetInCatalog:assetId:withPurpose:",  a3,  a4,  0LL);
}

- (void)checkAndInitiateDownloadForAssetType:(id)a3 message:(id)a4 forClientName:(id)a5 usingConnection:(id)a6 requiringClientExtractor:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  string = xpc_dictionary_get_string(v13, "AssetId");
  if (string)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    if (isWellFormedAssetId(v17))
    {
      id v18 = xpc_dictionary_get_string(v13, "Purpose");
      int v19 = normalizePurposeFromUtf8((uint64_t)v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (isWellFormedPurpose(v20))
      {
        _MAPreferencesSync(@"checkAndInitiateDownloadForAssetType", v12);
        id v21 = -[ControlManager newCatalogLoad:withPurpose:](self, "newCatalogLoad:withPurpose:", v12, v20);
        id AssetFromXml = getAssetFromXml(v12, v17, v21);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(AssetFromXml);
        if (!v23)
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager checkAndInitiateDownloadForAssetType:message:forClientName:usingConnection:requiri ngClientExtractor:]",  @"Cannot download asset, it is no longer in the catalog",  v24,  v25,  v26,  v27,  v85);
          sendClientResponse(v15, v13, 36LL);
          goto LABEL_30;
        }

        uint64_t v28 = v23;
        __int128 v102 = v21;
        id v103 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"__BaseURL"]);
        uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 objectForKey:@"__RelativePath"]);
        id v30 = v28;
        uint64_t v31 = (void *)v29;
        id v104 = v30;
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"_DownloadSize"]);
        [v32 unsignedLongLongValue];

        if (!v31 || (uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v31, v37) & 1) == 0))
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager checkAndInitiateDownloadForAssetType:message:forClientName:usingConnection:requiri ngClientExtractor:]",  @"could not determine relative url from catalog",  v33,  v34,  v35,  v36,  v85);
          sendClientResponse(v15, v13, 23LL);

LABEL_26:
LABEL_27:

LABEL_28:
          goto LABEL_24;
        }

        uint64_t uint64 = xpc_dictionary_get_uint64(v13, "notificationInterval");
        uint64_t v38 = objc_claimAutoreleasedReturnValue([v104 objectForKey:@"_StartOfDataRange"]);
        uint64_t v39 = objc_claimAutoreleasedReturnValue([v104 objectForKey:@"_LengthOfDataRange"]);
        if (!(v38 | v39))
        {
LABEL_12:
          uint64_t v97 = (void *)v39;
          xpc_object_t value = xpc_dictionary_get_value(v13, "stExtractorLength");
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(value);

          if (!v52) {
            goto LABEL_31;
          }
          length[0] = (unint64_t)xpc_dictionary_get_double(v13, "stExtractorLength");
          if (!length[0]) {
            goto LABEL_31;
          }
          data = xpc_dictionary_get_data(v13, "stExtractor", length);
          id v21 = v102;
          if (data)
          {
            uint64_t v58 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data, length[0]));
            if (v58)
            {
              id v63 = (void *)v58;
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager checkAndInitiateDownloadForAssetType:message:forClientName:usingConnection:req uiringClientExtractor:]",  @"extractor exists attempting to create",  v59,  v60,  v61,  v62,  v85);
              id v105 = 0LL;
              uint64_t v95 = v63;
              id v64 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v63,  &v105);
              __int128 v94 = v64;
              id v100 = v105;
              if (v100 || !v64)
              {
                -[NSKeyedUnarchiver finishDecoding](v64, "finishDecoding");
              }

              else
              {
                id v65 = extractorDecodeClasses();
                uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue(v65);
                uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v64,  "decodeObjectOfClasses:forKey:",  v92,  NSKeyedArchiveRootObjectKey));

                -[NSKeyedUnarchiver finishDecoding](v64, "finishDecoding");
                if (v96)
                {
                  unint64_t v101 = (void *)v38;
LABEL_32:
                  id LocalUrlFromTypeAndIdWithPurpose = getLocalUrlFromTypeAndIdWithPurpose(v12, v17, 0LL, v20);
                  id v90 = (void *)objc_claimAutoreleasedReturnValue(LocalUrlFromTypeAndIdWithPurpose);
                  id v89 = v12;
                  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager checkAndInitiateDownloadForAssetType:message:forClientName:usingConnection :requiringClientExtractor:]",  @"%@ issued download asset command: %@, %@, %@, %@ to local url '%@'",  v71,  v72,  v73,  v74,  (uint64_t)v14);
                  id v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                  __int128 v91 = v90;
                  id v76 = (void *)objc_claimAutoreleasedReturnValue([v90 path]);
                  unsigned int v93 = [v75 fileExistsAtPath:v76];

                  if (v93)
                  {
                    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager checkAndInitiateDownloadForAssetType:message:forClientName:usingConnecti on:requiringClientExtractor:]",  @"asset already exists, cannot download",  v77,  v78,  v79,  v80,  v87);
                    sendClientResponse(v15, v13, 10LL);
                  }

                  else
                  {
                    id DownloadManager = getDownloadManager();
                    id v84 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
                    LOBYTE(v89) = !a7;
                    [v84 registerAssetDownloadJob:v12 forThis:v17 withBase:v103 relativeTo:v31 startingAt:v101 withLength:v97 extractWith:v96 allocateExt ractorIfNecessary:v89 connection:v15 message:v13 clientName:v14 notify:uint64 withCatalogMetadata:v104 withSpaceCheckedUUID:0];
                  }

                  goto LABEL_28;
                }
              }

              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager checkAndInitiateDownloadForAssetType:message:forClientName:usingConnection:req uiringClientExtractor:]",  @"Failed to create extractor",  v66,  v67,  v68,  v69,  v86);
              sendClientResponse(v15, v13, 11LL);

              goto LABEL_26;
            }

- (id)hashToString:(id)a3
{
  id v3 = a3;
  id v4 = (unsigned __int8 *)[v3 bytes];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  if ([v3 length])
  {
    unint64_t v6 = 0LL;
    do
      objc_msgSend(v5, "appendFormat:", @"%02x", v4[v6++]);
    while ((unint64_t)[v3 length] > v6);
  }

  return v5;
}

- (id)newExtractor:(id)a3 downloadOptions:(id)a4 sessionID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"AssetType"]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"AssetFormat"]);
  id v15 = repositoryPath(v13);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  int v17 = repositoryDownloadsAreRestricted(v16);

  if (v14) {
    id v18 = (__CFString *)v14;
  }
  else {
    id v18 = @"StreamingZip";
  }
  uint64_t v197 = v12;
  if (!-[__CFString isEqualToString:](v18, "isEqualToString:"))
  {
    if ((-[__CFString isEqualToString:](v18, "isEqualToString:", @"AppleEncryptedArchive") & 1) != 0
      || (id v46 = -[__CFString isEqualToString:](v18, "isEqualToString:", @"AppleArchive"), (_DWORD)v46))
    {
      uint64_t v47 = a6;
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager newExtractor:downloadOptions:sessionID:error:]",  @"Creating asset extractor for AEA asset",  v42,  v43,  v44,  v45,  v185);
      if (v11
        && (uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v11 sourceDirectory]), v52,
                                                                                                   v52))
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager newExtractor:downloadOptions:sessionID:error:]",  @"Creating AEA extractor for a patched asset",  v48,  v49,  v50,  v51,  v188);
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v11 sourceDirectory]);
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[STRemoteExtractor incrementalPatchSTAEAExtractor:srcDirectory:]( &OBJC_CLASS___STRemoteExtractor,  "incrementalPatchSTAEAExtractor:srcDirectory:",  v197,  v53));
      }

      else
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager newExtractor:downloadOptions:sessionID:error:]",  @"Creating AEA extractor for a full replacement asset",  v48,  v49,  v50,  v51,  v188);
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[STRemoteExtractor fullReplacementSTAEAExtractor:]( &OBJC_CLASS___STRemoteExtractor,  "fullReplacementSTAEAExtractor:",  v197));
      }

      a6 = v47;
      if (v17) {
        [v54 setPrivileged:1];
      }
      if (v54)
      {
        uint64_t v196 = v13;
        uint64_t v194 = v54;
        if ((objc_opt_respondsToSelector(v54, "setPluginDirectory:") & 1) == 0)
        {
          id v83 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"AEA extractor will be loaded from the system volume because loading from the cryptex is unsupported on this OS."));
          id v84 = [v83 UTF8String];
          _MobileAssetLog( 0LL,  7,  (uint64_t)"-[ControlManager newExtractor:downloadOptions:sessionID:error:]",  @"[MAB] %s",  v85,  v86,  v87,  v88,  (uint64_t)v84);

          goto LABEL_40;
        }

        id v64 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainUpdater sharedInstance](&OBJC_CLASS___MABrainUpdater, "sharedInstance"));
        id v65 = (void *)objc_claimAutoreleasedReturnValue([v64 bundle]);

        if (v65)
        {
          uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v65 graftPath]);

          if (v66)
          {
            uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v65 graftPath]);
            id v68 = (id)objc_claimAutoreleasedReturnValue( [v67 stringByAppendingPathComponent:@"/System/Library/StreamingExtractorPlugins"]);

            char v199 = 0;
            uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            unsigned int v70 = [v69 fileExistsAtPath:v68 isDirectory:&v199];

            if (v70)
            {
              if (v199)
              {
                a6 = v47;
                if (-[ControlManager allowSTExtractorPluginLoadFromDownloadedMABrain]( self,  "allowSTExtractorPluginLoadFromDownloadedMABrain"))
                {
                  [v194 setPluginDirectory:v68];
                  uint64_t v71 = @"AEA extractor will be loaded from the cryptex.";
                }

                else
                {
                  uint64_t v71 = @"AEA extractor will be loaded from the system volume because the base OS doesn't support loading it from the MA brain cryptex.";
                }

                goto LABEL_38;
              }

              uint64_t v71 = @"AEA extractor will be loaded from the system volume because the cryptex plugin path is not a directory.";
            }

            else
            {
              uint64_t v71 = @"AEA extractor will be loaded from the system volume because the cryptex plugin directory does not exist.";
            }

            a6 = v47;
LABEL_38:
            id v97 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", v71));
            id v98 = [v97 UTF8String];
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager newExtractor:downloadOptions:sessionID:error:]",  @"[MAB] %s",  v99,  v100,  v101,  v102,  (uint64_t)v98);

            goto LABEL_39;
          }

          id v68 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"AEA extractor will be loaded from the system volume because the cryptex graft point is nil."));
          id v190 = [v68 UTF8String];
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager newExtractor:downloadOptions:sessionID:error:]",  @"[MAB] %s",  v93,  v94,  v95,  v96,  (uint64_t)v190);
        }

        else
        {
          id v68 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"AEA extractor will be loaded from the system volume because MobileAsset Brain is built-in."));
          id v189 = [v68 UTF8String];
          _MobileAssetLog( 0LL,  7,  (uint64_t)"-[ControlManager newExtractor:downloadOptions:sessionID:error:]",  @"[MAB] %s",  v89,  v90,  v91,  v92,  (uint64_t)v189);
        }

- (void)cancelDownload:(id)a3 using:(id)a4 for:(id)a5 assetType:(id)a6 purpose:(id)a7 withExtension:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  id v26 = normalizedAssetType((uint64_t)v16, v19, v20, v21, v22, v23, v24, v25);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  id v28 = assembleTaskDescriptorWithPurpose((uint64_t)v27, (uint64_t)v17, v18);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager cancelDownload:using:for:assetType:purpose:withExtension:]",  @"%@ is attempting to cancel %@ %@ (%@)",  v30,  v31,  v32,  v33,  (uint64_t)v15);
  id DownloadManager = getDownloadManager();
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = __75__ControlManager_cancelDownload_using_for_assetType_purpose_withExtension___block_invoke;
  v42[3] = &unk_34FE28;
  id v43 = v29;
  id v44 = v15;
  id v45 = v16;
  id v46 = v17;
  id v47 = v14;
  id v48 = v13;
  id v36 = v13;
  id v37 = v14;
  id v38 = v17;
  id v39 = v16;
  id v40 = v15;
  id v41 = v29;
  [v35 isDownloading:v41 then:v42];
}

void __75__ControlManager_cancelDownload_using_for_assetType_purpose_withExtension___block_invoke( id *a1,  int a2)
{
  if (a2)
  {
    id DownloadManager = getDownloadManager();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = __75__ControlManager_cancelDownload_using_for_assetType_purpose_withExtension___block_invoke_2;
    v5[3] = &unk_34FE00;
    id v6 = a1[4];
    id v7 = a1[5];
    id v8 = a1[6];
    id v9 = a1[7];
    id v10 = a1[8];
    id v11 = a1[9];
    [v4 getCurrentInflightDownloads:v5];
  }

  else
  {
    sendClientResponse(a1[8], a1[9], 3LL);
  }

void __75__ControlManager_cancelDownload_using_for_assetType_purpose_withExtension___block_invoke_2( uint64_t a1,  void *a2)
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    uint64_t v7 = 4LL;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v10 = *(void **)(a1 + 32);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 taskDescription]);
        LODWORD(_MobileAssetLog( 0,  5,  (uint64_t)"-[ControlManager init]_block_invoke_2",  @"[CONTROL_MANAGER_ASSET_QUEUE] {ControlManager:init} ...finishAllPartiallyPurgedAssets",  v5,  v6,  v7,  v8, v10) = [v10 isEqualToString:v11];

        if ((_DWORD)v10)
        {
          [v9 cancel];
          uint64_t v7 = 0LL;
          goto LABEL_12;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v7 = 4LL;
  }

- (int64_t)removeDirectoryAtPath:(id)a3 firstRenamingWithExtension:(id)a4
{
  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(assetQueue);
  int64_t v8 = renameWithExtThenRemove(v7, v6);

  return v8;
}

- (void)removeAssetDir:(id)a3 assetType:(id)a4 clientName:(id)a5 using:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __60__ControlManager_removeAssetDir_assetType_clientName_using___block_invoke;
  block[3] = &unk_34EF88;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  uint64_t v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(assetQueue, block);
}

void __60__ControlManager_removeAssetDir_assetType_clientName_using___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "AssetId"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = isWellFormedAssetId(v10);
  if (!v11)
  {

    id v10 = 0LL;
  }

  char v12 = !v11;
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "Purpose");
  if (string)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    v12 |= !isWellFormedPurpose(v14);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "assetState");
  AssetDirectoryName = getAssetDirectoryName((uint64_t)v10);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(AssetDirectoryName);
  id v25 = normalizedAssetType(*(void *)(a1 + 40), v18, v19, v20, v21, v22, v23, v24);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  if (uint64 == 6)
  {
    id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs");
    id v28 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 stringByAppendingPathComponent:v26]);

    uint64_t v30 = repositoryPath(*(void **)(a1 + 40));
  }

  else
  {
    uint64_t v31 = repositoryPath(*(void **)(a1 + 40));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v32 stringByAppendingPathComponent:v26]);

    uint64_t v30 = getRepositoryPath(@"/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs");
  }

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 stringByAppendingPathComponent:v26]);

  if (v14)
  {
    id v35 = purposeDirectoryName(v14);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    uint64_t v37 = objc_claimAutoreleasedReturnValue([v29 stringByAppendingPathComponent:v36]);

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v34 stringByAppendingPathComponent:v36]);
    uint64_t v34 = (void *)v38;
    uint64_t v29 = (void *)v37;
  }

  id v39 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByAppendingPathComponent:v17]);

  id v40 = (void *)objc_claimAutoreleasedReturnValue([v34 stringByAppendingPathComponent:v17]);
  if ((v12 & 1) == 0)
  {
    id v84 = v17;
    id v47 = assembleTaskDescriptorWithPurpose((uint64_t)v26, (uint64_t)v10, v14);
    id v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    id DownloadManager = getDownloadManager();
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472LL;
    v88[2] = __60__ControlManager_removeAssetDir_assetType_clientName_using___block_invoke_2;
    v88[3] = &unk_34FE50;
    id v51 = v48;
    id v89 = v51;
    id v90 = *(id *)(a1 + 48);
    [v50 getCurrentInflightDownloads:v88];

    uint64_t v86 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v39);
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "getSAFRegistrationBundleID:"));
    uint64_t v87 = (char *)[*(id *)(a1 + 56) removeDirectoryAtPath:v39 firstRenamingWithExtension:@".purged"];
    id v83 = v26;
    if (v87 != (_BYTE *)&dword_0 + 3)
    {
      if (v87)
      {
        uint64_t v56 = stringForMAPurgeResult((unint64_t)v87);
        uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(v56);
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager removeAssetDir:assetType:clientName:using:]_block_invoke",  @"{removeAssetDir} failed to purge path:%@ | assetType:%@ | assetID:%@ | clientName:%@ | result:%lld(%@)",  v57,  v58,  v59,  v60,  (uint64_t)v39);
      }

      else
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager removeAssetDir:assetType:clientName:using:]_block_invoke",  @"{removeAssetDir} successfully purged path:%@ | assetType:%@ | assetID:%@ | clientName:%@",  v52,  v53,  v54,  v55,  (uint64_t)v39);
        [*(id *)(a1 + 56) updateSpaceAttributionForBundleID:v85 assetPath:v86 doRegistration:0];
      }
    }

    uint64_t v61 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v40);
    id v62 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) getSAFRegistrationBundleID:v61]);
    id v63 = (char *)[*(id *)(a1 + 56) removeDirectoryAtPath:v40 firstRenamingWithExtension:@".purged"];
    if (v63 != (_BYTE *)&dword_0 + 3)
    {
      int64_t v68 = (int64_t)v63;
      if (v63)
      {
        uint64_t v69 = stringForMAPurgeResult((unint64_t)v63);
        uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue(v69);
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager removeAssetDir:assetType:clientName:using:]_block_invoke",  @"{removeAssetDir} failed to purge secondary path:%@ | assetType:%@ | assetID:%@ | clientName:%@ | result:%lld(%@)",  v70,  v71,  v72,  v73,  (uint64_t)v40);

        int64_t v46 = (int64_t)v87;
        if (v87 == (_BYTE *)&dword_0 + 3 || !v87) {
          int64_t v46 = v68;
        }
        goto LABEL_24;
      }

      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager removeAssetDir:assetType:clientName:using:]_block_invoke",  @"{removeAssetDir} successfully purged secondary path:%@ | assetType:%@ | assetID:%@ | clientName:%@",  v64,  v65,  v66,  v67,  (uint64_t)v40);
      [*(id *)(a1 + 56) updateSpaceAttributionForBundleID:v62 assetPath:v61 doRegistration:0];
    }

    int64_t v46 = (int64_t)v87;
LABEL_24:

    id v26 = v83;
    id v17 = v84;
    goto LABEL_25;
  }

  id v41 = stringForMAPurgeResult(4uLL);
  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(v41);
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager removeAssetDir:assetType:clientName:using:]_block_invoke",  @"{removeAssetDir} failed to purge (purpose or asset ID not well formed) path:%@ | assetType:%@ | assetID:%@ | purpose:%@ | clientName:%@ | result:%lld(%@)",  v42,  v43,  v44,  v45,  (uint64_t)v39);

  int64_t v46 = 4LL;
LABEL_25:
  sendClientResponse(*(void **)(a1 + 64), *(void **)(a1 + 32), v46);
  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager removeAssetDir:assetType:clientName:using:]_block_invoke",  @"[CONTROL_MANAGER_ASSET_QUEUE] {removeAssetDir} ...validating and removing directory",  v74,  v75,  v76,  v77,  v79);
}

void __60__ControlManager_removeAssetDir_assetType_clientName_using___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        int64_t v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v9 = *(void **)(a1 + 32);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 taskDescription]);
        LODWORD(_MobileAssetLog( 0,  5,  (uint64_t)"-[ControlManager init]_block_invoke_2",  @"[CONTROL_MANAGER_ASSET_QUEUE] {ControlManager:init} finishAllPartiallyPurgedAssets...",  v1,  v2,  v3,  v4, v9) = [v9 isEqualToString:v10];

        if ((_DWORD)v9)
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager removeAssetDir:assetType:clientName:using:]_block_invoke_2",  @"{removeAssetDir} canceling download due to purge | cancelTaskDescriptor:%@ | clientName:%@",  v11,  v12,  v13,  v14,  *(void *)(a1 + 32));
          [v8 cancel];
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)setPreferenceKeySync:(id)a3 andValue:(id)a4 allowNilToClear:(BOOL)a5
{
  if (a4 || a5) {
    _MAPreferencesSetStringValue(a3, a4, @"setPreferenceKeySync", @"client setting preference");
  }
  else {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager setPreferenceKeySync:andValue:allowNilToClear:]",  @"Skipping operation to update preference %@ %@ to nil (clear) as nil is not allowed",  a5,  v5,  v6,  v7,  (uint64_t)@"com.apple.MobileAsset");
  }
}

- (void)setPreferenceKeyAsync:(id)a3 andValue:(id)a4 allowNilToClear:(BOOL)a5 replyUsing:(id)a6 and:(id)a7
{
  BOOL v8 = a5;
  id v14 = a6;
  id v12 = a7;
  if (a4 || v8)
  {
    -[ControlManager setPreferenceKeySync:andValue:allowNilToClear:]( self,  "setPreferenceKeySync:andValue:allowNilToClear:",  a3,  a4,  v8);
    int64_t v13 = 0LL;
  }

  else
  {
    int64_t v13 = 5LL;
  }

  sendClientResponse(v14, v12, v13);
}

- (void)setPreferences:(id)a3 replyUsing:(id)a4 and:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (a3)
  {
    _MAPreferencesSetValues(a3, @"setPreferencesSync", @"client setting multiple preferences");
    int64_t v8 = 0LL;
  }

  else
  {
    int64_t v8 = 5LL;
  }

  sendClientResponse(v9, v7, v8);
}

- (void)handleEnsureDataVault:(id)a3 message:(id)a4 client:(id)a5 clientName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleEnsureDataVault:message:client:clientName:]",  @"client %@ requested data vault for %@",  v13,  v14,  v15,  v16,  (uint64_t)v9);
  __int128 v17 = repositoryPath(v12);
  id v29 = (id)objc_claimAutoreleasedReturnValue(v17);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:"));
  int DataVaultAtUrl = makeDataVaultAtUrl(v12, v18);

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleEnsureDataVault:message:client:clientName:]",  @"%@ makeDataVaultAtUrl %@ status: %lld",  v20,  v21,  v22,  v23,  (uint64_t)v9);
  if (DataVaultAtUrl)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleEnsureDataVault:message:client:clientName:]",  @"client %@ requested data vault for %@, it failed with status: %ld",  v24,  v25,  v26,  v27,  (uint64_t)v9);
    int64_t v28 = 2LL;
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleEnsureDataVault:message:client:clientName:]",  @"client %@ requested data vault for %@, it succeeded",  v24,  v25,  v26,  v27,  (uint64_t)v9);
    int64_t v28 = 0LL;
  }

  sendClientResponse(v10, v11, v28);
}

- (void)handleDataMigrator:(id)a3 message:(id)a4 clientName:(id)a5
{
  id v7 = a4;
  id v12 = a3;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleDataMigrator:message:clientName:]",  @"client %@ requested data migration. No DataMigrator work was needed.",  v8,  v9,  v10,  v11,  (uint64_t)a5);
  sendClientResponse(v12, v7, 0LL);
}

- (void)handleGetAllowNonUserInitiated:(id)a3 message:(id)a4 clientName:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  uint64_t v10 = reply;
  if (reply)
  {
    xpc_dictionary_set_BOOL(reply, "allowNonUserInitiated", 1);
    sendReply(v15, v10, 0LL);
  }

  else
  {
    sendClientResponse(v15, v7, 2LL);
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleGetAllowNonUserInitiated:message:clientName:]",  @"client %@ requested whether user initiated downloads are allowed: %@",  v11,  v12,  v13,  v14,  (uint64_t)v8);
}

- (void)handleServerUrlOverride:(id)a3 message:(id)a4 client:(id)a5 clientName:(id)a6
{
  id v31 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleServerUrlOverride:message:client:clientName:]",  @"Setting server url override",  v12,  v13,  v14,  v15,  v30);
  string = xpc_dictionary_get_string(v9, "serverUrlOverride");
  if (string)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    if (xpc_dictionary_get_BOOL(v9, "serverOverrideClear"))
    {
      __int128 v18 = 0LL;
      BOOL v19 = 1;
    }

    else if (v17)
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v17));
      if (!v18) {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleServerUrlOverride:message:client:clientName:]",  @"the server url is not valid: '%@'",  v20,  v21,  v22,  v23,  (uint64_t)v17);
      }
      BOOL v19 = 0;
    }

    else
    {
      BOOL v19 = 0;
      __int128 v18 = 0LL;
    }
  }

  else
  {
    BOOL v19 = xpc_dictionary_get_BOOL(v9, "serverOverrideClear");
    __int128 v17 = 0LL;
    __int128 v18 = 0LL;
  }

  BOOL v28 = xpc_dictionary_get_BOOL(v9, "serverUrlDefault");
  if (!v31 && v28) {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleServerUrlOverride:message:client:clientName:]",  @"the default/fallback url is not valid when the asset type is nil: '%@'",  v24,  v25,  v26,  v27,  (uint64_t)v17);
  }
  if (v18) {
    BOOL v19 = 1;
  }
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleServerUrlOverride:message:client:clientName:]",  @"client %@ requested server URL change: %@ the asset type is %@ and the url is %@ %@%@%@",  v24,  v25,  v26,  v27,  (uint64_t)v11);
  if (v19)
  {
    _ASSetAssetServerURLForAssetType(v18, (uint64_t)v31, v28);
    int64_t v29 = 0LL;
  }

  else
  {
    int64_t v29 = 2LL;
  }

  sendClientResponse(v10, v9, v29);
}

- (id)getAssetAttributes:(id)a3 purpose:(id)a4 assetID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4) {
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"purpose_%@/",  a4));
  }
  else {
    id v10 = &stru_355768;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@%@.asset",  @"/private/var/MobileAsset/AssetsV2",  v8,  v10,  v9));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager getAssetAttributes:](self, "getAssetAttributes:", v12));

  return v13;
}

- (id)getAssetAttributes:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetQueue);
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"Info.plist"]);
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v7));

      if (v8) {
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"MobileAssetProperties"]);
      }
      else {
        uint64_t v5 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    id v8 = 0LL;
    uint64_t v6 = 0LL;
  }

  id v9 = v5;

  return v9;
}

- (int64_t)garbageCollectionDescriptorType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"/purpose_%@/",  @"auto");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);
  unsigned int v7 = [v6 containsString:v5];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    id v9 = [v8 length];
    id v10 = [@".asset" length];
    BOOL v11 = v9 > v10;
    int64_t v12 = v9 - v10;
    if (v11 && [v8 hasSuffix:@".asset"])
    {
      uint64_t v71 = v5;
      id v72 = v4;
      uint64_t v70 = v8;
      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", 0, v12));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager lockedNeverRemoveAutoAssetDescriptors]( self,  "lockedNeverRemoveAutoAssetDescriptors"));

      if (v13)
      {
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue( -[ControlManager lockedNeverRemoveAutoAssetDescriptors]( self,  "lockedNeverRemoveAutoAssetDescriptors"));
        id v14 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v92;
          while (2)
          {
            __int128 v17 = 0LL;
            do
            {
              if (*(void *)v92 != v16) {
                objc_enumerationMutation(obj);
              }
              uint64_t v18 = *(void *)(*((void *)&v91 + 1) + 8LL * (void)v17);
              BOOL v19 = objc_autoreleasePoolPush();
              uint64_t v20 = objc_claimAutoreleasedReturnValue( -[ControlManager lockedNeverRemoveAutoAssetDescriptors]( self,  "lockedNeverRemoveAutoAssetDescriptors"));
              id v21 = [(id)v20 safeObjectForKey:v18 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 assetId]);
              LOBYTE(v20) = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v23,  v74);

              objc_autoreleasePoolPop(v19);
              if ((v20 & 1) != 0)
              {
                int64_t v60 = 3LL;
                goto LABEL_61;
              }

              __int128 v17 = (char *)v17 + 1;
            }

            while (v15 != v17);
            id v15 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
      }

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager lockedOverridableAutoAssetDescriptors]( self,  "lockedOverridableAutoAssetDescriptors"));

      if (v24)
      {
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v87 = 0u;
        __int128 v88 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue( -[ControlManager lockedOverridableAutoAssetDescriptors]( self,  "lockedOverridableAutoAssetDescriptors"));
        id v25 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v88;
          while (2)
          {
            BOOL v28 = 0LL;
            do
            {
              if (*(void *)v88 != v27) {
                objc_enumerationMutation(obj);
              }
              uint64_t v29 = *(void *)(*((void *)&v87 + 1) + 8LL * (void)v28);
              uint64_t v30 = objc_autoreleasePoolPush();
              uint64_t v31 = objc_claimAutoreleasedReturnValue( -[ControlManager lockedOverridableAutoAssetDescriptors]( self,  "lockedOverridableAutoAssetDescriptors"));
              id v32 = [(id)v31 safeObjectForKey:v29 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 assetId]);
              LOBYTE(v31) = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v34,  v74);

              objc_autoreleasePoolPop(v30);
              if ((v31 & 1) != 0)
              {
                int64_t v60 = 4LL;
                goto LABEL_61;
              }

              BOOL v28 = (char *)v28 + 1;
            }

            while (v26 != v28);
            id v26 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }
      }

      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager unlockedUnreferencedDescriptors](self, "unlockedUnreferencedDescriptors"));

      if (v35)
      {
        __int128 v85 = 0u;
        __int128 v86 = 0u;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(-[ControlManager unlockedUnreferencedDescriptors](self, "unlockedUnreferencedDescriptors"));
        id v36 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v84;
          while (2)
          {
            id v39 = 0LL;
            do
            {
              if (*(void *)v84 != v38) {
                objc_enumerationMutation(obj);
              }
              uint64_t v40 = *(void *)(*((void *)&v83 + 1) + 8LL * (void)v39);
              id v41 = objc_autoreleasePoolPush();
              uint64_t v42 = objc_claimAutoreleasedReturnValue(-[ControlManager unlockedUnreferencedDescriptors](self, "unlockedUnreferencedDescriptors"));
              id v43 = [(id)v42 safeObjectForKey:v40 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

              uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 assetId]);
              LOBYTE(v42) = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v45,  v74);

              objc_autoreleasePoolPop(v41);
              if ((v42 & 1) != 0)
              {
                int64_t v60 = 6LL;
                goto LABEL_61;
              }

              id v39 = (char *)v39 + 1;
            }

            while (v37 != v39);
            id v37 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
            if (v37) {
              continue;
            }
            break;
          }
        }
      }

      int64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager unlockedReferencedDescriptors](self, "unlockedReferencedDescriptors"));

      if (v46)
      {
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(-[ControlManager unlockedReferencedDescriptors](self, "unlockedReferencedDescriptors"));
        id v47 = [obj countByEnumeratingWithState:&v79 objects:v96 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v80;
          while (2)
          {
            uint64_t v50 = 0LL;
            do
            {
              if (*(void *)v80 != v49) {
                objc_enumerationMutation(obj);
              }
              uint64_t v51 = *(void *)(*((void *)&v79 + 1) + 8LL * (void)v50);
              uint64_t v52 = objc_autoreleasePoolPush();
              uint64_t v53 = objc_claimAutoreleasedReturnValue(-[ControlManager unlockedReferencedDescriptors](self, "unlockedReferencedDescriptors"));
              id v54 = [(id)v53 safeObjectForKey:v51 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
              uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

              uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v55 assetId]);
              LOBYTE(v53) = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v56,  v74);

              objc_autoreleasePoolPop(v52);
              if ((v53 & 1) != 0)
              {
                int64_t v60 = 7LL;
                goto LABEL_61;
              }

              uint64_t v50 = (char *)v50 + 1;
            }

            while (v48 != v50);
            id v48 = [obj countByEnumeratingWithState:&v79 objects:v96 count:16];
            if (v48) {
              continue;
            }
            break;
          }
        }
      }

      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager stagedAutoAssetDescriptors](self, "stagedAutoAssetDescriptors"));

      if (v57)
      {
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(-[ControlManager stagedAutoAssetDescriptors](self, "stagedAutoAssetDescriptors"));
        id v58 = [obj countByEnumeratingWithState:&v75 objects:v95 count:16];
        if (v58)
        {
          id v59 = v58;
          uint64_t v69 = *(void *)v76;
          int64_t v60 = 5LL;
LABEL_48:
          uint64_t v61 = 0LL;
          while (1)
          {
            if (*(void *)v76 != v69) {
              objc_enumerationMutation(obj);
            }
            uint64_t v62 = *(void *)(*((void *)&v75 + 1) + 8 * v61);
            id v63 = objc_autoreleasePoolPush();
            uint64_t v64 = objc_claimAutoreleasedReturnValue(-[ControlManager stagedAutoAssetDescriptors](self, "stagedAutoAssetDescriptors"));
            id v65 = [(id)v64 safeObjectForKey:v62 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(v65);

            uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v66 assetId]);
            LOBYTE(v64) = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v67,  v74);

            objc_autoreleasePoolPop(v63);
            if ((v64 & 1) != 0) {
              break;
            }
            if (v59 == (id)++v61)
            {
              id v59 = [obj countByEnumeratingWithState:&v75 objects:v95 count:16];
              if (v59) {
                goto LABEL_48;
              }
              goto LABEL_54;
            }
          }
        }

        else
        {
LABEL_54:
          int64_t v60 = 0LL;
        }

- (id)chooseDescriptorsOfType:(int64_t)a3
{
  switch(a3)
  {
    case 3LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager lockedNeverRemoveAutoAssetDescriptors]( self,  "lockedNeverRemoveAutoAssetDescriptors",  v3,  v4));
      break;
    case 4LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager lockedOverridableAutoAssetDescriptors]( self,  "lockedOverridableAutoAssetDescriptors",  v3,  v4));
      break;
    case 5LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager stagedAutoAssetDescriptors](self, "stagedAutoAssetDescriptors", v3, v4));
      break;
    case 6LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager unlockedUnreferencedDescriptors](self, "unlockedUnreferencedDescriptors", v3, v4));
      break;
    case 7LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager unlockedReferencedDescriptors](self, "unlockedReferencedDescriptors", v3, v4));
      break;
    default:
      uint64_t v5 = 0LL;
      break;
  }

  return v5;
}

- (id)locateDescriptorForAssetDirectory:(id)a3 fromDescriptors:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
  id v8 = [v7 length];
  id v9 = [@".asset" length];
  BOOL v10 = v8 > v9;
  int64_t v11 = v8 - v9;
  if (v10 && [v7 hasSuffix:@".asset"])
  {
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", 0, v11));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      id v26 = v7;
      id v27 = v6;
      uint64_t v16 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          BOOL v19 = objc_autoreleasePoolPush();
          id v20 = [v13 safeObjectForKey:v18 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          uint64_t v22 = v21;
          if (v21)
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 assetId]);
            unsigned int v24 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v23, v12);

            if (v24)
            {
              objc_autoreleasePoolPop(v19);
              goto LABEL_16;
            }
          }

          objc_autoreleasePoolPop(v19);
        }

        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v15) {
          continue;
        }
        break;
      }

      uint64_t v22 = 0LL;
LABEL_16:
      id v6 = v27;
      unsigned int v7 = v26;
    }

    else
    {
      uint64_t v22 = 0LL;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  return v22;
}

- (void)maintainReclaimCountsByCollectionType:(int64_t)a3 reclaimAssetSpace:(int64_t)a4 cacheDeleteResults:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  switch(a3)
  {
    case 0LL:
    case 1LL:
    case 2LL:
      objc_msgSend(v7, "setReclaimV2AssetSpace:", (char *)objc_msgSend(v7, "reclaimV2AssetSpace") + a4);
      objc_msgSend(v8, "setReclaimV2AssetCount:", (char *)objc_msgSend(v8, "reclaimV2AssetCount") + 1);
      goto LABEL_8;
    case 3LL:
      objc_msgSend( v7,  "setReclaimLockedNeverRemoveAutoAssetSpace:",  (char *)objc_msgSend(v7, "reclaimLockedNeverRemoveAutoAssetSpace") + a4);
      objc_msgSend( v8,  "setReclaimLockedNeverRemoveAutoAssetCount:",  (char *)objc_msgSend(v8, "reclaimLockedNeverRemoveAutoAssetCount") + 1);
      goto LABEL_8;
    case 4LL:
      objc_msgSend( v7,  "setReclaimLockedOverridableAutoAssetSpace:",  (char *)objc_msgSend(v7, "reclaimLockedOverridableAutoAssetSpace") + a4);
      objc_msgSend( v8,  "setReclaimLockedOverridableAutoAssetCount:",  (char *)objc_msgSend(v8, "reclaimLockedOverridableAutoAssetCount") + 1);
      goto LABEL_8;
    case 5LL:
      objc_msgSend(v7, "setReclaimStagedAutoAssetSpace:", (char *)objc_msgSend(v7, "reclaimStagedAutoAssetSpace") + a4);
      objc_msgSend(v8, "setReclaimStagedAutoAssetCount:", (char *)objc_msgSend(v8, "reclaimStagedAutoAssetCount") + 1);
      goto LABEL_8;
    case 6LL:
      objc_msgSend( v7,  "setReclaimUnlockedUnreferencedAutoAssetSpace:",  (char *)objc_msgSend(v7, "reclaimUnlockedUnreferencedAutoAssetSpace") + a4);
      objc_msgSend( v8,  "setReclaimUnlockedUnreferencedAutoAssetCount:",  (char *)objc_msgSend(v8, "reclaimUnlockedUnreferencedAutoAssetCount") + 1);
      goto LABEL_8;
    case 7LL:
      objc_msgSend( v7,  "setReclaimUnlockedReferencedAutoAssetSpace:",  (char *)objc_msgSend(v7, "reclaimUnlockedReferencedAutoAssetSpace") + a4);
      objc_msgSend( v8,  "setReclaimUnlockedReferencedAutoAssetCount:",  (char *)objc_msgSend(v8, "reclaimUnlockedReferencedAutoAssetCount") + 1);
LABEL_8:
      id v7 = v8;
      break;
    default:
      break;
  }
}

- (id)alterGarbageColletionLevel:(id)a3 basedOnAssetDirectory:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 path]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ControlManager garbageCollectionAlterAssetType](self, "garbageCollectionAlterAssetType"));
  id v9 = v6;
  if (v8)
  {
    BOOL v10 = (void *)v8;
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager garbageCollectionAlterBehavior](self, "garbageCollectionAlterBehavior"));

    id v9 = v6;
    if (v11)
    {
      int64_t v12 = objc_alloc(&OBJC_CLASS___NSMutableString);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager garbageCollectionAlterAssetType](self, "garbageCollectionAlterAssetType"));
      id v14 = -[NSMutableString initWithFormat:](v12, "initWithFormat:", @"/%@/", v13);

      -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( v14,  "replaceOccurrencesOfString:withString:options:range:",  @".",  @"_",  2LL,  0LL,  -[NSMutableString length](v14, "length"));
      id v9 = v6;
      if ([v7 containsString:v14])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager garbageCollectionAlterBehavior](self, "garbageCollectionAlterBehavior"));
      }
    }
  }

  return v9;
}

- (double)alterSecondsBeforeCollection:(double)a3 forAssetTypeDir:(id)a4 determinedDescriptorType:(int64_t)a5 fromDescriptors:(id)a6 isAutoAsset:(BOOL *)a7 autoAssetDescriptor:(id *)a8 assetFilesystemSize:(int64_t *)a9 retentionPolicy:(int64_t)a10
{
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager locateDescriptorForAssetDirectory:fromDescriptors:]( self,  "locateDescriptorForAssetDirectory:fromDescriptors:",  a4,  a6));
  __int128 v17 = v16;
  BOOL v18 = v16 != 0LL;
  if (v16) {
    id v19 = [v16 downloadedFilesystemBytes];
  }
  else {
    id v19 = 0LL;
  }
  if (-[ControlManager reclaimUrgency](self, "reclaimUrgency") > 3)
  {
    switch(a5)
    {
      case 0LL:
      case 1LL:
      case 2LL:
        goto LABEL_20;
      case 3LL:
        goto LABEL_17;
      case 4LL:
        goto LABEL_19;
      case 5LL:
        if (a10 <= 799) {
          double v20 = 0.0;
        }
        else {
          double v20 = -1.0;
        }
        break;
      case 6LL:
      case 7LL:
        goto LABEL_6;
      default:
        goto LABEL_18;
    }

    goto LABEL_22;
  }

  if (-[ControlManager reclaimUrgency](self, "reclaimUrgency") > 2)
  {
    switch(a5)
    {
      case 0LL:
      case 1LL:
      case 2LL:
        goto LABEL_9;
      case 3LL:
      case 4LL:
        goto LABEL_17;
      case 5LL:
LABEL_19:
        double v20 = -1.0;
        if (a10 > 799) {
          goto LABEL_22;
        }
LABEL_20:
        float v21 = a3;
        float v22 = 0.1;
        break;
      case 6LL:
        goto LABEL_6;
      case 7LL:
        goto LABEL_37;
      default:
        goto LABEL_18;
    }

- (int64_t)performGarbageCollectionOfType:(int64_t)a3 forAssetTypeDir:(id)a4 fromDescriptors:(id)a5 cacheDeleteResults:(id)a6
{
  id v10 = a4;
  id v87 = a5;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cachedeleteQueue);
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
  v100[0] = -1.0;
  if (a3) {
    id v13 = 0LL;
  }
  else {
    id v13 = v100;
  }
  double ExistingClientUsage = getExistingClientUsage(v10, v13);
  char v99 = 0;
  uint64_t v93 = 0LL;
  __int128 v94 = &v93;
  uint64_t v95 = 0x3032000000LL;
  uint64_t v96 = __Block_byref_object_copy__15;
  id v97 = __Block_byref_object_dispose__15;
  id v98 = 0LL;
  if (ExistingClientUsage <= 0.0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager cacheDeleteOperationName](self, "cacheDeleteOperationName"));
    _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager performGarbageCollectionOfType:forAssetTypeDir:fromDescriptors:cacheDeleteResults:]",  @"[GARBAGE_COLLECTION] {performGarbageCollectionOfType} %@ | setting client usage as it was not set | asset:%@",  v16,  v17,  v18,  v19,  (uint64_t)v15);

    updateClientUsageDate(v10);
    double ExistingClientUsage = getExistingClientUsage(v10, v100);
  }

  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __100__ControlManager_performGarbageCollectionOfType_forAssetTypeDir_fromDescriptors_cacheDeleteResults___block_invoke;
  block[3] = &unk_34DE88;
  __int128 v92 = &v93;
  void block[4] = self;
  id v21 = v10;
  id v91 = v21;
  dispatch_sync(assetQueue, block);
  id v26 = (void *)v94[5];
  if (v26)
  {
    id v89 = [v26 safeIntegerForKey:@"_UnarchivedSize"];
    id v27 = (void *)objc_claimAutoreleasedReturnValue([(id)v94[5] objectForKey:@"__AssetDefaultGarbageCollectionBehavior"]);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( -[ControlManager alterGarbageColletionLevel:basedOnAssetDirectory:]( self,  "alterGarbageColletionLevel:basedOnAssetDirectory:",  v27,  v21));

    double v29 = v100[0];
    if (v100[0] <= 0.0)
    {
      if (!v28) {
        goto LABEL_18;
      }
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v28, v30) & 1) == 0) {
        goto LABEL_18;
      }
      if ([v28 isEqualToString:@"NeverCollected"])
      {
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager cacheDeleteOperationName](self, "cacheDeleteOperationName"));
        _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager performGarbageCollectionOfType:forAssetTypeDir:fromDescriptors:cacheDeleteResults:]",  @"[GARBAGE_COLLECTION] {performGarbageCollectionOfType} %@ | skipping due to policy of never collect | asset:%@",  v32,  v33,  v34,  v35,  (uint64_t)v31);

        objc_msgSend( v11,  "setReclaimMetadataBlockedSpace:",  (char *)objc_msgSend(v11, "reclaimMetadataBlockedSpace") + (void)v89);
        double v29 = -1.0;
        objc_msgSend( v11,  "setReclaimMetadataBlockedCount:",  (char *)objc_msgSend(v11, "reclaimMetadataBlockedCount") + 1);
        goto LABEL_20;
      }

      if (![v28 isEqualToString:@"Default"])
      {
        double v29 = -1.0;
        -[ControlManager preciousNumberOfSeconds](self, "preciousNumberOfSeconds");
      }

      else
      {
LABEL_18:
        -[ControlManager defaultNumberOfSeconds](self, "defaultNumberOfSeconds");
      }

      double v29 = v38;
    }

void __100__ControlManager_performGarbageCollectionOfType_forAssetTypeDir_fromDescriptors_cacheDeleteResults___block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getAssetAttributes:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)performCacheDeleteCollection:(id)a3 forCollectionType:(int64_t)a4 withGarbageCollectionTypes:(id)a5 cacheDeleteResults:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v28 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cachedeleteQueue);
  int64_t v12 = (char *)[v10 count];
  if ([v11 count] != v12)
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager cacheDeleteOperationName](self, "cacheDeleteOperationName"));
    [v11 count];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:]",  @"[GARBAGE_COLLECTION] {performCacheDeleteCollection} %@ | number of assets and GC types for those corresponding assets don't match | assetCount: %ld | assetGCTypesCount: %ld",  v21,  v22,  v23,  v24,  (uint64_t)v20);

    goto LABEL_11;
  }

  if ((uint64_t)v12 < 1)
  {
LABEL_11:
    int64_t v29 = 0LL;
    goto LABEL_12;
  }

  int64_t v29 = 0LL;
  id v13 = 0LL;
  id v26 = v10;
  id v27 = v11;
  do
  {
    id v14 = objc_autoreleasePoolPush();
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:v13]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v13]);
    if ((int)[v16 intValue] == a4)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager chooseDescriptorsOfType:](self, "chooseDescriptorsOfType:", a4));
      uint64_t v18 = -[ControlManager performGarbageCollectionOfType:forAssetTypeDir:fromDescriptors:cacheDeleteResults:]( self,  "performGarbageCollectionOfType:forAssetTypeDir:fromDescriptors:cacheDeleteResults:",  a4,  v15,  v17,  v28);
      if (v18 >= 1)
      {
        uint64_t v19 = v18;
        -[ControlManager maintainReclaimCountsByCollectionType:reclaimAssetSpace:cacheDeleteResults:]( self,  "maintainReclaimCountsByCollectionType:reclaimAssetSpace:cacheDeleteResults:",  a4,  v18,  v28);
        v29 += v19;
      }

      id v10 = v26;
      id v11 = v27;
    }

    ++v13;

    objc_autoreleasePoolPop(v14);
  }

  while (v12 != v13);
LABEL_12:

  return v29;
}

- (int64_t)performCacheDeleteForGroup:(id)a3 forAssetTypeDir:(id)a4 timeTaken:(double *)a5 cacheDeleteResults:(id)a6
{
  id v56 = a3;
  id v10 = a4;
  id v58 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cachedeleteQueue);
  uint64_t v55 = v10;
  id AssetsAtPath = getAssetsAtPath(v10);
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(AssetsAtPath);
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)i);
        double v20 = objc_autoreleasePoolPush();
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[ControlManager garbageCollectionDescriptorType:]( self,  "garbageCollectionDescriptorType:",  v19)));
        -[NSMutableArray addObject:](v13, "addObject:", v21);

        objc_autoreleasePoolPop(v20);
      }

      id v16 = [v14 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }

    while (v16);
  }

  id v22 = [v14 count];
  if (v22 != -[NSMutableArray count](v13, "count"))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager cacheDeleteOperationName](self, "cacheDeleteOperationName"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager targetingAmountString](self, "targetingAmountString"));
    uint64_t v30 = v55;
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v55 absoluteString]);
    [v14 count];
    -[NSMutableArray count](v13, "count");
    int64_t v29 = v56;
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager performCacheDeleteForGroup:forAssetTypeDir:timeTaken:cacheDeleteResults:]",  @"[GARBAGE_COLLECTION] {[%@]performCacheDeleteForGroup} %@ | unable to determine collection types | targetingPurgeBytes:%@ | directory:%@ | assetCount:%ld | collectionTypeCount:%ld",  v32,  v33,  v34,  v35,  (uint64_t)v56);

    uint64_t v59 = 0LL;
LABEL_31:
    uint64_t v24 = v58;
    goto LABEL_32;
  }

  uint64_t v23 = (char *)[v14 count];
  uint64_t v24 = v58;
  if (!-[ControlManager reclaimSpace](self, "reclaimSpace"))
  {
    if ((uint64_t)v23 < 1)
    {
      uint64_t v59 = 0LL;
    }

    else
    {
      uint64_t v59 = 0LL;
      id v36 = 0LL;
      double v57 = v23;
      do
      {
        unsigned int context = objc_autoreleasePoolPush();
        int64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v36]);
        double v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v13, "objectAtIndex:", v36));
        uint64_t v39 = (int)[v38 intValue];
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager chooseDescriptorsOfType:](self, "chooseDescriptorsOfType:", v39));
        uint64_t v41 = -[ControlManager performGarbageCollectionOfType:forAssetTypeDir:fromDescriptors:cacheDeleteResults:]( self,  "performGarbageCollectionOfType:forAssetTypeDir:fromDescriptors:cacheDeleteResults:",  v39,  v37,  v40,  v58);
        if (v41 >= 1)
        {
          uint64_t v42 = v41;
          -[ControlManager maintainReclaimCountsByCollectionType:reclaimAssetSpace:cacheDeleteResults:]( self,  "maintainReclaimCountsByCollectionType:reclaimAssetSpace:cacheDeleteResults:",  v39,  v41,  v58);
          v59 += v42;
        }

        ++v36;

        objc_autoreleasePoolPop(context);
      }

      while (v57 != v36);
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager cacheDeleteOperationName](self, "cacheDeleteOperationName"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager targetingAmountString](self, "targetingAmountString"));
    uint64_t v30 = v55;
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v55 absoluteString]);
    -[ControlManager reclaimSpace](self, "reclaimSpace");
    uint64_t v48 = allocStringForBytes(v59);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(v48);
    int64_t v29 = v56;
    _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager performCacheDeleteForGroup:forAssetTypeDir:timeTaken:cacheDeleteResults:]",  @"[GARBAGE_COLLECTION] {[%@]performCacheDeleteForGroup} %@ | targetingPurgeBytes:%@ | directory:%@ | %@:%@",  v49,  v50,  v51,  v52,  (uint64_t)v56);

    goto LABEL_31;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v26 = -[ControlManager performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:]( self,  "performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:",  v14,  6LL,  v13,  v58);
  if (v26 < -[ControlManager targetingPurgeAmount](self, "targetingPurgeAmount")) {
    v26 += -[ControlManager performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:]( self,  "performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:",  v14,  5LL,  v13,  v58);
  }
  if (v26 < -[ControlManager targetingPurgeAmount](self, "targetingPurgeAmount")) {
    v26 += -[ControlManager performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:]( self,  "performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:",  v14,  0LL,  v13,  v58);
  }
  if (v26 < -[ControlManager targetingPurgeAmount](self, "targetingPurgeAmount")) {
    v26 += -[ControlManager performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:]( self,  "performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:",  v14,  7LL,  v13,  v58);
  }
  if (v26 < -[ControlManager targetingPurgeAmount](self, "targetingPurgeAmount")
    && -[ControlManager reclaimUrgency](self, "reclaimUrgency") >= 4)
  {
    v26 += -[ControlManager performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:]( self,  "performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:",  v14,  4LL,  v13,  v58);
  }

  uint64_t v59 = v26;
  if (a5)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v27 timeIntervalSinceDate:v25];
    *(void *)a5 = v28;
    uint64_t v30 = v55;
    int64_t v29 = v56;
  }

  else
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[ControlManager cacheDeleteOperationName](self, "cacheDeleteOperationName"));
    int64_t v29 = v56;
    _MobileAssetLog( 0LL,  4,  (uint64_t)"-[ControlManager performCacheDeleteForGroup:forAssetTypeDir:timeTaken:cacheDeleteResults:]",  @"[GARBAGE_COLLECTION] {[%@]performCacheDeleteForGroup} %@ | Not able to calculate time since null passed in for timeTaken",  v43,  v44,  v45,  v46,  (uint64_t)v56);
    uint64_t v30 = v55;
  }

- (BOOL)freedUpEnoughSpace:(int64_t)a3
{
  BOOL v5 = -[ControlManager reclaimSpace](self, "reclaimSpace");
  if (v5) {
    LOBYTE(v5) = -[ControlManager targetingPurgeAmount](self, "targetingPurgeAmount") <= a3;
  }
  return v5;
}

- (void)respondToCacheDelete:(BOOL)a3 targetingPurgeAmount:(int64_t)a4 cacheDeleteResults:(id)a5 withUrgency:(int)a6 forVolume:(id)a7 then:(id)a8
{
  id v14 = a5;
  id v15 = a7;
  id v16 = (void (**)(id, void))a8;
  if (usingCentralizedCachedelete())
  {
    if (v16) {
      v16[2](v16, 0LL);
    }
  }

  else
  {
    -[ControlManager setPreciousNumberOfSeconds:](self, "setPreciousNumberOfSeconds:", -1.0);
    -[ControlManager setDefaultNumberOfSeconds:](self, "setDefaultNumberOfSeconds:", -1.0);
    -[ControlManager setDeltaToCurrentTimeSeconds:](self, "setDeltaToCurrentTimeSeconds:", -1.0);
    if (_MAPreferencesIsInternalAllowed())
    {
      char v42 = 0;
      id AppIntegerValue = _MAPreferencesGetAppIntegerValue(@"preciousNumberOfSecsGC", &v42);
      BOOL v18 = v42 != 0;
      if (v42) {
        -[ControlManager setPreciousNumberOfSeconds:]( self,  "setPreciousNumberOfSeconds:",  (double)(uint64_t)AppIntegerValue);
      }
      id v19 = _MAPreferencesGetAppIntegerValue(@"defaultNumberOfSecsGC", &v42);
      BOOL v32 = v42 != 0;
      if (v42) {
        -[ControlManager setDefaultNumberOfSeconds:](self, "setDefaultNumberOfSeconds:", (double)(uint64_t)v19);
      }
      id v20 = _MAPreferencesGetAppIntegerValue(@"GarbageCollectionCurrentTimeDeltaSecs", &v42);
      if (v42) {
        -[ControlManager setDeltaToCurrentTimeSeconds:](self, "setDeltaToCurrentTimeSeconds:", (double)(uint64_t)v20);
      }
      uint64_t v21 = _MAPreferencesCopyNSStringValue(@"GarbageCollectionAlterAssetType");
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        -[ControlManager setGarbageCollectionAlterAssetType:](self, "setGarbageCollectionAlterAssetType:", v22);
        uint64_t v24 = _MAPreferencesCopyNSStringValue(@"GarbageCollectionAlterBehavior");
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

        if (v25)
        {
          -[ControlManager setGarbageCollectionAlterBehavior:](self, "setGarbageCollectionAlterBehavior:", v25);
        }
      }

      BOOL v26 = v18;
      BOOL v27 = v32;
    }

    else
    {
      BOOL v26 = 0;
      BOOL v27 = 0;
    }

    -[ControlManager preciousNumberOfSeconds](self, "preciousNumberOfSeconds");
    if (v28 == -1.0) {
      -[ControlManager setPreciousNumberOfSeconds:](self, "setPreciousNumberOfSeconds:", 2678400.0);
    }
    -[ControlManager defaultNumberOfSeconds](self, "defaultNumberOfSeconds");
    if (v29 == -1.0) {
      -[ControlManager setDefaultNumberOfSeconds:](self, "setDefaultNumberOfSeconds:", 1296000.0);
    }
    -[ControlManager deltaToCurrentTimeSeconds](self, "deltaToCurrentTimeSeconds");
    if (v30 == -1.0) {
      -[ControlManager setDeltaToCurrentTimeSeconds:](self, "setDeltaToCurrentTimeSeconds:", 0.0);
    }
    cachedeleteQueue = (dispatch_queue_s *)self->_cachedeleteQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __106__ControlManager_respondToCacheDelete_targetingPurgeAmount_cacheDeleteResults_withUrgency_forVolume_then___block_invoke;
    block[3] = &unk_34FEA0;
    BOOL v39 = a3;
    void block[4] = self;
    int64_t v37 = a4;
    int v38 = a6;
    id v34 = v15;
    BOOL v40 = v26;
    BOOL v41 = v27;
    id v35 = v14;
    id v36 = v16;
    dispatch_async(cachedeleteQueue, block);
  }
}

uint64_t __106__ControlManager_respondToCacheDelete_targetingPurgeAmount_cacheDeleteResults_withUrgency_forVolume_then___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v227 = a1;
  id v10 = *(void **)(a1 + 32);
  uint64_t v9 = a1 + 32;
  [v10 setReclaimSpace:*(unsigned __int8 *)(v9 + 44)];
  [*(id *)v9 setTargetingPurgeAmount:*(void *)(v9 + 32)];
  id v11 = allocStringForBytes(*(void *)(v9 + 32));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [*(id *)v9 setTargetingAmountString:v12];

  [*(id *)v9 setReclaimUrgency:*(unsigned int *)(v227 + 72)];
  id v13 = stringForCacheDeleteUrgency((int)[*(id *)v9 reclaimUrgency]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [*(id *)v9 setReclaimUrgencyName:v14];

  [*(id *)v9 setReclaimVolume:*(void *)(v227 + 40)];
  if (*(_BYTE *)(v9 + 44)) {
    id v15 = @"reclaiming space";
  }
  else {
    id v15 = @"determining reclaimable space";
  }
  [*(id *)v9 setCacheDeleteOperationName:v15];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v16 timeIntervalSince1970];
  double v18 = v17;
  [*(id *)v9 deltaToCurrentTimeSeconds];
  [*(id *)v9 setCurrentTimeInSeconds:v18 + v19];

  [*(id *)v9 removeDownloadsNotRecentlyInFlight:0];
  [*(id *)v9 currentTimeInSeconds];
  id v20 = *(id *)v9;
  if (v21 >= 31536000.0)
  {
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v20 reclaimVolume]);
    id AssetTypeDirectoriesForVolume = getAssetTypeDirectoriesForVolume(v26);
    uint64_t v213 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeDirectoriesForVolume);

    if (v213 && [v213 count])
    {
      id v28 = [v213 count];
      _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager respondToCacheDelete:targetingPurgeAmount:cacheDeleteResults:withUrgency:forVolume:the n:]_block_invoke",  @"[GARBAGE_COLLECTION] {respondToCacheDelete} have assetTypeDirs:%ld",  v29,  v30,  v31,  v32,  (uint64_t)v28);
      id v33 = [*(id *)(v227 + 32) reclaimSpace];
      id v252 = 0LL;
      id v251 = 0LL;
      id v250 = 0LL;
      id v249 = 0LL;
      id v248 = 0LL;
      +[MADAutoAssetControlManager copyCurrentDownloadedDescriptors:unlockedUnreferencedDescriptors:unlockedReferencedDescriptors:lockedOverridableDescriptors:lockedNeverRemoveDescriptors:stagedDescriptors:]( &OBJC_CLASS___MADAutoAssetControlManager,  "copyCurrentDownloadedDescriptors:unlockedUnreferencedDescriptors:unlockedReferencedDescriptors:lockedOverridable Descriptors:lockedNeverRemoveDescriptors:stagedDescriptors:",  v33,  &v252,  &v251,  &v250,  &v249,  &v248);
      id v34 = v252;
      id v206 = v251;
      id v208 = v250;
      id v205 = v249;
      id v207 = v248;
      uint64_t v197 = v34;
      [*(id *)(v227 + 32) setUnlockedUnreferencedDescriptors:v34];
      [*(id *)(v227 + 32) setUnlockedReferencedDescriptors:v206];
      [*(id *)(v227 + 32) setLockedOverridableAutoAssetDescriptors:v208];
      [*(id *)(v227 + 32) setLockedNeverRemoveAutoAssetDescriptors:v205];
      [*(id *)(v227 + 32) setStagedAutoAssetDescriptors:v207];
      id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) unlockedUnreferencedDescriptors]);
      uint64_t v36 = +[MADAutoAssetDescriptor totalFilesystemSpaceForAutoAssetDescriptors:]( &OBJC_CLASS___MADAutoAssetDescriptor,  "totalFilesystemSpaceForAutoAssetDescriptors:",  v35);

      int64_t v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) unlockedReferencedDescriptors]);
      uint64_t v38 = +[MADAutoAssetDescriptor totalFilesystemSpaceForAutoAssetDescriptors:]( &OBJC_CLASS___MADAutoAssetDescriptor,  "totalFilesystemSpaceForAutoAssetDescriptors:",  v37);

      BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) lockedOverridableAutoAssetDescriptors]);
      uint64_t v40 = +[MADAutoAssetDescriptor totalFilesystemSpaceForAutoAssetDescriptors:]( &OBJC_CLASS___MADAutoAssetDescriptor,  "totalFilesystemSpaceForAutoAssetDescriptors:",  v39);

      BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) lockedNeverRemoveAutoAssetDescriptors]);
      uint64_t v42 = +[MADAutoAssetDescriptor totalFilesystemSpaceForAutoAssetDescriptors:]( &OBJC_CLASS___MADAutoAssetDescriptor,  "totalFilesystemSpaceForAutoAssetDescriptors:",  v41);

      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) stagedAutoAssetDescriptors]);
      uint64_t v209 = +[MADAutoAssetDescriptor totalFilesystemSpaceForAutoAssetDescriptors:]( &OBJC_CLASS___MADAutoAssetDescriptor,  "totalFilesystemSpaceForAutoAssetDescriptors:",  v43);

      uint64_t v202 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) unlockedUnreferencedDescriptors]);
      id v200 = [v44 count];
      uint64_t v45 = allocStringForBytes(v36);
      uint64_t v214 = (void *)objc_claimAutoreleasedReturnValue(v45);
      contextd = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) unlockedReferencedDescriptors]);
      id v198 = [contextd count];
      uint64_t v46 = allocStringForBytes(v38);
      id obja = (id)objc_claimAutoreleasedReturnValue(v46);
      uint64_t v218 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) lockedOverridableAutoAssetDescriptors]);
      id v47 = [v218 count];
      uint64_t v48 = allocStringForBytes(v40);
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) lockedNeverRemoveAutoAssetDescriptors]);
      id v51 = [v50 count];
      uint64_t v52 = allocStringForBytes(v42);
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) stagedAutoAssetDescriptors]);
      id v55 = [v54 count];
      id v56 = allocStringForBytes(v209);
      double v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      v210 = -[NSString initWithFormat:]( v202,  "initWithFormat:",  @"(downloadedAutoAssets) unlocked[unreferenced]:%ld(%@), unlocked[referenced]:%ld(%@), lockedOverridable:%ld(%@), lockedNeverRemove:%ld(%@), staged:%ld(%@)",  v200,  v214,  v198,  obja,  v47,  v49,  v51,  v53,  v55,  v57);

      unsigned int context = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) cacheDeleteOperationName]);
      id v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) targetingAmountString]);
      [*(id *)(v227 + 32) reclaimUrgency];
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) reclaimUrgencyName]);
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v227 + 32) reclaimVolume]);
      [v213 count];
      [*(id *)(v227 + 32) preciousNumberOfSeconds];
      id v62 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  (uint64_t)v61);
      [*(id *)(v227 + 32) defaultNumberOfSeconds];
      id v64 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  (uint64_t)v63);
      [*(id *)(v227 + 32) deltaToCurrentTimeSeconds];
      if (v69 <= 0.0)
      {
        _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager respondToCacheDelete:targetingPurgeAmount:cacheDeleteResults:withUrgency:forVolume:t hen:]_block_invoke",  @"[GARBAGE_COLLECTION] {respondToCacheDelete} %@... | targetingPurgeAmount:%@ | urgency:%d(%@) | volume:%@ | assetTypeDirs:%ld | preciousInterval:%@%@, defaultInterval:%@%@%@ | autoAssetStatus:%@",  v65,  v66,  v67,  v68,  (uint64_t)context);
      }

      else
      {
        uint64_t v70 = objc_alloc(&OBJC_CLASS___NSString);
        [*(id *)(v227 + 32) deltaToCurrentTimeSeconds];
        id v72 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  (uint64_t)v71);
        id v190 = -[NSString initWithFormat:](v70, "initWithFormat:", @", deltaToCurrentTime:%@", v72);
        _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager respondToCacheDelete:targetingPurgeAmount:cacheDeleteResults:withUrgency:forVolume:t hen:]_block_invoke",  @"[GARBAGE_COLLECTION] {respondToCacheDelete} %@... | targetingPurgeAmount:%@ | urgency:%d(%@) | volume:%@ | assetTypeDirs:%ld | preciousInterval:%@%@, defaultInterval:%@%@%@ | autoAssetStatus:%@",  v73,  v74,  v75,  v76,  (uint64_t)context);
      }

      __int128 v246 = 0u;
      __int128 v247 = 0u;
      __int128 v244 = 0u;
      __int128 v245 = 0u;
      id obj = v213;
      id v219 = [obj countByEnumeratingWithState:&v244 objects:v254 count:16];
      if (v219)
      {
        __int128 v94 = 0LL;
        uint64_t v93 = 0LL;
        uint64_t v215 = *(void *)v245;
        double v95 = 0.0;
        while (2)
        {
          for (i = 0LL; i != v219; i = (char *)i + 1)
          {
            if (*(void *)v245 != v215) {
              objc_enumerationMutation(obj);
            }
            id v97 = *(void **)(*((void *)&v244 + 1) + 8LL * (void)i);
            contexta = objc_autoreleasePoolPush();
            double v233 = 0.0;
            uint64_t v98 = (uint64_t)[*(id *)(v227 + 32) performCacheDeleteForGroup:@"assetTypeDir" forAssetTypeDir:v97 timeTaken:&v233 cacheDeleteResults:*(void *)(v227 + 48)];
            id AssetsAtPath = getAssetsAtPath(v97);
            uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(AssetsAtPath);
            id v101 = [v100 count];

            double v95 = v95 + v233;
            if (v98 < 1)
            {
              if ((uint64_t)v101 >= 1) {
                _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager respondToCacheDelete:targetingPurgeAmount:cacheDeleteResults:withUrgency:for Volume:then:]_block_invoke",  @"[GARBAGE_COLLECTION] {respondToCacheDelete} | Couldn't reclaim any of the asset in the directory | countAssets: %ld",  v102,  v103,  v104,  v105,  (uint64_t)v101);
              }
            }

            else
            {
              v93 += v98;
              if ([*(id *)(v227 + 32) freedUpEnoughSpace:v93])
              {
                objc_autoreleasePoolPop(contexta);
                goto LABEL_46;
              }
            }

            id PurposeDirectoriesAtPath = getPurposeDirectoriesAtPath(v97);
            uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue(PurposeDirectoriesAtPath);

            if (v107)
            {
              __int128 v242 = 0u;
              __int128 v243 = 0u;
              __int128 v240 = 0u;
              __int128 v241 = 0u;
              id v108 = v107;
              id v109 = [v108 countByEnumeratingWithState:&v240 objects:v253 count:16];
              if (v109)
              {
                uint64_t v110 = *(void *)v241;
LABEL_33:
                uint64_t v111 = 0LL;
                while (1)
                {
                  if (*(void *)v241 != v110) {
                    objc_enumerationMutation(v108);
                  }
                  uint64_t v112 = *(void *)(*((void *)&v240 + 1) + 8 * v111);
                  uint64_t v113 = objc_autoreleasePoolPush();
                  double v239 = 0.0;
                  id v114 = [*(id *)(v227 + 32) performCacheDeleteForGroup:@"_purposeDir_" forAssetTypeDir:v112 timeTaken:&v239 cacheDeleteResults:*(void *)(v227 + 48)];
                  double v115 = v239;
                  v93 += (uint64_t)v114;
                  LOBYTE(v112) = [*(id *)(v227 + 32) freedUpEnoughSpace:v93];
                  objc_autoreleasePoolPop(v113);
                  double v95 = v95 + v115;
                  if ((v112 & 1) != 0) {
                    break;
                  }
                  if (v109 == (id)++v111)
                  {
                    id v109 = [v108 countByEnumeratingWithState:&v240 objects:v253 count:16];
                    if (v109) {
                      goto LABEL_33;
                    }
                    break;
                  }
                }
              }
            }

            unsigned __int8 v116 = [*(id *)(v227 + 32) freedUpEnoughSpace:v93];
            objc_autoreleasePoolPop(contexta);
            if ((v116 & 1) != 0)
            {
              __int128 v94 = v107;
              goto LABEL_46;
            }

            __int128 v94 = v107;
          }

          id v219 = [obj countByEnumeratingWithState:&v244 objects:v254 count:16];
          __int128 v94 = v107;
          if (v219) {
            continue;
          }
          break;
        }
      }

      else
      {
        __int128 v94 = 0LL;
        uint64_t v93 = 0LL;
        double v95 = 0.0;
      }

void __106__ControlManager_respondToCacheDelete_targetingPurgeAmount_cacheDeleteResults_withUrgency_forVolume_then___block_invoke_2( uint64_t a1)
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) analytics]);
  uint64_t v2 = *(void *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  uint64_t v4 = (int)[*(id *)(a1 + 32) reclaimUrgency];
  BOOL v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id v7 = v5;
  if (!v5)
  {
    id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  }

  id v9 =  objc_msgSend( v10,  "recordCacheDeleteAttempt:timeTakenSecs:cacheDeleteUrgency:results:targetPurgeVolume:triggeringOperation:",  v2,  v4,  v6,  v7,  objc_msgSend(*(id *)(a1 + 32), "reclaimSpace"),  v3);
  if (!v5) {
}
  }

- (BOOL)purgeCatalogOfType:(id)a3 clientName:(id)a4 withPurpose:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 1;
  id PathToAssetFileWithPurpose = getPathToAssetFileWithPurpose(v8, v10);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(PathToAssetFileWithPurpose);
  if (v16)
  {
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v18 = [v17 fileExistsAtPath:v16];

    if (v18)
    {
      metaDataQueue = (dispatch_queue_s *)self->_metaDataQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __60__ControlManager_purgeCatalogOfType_clientName_withPurpose___block_invoke;
      block[3] = &unk_34F4B0;
      id v27 = v16;
      id v28 = v9;
      id v29 = v8;
      uint64_t v30 = &v31;
      dispatch_sync(metaDataQueue, block);
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeCatalogOfType:clientName:withPurpose:]",  @"%@ could not purge catalog of type %@ from %@ (doesn't exist, treating as success)",  v19,  v20,  v21,  v22,  (uint64_t)v9);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeCatalogOfType:clientName:withPurpose:]",  @"%@ could not purge catalog of type %@ from nil (path composition faillure)",  v12,  v13,  v14,  v15,  (uint64_t)v9);
    *((_BYTE *)v32 + 24) = 0;
  }

  char v24 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v31, 8);
  return v24;
}

void __60__ControlManager_purgeCatalogOfType_clientName_withPurpose___block_invoke(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = a1[4];
  id v9 = 0LL;
  [v2 removeItemAtPath:v3 error:&v9];
  id v4 = v9;

  if (v4)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeCatalogOfType:clientName:withPurpose:]_block_invoke",  @"%@ could not purge catalog of type %@ from %@",  v5,  v6,  v7,  v8,  a1[5]);
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
  }
}

- (void)getProductMarketingVersions:(id)a3 and:(id)a4 clientName:(id)a5 assetType:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager getProductMarketingVersions:and:clientName:assetType:]",  @"%@ issued PMV download command %@",  v13,  v14,  v15,  v16,  (uint64_t)v10);
  id DownloadManager = getDownloadManager();
  id v18 = (id)objc_claimAutoreleasedReturnValue(DownloadManager);
  [v18 registerPmvDownloadJob:v9 using:v12 with:v11 clientName:v10];
}

- (void)purgeCatalogs:(id)a3 and:(id)a4 assetTypesList:(id)a5 clientName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[ControlManager beforeFirstUnlock](self, "beforeFirstUnlock"))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeCatalogs:and:assetTypesList:clientName:]",  @"%@ cannot purgeCatalogs before first unlock",  v14,  v15,  v16,  v17,  (uint64_t)v13);
    sendClientResponse(v10, v11, 11LL);
  }

  else
  {
    string = xpc_dictionary_get_string(v11, "Purpose");
    uint64_t v19 = normalizePurposeFromUtf8((uint64_t)string);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (isWellFormedPurpose(v20))
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeCatalogs:and:assetTypesList:clientName:]",  @"%@ purgeCatalogs: the asset types are: %@ with purpose: %@",  v21,  v22,  v23,  v24,  (uint64_t)v13);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v12));
      id DownloadManager = getDownloadManager();
      id v27 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = __62__ControlManager_purgeCatalogs_and_assetTypesList_clientName___block_invoke;
      v28[3] = &unk_34FE28;
      v28[4] = self;
      id v29 = v12;
      id v30 = v13;
      id v31 = v20;
      id v32 = v10;
      id v33 = v11;
      objc_msgSend( v27,  "cancelAllDownloading:withPurpose:includingAssets:includingCatalog:includingOther:clientName:then:",  v25,  v31,  0,  1,  0,  v30,  v28,  v12,  v20);
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeCatalogs:and:assetTypesList:clientName:]",  @"%@ cannot purgeCatalogs with invalid purpose",  v21,  v22,  v23,  v24,  (uint64_t)v13);
      sendClientResponse(v10, v11, 5LL);
    }
  }
}

void __62__ControlManager_purgeCatalogs_and_assetTypesList_clientName___block_invoke(uint64_t a1, char a2)
{
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 48LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __62__ControlManager_purgeCatalogs_and_assetTypesList_clientName___block_invoke_2;
  block[3] = &unk_34E8C0;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  char v15 = a2;
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 72);
  dispatch_async(v5, block);
}

void __62__ControlManager_purgeCatalogs_and_assetTypesList_clientName___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = *(id *)(a1 + 32);
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v10)
  {

    goto LABEL_12;
  }

  id v11 = v10;
  int v12 = 0;
  uint64_t v13 = *(void *)v29;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
      uint64_t v16 = objc_autoreleasePoolPush();
      v12 |= [*(id *)(a1 + 40) purgeCatalogOfType:v15 clientName:*(void *)(a1 + 48) withPurpose:*(void *)(a1 + 56)] ^ 1;
      objc_autoreleasePoolPop(v16);
    }

    id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }

  while (v11);

  if ((v12 & 1) == 0)
  {
LABEL_12:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager purgeCatalogs:and:assetTypesList:clientName:]_block_invoke_2",  @"%@ finished purge catalogs for %@ with purpose: %@",  v17,  v18,  v19,  v20,  *(void *)(a1 + 48));
    if (*(_BYTE *)(a1 + 80))
    {
      int64_t v21 = 0LL;
      goto LABEL_15;
    }

- (id)dictionaryWithArrayOfStringValues:(id)a3 forXpcKey:(const char *)a4 andLengthKey:(const char *)a5 failureReason:(id *)a6
{
  id v9 = a3;
  id v10 = preservedIdsDecodeClasses();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id ObjectFromMessageLogIfDesired = getObjectFromMessageLogIfDesired(v9, a5, a4, v11, 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue(ObjectFromMessageLogIfDesired);

  if (!v13)
  {
    if (a6)
    {
      id v13 = 0LL;
      *a6 = @"Missing required dictionary field provided by client";
      goto LABEL_46;
    }

- (void)handleGarbageCollect:(id)a3 and:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___MADAnalyticsCacheDeleteResults);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __43__ControlManager_handleGarbageCollect_and___block_invoke;
  v11[3] = &unk_34FF18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[ControlManager respondToCacheDelete:targetingPurgeAmount:cacheDeleteResults:withUrgency:forVolume:then:]( self,  "respondToCacheDelete:targetingPurgeAmount:cacheDeleteResults:withUrgency:forVolume:then:",  1LL,  0LL,  v8,  0LL,  0LL,  v11);
}

BOOL __43__ControlManager_handleGarbageCollect_and___block_invoke(uint64_t a1)
{
  return sendClientResponse(*(void **)(a1 + 32), *(void **)(a1 + 40), 0LL);
}

- (void)overrideGCValue:(id)a3 using:(id)a4 and:(id)a5 clientName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __55__ControlManager_overrideGCValue_using_and_clientName___block_invoke;
  v19[3] = &unk_34E358;
  id v20 = v13;
  id v21 = v10;
  id v22 = v12;
  id v23 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(assetQueue, v19);
}

void __55__ControlManager_overrideGCValue_using_and_clientName___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (!*(void *)(a1 + 40))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager overrideGCValue:using:and:clientName:]_block_invoke",  @"overrideGCValue failed due to nil asset type",  v14,  v15,  v16,  v17,  v51);
    goto LABEL_19;
  }

  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 48), "AssetId");
  if (!string
    || (id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) == 0LL)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager overrideGCValue:using:and:clientName:]_block_invoke",  @"overrideGCValue for: %@ failed due to nil asset id",  v19,  v20,  v21,  v22,  *(void *)(a1 + 32));
LABEL_19:
    int64_t v45 = 2LL;
    goto LABEL_20;
  }

  uint64_t v24 = v23;
  if (!isWellFormedAssetId(v23))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager overrideGCValue:using:and:clientName:]_block_invoke",  @"overrideGCValue for: %@ failed due to asset id not being well formed",  v25,  v26,  v27,  v28,  *(void *)(a1 + 32));
LABEL_18:

    goto LABEL_19;
  }

  uint64_t v29 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 48), "Purpose");
  __int128 v30 = normalizePurposeFromUtf8((uint64_t)v29);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (!isWellFormedPurpose(v31))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager overrideGCValue:using:and:clientName:]_block_invoke",  @"overrideGCValue for: %@ cannot proceed with purpose that isn't well formed",  v32,  v33,  v34,  v35,  *(void *)(a1 + 32));
LABEL_17:

    goto LABEL_18;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 48), "GCOverrideDays");
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  id PathToAssetWithPurpose = getPathToAssetWithPurpose(v38, *(void **)(a1 + 40), v24, v31);
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(PathToAssetWithPurpose);

  if (!v40)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager overrideGCValue:using:and:clientName:]_block_invoke",  @"overrideGCValue for: %@ could not determine path to asset, skipping",  v41,  v42,  v43,  v44,  *(void *)(a1 + 32));
    goto LABEL_17;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager overrideGCValue:using:and:clientName:]_block_invoke",  @"overrideGCValue for: %@ path:%@, days:%lld",  v41,  v42,  v43,  v44,  *(void *)(a1 + 32));
  else {
    int64_t v45 = 2LL;
  }

LABEL_20:
  sendClientResponse(*(void **)(a1 + 56), *(void **)(a1 + 48), v45);
  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager overrideGCValue:using:and:clientName:]_block_invoke",  @"[CONTROL_MANAGER_ASSET_QUEUE] {overrideGCValue} ...overriding garbage-collection value",  v46,  v47,  v48,  v49,  a9);
}

- (void)dumpClientUsage:(id)a3 using:(id)a4 and:(id)a5 clientName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __55__ControlManager_dumpClientUsage_using_and_clientName___block_invoke;
  v19[3] = &unk_34E358;
  id v20 = v13;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  id v18 = v13;
  dispatch_async(assetQueue, v19);
}

BOOL __55__ControlManager_dumpClientUsage_using_and_clientName___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 40), "AssetId");
  unint64_t v42 = 0xBFF0000000000000LL;
  if (!*(void *)(a1 + 48))
  {
    uint64_t v33 = @"dumpClientUsage failed due to nil asset type";
LABEL_9:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager dumpClientUsage:using:and:clientName:]_block_invoke",  v33,  v10,  v11,  v12,  v13,  v41);
LABEL_10:
    double ExistingClientUsage = 0.0;
    int64_t v32 = 2LL;
    goto LABEL_11;
  }

  if (!string
    || (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) == 0LL)
  {
    uint64_t v33 = @"Dump client usage failed due to nil asset id";
    goto LABEL_9;
  }

  id v15 = v14;
  if (!isWellFormedAssetId(v14))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager dumpClientUsage:using:and:clientName:]_block_invoke",  @"Dump client usage failed due to malformed asset id",  v16,  v17,  v18,  v19,  v41);
LABEL_14:

    goto LABEL_10;
  }

  id v20 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 40), "Purpose");
  id v21 = normalizePurposeFromUtf8((uint64_t)v20);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (!isWellFormedPurpose(v22))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager dumpClientUsage:using:and:clientName:]_block_invoke",  @"Dump client usage failed due to malformed purpose",  v23,  v24,  v25,  v26,  v41);

    goto LABEL_14;
  }

  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  id PathToAssetWithPurpose = getPathToAssetWithPurpose(v28, *(void **)(a1 + 48), v15, v22);
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(PathToAssetWithPurpose);

  double ExistingClientUsage = getExistingClientUsage(v30, (double *)&v42);
  int64_t v32 = 0LL;
LABEL_11:
  id v34 = epochToDate(ExistingClientUsage);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager dumpClientUsage:using:and:clientName:]_block_invoke",  @"Usage is: %@, Override is: %f",  v36,  v37,  v38,  v39,  (uint64_t)v35);

  return sendClientResponse(*(void **)(a1 + 56), *(void **)(a1 + 40), v32);
}

- (void)handleUpdateClientUsage:(id)a3 using:(id)a4 and:(id)a5 clientName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __63__ControlManager_handleUpdateClientUsage_using_and_clientName___block_invoke;
  v19[3] = &unk_34E358;
  id v20 = v12;
  id v21 = v10;
  id v22 = v13;
  id v23 = v11;
  id v15 = v11;
  id v16 = v13;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(assetQueue, v19);
}

void __63__ControlManager_handleUpdateClientUsage_using_and_clientName___block_invoke(uint64_t a1)
{
  xpc_object_t xdict = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (!*(void *)(a1 + 40))
  {
    uint64_t v66 = *(void *)(a1 + 48);
    id v17 = @"%@ Update client usage failed due to nil asset type";
    goto LABEL_9;
  }

  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "AssetId");
  if (!string
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) == 0LL)
  {
    id v17 = @"Update client usage failed due to nil asset id";
LABEL_9:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  v17,  v2,  v3,  v4,  v5,  v66);
    id v18 = 0LL;
    uint64_t v8 = 0LL;
LABEL_10:
    uint64_t v19 = 0LL;
LABEL_11:
    id v20 = 0LL;
LABEL_12:
    int64_t v21 = 2LL;
    goto LABEL_13;
  }

  uint64_t v8 = v7;
  if (!isWellFormedAssetId(v7))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  @"Update client usage failed due to asset id not being well formed",  v9,  v10,  v11,  v12,  v66);
    id v18 = 0LL;
    goto LABEL_10;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "assetState");
  uint64_t v14 = uint64;
  unint64_t v15 = uint64 - 5;
  if (uint64 == 5)
  {
    id v16 = @"/System/Library/PreinstalledAssetsV2/RequiredByOs";
LABEL_18:
    id RepositoryPath = getRepositoryPath(v16);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(RepositoryPath);
    goto LABEL_20;
  }

  if (uint64 == 6)
  {
    id v16 = @"/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs";
    goto LABEL_18;
  }

  uint64_t v27 = repositoryPath(*(void **)(a1 + 40));
  uint64_t v26 = objc_claimAutoreleasedReturnValue(v27);
LABEL_20:
  id v18 = (void *)v26;
  uint64_t v28 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "Purpose");
  uint64_t v29 = normalizePurposeFromUtf8((uint64_t)v28);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v29);
  if (!isWellFormedPurpose(v19))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  @"Update client usage failed due to purpose not being well formed",  v30,  v31,  v32,  v33,  v66);
    goto LABEL_11;
  }

  if (v15 <= 1)
  {

    uint64_t v19 = 0LL;
  }

  id PathToAssetWithPurpose = getPathToAssetWithPurpose(v18, *(void **)(a1 + 40), v8, v19);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(PathToAssetWithPurpose);
  id v20 = v35;
  if (!v35)
  {
    uint64_t v48 = @"Update client usage, could not determine path to asset, skipping";
LABEL_41:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  v48,  v36,  v37,  v38,  v39,  v66);
    goto LABEL_12;
  }

  if (v14 == 5) {
    goto LABEL_28;
  }
  double ExistingClientUsage = getExistingClientUsage(v35, 0LL);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v41 timeIntervalSince1970];
  double v43 = v42;

  if (ExistingClientUsage > 0.0 && v43 - ExistingClientUsage < 86400.0)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  @"%@ asset %@ %@ has been used in past 24 hours '%@': %f",  v44,  v45,  v46,  v47,  *(void *)(a1 + 48));
LABEL_28:
    int64_t v21 = 0LL;
    goto LABEL_35;
  }

  if ((updateClientUsageDate(v20) & 1) != 0)
  {
    int64_t v21 = 0LL;
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  @"%@ asset %@ %@ unable to update client usage '%@'",  v49,  v50,  v51,  v52,  *(void *)(a1 + 48));
    int64_t v21 = 2LL;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  @"%@ client Usage type: %@ id:%@, path: '%@' original: %f new: %f result: %ld",  v49,  v50,  v51,  v52,  *(void *)(a1 + 48));
LABEL_35:
  if (xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "localAssetPath"))
  {
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v20 URLByAppendingPathComponent:@"AssetData"]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v53 path]);

    if (v24)
    {
      if (xdict)
      {
        id v23 = v24;
        xpc_dictionary_set_string(xdict, "localAssetPath", (const char *)[v23 UTF8String]);
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned int v55 = [v54 fileExistsAtPath:v23];

        if (v55)
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  @"%@ client Usage type: %@ id:%@, parent path: '%@' AssetData exists",  v56,  v57,  v58,  v59,  *(void *)(a1 + 48));
          int64_t v60 = 1LL;
        }

        else
        {
          int64_t v60 = -1LL;
        }

        xpc_dictionary_set_int64(xdict, "assetDataExistsPosNeg", v60);
        id v22 = xdict;
        goto LABEL_14;
      }

      double v61 = stringForMAXpcCommand(0x15u);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(v61);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager handleUpdateClientUsage:using:and:clientName:]_block_invoke",  @"Client didn't send'update client usage with a reply context, but requested an asset path? (%lld %@: %s = %s)",  v62,  v63,  v64,  v65,  21LL);

LABEL_43:
      sendClientResponse(*(void **)(a1 + 56), *(void **)(a1 + 32), v21);
      id v23 = v24;
      goto LABEL_44;
    }

    uint64_t v66 = *(void *)(a1 + 48);
    uint64_t v48 = @"%@ client Usage type: %@ id:%@, parent path: '%@' unable to get AssetData subdirectory";
    goto LABEL_41;
  }

- (void)handleMigrateAssetsRequest:(id)a3 using:(id)a4 and:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  assetQueue = (dispatch_queue_s *)self->_assetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __55__ControlManager_handleMigrateAssetsRequest_using_and___block_invoke;
  block[3] = &unk_34DB70;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(assetQueue, block);
}

void __55__ControlManager_handleMigrateAssetsRequest_using_and___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (!*(void *)(a1 + 32))
  {
    uint64_t v32 = @"Migration failed due to nil asset type";
LABEL_8:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleMigrateAssetsRequest:using:and:]_block_invoke",  v32,  v9,  v10,  v11,  v12,  v70);
LABEL_9:
    id v31 = 0LL;
LABEL_10:
    uint64_t v33 = 0LL;
    id v34 = 0LL;
    uint64_t v35 = 0LL;
    int64_t v36 = 2LL;
    goto LABEL_11;
  }

  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (!v77)
  {
    uint64_t v32 = @"Migration failed due to nil file manager";
    goto LABEL_8;
  }

  id v16 = normalizedAssetType(*(void *)(a1 + 32), v13, v14, v15, v9, v10, v11, v12);
  uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
  if (!v17)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleMigrateAssetsRequest:using:and:]_block_invoke",  @"Migration failed due to nil normalizedAssetTypeStr",  v18,  v19,  v20,  v21,  v70);

    goto LABEL_9;
  }

  id v22 = (void *)v17;
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/Assets");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingPathComponent:v22]);

  uint64_t v26 = repositoryPath(*(void **)(a1 + 32));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v22]);

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v30 = [v29 fileExistsAtPath:v28];

  if ((v30 & 1) != 0)
  {
    id v31 = 0LL;
    goto LABEL_14;
  }

  ensureAssetDirectory(v28, 0);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v83 = 0LL;
  unsigned __int8 v42 = [v41 createDirectoryAtPath:v28 withIntermediateDirectories:1 attributes:0 error:&v83];
  id v31 = v83;

  if ((v42 & 1) == 0)
  {
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v31 description]);
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleMigrateAssetsRequest:using:and:]_block_invoke",  @"Could not create target directory: %@",  v65,  v66,  v67,  v68,  (uint64_t)v64);

    goto LABEL_10;
  }

- (void)handleReportingRequest:(id)a3 message:(id)a4 clientName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  analyticsQueue = (dispatch_queue_s *)self->_analyticsQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __60__ControlManager_handleReportingRequest_message_clientName___block_invoke;
  v15[3] = &unk_34E358;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v10;
  id v19 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(analyticsQueue, v15);
}

void __60__ControlManager_handleReportingRequest_message_clientName___block_invoke(uint64_t a1)
{
  int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "reportingChange");
  BOOL v3 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "reportingSend");
  BOOL v4 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "reportingClear");
  uint64_t v17 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  if (int64)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) analytics]);
    id v10 = [v9 reportingLevel];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) analytics]);
    [v11 changeReportingLevel:int64];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) analytics]);
    id v13 = [v12 reportingLevel];

    -[NSMutableString appendFormat:](v17, "appendFormat:", @" change: %lld", int64);
    if (v10 == v13)
    {
    }

    else
    {
      -[NSMutableString appendFormat:](v17, "appendFormat:", @" (level: %lld -> %lld)", v10, v13);
    }
  }

  if (v3)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) analytics]);
    [v14 submitAllEvents];

    -[NSMutableString appendFormat:](v17, "appendFormat:", @"  send: YES");
  }

  if (v4)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) analytics]);
    [v15 removeAllEvents];

    -[NSMutableString appendFormat:](v17, "appendFormat:", @"  clear: YES");
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleReportingRequest:message:clientName:]_block_invoke",  @"client: %@ requested reporting %@",  v5,  v6,  v7,  v8,  *(void *)(a1 + 48));
  sendClientResponse(*(void **)(a1 + 56), *(void **)(a1 + 32), 0LL);
}

- (void)handleClientCommand:(id)a3
{
  id v4 = a3;
  switch([v4 command])
  {
    case 1u:
      goto LABEL_35;
    case 2u:
      -[ControlManager handleCommandDownloadMetadata:](self, "handleCommandDownloadMetadata:", v4);
      break;
    case 3u:
      -[ControlManager handleCommandDownloadAsset:](self, "handleCommandDownloadAsset:", v4);
      break;
    case 4u:
      -[ControlManager handleCommandNSURLStateDump:](self, "handleCommandNSURLStateDump:", v4);
      break;
    case 5u:
      -[ControlManager handleCommandPurgeAsset:](self, "handleCommandPurgeAsset:", v4);
      break;
    case 6u:
      -[ControlManager handleCommandCancelDownload:](self, "handleCommandCancelDownload:", v4);
      break;
    case 7u:
      -[ControlManager handleCommandGetSandboxExtension:](self, "handleCommandGetSandboxExtension:", v4);
      break;
    case 8u:
      -[ControlManager handleCommandRefreshAssetState:](self, "handleCommandRefreshAssetState:", v4);
      break;
    case 9u:
      -[ControlManager handleCommandSetPallasURL:](self, "handleCommandSetPallasURL:", v4);
      break;
    case 0xAu:
      -[ControlManager handleCommandSetPallasAudience:](self, "handleCommandSetPallasAudience:", v4);
      break;
    case 0xDu:
      -[ControlManager handleCommandServerURLOverride:](self, "handleCommandServerURLOverride:", v4);
      break;
    case 0xEu:
      -[ControlManager handleCommandRepairState:](self, "handleCommandRepairState:", v4);
      break;
    case 0xFu:
      -[ControlManager handleCommandMigrateAssets:](self, "handleCommandMigrateAssets:", v4);
      break;
    case 0x10u:
      -[ControlManager handleCommandCleanV1Assets:](self, "handleCommandCleanV1Assets:", v4);
      break;
    case 0x11u:
      -[ControlManager handleCommandSpaceCheck:](self, "handleCommandSpaceCheck:", v4);
      break;
    case 0x12u:
      -[ControlManager handleCommandQuerInstalledIDs:](self, "handleCommandQuerInstalledIDs:", v4);
      break;
    case 0x13u:
      -[ControlManager handleCommandConfigDownload:](self, "handleCommandConfigDownload:", v4);
      break;
    case 0x14u:
      -[ControlManager handleCommandGetPallasAudience:](self, "handleCommandGetPallasAudience:", v4);
      break;
    case 0x15u:
      -[ControlManager handleCommandUpdateClientUsage:](self, "handleCommandUpdateClientUsage:", v4);
      break;
    case 0x16u:
      -[ControlManager handleCommandDumpClidentUsage:](self, "handleCommandDumpClidentUsage:", v4);
      break;
    case 0x17u:
      -[ControlManager handleCommandGarbageCollect:](self, "handleCommandGarbageCollect:", v4);
      break;
    case 0x18u:
      -[ControlManager handleCommandPurgeAll:](self, "handleCommandPurgeAll:", v4);
      break;
    case 0x19u:
      -[ControlManager handleCommandOverrideGC:](self, "handleCommandOverrideGC:", v4);
      break;
    case 0x1Au:
      -[ControlManager handleCommandPurgeCatalogs:](self, "handleCommandPurgeCatalogs:", v4);
      break;
    case 0x1Bu:
      -[ControlManager handleCommandLoadAssetByID:](self, "handleCommandLoadAssetByID:", v4);
      break;
    case 0x1Cu:
      -[ControlManager handleCommandCancelCatalogDownload:](self, "handleCommandCancelCatalogDownload:", v4);
      break;
    case 0x1Du:
      -[ControlManager handleCommandCancelPMVDownload:](self, "handleCommandCancelPMVDownload:", v4);
      break;
    case 0x1Eu:
      -[ControlManager handleCommandDownloadPMV:](self, "handleCommandDownloadPMV:", v4);
      break;
    case 0x1Fu:
      -[ControlManager handleCommandQueryPMV:](self, "handleCommandQueryPMV:", v4);
      break;
    case 0x20u:
      -[ControlManager handleCommandGetPallasEnabled:](self, "handleCommandGetPallasEnabled:", v4);
      break;
    case 0x21u:
      -[ControlManager handleCommandSetPallasEnabled:](self, "handleCommandSetPallasEnabled:", v4);
      break;
    case 0x2Cu:
      -[ControlManager handleCommandGetPallasURL:](self, "handleCommandGetPallasURL:", v4);
      break;
    case 0x2Eu:
      -[ControlManager handleCommandSetPreferences:](self, "handleCommandSetPreferences:", v4);
LABEL_35:
      -[ControlManager handleCommandQueryAssetType:](self, "handleCommandQueryAssetType:", v4);
      break;
    default:
      +[MADActivityManager sendReply:withOperationResult:]( &OBJC_CLASS___MADActivityManager,  "sendReply:withOperationResult:",  v4,  5LL);
      break;
  }
}

- (void)handleClientConnection:(id)a3 usingDispatchQueue:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __60__ControlManager_handleClientConnection_usingDispatchQueue___block_invoke;
  v9[3] = &unk_34FF40;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = self;
  xpc_connection_set_event_handler((xpc_connection_t)v8, v9);
  if (v7) {
    xpc_connection_set_target_queue((xpc_connection_t)v8, v7);
  }
  xpc_connection_activate((xpc_connection_t)v8);
}

void __60__ControlManager_handleClientConnection_usingDispatchQueue___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t object = a2;
  BOOL v3 = objc_autoreleasePoolPush();
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v5 = +[MADActivityManager newTrackingCommandForEvent:forClient:]( &OBJC_CLASS___MADActivityManager,  "newTrackingCommandForEvent:forClient:",  object,  *(void *)(a1 + 32));
    id v6 = v5;
    if (v5)
    {
      if ([v5 validTracker])
      {
        [v6 assignOwner:1];
      }
    }
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      +[MADActivityManager connectionInvalidForClient:]( &OBJC_CLASS___MADActivityManager,  "connectionInvalidForClient:",  *(void *)(a1 + 32));
    }

    else if (object == &_xpc_error_termination_imminent)
    {
      +[MADActivityManager terminationIminentForClient:]( &OBJC_CLASS___MADActivityManager,  "terminationIminentForClient:",  *(void *)(a1 + 32));
    }

    else if (object == &_xpc_error_connection_interrupted)
    {
      +[MADActivityManager connectionInterruptedForClient:]( &OBJC_CLASS___MADActivityManager,  "connectionInterruptedForClient:",  *(void *)(a1 + 32));
    }

    else
    {
      +[MADActivityManager unknownXPCError:forClient:](&OBJC_CLASS___MADActivityManager, "unknownXPCError:forClient:");
    }
  }

  else
  {
    +[MADActivityManager unknownXPCType:forClient:]( &OBJC_CLASS___MADActivityManager,  "unknownXPCType:forClient:",  type,  *(void *)(a1 + 32));
  }

  objc_autoreleasePoolPop(v3);
}

void __44__ControlManager_handleClientConnection_on___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 count];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke_2",  @"the number of tasks is %lu",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 taskDescription]);
        [v14 state];
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke_2",  @"The task descriptor is: %@, %ld",  v16,  v17,  v18,  v19,  (uint64_t)v15);

        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
          [v14 cancel];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v11);
  }

  sendClientResponse(*(void **)(a1 + 32), *(void **)(a1 + 40), 0LL);
}

void __44__ControlManager_handleClientConnection_on___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  id v10 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) checkAndInitiateDownloadForAssetType:*(void *)(a1 + 40) message:*(void *)(a1 + 48) forClientName:*(void *)(a1 + 56) usingConnection:*(void *)(a1 + 64) requiringClientExtractor:*(unsigned __int8 *)(a1 + 72)];
  objc_autoreleasePoolPop(v10);
  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager handleClientConnection:on:]_block_invoke_3",  @"[CONTROL_MANAGER_ASSET_QUEUE] {handleClientConnection:downloadBlock} ...checkAndInitiateDownloadForAssetType",  v11,  v12,  v13,  v14,  a9);
}

- (BOOL)associateFieldsFromRequest:(id)a3 withCommandTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = xpcRequestFieldsRequired([v7 command]);
  uint64_t v9 = xpcRequestFieldsOptional([v7 command]);
  if ((v8 & 1) != 0)
  {
    uint64_t v14 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[ControlManager getStringFromXpcMessage:forKey:]( &OBJC_CLASS___ControlManager,  "getStringFromXpcMessage:forKey:",  v6,  "clientName"));
    if (v11)
    {
      if ((v8 & 0x800) != 0)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[ControlManager getStringFromXpcMessage:forKey:]( &OBJC_CLASS___ControlManager,  "getStringFromXpcMessage:forKey:",  v6,  "messageAction"));
        if (v12)
        {
          id v10 = -[MADActivityCommandRequest initForClient:requestingAction:]( objc_alloc(&OBJC_CLASS___MADActivityCommandRequest),  "initForClient:requestingAction:",  v11,  v12);
          if (v10)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[ControlManager getStringFromXpcMessage:forKey:]( &OBJC_CLASS___ControlManager,  "getStringFromXpcMessage:forKey:",  v6,  "connectionIdentifier"));
            if (v15) {
              [v10 associateConnectionIdentifier:v15];
            }

            uint64_t v16 = objc_claimAutoreleasedReturnValue( -[ControlManager associateRequiredFields:fromRequest:toCommandRequest:forCommandTracker:]( self,  "associateRequiredFields:fromRequest:toCommandRequest:forCommandTracker:",  v8,  v6,  v10,  v7));
            if (!v16)
            {
              uint64_t v16 = objc_claimAutoreleasedReturnValue( -[ControlManager associateOptionalFields:fromRequest:toCommandRequest:forCommandTracker:]( self,  "associateOptionalFields:fromRequest:toCommandRequest:forCommandTracker:",  v14,  v6,  v10,  v7));
              if (!v16)
              {
                [v7 associateCommandRequest:v10];
                +[MADActivityManager noticeForActivity:reason:]( &OBJC_CLASS___MADActivityManager,  "noticeForActivity:reason:",  v7,  @"validated client request");
                BOOL v19 = 1;
                goto LABEL_17;
              }
            }

            uint64_t v13 = (__CFString *)v16;
          }

          else
          {
            uint64_t v13 = @"Unable to allocate CommandRequest";
          }
        }

        else
        {
          id v10 = 0LL;
          uint64_t v13 = @"Could not determine action (i.e. command name)";
        }
      }

      else
      {
        id v10 = 0LL;
        uint64_t v12 = 0LL;
        uint64_t v13 = @"Action (i.e. command name) should always be required";
      }
    }

    else
    {
      id v10 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v13 = @"Could not determine client name";
    }
  }

  else
  {
    id v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = @"Client name should always be required";
  }

  uint64_t v17 = stringForMAOperationResult(5uLL);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v7 failureResult:5 ofResultName:v18 forReason:v13];

  +[MADActivityManager sendReply:withOperationResult:]( &OBJC_CLASS___MADActivityManager,  "sendReply:withOperationResult:",  v7,  5LL);
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)associateRequiredFields:(int64_t)a3 fromRequest:(id)a4 toCommandRequest:(id)a5 forCommandTracker:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = 0LL;
  size_t length = 0LL;
  if ((a3 & 0x100) != 0)
  {
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[ControlManager getStringFromXpcMessage:forKey:]( &OBJC_CLASS___ControlManager,  "getStringFromXpcMessage:forKey:",  v10,  "AssetType"));
    if (v13)
    {
      if (-[ControlManager commandRequiresForcedSoftwareUpdateType:]( self,  "commandRequiresForcedSoftwareUpdateType:",  v12)
        && (-[__CFString isEqualToString:]( v13,  "isEqualToString:",  @"com.apple.MobileAsset.SoftwareUpdate") & 1) == 0)
      {
        uint64_t v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"provided asset type %@ when %@ was required - replaced",  v13,  @"com.apple.MobileAsset.SoftwareUpdate");
        +[MADActivityManager warningForActivity:fromMethod:leaderNote:warning:]( &OBJC_CLASS___MADActivityManager,  "warningForActivity:fromMethod:leaderNote:warning:",  v12,  @"associateRequiredFields",  @"forcedSUAssetType",  v15);

        uint64_t v13 = @"com.apple.MobileAsset.SoftwareUpdate";
      }

      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[ControlManager checkEntitlement:forAssetType:](self, "checkEntitlement:forAssetType:", v12, v13));
      if (v16)
      {
        uint64_t v17 = (__CFString *)v16;
        goto LABEL_21;
      }

      [v11 associateAssetType:v13];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
      [v12 extendLogLeader:@"AssetType" withValue:v26];
    }

    else
    {
      uint64_t v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Client request missing key:%@",  @"AssetType");
      uint64_t v14 = 0LL;
      if (v17) {
        goto LABEL_182;
      }
    }
  }

  if ((a3 & 0x2000000) != 0)
  {
    id v18 = extractorDecodeClasses();
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v141 = 0LL;
    id ObjectFromMessageWithFailureReason = getObjectFromMessageWithFailureReason( v10,  "purgeAssetTypeListLength",  "purgeAssetTypeList",  v19,  &v141);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(ObjectFromMessageWithFailureReason);
    uint64_t v17 = (__CFString *)v141;

    if (v21)
    {
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
      {
        if (!v13)
        {
          __int128 v23 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[ControlManager checkEntitlement:forAssetTypes:]( self,  "checkEntitlement:forAssetTypes:",  v12,  v21));

          if (!v23)
          {
            [v11 associateAssetTypesList:v21];
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v11 assetTypesList]);
            id v47 = stringWithoutNewlines((uint64_t)v46);
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
            [v12 extendLogLeader:@"purgeAssetTypeList" withValue:v48];

            goto LABEL_3;
          }

- (id)associateOptionalFields:(int64_t)a3 fromRequest:(id)a4 toCommandRequest:(id)a5 forCommandTracker:(id)a6
{
  int v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((v8 & 0x200) != 0)
  {
    string = xpc_dictionary_get_string(v10, "Purpose");
    uint64_t v16 = normalizePurposeFromUtf8((uint64_t)string);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (isWellFormedPurpose(v14))
    {
      if (v14)
      {
        [v11 associatePurpose:v14];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 purpose]);
        [v12 extendLogLeader:@"Purpose" withValue:v17];
      }

      uint64_t v13 = 0LL;
      if ((v8 & 2) == 0) {
        goto LABEL_14;
      }
    }

    else
    {
      uint64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Client request with %@:%@ (which is not well formed)",  @"Purpose",  v14);
      if ((v8 & 2) == 0) {
        goto LABEL_14;
      }
    }
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    if ((v8 & 2) == 0) {
      goto LABEL_14;
    }
  }

  if (!v13)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[ControlManager getStringFromXpcMessage:forKey:]( &OBJC_CLASS___ControlManager,  "getStringFromXpcMessage:forKey:",  v10,  "BaseUrlKey"));

    if (v18)
    {
      [v11 associateBaseUrl:v18];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v11 baseUrl]);
      [v12 extendLogLeader:@"BaseUrlKey" withValue:v19];

      uint64_t v14 = (void *)v18;
      if ((v8 & 0x80000) != 0) {
        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
      if ((v8 & 0x80000) != 0) {
        goto LABEL_18;
      }
    }

- (void)setServerConnectionHandler:(id)a3 with:(id)a4 and:(id)a5
{
  id v8 = a4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __54__ControlManager_setServerConnectionHandler_with_and___block_invoke;
  handler[3] = &unk_34FFB8;
  handler[4] = self;
  id v14 = a5;
  id v15 = v8;
  id v9 = v8;
  id v10 = v14;
  id v11 = (_xpc_connection_s *)a3;
  xpc_connection_set_event_handler(v11, handler);
  id v12 = objc_opt_new(&OBJC_CLASS___NSDictionary);
  xpc_connection_set_context(v11, v12);
}

- (int64_t)updateLastFetchedDate:(id)a3 assetType:(id)a4 withPurpose:(id)a5 with:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = ensureRepositoryPath(v12);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = assembleXmlPathWithPurpose((uint64_t)v12, v13, v15, v11);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
  metaDataQueue = (dispatch_queue_s *)self->_metaDataQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = __67__ControlManager_updateLastFetchedDate_assetType_withPurpose_with___block_invoke;
  v23[3] = &unk_34DB98;
  id v24 = v18;
  id v25 = v10;
  id v20 = v10;
  id v21 = v18;
  dispatch_async(metaDataQueue, v23);

  return 31LL;
}

void __67__ControlManager_updateLastFetchedDate_assetType_withPurpose_with___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v3 = [v2 fileExistsAtPath:*(void *)(a1 + 32)];

  if (v3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  *(void *)(a1 + 32)));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v8 setObject:v9 forKey:@"lastTimeChecked"];

    if ((safeAtomicWriteToPath(v8, *(void **)(a1 + 32)) & 1) == 0) {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager updateLastFetchedDate:assetType:withPurpose:with:]_block_invoke",  @"{updateLastFetchedDate} failed to update lastFetchedDate in xml | targetLocation:%@",  v10,  v11,  v12,  v13,  *(void *)(a1 + 32));
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager updateLastFetchedDate:assetType:withPurpose:with:]_block_invoke",  @"Attempting to update lastFetchedDate with no xml present",  v4,  v5,  v6,  v7,  v15);
  }

  id DownloadManager = getDownloadManager();
  id v16 = (id)objc_claimAutoreleasedReturnValue(DownloadManager);
  [v16 taskFinishedUpdateState:*(void *)(a1 + 40) with:14];
}

- (void)writeDictionaryToFile:(id)a3 to:(id)a4 with:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  metaDataQueue = (dispatch_queue_s *)self->_metaDataQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __48__ControlManager_writeDictionaryToFile_to_with___block_invoke;
  block[3] = &unk_34DB70;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(metaDataQueue, block);
}

void __48__ControlManager_writeDictionaryToFile_to_with___block_invoke(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a1[4] stringByAppendingString:@".purged"]);
  uint64_t v4 = disassembleTaskDescriptor(a1[5]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"normalizedAssetType"]);
  id v7 = assetTypeFromNormalized(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (isWellFormedAssetType(v8))
  {
    if ([v2 fileExistsAtPath:v3])
    {
      id v53 = 0LL;
      unsigned __int8 v13 = [v2 removeItemAtPath:v3 error:&v53];
      id v14 = v53;
      id v15 = v14;
      if ((v13 & 1) == 0)
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v14 checkedSummary]);
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager writeDictionaryToFile:to:with:]_block_invoke",  @"{writeDictionaryToFile} could not remove prior archive file (will continue) | archivePath:%@ | error:%@\n%@",  v16,  v17,  v18,  v19,  (uint64_t)v3);

        unsigned int v3 = 0LL;
      }
    }

    else
    {
      id v15 = 0LL;
    }

    if (v3)
    {
      id v21 = a1[4];
      id v52 = 0LL;
      unsigned int v22 = [v2 moveItemAtPath:v21 toPath:v3 error:&v52];
      id v15 = v52;
      if (v22)
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager writeDictionaryToFile:to:with:]_block_invoke",  @"{writeDictionaryToFile} moved existing file | targetLocation:%@ to archivePath:%@",  v23,  v24,  v25,  v26,  (uint64_t)a1[4]);
        goto LABEL_14;
      }
    }

    else
    {
      id v15 = 0LL;
    }

    id v27 = a1[4];
    id v51 = 0LL;
    unsigned __int8 v28 = [v2 removeItemAtPath:v27 error:&v51];
    id v29 = v51;
    id v15 = v29;
    uint64_t v34 = (uint64_t)a1[4];
    if ((v28 & 1) == 0)
    {
      id v50 = (void *)objc_claimAutoreleasedReturnValue([v29 checkedSummary]);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager writeDictionaryToFile:to:with:]_block_invoke",  @"{writeDictionaryToFile} could not remove file | targetLocation:%@ | error:%@\n%@",  v44,  v45,  v46,  v47,  v34);

      goto LABEL_18;
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager writeDictionaryToFile:to:with:]_block_invoke",  @"{writeDictionaryToFile} removed existing file | targetLocation:%@",  v30,  v31,  v32,  v33,  (uint64_t)a1[4]);
LABEL_14:
    if ((safeAtomicWriteToPath(a1[6], a1[4]) & 1) != 0)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager writeDictionaryToFile:to:with:]_block_invoke",  @"{writeDictionaryToFile} succeeded | taskDescriptor:%@",  v35,  v36,  v37,  v38,  (uint64_t)a1[5]);
      id DownloadManager = getDownloadManager();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
      uint64_t v41 = v40;
      id v42 = a1[5];
      uint64_t v43 = 0LL;
LABEL_19:
      [v40 taskFinishedUpdateState:v42 with:v43];

      goto LABEL_20;
    }

    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager writeDictionaryToFile:to:with:]_block_invoke",  @"{writeDictionaryToFile} failed to write XML | targetLocation:%@",  v35,  v36,  v37,  v38,  (uint64_t)a1[4]);
LABEL_18:
    id v48 = getDownloadManager();
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v48);
    uint64_t v41 = v40;
    id v42 = a1[5];
    uint64_t v43 = 7LL;
    goto LABEL_19;
  }

  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ControlManager writeDictionaryToFile:to:with:]_block_invoke",  @"{writeDictionaryToFile} Failed to write dictionary to file, asset type was not well formed: %@",  v9,  v10,  v11,  v12,  (uint64_t)v8);
  id v20 = getDownloadManager();
  id v15 = (id)objc_claimAutoreleasedReturnValue(v20);
  [v15 taskFinishedUpdateState:a1[5] with:7];
LABEL_20:
}

- (void)writeJsonDictionaryToFile:(id)a3 to:(id)a4 with:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  metaDataQueue = (dispatch_queue_s *)self->_metaDataQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __52__ControlManager_writeJsonDictionaryToFile_to_with___block_invoke;
  block[3] = &unk_34DB70;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(metaDataQueue, block);
}

void __52__ControlManager_writeJsonDictionaryToFile_to_with___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingString:@".old.purged"]);
  if ([v2 fileExistsAtPath:v3])
  {
    id v70 = 0LL;
    unsigned int v4 = [v2 removeItemAtPath:v3 error:&v70];
    id v9 = v70;
    if (!v4)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager writeJsonDictionaryToFile:to:with:]_block_invoke",  @"writeJsonDictionaryToFile %@ could not remove prior archive file: %@ (will continue) error: %@",  v5,  v6,  v7,  v8,  *(void *)(a1 + 40));

      unsigned int v3 = 0LL;
      goto LABEL_11;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  if (v3)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id v69 = v9;
    unsigned int v15 = [v2 moveItemAtPath:v14 toPath:v3 error:&v69];
    id v16 = v69;

    if (v15)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager writeJsonDictionaryToFile:to:with:]_block_invoke",  @"writeJsonDictionaryToFile %@ moved existing file: %@ to: %@",  v10,  v11,  v12,  v13,  *(void *)(a1 + 40));
      id v9 = v16;
      goto LABEL_13;
    }

    id v9 = v16;
  }

- (void)moveAssetIntoRepo:(id)a3 forType:(id)a4 forAsset:(id)a5 cleanUp:(id)a6 with:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v48 = a5;
  id v49 = a6;
  id v14 = a7;
  v58[0] = 0;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
  [v15 fileExistsAtPath:v16 isDirectory:v58];

  if (v58[0])
  {
    AssetDirectoryName = getAssetDirectoryName((uint64_t)v48);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(AssetDirectoryName);
    id v23 = assetTypeFromNormalized(v13);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    unsigned __int8 v25 = disassembleTaskDescriptor(v14);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:@"Purpose"]);
    uint64_t v27 = repositoryPath(v24);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = ensureTargetDirectory(v28, (uint64_t)v13);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue([v28 stringByAppendingPathComponent:v13]);

    uint64_t v46 = v26;
    if (v30)
    {
      if (v26)
      {
        id v32 = purposeDirectoryName(v26);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        id v34 = ensureTargetDirectory(v31, (uint64_t)v33);
        uint64_t v35 = objc_claimAutoreleasedReturnValue([v30 URLByAppendingPathComponent:v33]);

        uint64_t v30 = (void *)v35;
      }

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v30 URLByAppendingPathComponent:v22]);
    }

    else
    {
      uint64_t v36 = 0LL;
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager moveAssetIntoRepo:forType:forAsset:cleanUp:with:]",  @"Moving asset to target directory: %@",  v39,  v40,  v41,  v42,  (uint64_t)v36);
    assetQueue = (dispatch_queue_s *)self->_assetQueue;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = __66__ControlManager_moveAssetIntoRepo_forType_forAsset_cleanUp_with___block_invoke_2;
    v50[3] = &unk_34EF88;
    id v51 = v12;
    id v52 = v36;
    id v53 = self;
    id v54 = v49;
    id v55 = v14;
    id v44 = v36;
    dispatch_async(assetQueue, v50);
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager moveAssetIntoRepo:forType:forAsset:cleanUp:with:]",  @"Completed download did not result in a directory, skipping",  v17,  v18,  v19,  v20,  v45);
    if (v49)
    {
      uint64_t v37 = (dispatch_queue_s *)self->_assetQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __66__ControlManager_moveAssetIntoRepo_forType_forAsset_cleanUp_with___block_invoke;
      block[3] = &unk_34DBC0;
      id v57 = v49;
      dispatch_async(v37, block);
    }

    id DownloadManager = getDownloadManager();
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    [v22 taskFinishedUpdateState:v14 with:7];
  }
}

void __66__ControlManager_moveAssetIntoRepo_forType_forAsset_cleanUp_with___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  [v14 removeItemAtPath:v15 error:0];

  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager moveAssetIntoRepo:forType:forAsset:cleanUp:with:]_block_invoke",  @"[CONTROL_MANAGER_ASSET_QUEUE] {moveAssetIntoRepo} ...removing path",  v16,  v17,  v18,  v19,  a9);
}

void __66__ControlManager_moveAssetIntoRepo_forType_forAsset_cleanUp_with___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  uint64_t v10 = moveTargetToDirectory(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (!v10)
  {
    if (usingCentralizedCachedelete())
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);
      markAssetPurgeable(v11);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) getSAFRegistrationBundleID:*(void *)(a1 + 40)]);
    [*(id *)(a1 + 48) updateSpaceAttributionForBundleID:v12 assetPath:*(void *)(a1 + 40) doRegistration:1];
  }

  removeItem(*(void **)(a1 + 56));
  updateClientUsageDate(*(void **)(a1 + 40));
  id DownloadManager = getDownloadManager();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
  [v14 taskFinishedUpdateState:*(void *)(a1 + 64) with:v10];

  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ControlManager moveAssetIntoRepo:forType:forAsset:cleanUp:with:]_block_invoke_2",  @"[CONTROL_MANAGER_ASSET_QUEUE] {moveAssetIntoRepo} ...moving to path",  v15,  v16,  v17,  v18,  a9);
}

- (void)handleGetMABrainInfo:(id)a3 message:(id)a4 clientName:(id)a5
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainUpdater sharedInstance](&OBJC_CLASS___MABrainUpdater, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 info]);

  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  uint64_t v10 = reply;
  if (v8) {
    BOOL v11 = reply == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    addObjectToMessage(v8, reply, "MobileAssetBrainInfoLength", "MobileAssetBrainInfo");
    uint64_t v12 = v13;
LABEL_8:
    sendReply(v12, v10, 0LL);
    goto LABEL_9;
  }

  uint64_t v12 = v13;
  if (v10) {
    goto LABEL_8;
  }
  sendClientResponse(v13, v6, 2LL);
LABEL_9:
}

- (void)handleUpdateMABrain:(id)a3 message:(id)a4 clientName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  length[0] = 0LL;
  data = xpc_dictionary_get_data(v8, "MobileAssetBrainUpdateOptionSSO", length);
  uint64_t v12 = 0LL;
  if (data && length[0]) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data));
  }
  string = xpc_dictionary_get_string(v8, "MobileAssetBrainUpdateOptionDAW");
  if (string) {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Bearer %s", string));
  }
  else {
    uint64_t v14 = 0LL;
  }
  BOOL v15 = xpc_dictionary_get_BOOL(v8, "MobileAssetBrainUpdateOptionNonBlocking");
  BOOL v16 = xpc_dictionary_get_BOOL(v8, "MobileAssetBrainUpdateOptionRelaunch");
  BOOL v17 = xpc_dictionary_get_BOOL(v8, "MobileAssetBrainUpdateOptionPurgeOnly");
  BOOL v18 = xpc_dictionary_get_BOOL(v8, "MobileAssetBrainUpdateOptionDiscretionary");
  id v44 = (void *)v12;
  -[__CFString setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, @"ssoToken");
  uint64_t v43 = (void *)v14;
  -[__CFString setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, @"dawHeader");
  -[__CFString setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"nonDiscetionary");
  if (v18) {
    uint64_t v19 = &__kCFBooleanFalse;
  }
  else {
    uint64_t v19 = &__kCFBooleanTrue;
  }
  -[__CFString setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, @"nonDiscetionary");
  if (v15) {
    -[__CFString setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"nonBlocking");
  }
  if (v16) {
    -[__CFString setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"relaunchBrain");
  }
  if (!-[__CFString count](v10, "count"))
  {

    uint64_t v10 = 0LL;
  }

  uint64_t v20 = @"nil";
  if (v10) {
    uint64_t v20 = v10;
  }
  if (v17)
  {
    id v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"client %@ requested purge of downloaded MobileAssetBrain with options:\n%@\nraw message:%@", v9, v20, v8));
    id v22 = [v21 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateMABrain:message:clientName:]",  @"[MAB] %s",  v23,  v24,  v25,  v26,  (uint64_t)v22);

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainUpdater sharedInstance](&OBJC_CLASS___MABrainUpdater, "sharedInstance"));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = __57__ControlManager_handleUpdateMABrain_message_clientName___block_invoke;
    v49[3] = &unk_34FFE0;
    uint64_t v28 = &v50;
    id v29 = &v51;
    id v50 = v9;
    id v51 = v8;
    uint64_t v30 = &v52;
    id v52 = v7;
    id v31 = v7;
    id v32 = v8;
    id v33 = v9;
    [v27 purge:v10 completion:v49];
  }

  else
  {
    id v34 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"client %@ requested MobileAssetBrain update with options:\n%@\nraw message:%@", v9, v20, v8));
    id v35 = [v34 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateMABrain:message:clientName:]",  @"[MAB] %s",  v36,  v37,  v38,  v39,  (uint64_t)v35);

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainUpdater sharedInstance](&OBJC_CLASS___MABrainUpdater, "sharedInstance"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = __57__ControlManager_handleUpdateMABrain_message_clientName___block_invoke_2;
    v45[3] = &unk_34FFE0;
    uint64_t v28 = &v46;
    id v29 = &v47;
    id v46 = v9;
    id v47 = v8;
    uint64_t v30 = &v48;
    id v48 = v7;
    id v40 = v7;
    id v41 = v8;
    id v42 = v9;
    [v27 update:v10 completion:v45];
  }
}

void __57__ControlManager_handleUpdateMABrain_message_clientName___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = a2;
  BOOL v15 = (__CFString *)v3;
  unsigned int v4 = @"success";
  if (v3) {
    unsigned int v4 = v3;
  }
  id v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"client %@ request of MobileAssetBrain purge completed with %@", *(void *)(a1 + 32), v4));
  id v6 = [v5 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateMABrain:message:clientName:]_block_invoke",  @"[MAB] %s",  v7,  v8,  v9,  v10,  (uint64_t)v6);

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
  if (v15 && reply)
  {
    addObjectToMessage(v15, reply, "ErrorLength", "Error");
    uint64_t v12 = *(void **)(a1 + 48);
    id v13 = reply;
    int64_t v14 = 2LL;
  }

  else
  {
    uint64_t v12 = *(void **)(a1 + 48);
    if (!reply)
    {
      sendClientResponse(v12, *(void **)(a1 + 40), 2LL);
      goto LABEL_10;
    }

    id v13 = reply;
    int64_t v14 = 0LL;
  }

  sendReply(v12, v13, v14);
LABEL_10:
}

void __57__ControlManager_handleUpdateMABrain_message_clientName___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v3 = a2;
  BOOL v15 = (__CFString *)v3;
  unsigned int v4 = @"success";
  if (v3) {
    unsigned int v4 = v3;
  }
  id v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"client %@ request of MobileAssetBrain update completed with %@", *(void *)(a1 + 32), v4));
  id v6 = [v5 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleUpdateMABrain:message:clientName:]_block_invoke_2",  @"[MAB] %s",  v7,  v8,  v9,  v10,  (uint64_t)v6);

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
  if (v15 && reply)
  {
    addObjectToMessage(v15, reply, "ErrorLength", "Error");
    uint64_t v12 = *(void **)(a1 + 48);
    id v13 = reply;
    int64_t v14 = 2LL;
  }

  else
  {
    uint64_t v12 = *(void **)(a1 + 48);
    if (!reply)
    {
      sendClientResponse(v12, *(void **)(a1 + 40), 2LL);
      goto LABEL_10;
    }

    id v13 = reply;
    int64_t v14 = 0LL;
  }

  sendReply(v12, v13, v14);
LABEL_10:
}

- (int64_t)handleInstallAsset:(id)a3 forType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v5);
  uint64_t v12 = v7;
  if (v7)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v7, "lastPathComponent"));
    __int128 v124 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByDeletingPathExtension]);

    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v12, "URLByAppendingPathComponent:", @"Info.plist"));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v12, "URLByAppendingPathComponent:", @"AssetData"));
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v16));

    if (v17
      && (BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 path]),
          unsigned __int8 v20 = [v18 fileExistsAtPath:v19],
          v19,
          v18,
          (v20 & 1) != 0))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"MobileAssetProperties"]);
      if (v21)
      {
        uint64_t v26 = v21;
        AssetIdFromDict = getAssetIdFromDict(v6, v21);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(AssetIdFromDict);
        char v128 = 0;
        else {
          BOOL v33 = 1;
        }
        char v34 = !v33;
        char v128 = v34;
        id v35 = v124;
        uint64_t v121 = v28;
        id v122 = v6;
        id v123 = v26;
        if (v28)
        {
          if ([v28 isEqual:v124])
          {
LABEL_24:
            id v127 = 0LL;
            id v53 = -[MADAutoAssetDescriptor initForAssetType:fromMetadata:invalidReasons:]( objc_alloc(&OBJC_CLASS___MADAutoAssetDescriptor),  "initForAssetType:fromMetadata:invalidReasons:",  v6,  v26,  &v127);
            id v54 = v127;
            id v120 = v53;
            if (!v53 || v54)
            {
              id v119 = v54;
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleInstallAsset:forType:]",  @"Unable to create auto asset descriptor from asset with reason: %@ | Assuming V2 Asset.",  v55,  v56,  v57,  v58,  (uint64_t)v54);
              __int128 v82 = objc_alloc(&OBJC_CLASS___NSURL);
              id v83 = repositoryPath(v6);
              uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
              uint64_t v85 = -[NSURL initWithString:](v82, "initWithString:", v84);
              id v93 = normalizedAssetType((uint64_t)v6, v86, v87, v88, v89, v90, v91, v92);
              __int128 v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
              double v95 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v85, "URLByAppendingPathComponent:", v94));

              uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue([v95 path]);
              id v97 = ensureDirectory(v96);

              uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v12, "lastPathComponent"));
              uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue([v95 URLByAppendingPathComponent:v98]);

              uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v12, "path"));
              uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue([v99 path]);
              id v126 = 0LL;
              [v100 moveItemAtPath:v101 toPath:v102 error:&v126];
              id v103 = v126;

              if (v103)
              {
                uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v12, "path"));
                uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([v99 path]);
                uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue([v103 description]);
                uint64_t v107 = __error();
                strerror(*v107);
                _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleInstallAsset:forType:]",  @"Unable to move directory from %@ to %@ with error: %@ | Errno: %s",  v108,  v109,  v110,  v111,  (uint64_t)v104);

                uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                id v113 = (void *)objc_claimAutoreleasedReturnValue([v99 path]);
                [v112 removeItemAtPath:v113 error:0];

                int64_t v49 = 2LL;
              }

              else
              {
                int64_t v49 = 0LL;
              }

              id v35 = v124;
              id v52 = v99;
              id v51 = v119;
              uint64_t v28 = v120;
            }

            else
            {
              uint64_t v59 = repositoryPath(v6);
              unsigned __int8 v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
              id AutoLocalUrlFromTypeGivenDefaultRepoWithPurpose = getAutoLocalUrlFromTypeGivenDefaultRepoWithPurpose( v6,  1LL,  v60,  @"auto");
              uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeGivenDefaultRepoWithPurpose);

              uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v62 path]);
              id v64 = ensureDirectory(v63);

              id v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v12, "lastPathComponent"));
              id v66 = (void *)objc_claimAutoreleasedReturnValue([v62 URLByAppendingPathComponent:v65]);

              id v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              id v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v12, "path"));
              unsigned int v118 = v66;
              id v69 = (void *)objc_claimAutoreleasedReturnValue([v66 path]);
              id v125 = 0LL;
              [v67 moveItemAtPath:v68 toPath:v69 error:&v125];
              id v70 = v125;

              if (v70)
              {
                uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v12, "path"));
                uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v118 path]);
                uint64_t v73 = v70;
                uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v70 description]);
                uint64_t v75 = __error();
                strerror(*v75);
                _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleInstallAsset:forType:]",  @"Unable to move directory from %@ to %@ with error: %@ | Errno: %s",  v76,  v77,  v78,  v79,  (uint64_t)v71);

                uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                __int128 v81 = (void *)objc_claimAutoreleasedReturnValue([v118 path]);
                [v80 removeItemAtPath:v81 error:0];

                id v51 = 0LL;
                int64_t v49 = 2LL;
                id v35 = v124;
                id v52 = v118;
                uint64_t v28 = v120;
              }

              else
              {
                id v35 = v124;
                if (_MAPreferencesIsInternalAllowed())
                {
                  uint64_t v28 = v120;
                  +[MADAutoAssetControlManager installAutoAssetWithDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "installAutoAssetWithDescriptor:",  v120);
                  int64_t v49 = 0LL;
                  id v51 = 0LL;
                }

                else
                {
                  int64_t v49 = 0LL;
                  id v51 = 0LL;
                  uint64_t v28 = v120;
                }

                id v52 = v118;
              }
            }

            goto LABEL_37;
          }

          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleInstallAsset:forType:]",  @"Asset that is being installed has different asset ID when looking at its Info.plist: %@ in %@ generates ID %@ when looking at its Info.plist.",  v36,  v37,  v38,  v39,  (uint64_t)v124);
          int IsInternalAllowed = _MAPreferencesIsInternalAllowed();
          uint64_t v28 = 0LL;
        }

        else
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleInstallAsset:forType:]",  @"Asset that could not determine an asset ID from Info.plist: %@ in %@",  v29,  v30,  v31,  v32,  (uint64_t)v124);
          int IsInternalAllowed = _MAPreferencesIsInternalAllowed();
        }

        int64_t v49 = 2LL;
        if (IsInternalAllowed)
        {
          id v51 = 0LL;
          id v52 = 0LL;
          if (v128)
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleInstallAsset:forType:]",  @"Internal build detected, not enforcing Asset ID checks.",  v41,  v42,  v43,  v44,  v115);
            id v6 = v122;
            uint64_t v26 = v123;
            goto LABEL_24;
          }
        }

        else
        {
          id v51 = 0LL;
          id v52 = 0LL;
        }

- (void)handleSecureMABundleCommand:(id)a3 message:(id)a4 clientName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t uint64 = (void *)xpc_dictionary_get_uint64(v8, "SecureMobileAssetBundleCommand");
  uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v12 = xpc_dictionary_get_BOOL(v8, "SecureMobileAssetBundleOptionStageManifest");
  BOOL v96 = xpc_dictionary_get_BOOL(v8, "SecureMobileAssetBundleOptionDarwinOnly");
  string = xpc_dictionary_get_string(v8, "SecureMobileAssetBundleOptionPath");
  if (string)
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    BOOL v15 = v14;
LABEL_35:
    id v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid or missing SecureMobileAssetBundle argument"));
    id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v52 setObject:v51 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v52 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v53 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  -3LL,  v52));

    goto LABEL_48;
  }

  BOOL v15 = 0LL;
LABEL_5:
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v8, "SecureMobileAssetBundleOptionScpParametersOverride");
  uint64_t v17 = objc_claimAutoreleasedReturnValue(dictionary);
  BOOL v18 = (void *)v17;
  if (v17)
  {
    uint64_t v19 = (void *)_CFXPCCreateCFObjectFromXPCObject(v17);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
      -[__CFString setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v19,  @"scpParametersOverride");
    }
  }

  size_t length = 0LL;
  data = xpc_dictionary_get_data(v8, "SecureMobileAssetBundleOptionSSO", &length);
  uint64_t v22 = 0LL;
  if (data && length) {
    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data));
  }
  __int128 v94 = (void *)v22;
  -[__CFString setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:");
  if (v12) {
    -[__CFString setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"stageManifest");
  }
  if (!-[__CFString count](v10, "count"))
  {

    uint64_t v10 = 0LL;
  }

  xpc_object_t array = xpc_dictionary_get_array(v8, "SecureMobileAssetBundleOptionSelectors");
  uint64_t v24 = objc_claimAutoreleasedReturnValue(array);
  id v95 = v7;
  id v93 = (void *)v24;
  if (v24)
  {
    uint64_t v25 = v10;
    id v26 = v9;
    uint64_t v27 = (void *)_CFXPCCreateCFObjectFromXPCObject(v24);
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
    {
      BOOL v85 = v12;
      uint64_t v87 = uint64;
      uint64_t v90 = v18;
      uint64_t v92 = v15;
      uint64_t v86 = v25;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      __int128 v106 = 0u;
      __int128 v107 = 0u;
      id obj = v27;
      id v29 = [obj countByEnumeratingWithState:&v106 objects:v111 count:16];
      uint64_t v30 = v27;
      if (v29)
      {
        id v31 = v29;
        uint64_t v32 = *(void *)v107;
        while (2)
        {
          for (i = 0LL; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v107 != v32) {
              objc_enumerationMutation(obj);
            }
            char v34 = *(void **)(*((void *)&v106 + 1) + 8LL * (void)i);
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 componentsSeparatedByString:@":"]);
            if ([v35 count] != (char *)&dword_0 + 2)
            {
              id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid selector: %@",  v34));
              uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
              [v55 setObject:v54 forKeyedSubscript:NSDebugDescriptionErrorKey];
              [v55 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
              id v53 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  -3LL,  v55));

              id v7 = v95;
              id v9 = v26;
              uint64_t v10 = v86;
              BOOL v15 = v92;
              goto LABEL_48;
            }

            uint64_t v36 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:0]);
            uint64_t v38 = v30;
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:1]);
            id v40 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( v36,  "initForAssetType:withAssetSpecifier:",  v37,  v39);

            uint64_t v30 = v38;
            [v98 addObject:v40];
          }

          id v31 = [obj countByEnumeratingWithState:&v106 objects:v111 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      uint64_t v25 = v86;
      BOOL v18 = v90;
      BOOL v15 = v92;
      uint64_t uint64 = v87;
      uint64_t v27 = v30;
      BOOL v12 = v85;
    }

    id v9 = v26;
    uint64_t v10 = v25;
  }

  uint64_t v41 = @"nil";
  if (v10) {
    uint64_t v41 = v10;
  }
  id v42 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"client %@ requested Secure MobileAssetBundle command %u with options:\n%@\nraw message:%@", v9, uint64, v41, v8));
  id v43 = [v42 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleSecureMABundleCommand:message:clientName:]",  @"[SMA] %s",  v44,  v45,  v46,  v47,  (uint64_t)v43);

  uint64_t v48 = -[SecureMobileAssetBundle initWithPath:]( objc_alloc(&OBJC_CLASS___SecureMobileAssetBundle),  "initWithPath:",  v15);
  int64_t v49 = v48;
  if (v96) {
    -[SecureMobileAssetBundle setDarwinOnly:](v48, "setDarwinOnly:", 1LL);
  }
  switch((int)uint64)
  {
    case 1:
      uint64_t v105 = 0LL;
      -[SecureMobileAssetBundle personalize:error:](v49, "personalize:error:", v10, &v105);
      id v50 = v105;
      goto LABEL_44;
    case 2:
      uint64_t v104 = 0LL;
      -[SecureMobileAssetBundle depersonalize:](v49, "depersonalize:", &v104);
      id v50 = v104;
      goto LABEL_44;
    case 3:
      id v103 = 0LL;
      -[SecureMobileAssetBundle beginAccess:error:](v49, "beginAccess:error:", 0LL, &v103);
      id v50 = v103;
      goto LABEL_44;
    case 4:
      uint64_t v102 = 0LL;
      -[SecureMobileAssetBundle endAccess:error:](v49, "endAccess:error:", 0LL, &v102);
      id v50 = v102;
      goto LABEL_44;
    case 5:
      uint64_t v101 = 0LL;
      -[SecureMobileAssetBundle mapToExclaves:](v49, "mapToExclaves:", &v101);
      id v50 = v101;
      goto LABEL_44;
    case 6:
      uint64_t v100 = 0LL;
      -[SecureMobileAssetBundle unmapFromExclaves:](v49, "unmapFromExclaves:", &v100);
      id v50 = v100;
      goto LABEL_44;
    case 7:
      uint64_t v99 = 0LL;
      +[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]( &OBJC_CLASS___SecureMobileAssetBundle,  "commitStagedManifestsForSelectors:darwinOnly:error:",  v98,  v96,  &v99);
      id v50 = v99;
LABEL_44:
      id v53 = v50;
      break;
    case 8:
      uint64_t v91 = v18;
      int v89 = (int)uint64;
      if (v12)
      {
        unsigned int v73 = -[SecureMobileAssetBundle isPersonalizedManifestStaged](v49, "isPersonalizedManifestStaged");
        uint64_t v74 = "staged";
      }

      else
      {
        unsigned int v73 = -[SecureMobileAssetBundle isPersonalized](v49, "isPersonalized");
        uint64_t v74 = "committed";
      }

      uint64_t uint64 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](v49, "assetBundlePath"));
      uint64_t v75 = objc_claimAutoreleasedReturnValue([uint64 lastPathComponent]);
      uint64_t v76 = (void *)v75;
      uint64_t v77 = "DOES NOT have";
      if (v73) {
        uint64_t v77 = "DOES have";
      }
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Secure MobleAsset bundle %@ %s a %s personalized manifest.",  v75,  v77,  v74));

      id v79 = v78;
      id v80 = [v79 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleSecureMABundleCommand:message:clientName:]",  @"[SMA] %s",  v81,  v82,  v83,  v84,  (uint64_t)v80);

      id v53 = 0LL;
      BOOL v18 = v91;
      LODWORD(uint64) = v89;
      break;
    default:
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid or unknown SecureMobileAssetBundle command"));
      int v88 = (int)uint64;
      uint64_t uint64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [uint64 setObject:v56 forKeyedSubscript:NSDebugDescriptionErrorKey];
      [uint64 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
      id v53 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  -2LL,  uint64));

      LODWORD(uint64) = v88;
      break;
  }

  uint64_t v57 = stringForSecureMABundleCommand((int)uint64);
  uint64_t v58 = objc_claimAutoreleasedReturnValue(v57);
  uint64_t v59 = (void *)v58;
  unsigned __int8 v60 = @"success";
  if (v53) {
    unsigned __int8 v60 = v53;
  }
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"client %@ request of Secure MobileAsset command %@ completed with %@",  v9,  v58,  v60));

  id v62 = v61;
  id v63 = [v62 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ControlManager handleSecureMABundleCommand:message:clientName:]",  @"[SMA] %s",  v64,  v65,  v66,  v67,  (uint64_t)v63);

  id v7 = v95;
LABEL_48:
  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  id v69 = reply;
  if (v53 && reply)
  {
    addObjectToMessage(v53, reply, "ErrorLength", "Error");
    id v70 = v7;
    uint64_t v71 = v69;
    int64_t v72 = 2LL;
  }

  else
  {
    id v70 = v7;
    if (!v69)
    {
      sendClientResponse(v7, v8, 2LL);
      goto LABEL_54;
    }

    uint64_t v71 = v69;
    int64_t v72 = 0LL;
  }

  sendReply(v70, v71, v72);
LABEL_54:
}

+ (id)getStringFromXpcMessage:(id)a3 forKey:(const char *)a4
{
  string = (char *)xpc_dictionary_get_string(a3, a4);
  if (string) {
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  }
  return string;
}

- (void)activityNotification:(id)a3 ofStatusChange:(unint64_t)a4 withReason:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_alloc(&OBJC_CLASS___NSString);
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[MADActivityTracker nameOfStatus:](&OBJC_CLASS___MADActivityTracker, "nameOfStatus:", a4));
  uint64_t v10 = -[NSString initWithFormat:](v9, "initWithFormat:", @"received statusChange(%@) reason:%@", v11, v7);

  +[MADActivityManager noticeForActivity:reason:]( &OBJC_CLASS___MADActivityManager,  "noticeForActivity:reason:",  v8,  v10);
}

- (DownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (NSMutableDictionary)assetTypeDescriptors
{
  return self->_assetTypeDescriptors;
}

- (OS_dispatch_queue)metaDataQueue
{
  return self->_metaDataQueue;
}

- (OS_dispatch_queue)assetQueue
{
  return self->_assetQueue;
}

- (OS_dispatch_queue)cachedeleteQueue
{
  return self->_cachedeleteQueue;
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (BOOL)allowSTExtractorPluginLoadFromDownloadedMABrain
{
  return self->_allowSTExtractorPluginLoadFromDownloadedMABrain;
}

- (void)setAllowSTExtractorPluginLoadFromDownloadedMABrain:(BOOL)a3
{
  self->_allowSTExtractorPluginLoadFromDownloadedMABrain = a3;
}

- (BOOL)reclaimSpace
{
  return self->_reclaimSpace;
}

- (void)setReclaimSpace:(BOOL)a3
{
  self->_reclaimSpace = a3;
}

- (int64_t)targetingPurgeAmount
{
  return self->_targetingPurgeAmount;
}

- (void)setTargetingPurgeAmount:(int64_t)a3
{
  self->_targetingPurgeAmount = a3;
}

- (NSString)targetingAmountString
{
  return self->_targetingAmountString;
}

- (void)setTargetingAmountString:(id)a3
{
}

- (int)reclaimUrgency
{
  return self->_reclaimUrgency;
}

- (void)setReclaimUrgency:(int)a3
{
  self->_reclaimUrgency = a3;
}

- (NSString)reclaimUrgencyName
{
  return self->_reclaimUrgencyName;
}

- (void)setReclaimUrgencyName:(id)a3
{
}

- (NSString)reclaimVolume
{
  return self->_reclaimVolume;
}

- (void)setReclaimVolume:(id)a3
{
}

- (NSString)cacheDeleteOperationName
{
  return self->_cacheDeleteOperationName;
}

- (void)setCacheDeleteOperationName:(id)a3
{
}

- (double)currentTimeInSeconds
{
  return self->_currentTimeInSeconds;
}

- (void)setCurrentTimeInSeconds:(double)a3
{
  self->_currentTimeInSeconds = a3;
}

- (double)preciousNumberOfSeconds
{
  return self->_preciousNumberOfSeconds;
}

- (void)setPreciousNumberOfSeconds:(double)a3
{
  self->_preciousNumberOfSeconds = a3;
}

- (double)defaultNumberOfSeconds
{
  return self->_defaultNumberOfSeconds;
}

- (void)setDefaultNumberOfSeconds:(double)a3
{
  self->_defaultNumberOfSeconds = a3;
}

- (double)deltaToCurrentTimeSeconds
{
  return self->_deltaToCurrentTimeSeconds;
}

- (void)setDeltaToCurrentTimeSeconds:(double)a3
{
  self->_deltaToCurrentTimeSeconds = a3;
}

- (NSString)garbageCollectionAlterAssetType
{
  return self->_garbageCollectionAlterAssetType;
}

- (void)setGarbageCollectionAlterAssetType:(id)a3
{
}

- (NSString)garbageCollectionAlterBehavior
{
  return self->_garbageCollectionAlterBehavior;
}

- (void)setGarbageCollectionAlterBehavior:(id)a3
{
}

- (NSDictionary)unlockedUnreferencedDescriptors
{
  return self->_unlockedUnreferencedDescriptors;
}

- (void)setUnlockedUnreferencedDescriptors:(id)a3
{
}

- (NSDictionary)unlockedReferencedDescriptors
{
  return self->_unlockedReferencedDescriptors;
}

- (void)setUnlockedReferencedDescriptors:(id)a3
{
}

- (NSDictionary)lockedOverridableAutoAssetDescriptors
{
  return self->_lockedOverridableAutoAssetDescriptors;
}

- (void)setLockedOverridableAutoAssetDescriptors:(id)a3
{
}

- (NSDictionary)lockedNeverRemoveAutoAssetDescriptors
{
  return self->_lockedNeverRemoveAutoAssetDescriptors;
}

- (void)setLockedNeverRemoveAutoAssetDescriptors:(id)a3
{
}

- (NSDictionary)stagedAutoAssetDescriptors
{
  return self->_stagedAutoAssetDescriptors;
}

- (void)setStagedAutoAssetDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end