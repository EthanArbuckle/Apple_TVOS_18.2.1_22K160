@interface MADAutoAssetSecure
+ (BOOL)doesDescriptorInvolveGrafting:(id)a3 forDescriptor:(id)a4;
+ (BOOL)doesDescriptorInvolvePersonalization:(id)a3 forDescriptor:(id)a4;
+ (BOOL)doesDescriptorInvolveSecureOperations:(id)a3 forDescriptor:(id)a4;
+ (BOOL)doesSetDescriptorInvolveSecureOperations:(id)a3 forSetDescriptor:(id)a4 withAutoAssetDescriptors:(id)a5;
+ (BOOL)isGraftedOrMounted:(id)a3 forDescriptor:(id)a4;
+ (BOOL)isPersonalizationOrGraftingRequired:(id)a3 forDescriptor:(id)a4;
+ (BOOL)isPersonalizationOrGraftingRequired:(id)a3 forSetDescriptor:(id)a4;
+ (BOOL)isPersonalizationRequired:(id)a3 forDescriptor:(id)a4;
+ (BOOL)isPersonalizationRequired:(id)a3 forSetDescriptor:(id)a4;
+ (BOOL)isPrePersonalized:(id)a3 forDescriptor:(id)a4;
+ (BOOL)isSecureAsset:(id)a3 forDescriptor:(id)a4;
+ (BOOL)ungraft:(id)a3 forDescriptor:(id)a4 ungraftingError:(id *)a5;
+ (BOOL)ungraftAll:(id)a3 forSetDescriptor:(id)a4 withAutoAssetDescriptors:(id)a5 ungraftingError:(id *)a6;
+ (id)_secureAssetBundleSummary:(id)a3;
+ (id)autoAssetSecure;
+ (id)commitPrePersonalizedSync:(id)a3 committingSelectors:(id)a4;
+ (id)getGraftPath:(id)a3 forDescriptor:(id)a4;
+ (id)graftDownloadedSync:(id)a3 graftingDescriptor:(id)a4;
+ (id)latestDownloadedAtomicInstanceEntries:(id)a3 forSetDescriptor:(id)a4;
+ (id)localContentURL:(id)a3 forAssetType:(id)a4 assetId:(id)a5;
+ (id)localContentURL:(id)a3 forDescriptor:(id)a4;
+ (id)migrateMismatchedPersistedStateVersion:(id)a3 forEntryID:(id)a4 withMismatchedState:(id)a5;
+ (id)orphanedProcessLifeLocks:(id)a3;
+ (id)secureBundleForAssetType:(id)a3 assetId:(id)a4;
+ (void)commitPrePersonalized:(id)a3 committingSelectors:(id)a4 completion:(id)a5;
+ (void)depersonalizeIfSecure:(id)a3 forDescriptor:(id)a4;
+ (void)graftDownloaded:(id)a3 graftingDescriptor:(id)a4 completion:(id)a5;
+ (void)mapToExclave:(id)a3 forDescriptor:(id)a4 completion:(id)a5;
+ (void)personalizeDownloaded:(id)a3 personalizingDescriptor:(id)a4 allowingNetwork:(BOOL)a5 committingPersonalization:(BOOL)a6 completion:(id)a7;
+ (void)personalizeGraftDownloaded:(id)a3 forDescriptor:(id)a4 allowingNetwork:(BOOL)a5 completion:(id)a6;
+ (void)personalizeGraftSetDownloaded:(id)a3 forSetDescriptor:(id)a4 allowingNetwork:(BOOL)a5 withAutoAssetDescriptors:(id)a6 completion:(id)a7;
+ (void)personalizeSetDownloaded:(id)a3 forSetDescriptor:(id)a4 allowingNetwork:(BOOL)a5 withAutoAssetDescriptors:(id)a6 completion:(id)a7;
+ (void)personalizeSetDownloaded:(id)a3 forSetDescriptor:(id)a4 shouldGraft:(BOOL)a5 allowingNetwork:(BOOL)a6 withAutoAssetDescriptors:(id)a7 completion:(id)a8;
+ (void)removeAllPersisted;
+ (void)ungraftIfNotAccessible:(id)a3;
- (MADAutoAssetPersisted)persistedState;
- (MADAutoAssetSecure)init;
- (OS_dispatch_queue)secureProtectionQueue;
- (SUCoreLog)logger;
- (void)_personalizeGraftSetDownloaded:(id)a3 forSetDescriptor:(id)a4 allowingNetwork:(BOOL)a5 requiringPersonalization:(id)a6 requiringGrafting:(id)a7 shouldGraft:(BOOL)a8 completion:(id)a9;
- (void)init;
@end

@implementation MADAutoAssetSecure

- (MADAutoAssetSecure)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MADAutoAssetSecure;
  v2 = -[MADAutoAssetSecure init](&v22, "init");
  if (!v2) {
    goto LABEL_4;
  }
  v3 = -[SUCoreLog initWithCategory:](objc_alloc(&OBJC_CLASS___SUCoreLog), "initWithCategory:", @"AUTO-SECURE");
  logger = v2->_logger;
  v2->_logger = v3;

  v5 = (const char *)[@"com.apple.MobileAsset.daemon.secureProtectionQueue" UTF8String];
  dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_queue_t v8 = dispatch_queue_create(v5, v7);
  secureProtectionQueue = v2->_secureProtectionQueue;
  v2->_secureProtectionQueue = (OS_dispatch_queue *)v8;

  if (v2->_secureProtectionQueue)
  {
    v10 = -[MADAutoAssetPersisted initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:]( objc_alloc(&OBJC_CLASS___MADAutoAssetPersisted),  "initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:",  @"AutoAssetSecure",  @"1.0",  v2->_secureProtectionQueue,  v2->_logger,  0LL,  &__block_literal_global_5);
    persistedState = v2->_persistedState;
    v2->_persistedState = v10;

LABEL_4:
    v12 = v2;
    goto LABEL_8;
  }

  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SUCoreLog oslog](v2->_logger, "oslog"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[MADAutoAssetSecure init].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  v12 = 0LL;
LABEL_8:

  return v12;
}

NSDictionary *__cdecl __26__MADAutoAssetSecure_init__block_invoke(id a1, NSString *a2, NSString *a3, NSDictionary *a4)
{
  return (NSDictionary *)+[MADAutoAssetSecure migrateMismatchedPersistedStateVersion:forEntryID:withMismatchedState:]( &OBJC_CLASS___MADAutoAssetSecure,  "migrateMismatchedPersistedStateVersion:forEntryID:withMismatchedState:",  a2,  a3,  a4);
}

+ (id)autoAssetSecure
{
  if (autoAssetSecure_dispatchOnceAutoAssetSecure != -1) {
    dispatch_once(&autoAssetSecure_dispatchOnceAutoAssetSecure, &__block_literal_global_619);
  }
  return (id)autoAssetSecure___autoAssetSecure;
}

void __37__MADAutoAssetSecure_autoAssetSecure__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADAutoAssetSecure);
  v2 = (void *)autoAssetSecure___autoAssetSecure;
  autoAssetSecure___autoAssetSecure = (uint64_t)v1;
}

+ (BOOL)doesDescriptorInvolvePersonalization:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:doesDescriptorInvolvePersonalization",  v6);

  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 metadata]);
  unsigned int v10 = [v9 safeBooleanForKey:@"__RequiresPersonalization"];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      v13 = @"Y";
    }
    else {
      v13 = @"N";
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    uint64_t v19 = v13;
    __int16 v20 = 2114;
    v21 = v14;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} determined secure attribute | involvesPersonalization:%{public}@ | auto AssetDescriptor:%{public}@",  buf,  0x20u);
  }

  return v10;
}

+ (BOOL)doesDescriptorInvolveGrafting:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:doesDescriptorInvolveGrafting",  v6);

  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 metadata]);
  unsigned int v10 = [v9 safeBooleanForKey:@"__ContainsCryptexContents"];

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      __int16 v18 = v13;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} determined secure attribute | involvesGrafting:Y | autoAssetDescriptor:%{public}@",  buf,  0x16u);
    }
  }

  return v10;
}

+ (BOOL)doesDescriptorInvolveSecureOperations:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:doesDescriptorInvolveSecureOperations",  v6);

  LOBYTE(v6) = +[MADAutoAssetSecure doesDescriptorInvolvePersonalization:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "doesDescriptorInvolvePersonalization:forDescriptor:",  v7,  v5);
  unsigned __int8 v8 = +[MADAutoAssetSecure doesDescriptorInvolveGrafting:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "doesDescriptorInvolveGrafting:forDescriptor:",  v7,  v5);

  return v6 | v8;
}

+ (BOOL)doesSetDescriptorInvolveSecureOperations:(id)a3 forSetDescriptor:(id)a4 withAutoAssetDescriptors:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  unsigned __int8 v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:doesSetDescriptorInvolveSecureOperations",  v6);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (+[MADAutoAssetSecure doesDescriptorInvolvePersonalization:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "doesDescriptorInvolvePersonalization:forDescriptor:",  v8,  v14)
          || +[MADAutoAssetSecure doesDescriptorInvolveGrafting:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "doesDescriptorInvolveGrafting:forDescriptor:",  v8,  v14))
        {
          BOOL v15 = 1;
          goto LABEL_13;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v15 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v15 = 0;
  }

+ (BOOL)isSecureAsset:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@:isSecureAsset", v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (!v8)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.1();
    }
    goto LABEL_11;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v9,  v10));

  if (!v11)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.2();
    }
LABEL_11:
    BOOL v16 = 0;
    id v11 = 0LL;
    goto LABEL_12;
  }

  if (![v11 isSecureMobileAsset])
  {
    BOOL v16 = 0;
    goto LABEL_13;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure _secureAssetBundleSummary:]( &OBJC_CLASS___MADAutoAssetSecure,  "_secureAssetBundleSummary:",  v11));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138543874;
    v21 = v7;
    __int16 v22 = 2114;
    v23 = v14;
    __int16 v24 = 2114;
    v25 = v15;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} determined secure attribute | isSecureAsset:Y | secureAssetBundle:%{pub lic}@ | autoAssetDescriptor:%{public}@",  buf,  0x20u);
  }

  BOOL v16 = 1;
LABEL_12:

LABEL_13:
  return v16;
}

+ (BOOL)isPersonalizationRequired:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:isPersonalizationRequired",  v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (!v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.1();
    }
    goto LABEL_10;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v9,  v10));

  if (!v11)
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.2();
    }
LABEL_10:
    BOOL v12 = 0;
    id v11 = 0LL;
LABEL_11:

    goto LABEL_12;
  }

  if ([v11 isSecureMobileAsset]
    && ([v11 isPersonalized] & 1) == 0)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure _secureAssetBundleSummary:]( &OBJC_CLASS___MADAutoAssetSecure,  "_secureAssetBundleSummary:",  v11));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      *(_DWORD *)buf = 138543874;
      v21 = v7;
      __int16 v22 = 2114;
      v23 = v18;
      __int16 v24 = 2114;
      v25 = v19;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} determined secure attribute | personalizationRequired:Y | secureAsset Bundle:%{public}@ | autoAssetDescriptor:%{public}@",  buf,  0x20u);
    }

    BOOL v12 = 1;
    goto LABEL_11;
  }

  BOOL v12 = 0;
LABEL_12:

  return v12;
}

+ (BOOL)isPersonalizationOrGraftingRequired:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:isPersonalizationOrGraftingRequired",  v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (!v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isPersonalizationOrGraftingRequired:forDescriptor:].cold.1();
    }
    goto LABEL_9;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v9,  v10));

  if (!v11)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isPersonalizationOrGraftingRequired:forDescriptor:].cold.2();
    }
LABEL_9:
    LOBYTE(v12) = 0;
    LOBYTE(v15) = 0;
    goto LABEL_22;
  }

  else {
    unsigned int v12 = 0;
  }
  else {
    unsigned int v15 = 0;
  }
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v18 = @"N";
    if (v12) {
      __int128 v19 = @"Y";
    }
    else {
      __int128 v19 = @"N";
    }
    if (v15) {
      __int128 v18 = @"Y";
    }
    v23 = v18;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure _secureAssetBundleSummary:]( &OBJC_CLASS___MADAutoAssetSecure,  "_secureAssetBundleSummary:",  v11));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138544386;
    v25 = v7;
    __int16 v26 = 2114;
    v27 = v19;
    __int16 v28 = 2114;
    v29 = v23;
    __int16 v30 = 2114;
    v31 = v20;
    __int16 v32 = 2114;
    v33 = v21;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} determined secure attribute | personalizationRequired:%{public}@ | graf tingRequired:%{public}@ | secureAssetBundle:%{public}@ | autoAssetDescriptor:%{public}@",  buf,  0x34u);
  }

LABEL_22:
  return v12 | v15;
}

+ (BOOL)isGraftedOrMounted:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:isGraftedOrMounted",  v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (!v8)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.1();
    }
    goto LABEL_11;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v9,  v10));

  if (!v11)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.2();
    }
LABEL_11:
    BOOL v16 = 0;
    id v11 = 0LL;
    goto LABEL_12;
  }

  if (![v11 isAccessible])
  {
    BOOL v16 = 0;
    goto LABEL_13;
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure _secureAssetBundleSummary:]( &OBJC_CLASS___MADAutoAssetSecure,  "_secureAssetBundleSummary:",  v11));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138543874;
    v21 = v7;
    __int16 v22 = 2114;
    v23 = v14;
    __int16 v24 = 2114;
    v25 = v15;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} determined secure attribute | graftedOrMounted:Y | secureAssetBundle:%{ public}@ | autoAssetDescriptor:%{public}@",  buf,  0x20u);
  }

  BOOL v16 = 1;
LABEL_12:

LABEL_13:
  return v16;
}

+ (BOOL)isPrePersonalized:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:isPrePersonalized",  v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (!v8)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.1();
    }
    goto LABEL_11;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v9,  v10));

  if (!v11)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.2();
    }
LABEL_11:
    BOOL v16 = 0;
    id v11 = 0LL;
    goto LABEL_12;
  }

  if (![v11 isPersonalizedManifestStaged])
  {
    BOOL v16 = 0;
    goto LABEL_13;
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure _secureAssetBundleSummary:]( &OBJC_CLASS___MADAutoAssetSecure,  "_secureAssetBundleSummary:",  v11));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138543874;
    v21 = v7;
    __int16 v22 = 2114;
    v23 = v14;
    __int16 v24 = 2114;
    v25 = v15;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} determined secure attribute | prePersonalized:Y | secureAssetBundle:%{p ublic}@ | autoAssetDescriptor:%{public}@",  buf,  0x20u);
  }

  BOOL v16 = 1;
LABEL_12:

LABEL_13:
  return v16;
}

+ (id)getGraftPath:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@:getGraftPath", v6);

  if (+[MADAutoAssetSecure isGraftedOrMounted:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isGraftedOrMounted:forDescriptor:",  v7,  v5))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v8,  v9));

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessPath]);
    }

    else
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetSecure isSecureAsset:forDescriptor:].cold.2();
      }

      id v11 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

+ (void)depersonalizeIfSecure:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:depersonalizeIfSecure",  v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (+[MADAutoAssetSecure doesDescriptorInvolvePersonalization:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "doesDescriptorInvolvePersonalization:forDescriptor:",  v7,  v5))
  {
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v9,  v10));

      unsigned int v12 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 assetSpecifier]);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 assetVersion]);
      id v16 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v12,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v13,  v14,  v15);

      if (v11)
      {
        id v27 = 0LL;
        unsigned int v17 = [v11 depersonalize:&v27];
        id v18 = v27;
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
        __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

        if (v17)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
            *(_DWORD *)buf = 138543618;
            v29 = v7;
            __int16 v30 = 2114;
            v31 = v21;
            _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-REMOVE] {%{public}@}  depersonalize SUCCESS| autoAssetDescriptor:%{public}@",  buf,  0x16u);
          }

          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
          +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:",  1201LL,  6LL,  6LL,  v22,  v16);
        }

        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue([v18 checkedDescription]);
            __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
            *(_DWORD *)buf = 138543874;
            v29 = v7;
            __int16 v30 = 2114;
            v31 = v25;
            __int16 v32 = 2114;
            v33 = v26;
            _os_log_error_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-REMOVE] {%{public}@}  depersonalize ERROR | error:%{public}@ | autoAsse tDescriptor:%{public}@",  buf,  0x20u);
          }

          +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:p ersonalizeError:mapToExclaveError:",  v16,  0LL,  0LL,  8LL,  v7,  0LL,  0LL,  v18,  0LL);
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
          +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  1201LL,  6LL,  v22,  v16,  v18);
        }
      }

      else
      {
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
        id v18 = (id)objc_claimAutoreleasedReturnValue([v24 oslog]);

        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
          +[MADAutoAssetSecure depersonalizeIfSecure:forDescriptor:].cold.2();
        }
      }
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v23 oslog]);

      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetSecure depersonalizeIfSecure:forDescriptor:].cold.1();
      }
    }
  }
}

+ (id)secureBundleForAssetType:(id)a3 assetId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v5, v6, 2LL, @"auto");
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);
  if (!v8)
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure secureBundleForAssetType:assetId:].cold.1((uint64_t)v5, (uint64_t)v6, v14);
    }
    goto LABEL_7;
  }

  id v9 = objc_alloc(&OBJC_CLASS___SecureMobileAssetBundle);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByDeletingLastPathComponent]);
  unsigned int v12 = -[SecureMobileAssetBundle initWithPath:](v9, "initWithPath:", v11);

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543874;
      id v18 = v5;
      __int16 v19 = 2114;
      id v20 = v6;
      __int16 v21 = 2114;
      __int16 v22 = v8;
      _os_log_error_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][LOCAL-CONTENT-URL] {secureBundleForAssetType} unable to initialize secureAssetBundle | assetType:% {public}@ | assetId:%{public}@ | localContentURLBasePath:%{public}@",  (uint8_t *)&v17,  0x20u);
    }

+ (id)localContentURL:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure localContentURL:forAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "localContentURL:forAssetType:assetId:",  v6,  v7,  v8));
  return v9;
}

+ (id)localContentURL:(id)a3 forAssetType:(id)a4 assetId:(id)a5
{
  id v7 = (__CFString *)a4;
  unsigned __int8 v8 = (__CFString *)a5;
  id v9 = a3;
  id v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:localContentURL",  v9);

  id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v7, v8, 2LL, @"auto");
  uint64_t v12 = objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v7,  v8));
    if (v14)
    {
      if (v15)
      {
        if (![v15 isSecureMobileAsset] || !objc_msgSend(v15, "isAccessible"))
        {
          if (![v15 isSecureMobileAsset]
            || ([v15 isAccessible] & 1) != 0)
          {
            goto LABEL_35;
          }

          id v27 = (void *)objc_claimAutoreleasedReturnValue([v14 logger]);
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_33;
          }
          else {
            __int16 v28 = @"NO";
          }
          *(_DWORD *)buf = 138544386;
          else {
            v29 = @"NO";
          }
          v38 = v10;
          __int16 v39 = 2114;
          v40 = v28;
          __int16 v41 = 2114;
          v42 = v29;
          __int16 v43 = 2114;
          v44 = v7;
          __int16 v45 = 2114;
          v46 = v8;
          __int16 v26 = "\n"
                "[AUTO-SECURE][LOCAL-CONTENT-URL] {%{public}@} SecureMobileAssetBundle is not available | isSecureMobileA"
                "sset:%{public}@ | isAccessible:%{public}@ | assetType:%{public}@ | assetId:%{public}@";
          goto LABEL_45;
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accessPath]);

        if (v16)
        {
          int v17 = objc_alloc(&OBJC_CLASS___NSURL);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 accessPath]);
          __int16 v19 = -[NSURL initWithString:](v17, "initWithString:", v18);

          v13 = v19;
          if (!v19)
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 logger]);
            v13 = (void *)objc_claimAutoreleasedReturnValue([v20 oslog]);

            if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
            {
              else {
                __int16 v21 = @"NO";
              }
              *(_DWORD *)buf = 138544386;
              else {
                __int16 v22 = @"NO";
              }
              v38 = v10;
              __int16 v39 = 2114;
              v40 = v21;
              __int16 v41 = 2114;
              v42 = v22;
              __int16 v43 = 2114;
              v44 = v7;
              __int16 v45 = 2114;
              v46 = v8;
              _os_log_error_impl( &dword_0,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][LOCAL-CONTENT-URL] {%{public}@} SecureMobileAssetBundle accessible yet no accessPath | isS ecureMobileAsset:%{public}@ | isAccessible:%{public}@ | assetType:%{public}@ | assetId:%{public}@",  buf,  0x34u);
            }

            goto LABEL_34;
          }

+ (id)latestDownloadedAtomicInstanceEntries:(id)a3 forSetDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v60 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:latestDownloadedAtomicInstanceEntries",  v5);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 latestDowloadedAtomicInstanceEntries]);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (v63)
  {
    v54 = (os_log_s *)v7;
    id v55 = v5;
    v61 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    v59 = v6;
    id obj = (id)objc_claimAutoreleasedReturnValue([v6 latestDowloadedAtomicInstanceEntries]);
    id v8 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
    if (!v8) {
      goto LABEL_46;
    }
    id v9 = v8;
    uint64_t v64 = *(void *)v66;
    while (1)
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v66 != v64) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 assetID]);
        id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v14, v15, 2LL, @"auto");
        int v17 = (NSURL *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);

        if (!v17)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([v63 logger]);
          __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_36;
          }
          __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v59 summary]);
          id v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 summary]);
          *(_DWORD *)buf = 138543874;
          v70 = v60;
          __int16 v71 = 2114;
          v72 = v26;
          __int16 v73 = 2114;
          v74 = v27;
          _os_log_error_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE]LATEST-DOWNLOADED] {%{public}@} unable to form default URL [before considering whether secure-a sset] | setDescriptor:%{public}@ | nextAtomicEntry:%{public}@",  buf,  0x20u);
LABEL_16:

LABEL_17:
          goto LABEL_36;
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 assetType]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 assetID]);
        __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v19,  v20));

        if (v21)
        {
          if (-[os_log_s isSecureMobileAsset](v21, "isSecureMobileAsset")
            && -[os_log_s isAccessible](v21, "isAccessible"))
          {
            __int16 v22 = objc_alloc(&OBJC_CLASS___NSURL);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s accessPath](v21, "accessPath"));
            __int16 v24 = -[NSURL initWithString:](v22, "initWithString:", v23);

            int v17 = v24;
            if (!v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue([v63 logger]);
              __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v25 oslog]);

              if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
              {
                id v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v59 summary]);
                __int16 v28 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 summary]);
                *(_DWORD *)buf = 138543874;
                v70 = v60;
                __int16 v71 = 2114;
                v72 = v27;
                __int16 v73 = 2114;
                v74 = v28;
                _os_log_error_impl( &dword_0,  (os_log_t)v26,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE]LATEST-DOWNLOADED] {%{public}@} accessible secure-bundle with no local content URL | setD escriptor:%{public}@ | nextAtomicEntry:%{public}@",  buf,  0x20u);

                goto LABEL_16;
              }

              goto LABEL_17;
            }
          }

          else if (-[os_log_s isSecureMobileAsset](v21, "isSecureMobileAsset") {
                 && (-[os_log_s isAccessible](v21, "isAccessible") & 1) == 0)
          }
          {
            __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v63 logger]);
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              else {
                __int16 v32 = @"NO";
              }
              v57 = v32;
              else {
                v33 = @"NO";
              }
              v34 = (void *)objc_claimAutoreleasedReturnValue([v59 summary]);
              v35 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
              *(_DWORD *)buf = 138544386;
              v70 = v60;
              __int16 v71 = 2114;
              v72 = v57;
              __int16 v73 = 2114;
              v74 = v33;
              __int16 v75 = 2114;
              v76 = v34;
              __int16 v77 = 2114;
              v78 = v35;
              _os_log_error_impl( &dword_0,  v31,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE]LATEST-DOWNLOADED] {%{public}@} SecureMobileAssetBundle is not available | isSecureMobileAs set:%{public}@ | isAccessible:%{public}@ | setDescriptor:%{public}@ | nextAtomicEntry:%{public}@",  buf,  0x34u);
            }

            goto LABEL_35;
          }
        }

        else
        {
          uint32_t v36 = (void *)objc_claimAutoreleasedReturnValue([v63 logger]);
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 oslog]);

          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v44 = (__CFString *)objc_claimAutoreleasedReturnValue([v59 summary]);
            __int16 v45 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 summary]);
            *(_DWORD *)buf = 138543874;
            v70 = v60;
            __int16 v71 = 2114;
            v72 = v44;
            __int16 v73 = 2114;
            v74 = v45;
            _os_log_error_impl( &dword_0,  v37,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE]LATEST-DOWNLOADED] {%{public}@} unable to initialize SecureMobileAssetBundle | setDescriptor: %{public}@ | nextAtomicEntry:%{public}@",  buf,  0x20u);
          }
        }

        v38 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
        __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v11 assetID]);
        __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v11 assetAttributes]);
        v31 = -[MANAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:]( v38,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v39,  v40,  v17,  v41,  [v11 inhibitedFromEmergencyRemoval]);

        if (v31)
        {
          -[NSMutableArray addObject:](v61, "addObject:", v31);
        }

        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue([v63 logger]);
          __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 oslog]);

          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            else {
              v46 = @"NO";
            }
            v58 = v46;
            else {
              v47 = @"NO";
            }
            v56 = v47;
            v48 = (void *)objc_claimAutoreleasedReturnValue([v59 summary]);
            v49 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
            *(_DWORD *)buf = 138544386;
            v70 = v60;
            __int16 v71 = 2114;
            v72 = v58;
            __int16 v73 = 2114;
            v74 = v56;
            __int16 v75 = 2114;
            v76 = v48;
            __int16 v77 = 2114;
            v78 = v49;
            _os_log_error_impl( &dword_0,  v43,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE]LATEST-DOWNLOADED] {%{public}@} unable to create atomic-entry with determined local content U RL | isSecureMobileAsset:%{public}@ | isAccessible:%{public}@) | setDescriptor:%{public}@ | nextAtomicEntry:%{public}@",  buf,  0x34u);
          }
        }

+ (void)personalizeDownloaded:(id)a3 personalizingDescriptor:(id)a4 allowingNetwork:(BOOL)a5 committingPersonalization:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v11 = a4;
  id v12 = a7;
  id v13 = a3;
  uint64_t v14 = objc_alloc(&OBJC_CLASS___NSString);
  unsigned int v15 = @"pre-";
  if (v8) {
    unsigned int v15 = &stru_355768;
  }
  id v16 = -[NSString initWithFormat:](v14, "initWithFormat:", @"%@:%@personalizeDownloaded", v13, v15);

  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  id v18 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSpecifier]);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v11 assetVersion]);
  id v37 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v18,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v19,  v20,  v21);

  if (v17)
  {
    uint32_t v36 = v16;
    __int16 v22 = v12;
    v23 = (const char *)[@"com.apple.MobileAsset.daemon.secureWaitedOperationQueue" UTF8String];
    dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);
    __int16 v26 = dispatch_queue_create(v23, v25);

    if (v26)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke_675;
      block[3] = &unk_34E0A0;
      id v27 = &v39;
      id v39 = v11;
      __int16 v28 = (id *)&v40;
      v40 = v36;
      v29 = &v41;
      id v41 = v17;
      __int16 v30 = &v43;
      id v43 = v22;
      BOOL v44 = a5;
      BOOL v45 = v8;
      v31 = v37;
      id v42 = v37;
      dispatch_async(v26, block);
      __int16 v32 = v42;
    }

    else
    {
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
      v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v32 selectCompletionQueue:0]);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke_672;
      v46[3] = &unk_34E050;
      id v27 = (id *)&v47;
      v47 = v36;
      __int16 v28 = &v48;
      id v48 = v17;
      v29 = &v49;
      id v49 = v11;
      __int16 v30 = &v50;
      id v50 = v22;
      dispatch_async(v35, v46);

      v31 = v37;
    }

    id v12 = v22;
    id v16 = v36;
  }

  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    v34 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v33 selectCompletionQueue:0]);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke;
    v51[3] = &unk_34E028;
    v52 = v16;
    id v53 = v11;
    id v54 = v12;
    dispatch_async(v34, v51);

    __int16 v26 = v52;
    v31 = v37;
  }
}

void __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"no MADAutoAssetSecure instance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION] {%{public}@} no MADAutoAssetSecure instance - personalize ERROR | error:%{publ ic}@ | autoAssetDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke_672( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"unable to allocate waitedOperationQueue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION] {%{public}@} unable to allocate waitedOperationQueue - personalize ERROR | err or:%{public}@ | autoAssetDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke_675( uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetType]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*v2 assetId]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v3,  v4));

  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  *(unsigned __int8 *)(a1 + 72));
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x3032000000LL;
    id v49 = __Block_byref_object_copy__3;
    id v50 = __Block_byref_object_dispose__3;
    id v51 = 0LL;
    int v8 = -[NSNumber initWithBool:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithBool:", *(_BYTE *)(a1 + 73) == 0);
    -[NSMutableDictionary setSafeObject:forKey:](v6, "setSafeObject:forKey:", v7, @"AllowNetworkCommunication");
    -[NSMutableDictionary setSafeObject:forKey:](v6, "setSafeObject:forKey:", v8, @"stageManifest");
    uint64_t v9 = (id *)(v47 + 5);
    id obj = (id)v47[5];
    unsigned __int8 v10 = [v5 personalize:v6 error:&obj];
    objc_storeStrong(v9, obj);
    id v11 = (void *)v47[5];
    if (v11)
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
      unsigned int v13 = [v12 isEqualToString:kAMAuthInstallErrorDomain];

      uint64_t v14 = (char *)[(id)v47[5] code];
      if ((v10 & 1) != 0)
      {
        id v15 = 0LL;
        id v16 = 0LL;
        v33 = 0LL;
        unsigned __int8 v10 = 1;
      }

      else if (v13 && v14 == (_BYTE *)&stru_C38.flags + 2)
      {
        v33 = objc_opt_new(&OBJC_CLASS___MobileAssetKeyManager);
        id v44 = 0LL;
        id v15 = -[MobileAssetKeyManager copyPersonalizationSSOToken:error:]( v33,  "copyPersonalizationSSOToken:error:",  1LL,  &v44);
        id v16 = v44;
        if (v16 || !v15)
        {
          dispatch_queue_attr_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = *(void *)(a1 + 40);
            if (v16) {
              __int16 v30 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 checkedDescription]);
            }
            else {
              __int16 v30 = @"NO-SSO-TOKEN";
            }
            v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
            *(_DWORD *)buf = 138543874;
            uint64_t v58 = v31;
            __int16 v59 = 2114;
            v60 = v30;
            __int16 v61 = 2114;
            v62 = v29;
            _os_log_error_impl( &dword_0,  v23,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION] {%{public}@} could not obtain SSO Token - personalize ERROR | error:%{ public}@ | autoAssetDescriptor:%{public}@",  buf,  0x20u);
            if (v16) {
          }
            }

          unsigned __int8 v10 = 0;
        }

        else
        {
          -[NSMutableDictionary setSafeObject:forKey:](v6, "setSafeObject:forKey:", v15, @"ssoToken");
          __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = *(void *)(a1 + 40);
            id v27 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([(id)v47[5] checkedDescription]);
            __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
            *(_DWORD *)buf = 138543874;
            uint64_t v58 = v32;
            __int16 v59 = 2114;
            v60 = v27;
            __int16 v61 = 2114;
            v62 = v28;
            _os_log_error_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION] {%{public}@} received Tatsu 3194 error while attempting personalizatio n without SSO Token - NON-FATAL ERROR - retrying woth SSO token | error:%{public}@ | autoAssetDescriptor:%{public}@",  buf,  0x20u);
          }

          __int16 v21 = v47;
          id v43 = (id)v47[5];
          unsigned __int8 v10 = [v5 personalize:v6 error:&v43];
          id v22 = v43;
          id v16 = 0LL;
          v23 = (os_log_s *)v21[5];
          v21[5] = (uint64_t)v22;
        }
      }

      else
      {
        id v15 = 0LL;
        id v16 = 0LL;
        v33 = 0LL;
        unsigned __int8 v10 = 0;
      }
    }

    else
    {
      id v15 = 0LL;
      id v16 = 0LL;
      v33 = 0LL;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    __int16 v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v25 selectCompletionQueue:0]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke_687;
    v34[3] = &unk_34E078;
    unsigned __int8 v41 = v10;
    v40 = &v46;
    id v35 = *(id *)(a1 + 40);
    id v36 = *(id *)(a1 + 32);
    id v37 = *(id *)(a1 + 48);
    id v38 = *(id *)(a1 + 56);
    char v42 = *(_BYTE *)(a1 + 73);
    id v39 = *(id *)(a1 + 64);
    dispatch_async(v26, v34);

    _Block_object_dispose(&v46, 8);
  }

  else
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 selectCompletionQueue:0]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke_2;
    block[3] = &unk_34E050;
    id v53 = (NSMutableDictionary *)*(id *)(a1 + 40);
    id v54 = *(id *)(a1 + 48);
    id v55 = *(id *)(a1 + 32);
    id v56 = *(id *)(a1 + 64);
    dispatch_async(v18, block);

    id v6 = v53;
  }
}

void __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke_2( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"unable to initialize SecureMobileAssetBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    unsigned int v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION] {%{public}@} unable to initialize SecureMobileAssetBundle - personalize ERROR | error:%{public}@ | autoAssetDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void __121__MADAutoAssetSecure_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion___block_invoke_687( uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (*(_BYTE *)(a1 + 80)) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v15;
      __int16 v26 = 2114;
      id v27 = v16;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][AUTO-PERSONALIZATION] {%{public}@} personalize SUCCESS | autoAssetDescriptor:%{public}@",  buf,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    if (*(_BYTE *)(a1 + 81)) {
      uint64_t v17 = 1200LL;
    }
    else {
      uint64_t v17 = 1206LL;
    }
    int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
    +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:",  v17,  6LL,  6LL,  v8,  *(void *)(a1 + 56));
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSString);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    uint64_t v7 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"unable to personalize secure-asset | autoAssetDescriptor:%@",  v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6535LL,  v4,  v2,  v7));

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = (id)objc_claimAutoreleasedReturnValue([v8 checkedDescription]);
      uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v21 = *(void *)(v20 + 40);
      if (v21) {
        id v22 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(v20 + 40) checkedDescription]);
      }
      else {
        id v22 = @"N";
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v18;
      __int16 v26 = 2114;
      id v27 = v19;
      __int16 v28 = 2114;
      v29 = v22;
      __int16 v30 = 2114;
      uint64_t v31 = v23;
      _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION] {%{public}@} unable to personalize - personalize ERROR | error:%{public}@ | underlyingError:%{public}@ | autoAssetDescriptor:%{public}@",  buf,  0x2Au);
      if (v21) {
    }
      }

    +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:persona lizeError:mapToExclaveError:",  *(void *)(a1 + 56),  0LL,  0LL,  7LL,  *(void *)(a1 + 32),  0LL,  0LL,  v8,  0LL);
    if (*(_BYTE *)(a1 + 81)) {
      uint64_t v11 = 1200LL;
    }
    else {
      uint64_t v11 = 1206LL;
    }
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  v11,  6LL,  v12,  *(void *)(a1 + 56),  v8);

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
}

+ (id)commitPrePersonalizedSync:(id)a3 committingSelectors:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:commitPrePersonalizedSync",  v5);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__3;
  uint64_t v32 = __Block_byref_object_dispose__3;
  id v33 = 0LL;
  if (v8)
  {
    if ([v6 count])
    {
      uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 secureProtectionQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __68__MADAutoAssetSecure_commitPrePersonalizedSync_committingSelectors___block_invoke;
      block[3] = &unk_34E0C8;
      dispatch_queue_attr_t v24 = (os_log_s *)v6;
      id v27 = &v28;
      id v25 = v8;
      __int16 v26 = v7;
      dispatch_sync(v9, block);

      __int16 v10 = v24;
    }

    else
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6110LL,  v7,  0LL,  @"no assetSelectors to be committed"));
      uint64_t v17 = (void *)v29[5];
      v29[5] = v16;

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
      __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v21 = (id)objc_claimAutoreleasedReturnValue([(id)v29[5] checkedDescription]);
        id v22 = [v6 count];
        *(_DWORD *)buf = 138543874;
        id v35 = v7;
        __int16 v36 = 2114;
        id v37 = v21;
        __int16 v38 = 2048;
        id v39 = v22;
        _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-COMMIT] {%{public}@} empty asset-selectors ERROR | error:%{public}@ | assetSelectors:%ld",  buf,  0x20u);
      }
    }
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v7,  0LL,  @"no MADAutoAssetSecure instance"));
    __int16 v12 = (void *)v29[5];
    v29[5] = v11;

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue([(id)v29[5] checkedDescription]);
      id v15 = [v6 count];
      *(_DWORD *)buf = 138543874;
      id v35 = v7;
      __int16 v36 = 2114;
      id v37 = v14;
      __int16 v38 = 2048;
      id v39 = v15;
      _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-COMMIT] {%{public}@} no MADAutoAssetSecure instance - commit ERROR | error:%{public}@ | assetSelectors:%ld",  buf,  0x20u);
    }
  }

  id v19 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v19;
}

void __68__MADAutoAssetSecure_commitPrePersonalizedSync_committingSelectors___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v3 + 40);
  +[SecureMobileAssetBundle commitStagedManifestsForSelectors:error:]( &OBJC_CLASS___SecureMobileAssetBundle,  "commitStagedManifestsForSelectors:error:",  v2,  &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) checkedDescription]);
      id v12 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v11;
      __int16 v18 = 2048;
      id v19 = v12;
      _os_log_error_impl( &dword_0,  v5,  OS_LOG_TYPE_ERROR,  "\n[AUTO-SECURE][AUTO-COMMIT] {%{public}@} commit ERROR | error:%{public}@ | assetSelectors:%ld",  buf,  0x20u);
    }

    +[MADAutoAssetHistory recordFailedOperation:fromLayer:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:failingWithError:",  1207LL,  6LL,  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  }

  else
  {
    +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:usageCount:]( MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:usageCount:",  1207,  6,  6,  [*(id *)(a1 + 32) count]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      id v17 = v9;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][AUTO-COMMIT] {%{public}@} commit SUCCESS | assetSelectors:%ld",  buf,  0x16u);
    }
  }

+ (void)commitPrePersonalized:(id)a3 committingSelectors:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:commitPrePersonalized",  v9);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (v11)
  {
    if ([v7 count])
    {
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 secureProtectionQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __75__MADAutoAssetSecure_commitPrePersonalized_committingSelectors_completion___block_invoke_697;
      block[3] = &unk_34E050;
      unsigned int v13 = &v21;
      id v21 = v7;
      id v14 = &v22;
      id v22 = v11;
      uint64_t v15 = (id *)&v23;
      v23 = v10;
      id v24 = v8;
      dispatch_async(v12, block);

      __int16 v16 = v24;
    }

    else
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
      id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 selectCompletionQueue:0]);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = __75__MADAutoAssetSecure_commitPrePersonalized_committingSelectors_completion___block_invoke_696;
      v25[3] = &unk_34E050;
      unsigned int v13 = (id *)&v26;
      __int16 v26 = v10;
      id v14 = &v27;
      id v27 = v11;
      uint64_t v15 = &v28;
      id v28 = v7;
      id v29 = v8;
      dispatch_async(v19, v25);

      __int16 v16 = v29;
    }
  }

  else
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 selectCompletionQueue:0]);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = __75__MADAutoAssetSecure_commitPrePersonalized_committingSelectors_completion___block_invoke;
    v30[3] = &unk_34E028;
    unsigned int v13 = (id *)&v31;
    uint64_t v31 = v10;
    id v14 = &v32;
    id v32 = v7;
    uint64_t v15 = &v33;
    id v33 = v8;
    dispatch_async(v17, v30);
  }
}

void __75__MADAutoAssetSecure_commitPrePersonalized_committingSelectors_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"no MADAutoAssetSecure instance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = [*(id *)(a1 + 40) count];
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n[AUTO-SECURE][AUTO-COMMIT] {%{public}@} commit ERROR | error:%{public}@ | assetSelectors:%ld",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __75__MADAutoAssetSecure_commitPrePersonalized_committingSelectors_completion___block_invoke_696( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6110LL,  *(void *)(a1 + 32),  0LL,  @"no assetSelectors to be committed"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = [*(id *)(a1 + 48) count];
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n[AUTO-SECURE][AUTO-COMMIT] {%{public}@} commit ERROR | error:%{public}@ | assetSelectors:%ld",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void __75__MADAutoAssetSecure_commitPrePersonalized_committingSelectors_completion___block_invoke_697( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v20 = 0LL;
  +[SecureMobileAssetBundle commitStagedManifestsForSelectors:error:]( &OBJC_CLASS___SecureMobileAssetBundle,  "commitStagedManifestsForSelectors:error:",  v2,  &v20);
  id v3 = v20;
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 checkedDescription]);
      id v15 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      id v24 = v14;
      __int16 v25 = 2048;
      id v26 = v15;
      _os_log_error_impl( &dword_0,  v5,  OS_LOG_TYPE_ERROR,  "\n[AUTO-SECURE][AUTO-COMMIT] {%{public}@} commit ERROR | error:%{public}@ | assetSelectors:%ld",  buf,  0x20u);
    }

    +[MADAutoAssetHistory recordFailedOperation:fromLayer:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:failingWithError:",  1207LL,  6LL,  v3);
  }

  else
  {
    +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:usageCount:]( MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:usageCount:",  1207,  6,  6,  [*(id *)(a1 + 32) count]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v8;
      __int16 v23 = 2048;
      id v24 = v9;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][AUTO-COMMIT] {%{public}@} commit SUCCESS | assetSelectors:%ld",  buf,  0x16u);
    }
  }

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 selectCompletionQueue:0]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __75__MADAutoAssetSecure_commitPrePersonalized_committingSelectors_completion___block_invoke_698;
  v16[3] = &unk_34E0F0;
  id v19 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 32);
  id v18 = v3;
  id v12 = v3;
  dispatch_async(v11, v16);
}

uint64_t __75__MADAutoAssetSecure_commitPrePersonalized_committingSelectors_completion___block_invoke_698( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

+ (void)graftDownloaded:(id)a3 graftingDescriptor:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  __int16 v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:graftDownloaded",  v9);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  id v12 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 assetVersion]);
  id v16 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v12,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v13,  v14,  v15);

  if (v11)
  {
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 secureProtectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_703;
    block[3] = &unk_34E190;
    id v18 = &v30;
    id v19 = (id *)&v31;
    id v30 = v7;
    uint64_t v31 = v10;
    id v20 = &v32;
    id v32 = v11;
    id v34 = v8;
    id v33 = v16;
    id v21 = v8;
    uint64_t v22 = v10;
    id v23 = v7;
    dispatch_async(v17, block);

    id v24 = v34;
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    __int16 v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v24 selectCompletionQueue:0]);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke;
    v35[3] = &unk_34E028;
    id v18 = (id *)&v36;
    id v19 = &v37;
    __int16 v36 = v10;
    id v37 = v7;
    id v20 = &v38;
    id v38 = v8;
    id v26 = v8;
    id v27 = v10;
    id v28 = v7;
    dispatch_async(v25, v35);
  }
}

void __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"unable to initialize MADAutoAssetSecure instance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n[AUTO-SECURE][AUTO-GRAFT] {%{public}@} graft ERROR | error:%{public}@ | autoAssetDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_703(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] assetType]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1[4] assetId]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v2,  v3));

  if (a1[4] && v4)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v5, "addObject:", a1[4]);
    id v6 = (const char *)[@"com.apple.MobileAsset.daemon.secureWaitedOperationQueue" UTF8String];
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = dispatch_queue_create(v6, v8);

    if (v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_708;
      block[3] = &unk_34E168;
      id v20 = v4;
      id v21 = a1[4];
      id v22 = a1[7];
      id v23 = a1[5];
      id v24 = a1[6];
      id v25 = a1[8];
      dispatch_async(v9, block);

      id v10 = 0LL;
    }

    else
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  a1[5],  0LL,  @"unable to create waitedOperationQueue"));
    }
  }

  else
  {
    id v11 = a1[5];
    __int16 v12 = objc_alloc(&OBJC_CLASS___NSString);
    id v13 = a1[4];
    if (v13) {
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue([a1[4] summary]);
    }
    else {
      id v14 = @"N";
    }
    id v15 = -[NSString initWithFormat:]( v12,  "initWithFormat:",  @"unable to initialize SecureMobileAssetBundle | autoAssetDescriptor:%@",  v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v11,  0LL,  v15));

    if (v13) {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    }
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 selectCompletionQueue:0]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_2;
    v26[3] = &unk_34E118;
    id v27 = (NSMutableArray *)a1[6];
    id v28 = a1[5];
    id v10 = v16;
    id v29 = v10;
    id v30 = a1[4];
    id v31 = a1[8];
    dispatch_async(v18, v26);

    uint64_t v5 = v27;
  }
}

uint64_t __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_2_cold_1(a1);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_708(uint64_t a1)
{
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0LL;
  uint64_t v2 = *(void **)(a1 + 32);
  id obj = 0LL;
  unsigned int v3 = [v2 beginAccess:0 error:&obj];
  objc_storeStrong(&v26, obj);
  uint64_t v4 = (void *)v22[5];
  if (v4) {
    BOOL v5 = [v4 code] == &stru_68.sectname[1];
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = resultForGraftOrUngraft(v5, 1);
  if (v3 && !v22[5])
  {
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
    +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:",  1202LL,  6LL,  6LL,  v7,  *(void *)(a1 + 48));
  }

  else
  {
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  1202LL,  6LL,  v7,  *(void *)(a1 + 48),  v22[5]);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 selectCompletionQueue:0]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_2_709;
  block[3] = &unk_34E140;
  char v18 = v3;
  id v16 = &v21;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 48);
  uint64_t v17 = v6;
  BOOL v19 = v5;
  id v15 = *(id *)(a1 + 72);
  dispatch_async(v9, block);

  _Block_object_dispose(&v21, 8);
}

void __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_2_709(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (*(_BYTE *)(a1 + 88)) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v15;
      __int16 v25 = 2114;
      id v26 = v16;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][AUTO-GRAFT] {%{public}@} beginAccess SUCCESS | autoAssetDescriptor:%{public}@",  buf,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    dispatch_queue_attr_t v7 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"unable to graft (or mount) to begin access of secure-asset | autoAssetDescriptor:%@",  v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6536LL,  v4,  v2,  v7));

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = (id)objc_claimAutoreleasedReturnValue([v8 checkedDescription]);
      uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v20 = *(void *)(v19 + 40);
      if (v20) {
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(v19 + 40) checkedDescription]);
      }
      else {
        uint64_t v21 = @"N";
      }
      id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
      *(_DWORD *)buf = 138544130;
      uint64_t v24 = v17;
      __int16 v25 = 2114;
      id v26 = v18;
      __int16 v27 = 2114;
      id v28 = v21;
      __int16 v29 = 2114;
      id v30 = v22;
      _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT] {%{public}@} beginAccess ERROR | secureOperationError:%{public}@ | waitedGraftError:%{ public}@ | autoAssetDescriptor:%{public}@",  buf,  0x2Au);
      if (v20) {
    }
      }

    if (*(_BYTE *)(a1 + 89)) {
      id v11 = 0LL;
    }
    else {
      id v11 = v8;
    }
    if (*(_BYTE *)(a1 + 89)) {
      id v12 = v8;
    }
    else {
      id v12 = 0LL;
    }
    +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:persona lizeError:mapToExclaveError:",  *(void *)(a1 + 56),  0LL,  0LL,  *(void *)(a1 + 80),  *(void *)(a1 + 32),  v11,  v12,  0LL,  0LL);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

+ (id)graftDownloadedSync:(id)a3 graftingDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  dispatch_queue_attr_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:graftDownloadedSync",  v6);

  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  uint64_t v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 assetSpecifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 assetVersion]);
  id v13 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v9,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v10,  v11,  v12);

  if (v8)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v14,  v15));

    if (!v16)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v7,  0LL,  @"unable to initialize SecureMobileAssetBundle"));
LABEL_20:

      goto LABEL_21;
    }

    id v40 = 0LL;
    unsigned __int8 v17 = [v16 beginAccess:0 error:&v40];
    id v18 = v40;
    uint64_t v19 = v18;
    if (v18)
    {
      BOOL v20 = [v18 code] == &stru_68.sectname[1];
      uint64_t v21 = resultForGraftOrUngraft(v20, 1);
    }

    else
    {
      BOOL v20 = 1;
      uint64_t v21 = resultForGraftOrUngraft(1, 1);
      if ((v17 & 1) != 0)
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
          *(_DWORD *)buf = 138543618;
          char v42 = v7;
          __int16 v43 = 2114;
          id v44 = v25;
          _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][AUTO-GRAFT] {%{public}@} graft|mount SUCCESS | autoAssetDescriptor:%{public}@",  buf,  0x16u);
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
        +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:",  1202LL,  6LL,  6LL,  v26,  v13);
        id v22 = 0LL;
        goto LABEL_19;
      }
    }

    uint64_t v39 = v21;
    __int16 v27 = objc_alloc(&OBJC_CLASS___NSString);
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    __int16 v29 = -[NSString initWithFormat:]( v27,  "initWithFormat:",  @"unable to graft (or mount) to begin access to secure-asset | autoAssetDescriptor:%@",  v28);
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6536LL,  v7,  v19,  v29));

    id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 logger]);
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v35 = (id)objc_claimAutoreleasedReturnValue([v22 checkedDescription]);
      if (v19) {
        id v38 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 checkedDescription]);
      }
      else {
        id v38 = @"N";
      }
      uint64_t v36 = objc_claimAutoreleasedReturnValue([v5 summary]);
      *(_DWORD *)buf = 138544130;
      char v42 = v7;
      __int16 v43 = 2114;
      id v44 = v35;
      __int16 v45 = 2114;
      uint64_t v46 = v38;
      __int16 v47 = 2114;
      id v37 = (void *)v36;
      uint64_t v48 = v36;
      _os_log_error_impl( &dword_0,  v31,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT] {%{public}@} unable to graft (or mount) | secureOperationError:%{public}@ | waitedGraf tError:%{public}@ | autoAssetDescriptor:%{public}@",  buf,  0x2Au);
      if (v19) {
    }
      }

    if (v20) {
      id v32 = 0LL;
    }
    else {
      id v32 = v22;
    }
    if (v20) {
      id v33 = v22;
    }
    else {
      id v33 = 0LL;
    }
    +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:persona lizeError:mapToExclaveError:",  v13,  0LL,  0LL,  v39,  v7,  v32,  v33,  0LL,  0LL);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 assetId]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  1202LL,  6LL,  v26,  v13,  v19);
LABEL_19:

    goto LABEL_20;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v7,  0LL,  @"unable to initialize MADAutoAssetSecure instance"));
LABEL_21:

  return v22;
}

+ (void)personalizeGraftDownloaded:(id)a3 forDescriptor:(id)a4 allowingNetwork:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:personalizeGraftDownloaded",  v9);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (v13)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_718;
    v28[3] = &unk_34E1E0;
    id v14 = v9;
    uint64_t v15 = &v30;
    id v29 = v9;
    id v30 = v10;
    id v16 = &v31;
    id v31 = v13;
    id v32 = v12;
    id v33 = v11;
    id v17 = v11;
    id v18 = v12;
    id v19 = v10;
    BOOL v20 = &v29;
    BOOL v21 = v7;
    id v22 = v14;
    +[MADAutoAssetSecure personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:]( &OBJC_CLASS___MADAutoAssetSecure,  "personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:",  v29,  v19,  v21,  1LL,  v28);

    uint64_t v23 = v32;
  }

  else
  {
    uint64_t v23 = (NSString *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString selectCompletionQueue:](v23, "selectCompletionQueue:", 0LL));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke;
    block[3] = &unk_34E028;
    id v22 = v9;
    BOOL v20 = (id *)&v35;
    uint64_t v15 = &v36;
    id v35 = v12;
    id v36 = v10;
    id v16 = &v37;
    id v37 = v11;
    id v25 = v11;
    id v26 = v12;
    id v27 = v10;
    dispatch_async(v24, block);
  }
}

void __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"no MADAutoAssetSecure instance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT] {%{public}@} personalize+graft|mount ERROR | error:%{public}@ | autoAssetDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_718( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 selectCompletionQueue:0]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_721;
    block[3] = &unk_34E118;
    BOOL v7 = &v14;
    id v14 = *(id *)(a1 + 48);
    int v8 = &v15;
    id v15 = *(id *)(a1 + 56);
    uint64_t v9 = &v16;
    id v16 = v4;
    __int16 v10 = &v17;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 64);
    dispatch_async(v6, block);
  }

  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_2;
    v19[3] = &unk_34E1B8;
    BOOL v7 = &v20;
    id v20 = *(id *)(a1 + 48);
    int v8 = &v21;
    id v21 = *(id *)(a1 + 56);
    uint64_t v9 = &v22;
    id v22 = *(id *)(a1 + 40);
    __int16 v10 = &v23;
    id v23 = *(id *)(a1 + 64);
    +[MADAutoAssetSecure graftDownloaded:graftingDescriptor:completion:]( &OBJC_CLASS___MADAutoAssetSecure,  "graftDownloaded:graftingDescriptor:completion:",  v11,  v12,  v19);
  }
}

void __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_2( id *a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 selectCompletionQueue:0]);
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_719;
    v11[3] = &unk_34E118;
    v11[4] = a1[4];
    v11[5] = a1[5];
    v11[6] = v4;
    BOOL v7 = (id *)v11;
    int v8 = &v12;
    id v12 = a1[6];
    uint64_t v9 = &v13;
    id v13 = a1[7];
  }

  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_3;
    v14[3] = &unk_34E190;
    v14[4] = a1[4];
    v14[5] = a1[5];
    v14[6] = a1[6];
    BOOL v7 = (id *)v14;
    int v8 = &v16;
    id v10 = a1[7];
    uint64_t v9 = (id *)&v15;
    uint64_t v15 = 0LL;
    id v16 = v10;
  }

  dispatch_async(v6, v7);
}

uint64_t __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_3( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][AUTO-GRAFT] {%{public}@} personalize+graft|mount SUCCESS | autoAssetDescriptor:%{public}@",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

uint64_t __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_719( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_719_cold_1(a1);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

uint64_t __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_721( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_719_cold_1(a1);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

+ (BOOL)ungraft:(id)a3 forDescriptor:(id)a4 ungraftingError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  __int16 v9 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@:ungraft", v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  uint64_t v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 assetVersion]);
  id v15 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v11,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v12,  v13,  v14);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 assetId]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v16,  v17));

  if (v7 && v18)
  {
    __int16 v47 = a5;
    uint64_t v48 = v9;
    id v19 = v10;
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v20, "addObject:", v7);
    id v49 = 0LL;
    unsigned __int8 v21 = [v18 endAccess:0 error:&v49];
    id v22 = v49;
    id v23 = v22;
    if (v22)
    {
      BOOL v24 = [v22 code] == &stru_68.sectname[2];
      uint64_t v25 = resultForGraftOrUngraft(v24, 1);
    }

    else
    {
      BOOL v24 = 1;
      uint64_t v25 = resultForGraftOrUngraft(1, 1);
      if ((v21 & 1) != 0)
      {
        id v10 = v19;
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v19 logger]);
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 summary]);
          *(_DWORD *)buf = 138543618;
          id v51 = v48;
          __int16 v52 = 2114;
          id v53 = v30;
          _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-GRAFT-REMOVE] {%{public}@} ungraft|unmount endAccess SUCCESS | autoAssetDescriptor:%{public}@",  buf,  0x16u);
        }

        id v31 = (void *)objc_claimAutoreleasedReturnValue([v7 assetId]);
        +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:",  1203LL,  6LL,  6LL,  v31,  v15);
        goto LABEL_20;
      }
    }

    uint64_t v32 = v25;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v19 logger]);
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 oslog]);

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      if (v23) {
        __int16 v43 = (const __CFString *)objc_claimAutoreleasedReturnValue([v23 checkedDescription]);
      }
      else {
        __int16 v43 = @"N";
      }
      uint64_t v44 = objc_claimAutoreleasedReturnValue([v7 summary]);
      *(_DWORD *)buf = 138543874;
      id v51 = v48;
      __int16 v52 = 2114;
      uint64_t v46 = (__CFString *)v43;
      id v53 = v43;
      __int16 v54 = 2114;
      __int16 v45 = (void *)v44;
      uint64_t v55 = v44;
      _os_log_error_impl( &dword_0,  v34,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT-REMOVE] {%{public}@} ungraft|unmount endAccess ERROR | error:%{public}@ | autoAssetDesc riptor:%{public}@",  buf,  0x20u);
      if (v23) {
    }
      }

    if (v24) {
      id v35 = 0LL;
    }
    else {
      id v35 = v23;
    }
    if (v24) {
      id v36 = v23;
    }
    else {
      id v36 = 0LL;
    }
    +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:persona lizeError:mapToExclaveError:",  v15,  0LL,  0LL,  v32,  v48,  v35,  v36,  0LL,  0LL);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v7 assetId]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  1203LL,  6LL,  v31,  v15,  v23);
    a5 = v47;
    id v10 = v19;
LABEL_20:

    __int16 v9 = v48;
    goto LABEL_21;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v26 oslog]);

  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
  {
    id v27 = v7 ? (__CFString *)objc_claimAutoreleasedReturnValue([v7 summary]) : @"N";
    *(_DWORD *)buf = 138543618;
    id v51 = v9;
    __int16 v52 = 2114;
    id v53 = v27;
    _os_log_error_impl( &dword_0,  (os_log_t)v20,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT-REMOVE] {%{public}@} ungraft|unmount unable to initialize SecureMobileAssetBundle | autoA ssetDescriptor:%{public}@",  buf,  0x16u);
    if (v7) {
  }
    }

+ (void)personalizeGraftSetDownloaded:(id)a3 forSetDescriptor:(id)a4 allowingNetwork:(BOOL)a5 withAutoAssetDescriptors:(id)a6 completion:(id)a7
{
}

+ (void)personalizeSetDownloaded:(id)a3 forSetDescriptor:(id)a4 allowingNetwork:(BOOL)a5 withAutoAssetDescriptors:(id)a6 completion:(id)a7
{
}

+ (void)personalizeSetDownloaded:(id)a3 forSetDescriptor:(id)a4 shouldGraft:(BOOL)a5 allowingNetwork:(BOOL)a6 withAutoAssetDescriptors:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:personalizeGraftSetDownloaded",  v13);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (v18)
  {
    BOOL v34 = a6;
    BOOL v35 = a5;
    id v38 = v16;
    uint64_t v39 = v17;
    id v37 = v14;
    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v36 = v15;
    id v21 = v15;
    id v22 = [v21 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v53 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
          if (v26
            && +[MADAutoAssetSecure doesDescriptorInvolvePersonalization:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "doesDescriptorInvolvePersonalization:forDescriptor:",  v13,  *(void *)(*((void *)&v52 + 1) + 8LL * (void)i)))
          {
            -[NSMutableArray addObject:](v19, "addObject:", v26);
          }

          if (+[MADAutoAssetSecure doesDescriptorInvolveGrafting:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "doesDescriptorInvolveGrafting:forDescriptor:",  v13,  v26))
          {
            -[NSMutableArray addObject:](v20, "addObject:", v26);
          }
        }

        id v23 = [v21 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }

      while (v23);
    }

    id v16 = v38;
    if (-[NSMutableArray count](v19, "count") || -[NSMutableArray count](v20, "count"))
    {
      id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 secureProtectionQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke_728;
      block[3] = &unk_34E230;
      id v28 = (id *)&v44;
      uint64_t v44 = v19;
      id v29 = &v45;
      id v45 = v18;
      uint64_t v46 = v39;
      __int16 v47 = v20;
      BOOL v50 = v34;
      id v14 = v37;
      id v48 = v37;
      id v49 = v38;
      BOOL v51 = v35;
      dispatch_async(v27, block);

      id v30 = v46;
    }

    else
    {
      id v30 = (NSString *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
      id v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString selectCompletionQueue:](v30, "selectCompletionQueue:", 0LL));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke_2;
      v40[3] = &unk_34E208;
      id v28 = &v42;
      id v42 = v38;
      id v29 = &v41;
      id v14 = v37;
      id v16 = v38;
      id v41 = v37;
      dispatch_async(v33, v40);
    }

    id v15 = v36;
    id v17 = v39;
  }

  else
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    uint64_t v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v31 selectCompletionQueue:0]);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke;
    v56[3] = &unk_34E028;
    v57 = v17;
    id v58 = v14;
    id v59 = v16;
    dispatch_async(v32, v56);

    id v19 = v57;
  }
}

void __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"no MADAutoAssetSecure instance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft set ERROR | error:%{public}@ | setDes criptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke_728( uint64_t a1)
{
  id v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v51 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 assetId]);
        __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v8,  v9));

        if (v10)
        {
        }

        else
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
          __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = *(void *)(a1 + 48);
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
            *(_DWORD *)buf = 138543618;
            uint64_t v56 = v34;
            __int16 v57 = 2114;
            id v58 = v13;
            _os_log_error_impl( &dword_0,  v12,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft set unable to initialize Secu reMobileAssetBundle | potentialPersonalizationDescriptor:%{public}@",  buf,  0x16u);
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }

    while (v4);
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v14 = *(id *)(a1 + 56);
  id v15 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetType]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 assetId]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v20,  v21));

        if (v22)
        {
          unsigned __int8 v23 = [v22 isAccessible];
          if (v19 && (v23 & 1) == 0) {
            -[NSMutableArray addObject:](v37, "addObject:", v19);
          }
        }

        else
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = *(void *)(a1 + 48);
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v19 summary]);
            *(_DWORD *)buf = 138543618;
            uint64_t v56 = v35;
            __int16 v57 = 2114;
            id v58 = v26;
            _os_log_error_impl( &dword_0,  v25,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft set unable to initialize Secu reMobileAssetBundle | potentialGraftDescriptor:%{public}@",  buf,  0x16u);
          }
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }

    while (v16);
  }

  if (!-[NSMutableArray count](v36, "count") && !-[NSMutableArray count](v37, "count"))
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v32 selectCompletionQueue:0]);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke_732;
    v38[3] = &unk_34E208;
    id v40 = *(id *)(a1 + 72);
    id v39 = *(id *)(a1 + 64);
    dispatch_async(v33, v38);

    id v31 = v40;
    goto LABEL_37;
  }

  id v27 = -[NSMutableArray count](v36, "count");
  int v28 = *(unsigned __int8 *)(a1 + 80);
  if (v27)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      int v28 = 1;
      goto LABEL_34;
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v29 selectCompletionQueue:0]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke_729;
    block[3] = &unk_34E050;
    id v42 = *(id *)(a1 + 48);
    id v43 = *(id *)(a1 + 40);
    id v44 = *(id *)(a1 + 64);
    id v45 = *(id *)(a1 + 72);
    dispatch_async(v30, block);

    id v31 = v42;
LABEL_37:

    goto LABEL_38;
  }

void __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke_729( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6533LL,  *(void *)(a1 + 32),  0LL,  @"personalization required when network communication not allowed"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft set ERROR | error:%{public}@ | setDes criptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

uint64_t __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke_732( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

uint64_t __128__MADAutoAssetSecure_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

+ (BOOL)isPersonalizationRequired:(id)a3 forSetDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:isPersonalizationRequired",  v5);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (v25)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 latestDowloadedAtomicInstanceEntries]);
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v9)
    {
      unsigned __int8 v23 = v7;
      uint64_t v24 = v6;
      id v22 = v5;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v8);
          }
          __int16 v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          if (v12)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v26 + 1) + 8 * (void)i) fullAssetSelector]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 assetID]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v14,  v15));

            if (v16)
            {
              if ([v16 isSecureMobileAsset]
                && ![v16 isPersonalized])
              {

                LOBYTE(v9) = 1;
                goto LABEL_22;
              }
            }

            else
            {
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v25 logger]);
              id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v24 summary]);
                *(_DWORD *)buf = 138543618;
                id v31 = v23;
                __int16 v32 = 2114;
                id v33 = v19;
                _os_log_error_impl( &dword_0,  v18,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} unable to initialize SecureMobileAssetBundle | setDescriptor:%{public}@",  buf,  0x16u);
              }
            }
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }

      while (v9);
LABEL_22:
      id v5 = v22;
      id v7 = v23;
      id v6 = v24;
    }
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isPersonalizationRequired:forSetDescriptor:].cold.1();
    }
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

+ (BOOL)isPersonalizationOrGraftingRequired:(id)a3 forSetDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v23 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:isPersonalizationOrGraftingRequired",  v5);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  if (v24)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 latestDowloadedAtomicInstanceEntries]);
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v8)
    {
      id v22 = v6;
      id v21 = v5;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          if (v11)
          {
            __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v25 + 1) + 8 * (void)i) fullAssetSelector]);
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetType]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 assetID]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v13,  v14));

            if (v15)
            {
              if ([v15 isSecureMobileAsset]
                && ([v15 isPersonalized] & 1) == 0
                && ![v15 isAccessible])
              {

                LOBYTE(v8) = 1;
                goto LABEL_23;
              }
            }

            else
            {
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v24 logger]);
              uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                id v18 = (void *)objc_claimAutoreleasedReturnValue([v22 summary]);
                *(_DWORD *)buf = 138543618;
                id v30 = v23;
                __int16 v31 = 2114;
                __int16 v32 = v18;
                _os_log_error_impl( &dword_0,  v17,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} unable to initialize SecureMobileAssetBundle | setDescriptor:%{public}@",  buf,  0x16u);
              }
            }
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }

      while (v8);
LABEL_23:
      id v5 = v21;
      id v6 = v22;
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure isPersonalizationRequired:forSetDescriptor:].cold.1();
    }
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

+ (BOOL)ungraftAll:(id)a3 forSetDescriptor:(id)a4 withAutoAssetDescriptors:(id)a5 ungraftingError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@:ungraftAll", v9);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  __int128 v55 = v12;
  uint64_t v56 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v13)
  {
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v14 = (NSMutableArray *)v11;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v62,  v75,  16LL);
    BOOL v16 = v15 != 0LL;
    if (!v15)
    {
LABEL_38:

      goto LABEL_39;
    }

    id v17 = v15;
    BOOL v53 = v15 != 0LL;
    __int128 v54 = a6;
    char v18 = 0;
    uint64_t v19 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v63 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)i);
        if (v21
          && +[MADAutoAssetSecure isSecureAsset:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isSecureAsset:forDescriptor:",  v9,  *(void *)(*((void *)&v62 + 1) + 8LL * (void)i)))
        {
          -[NSMutableArray addObject:](v56, "addObject:", v21);
          char v18 = 1;
        }
      }

      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v62,  v75,  16LL);
    }

    while (v17);

    if ((v18 & 1) != 0)
    {
      __int128 v52 = v13;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id v14 = v56;
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v58,  v74,  16LL);
      if (v22)
      {
        id v23 = v22;
        id v49 = v11;
        id v50 = v10;
        id v51 = v9;
        uint64_t v24 = *(void *)v59;
        a6 = v54;
        __int16 v12 = v55;
        do
        {
          __int128 v25 = 0LL;
          do
          {
            if (*(void *)v59 != v24) {
              objc_enumerationMutation(v14);
            }
            __int128 v26 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v25);
            __int128 v27 = objc_autoreleasePoolPush();
            id v57 = 0LL;
            unsigned int v28 = +[MADAutoAssetSecure ungraft:forDescriptor:ungraftingError:]( &OBJC_CLASS___MADAutoAssetSecure,  "ungraft:forDescriptor:ungraftingError:",  v12,  v26,  &v57);
            id v29 = v57;
            if (a6 || (v28 & 1) == 0)
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
              __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v29 checkedDescription]);
                uint64_t v33 = objc_claimAutoreleasedReturnValue([v26 summary]);
                uint64_t v34 = (void *)v33;
                *(_DWORD *)buf = 138544130;
                uint64_t v35 = @"N";
                if (v28) {
                  uint64_t v35 = @"Y";
                }
                __int128 v67 = v55;
                __int16 v68 = 2114;
                uint64_t v69 = (uint64_t)v32;
                __int16 v70 = 2114;
                uint64_t v71 = v33;
                __int16 v72 = 2114;
                __int16 v73 = v35;
                _os_log_error_impl( &dword_0,  v31,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT-REMOVE-ALL] {%{public}@} endAccess ERROR | error:%{public}@ | ungraftDescript or:%{public}@ | success:%{public}@",  buf,  0x2Au);
              }

              a6 = v54;
              __int16 v12 = v55;
            }

            objc_autoreleasePoolPop(v27);
            __int128 v25 = (char *)v25 + 1;
          }

          while (v23 != v25);
          id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v58,  v74,  16LL);
          id v23 = v36;
        }

        while (v36);
        id v10 = v50;
        id v9 = v51;
        id v11 = v49;
      }

      else
      {
        a6 = v54;
        __int16 v12 = v55;
      }

      id v13 = v52;
      BOOL v16 = v53;
      goto LABEL_38;
    }

    BOOL v16 = 0;
    a6 = v54;
LABEL_35:
    __int16 v12 = v55;
LABEL_39:
    id v41 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 oslog]);

    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = objc_claimAutoreleasedReturnValue([v10 summary]);
      id v43 = (void *)v42;
      id v44 = @"N";
      *(_DWORD *)buf = 138543874;
      __int128 v67 = v12;
      __int16 v68 = 2114;
      if (v16) {
        id v44 = @"Y";
      }
      uint64_t v69 = v42;
      __int16 v70 = 2114;
      uint64_t v71 = (uint64_t)v44;
      _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-GRAFT-REMOVE-ALL] {%{public}@} endAccess SUCCESS | setDescriptor:%{public}@ | ungraftingRequired:%{public}@",  buf,  0x20u);
    }

    id v38 = 0LL;
    goto LABEL_44;
  }

  uint64_t v37 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v12,  0LL,  @"no MADAutoAssetSecure instance"));
  if (!v37)
  {
    BOOL v16 = 0;
    goto LABEL_35;
  }

  id v38 = (void *)v37;
  id v39 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 oslog]);

  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v38 checkedDescription]);
    __int128 v47 = a6;
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
    *(_DWORD *)buf = 138543874;
    __int128 v67 = v55;
    __int16 v68 = 2114;
    uint64_t v69 = (uint64_t)v46;
    __int16 v70 = 2114;
    uint64_t v71 = (uint64_t)v48;
    _os_log_error_impl( &dword_0,  v40,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT-REMOVE-ALL] {%{public}@} endAccess ERROR | error:%{public}@ | setDescriptor:%{public}@",  buf,  0x20u);

    a6 = v47;
  }

  LOBYTE(v16) = 0;
LABEL_44:

  if (a6) {
    *a6 = v38;
  }

  return v16;
}

+ (void)mapToExclave:(id)a3 forDescriptor:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@:mapToExclave", v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetSecure autoAssetSecure](&OBJC_CLASS___MADAutoAssetSecure, "autoAssetSecure"));
  __int16 v12 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 assetVersion]);
  id v32 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v12,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v13,  v14,  v15);

  if (v11)
  {
    BOOL v16 = v8;
    id v17 = (const char *)[@"com.apple.MobileAsset.daemon.secureWaitedOperationQueue" UTF8String];
    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = dispatch_queue_create(v17, v19);

    if (v20)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke_738;
      block[3] = &unk_34E190;
      __int16 v31 = &v34;
      id v34 = v7;
      uint64_t v21 = v10;
      id v22 = (id *)&v35;
      id v23 = v21;
      uint64_t v35 = v21;
      uint64_t v24 = &v36;
      id v36 = v11;
      __int128 v25 = &v38;
      id v38 = v16;
      __int128 v26 = v32;
      id v37 = v32;
      dispatch_async(v20, block);
      __int128 v27 = v37;
    }

    else
    {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
      id v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v27 selectCompletionQueue:0]);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke_737;
      v39[3] = &unk_34E050;
      __int16 v31 = (id *)&v40;
      id v23 = v10;
      id v40 = v10;
      id v22 = &v41;
      id v41 = v11;
      uint64_t v24 = &v42;
      id v42 = v7;
      __int128 v25 = &v43;
      id v43 = v16;
      dispatch_async(v30, v39);

      __int128 v26 = v32;
    }

    id v10 = v23;
  }

  else
  {
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v28 selectCompletionQueue:0]);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke;
    v44[3] = &unk_34E028;
    id v45 = v10;
    id v46 = v7;
    id v47 = v8;
    dispatch_async(v29, v44);

    id v20 = (dispatch_queue_s *)v45;
    BOOL v16 = v8;
    __int128 v26 = v32;
  }
}

void __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"no MADAutoAssetSecure instance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][MAP-TO-EXCLAVE] {%{public}@} map-to-exclave ERROR | error:%{public}@ | autoAssetDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke_737(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"unable to allocate waitedOperationQueue"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][MAP-TO-EXCLAVE] {%{public}@} map-to-exclave ERROR | mapToExclaveError:%{public}@ | autoAssetDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke_738(id *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] assetType]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1[4] assetId]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v2,  v3));

  if (v4)
  {
    v21[0] = 0LL;
    v21[1] = v21;
    v21[2] = 0x3032000000LL;
    v21[3] = __Block_byref_object_copy__3;
    v21[4] = __Block_byref_object_dispose__3;
    id v22 = 0LL;
    id obj = 0LL;
    unsigned __int8 v5 = [v4 mapToExclaves:&obj];
    objc_storeStrong(&v22, obj);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 selectCompletionQueue:0]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke_739;
    block[3] = &unk_34E258;
    unsigned __int8 v19 = v5;
    id v17 = v21;
    id v12 = a1[5];
    id v13 = a1[4];
    id v14 = a1[6];
    id v15 = a1[7];
    uint64_t v18 = 1LL;
    id v16 = a1[8];
    dispatch_async(v7, block);

    _Block_object_dispose(v21, 8);
    id v8 = v22;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    __int16 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 selectCompletionQueue:0]);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke_2;
    v23[3] = &unk_34E050;
    id v24 = a1[5];
    id v25 = a1[6];
    id v26 = a1[4];
    id v27 = a1[8];
    dispatch_async(v10, v23);

    id v8 = v24;
  }
}

void __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"unable to initialize SecureMobileAssetBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][MAP-TO-EXCLAVE] {%{public}@} map-to-exclave ERROR | error:%{public}@ | autoAssetDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void __60__MADAutoAssetSecure_mapToExclave_forDescriptor_completion___block_invoke_739(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (*(_BYTE *)(a1 + 88)) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][MAP-TO-EXCLAVE] {%{public}@} map-to-exclave SUCCESS | autoAssetDescriptor:%{public}@",  buf,  0x16u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
    +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:",  1204LL,  6LL,  6LL,  v16,  *(void *)(a1 + 56));

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSString);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    id v7 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"unable to map secure-asset to exclave environment | autoAssetDescriptor:%@",  v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6537LL,  v4,  v2,  v7));

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = (id)objc_claimAutoreleasedReturnValue([v8 checkedDescription]);
      uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v20 = *(void *)(v19 + 40);
      if (v20) {
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(v19 + 40) checkedDescription]);
      }
      else {
        uint64_t v21 = @"N";
      }
      id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
      *(_DWORD *)buf = 138544130;
      uint64_t v24 = v17;
      __int16 v25 = 2114;
      id v26 = v18;
      __int16 v27 = 2114;
      unsigned int v28 = v21;
      __int16 v29 = 2114;
      id v30 = v22;
      _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][MAP-TO-EXCLAVE] {%{public}@} map-to-exclave ERROR| secureOperationError:%{public}@ | mapToExclaveE rror:%{public}@ | autoAssetDescriptor:%{public}@ ",  buf,  0x2Au);
      if (v20) {
    }
      }

    +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:persona lizeError:mapToExclaveError:",  *(void *)(a1 + 56),  0LL,  0LL,  *(void *)(a1 + 80),  *(void *)(a1 + 32),  0LL,  0LL,  0LL,  v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  1204LL,  6LL,  v11,  *(void *)(a1 + 56),  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

+ (void)ungraftIfNotAccessible:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  uint64_t v4 = -[SecureMobileAssetBundle initWithPath:](objc_alloc(&OBJC_CLASS___SecureMobileAssetBundle), "initWithPath:", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetSecure ungraftIfNotAccessible:].cold.1((uint64_t)v3, v7);
    }
    goto LABEL_28;
  }

  if (-[SecureMobileAssetBundle isSecureMobileAsset](v4, "isSecureMobileAsset"))
  {
    if (-[SecureMobileAssetBundle isAccessible](v5, "isAccessible"))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v41 = v3;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][AUTO-GRAFT-REMOVE] {ungraftIfNotAccessible} remains accessible | assetPath:%{public}@",  buf,  0xCu);
      }

      goto LABEL_28;
    }

    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetValues](v5, "assetValues"));
    id v9 = -[os_log_s safeObjectForKey:ofClass:]( v7,  "safeObjectForKey:ofClass:",  @"AssetType",  objc_opt_class(&OBJC_CLASS___NSString));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!v10
      || (id v11 = (void *)v10,
          id v12 = -[os_log_s safeObjectForKey:ofClass:]( v7,  "safeObjectForKey:ofClass:",  @"AssetSpecifier",  objc_opt_class(&OBJC_CLASS___NSString)),  v13 = (void *)objc_claimAutoreleasedReturnValue(v12),  v13,  v11,  !v13))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetSecure ungraftIfNotAccessible:].cold.2(v17, v24, v25, v26, v27, v28, v29, v30);
      }
      goto LABEL_27;
    }

    uint64_t v14 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", @"AssetType"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", @"AssetSpecifier"));
    uint64_t v17 = (os_log_s *)-[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( v14,  "initForAssetType:withAssetSpecifier:",  v15,  v16);

    id v39 = 0LL;
    unsigned int v18 = -[SecureMobileAssetBundle endAccess:error:](v5, "endAccess:error:", 0LL, &v39);
    id v19 = v39;
    uint64_t v20 = v19;
    if (v19)
    {
      BOOL v21 = [v19 code] == &stru_68.sectname[2];
      uint64_t v22 = resultForGraftOrUngraft(v21, 0);
    }

    else
    {
      BOOL v21 = 1;
      uint64_t v22 = resultForGraftOrUngraft(1, 0);
      if (v18)
      {
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 oslog]);

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v41 = v3;
          _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "\n[AUTO-SECURE][AUTO-GRAFT-REMOVE] {ungraftIfNotAccessible} endAccess SUCCESS | assetPath:%{public}@",  buf,  0xCu);
        }

        +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:forAssetID:withSelector:",  1203LL,  6LL,  6LL,  @"N/A",  v17);
        goto LABEL_26;
      }
    }

    uint64_t v33 = v22;
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v38 = v20 ? (__CFString *)objc_claimAutoreleasedReturnValue([v20 checkedDescription]) : @"N";
      *(_DWORD *)buf = 138543618;
      id v41 = v38;
      __int16 v42 = 2114;
      id v43 = v3;
      _os_log_error_impl( &dword_0,  v35,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT-REMOVE] {ungraftIfNotAccessible} endAccess ERROR | error:%{public}@ | assetPath:%{public}@",  buf,  0x16u);
      if (v20) {
    }
      }

    if (v21) {
      id v36 = 0LL;
    }
    else {
      id v36 = v20;
    }
    if (v21) {
      id v37 = v20;
    }
    else {
      id v37 = 0LL;
    }
    +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:persona lizeError:mapToExclaveError:",  v17,  0LL,  0LL,  v33,  @"N/A",  v36,  v37,  0LL,  0LL);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  1203LL,  6LL,  @"N/A",  v17,  v20);
LABEL_26:

LABEL_27:
LABEL_28:
  }
}

+ (id)orphanedProcessLifeLocks:(id)a3
{
  return 0LL;
}

- (void)_personalizeGraftSetDownloaded:(id)a3 forSetDescriptor:(id)a4 allowingNetwork:(BOOL)a5 requiringPersonalization:(id)a6 requiringGrafting:(id)a7 shouldGraft:(BOOL)a8 completion:(id)a9
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a3;
  uint64_t v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:_personalizeGraftSetDownloaded",  v19);

  BOOL v21 = (const char *)[@"com.apple.MobileAsset.daemon.secureWaitedOperationQueue" UTF8String];
  dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = dispatch_queue_create(v21, v23);

  if (v24)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __152__MADAutoAssetSecure__personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_requiringPersonalization_requiringGrafting_shouldGraft_completion___block_invoke_746;
    block[3] = &unk_34E230;
    uint64_t v25 = &v36;
    id v36 = v16;
    id v37 = v20;
    BOOL v42 = a5;
    id v38 = self;
    id v39 = v15;
    BOOL v43 = a8;
    id v40 = v17;
    id v41 = v18;
    id v26 = v18;
    id v27 = v15;
    uint64_t v28 = v20;
    dispatch_async(v24, block);

    uint64_t v29 = v37;
  }

  else
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    __int16 v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v30 selectCompletionQueue:0]);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = __152__MADAutoAssetSecure__personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_requiringPersonalization_requiringGrafting_shouldGraft_completion___block_invoke;
    v44[3] = &unk_34E050;
    uint64_t v25 = (id *)v45;
    v45[0] = v20;
    v45[1] = self;
    id v46 = (NSString *)v15;
    id v47 = v18;
    id v32 = v18;
    id v33 = v15;
    id v34 = v20;
    dispatch_async(v31, v44);

    uint64_t v29 = v46;
  }
}

void __152__MADAutoAssetSecure__personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_requiringPersonalization_requiringGrafting_shouldGraft_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  *(void *)(a1 + 32),  0LL,  @"unable to allocate waitedOperationQueue"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set ERROR | error:%{public}@ | setDescriptor:%{public}@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void __152__MADAutoAssetSecure__personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_requiringPersonalization_requiringGrafting_shouldGraft_completion___block_invoke_746( uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v180 = 0u;
  __int128 v181 = 0u;
  __int128 v182 = 0u;
  __int128 v183 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v166 = a1;
  id v150 = [v3 countByEnumeratingWithState:&v180 objects:v193 count:16];
  if (!v150)
  {

    id v4 = 0LL;
    goto LABEL_50;
  }

  id obj = v3;
  id v4 = 0LL;
  id v5 = 0LL;
  uint64_t v151 = *(void *)v181;
  uint64_t v147 = kAMAuthInstallErrorDomain;
  v145 = v2;
  do
  {
    id v6 = 0LL;
    do
    {
      v162 = v5;
      if (*(void *)v181 != v151) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v180 + 1) + 8LL * (void)v6);
      int v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 assetVersion]);
      id v12 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v8,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v9,  v10,  v11);

      if (!v12)
      {
        uint64_t v62 = *(void *)(v166 + 40);
        __int128 v63 = objc_alloc(&OBJC_CLASS___NSString);
        __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
        __int128 v65 = -[NSString initWithFormat:]( v63,  "initWithFormat:",  @"unable to initialize autoAssetSelector (for personalization) | nextAutoAssetDescriptor:%@",  v64);
        uint64_t v66 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v62,  0LL,  v65));

        id v67 = v7;
LABEL_47:
        id v5 = (id)v66;

        id v4 = v67;
LABEL_48:
        uint64_t v2 = v145;
        goto LABEL_49;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 assetId]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v13,  v14));

      if (!v15)
      {
        uint64_t v68 = *(void *)(v166 + 40);
        uint64_t v69 = objc_alloc(&OBJC_CLASS___NSString);
        __int16 v70 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
        uint64_t v71 = -[NSString initWithFormat:]( v69,  "initWithFormat:",  @"unable to initialize SecureMobileAssetBundle (for personalization) | nextAutoAssetDescriptor:%@",  v70);
        uint64_t v66 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v68,  0LL,  v71));

        id v67 = v7;
        id v4 = v12;
        goto LABEL_47;
      }

      id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v17 = v166;
      id v18 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  *(unsigned __int8 *)(v166 + 80));
      id v19 = -[NSNumber initWithBool:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithBool:", 1LL);
      v158 = v18;
      -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v18,  @"AllowNetworkCommunication");
      v156 = v19;
      -[NSMutableDictionary setSafeObject:forKey:](v16, "setSafeObject:forKey:", v19, @"stageManifest");
      id v179 = 0LL;
      v160 = v15;
      unsigned int v20 = [v15 personalize:v16 error:&v179];
      id v21 = v179;
      if (v21)
      {
        v152 = v16;
        dispatch_queue_attr_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 48) logger]);
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *(void *)(v166 + 40);
          uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 checkedDescription]);
          *(_DWORD *)buf = 138543618;
          uint64_t v186 = v24;
          uint64_t v17 = v166;
          __int16 v187 = 2114;
          v188 = v25;
          _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} received error while attempting personalization w ithout SSO Token - NON-FATAL ERROR | error:%{public}@",  buf,  0x16u);
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue([v21 domain]);
        unsigned int v27 = [v26 isEqualToString:v147];

        uint64_t v28 = (char *)[v21 code];
        if ((v20 & 1) != 0 || !v27 || v28 != (_BYTE *)&stru_C38.flags + 2)
        {
          id v33 = v4;
          BOOL v149 = 0;
          v154 = 0LL;
          v155 = 0LL;
          v153 = 0LL;
          goto LABEL_25;
        }

        uint64_t v29 = objc_opt_new(&OBJC_CLASS___MobileAssetKeyManager);
        id v178 = 0LL;
        v155 = v29;
        id v30 = -[MobileAssetKeyManager copyPersonalizationSSOToken:error:]( v29,  "copyPersonalizationSSOToken:error:",  1LL,  &v178);
        id v31 = v178;
        v154 = v30;
        if (v31 || !v30)
        {
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v17 + 48) logger]);
          id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 oslog]);

          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            uint64_t v58 = *(void *)(v17 + 40);
            __int128 v59 = @"NO-SSO-TOKEN";
            __int128 v60 = v142;
            if (v31)
            {
              __int128 v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v31 checkedDescription]);
              __int128 v59 = v60;
            }

            *(_DWORD *)buf = 138543618;
            uint64_t v186 = v58;
            __int16 v187 = 2114;
            v188 = v59;
            _os_log_error_impl( &dword_0,  v57,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set could not obtain SS O Token ERROR | error:%{public}@",  buf,  0x16u);
            if (v31) {

            }
            v142 = v60;
            uint64_t v17 = v166;
          }

          v153 = v31;
          id v33 = v4;

          BOOL v149 = 0;
          goto LABEL_25;
        }

        -[NSMutableDictionary setSafeObject:forKey:](v152, "setSafeObject:forKey:", v30, @"ssoToken");
        id v177 = v21;
        unsigned int v20 = [v160 personalize:v152 error:&v177];
        id v32 = v177;

        id v21 = v32;
        id v16 = v152;
      }

      else
      {
        v154 = 0LL;
        v155 = 0LL;
      }

      if (v20 && !v21)
      {
        uint64_t v34 = v17;
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v17 + 48) logger]);
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 oslog]);

        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = v16;
          uint64_t v38 = *(void *)(v34 + 40);
          id v39 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 summary]);
          *(_DWORD *)buf = 138543618;
          uint64_t v186 = v38;
          id v16 = v37;
          __int16 v187 = 2114;
          v188 = v39;
          _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set SUCCESS | autoAssetDe scriptor:%{public}@",  buf,  0x16u);
        }

        -[NSMutableArray addObject:](v145, "addObject:", v12);
        id v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v34 + 56) clientDomainName]);
        id v41 = (void *)objc_claimAutoreleasedReturnValue([v7 assetId]);
        +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:forAssetID:withSelector:",  1206LL,  6LL,  v40,  v41,  v12);
        id v21 = 0LL;
        v153 = 0LL;
        int v42 = 1;
        id v5 = v162;
        goto LABEL_27;
      }

      BOOL v149 = v21 == 0LL;
      v152 = v16;
      v153 = 0LL;
      id v33 = v4;
LABEL_25:
      uint64_t v43 = *(void *)(v17 + 40);
      id v44 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v45 = v17;
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
      id v47 = -[NSString initWithFormat:]( v44,  "initWithFormat:",  @"unable to personalize secure-asset | autoAssetDescriptor:%@",  v46);
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6535LL,  v43,  v21,  v47));

      id v49 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v45 + 48) logger]);
      id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 oslog]);

      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        uint64_t v144 = *(void *)(v166 + 40);
        BOOL v53 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v48 checkedDescription]);
        __int128 v54 = @"N";
        if (!v149)
        {
          __int128 v54 = (const __CFString *)objc_claimAutoreleasedReturnValue([v21 checkedDescription]);
          v143 = (__CFString *)v54;
        }

        __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
        *(_DWORD *)buf = 138544130;
        uint64_t v186 = v144;
        __int16 v187 = 2114;
        v188 = v53;
        __int16 v189 = 2114;
        v190 = v54;
        __int16 v191 = 2114;
        v192 = v55;
        _os_log_error_impl( &dword_0,  v50,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set ERROR | secureOperation Error:%{public}@ | waitedPersonalizeError:%{public}@ | autoAssetDescriptor:%{public}@",  buf,  0x2Au);
        if (!v149) {
      }
        }

      id v51 = v48;
      id v4 = v7;

      __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) clientDomainName]);
      +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:perso nalizeError:mapToExclaveError:",  v12,  v52,  0LL,  7LL,  *(void *)(v166 + 40),  0LL,  0LL,  v51,  0LL);

      id v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) clientDomainName]);
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v4 assetId]);
      +[MADAutoAssetHistory recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:",  1206LL,  v40,  v41,  v12,  v51);

      int v42 = 0;
      id v5 = v51;
      id v16 = v152;
LABEL_27:

      if (!v42) {
        goto LABEL_48;
      }
      id v6 = (char *)v6 + 1;
    }

    while (v150 != v6);
    id v61 = [obj countByEnumeratingWithState:&v180 objects:v193 count:16];
    uint64_t v2 = v145;
    id v150 = v61;
  }

  while (v61);
LABEL_49:

  a1 = v166;
  if (v5) {
    goto LABEL_83;
  }
LABEL_50:
  if (-[NSMutableArray count](v2, "count"))
  {
    id v176 = 0LL;
    +[SecureMobileAssetBundle commitStagedManifestsForSelectors:error:]( &OBJC_CLASS___SecureMobileAssetBundle,  "commitStagedManifestsForSelectors:error:",  v2,  &v176);
    id v72 = v176;
    if (v72)
    {
      id v5 = v72;
      __int16 v73 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) clientDomainName]);
      v74 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) assetSetIdentifier]);
      __int16 v75 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) latestDownloadedAtomicInstance]);
      +[MADAutoAssetHistory recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  1207LL,  6LL,  v73,  v74,  v75,  v5);

      v76 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 48) logger]);
      __int16 v77 = (os_log_s *)objc_claimAutoreleasedReturnValue([v76 oslog]);

      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        uint64_t v135 = *(void *)(v166 + 40);
        v136 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 checkedDescription]);
        v137 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) summary]);
        *(_DWORD *)buf = 138543874;
        uint64_t v186 = v135;
        __int16 v187 = 2114;
        v188 = v136;
        __int16 v189 = 2114;
        v190 = v137;
        _os_log_error_impl( &dword_0,  v77,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set commit ERROR | personal izeError:%{public}@ | setDescriptor:%{public}@",  buf,  0x20u);
      }

      a1 = v166;
      goto LABEL_83;
    }

    id v78 = -[NSMutableArray count](v2, "count");
    v79 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) clientDomainName]);
    v80 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) assetSetIdentifier]);
    v81 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) latestDownloadedAtomicInstance]);
    +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:usageCount:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:usageCount:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:",  1207LL,  6LL,  6LL,  v78,  v79,  v80,  v81);

    v82 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 48) logger]);
    v83 = (os_log_s *)objc_claimAutoreleasedReturnValue([v82 oslog]);

    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v84 = *(void *)(v166 + 40);
      v85 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) summary]);
      *(_DWORD *)buf = 138543618;
      uint64_t v186 = v84;
      __int16 v187 = 2114;
      v188 = v85;
      _os_log_impl( &dword_0,  v83,  OS_LOG_TYPE_DEFAULT,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set commit SUCCESS | setDescr iptor:%{public}@",  buf,  0x16u);
    }

    a1 = v166;
  }

  if (!*(_BYTE *)(a1 + 81)) {
    goto LABEL_86;
  }
  __int128 v174 = 0u;
  __int128 v175 = 0u;
  __int128 v172 = 0u;
  __int128 v173 = 0u;
  id v86 = *(id *)(a1 + 64);
  id v87 = [v86 countByEnumeratingWithState:&v172 objects:v184 count:16];
  if (!v87)
  {

    goto LABEL_86;
  }

  id v5 = v87;
  v159 = v4;
  v161 = v86;
  v146 = v2;
  uint64_t v163 = *(void *)v173;
  while (2)
  {
    v88 = 0LL;
    while (2)
    {
      if (*(void *)v173 != v163) {
        objc_enumerationMutation(v86);
      }
      v89 = *(void **)(*((void *)&v172 + 1) + 8LL * (void)v88);
      v90 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
      v91 = (void *)objc_claimAutoreleasedReturnValue([v89 assetType]);
      v92 = (void *)objc_claimAutoreleasedReturnValue([v89 assetSpecifier]);
      v93 = (void *)objc_claimAutoreleasedReturnValue([v89 assetVersion]);
      id v94 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v90,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v91,  v92,  v93);

      v95 = (void *)objc_claimAutoreleasedReturnValue([v89 assetType]);
      v96 = (void *)objc_claimAutoreleasedReturnValue([v89 assetId]);
      v97 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure secureBundleForAssetType:assetId:]( &OBJC_CLASS___MADAutoAssetSecure,  "secureBundleForAssetType:assetId:",  v95,  v96));

      a1 = v166;
      if (!v97)
      {
        uint64_t v105 = *(void *)(v166 + 40);
        v106 = objc_alloc(&OBJC_CLASS___NSString);
        v97 = (void *)objc_claimAutoreleasedReturnValue([v89 summary]);
        v100 = -[NSString initWithFormat:]( v106,  "initWithFormat:",  @"unable to initialize SecureMobileAssetBundle (for grafting [or mounting]) | nextAutoAssetDescriptor:%@",  v97);
        id v5 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v105,  0LL,  v100));
        id v4 = v159;
        goto LABEL_81;
      }

      id v171 = 0LL;
      unsigned __int8 v98 = [v97 beginAccess:0 error:&v171];
      v99 = (NSString *)v171;
      v100 = v99;
      if (v99)
      {
        BOOL v101 = -[NSString code](v99, "code") == &stru_68.sectname[1];
        uint64_t v102 = resultForGraftOrUngraft(v101, 1);
LABEL_73:
        uint64_t v107 = v102;
        uint64_t v164 = *(void *)(v166 + 40);
        v108 = objc_alloc(&OBJC_CLASS___NSString);
        v109 = (void *)objc_claimAutoreleasedReturnValue([v89 summary]);
        v110 = -[NSString initWithFormat:]( v108,  "initWithFormat:",  @"unable to personalize secure-asset | autoAssetDescriptor:%@",  v109);
        id v5 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6536LL,  v164,  v100,  v110));

        uint64_t v111 = v166;
        v112 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 48) logger]);
        v113 = (os_log_s *)objc_claimAutoreleasedReturnValue([v112 oslog]);

        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        {
          uint64_t v138 = *(void *)(v166 + 40);
          id v165 = v5;
          v139 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v5 checkedDescription]);
          uint64_t v157 = v138;
          if (v100) {
            v140 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString checkedDescription](v100, "checkedDescription"));
          }
          else {
            v140 = @"N";
          }
          v141 = (void *)objc_claimAutoreleasedReturnValue([v89 summary]);
          *(_DWORD *)buf = 138544130;
          uint64_t v186 = v157;
          __int16 v187 = 2114;
          v188 = v139;
          __int16 v189 = 2114;
          v190 = v140;
          __int16 v191 = 2114;
          v192 = v141;
          _os_log_error_impl( &dword_0,  v113,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set ERROR | secureOperati onError:%{public}@ | graftingError:%{public}@ | autoAssetDescriptor:%{public}@",  buf,  0x2Au);
          if (v100) {

          }
          id v5 = v165;
          uint64_t v111 = v166;
        }

        v114 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v111 + 56) clientDomainName]);
        if (v101) {
          id v115 = 0LL;
        }
        else {
          id v115 = v5;
        }
        if (v101) {
          id v116 = v5;
        }
        else {
          id v116 = 0LL;
        }
        +[MADAutoAssetControlManager analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:personalizeError:mapToExclaveError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:per sonalizeError:mapToExclaveError:",  v94,  v114,  0LL,  v107,  *(void *)(v111 + 40),  v115,  v116,  0LL,  0LL);

        v117 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v111 + 56) clientDomainName]);
        v118 = (void *)objc_claimAutoreleasedReturnValue([v89 assetId]);
        +[MADAutoAssetHistory recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:",  1202LL,  v117,  v118,  v94,  v100);

        id v119 = v89;
        uint64_t v120 = v111;
        id v4 = v119;
        a1 = v120;
        id v86 = v161;
LABEL_81:

        goto LABEL_82;
      }

      BOOL v101 = 1;
      uint64_t v102 = resultForGraftOrUngraft(1, 1);
      if ((v98 & 1) == 0) {
        goto LABEL_73;
      }
      v103 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) clientDomainName]);
      v104 = (void *)objc_claimAutoreleasedReturnValue([v89 assetId]);
      +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:forAssetID:withSelector:",  1202LL,  6LL,  v103,  v104,  v94);

      v88 = (char *)v88 + 1;
      id v86 = v161;
      if (v5 != v88) {
        continue;
      }
      break;
    }

    id v5 = [v161 countByEnumeratingWithState:&v172 objects:v184 count:16];
    if (v5) {
      continue;
    }
    break;
  }

  a1 = v166;
  id v4 = v159;
LABEL_82:

  uint64_t v2 = v146;
  if (v5)
  {
LABEL_83:
    v121 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    v122 = (os_log_s *)objc_claimAutoreleasedReturnValue([v121 oslog]);

    BOOL v123 = os_log_type_enabled(v122, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v123)
      {
        uint64_t v124 = *(void *)(v166 + 40);
        v125 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 checkedDescription]);
        v126 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(v166 + 56) summary]);
        v127 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
        *(_DWORD *)buf = 138544130;
        uint64_t v186 = v124;
        __int16 v187 = 2114;
        v188 = v125;
        __int16 v189 = 2114;
        v190 = v126;
        __int16 v191 = 2114;
        v192 = v127;
        _os_log_error_impl( &dword_0,  v122,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set ERROR | error:%{public} @ | setDescriptor:%{public}@ | associatedDescriptor:%{public}@",  buf,  0x2Au);
      }
    }

    else
    {
      if (v123) {
        __152__MADAutoAssetSecure__personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_requiringPersonalization_requiringGrafting_shouldGraft_completion___block_invoke_746_cold_1();
      }
      id v4 = 0LL;
    }

    goto LABEL_92;
  }

uint64_t __152__MADAutoAssetSecure__personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_requiringPersonalization_requiringGrafting_shouldGraft_completion___block_invoke_753( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

+ (id)_secureAssetBundleSummary:(id)a3
{
  id v3 = a3;
  id v18 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = @"N";
  else {
    id v5 = @"N";
  }
  uint64_t v17 = v5;
  else {
    id v6 = @"N";
  }
  id v16 = v6;
  else {
    id v7 = @"N";
  }
  else {
    int v8 = @"N";
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 assetBundlePath]);
  if (v9) {
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 assetBundlePath]);
  }
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v3 accessPath]);
  if (v10) {
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 accessPath]);
  }
  else {
    id v11 = @"N";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 secureInfoPlist]);
  if (v12) {
    id v13 = @"Y";
  }
  else {
    id v13 = @"N";
  }
  uint64_t v14 = -[NSString initWithFormat:]( v18,  "initWithFormat:",  @"(isSecureMobileAsset:%@ | isPersonalized:%@ | isPersonalizedManifestStaged:%@ | isAccessible:%@ | assetBundlePath:%@ | accessPath:%@ | secureInfoPlist:%@)",  v17,  v16,  v7,  v8,  v4,  v11,  v13);

  if (v10) {
  if (v9)
  }

  return v14;
}

+ (void)removeAllPersisted
{
}

void __40__MADAutoAssetSecure_removeAllPersisted__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
  [v1 removeAllPersistedEntries:@"MADAutoAssetSecure-removeAllPersisted"];
}

+ (id)migrateMismatchedPersistedStateVersion:(id)a3 forEntryID:(id)a4 withMismatchedState:(id)a5
{
  return 0LL;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)secureProtectionQueue
{
  return self->_secureProtectionQueue;
}

- (MADAutoAssetPersisted)persistedState
{
  return self->_persistedState;
}

- (void).cxx_destruct
{
}

- (void)init
{
}

+ (void)isSecureAsset:forDescriptor:.cold.1()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(v0, v1), "summary");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "\n[AUTO-SECURE][AUTO-DETERMINE] {%{public}@} no MADAutoAssetSecure instance | autoAssetDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)isSecureAsset:forDescriptor:.cold.2()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(v0, v1), "summary");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} unable to initialize SecureMobileAssetBundle | autoAssetDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)isPersonalizationOrGraftingRequired:forDescriptor:.cold.1()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(v0, v1), "summary");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "\n[AUTO-SECURE][AUTO-DETERMINE] {%{public}@} no MADAutoAssetSecure instance| autoAssetDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)isPersonalizationOrGraftingRequired:forDescriptor:.cold.2()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(v0, v1), "summary");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "[AUTO-SECURE] {%{public}@} unable to initialize SecureMobileAssetBundle | autoAssetDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)depersonalizeIfSecure:forDescriptor:.cold.1()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(v0, v1), "summary");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-REMOVE] {%{public}@}  no MADAutoAssetSecure instance | autoAssetDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)depersonalizeIfSecure:forDescriptor:.cold.2()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(v0, v1), "summary");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-REMOVE] {%{public}@}  unable to initialize SecureMobileAssetBundle | autoAssetDes criptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)secureBundleForAssetType:(os_log_t)log assetId:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][LOCAL-CONTENT-URL] {secureBundleForAssetType} unable to get localContentURLBase | assetType:%{public}@ | assetId:%{public}@",  (uint8_t *)&v3,  0x16u);
}

+ (void)latestDownloadedAtomicInstanceEntries:forSetDescriptor:.cold.1()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(v0, v1), "summary");
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "\n[AUTO-SECURE]LATEST-DOWNLOADED] {%{public}@} no MADAutoAssetSecure instance | setDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

void __68__MADAutoAssetSecure_graftDownloaded_graftingDescriptor_completion___block_invoke_2_cold_1( uint64_t a1)
{
  id v2 = [(id)OUTLINED_FUNCTION_9() summary];
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6( &dword_0,  v4,  v5,  "\n[AUTO-SECURE][AUTO-GRAFT] {%{public}@} beginAccess ERROR | error:%{public}@ | autoAssetDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_7();
}

void __90__MADAutoAssetSecure_personalizeGraftDownloaded_forDescriptor_allowingNetwork_completion___block_invoke_719_cold_1( uint64_t a1)
{
  id v2 = [(id)OUTLINED_FUNCTION_9() summary];
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6( &dword_0,  v4,  v5,  "\n [AUTO-SECURE][AUTO-GRAFT] {%{public}@} personalize+graft|mount ERROR | error:%{public}@ | autoAssetDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_7();
}

+ (void)isPersonalizationRequired:forSetDescriptor:.cold.1()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(v0, v1), "summary");
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "\n [AUTO-SECURE][AUTO-DETERMINE] {%{public}@} unable to locate shared auto-asset-secure instance | setDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)ungraftIfNotAccessible:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "\n [AUTO-SECURE][AUTO-GRAFT-REMOVE] {ungraftIfNotAccessible} unable to create secure asset bundle | assetPath:%{public}@",  (uint8_t *)&v2,  0xCu);
}

+ (void)ungraftIfNotAccessible:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __152__MADAutoAssetSecure__personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_requiringPersonalization_requiringGrafting_shouldGraft_completion___block_invoke_746_cold_1()
{
  id v2 = [(id)OUTLINED_FUNCTION_9() summary];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6( &dword_0,  v4,  v5,  "\n [AUTO-SECURE][AUTO-PERSONALIZATION-GRAFT-SET] {%{public}@} personalize+graft|mount set ERROR | error:%{public}@ | se tDescriptor:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_7();
}

@end