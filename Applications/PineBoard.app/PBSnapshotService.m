@interface PBSnapshotService
+ (PBDependencyDescription)dependencyDescription;
+ (PBSnapshotService)sharedInstance;
+ (unint64_t)migrateWithContext:(id)a3 error:(id *)a4;
+ (void)_invalidateImagesWithDeveloperType:(char)a3;
+ (void)_invalidateSnapshotsWithMask:(unint64_t)a3 applicationInfo:(id)a4 manifest:(id)a5;
- (NSMutableArray)pendingImageOperations;
- (NSMutableDictionary)snapshotManifestByBundleIdentifier;
- (NSOperationQueue)imageProcessingQueue;
- (OS_dispatch_queue)accessQueue;
- (PBAppInfoController)appInfoController;
- (PBSnapshotService)init;
- (id)_snapshotManifestForBundleIdentifier:(id)a3 applicationInfo:(id)a4;
- (id)_sortDescriptorsForImageScale:(double)a3;
- (id)loadSnapshotImageWithRequest:(id)a3;
- (int64_t)_userInterfaceStyleForFocusedProcess;
- (void)_cancelSnapshotOperationsWithGroupID:(id)a3;
- (void)_cancelWallpaperOperations;
- (void)_ingestDefaultLaunchImageForApplicationInfo:(id)a3;
- (void)_invalidateAllSnapshotsForApplicationInfo:(id)a3;
- (void)_processImageOperation:(id)a3;
- (void)_processImageOperationsSync:(id)a3;
- (void)_processPendingOperations;
- (void)_saveWallpaperForSnapshotImage:(id)a3 synchronously:(BOOL)a4 completion:(id)a5;
- (void)_updateSnapshot:(id)a3 withContext:(id)a4 forProcessWithIdentifier:(id)a5 completion:(id)a6;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)cancelSnapshotsForSceneID:(id)a3;
- (void)dealloc;
- (void)ingestLaunchImages;
- (void)invalidateSnapshotsForBundleIdentifier:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)saveSnapshotForScene:(id)a3 context:(id)a4 completion:(id)a5;
- (void)saveWallpaperForSnapshotImage:(id)a3 completion:(id)a4;
- (void)setupWallpaper;
@end

@implementation PBSnapshotService

+ (unint64_t)migrateWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 isBuildUpdate];
  id v7 = [v5 compareFromOSVersionWithOSVersion:@"11.0"];
  if ([v5 compareFromOSVersionWithOSVersion:@"11.0"])
  {
    BOOL v8 = 0;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 toBuild]);
    BOOL v8 = [v5 compareFromBuildVersionWithBuildVersion:v9] == (id)1;
  }

  int v10 = v7 == (id)-1LL || v8;
  if (!v6)
  {
    if (v10)
    {
      unint64_t v13 = 3LL;
      [a1 _invalidateImagesWithDeveloperType:3];
      goto LABEL_15;
    }

+ (void)_invalidateImagesWithDeveloperType:(char)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  128LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000BCB90;
  v18[3] = &unk_1003D5628;
  char v19 = a3;
  [v5 setFilter:v18];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v11),  "bundleIdentifier",  (void)v14));
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 installedApplicationWithBundleIdentifier:v12]);

        [a1 _invalidateSnapshotsWithMask:-1 applicationInfo:v13 manifest:0];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v9);
  }
}

+ (PBDependencyDescription)dependencyDescription
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000BCC2C;
  v3[3] = &unk_1003CFF78;
  v3[4] = a1;
  return  -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v3);
}

+ (PBSnapshotService)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BCCC4;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470A00 != -1) {
    dispatch_once(&qword_100470A00, block);
  }
  return (PBSnapshotService *)(id)qword_1004709F8;
}

- (PBSnapshotService)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBSnapshotService;
  v2 = -[PBSnapshotService init](&v16, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    snapshotManifestByBundleIdentifier = v2->_snapshotManifestByBundleIdentifier;
    v2->_snapshotManifestByBundleIdentifier = v3;

    id v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    imageProcessingQueue = v2->_imageProcessingQueue;
    v2->_imageProcessingQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v2->_imageProcessingQueue,  "setMaxConcurrentOperationCount:",  1LL);
    -[NSOperationQueue setName:]( v2->_imageProcessingQueue,  "setName:",  @"com.apple.PBSnapshotService.imageProcessing");
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingImageOperations = v2->_pendingImageOperations;
    v2->_pendingImageOperations = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.PineBoard.PBSnapshotService.access", 0LL);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    -[NSOperationQueue addObserver:forKeyPath:options:context:]( v2->_imageProcessingQueue,  "addObserver:forKeyPath:options:context:",  v2,  @"operations",  0LL,  off_10046B298);
    id v11 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
    unint64_t v13 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v11,  "initWithInfoStore:filter:delegate:",  v12,  &stru_1003D5648,  v2);
    appInfoController = v2->_appInfoController;
    v2->_appInfoController = v13;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSnapshotService;
  -[PBSnapshotService dealloc](&v3, "dealloc");
}

- (void)ingestLaunchImages
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allInstalledApplications]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      dispatch_queue_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9);
        id v11 = objc_autoreleasePoolPush();
        -[PBSnapshotService _ingestDefaultLaunchImageForApplicationInfo:]( self,  "_ingestDefaultLaunchImageForApplicationInfo:",  v10,  (void)v12);
        objc_autoreleasePoolPop(v11);
        dispatch_queue_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

- (id)loadSnapshotImageWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationInfo]);

  if (v8)
  {
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationLaunchCompatibilityInfo compatibilityInfoForAppInfo:]( &OBJC_CLASS___XBApplicationLaunchCompatibilityInfo,  "compatibilityInfoForAppInfo:",  v8));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 launchInterfaces]);
    id v11 = [v10 count];

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[PBSnapshotService _snapshotManifestForBundleIdentifier:applicationInfo:]( self,  "_snapshotManifestForBundleIdentifier:applicationInfo:",  v5,  v8));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationSnapshotPredicate predicate]( &OBJC_CLASS___XBApplicationSnapshotPredicate,  "predicate"));
    [v18 setName:0];
    objc_msgSend(v18, "setReferenceSize:", v14, v16);
    char v19 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemAppearanceManager sharedInstance]( &OBJC_CLASS___PBSystemAppearanceManager,  "sharedInstance"));
    id v20 = [v19 effectiveUserInterfaceStyleForBundleIdentifier:v5];

    [v18 setUserInterfaceStyle:v20];
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationSnapshotFetchRequest fetchRequest]( &OBJC_CLASS___XBApplicationSnapshotFetchRequest,  "fetchRequest"));
    v56 = v18;
    v22 = v18;
    v23 = v21;
    [v21 setPredicate:v22];
    [v4 preferredScaleFactor];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBSnapshotService _sortDescriptorsForImageScale:](self, "_sortDescriptorsForImageScale:"));
    [v23 setSortDescriptors:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v5,  @"default"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);

    id v27 = sub_100083F78();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_10027C038();
    }

    v58 = v23;
    v59 = v26;
    if (v11)
    {
      [v9 setLaunchesOpaque:0];
      id v29 = objc_alloc_init(&OBJC_CLASS___XBLaunchStateRequest);
      [v29 setGroupID:v26];
      objc_msgSend(v29, "setReferenceSize:", v14, v16);
      objc_msgSend(v29, "setNaturalSize:", v14, v16);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](&OBJC_CLASS___FBDisplayManager, "mainConfiguration"));
      [v29 setDisplayConfiguration:v30];

      [v29 setUserInterfaceStyle:v20];
      v31 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultLaunchInterface]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
      [v29 setLaunchInterfaceIdentifier:v32];

      v26 = v59;
      id v33 = [[XBApplicationSnapshotGenerationContext alloc] initWithApplicationCompatibilityInfo:v9 launchRequest:v29 timeout:2.0];
      [v58 setFallbackGenerationContext:v33];

      v23 = v58;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v4 variant]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v17 snapshotsForGroupID:v26 fetchRequest:v23]);
    id v36 = sub_100083F78();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      sub_10027BFD8();
    }
    v57 = v17;

    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v38 = v35;
    id v39 = [v38 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v61;
      v55 = v5;
      while (2)
      {
        v42 = v9;
        id v43 = v4;
        v44 = v8;
        for (i = 0LL; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v61 != v41) {
            objc_enumerationMutation(v38);
          }
          v46 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
          if (v34)
          {
            id v47 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v60 + 1) + 8 * (void)i) variantWithIdentifier:v34]);
          }

          if ([v46 isValid])
          {
            id v47 = v46;
LABEL_25:
            uint64_t v8 = v44;
            id v4 = v43;
            dispatch_queue_t v9 = v42;
            id v5 = v55;
            v26 = v59;
            goto LABEL_26;
          }
        }

        id v40 = [v38 countByEnumeratingWithState:&v60 objects:v66 count:16];
        id v47 = 0LL;
        uint64_t v8 = v44;
        id v4 = v43;
        dispatch_queue_t v9 = v42;
        id v5 = v55;
        v26 = v59;
        if (v40) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v47 = 0LL;
    }

- (void)saveSnapshotForScene:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  [v9 scale];
  double v13 = v12;
  [v9 frame];
  if (!v11
    || (v28.origin.x = CGRectZero.origin.x,
        v28.origin.y = CGRectZero.origin.y,
        v28.size.width = CGRectZero.size.width,
        v28.size.height = CGRectZero.size.height,
        CGRectEqualToRect(*(CGRect *)&v14, v28)))
  {
    id v18 = sub_100083F78();
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10027C098();
    }
LABEL_5:
    uint64_t v20 = 1LL;
    goto LABEL_6;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 uiPresentationManager]);

  if (v21)
  {
    if (v13 > 0.0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[FBSceneSnapshotContext contextWithFBSContext:]( &OBJC_CLASS___FBSceneSnapshotContext,  "contextWithFBSContext:",  v9));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v8 createSnapshotWithContext:v22]);

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProcess]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);

        -[PBSnapshotService _updateSnapshot:withContext:forProcessWithIdentifier:completion:]( self,  "_updateSnapshot:withContext:forProcessWithIdentifier:completion:",  v23,  v9,  v25,  v10);
        goto LABEL_8;
      }

      uint64_t v20 = 4LL;
      if (!v10) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }

    id v27 = sub_100083F78();
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10027C158();
    }
    goto LABEL_5;
  }

  id v26 = sub_100083F78();
  char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10027C0F8();
  }
  uint64_t v20 = 4LL;
LABEL_6:

  if (v10) {
LABEL_7:
  }
    v10[2](v10, v20);
LABEL_8:
}

- (void)setupWallpaper
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [&off_1003FE6F8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&off_1003FE6F8);
        }
        id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v7) unsignedIntegerValue];
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper _wallpaperPathForVariant:userInterfaceStyle:]( &OBJC_CLASS___TVSUIWallpaper,  "_wallpaperPathForVariant:userInterfaceStyle:",  1LL,  v8));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper _wallpaperPathForVariant:userInterfaceStyle:]( &OBJC_CLASS___TVSUIWallpaper,  "_wallpaperPathForVariant:userInterfaceStyle:",  3LL,  v8));
        if (![v3 fileExistsAtPath:v9 isDirectory:0]
          || ([v3 fileExistsAtPath:v10 isDirectory:0] & 1) == 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper _wallpaperImageForVariant:userInterfaceStyle:]( &OBJC_CLASS___TVSUIWallpaper,  "_wallpaperImageForVariant:userInterfaceStyle:",  0LL,  v8));
          -[PBSnapshotService _saveWallpaperForSnapshotImage:synchronously:completion:]( self,  "_saveWallpaperForSnapshotImage:synchronously:completion:",  v11,  1LL,  0LL);
        }

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [&off_1003FE6F8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }
}

- (void)saveWallpaperForSnapshotImage:(id)a3 completion:(id)a4
{
}

- (void)_saveWallpaperForSnapshotImage:(id)a3 synchronously:(BOOL)a4 completion:(id)a5
{
  BOOL v40 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = _os_activity_create( (void *)&_mh_execute_header,  "snapshotService/wallpaper",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &state);

  -[PBSnapshotService _cancelWallpaperOperations](self, "_cancelWallpaperOperations");
  uint64_t v10 = dispatch_group_create();
  v80[0] = 0LL;
  v80[1] = v80;
  v80[2] = 0x3032000000LL;
  v80[3] = sub_1000BE13C;
  v80[4] = sub_1000BE14C;
  id v81 = 0LL;
  v78[0] = 0LL;
  v78[1] = v78;
  v78[2] = 0x3032000000LL;
  v78[3] = sub_1000BE13C;
  v78[4] = sub_1000BE14C;
  id v79 = 0LL;
  v76[0] = 0LL;
  v76[1] = v76;
  v76[2] = 0x3032000000LL;
  v76[3] = sub_1000BE13C;
  v76[4] = sub_1000BE14C;
  id v77 = 0LL;
  v74[0] = 0LL;
  v74[1] = v74;
  v74[2] = 0x3032000000LL;
  v74[3] = sub_1000BE13C;
  v74[4] = sub_1000BE14C;
  id v75 = 0LL;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_1000BE164;
  v67[3] = &unk_1003D5698;
  id v11 = v7;
  BOOL v73 = v40;
  id v68 = v11;
  v69 = v80;
  v70 = v78;
  v71 = v76;
  v72 = v74;
  __int128 v12 = objc_retainBlock(v67);
  __int128 v13 = v12;
  if (v40)
  {
    ((void (*)(void *))v12[2])(v12);
    __int128 v14 = 0LL;
  }

  else
  {
    dispatch_group_enter(v10);
    __int128 v15 = objc_alloc(&OBJC_CLASS____PBWallpaperGenerateOperation);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_1000BE784;
    v64[3] = &unk_1003D2560;
    id v66 = v13;
    v65 = v10;
    __int128 v14 = -[_PBWallpaperGenerateOperation initWithGenerationBlock:](v15, "initWithGenerationBlock:", v64);
    -[_PBWallpaperGenerateOperation setQualityOfService:](v14, "setQualityOfService:", 33LL);
  }

  int64_t v16 = -[PBSnapshotService _userInterfaceStyleForFocusedProcess](self, "_userInterfaceStyleForFocusedProcess");
  v37 = v13;
  v62[0] = 0LL;
  v62[1] = v62;
  v62[2] = 0x2020000000LL;
  char v63 = 0;
  if (v16 == 1) {
    dispatch_group_enter(v10);
  }
  id v38 = v14;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_1000BE7B4;
  v61[3] = &unk_1003D56C0;
  v61[4] = v80;
  __int128 v17 = -[_PBWallpaperSaveOperation initWithVariant:userInterfaceStyle:imageProvider:]( objc_alloc(&OBJC_CLASS____PBWallpaperSaveOperation),  "initWithVariant:userInterfaceStyle:imageProvider:",  1LL,  1LL,  v61);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_1000BE7D4;
  v57[3] = &unk_1003D56E8;
  v59 = v62;
  BOOL v60 = v16 == 1;
  id v18 = v10;
  v58 = v18;
  -[_PBWallpaperSaveOperation setSaveCompletion:](v17, "setSaveCompletion:", v57);
  id v39 = v17;
  if (v16 == 2) {
    dispatch_group_enter(v18);
  }
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_1000BE80C;
  v56[3] = &unk_1003D56C0;
  v56[4] = v78;
  char v19 = -[_PBWallpaperSaveOperation initWithVariant:userInterfaceStyle:imageProvider:]( objc_alloc(&OBJC_CLASS____PBWallpaperSaveOperation),  "initWithVariant:userInterfaceStyle:imageProvider:",  1LL,  2LL,  v56);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000BE82C;
  v52[3] = &unk_1003D56E8;
  v54 = v62;
  BOOL v55 = v16 == 2;
  uint64_t v20 = v18;
  uint64_t v53 = v20;
  -[_PBWallpaperSaveOperation setSaveCompletion:](v19, "setSaveCompletion:", v52);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BE864;
  block[3] = &unk_1003D5710;
  v51 = v62;
  id v34 = v8;
  id v50 = v34;
  id v36 = v20;
  dispatch_group_notify(v20, &_dispatch_main_q, block);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000BE8AC;
  v48[3] = &unk_1003D56C0;
  v48[4] = v76;
  v21 = -[_PBWallpaperSaveOperation initWithVariant:userInterfaceStyle:imageProvider:]( objc_alloc(&OBJC_CLASS____PBWallpaperSaveOperation),  "initWithVariant:userInterfaceStyle:imageProvider:",  3LL,  1LL,  v48);
  v22 = v14;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000BE8CC;
  v47[3] = &unk_1003D56C0;
  v47[4] = v74;
  v23 = -[_PBWallpaperSaveOperation initWithVariant:userInterfaceStyle:imageProvider:]( objc_alloc(&OBJC_CLASS____PBWallpaperSaveOperation),  "initWithVariant:userInterfaceStyle:imageProvider:",  3LL,  2LL,  v47);
  v24 = objc_alloc(&OBJC_CLASS____PBWallpaperSaveOperation);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000BE8EC;
  v45[3] = &unk_1003D5738;
  id v35 = v11;
  id v46 = v35;
  v25 = -[_PBWallpaperSaveOperation initWithVariant:userInterfaceStyle:imageProvider:]( v24,  "initWithVariant:userInterfaceStyle:imageProvider:",  0LL,  v16,  v45);
  if (v38)
  {
    id v26 = v36;
    id v27 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v38,  0LL,  v34);
  }

  else
  {
    id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v26 = v36;
  }

  CGRect v28 = v27;
  if (v16 == 1)
  {
    v85[0] = v39;
    v85[1] = v21;
    v85[2] = v25;
    v85[3] = v19;
    v85[4] = v23;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v85, 5LL));
  }

  else
  {
    v84[0] = v19;
    v84[1] = v23;
    v84[2] = v25;
    v84[3] = v39;
    v84[4] = v21;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 5LL));
  }

  -[NSMutableArray addObjectsFromArray:](v28, "addObjectsFromArray:", v29);

  if (v40)
  {
    -[PBSnapshotService _processImageOperationsSync:](self, "_processImageOperationsSync:", v28);
  }

  else
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    v30 = v28;
    id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v41,  v83,  16LL);
    if (v31)
    {
      uint64_t v32 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v30);
          }
          -[PBSnapshotService _processImageOperation:]( self,  "_processImageOperation:",  *(void *)(*((void *)&v41 + 1) + 8LL * (void)i));
        }

        id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v41,  v83,  16LL);
      }

      while (v31);
    }

    __int128 v13 = v37;
    v22 = v38;
    id v26 = v36;
  }

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v78, 8);

  _Block_object_dispose(v80, 8);
  os_activity_scope_leave(&state);
}

- (void)invalidateSnapshotsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 installedApplicationWithBundleIdentifier:v4]);

  [(id)objc_opt_class(self) _invalidateSnapshotsWithMask:1 applicationInfo:v6 manifest:0];
}

- (void)cancelSnapshotsForSceneID:(id)a3
{
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000BEA0C;
  v6[3] = &unk_1003CFEB8;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (id)_snapshotManifestForBundleIdentifier:(id)a3 applicationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (XBApplicationSnapshotManifest *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_snapshotManifestByBundleIdentifier,  "objectForKey:",  v6));
  if (!v8)
  {
    id v8 = -[XBApplicationSnapshotManifest initWithApplicationInfo:]( objc_alloc(&OBJC_CLASS___XBApplicationSnapshotManifest),  "initWithApplicationInfo:",  v7);
    -[NSMutableDictionary setObject:forKey:](self->_snapshotManifestByBundleIdentifier, "setObject:forKey:", v8, v6);
  }

  return v8;
}

+ (void)_invalidateSnapshotsWithMask:(unint64_t)a3 applicationInfo:(id)a4 manifest:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      uint64_t v10 = (XBApplicationSnapshotManifest *)v8;
    }
    else {
      uint64_t v10 = -[XBApplicationSnapshotManifest initWithApplicationInfo:]( objc_alloc(&OBJC_CLASS___XBApplicationSnapshotManifest),  "initWithApplicationInfo:",  v7);
    }
    id v11 = v10;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationSnapshotPredicate predicate]( &OBJC_CLASS___XBApplicationSnapshotPredicate,  "predicate"));
    [v12 setContentTypeMask:a3];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v13,  @"default"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);

    -[XBApplicationSnapshotManifest deleteSnapshotsForGroupID:matchingPredicate:]( v11,  "deleteSnapshotsForGroupID:matchingPredicate:",  v15,  v12);
  }
}

- (void)_invalidateAllSnapshotsForApplicationInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBSnapshotService _snapshotManifestForBundleIdentifier:applicationInfo:]( self,  "_snapshotManifestForBundleIdentifier:applicationInfo:",  v5,  v4));

  [(id)objc_opt_class(self) _invalidateSnapshotsWithMask:-1 applicationInfo:v4 manifest:v6];
  snapshotManifestByBundleIdentifier = self->_snapshotManifestByBundleIdentifier;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  -[NSMutableDictionary removeObjectForKey:](snapshotManifestByBundleIdentifier, "removeObjectForKey:", v8);
}

- (void)_ingestDefaultLaunchImageForApplicationInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    id v38 = self;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBSnapshotService _snapshotManifestForBundleIdentifier:applicationInfo:]( self,  "_snapshotManifestForBundleIdentifier:applicationInfo:",  v6,  v5));

    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationLaunchCompatibilityInfo compatibilityInfoForAppInfo:]( &OBJC_CLASS___XBApplicationLaunchCompatibilityInfo,  "compatibilityInfoForAppInfo:",  v5));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v35 launchInterfaces]);
    id v9 = [v8 count];

    if (!v9)
    {
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      uint64_t v10 = +[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR")
          ? &off_1003FE710
          : &off_1003FE728;
      __int128 v43 = 0uLL;
      __int128 v44 = 0uLL;
      id obj = v10;
      id v11 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v42;
        uint64_t v36 = *(void *)v42;
        v37 = v7;
        do
        {
          __int128 v14 = 0LL;
          id v39 = v12;
          do
          {
            if (*(void *)v42 != v13) {
              objc_enumerationMutation(obj);
            }
            __int128 v15 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v14);
            int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationSnapshotPredicate predicate]( &OBJC_CLASS___XBApplicationSnapshotPredicate,  "predicate"));
            [v16 setName:0];
            [v15 doubleValue];
            objc_msgSend(v16, "setImageScale:");
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
            [v17 bounds];
            objc_msgSend(v16, "setReferenceSize:", v18, v19);

            [v16 setContentTypeMask:4];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
            v21 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v20,  @"default"));
            v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);

            v23 = (void *)objc_claimAutoreleasedReturnValue([v7 snapshotsForGroupID:v22 matchingPredicate:v16]);
            if (![v23 count])
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue([v7 createSnapshotWithGroupID:v22]);
              [v24 setName:0];
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
              [v25 bounds];
              objc_msgSend(v24, "setReferenceSize:", v26, v27);

              [v24 setContentType:2];
              CGRect v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
              id v29 = v5;
              v30 = (void *)objc_claimAutoreleasedReturnValue([v28 systemVersion]);
              [v24 setRequiredOSVersion:v30];

              else {
                id v31 = [v29 hasTemplateLaunchImage];
              }
              objc_msgSend(v24, "pb_setIsTemplateImage:", v31);
              uint64_t v32 = objc_alloc(&OBJC_CLASS___PBDefaultLaunchImageDataProvider);
              [v15 doubleValue];
              id v33 = -[PBDefaultLaunchImageDataProvider initWithBundleIdentifier:scaleFactor:]( v32,  "initWithBundleIdentifier:scaleFactor:",  v20);
              id v34 = -[_PBSnapshotSaveOperation initWithSnapshot:dataProvider:manifest:]( objc_alloc(&OBJC_CLASS____PBSnapshotSaveOperation),  "initWithSnapshot:dataProvider:manifest:",  v24,  v33,  v37);
              -[PBSnapshotService _processImageOperation:](v38, "_processImageOperation:", v34);

              id v5 = v29;
              id v7 = v37;
              uint64_t v13 = v36;
              id v12 = v39;
            }

            __int128 v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        }

        while (v12);
      }
    }
  }
}

- (void)_updateSnapshot:(id)a3 withContext:(id)a4 forProcessWithIdentifier:(id)a5 completion:(id)a6
{
  id v48 = a3;
  id v45 = a4;
  id v47 = a5;
  id v44 = a6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v47]);
  id v46 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationInfo]);

  if (!v46) {
    goto LABEL_12;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v45 settings]);
  if (([v12 isUISubclass] & 1) == 0)
  {

LABEL_6:
    else {
      uint64_t v15 = 1LL;
    }
    goto LABEL_9;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v45 settings]);
  BOOL v14 = [v13 userInterfaceStyle] == (id)2;

  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v15 = 2LL;
LABEL_9:
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[PBSnapshotService _snapshotManifestForBundleIdentifier:applicationInfo:]( self,  "_snapshotManifestForBundleIdentifier:applicationInfo:",  v47,  v46));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v48 context]);
  [v17 frame];
  double v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  double v26 = (void *)objc_claimAutoreleasedReturnValue(+[XBApplicationSnapshotPredicate predicate](&OBJC_CLASS___XBApplicationSnapshotPredicate, "predicate"));
  [v26 setContentTypeMask:1];
  objc_msgSend(v26, "setReferenceSize:", *(double *)&v23, *(double *)&v25);
  [v26 setUserInterfaceStyle:v15];
  [v26 setName:0];
  double v27 = (void *)objc_claimAutoreleasedReturnValue([v48 context]);
  CGRect v28 = (void *)objc_claimAutoreleasedReturnValue([v27 sceneID]);

  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v16 snapshotsForGroupID:v28 matchingPredicate:v26]);
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v45 name]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pb_createSnapshotForSceneSnapshot:withName:", v48, v43));
  objc_msgSend(v29, "setReferenceSize:", *(double *)&v23, *(double *)&v25);
  objc_msgSend(v29, "setContentFrame:", *(double *)&v19, *(double *)&v21, *(double *)&v23, *(double *)&v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 systemVersion]);
  [v29 setRequiredOSVersion:v31];

  [v29 setUserInterfaceStyle:v15];
  objc_msgSend(v29, "pb_setIsTemplateImage:", 0);
  id v32 = sub_100083F78();
  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = sub_1000BD564(v29);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    *(_DWORD *)buf = 138412290;
    v58 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Request For Snapshot %@", buf, 0xCu);
  }

  uint64_t v36 = -[PBSceneSnapshotDataProvider initWithSceneSnapshot:scaleFactor:]( objc_alloc(&OBJC_CLASS___PBSceneSnapshotDataProvider),  "initWithSceneSnapshot:scaleFactor:",  v48,  1.0);
  v37 = -[_PBSnapshotSaveOperation initWithSnapshot:dataProvider:manifest:]( objc_alloc(&OBJC_CLASS____PBSnapshotSaveOperation),  "initWithSnapshot:dataProvider:manifest:",  v29,  v36,  v16);
  objc_initWeak((id *)buf, self);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1000BF7A4;
  v49[3] = &unk_1003D57A0;
  id v38 = v29;
  id v50 = v38;
  id v55 = v44;
  id v39 = v42;
  id v51 = v39;
  id v40 = v16;
  id v52 = v40;
  v56[1] = v19;
  v56[2] = v21;
  v56[3] = v23;
  v56[4] = v25;
  void v56[5] = (id)v15;
  id v41 = v28;
  id v53 = v41;
  id v54 = v47;
  objc_copyWeak(v56, (id *)buf);
  -[_PBSnapshotSaveOperation setGenerationCompletion:](v37, "setGenerationCompletion:", v49);
  -[PBSnapshotService _processImageOperation:](self, "_processImageOperation:", v37);
  objc_destroyWeak(v56);

  objc_destroyWeak((id *)buf);
LABEL_12:
}

- (id)_sortDescriptorsForImageScale:(double)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationSnapshotSortDescriptor sortDescriptorWithKey:ascending:comparator:]( &OBJC_CLASS___XBApplicationSnapshotSortDescriptor,  "sortDescriptorWithKey:ascending:comparator:",  7LL,  1LL,  &stru_1003D57E0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationSnapshotSortDescriptor sortDescriptorWithKey:ascending:comparator:]( &OBJC_CLASS___XBApplicationSnapshotSortDescriptor,  "sortDescriptorWithKey:ascending:comparator:",  10LL,  1LL,  &stru_1003D5800));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000BFC0C;
  v9[3] = &unk_1003D5820;
  *(double *)&v9[4] = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationSnapshotSortDescriptor sortDescriptorWithKey:ascending:comparator:]( &OBJC_CLASS___XBApplicationSnapshotSortDescriptor,  "sortDescriptorWithKey:ascending:comparator:",  6LL,  1LL,  v9));
  v10[0] = v4;
  v10[1] = v6;
  v10[2] = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 3LL));

  return v7;
}

- (int64_t)_userInterfaceStyleForFocusedProcess
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentApplicationSceneHandle]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientProcessBundleIdentifier]);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppearanceManager sharedInstance](&OBJC_CLASS___PBSystemAppearanceManager, "sharedInstance"));
  id v9 = [v8 effectiveUserInterfaceStyleForBundleIdentifier:v6];

  return (int64_t)v9;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046B298 == a6)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000BFE4C;
    block[3] = &unk_1003CFF08;
    void block[4] = self;
    dispatch_async(v8, block);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___PBSnapshotService;
    -[PBSnapshotService observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_processImageOperation:(id)a3
{
  id v4 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  objc_super v9 = sub_1000BFEF0;
  uint64_t v10 = &unk_1003CFEB8;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, &v7);
  -[PBSnapshotService _processPendingOperations](self, "_processPendingOperations", v7, v8, v9, v10, v11);
}

- (void)_cancelWallpaperOperations
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BFF64;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)_cancelSnapshotOperationsWithGroupID:(id)a3
{
  id v4 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C012C;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)_processImageOperationsSync:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083F78();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Processing Image Operations Synchronously [START]",  buf,  2u);
  }

  -[NSOperationQueue addOperations:waitUntilFinished:]( self->_imageProcessingQueue,  "addOperations:waitUntilFinished:",  v4,  1LL);
  id v7 = sub_100083F78();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Processing Image Operations Synchronously [END]",  v9,  2u);
  }
}

- (void)_processPendingOperations
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C03B8;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSOperationQueue)imageProcessingQueue
{
  return self->_imageProcessingQueue;
}

- (NSMutableArray)pendingImageOperations
{
  return self->_pendingImageOperations;
}

- (NSMutableDictionary)snapshotManifestByBundleIdentifier
{
  return self->_snapshotManifestByBundleIdentifier;
}

- (PBAppInfoController)appInfoController
{
  return self->_appInfoController;
}

- (void).cxx_destruct
{
}

@end