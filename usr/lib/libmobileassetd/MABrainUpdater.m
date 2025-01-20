@interface MABrainUpdater
+ (id)sharedInstance;
- (BOOL)hasAppleConnect;
- (BOOL)stage:(id)a3 error:(id *)a4;
- (BOOL)writePlist:(id)a3 path:(id)a4 error:(id *)a5;
- (MABrainBundle)bundle;
- (MABrainUpdater)init;
- (NSDictionary)info;
- (void)callback:(id)a3 error:(id)a4;
- (void)commit;
- (void)garbageCollect;
- (void)install:(id)a3 asset:(id)a4 options:(id)a5 completion:(id)a6;
- (void)purge:(id)a3 completion:(id)a4;
- (void)schedule:(BOOL)a3;
- (void)start:(id)a3;
- (void)update:(id)a3 completion:(id)a4;
@end

@implementation MABrainUpdater

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_24);
  }
  return (id)sharedInstance___instance;
}

void __32__MABrainUpdater_sharedInstance__block_invoke(id a1)
{
  v1 = objc_autoreleasePoolPush();
  v2 = objc_alloc_init(&OBJC_CLASS___MABrainUpdater);
  v3 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
}

- (MABrainUpdater)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MABrainUpdater;
  v2 = -[MABrainUpdater init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileAssetBrain-updater", v4);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MobileAssetBrain-updater-callback", v8);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc_init(&OBJC_CLASS___MABrainScanner);
    scanner = v2->_scanner;
    v2->_scanner = v11;

    stagedRestoreVersion = v2->_stagedRestoreVersion;
    v2->_stagedRestoreVersion = 0LL;

    *(void *)&v2->_relaunchToken = -1LL;
    id waitForAppleConnectAction = v2->_waitForAppleConnectAction;
    v2->_id waitForAppleConnectAction = 0LL;
  }

  return v2;
}

- (void)start:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __24__MABrainUpdater_start___block_invoke;
  block[3] = &unk_34DB98;
  id v7 = a3;
  v8 = self;
  uint64_t v4 = start__pred;
  id v5 = v7;
  if (v4 != -1) {
    dispatch_once(&start__pred, block);
  }
}

void __24__MABrainUpdater_start___block_invoke(uint64_t a1)
{
  id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Starting MABrainUpdater..."));
  id v3 = [v2 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater start:]_block_invoke",  @"[MAB] %s",  v4,  v5,  v6,  v7,  (uint64_t)v3);

  v8 = objc_autoreleasePoolPush();
  id v9 = [*(id *)(a1 + 32) mutableCopy];
  id ImageUUID = MABrainUtilityGetImageUUID();
  v11 = (void *)objc_claimAutoreleasedReturnValue(ImageUUID);
  [v9 setObject:v11 forKeyedSubscript:@"libmobileassetd-uuid"];

  id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"\ninfo = %@", v9));
  id v13 = [v12 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater start:]_block_invoke",  @"[MAB] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);

  [v9 setObject:0 forKeyedSubscript:@"commit"];
  [v9 setObject:0 forKeyedSubscript:@"relaunch-on-unlock"];
  uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v9));
  uint64_t v19 = *(void *)(a1 + 40);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"_CompatibilityVersion"]);
  if (!v21)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MABrainLoader did not specify compatiblity version"));
    goto LABEL_5;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"_CompatibilityVersion"]);
  signed int v23 = [v22 intValue];
  signed int v24 = [&off_38F070 intValue];

  if (v23 > v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"_CompatibilityVersion"]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MABrainLoader specified specious compatiblity version: %@",  v25));

    v27 = (void *)v26;
LABEL_5:
    id v28 = v27;
    id v29 = [v28 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainUpdater start:]_block_invoke",  @"[MAB] %s",  v30,  v31,  v32,  v33,  (uint64_t)v29);
    goto LABEL_7;
  }

  id v28 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"_CompatibilityVersion"]);
  [*(id *)(*(void *)(a1 + 40) + 24) setCompatibilityVersion:v28];
LABEL_7:

  v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"bundlePath"]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"bundleId"]);
  if (v34)
  {
    v36 = -[MABrainBundle initWithPath:](objc_alloc(&OBJC_CLASS___MABrainBundle), "initWithPath:", v34);
    if (v36)
    {
      uint64_t v37 = *(void *)(a1 + 40);
      v38 = v36;
      id v39 = *(id *)(v37 + 32);
      *(void *)(v37 + 32) = v38;
    }

    else
    {
      id v39 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Allocating bundle failed for %@", v34));
      id v40 = [v39 UTF8String];
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainUpdater start:]_block_invoke",  @"[MAB] %s",  v41,  v42,  v43,  v44,  (uint64_t)v40);
      v38 = 0LL;
    }
  }

  else
  {
    v38 = 0LL;
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"commit"]);
  unsigned __int8 v46 = [v45 BOOLValue];

  v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"relaunch-on-unlock"]);
  unsigned int v48 = [v47 BOOLValue];

  if (v48)
  {
    id v49 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"mobileassetd needs to relaunch at next unlock"));
    id v50 = [v49 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater start:]_block_invoke",  @"[MAB] %s",  v51,  v52,  v53,  v54,  (uint64_t)v50);

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainBundle proposedTargetPath](&OBJC_CLASS___MABrainBundle, "proposedTargetPath"));
    if (v55)
    {
      v56 = -[MABrainBundle initWithPath:](objc_alloc(&OBJC_CLASS___MABrainBundle), "initWithPath:", v55);
      v57 = v56;
      if (v56)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle brainInfo](v56, "brainInfo"));
        v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"MobileAssetProperties"]);
        uint64_t v60 = objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:@"RestoreVersion"]);
        uint64_t v61 = *(void *)(a1 + 40);
        v62 = *(void **)(v61 + 48);
        *(void *)(v61 + 48) = v60;

        v63 = *(const __CFString **)(*(void *)(a1 + 40) + 48LL);
        if (!v63) {
          v63 = @"nil";
        }
        id v64 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAssetBrain (version: %@) staged for next relaunch", v63));
        id v65 = [v64 UTF8String];
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater start:]_block_invoke",  @"[MAB] %s",  v66,  v67,  v68,  v69,  (uint64_t)v65);
      }
    }

    MABrainUtilityScheduleDeviceUnlockAction( *(void **)(*(void *)(a1 + 40) + 8LL),  @"Relaunch mobileassetd",  (int *)(*(void *)(a1 + 40) + 56LL),  &__block_literal_global_220);
  }

  else
  {
    v70 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 8LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __24__MABrainUpdater_start___block_invoke_3;
    block[3] = &unk_34E380;
    unsigned __int8 v87 = v46;
    id v71 = v35;
    uint64_t v72 = *(void *)(a1 + 40);
    id v85 = v71;
    uint64_t v86 = v72;
    dispatch_async(v70, block);
  }

  [*(id *)(a1 + 40) schedule:MABrainUtilityReleaseTestMode()];
  v73 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:@"built-in"]);
  if ([v73 BOOLValue])
  {
  }

  else
  {
    int v74 = MABrainUtilityCrashLoopTestMode();

    if (v74)
    {
      unsigned int v75 = time(0LL);
      srand(v75);
      int v76 = rand() % 20 + 1;
      id v77 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Crash loop testing is enabled. mobileassetd will exit in %d seconds", v76));
      id v78 = [v77 UTF8String];
      _MobileAssetLog( 0LL,  7,  (uint64_t)"-[MABrainUpdater start:]_block_invoke",  @"[MAB] %s",  v79,  v80,  v81,  v82,  (uint64_t)v78);

      dispatch_time_t v83 = dispatch_time(0LL, 1000000000LL * v76);
      dispatch_after(v83, &_dispatch_main_q, &__block_literal_global_230);
    }
  }

  objc_autoreleasePoolPop(v8);
}

void __24__MABrainUpdater_start___block_invoke_2(id a1, BOOL a2)
{
  id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Exiting mobileassetd for relaunch..."));
  id v3 = [v2 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater start:]_block_invoke_2",  @"[MAB] %s",  v4,  v5,  v6,  v7,  (uint64_t)v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainRestartManager sharedInstance](&OBJC_CLASS___MABrainRestartManager, "sharedInstance"));
  [v8 quiesceAndRestartMobileAsset];

  exit(1);
}

id __24__MABrainUpdater_start___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
  {
    id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAssetBrain bundle %@ needs to be committed as current", *(void *)(a1 + 32)));
    id v3 = [v2 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater start:]_block_invoke_3",  @"[MAB] %s",  v4,  v5,  v6,  v7,  (uint64_t)v3);

    [*(id *)(a1 + 40) commit];
  }

  return [*(id *)(a1 + 40) garbageCollect];
}

void __24__MABrainUpdater_start___block_invoke_4(id a1)
{
  id v1 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Exiting mobileassetd for crash loop testing..."));
  id v2 = [v1 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater start:]_block_invoke_4",  @"[MAB] %s",  v3,  v4,  v5,  v6,  (uint64_t)v2);

  raise(5);
}

- (void)schedule:(BOOL)a3
{
  uint64_t v5 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.mobileassetd-MobileAssetBrain_check");
  uint64_t v6 = v5;
  if (v5)
  {
    -[NSBackgroundActivityScheduler setPreregistered:](v5, "setPreregistered:", 0LL);
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    if (a3)
    {
      uint64_t v40 = 0LL;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x2020000000LL;
      char v43 = 1;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __27__MABrainUpdater_schedule___block_invoke;
      block[3] = &unk_34F9A8;
      void block[4] = &v40;
      if (schedule__onceToken != -1) {
        dispatch_once(&schedule__onceToken, block);
      }
      if (*((_BYTE *)v41 + 24))
      {
        double v8 = MABrainUtilityReleaseTestModeInterval();
      }

      else
      {
        id v15 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Release Test Mode is enabled. Scheduling update on startup..."));
        id v16 = [v15 UTF8String];
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater schedule:]",  @"[MAB] %s",  v17,  v18,  v19,  v20,  (uint64_t)v16);

        double v8 = 1.0;
      }

      -[NSBackgroundActivityScheduler setTolerance:](v6, "setTolerance:", v8);
      -[NSBackgroundActivityScheduler setQualityOfService:](v6, "setQualityOfService:", 17LL);
      _Block_object_dispose(&v40, 8);
    }

    else
    {
      -[NSBackgroundActivityScheduler setInterval:](v6, "setInterval:", MABrainUtilityScanInterval());
      -[NSBackgroundActivityScheduler setRepeats:](v6, "setRepeats:", 1LL);
    }

    -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:]( v6,  "_setAdditionalXPCActivityProperties:",  v7);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = __27__MABrainUpdater_schedule___block_invoke_2;
    v36[3] = &unk_34E380;
    v36[4] = self;
    BOOL v38 = a3;
    v21 = v6;
    uint64_t v37 = v21;
    v22 = objc_retainBlock(v36);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = __27__MABrainUpdater_schedule___block_invoke_4;
    v31[3] = &unk_34FA18;
    BOOL v35 = a3;
    id v32 = (id)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler description](v21, "description"));
    uint64_t v33 = @"com.apple.mobileassetd-MobileAssetBrain_check";
    id v34 = v22;
    signed int v23 = v22;
    id v24 = v32;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v21, "scheduleWithBlock:", v31);
    id v25 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully scheduled %@", v21));
    id v26 = [v25 UTF8String];
    _MobileAssetLog(0LL, 6, (uint64_t)"-[MABrainUpdater schedule:]", @"[MAB] %s", v27, v28, v29, v30, (uint64_t)v26);
  }

  else
  {
    id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Allocating scheduler object failed"));
    id v10 = [v9 UTF8String];
    _MobileAssetLog(0LL, 3, (uint64_t)"-[MABrainUpdater schedule:]", @"[MAB] %s", v11, v12, v13, v14, (uint64_t)v10);
  }
}

uint64_t __27__MABrainUpdater_schedule___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
  return result;
}

void __27__MABrainUpdater_schedule___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = *(id *)(*(void *)(a1 + 32) + 48LL);
  if (v3) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"restoreVersion");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"nonDiscetionary");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __27__MABrainUpdater_schedule___block_invoke_3;
  v5[3] = &unk_34F9F0;
  uint64_t v4 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  char v8 = *(_BYTE *)(a1 + 48);
  id v7 = v4;
  [v6 update:v2 completion:v5];
}

void __27__MABrainUpdater_schedule___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@"UpdateResult.plist"]);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:@"MobileAssetProperties"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RestoreVersion"]);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  @"currentRestoreVersion");
  char v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, @"eventTime");

  if (v3)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ %ld",  v9,  [v3 code]));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, @"result");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, @"failureReason");
    id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAssetBrain update failed:\n%@", v5));
    id v13 = [v12 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainUpdater schedule:]_block_invoke_3",  @"[MAB] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"success",  @"result");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  *(void *)(*(void *)(a1 + 32) + 48LL),  @"targetRestoreVersion");
    id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAssetBrain update completed successfully:\n%@", v5));
    id v18 = [v10 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater schedule:]_block_invoke_3",  @"[MAB] %s",  v19,  v20,  v21,  v22,  (uint64_t)v18);
  }

  if (!*(_BYTE *)(a1 + 48))
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v28 = [v27 fileExistsAtPath:v4];

    if (v28)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v52 = 0LL;
      unsigned int v30 = [v29 removeItemAtPath:v4 error:&v52];
      id v31 = v52;

      if (v30)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Removed stale UpdateResult.plist"));
        int v33 = 6;
      }

      else
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to remove stale UpdateResult.plist: %@",  v31));
        int v33 = 3;
      }

      id v46 = v32;
      id v47 = [v46 UTF8String];
      _MobileAssetLog( 0LL,  v33,  (uint64_t)"-[MABrainUpdater schedule:]_block_invoke",  @"[MAB] %s",  v48,  v49,  v50,  v51,  (uint64_t)v47);
    }

    goto LABEL_29;
  }

  signed int v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:@"built-in"]);
  unsigned __int8 v24 = [v23 BOOLValue];

  if ((v24 & 1) == 0)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v25 isEqualToString:@"MobileAssetBrainErrorDomain"])
    {
      id v26 = (char *)[v3 code];

      if (v26 == &stru_68.segname[2])
      {
        if (v3) {
          goto LABEL_29;
        }
        goto LABEL_24;
      }
    }

    else
    {
    }
  }

  v55[0] = NSFileOwnerAccountID;
  v55[1] = NSFileGroupOwnerAccountID;
  v56[0] = &off_38F088;
  v56[1] = &off_38F088;
  v55[2] = NSFilePosixPermissions;
  v56[2] = &off_38F0A0;
  id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL));
  BOOL v35 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);
  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v54 = 0LL;
    unsigned __int8 v37 = [v36 createDirectoryAtPath:v35 withIntermediateDirectories:1 attributes:v34 error:&v54];
    id v38 = v54;

    if ((v37 & 1) != 0) {
      goto LABEL_19;
    }
    id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create directory %@ for UpdateResult.plist: %@",  v35,  v38));
  }

  else
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create directory name from pathname %@",  v4));
    id v38 = 0LL;
  }

  id v40 = v39;
  id v41 = [v40 UTF8String];
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainUpdater schedule:]_block_invoke",  @"[MAB] %s",  v42,  v43,  v44,  v45,  (uint64_t)v41);

LABEL_19:
  MABrainUtilityWriteDictionary(v5, v4, 0LL);
  if (v3)
  {
    [*(id *)(a1 + 40) invalidate];
    [*(id *)(a1 + 32) schedule:1];
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __27__MABrainUpdater_schedule___block_invoke_2_276;
    block[3] = &unk_34DBC0;
    void block[4] = *(void *)(a1 + 32);
    if (MACancelDownloadErrorDomain_block_invoke_onceToken != -1) {
      dispatch_once(&MACancelDownloadErrorDomain_block_invoke_onceToken, block);
    }
  }

  if (!v3)
  {
LABEL_24:
  }

id __27__MABrainUpdater_schedule___block_invoke_2_276(uint64_t a1)
{
  return [*(id *)(a1 + 32) schedule:0];
}

void __27__MABrainUpdater_schedule___block_invoke_3_277(id a1)
{
  id v1 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Exiting mobileassetd for release testing..."));
  id v2 = [v1 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater schedule:]_block_invoke_3",  @"[MAB] %s",  v3,  v4,  v5,  v6,  (uint64_t)v2);

  raise(15);
}

void __27__MABrainUpdater_schedule___block_invoke_4(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 56)) {
    uint64_t v3 = "[ReleaseTestMode] ";
  }
  else {
    uint64_t v3 = "";
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v18 = a2;
  id v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%sActivity %@ %@ fired.", v3, v4, v5));
  id v7 = [v6 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater schedule:]_block_invoke_4",  @"[MAB] %s",  v8,  v9,  v10,  v11,  (uint64_t)v7);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%sActivity %@ %@ will complete asynchronously.", v3, *(void *)(a1 + 32), *(void *)(a1 + 40)));
  id v13 = [v12 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater schedule:]_block_invoke_4",  @"[MAB] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);

  v18[2](v18, 1LL);
}

- (void)commit
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __24__MABrainUpdater_commit__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  if (commit_onceToke != -1) {
    dispatch_once(&commit_onceToke, block);
  }
}

void __24__MABrainUpdater_commit__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 32))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) objectForKeyedSubscript:@"bundleId"]);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32LL);
    id v15 = 0LL;
    unsigned __int8 v5 = [v4 stageCurrent:&v15];
    id v6 = v15;
    if ((v5 & 1) != 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Successfully committed MobileAssetBrain bundle %@ as current.",  v3));
      int v8 = 6;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error committing MobileAssetBrain bundle %@ as current: %@",  v3,  v6));
      int v8 = 3;
    }

    id v9 = v7;
    id v10 = [v9 UTF8String];
    _MobileAssetLog( 0LL,  v8,  (uint64_t)"-[MABrainUpdater commit]_block_invoke",  @"[MAB] %s",  v11,  v12,  v13,  v14,  (uint64_t)v10);
  }

- (void)garbageCollect
{
}

- (BOOL)stage:(id)a3 error:(id *)a4
{
  return +[MABrainBundle stageProposed:error:](&OBJC_CLASS___MABrainBundle, "stageProposed:error:", a3, a4);
}

- (BOOL)writePlist:(id)a3 path:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  id v35 = 0LL;
  unsigned int v10 = [v7 writeToURL:v9 error:&v35];
  id v11 = v35;

  if (v10)
  {
    id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully wrote %@.", v8));
    id v13 = [v12 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater writePlist:path:error:]",  @"[MAB] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);
LABEL_6:
    LOBYTE(v25) = 1;
    goto LABEL_8;
  }

  id v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to write %@: %@", v8, v11));
  id v19 = [v18 UTF8String];
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainUpdater writePlist:path:error:]",  @"[MAB] %s",  v20,  v21,  v22,  v23,  (uint64_t)v19);

  id v34 = 0LL;
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v7,  100LL,  0LL,  &v34));
  id v24 = v34;

  if (!v12)
  {
    LOBYTE(v25) = 0;
    id v11 = v24;
    goto LABEL_8;
  }

  id v33 = v24;
  unsigned int v25 = [v12 writeToFile:v8 options:0 error:&v33];
  id v11 = v33;

  if (v25)
  {
    id v26 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully wrote %@ (using NSData).", v8));
    id v27 = [v26 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater writePlist:path:error:]",  @"[MAB] %s",  v28,  v29,  v30,  v31,  (uint64_t)v27);

    id v11 = 0LL;
    goto LABEL_6;
  }

- (BOOL)hasAppleConnect
{
  id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"AppleConnect is not supported in this environment"));
  id v3 = [v2 UTF8String];
  _MobileAssetLog(0LL, 6, (uint64_t)"-[MABrainUpdater hasAppleConnect]", @"[MAB] %s", v4, v5, v6, v7, (uint64_t)v3);

  return 0;
}

- (void)install:(id)a3 asset:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v66 = a5;
  id v67 = a6;
  uint64_t v87 = 0LL;
  v88 = &v87;
  uint64_t v89 = 0x3032000000LL;
  v90 = __Block_byref_object_copy__13;
  v91 = __Block_byref_object_dispose__13;
  id v92 = 0LL;
  id v12 = v10;
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:v12]);
  v97[0] = NSFileOwnerAccountID;
  v97[1] = NSFileGroupOwnerAccountID;
  v98[0] = &off_38F088;
  v98[1] = &off_38F088;
  v97[2] = NSFilePosixPermissions;
  v98[2] = &off_38F0A0;
  id v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  3LL));
  id v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAssetBrain install of asset %@ is starting...", v11));
  id v14 = [v13 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater install:asset:options:completion:]",  @"[MAB] %s",  v15,  v16,  v17,  v18,  (uint64_t)v14);

  [v11 refreshState];
  if ([v11 state] == (char *)&dword_0 + 2)
  {
    id v19 = objc_alloc(&OBJC_CLASS___MABrainBundle);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 getLocalUrl]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
    uint64_t v22 = -[MABrainBundle initWithPath:](v19, "initWithPath:", v21);

    MABrainUtilityCancelDeviceUnlockAction(self->_relaunchToken);
    uint64_t v23 = self;
    objc_sync_enter(v23);
    p_uint64_t waitForAppleConnectToken = &v23->_waitForAppleConnectToken;
    uint64_t waitForAppleConnectToken = v23->_waitForAppleConnectToken;
    if ((_DWORD)waitForAppleConnectToken != -1)
    {
      MABrainUtilityCancelDeviceUnlockAction(waitForAppleConnectToken);
      id waitForAppleConnectAction = v23->_waitForAppleConnectAction;
      v23->_uint64_t waitForAppleConnectToken = -1;
      id v27 = (void (**)(id, uint64_t))objc_retainBlock(waitForAppleConnectAction);
      id v28 = v23->_waitForAppleConnectAction;
      v23->_id waitForAppleConnectAction = 0LL;

      if (v27) {
        v27[2](v27, 1LL);
      }
    }

    objc_sync_exit(v23);

    -[MABrainUpdater garbageCollect](v23, "garbageCollect");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v30 = (id *)(v88 + 5);
    id obj = (id)v88[5];
    unsigned int v31 = [v29 createDirectoryAtPath:v68 withIntermediateDirectories:1 attributes:v65 error:&obj];
    objc_storeStrong(v30, obj);

    if (v31)
    {
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472LL;
      v79[2] = __51__MABrainUpdater_install_asset_options_completion___block_invoke;
      v79[3] = &unk_34FA40;
      id v32 = v68;
      id v80 = v32;
      id v81 = v11;
      uint64_t v82 = v23;
      id v85 = &v87;
      id v83 = v12;
      id v64 = v67;
      id v84 = v64;
      id v33 = objc_retainBlock(v79);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:@"ssoToken"]);
      id v35 = " with SSO";
      if (!v34) {
        id v35 = "";
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Personalizing MobileAssetBrain%s...",  v35));

      id v37 = v36;
      id v38 = [v37 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater install:asset:options:completion:]",  @"[MAB] %s",  v39,  v40,  v41,  v42,  (uint64_t)v38);

      uint64_t v43 = (id *)(v88 + 5);
      id v78 = (id)v88[5];
      LODWORD(v36) = -[MABrainBundle personalize:options:error:](v22, "personalize:options:error:", v32, v66, &v78);
      objc_storeStrong(v43, v78);
      if ((_DWORD)v36)
      {
        ((void (*)(void *))v33[2])(v33);
LABEL_22:

        goto LABEL_23;
      }

      id v52 = (id)v88[5];
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:@"nonBlocking"]);
      unsigned __int8 v54 = [v53 BOOLValue];

      v55 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:@"ssoToken"]);
      if (v55) {
        char v56 = 1;
      }
      else {
        char v56 = v54;
      }
      if ((v56 & 1) != 0)
      {
      }

      else if (-[MABrainUpdater hasAppleConnect](v23, "hasAppleConnect"))
      {
        v57 = v52;
        char v58 = v54 ^ 1;
        v59 = v23;
        objc_sync_enter(v59);
        id v60 = v59[2];
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472LL;
        v69[2] = __51__MABrainUpdater_install_asset_options_completion___block_invoke_2;
        v69[3] = &unk_34FA68;
        id v70 = v66;
        char v77 = v58;
        id v52 = v57;
        id v71 = v22;
        id v72 = v32;
        unsigned int v75 = v33;
        id v61 = v60;
        id v73 = v61;
        id v76 = v64;
        id v74 = v57;
        v62 = objc_retainBlock(v69);
        v63 = v59[8];
        v59[8] = v62;

        MABrainUtilityScheduleDeviceUnlockAction( v59[1],  @"Copy AppleConnect SSO token",  p_waitForAppleConnectToken,  v59[8]);
        objc_sync_exit(v59);

LABEL_21:
        goto LABEL_22;
      }

      -[MABrainUpdater callback:error:](v23, "callback:error:", v64, v88[5]);
      goto LABEL_21;
    }

    v93[0] = NSDebugDescriptionErrorKey;
    v93[1] = NSUnderlyingErrorKey;
    uint64_t v48 = v88[5];
    v94[0] = @"Failed to create MobileAssetBrain install directory";
    v94[1] = v48;
    v93[2] = @"stagingPath";
    v94[2] = v68;
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v94,  v93,  3LL));
    uint64_t v50 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  161LL,  v49));
    uint64_t v51 = (void *)v88[5];
    v88[5] = v50;

    -[MABrainUpdater callback:error:](v23, "callback:error:", v67, v88[5]);
  }

  else
  {
    v95[0] = NSDebugDescriptionErrorKey;
    v95[1] = @"asset.state";
    v96[0] = @"Unexpected MABrain asset state";
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v11 state]));
    v96[1] = v44;
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v96,  v95,  2LL));
    uint64_t v46 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  101LL,  v45));
    id v47 = (void *)v88[5];
    v88[5] = v46;

    -[MABrainUpdater callback:error:](self, "callback:error:", v67, v88[5]);
    uint64_t v22 = 0LL;
  }

void __51__MABrainUpdater_install_asset_options_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingPathComponent:@"MobileAssetBrain.plist"]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
  [v3 setObject:v4 forKeyedSubscript:@"assetId"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) attributes]);
  [v3 setObject:v5 forKeyedSubscript:@"MobileAssetProperties"];

  id v6 = MABrainUtilityBootSessionUUID();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 setObject:v7 forKeyedSubscript:@"boot-session-uuid"];

  id v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id obj = *(id *)(v9 + 40);
  unsigned int v10 = [v8 writePlist:v3 path:v2 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (!v10)
  {
    v37[0] = NSDebugDescriptionErrorKey;
    v37[1] = NSUnderlyingErrorKey;
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    v38[0] = @"Failed to write MobileAssetBrain.plist";
    v38[1] = v25;
    v37[2] = @"brainPlistPath";
    v38[2] = v2;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));
    uint64_t v27 = 162LL;
LABEL_7:
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  v27,  v26));

    [*(id *)(a1 + 48) callback:*(void *)(a1 + 64) error:v29];
    goto LABEL_10;
  }

  id v11 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v35 = *(id *)(v13 + 40);
  unsigned int v14 = [v11 stage:v12 error:&v35];
  objc_storeStrong((id *)(v13 + 40), v35);
  if (!v14)
  {
    v39[0] = NSDebugDescriptionErrorKey;
    v39[1] = NSUnderlyingErrorKey;
    uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    v40[0] = @"Failed to write staging file";
    v40[1] = v28;
    v39[2] = @"stagingName";
    v40[2] = *(void *)(a1 + 56);
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  3LL));
    uint64_t v27 = 163LL;
    goto LABEL_7;
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0LL;

  int v17 = img4_nonce_domain_roll_nonce(&_img4_nonce_domain_cryptex1_asset);
  if (v17)
  {
    int v18 = v17;
    v41[0] = NSDebugDescriptionErrorKey;
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to roll the Cryptex1 MobileAssetBrain nonce"));
    v42[0] = v19;
    v41[1] = NSUnderlyingErrorKey;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v18,  0LL));
    v42[1] = v20;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  109LL,  v21));
    uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }

  else
  {
    id v19 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully rolled the Cryptex1 MobileAssetBrain nonce"));
    id v30 = [v19 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater install:asset:options:completion:]_block_invoke",  @"[MAB] %s",  v31,  v32,  v33,  v34,  (uint64_t)v30);
  }

  [*(id *)(a1 + 48) callback:*(void *)(a1 + 64) error:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
LABEL_10:
}

void __51__MABrainUpdater_install_asset_options_completion___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    NSErrorUserInfoKey v37 = NSDebugDescriptionErrorKey;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Operation canceled by superceding request"));
    id v38 = v3;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  107LL,  v4));

    id v6 = *(dispatch_queue_s **)(a1 + 56);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __51__MABrainUpdater_install_asset_options_completion___block_invoke_5;
    block[3] = &unk_34E208;
    id v29 = *(id *)(a1 + 80);
    id v7 = v5;
    id v28 = v7;
    dispatch_async(v6, block);

    id v8 = v29;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  *(void *)(a1 + 32)));
    id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Reading of AppleConnect token not supported in this environment"));
    id v10 = [v9 UTF8String];
    _MobileAssetLog(0LL, 6, (uint64_t)"copySsoToken", @"[MAB] %s", v11, v12, v13, v14, (uint64_t)v10);

    [v8 setObject:0 forKeyedSubscript:@"ssoToken"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ssoToken"]);

    if (v15)
    {
      id v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Personalizing MobileAssetBrain again, this time with AppleConnect SSO..."));
      id v17 = [v16 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater install:asset:options:completion:]_block_invoke_2",  @"[MAB] %s",  v18,  v19,  v20,  v21,  (uint64_t)v17);

      uint64_t v22 = *(void **)(a1 + 40);
      uint64_t v23 = *(void *)(a1 + 48);
      id v36 = 0LL;
      unsigned int v24 = [v22 personalize:v23 options:v8 error:&v36];
      id v7 = v36;
      if (v24)
      {
        (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
      }

      else
      {
        id v26 = *(dispatch_queue_s **)(a1 + 56);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = __51__MABrainUpdater_install_asset_options_completion___block_invoke_3;
        v33[3] = &unk_34E208;
        id v35 = *(id *)(a1 + 80);
        id v7 = v7;
        id v34 = v7;
        dispatch_async(v26, v33);
      }
    }

    else
    {
      uint64_t v25 = *(dispatch_queue_s **)(a1 + 56);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = __51__MABrainUpdater_install_asset_options_completion___block_invoke_4;
      v30[3] = &unk_34E208;
      id v32 = *(id *)(a1 + 80);
      id v31 = *(id *)(a1 + 64);
      dispatch_async(v25, v30);

      id v7 = 0LL;
    }
  }
}

uint64_t __51__MABrainUpdater_install_asset_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __51__MABrainUpdater_install_asset_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __51__MABrainUpdater_install_asset_options_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)callback:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __33__MABrainUpdater_callback_error___block_invoke;
  v11[3] = &unk_34E208;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(callbackQueue, v11);
}

uint64_t __33__MABrainUpdater_callback_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)update:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

  scanner = self->_scanner;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __36__MABrainUpdater_update_completion___block_invoke;
  v14[3] = &unk_34FB00;
  v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  -[MABrainScanner locateAvailableUpdateBrain:options:completion:]( scanner,  "locateAvailableUpdateBrain:options:completion:",  v13,  v12,  v14);
}

void __36__MABrainUpdater_update_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqualToString:@"MobileAssetBrainErrorDomain"])
    {
      id v9 = (char *)[v7 code];

      if (v9 == &stru_68.segname[2])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No MobileAssetBrain update found."));
        int v11 = 6;
LABEL_13:
        id v32 = v10;
        id v33 = [v32 UTF8String];
        _MobileAssetLog( 0LL,  v11,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke",  @"[MAB] %s",  v34,  v35,  v36,  v37,  (uint64_t)v33);

        id v38 = (void *)a1[4];
        uint64_t v39 = a1[7];
        uint64_t v40 = v7;
LABEL_14:
        [v38 callback:v39 error:v40];
        goto LABEL_15;
      }
    }

    else
    {
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MobileAsset brain scan failed: %@",  v7));
    int v11 = 3;
    goto LABEL_13;
  }

  id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAsset brain scan completed successfully\n MABrain asset: %@", v5));
  id v13 = [v12 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke",  @"[MAB] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);

  if (!v5)
  {
    id v41 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"No MobileAssetBrain update found, but no error was reported."));
    id v42 = [v41 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke",  @"[MAB] %s",  v43,  v44,  v45,  v46,  (uint64_t)v42);

    id v38 = (void *)a1[4];
    uint64_t v39 = a1[7];
    uint64_t v40 = 0LL;
    goto LABEL_14;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"RestoreVersion"]);
  uint64_t v20 = a1[4];
  uint64_t v21 = *(void **)(v20 + 48);
  *(void *)(v20 + 48) = v19;

  uint64_t v22 = *(const __CFString **)(a1[4] + 48LL);
  if (!v22) {
    uint64_t v22 = @"nil";
  }
  id v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Pending MobileAssetBrain version is now %@", v22));
  id v24 = [v23 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke",  @"[MAB] %s",  v25,  v26,  v27,  v28,  (uint64_t)v24);

  id v29 = -[MABrainDownloader initWithMAAsset:](objc_alloc(&OBJC_CLASS___MABrainDownloader), "initWithMAAsset:", v5);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = __36__MABrainUpdater_update_completion___block_invoke_2;
  v47[3] = &unk_34FAD8;
  id v30 = (void *)a1[5];
  uint64_t v31 = a1[6];
  v47[4] = a1[4];
  id v48 = v30;
  id v49 = v5;
  id v50 = (id)a1[6];
  id v51 = (id)a1[7];
  -[MABrainDownloader download:options:completion:](v29, "download:options:completion:", v48, v31, v47);

LABEL_15:
}

void __36__MABrainUpdater_update_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAsset brain download failed: %@", v3));
    id v5 = [v4 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke_2",  @"[MAB] %s",  v6,  v7,  v8,  v9,  (uint64_t)v5);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v10 isEqualToString:@"com.apple.MobileAssetError.Download"])
    {
      int v11 = (char *)[v3 code];

      if (v11 == &stru_20.segname[8]) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void **)(v21 + 48);
    *(void *)(v21 + 48) = 0LL;

    id v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Pending MobileAssetBrain version is now nil due to failed download"));
    id v24 = [v23 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke_2",  @"[MAB] %s",  v25,  v26,  v27,  v28,  (uint64_t)v24);

LABEL_8:
    [*(id *)(a1 + 32) callback:*(void *)(a1 + 64) error:v3];
    goto LABEL_9;
  }

  id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAsset brain download completed successfully"));
  id v13 = [v12 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke_2",  @"[MAB] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);

  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(a1 + 40);
  uint64_t v20 = *(dispatch_queue_s **)(v18 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __36__MABrainUpdater_update_completion___block_invoke_3;
  block[3] = &unk_34E118;
  void block[4] = v18;
  id v30 = v19;
  id v31 = *(id *)(a1 + 48);
  id v32 = *(id *)(a1 + 56);
  id v33 = *(id *)(a1 + 64);
  dispatch_async(v20, block);

LABEL_9:
}

void __36__MABrainUpdater_update_completion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __36__MABrainUpdater_update_completion___block_invoke_4;
  v6[3] = &unk_34FAB0;
  v6[4] = v2;
  id v9 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v2 install:v3 asset:v4 options:v5 completion:v6];
}

void __36__MABrainUpdater_update_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v20 = v3;
  if (!v3)
  {
    uint64_t v6 = *(const __CFString **)(*(void *)(a1 + 32) + 48LL);
    if (!v6) {
      uint64_t v6 = @"nil";
    }
    id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MobileAssetBrain (version: %@) install completed successfully",  v6);
    goto LABEL_10;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v4 isEqualToString:@"MobileAssetBrainErrorDomain"])
  {

    goto LABEL_9;
  }

  uint64_t v5 = (char *)[v20 code];

  if (v5 != &stru_68.sectname[3])
  {
LABEL_9:
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = 0LL;

    id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Pending MobileAssetBrain version is now nil due to failed install",  v19);
LABEL_10:
    id v10 = objc_claimAutoreleasedReturnValue(v7);
    id v11 = [v10 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke_4",  @"[MAB] %s",  v12,  v13,  v14,  v15,  (uint64_t)v11);
  }

  [*(id *)(a1 + 32) callback:*(void *)(a1 + 56) error:v20];
  [*(id *)(a1 + 40) purgeSync];
  uint64_t v16 = v20;
  if (!v20)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:@"relaunchBrain"]);
    if (v17)
    {
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      {
        if ([v17 BOOLValue]) {
          MABrainUtilityScheduleDeviceUnlockAction( *(void **)(*(void *)(a1 + 32) + 8LL),  @"Relaunch mobileassetd - brain updated",  (int *)(*(void *)(a1 + 32) + 56LL),  &__block_literal_global_370);
        }
      }
    }

    uint64_t v16 = 0LL;
  }
}

void __36__MABrainUpdater_update_completion___block_invoke_5(id a1, BOOL a2)
{
  id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Exiting MA brain before relaunching to use newly installed version"));
  id v3 = [v2 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater update:completion:]_block_invoke_5",  @"[MAB] %s",  v4,  v5,  v6,  v7,  (uint64_t)v3);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainRestartManager sharedInstance](&OBJC_CLASS___MABrainRestartManager, "sharedInstance"));
  [v8 quiesceAndRestartMobileAsset];

  exit(1);
}

- (void)purge:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"relaunchBrain"]);
  id v14 = 0LL;
  +[MABrainBundle destageProposed:](&OBJC_CLASS___MABrainBundle, "destageProposed:", &v14);
  id v8 = v14;
  id v13 = 0LL;
  +[MABrainBundle destageCurrent:](&OBJC_CLASS___MABrainBundle, "destageCurrent:", &v13);
  id v9 = v13;
  id v10 = v8;
  id v11 = v10;
  if (v9)
  {
    id v11 = v9;
  }

  -[MABrainUpdater callback:error:](self, "callback:error:", v6, v11);
  -[MABrainUpdater garbageCollect](self, "garbageCollect");
  if (v7)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
    {
    }
  }
}

void __35__MABrainUpdater_purge_completion___block_invoke(id a1)
{
  id v1 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Exiting mobileassetd to revert to built-in MobileAsset brain..."));
  id v2 = [v1 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainUpdater purge:completion:]_block_invoke",  @"[MAB] %s",  v3,  v4,  v5,  v6,  (uint64_t)v2);

  raise(15);
}

- (NSDictionary)info
{
  return self->_info;
}

- (MABrainBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
}

@end