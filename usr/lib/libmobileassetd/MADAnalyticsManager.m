@interface MADAnalyticsManager
+ (id)getAnalyticsManager;
+ (id)getTestAnalyticsManager:(id)a3;
- (BOOL)eventRecordingEnabled;
- (BOOL)overrideClientNameAsTestTool;
- (BOOL)prependClientNameWithTestTool;
- (BOOL)recordCacheDeleteTelemetry;
- (BOOL)saveEventToDisk:(id)a3;
- (BOOL)shouldRecordEventForAssetType:(id)a3;
- (MADAnalyticsManager)init;
- (MADAnalyticsManager)initWithPath:(id)a3;
- (NSDictionary)events;
- (NSMutableDictionary)assetTypeEventTracker;
- (NSString)savePath;
- (id)copyEventFromPath:(id)a3;
- (id)nilToNoneString:(id)a3;
- (id)recordCacheDeleteAttempt:(int64_t)a3 timeTakenSecs:(double)a4 cacheDeleteUrgency:(int64_t)a5 results:(id)a6 targetPurgeVolume:(id)a7 triggeringOperation:(int64_t)a8;
- (id)recordEventWithName:(id)a3 assetType:(id)a4 payload:(id)a5;
- (id)recordMobileAssetPromotionAttempt:(id)a3 assetType:(id)a4 assetVersion:(id)a5 osPromotion:(BOOL)a6 successfullyPromoted:(BOOL)a7;
- (id)recordMobileAssetSecureAttempt:(id)a3 assetType:(id)a4 assetVersion:(id)a5 clientName:(id)a6 operation:(int64_t)a7 secureReason:(id)a8 fromLocation:(id)a9 sucessfullyPersonalized:(BOOL)a10 personalizeFailureReason:(id)a11 sucessfullyMounted:(BOOL)a12 mountingFailureReason:(id)a13 successfullyGrafted:(BOOL)a14 graftingFailureReason:(id)a15 successfullyMappedToExclave:(BOOL)a16 mapToExclaveFailureReason:(id)a17;
- (id)recordPushNotification:(id)a3 assetType:(id)a4 cloudChannel:(id)a5 forPopulationType:(int64_t)a6 userInitiated:(BOOL)a7 interestAcrossTerm:(BOOL)a8 lockAcrossReboot:(BOOL)a9 lockAcrossTermination:(BOOL)a10;
- (id)recordPushNotification:(id)a3 assetType:(id)a4 cloudChannels:(id)a5 forPopulationType:(int64_t)a6 userInitiated:(BOOL)a7 interestAcrossTerm:(BOOL)a8 lockAcrossReboot:(BOOL)a9 lockAcrossTermination:(BOOL)a10;
- (id)removePrefix:(id)a3 fromString:(id)a4;
- (id)yesNoString:(BOOL)a3;
- (int64_t)reportingLevel;
- (void)_queue_setEvent:(id)a3;
- (void)_queue_submitAllEvents;
- (void)_queue_submitEvent:(id)a3;
- (void)analyticsPreferences;
- (void)changeReportingLevel:(int64_t)a3;
- (void)recordDownloadAttemptForAssetType:(id)a3 clientName:(id)a4 baseUrl:(id)a5 relativePath:(id)a6 purpose:(id)a7 result:(id)a8 analyticsFileType:(id)a9 isAutoDownload:(BOOL)a10 isPallas:(BOOL)a11 pallasAssetAudience:(id)a12 isUserPriority:(BOOL)a13 bytesWritten:(id)a14 bytesTransferredEst:(id)a15 additionalData:(id)a16;
- (void)recordDownloadAttemptForAssetType:(id)a3 clientName:(id)a4 baseUrl:(id)a5 relativePath:(id)a6 purpose:(id)a7 result:(id)a8 analyticsFileType:(id)a9 isAutoDownload:(BOOL)a10 isPallas:(BOOL)a11 pallasAssetAudience:(id)a12 isUserPriority:(BOOL)a13 bytesWritten:(id)a14 bytesTransferredEst:(id)a15 brainVersion:(id)a16 additionalData:(id)a17;
- (void)recordDownloadSuccessForAssetType:(id)a3 notificationSuffix:(id)a4 fileType:(id)a5;
- (void)removeAllEvents;
- (void)removeEvent:(id)a3;
- (void)removeEventsWithName:(id)a3;
- (void)setAssetTypeEventTracker:(id)a3;
- (void)setEvent:(id)a3;
- (void)setOverrideClientNameAsTestTool:(BOOL)a3;
- (void)setPrependClientNameWithTestTool:(BOOL)a3;
- (void)setRecordCacheDeleteTelemetry:(BOOL)a3;
- (void)submitAllEvents;
- (void)submitEvent:(id)a3;
- (void)submitEventsWithName:(id)a3;
@end

@implementation MADAnalyticsManager

- (id)nilToNoneString:(id)a3
{
  id v3 = a3;
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"<none>";
  }

  return v5;
}

- (id)removePrefix:(id)a3 fromString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 hasPrefix:v5]
    || (id v7 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "stringByReplacingOccurrencesOfString:withString:options:range:",  v5,  &stru_355768,  8,  0,  objc_msgSend(v6, "length")))) == 0)
  {
    id v7 = v6;
  }

  return v7;
}

- (id)yesNoString:(BOOL)a3
{
  if (a3) {
    return @"yes";
  }
  else {
    return @"no";
  }
}

- (BOOL)shouldRecordEventForAssetType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager assetTypeEventTracker](self, "assetTypeEventTracker"));
  objc_sync_enter(v5);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager shouldRecordEventForAssetType:]",  @"assetType: %@",  v6,  v7,  v8,  v9,  (uint64_t)v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager assetTypeEventTracker](self, "assetTypeEventTracker"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v4]);

  if (v11)
  {
    if ((int)[v11 intValue] > 49)
    {
      BOOL v15 = 0;
      goto LABEL_7;
    }

    uint64_t v12 = [v11 intValue] + 1;
  }

  else
  {
    uint64_t v12 = 1LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager assetTypeEventTracker](self, "assetTypeEventTracker"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
  [v13 setSafeObject:v14 forKey:v4];

  BOOL v15 = 1;
LABEL_7:

  objc_sync_exit(v5);
  return v15;
}

- (NSMutableDictionary)assetTypeEventTracker
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setEvent:(id)a3
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(stateQueue);
  -[MADAnalyticsManager saveEventToDisk:](self, "saveEventToDisk:", v5);
}

- (BOOL)saveEventToDisk:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __39__MADAnalyticsManager_saveEventToDisk___block_invoke;
  block[3] = &unk_34DC78;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __39__MADAnalyticsManager_saveEventToDisk___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (!*(void *)(*(void *)(a1 + 32) + 40LL))
  {
    uint64_t v12 = @"Save called on object with no path specified. Skipping.";
    goto LABEL_8;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) eventUUID]);
  if (!v9
    || (v10 = (void *)v9,
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) eventName]),
        v11,
        v10,
        !v11))
  {
    uint64_t v12 = @"Invalid event passed to saveEvent. Skipping.";
LABEL_8:
    int v13 = 3;
    goto LABEL_9;
  }

  if ((uint64_t)[*(id *)(a1 + 32) reportingLevel] <= -20)
  {
    uint64_t v12 = @"Save called for event but reportingLevel does not allow save. Skipping.";
    int v13 = 6;
LABEL_9:
    _MobileAssetLog(0LL, v13, (uint64_t)"-[MADAnalyticsManager saveEventToDisk:]_block_invoke", v12, a5, a6, a7, a8, v36);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    return;
  }

  uint64_t v41 = 66053LL;
  char v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) eventName]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) eventUUID]);
  uint64_t v37 = (uint64_t)v14;
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@%s"));

  v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) stringByAppendingPathComponent:v15]);
  int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
  if (IsVerboseLoggingEnabled)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) eventName]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) eventUUID]);
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager saveEventToDisk:]_block_invoke",  @"Saving event %@:%@ to %@",  v19,  v20,  v21,  v22,  (uint64_t)v18);
  }

  uint64_t v23 = *(void *)(a1 + 40);
  id v40 = 0LL;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v23,  1LL,  &v40));
  v29 = (__CFString *)v40;
  if (v24 && ([v24 writeToFile:v16 atomically:1] & 1) != 0)
  {
    if (IsVerboseLoggingEnabled) {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager saveEventToDisk:]_block_invoke",  @"Successfully saved event",  v25,  v26,  v27,  v28,  v37);
    }
    if (fsctl((const char *)[v16 UTF8String], 0xC0084A44uLL, &v41, 0))
    {
      v30 = __error();
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager saveEventToDisk:]_block_invoke",  @"Failed to mark analytics file purgeable, errno:%d",  v31,  v32,  v33,  v34,  *v30);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  else
  {
    v35 = @"Unknown Archiver Error";
    if (v29) {
      v35 = v29;
    }
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager saveEventToDisk:]_block_invoke",  @"Unable to save MAD analytics event(%@)",  v25,  v26,  v27,  v28,  (uint64_t)v35);
  }
}

- (int64_t)reportingLevel
{
  return self->_reportingLevel;
}

- (MADAnalyticsManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MADAnalyticsManager;
  v2 = -[MADAnalyticsManager init](&v21, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mobileassetd.MADAnalyticsManagerQueue", v4);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v5;

    *(_WORD *)&v2->_overrideClientNameAsTestTool = 0;
    v2->_recordCacheDeleteTelemetry = 0;
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___MADAnalyticsEventSubmitter);
    coreEventSubmitter = v2->_coreEventSubmitter;
    v2->_coreEventSubmitter = v7;

    id RepositoryPath = getRepositoryPath(@"/private/var/MobileSoftwareUpdate/MobileAsset/AssetsV2/analytics");
    uint64_t v10 = objc_claimAutoreleasedReturnValue(RepositoryPath);
    savePath = v2->_savePath;
    v2->_savePath = (NSString *)v10;

    uint64_t v12 = ensureDirectory(v2->_savePath);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (!v13) {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager init]",  @"Could not create analytics directory",  v14,  v15,  v16,  v17,  (uint64_t)v21.receiver);
    }
    v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    assetTypeEventTracker = v2->_assetTypeEventTracker;
    v2->_assetTypeEventTracker = v18;

    -[MADAnalyticsManager analyticsPreferences](v2, "analyticsPreferences");
  }

  return v2;
}

- (MADAnalyticsManager)initWithPath:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MADAnalyticsManager;
  dispatch_queue_t v5 = -[MADAnalyticsManager init](&v23, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mobileassetd.MADAnalyticsManagerQueue", v7);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___MADAnalyticsEventSubmitter);
    coreEventSubmitter = v5->_coreEventSubmitter;
    v5->_coreEventSubmitter = v10;

    uint64_t v12 = (NSString *)[v4 copy];
    savePath = v5->_savePath;
    v5->_savePath = v12;

    uint64_t v14 = ensureDirectory(v5->_savePath);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (!v15) {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager initWithPath:]",  @"Could not create analytics directory",  v16,  v17,  v18,  v19,  (uint64_t)v23.receiver);
    }
    uint64_t v20 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    assetTypeEventTracker = v5->_assetTypeEventTracker;
    v5->_assetTypeEventTracker = v20;

    v5->_recordCacheDeleteTelemetry = 0;
    -[MADAnalyticsManager analyticsPreferences](v5, "analyticsPreferences");
  }

  return v5;
}

+ (id)getAnalyticsManager
{
  if (getAnalyticsManager_controlManagerOnce != -1) {
    dispatch_once(&getAnalyticsManager_controlManagerOnce, &__block_literal_global_3);
  }
  return (id)getAnalyticsManager_analyticsManager;
}

void __42__MADAnalyticsManager_getAnalyticsManager__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADAnalyticsManager);
  v2 = (void *)getAnalyticsManager_analyticsManager;
  getAnalyticsManager_analyticsManager = (uint64_t)v1;
}

+ (id)getTestAnalyticsManager:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __47__MADAnalyticsManager_getTestAnalyticsManager___block_invoke;
  block[3] = &unk_34DBC0;
  id v8 = a3;
  uint64_t v3 = getTestAnalyticsManager__controlManagerOnce;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&getTestAnalyticsManager__controlManagerOnce, block);
  }
  id v5 = (id)getTestAnalyticsManager__analyticsManager;

  return v5;
}

void __47__MADAnalyticsManager_getTestAnalyticsManager___block_invoke(uint64_t a1)
{
  v1 = -[MADAnalyticsManager initWithPath:]( objc_alloc(&OBJC_CLASS___MADAnalyticsManager),  "initWithPath:",  *(void *)(a1 + 32));
  v2 = (void *)getTestAnalyticsManager__analyticsManager;
  getTestAnalyticsManager__analyticsManager = (uint64_t)v1;
}

- (id)copyEventFromPath:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v35 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:v3 error:&v35]);
  id v6 = v35;
  uint64_t v11 = v6;
  if (v5) {
    BOOL v12 = v6 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12
    || (uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSFileType])) != 0
    && (uint64_t v14 = (void *)v13,
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSFileType]),
        unsigned __int8 v16 = [v15 isEqualToString:NSFileTypeRegular],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager copyEventFromPath:]",  @"Invalid file type found for even at path: %@ [%@] (skipping)",  v7,  v8,  v9,  v10,  (uint64_t)v3);
    v30 = 0LL;
    uint64_t v17 = 0LL;
LABEL_16:
    v24 = 0LL;
    goto LABEL_17;
  }

  id v34 = 0LL;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v3,  0LL,  &v34));
  id v18 = v34;
  uint64_t v11 = v18;
  if (!v17 || v18)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager copyEventFromPath:]",  @"Failed to read contents of event file: %@ (%@)",  v19,  v20,  v21,  v22,  (uint64_t)v3);
    v30 = 0LL;
    goto LABEL_16;
  }

  id v33 = 0LL;
  id v23 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___MADAnalyticsEvent),  v17,  &v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = v33;
  v30 = v25;
  if (!v24 || v25) {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager copyEventFromPath:]",  @"Invalid event data for :%@ (%@)",  v26,  v27,  v28,  v29,  (uint64_t)v3);
  }
  uint64_t v11 = 0LL;
LABEL_17:
  id v31 = v24;

  return v31;
}

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __35__MADAnalyticsManager_removeEvent___block_invoke;
  block[3] = &unk_34DB98;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __35__MADAnalyticsManager_removeEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventName]);
  id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventUUID]);
  uint64_t v34 = (uint64_t)v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@%s"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) stringByAppendingPathComponent:v4]);
  id v6 = [*(id *)(a1 + 40) copyEventFromPath:v5];
  if ([v2 fileExistsAtPath:v5])
  {
    id v38 = 0LL;
    unsigned __int8 v7 = [v2 removeItemAtPath:v5 error:&v38];
    id v8 = v38;
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventName]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventUUID]);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeEvent:]_block_invoke",  @"Unable to remove event %@ : %@ : %@",  v11,  v12,  v13,  v14,  (uint64_t)v9);

      goto LABEL_17;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetTypeEventTracker]);
  objc_sync_enter(v9);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 eventPayload]);
  uint64_t v20 = v15;
  if (v15)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"AssetType"]);
    if (v25 && (uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v25, v26) & 1) != 0))
    {
      id v36 = v25;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetTypeEventTracker]);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v36]);

      if (v37 && (int)[v37 intValue] > 0)
      {
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetTypeEventTracker]);
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v37 intValue] - 1));
        [v32 setObject:v33 forKey:v36];
      }

      else
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeEvent:]_block_invoke",  @"Unable to read number of events written for assetType: %@",  v28,  v29,  v30,  v31,  (uint64_t)v36);
      }
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeEvent:]_block_invoke",  @"Unable to read assetType to decrement tracker!",  v21,  v22,  v23,  v24,  v34);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeEvent:]_block_invoke",  @"Unable to read event to decrement tracker!",  v16,  v17,  v18,  v19,  v34);
  }

  objc_sync_exit(v9);
LABEL_17:
}

- (void)analyticsPreferences
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __43__MADAnalyticsManager_analyticsPreferences__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  if (onceAnalyticsPreferences != -1) {
    dispatch_once(&onceAnalyticsPreferences, block);
  }
}

void __43__MADAnalyticsManager_analyticsPreferences__block_invoke(uint64_t a1)
{
  char v19 = 0;
  id AppIntegerValue = _MAPreferencesGetAppIntegerValue(@"AnalyticsLevelOnLaunch", &v19);
  if (v19) {
    [*(id *)(a1 + 32) changeReportingLevel:AppIntegerValue];
  }
  unsigned int AppBooleanValue = _MAPreferencesGetAppBooleanValue(@"ForceAutoCacheDelete", &v19);
  if (v19) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  char v5 = !v4;
  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = v5;
  uint64_t PreferenceLong = getPreferenceLong(@"AnalyticsSubmitOnLaunch");
  uint64_t v7 = getPreferenceLong(@"AnalyticsClearOnLaunch");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) savePath]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 enumeratorAtPath:v9]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
  id v12 = [v11 count];

  if (PreferenceLong)
  {
    if (PreferenceLong == -1) {
      uint64_t v17 = &stru_355768;
    }
    else {
      uint64_t v17 = @" due to override";
    }
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager analyticsPreferences]_block_invoke",  @"Analytics submitting on launch%@",  v13,  v14,  v15,  v16,  (uint64_t)v17);
    [*(id *)(a1 + 32) submitAllEvents];
  }

  if (v7)
  {
    if (v7 == -1) {
      uint64_t v18 = &stru_355768;
    }
    else {
      uint64_t v18 = @" due to override";
    }
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager analyticsPreferences]_block_invoke",  @"Analytics clearing on launch%@",  v13,  v14,  v15,  v16,  (uint64_t)v18);
    [*(id *)(a1 + 32) removeAllEvents];
  }
}

- (void)removeEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__MADAnalyticsManager_removeEventsWithName___block_invoke;
  block[3] = &unk_34DB98;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __44__MADAnalyticsManager_removeEventsWithName___block_invoke(uint64_t a1)
{
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) savePath]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v47 enumeratorAtPath:v2]);

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v51;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v51 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        id v8 = objc_autoreleasePoolPush();
        if ([v7 hasSuffix:@".MADAnalytics"])
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) savePath]);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v7]);

          id v11 = [*(id *)(a1 + 32) copyEventFromPath:v10];
          int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
          if (v11)
          {
            int v13 = IsVerboseLoggingEnabled;
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 eventName]);
            unsigned int v15 = [v14 isEqualToString:*(void *)(a1 + 40)];

            if (v15)
            {
              id v49 = 0LL;
              [v47 removeItemAtPath:v10 error:&v49];
              id v16 = v49;
              if (v16)
              {
                uint64_t v21 = v16;
                _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeEventsWithName:]_block_invoke",  @"Unable to remove event file %@: %@",  v17,  v18,  v19,  v20,  (uint64_t)v10);
              }

              else
              {
                if (v13) {
                  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager removeEventsWithName:]_block_invoke",  @"Successfully removed event file %@",  v17,  v18,  v19,  v20,  (uint64_t)v10);
                }
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetTypeEventTracker]);
                objc_sync_enter(v22);
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 eventPayload]);
                uint64_t v28 = v23;
                if (v23)
                {
                  id v33 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"AssetType"]);
                  v46 = v33;
                  if (v33
                    && (uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v33, v34) & 1) != 0))
                  {
                    id v44 = v33;
                    id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetTypeEventTracker]);
                    v45 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v44]);

                    if (v45 && (int)[v45 intValue] > 0)
                    {
                      v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetTypeEventTracker]);
                      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v45 intValue] - 1));
                      [v43 setObject:v40 forKey:v44];

                      int v41 = 0;
                    }

                    else
                    {
                      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeEventsWithName:]_block_invoke",  @"Unable to read number of events written for assetType: %@",  v36,  v37,  v38,  v39,  (uint64_t)v44);
                      int v41 = 1;
                    }
                  }

                  else
                  {
                    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeEventsWithName:]_block_invoke",  @"Unable to read assetType to decrement tracker!",  v29,  v30,  v31,  v32,  v42);
                    int v41 = 1;
                  }
                }

                else
                {
                  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeEventsWithName:]_block_invoke",  @"Unable to read event to decrement tracker!",  v24,  v25,  v26,  v27,  v42);
                  int v41 = 1;
                }

                objc_sync_exit(v22);
                if (v41)
                {

                  objc_autoreleasePoolPop(v8);
                  goto LABEL_30;
                }
              }
            }
          }
        }

        objc_autoreleasePoolPop(v8);
      }

      id v4 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)removeAllEvents
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __38__MADAnalyticsManager_removeAllEvents__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __38__MADAnalyticsManager_removeAllEvents__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) savePath]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 enumeratorAtPath:v3]);

  int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        uint64_t v9 = objc_autoreleasePoolPush();
        unsigned int v10 = [v8 hasSuffix:@".MADAnalytics"];
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) savePath]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:v8]);

        if (v10)
        {
          id v29 = 0LL;
          unsigned __int8 v13 = [v2 removeItemAtPath:v12 error:&v29];
          id v18 = v29;
          if ((v13 & 1) != 0)
          {
            if (IsVerboseLoggingEnabled) {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager removeAllEvents]_block_invoke",  @"Successfully removed event file %@",  v14,  v15,  v16,  v17,  (uint64_t)v12);
            }
          }

          else
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeAllEvents]_block_invoke",  @"Unable to remove event file %@: %@",  v14,  v15,  v16,  v17,  (uint64_t)v12);
          }
        }

        else
        {
          id v28 = 0LL;
          unsigned __int8 v19 = [v2 removeItemAtPath:v12 error:&v28];
          id v18 = v28;
          if ((v19 & 1) != 0)
          {
            if (IsVerboseLoggingEnabled) {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager removeAllEvents]_block_invoke",  @"Successfully removed item %@",  v20,  v21,  v22,  v23,  (uint64_t)v12);
            }
          }

          else
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager removeAllEvents]_block_invoke",  @"Unable to remove item %@: %@",  v20,  v21,  v22,  v23,  (uint64_t)v12);
          }
        }

        objc_autoreleasePoolPop(v9);
      }

      id v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v5);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetTypeEventTracker]);
  objc_sync_enter(v24);
  uint64_t v25 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  [*(id *)(a1 + 32) setAssetTypeEventTracker:v25];

  objc_sync_exit(v24);
}

- (void)submitEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __35__MADAnalyticsManager_submitEvent___block_invoke;
  block[3] = &unk_34DB98;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __35__MADAnalyticsManager_submitEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventName]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventUUID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@%s",  v3,  v4,  ".MADAnalytics"));

  int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
  if ((uint64_t)[*(id *)(a1 + 40) reportingLevel] > -10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) stringByAppendingPathComponent:v5]);
    if ([v2 fileExistsAtPath:v11])
    {
      id v12 = [*(id *)(a1 + 40) copyEventFromPath:v11];
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 40), "_queue_setEvent:", v12);
        objc_msgSend(*(id *)(a1 + 40), "_queue_submitEvent:", v12);
        if (IsVerboseLoggingEnabled) {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager submitEvent:]_block_invoke",  @"Submitted event %@\n",  v13,  v14,  v15,  v16,  (uint64_t)v12);
        }
      }

      else
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventName]);
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventUUID]);
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager submitEvent:]_block_invoke",  @"Unable to find/reconstruct stashed event for event %@ with uuid %@",  v23,  v24,  v25,  v26,  (uint64_t)v22);
      }

      id v34 = 0LL;
      [v2 removeItemAtPath:v11 error:&v34];
      id v31 = v34;
      if (v31) {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager submitEvent:]_block_invoke",  @"Failed to remove event file after event submission %@: %@",  v27,  v28,  v29,  v30,  (uint64_t)v11);
      }
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventName]);
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventUUID]);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager submitEvent:]_block_invoke",  @"Event %@ with uuid %@ does not exist",  v18,  v19,  v20,  v21,  (uint64_t)v17);
    }
  }

  else if (IsVerboseLoggingEnabled)
  {
    _MobileAssetLog( 0LL,  5,  (uint64_t)"-[MADAnalyticsManager submitEvent:]_block_invoke",  @"Submit called for event but reportingLevel does not allow sending. Skipping event: %@",  v7,  v8,  v9,  v10,  (uint64_t)v5);
  }
}

- (void)submitEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__MADAnalyticsManager_submitEventsWithName___block_invoke;
  block[3] = &unk_34DB98;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __44__MADAnalyticsManager_submitEventsWithName___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (*(void *)(a1 + 32))
  {
    if ((uint64_t)[*(id *)(a1 + 40) reportingLevel] > -10)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) savePath]);
      id v34 = v14;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 enumeratorAtPath:v15]);

      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id obj = v16;
      id v17 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v17)
      {
        id v18 = v17;
        id v35 = 0LL;
        uint64_t v19 = *(void *)v39;
        do
        {
          uint64_t v20 = 0LL;
          do
          {
            if (*(void *)v39 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v20);
            uint64_t v22 = objc_autoreleasePoolPush();
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) stringByAppendingPathComponent:v21]);
            if ([v21 hasSuffix:@".MADAnalytics"])
            {
              id v24 = [*(id *)(a1 + 40) copyEventFromPath:v23];
              uint64_t v25 = v24;
              if (v24
                && (uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 eventName]),
                    unsigned __int8 v27 = [v26 isEqualToString:*(void *)(a1 + 32)],
                    v26,
                    (v27 & 1) != 0))
              {
                objc_msgSend(*(id *)(a1 + 40), "_queue_setEvent:", v25);
                objc_msgSend(*(id *)(a1 + 40), "_queue_submitEvent:", v25);

                id v37 = v35;
                [v34 removeItemAtPath:v23 error:&v37];
                id v28 = v37;

                if (v28)
                {
                  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager submitEventsWithName:]_block_invoke",  @"Failed to remove event file %@: %@",  v29,  v30,  v31,  v32,  (uint64_t)v23);
                  id v35 = v28;
                }

                else
                {
                  id v35 = 0LL;
                }
              }

              else
              {
              }
            }

            objc_autoreleasePoolPop(v22);
            uint64_t v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v33 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
          id v18 = v33;
        }

        while (v33);
      }

      else
      {
        id v35 = 0LL;
      }
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager submitEventsWithName:]_block_invoke",  @"Submit called for events but reportingLevel does not allow sending. Skipping event name: %@",  v10,  v11,  v12,  v13,  *(void *)(a1 + 32));
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager submitEventsWithName:]_block_invoke",  @"Invalid event name passed to submitEventWithName",  a5,  a6,  a7,  a8,  a9);
  }

- (void)changeReportingLevel:(int64_t)a3
{
  if (a3) {
    self->_reportingLevel = a3;
  }
}

- (void)submitAllEvents
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __38__MADAnalyticsManager_submitAllEvents__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __38__MADAnalyticsManager_submitAllEvents__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if ((uint64_t)[*(id *)(a1 + 32) reportingLevel] <= -10)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager submitAllEvents]_block_invoke",  @"Submit called for all events but reportingLevel does not allow sending. Skipping the submission.",  v10,  v11,  v12,  v13,  a9);
    return;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) savePath]);
  uint64_t v42 = v14;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 enumeratorAtPath:v15]);

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v18) {
    goto LABEL_18;
  }
  id v19 = v18;
  uint64_t v20 = *(void *)v46;
  do
  {
    for (i = 0LL; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v46 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
      uint64_t v23 = objc_autoreleasePoolPush();
      if ([v22 hasSuffix:@".MADAnalytics"])
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) savePath]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingPathComponent:v22]);

        id v30 = [*(id *)(a1 + 32) copyEventFromPath:v25];
        if (v30)
        {
          objc_msgSend(*(id *)(a1 + 32), "_queue_setEvent:", v30);
          id v43 = 0LL;
          [v42 removeItemAtPath:v25 error:&v43];
          id v31 = v43;
          if (v31)
          {
            uint64_t v36 = v31;
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager submitAllEvents]_block_invoke",  @"Failed to remove event file after event submission %@: %@",  v32,  v33,  v34,  v35,  (uint64_t)v25);
            goto LABEL_14;
          }
        }

        else
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager submitAllEvents]_block_invoke",  @"Unable to read event at %@ for submission..Removing and moving on",  v26,  v27,  v28,  v29,  (uint64_t)v25);
          id v44 = 0LL;
          [v42 removeItemAtPath:v25 error:&v44];
          id v37 = v44;
          if (v37)
          {
            uint64_t v36 = v37;
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager submitAllEvents]_block_invoke",  @"Failed to remove event file %@: %@",  v38,  v39,  v40,  v41,  (uint64_t)v25);
LABEL_14:
          }
        }
      }

      objc_autoreleasePoolPop(v23);
    }

    id v19 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
  }

  while (v19);
LABEL_18:

  objc_msgSend(*(id *)(a1 + 32), "_queue_submitAllEvents");
}

- (NSDictionary)events
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0LL;
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __29__MADAnalyticsManager_events__block_invoke;
  v6[3] = &unk_34DB48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __29__MADAnalyticsManager_events__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) events]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_queue_setEvent:(id)a3
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[MADAnalyticsEventSubmitter setEvent:](self->_coreEventSubmitter, "setEvent:", v5);
}

- (void)_queue_submitAllEvents
{
}

- (void)_queue_submitEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (-[MADAnalyticsManager eventRecordingEnabled](self, "eventRecordingEnabled")) {
    -[MADAnalyticsEventSubmitter submitEvent:](self->_coreEventSubmitter, "submitEvent:", v4);
  }
}

- (id)recordEventWithName:(id)a3 assetType:(id)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && !-[MADAnalyticsManager shouldRecordEventForAssetType:](self, "shouldRecordEventForAssetType:", v9))
  {
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADAnalyticsEvent eventWithName:payload:]( &OBJC_CLASS___MADAnalyticsEvent,  "eventWithName:payload:",  v8,  v10));
    if (v15)
    {
      -[MADAnalyticsManager setEvent:](self, "setEvent:", v15);
      if (-[MADAnalyticsManager reportingLevel](self, "reportingLevel") >= 10)
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager recordEventWithName:assetType:payload:]",  @"[ANALYTICS] {recordEventWithName} Automatically submitting event due to reportingLevel being immediate. eventName: %@",  v16,  v17,  v18,  v19,  (uint64_t)v8);
        -[MADAnalyticsManager submitEvent:](self, "submitEvent:", v15);
      }
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager recordEventWithName:assetType:payload:]",  @"[ANALYTICS] {recordEventWithName} Could not extract Event from payload:%@ and eventName:%@",  v11,  v12,  v13,  v14,  (uint64_t)v10);
    }
  }

  return v15;
}

- (void)recordDownloadSuccessForAssetType:(id)a3 notificationSuffix:(id)a4 fileType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", a3));
  id v16 = (id)objc_claimAutoreleasedReturnValue( -[MADAnalyticsManager removePrefix:fromString:]( self,  "removePrefix:fromString:",  @"com.apple.MobileAsset.",  v10));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v9));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager removePrefix:fromString:](self, "removePrefix:fromString:", @".", v11));

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v8));
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:](v14, "setSafeObject:forKey:", v16, @"AssetType");
  -[NSMutableDictionary setSafeObject:forKey:](v14, "setSafeObject:forKey:", v12, @"Notification");
  -[NSMutableDictionary setSafeObject:forKey:](v14, "setSafeObject:forKey:", v13, @"FileType");
  id v15 =  -[MADAnalyticsManager recordEventWithName:assetType:payload:]( self,  "recordEventWithName:assetType:payload:",  @"com.apple.mobileassetd.Download.Success",  v16,  v14);
}

- (BOOL)eventRecordingEnabled
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__MADAnalyticsManager_eventRecordingEnabled__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  if (eventRecordingEnabled_analyticsSubmissionCheckDispatchOnce != -1) {
    dispatch_once(&eventRecordingEnabled_analyticsSubmissionCheckDispatchOnce, block);
  }
  return (eventRecordingEnabled_recordingEnabled & 1) == 0;
}

void __44__MADAnalyticsManager_eventRecordingEnabled__block_invoke(uint64_t a1)
{
  if (_MAPreferencesIsInternalAllowed())
  {
    char v38 = 0;
    _MAPreferencesGetAppBooleanValue(@"AnalyticsClientNameTestToolOverride", &v38);
    if (v38) {
      [*(id *)(a1 + 32) setOverrideClientNameAsTestTool:1];
    }
    if (([*(id *)(a1 + 32) overrideClientNameAsTestTool] & 1) == 0)
    {
      _MAPreferencesGetAppBooleanValue(@"AnalyticsClientNameTestToolPrepend", &v38);
      if (v38) {
        [*(id *)(a1 + 32) setPrependClientNameWithTestTool:1];
      }
    }
  }

  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke",  @"%s: Unable to get event submission overrides(Could not get master port[%d])",  v2,  v3,  v4,  v5,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke");
  }

  else
  {
    uint64_t v10 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if ((_DWORD)v10)
    {
      io_registry_entry_t v15 = v10;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v10, @"stress-rack", kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        uint64_t v21 = CFProperty;
        _MobileAssetLog( 0LL,  7,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke",  @"%s: Stress rack flag detected",  v17,  v18,  v19,  v20,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke");
        eventRecordingEnabled_recordingEnabled = 1;
        CFRelease(v21);
      }

      CFTypeRef v22 = IORegistryEntryCreateCFProperty(v15, @"boot-args", kCFAllocatorDefault, 0);
      if (v22)
      {
        uint64_t v27 = (void *)v22;
        _MobileAssetLog( 0LL,  7,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke",  @"Checking for test environment",  v23,  v24,  v25,  v26,  v36);
        id v28 = v27;
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0
          && [v28 containsString:@"TESTPLAN_ID"])
        {
          _MobileAssetLog( 0LL,  7,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke",  @"%s: Test flag detected",  v30,  v31,  v32,  v33,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke");
          eventRecordingEnabled_recordingEnabled = 1;
        }

        CFRelease(v28);
      }

      else
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke",  @"%s: Failed to read boot-args",  v23,  v24,  v25,  v26,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke");
      }

      CFTypeRef v34 = IORegistryEntryCreateCFProperty(v15, @"ma-analytics-force-submit", kCFAllocatorDefault, 0);
      if (v34)
      {
        uint64_t v35 = v34;
        _MobileAssetLog( 0LL,  7,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke",  @"Analytics force submit flag detected",  v6,  v7,  v8,  v9,  v37);
        eventRecordingEnabled_recordingEnabled = 0;
        CFRelease(v35);
      }
    }

    else
    {
      _MobileAssetLog( v10,  3,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke",  @"%s: Unable to get event submission override(unable to get options entry from the device tree)",  v11,  v12,  v13,  v14,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke");
    }
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke",  @"%s: Analytics event recording is %s",  v6,  v7,  v8,  v9,  (uint64_t)"-[MADAnalyticsManager eventRecordingEnabled]_block_invoke");
}

- (void)recordDownloadAttemptForAssetType:(id)a3 clientName:(id)a4 baseUrl:(id)a5 relativePath:(id)a6 purpose:(id)a7 result:(id)a8 analyticsFileType:(id)a9 isAutoDownload:(BOOL)a10 isPallas:(BOOL)a11 pallasAssetAudience:(id)a12 isUserPriority:(BOOL)a13 bytesWritten:(id)a14 bytesTransferredEst:(id)a15 additionalData:(id)a16
{
  LOBYTE(v17) = a13;
  LOWORD(v16) = __PAIR16__(a11, a10);
  -[MADAnalyticsManager recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:result:analyticsFileType:isAutoDownload:isPallas:pallasAssetAudience:isUserPriority:bytesWritten:bytesTransferredEst:brainVersion:additionalData:]( self,  "recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:result:analyticsFileType:isAutoDownload:is Pallas:pallasAssetAudience:isUserPriority:bytesWritten:bytesTransferredEst:brainVersion:additionalData:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  v16,  a12,  v17,  a14,  a15,  @"unknown",  a16);
}

- (void)recordDownloadAttemptForAssetType:(id)a3 clientName:(id)a4 baseUrl:(id)a5 relativePath:(id)a6 purpose:(id)a7 result:(id)a8 analyticsFileType:(id)a9 isAutoDownload:(BOOL)a10 isPallas:(BOOL)a11 pallasAssetAudience:(id)a12 isUserPriority:(BOOL)a13 bytesWritten:(id)a14 bytesTransferredEst:(id)a15 brainVersion:(id)a16 additionalData:(id)a17
{
  id v91 = a12;
  CFTypeRef v22 = (NSNumber *)a14;
  v100 = (NSNumber *)a15;
  uint64_t v23 = v22;
  id v92 = a17;
  id v24 = a16;
  id v25 = a9;
  id v26 = a8;
  id v27 = a7;
  id v28 = a6;
  id v29 = a5;
  id v30 = a4;
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", a3));
  uint64_t v99 = objc_claimAutoreleasedReturnValue( -[MADAnalyticsManager removePrefix:fromString:]( self,  "removePrefix:fromString:",  @"com.apple.MobileAsset.",  v31));

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v26));
  v97 = (void *)objc_claimAutoreleasedReturnValue( -[MADAnalyticsManager removePrefix:fromString:]( self,  "removePrefix:fromString:",  @"MADownload",  v32));

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v27));
  uint64_t v33 = objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v30));

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v25));
  uint64_t v34 = objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v29));

  uint64_t v35 = objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v28));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager nilToNoneString:](self, "nilToNoneString:", v24));

  if (!v23) {
    uint64_t v23 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", 0LL);
  }
  uint64_t v37 = v23;
  char v38 = (void *)v35;
  uint64_t v39 = (void *)v34;
  uint64_t v40 = v100;
  if (!v100) {
    uint64_t v40 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", 0LL);
  }
  uint64_t v41 = objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager yesNoString:](self, "yesNoString:", a11));
  uint64_t v42 = objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager yesNoString:](self, "yesNoString:", a10));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsManager yesNoString:](self, "yesNoString:", a13));
  id v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v99, @"AssetType");
  v90 = (void *)v33;
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v33, @"ClientName");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v95, @"Purpose");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v94, @"FileType");
  v88 = (void *)v42;
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v42, @"IsAutoDownload");
  id v44 = v91;
  if (v91)
  {
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v91, v45) & 1) != 0) {
      -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v91, @"PallasAssetAudience");
    }
  }

  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v97, @"Result");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v37, @"BytesWritten");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v40, @"BytesTransferredEst");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v39, @"BaseURL");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v38, @"RelativePath");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v93, @"IsUserPriority");
  v89 = (void *)v41;
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v41, @"IsPallas");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", v36, @"BrainVersion");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", @"NO", @"IsAssetPatch");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", @"NO", @"IsMAAutoAsset");
  -[NSMutableDictionary setSafeObject:forKey:](v43, "setSafeObject:forKey:", @"NO", @"BaseAssetVersion");
  v102 = v43;
  -[NSMutableDictionary setSafeObject:forKey:]( v43,  "setSafeObject:forKey:",  @"NO",  @"WasAssetPatchingAttempted");
  __int128 v46 = v92;
  if (v92)
  {
    v86 = v37;
    v87 = v36;
    v84 = v38;
    v85 = self;
    v101 = v40;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    id v47 = v92;
    id v48 = [v47 countByEnumeratingWithState:&v103 objects:v107 count:16];
    if (!v48) {
      goto LABEL_27;
    }
    id v49 = v48;
    uint64_t v50 = *(void *)v104;
    while (1)
    {
      for (i = 0LL; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v104 != v50) {
          objc_enumerationMutation(v47);
        }
        __int128 v52 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)i);
        __int128 v53 = objc_autoreleasePoolPush();
        uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v52, v54) & 1) == 0)
        {
          id v59 = 0LL;
          v67 = @"Invalid key in additionalAnalyticsData dictionary. Skipping key";
LABEL_22:
          _MobileAssetLog( (uint64_t)v59,  3,  (uint64_t)"-[MADAnalyticsManager recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:res ult:analyticsFileType:isAutoDownload:isPallas:pallasAssetAudience:isUserPriority:bytesWritten:bytes TransferredEst:brainVersion:additionalData:]",  v67,  v55,  v56,  v57,  v58,  v83);
          goto LABEL_25;
        }

        id v59 = isSupportedMAAnalyticsEventFieldName(v52);
        if (!(_DWORD)v59)
        {
          uint64_t v83 = (uint64_t)v52;
          v67 = @"Not adding %@ to analytics payload due to unallowed name";
          goto LABEL_22;
        }

        v64 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v52]);
        if (v64
          && ((uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v64, v65) & 1) != 0)
           || (uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v64, v66) & 1) != 0)))
        {
          -[NSMutableDictionary setSafeObject:forKey:](v102, "setSafeObject:forKey:", v64, v52);
        }

        else
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsManager recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:res ult:analyticsFileType:isAutoDownload:isPallas:pallasAssetAudience:isUserPriority:bytesWritten:bytes TransferredEst:brainVersion:additionalData:]",  @"Not adding %@ to analytics payload due to invalid type",  v60,  v61,  v62,  v63,  (uint64_t)v52);
        }

LABEL_25:
        objc_autoreleasePoolPop(v53);
      }

      id v49 = [v47 countByEnumeratingWithState:&v103 objects:v107 count:16];
      if (!v49)
      {
LABEL_27:

        id v44 = v91;
        __int128 v46 = v92;
        self = v85;
        uint64_t v37 = v86;
        uint64_t v40 = v101;
        char v38 = v84;
        uint64_t v36 = v87;
        break;
      }
    }
  }

  uint64_t v68 = -[MADAnalyticsManager eventRecordingEnabled](self, "eventRecordingEnabled");
  if ((_DWORD)v68)
  {
    if (-[MADAnalyticsManager overrideClientNameAsTestTool](self, "overrideClientNameAsTestTool"))
    {
      v73 = v102;
      -[NSMutableDictionary setSafeObject:forKey:]( v102,  "setSafeObject:forKey:",  @"TestTool",  @"ClientName");
    }

    else
    {
      v73 = v102;
      if (-[MADAnalyticsManager prependClientNameWithTestTool](self, "prependClientNameWithTestTool"))
      {
        id v79 = -[NSMutableDictionary safeObjectForKey:ofClass:]( v102,  "safeObjectForKey:ofClass:",  @"ClientName",  objc_opt_class(&OBJC_CLASS___NSString));
        v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
        if (v80)
        {
          v81 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:%@",  @"TestTool",  v80);
          -[NSMutableDictionary setSafeObject:forKey:](v102, "setSafeObject:forKey:", v81, @"ClientName");
        }

        else
        {
          -[NSMutableDictionary setSafeObject:forKey:]( v102,  "setSafeObject:forKey:",  @"TestTool",  @"ClientName");
        }

        __int128 v46 = v92;
        v73 = v102;
      }
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsManager recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:result:an alyticsFileType:isAutoDownload:isPallas:pallasAssetAudience:isUserPriority:bytesWritten:bytesTransferredE st:brainVersion:additionalData:]",  @"Recording event for: %@",  v74,  v75,  v76,  v77,  (uint64_t)v73);
    v78 = (void *)v99;
    id v82 =  -[MADAnalyticsManager recordEventWithName:assetType:payload:]( self,  "recordEventWithName:assetType:payload:",  @"com.apple.mobileassetd.Download.Attempt",  v99,  v73);
  }

  else
  {
    v73 = v102;
    _MobileAssetLog( v68,  6,  (uint64_t)"-[MADAnalyticsManager recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:result:an alyticsFileType:isAutoDownload:isPallas:pallasAssetAudience:isUserPriority:bytesWritten:bytesTransferredE st:brainVersion:additionalData:]",  @"Not recording event for : %@",  v69,  v70,  v71,  v72,  (uint64_t)v102);
    v78 = (void *)v99;
  }
}

- (id)recordCacheDeleteAttempt:(int64_t)a3 timeTakenSecs:(double)a4 cacheDeleteUrgency:(int64_t)a5 results:(id)a6 targetPurgeVolume:(id)a7 triggeringOperation:(int64_t)a8
{
  id v14 = a6;
  io_registry_entry_t v15 = (__CFString *)a7;
  if (self->_recordCacheDeleteTelemetry && -[MADAnalyticsManager eventRecordingEnabled](self, "eventRecordingEnabled"))
  {
    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v17 = (char *)[v14 reclaimUnlockedUnreferencedAutoAssetCount];
    uint64_t v18 = &v17[(void)[v14 reclaimUnlockedReferencedAutoAssetCount]];
    uint64_t v19 = (char *)[v14 reclaimUnlockedUnreferencedAutoAssetSpace];
    uint64_t v20 = &v19[(void)[v14 reclaimUnlockedReferencedAutoAssetSpace]];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    -[NSMutableDictionary setSafeObject:forKey:](v16, "setSafeObject:forKey:", v21, @"TargetingReclaimAmount");

    CFTypeRef v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    -[NSMutableDictionary setSafeObject:forKey:](v16, "setSafeObject:forKey:", v22, @"TotalCacheDeleteTime");

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a5));
    -[NSMutableDictionary setSafeObject:forKey:](v16, "setSafeObject:forKey:", v23, @"CacheDeleteUrgency");

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 reclaimV2AssetSpace]));
    -[NSMutableDictionary setSafeObject:forKey:](v16, "setSafeObject:forKey:", v24, @"ReclaimV2AssetSpace");

    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 reclaimV2AssetCount]));
    -[NSMutableDictionary setSafeObject:forKey:](v16, "setSafeObject:forKey:", v25, @"ReclaimV2AssetCount");

    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 reclaimLockedNeverRemoveAutoAssetCount]));
    -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v26,  @"ReclaimLockedNeverRemoveAutoAssetCount");

    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 reclaimLockedNeverRemoveAutoAssetSpace]));
    -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v27,  @"ReclaimLockedNeverRemoveAutoAssetSpace");

    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 reclaimLockedOverridableAutoAssetCount]));
    -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v28,  @"ReclaimLockedOverridableAutoAssetCount");

    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 reclaimLockedOverridableAutoAssetSpace]));
    -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v29,  @"ReclaimLockedOverridableAutoAssetSpace");

    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 reclaimStagedAutoAssetCount]));
    -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v30,  @"ReclaimStagedAutoAssetCount");

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 reclaimStagedAutoAssetSpace]));
    -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v31,  @"ReclaimStagedAutoAssetSpace");

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v18));
    -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v32,  @"ReclaimUnlockedAutoAssetCount");

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v20));
    -[NSMutableDictionary setSafeObject:forKey:]( v16,  "setSafeObject:forKey:",  v33,  @"ReclaimUnlockedAutoAssetSpace");

    if (v15) {
      uint64_t v34 = v15;
    }
    else {
      uint64_t v34 = @"/private/var";
    }
    -[NSMutableDictionary setSafeObject:forKey:](v16, "setSafeObject:forKey:", v34, @"TargetingVolume");
    uint64_t v35 = convertGarbageCollectionOperationToString(a8);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    -[NSMutableDictionary setSafeObject:forKey:](v16, "setSafeObject:forKey:", v36, @"TriggeringOperation");

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( -[MADAnalyticsManager recordEventWithName:assetType:payload:]( self,  "recordEventWithName:assetType:payload:",  @"com.apple.mobileassetd.CacheDelete.Attempt",  0LL,  v16));
  }

  else
  {
    uint64_t v37 = 0LL;
  }

  return v37;
}

- (id)recordMobileAssetSecureAttempt:(id)a3 assetType:(id)a4 assetVersion:(id)a5 clientName:(id)a6 operation:(int64_t)a7 secureReason:(id)a8 fromLocation:(id)a9 sucessfullyPersonalized:(BOOL)a10 personalizeFailureReason:(id)a11 sucessfullyMounted:(BOOL)a12 mountingFailureReason:(id)a13 successfullyGrafted:(BOOL)a14 graftingFailureReason:(id)a15 successfullyMappedToExclave:(BOOL)a16 mapToExclaveFailureReason:(id)a17
{
  HIDWORD(v48) = a16;
  LODWORD(v48) = a10;
  id v21 = a4;
  __int128 v53 = (const __CFString *)a11;
  CFTypeRef v22 = (__CFString *)a13;
  uint64_t v23 = (__CFString *)a15;
  __int128 v52 = (__CFString *)a17;
  id v24 = a9;
  id v25 = a8;
  id v26 = a6;
  id v27 = a5;
  id v28 = a3;
  id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v28, @"AssetSpecifier");

  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v21, @"AssetType");
  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v27, @"AssetVersion");

  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v26, @"ClientName");
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 stringValue]);
  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v31, @"Operation");

  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v25, @"SecureReason");
  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v24, @"FromLocation");

  if ((a7 & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    if (v22) {
      uint64_t v32 = v22;
    }
    else {
      uint64_t v32 = @"N/A";
    }
    -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v32, @"MountingFailureReason", v48);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a12));
    -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v33, @"MountingResult");

    goto LABEL_7;
  }

  -[NSMutableDictionary setSafeObject:forKey:]( v29,  "setSafeObject:forKey:",  @"N/A",  @"MountingFailureReason");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v34, @"MountingResult");

  if ((unint64_t)(a7 - 3) <= 3)
  {
LABEL_7:
    if (v23) {
      uint64_t v35 = v23;
    }
    else {
      uint64_t v35 = @"N/A";
    }
    -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v35, @"GraftingFailureReason", v48);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a14));
    -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v36, @"GraftingResult");

    uint64_t v37 = v52;
    goto LABEL_11;
  }

  -[NSMutableDictionary setSafeObject:forKey:]( v29,  "setSafeObject:forKey:",  @"N/A",  @"GraftingFailureReason");
  id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v43, @"GraftingResult");

  uint64_t v37 = v52;
  if ((unint64_t)(a7 - 7) <= 1)
  {
    uint64_t v39 = (__CFString *)v53;
    if (v53) {
      id v44 = v53;
    }
    else {
      id v44 = @"N/A";
    }
    -[NSMutableDictionary setSafeObject:forKey:]( v29,  "setSafeObject:forKey:",  v44,  @"PersonalizeFailureReason",  v48);
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v49));
    -[NSMutableDictionary setSafeObject:forKey:](v29, "setSafeObject:forKey:", v45, @"PersonalizeResult");

    goto LABEL_21;
  }

- (id)recordPushNotification:(id)a3 assetType:(id)a4 cloudChannels:(id)a5 forPopulationType:(int64_t)a6 userInitiated:(BOOL)a7 interestAcrossTerm:(BOOL)a8 lockAcrossReboot:(BOOL)a9 lockAcrossTermination:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "componentsJoinedByString:", @", "));
  LOWORD(v21) = __PAIR16__(a10, a9);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[MADAnalyticsManager recordPushNotification:assetType:cloudChannel:forPopulationType:userInitiated:interestAcrossTerm:lockAcrossReboot:lockAcrossTermination:]( self,  "recordPushNotification:assetType:cloudChannel:forPopulationType:userInitiated:interestAcrossTerm:loc kAcrossReboot:lockAcrossTermination:",  v17,  v16,  v18,  a6,  v11,  v10,  v21));

  return v19;
}

- (id)recordPushNotification:(id)a3 assetType:(id)a4 cloudChannel:(id)a5 forPopulationType:(int64_t)a6 userInitiated:(BOOL)a7 interestAcrossTerm:(BOOL)a8 lockAcrossReboot:(BOOL)a9 lockAcrossTermination:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v17, @"AssetSpecifier");

  -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v16, @"AssetType");
  -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v15, @"CloudChannel");

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
  -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v19, @"PopulationType");

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v20, @"UserInitiated");

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
  -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v21, @"LockAcrossTermination");

  CFTypeRef v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a9));
  -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v22, @"LockAcrossReboot");

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a10));
  -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v23, @"LockAcrossTermination");

  id v24 = (void *)objc_claimAutoreleasedReturnValue( -[MADAnalyticsManager recordEventWithName:assetType:payload:]( self,  "recordEventWithName:assetType:payload:",  @"com.apple.mobileassetd.notifications.push",  v16,  v18));
  return v24;
}

- (id)recordMobileAssetPromotionAttempt:(id)a3 assetType:(id)a4 assetVersion:(id)a5 osPromotion:(BOOL)a6 successfullyPromoted:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:](v15, "setSafeObject:forKey:", v14, @"AssetSpecifier");

  -[NSMutableDictionary setSafeObject:forKey:](v15, "setSafeObject:forKey:", v13, @"AssetType");
  -[NSMutableDictionary setSafeObject:forKey:](v15, "setSafeObject:forKey:", v12, @"AssetVersion");

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  -[NSMutableDictionary setSafeObject:forKey:](v15, "setSafeObject:forKey:", v16, @"OSPromotion");

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  -[NSMutableDictionary setSafeObject:forKey:](v15, "setSafeObject:forKey:", v17, @"StagingPromotionResult");

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[MADAnalyticsManager recordEventWithName:assetType:payload:]( self,  "recordEventWithName:assetType:payload:",  @"com.apple.mobileassetd.Staging.Promotion",  v13,  v15));
  return v18;
}

- (NSString)savePath
{
  return self->_savePath;
}

- (BOOL)overrideClientNameAsTestTool
{
  return self->_overrideClientNameAsTestTool;
}

- (void)setOverrideClientNameAsTestTool:(BOOL)a3
{
  self->_overrideClientNameAsTestTool = a3;
}

- (BOOL)prependClientNameWithTestTool
{
  return self->_prependClientNameWithTestTool;
}

- (void)setPrependClientNameWithTestTool:(BOOL)a3
{
  self->_prependClientNameWithTestTool = a3;
}

- (BOOL)recordCacheDeleteTelemetry
{
  return self->_recordCacheDeleteTelemetry;
}

- (void)setRecordCacheDeleteTelemetry:(BOOL)a3
{
  self->_recordCacheDeleteTelemetry = a3;
}

- (void)setAssetTypeEventTracker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end