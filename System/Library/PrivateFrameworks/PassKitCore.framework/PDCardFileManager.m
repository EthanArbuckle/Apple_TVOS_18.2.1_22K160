@interface PDCardFileManager
- (BOOL)_dc_deleteCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4;
- (BOOL)_dc_writeCard:(id)a3 writtenCard:(id *)a4 diff:(id *)a5 daemonData:(id *)a6 undecryptableAssets:(id *)a7 error:(id *)a8;
- (BOOL)writeCard:(id)a3 source:(int64_t)a4 error:(id *)a5;
- (PDCardFileManager)init;
- (PDCardFileManager)initWithDelegate:(id)a3 cloudStoreCoordinatorDelegate:(id)a4;
- (PDCardFileManager)initWithDelegate:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 maximumDownloadRetries:(unint64_t)a5 atURL:(id)a6;
- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinatorDelegate;
- (PKSecureElement)secureElement;
- (id)_cacheURLForUniqueID:(id)a3;
- (id)_cachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6;
- (id)_cachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6 cardDirectoryCoordinator:(id)a7;
- (id)_cardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 error:(id *)a5;
- (id)_contentForCardWithUniqueID:(id)a3;
- (id)_dataAccessorForCardDirectoryCoordinator:(id)a3 error:(id *)a4;
- (id)_dc_cardDirectoryCoordinatorForUniqueID:(id)a3;
- (id)_dc_cardWithUniqueID:(id)a3 error:(id *)a4;
- (id)_imageSetContainerForUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 ofType:(int64_t)a5 withDisplayProfile:(id)a6 suffix:(id)a7;
- (id)_imageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 withDisplayProfile:(id)a5 suffix:(id)a6;
- (id)_objectURLForUniqueID:(id)a3;
- (id)_ubiquityManager;
- (id)catalogOfRecord;
- (id)dataAccessorForObjectWithUniqueID:(id)a3;
- (id)localNonUbiquitousCatalogURL;
- (id)objectWithUniqueID:(id)a3;
- (id)passDaemonDataForUniqueID:(id)a3;
- (id)passTilesForUniqueID:(id)a3 withDescriptorStatePairs:(id)a4;
- (id)passUniqueIDs;
- (id)passes;
- (id)passesOfType:(unint64_t)a3;
- (void)_checkRevocationStatusForPass:(id)a3 withCompletion:(id)a4;
- (void)_createImageSetsForCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 displayProfile:(id)a5;
- (void)_dc_invalidateCardDirectoryCoordinatorForUniqueID:(id)a3;
- (void)_dc_performCacheMaintenanceActivity;
- (void)_deleteCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 forReason:(unint64_t)a5 withDiagnosticReason:(id)a6;
- (void)_deletePossibleInvalidCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4;
- (void)_downloadRemoteAssetsForCardWithUniqueID:(id)a3 completion:(id)a4;
- (void)_evaluateDownloadMissingAssetsActivityWithForcedReschedule:(BOOL)a3;
- (void)_performMissingAssetDownloadActivity;
- (void)_performRevocationCheckActivity;
- (void)_recursivelyCheckRevocationStatusForPassUniqueIdentifiers:(id)a3 osTransaction:(id)a4;
- (void)decryptPassAssets:(id)a3 undecryptableAssets:(id *)a4;
- (void)deleteAllWithDiagnosticReason:(id)a3;
- (void)deleteCardWithUniqueID:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5;
- (void)fetchCachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6 completion:(id)a7;
- (void)fetchContentForUniqueID:(id)a3 withCompletion:(id)a4;
- (void)fetchImageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 withDisplayProfile:(id)a5 suffix:(id)a6 completion:(id)a7;
- (void)performImageMigrationWithStartTime:(double)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4;
- (void)registerDatabaseObject:(id)a3;
- (void)restartUbiquity;
- (void)scheduleImmediateRevocationCheck;
- (void)setCloudStoreCoordinatorDelegate:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)startObservingUbiquityEvents;
- (void)startUbiquity;
- (void)ubiquitousCardDidChange:(id)a3;
- (void)ubiquitousCardWithUniqueIDRemoved:(id)a3;
- (void)ubiquitousCatalogDidChange:(id)a3;
- (void)writeCatalogOfRecord:(id)a3 source:(int64_t)a4;
@end

@implementation PDCardFileManager

- (PDCardFileManager)init
{
  return 0LL;
}

- (PDCardFileManager)initWithDelegate:(id)a3 cloudStoreCoordinatorDelegate:(id)a4
{
  uint64_t v6 = qword_100707988;
  id v7 = a4;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&qword_100707988, &stru_100643F38);
  }
  v9 = -[PDCardFileManager initWithDelegate:cloudStoreCoordinatorDelegate:maximumDownloadRetries:atURL:]( self,  "initWithDelegate:cloudStoreCoordinatorDelegate:maximumDownloadRetries:atURL:",  v8,  v7,  3LL,  qword_100707980);

  return v9;
}

- (PDCardFileManager)initWithDelegate:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 maximumDownloadRetries:(unint64_t)a5 atURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___PDCardFileManager;
  v13 = -[PDCardFileManager init](&v40, "init");
  if (v13)
  {
    v14 = (NSURL *)[v12 copy];
    cardsURL = v13->_cardsURL;
    v13->_cardsURL = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v16 createDirectoryAtURL:v13->_cardsURL withIntermediateDirectories:1 attributes:0 error:0];

    v17 = -[PKDirectoryCoordinator initWithURL:]( objc_alloc(&OBJC_CLASS___PKDirectoryCoordinator),  "initWithURL:",  v13->_cardsURL);
    directoryCoordinator = v13->_directoryCoordinator;
    v13->_directoryCoordinator = v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMapTable pk_copiedToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "pk_copiedToWeakObjectsMapTable"));
    cardDirectoryCoordinators = v13->_cardDirectoryCoordinators;
    v13->_cardDirectoryCoordinators = (NSMapTable *)v19;

    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_UNSPECIFIED, 0);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);

    id v25 = PDHeavyUtilityQueue();
    v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v25);
    dispatch_queue_t v27 = dispatch_queue_create_with_target_V2("com.apple.passd.PDCardFileManager.missingAsset", v24, v26);
    missingAssetQueue = v13->_missingAssetQueue;
    v13->_missingAssetQueue = (OS_dispatch_queue *)v27;

    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_cloudStoreCoordinatorDelegate, a4);
    v13->_maximumDownloadRetries = a5;
    id v29 = PDDefaultQueue();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    PDScheduledActivityClientRegister(@"PDCardFileManager", v13, v30);

    id v31 = PDDefaultQueue();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    PDScheduledActivityClientRegister(@"PDCardFileManagerMissingRemoteAssetsClientActivityIdentifier", v13, v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  0LL));
    [v33 setRepeating:1];
    [v33 setRequireNetworkConnectivity:1];
    [v33 setRepeatInterval:86400.0];
    PDScheduledActivityRegister(@"PDCardFileManager", @"RevocationCheck", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  0LL));
    [v34 setRepeating:1];
    [v34 setRequireScreenSleep:1];
    [v34 setRequireMainsPower:1];
    [v34 setRepeatInterval:1209600.0];
    PDScheduledActivityRegister(@"PDCardFileManager", @"CacheMaintenance", v34);
    id v35 = PDUtilityQueue();
    v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v35);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F2DD4;
    block[3] = &unk_100639300;
    v39 = v13;
    dispatch_async(v36, block);
  }

  return v13;
}

- (id)_ubiquityManager
{
  return self->_ubiquityManager;
}

- (void)startUbiquity
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F2E70;
  block[3] = &unk_100639300;
  void block[4] = self;
  if (qword_100707978 != -1) {
    dispatch_once(&qword_100707978, block);
  }
}

- (void)restartUbiquity
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _ubiquityManager](self, "_ubiquityManager"));
  [v2 restart];
}

- (void)startObservingUbiquityEvents
{
  if (PKPassbookIsSupported(self, a2))
  {
    id v3 = PDLastFSEventsURL();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4)
    {
      id v7 = v4;
      PDWatchFSEventsAtURL(v4);
      id v5 = PDDefaultQueue();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      PDXPCEventStreamRegisterObserver(self, @"com.apple.fsevents.matching", v6);

      v4 = v7;
    }
  }

- (void)performImageMigrationWithStartTime:(double)a3
{
  uint64_t v60 = 0LL;
  v61 = &v60;
  uint64_t v62 = 0x3032000000LL;
  v63 = sub_1000F34DC;
  v64 = sub_1000F34EC;
  id v65 = 0LL;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDCardFileManager passUniqueIDs](self, "passUniqueIDs"));
  double v7 = COERCE_DOUBLE([v6 count]);
  if (v7 != 0.0)
  {
    directoryCoordinator = self->_directoryCoordinator;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_1000F34F4;
    v56[3] = &unk_100643C20;
    v59 = &v60;
    id v57 = v6;
    v58 = self;
    -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v56);
  }

  objc_autoreleasePoolPop(v5);
  if (v7 != 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v10 = fmax(fmin(50.0 - fmax(Current - a3, 0.0), 30.0), 0.0);
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: beginning image migration for %lu passes.",  (uint8_t *)&buf,  0xCu);
    }

    v54[0] = 0LL;
    v54[1] = v54;
    v54[2] = 0x2810000000LL;
    v54[3] = &unk_10052E313;
    int v55 = 0;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v75 = 0x3032000000LL;
    v76 = sub_1000F34DC;
    v77 = sub_1000F34EC;
    id v78 = 0LL;
    uint64_t v50 = 0LL;
    v51 = (double *)&v50;
    uint64_t v52 = 0x2020000000LL;
    uint64_t v53 = 0LL;
    uint64_t v46 = 0LL;
    v47 = (double *)&v46;
    uint64_t v48 = 0x2020000000LL;
    double v49 = Current;
    uint64_t v13 = *(void *)&v7 >> 1;
    if (*(void *)&v7 <= 1uLL) {
      uint64_t v13 = 1LL;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F35C0;
    block[3] = &unk_100643C48;
    uint64_t v41 = v13;
    double v42 = v7;
    BOOL v45 = v10 < 2.0;
    id v6 = v6;
    id v34 = v6;
    id v35 = self;
    double v43 = Current;
    double v44 = v10;
    v36 = &v60;
    v37 = v54;
    v38 = &v46;
    p___int128 buf = &buf;
    objc_super v40 = &v50;
    dispatch_apply(2uLL, 0LL, block);
    v14 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v14 && (id v15 = [v14 count]) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = v51[3];
        CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
        double v18 = v47[3] - Current;
        *(_DWORD *)v66 = 134218752;
        double v67 = v16;
        __int16 v68 = 2048;
        double v69 = v7;
        __int16 v70 = 2048;
        double v71 = v17 - Current;
        __int16 v72 = 2048;
        double v73 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: finished image migration for %lu of %lu passes in %0.3fs (timed out in %0.3fs).",  v66,  0x2Au);
      }

      uint64_t v19 = objc_autoreleasePoolPush();
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectsAtIndexes:*(void *)(*((void *)&buf + 1) + 40)]);

      uint64_t v21 = objc_claimAutoreleasedReturnValue([(id)v61[5] objectsAtIndexes:*(void *)(*((void *)&buf + 1) + 40)]);
      v22 = (void *)v61[5];
      v61[5] = v21;

      objc_autoreleasePoolPop(v19);
      id v23 = PDHeavyUtilityQueue();
      v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000F3A28;
      v27[3] = &unk_100643C70;
      id v31 = v15;
      id v6 = v20;
      id v29 = self;
      v30 = &v60;
      v28 = (os_log_s *)v6;
      double v32 = Current;
      dispatch_block_t v25 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, v27);
      dispatch_async(v24, v25);

      id v12 = v28;
    }

    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v26 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)v66 = 134218240;
      double v67 = v7;
      __int16 v68 = 2048;
      double v69 = v26 - Current;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: finished image migration for %lu passes in %0.3fs.",  v66,  0x16u);
    }

    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(v54, 8);
  }

  _Block_object_dispose(&v60, 8);
}

- (id)passUniqueIDs
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = objc_autoreleasePoolPush();
  directoryCoordinator = self->_directoryCoordinator;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F3D38;
  v8[3] = &unk_100643C98;
  v8[4] = self;
  id v6 = v3;
  v9 = v6;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v8);

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (id)objectWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  uint64_t v25 = 0LL;
  CFAbsoluteTime v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_1000F34DC;
  id v29 = sub_1000F34EC;
  id v30 = 0LL;
  directoryCoordinator = self->_directoryCoordinator;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000F41C8;
  v22[3] = &unk_100643C20;
  v24 = &v25;
  v22[4] = self;
  id v7 = v4;
  id v23 = v7;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v22);
  uint64_t v8 = v26[5];
  id v21 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _cardWithUniqueID:cardDirectoryCoordinator:error:]( self,  "_cardWithUniqueID:cardDirectoryCoordinator:error:",  v7,  v8,  &v21));
  id v10 = v21;
  if (!v9 && v26[5])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v32 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Card file manager unable to instantiate object with unique ID %@",  buf,  0xCu);
    }

    id v13 = PDDefaultQueue();
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000F4204;
    v16[3] = &unk_10063ED08;
    id v17 = v10;
    id v18 = v7;
    uint64_t v19 = self;
    v20 = &v25;
    dispatch_async(v14, v16);
  }

  _Block_object_dispose(&v25, 8);
  objc_autoreleasePoolPop(v5);

  return v9;
}

- (id)dataAccessorForObjectWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  double v16 = sub_1000F34DC;
  id v17 = sub_1000F34EC;
  id v18 = 0LL;
  directoryCoordinator = self->_directoryCoordinator;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000F445C;
  v10[3] = &unk_100643C20;
  id v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v10);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _dataAccessorForCardDirectoryCoordinator:error:]( self,  "_dataAccessorForCardDirectoryCoordinator:error:",  v14[5],  0LL));

  _Block_object_dispose(&v13, 8);
  objc_autoreleasePoolPop(v5);

  return v8;
}

- (id)passes
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager passUniqueIDs](self, "passUniqueIDs", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager objectWithUniqueID:]( self,  "objectWithUniqueID:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8)));
        if (v9) {
          -[NSMutableArray addObject:](v3, "addObject:", v9);
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = -[NSMutableArray copy](v3, "copy");
  return v10;
}

- (id)passesOfType:(unint64_t)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager passUniqueIDs](self, "passUniqueIDs", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager objectWithUniqueID:]( self,  "objectWithUniqueID:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10)));
        __int128 v12 = v11;
        if (v11 && [v11 passType] == (id)a3) {
          -[NSMutableArray addObject:](v5, "addObject:", v12);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  id v13 = -[NSMutableArray copy](v5, "copy");
  return v13;
}

- (id)catalogOfRecord
{
  id v3 = sub_1000F4798();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[PDCardFileManager localNonUbiquitousCatalogURL]_0();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PKCatalog catalogWithContentsOfURL:nonUbiquitousCatalogURL:directoryCoordinator:]( &OBJC_CLASS___PKCatalog,  "catalogWithContentsOfURL:nonUbiquitousCatalogURL:directoryCoordinator:",  v4,  v6,  self->_directoryCoordinator));

  return v7;
}

- (id)localNonUbiquitousCatalogURL
{
  if (qword_1007079A8 != -1) {
    dispatch_once(&qword_1007079A8, &stru_100643F78);
  }
  return (id)qword_1007079A0;
}

- (void)fetchContentForUniqueID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDHeavyQueue();
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F48D4;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (id)passDaemonDataForUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_1000F34DC;
  uint64_t v25 = sub_1000F34EC;
  id v26 = 0LL;
  id v5 = objc_autoreleasePoolPush();
  uint64_t v15 = 0LL;
  __int128 v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  __int128 v18 = sub_1000F34DC;
  uint64_t v19 = sub_1000F34EC;
  id v20 = 0LL;
  directoryCoordinator = self->_directoryCoordinator;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000F4AD8;
  v12[3] = &unk_100643C20;
  __int128 v14 = &v15;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v12);
  id v8 = (void *)v16[5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000F4B14;
  v11[3] = &unk_100643CC0;
  v11[4] = &v21;
  [v8 performCoordinatedAction:v11];

  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v5);
  id v9 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)passTilesForUniqueID:(id)a3 withDescriptorStatePairs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1000F34DC;
  id v31 = sub_1000F34EC;
  id v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = objc_autoreleasePoolPush();
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_1000F34DC;
  uint64_t v25 = sub_1000F34EC;
  id v26 = 0LL;
  directoryCoordinator = self->_directoryCoordinator;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000F4D58;
  v18[3] = &unk_100643C20;
  id v20 = &v21;
  v18[4] = self;
  id v10 = v6;
  id v19 = v10;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v18);
  id v11 = (void *)v22[5];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F4D94;
  v15[3] = &unk_100643CE8;
  id v12 = v7;
  id v16 = v12;
  uint64_t v17 = &v27;
  [v11 performCoordinatedAction:v15];

  _Block_object_dispose(&v21, 8);
  objc_autoreleasePoolPop(v8);
  if ([(id)v28[5] count]) {
    id v13 = [(id)v28[5] copy];
  }
  else {
    id v13 = 0LL;
  }
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)_deletePossibleInvalidCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  directoryCoordinator = self->_directoryCoordinator;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = sub_1000F52D0;
  __int128 v18 = &unk_100643D38;
  id v9 = v7;
  id v19 = v9;
  uint64_t v21 = &v23;
  v22 = &v27;
  id v10 = v6;
  id v20 = v10;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", &v15);
  if (*((_BYTE *)v24 + 24))
  {
    int v11 = *((unsigned __int8 *)v28 + 24);
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    __int128 v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v31 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "CardFileManager is removing invalid pass with uniqueID %@",  buf,  0xCu);
      }

      -[PDCardFileManager _deleteCardWithUniqueID:cardDirectoryCoordinator:forReason:withDiagnosticReason:]( self,  "_deleteCardWithUniqueID:cardDirectoryCoordinator:forReason:withDiagnosticReason:",  v10,  v9,  0LL,  @"Card File Manager - Invalid Pass",  v15,  v16,  v17,  v18,  v19);
    }

    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1004417EC((uint64_t)v10, v14);
      }
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

- (void)fetchCachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = PDDefaultQueue();
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000F563C;
    v18[3] = &unk_100643D60;
    id v22 = v15;
    v18[4] = self;
    id v19 = v12;
    int64_t v23 = a4;
    id v20 = v13;
    id v21 = v14;
    dispatch_async(v17, v18);
  }
}

- (void)fetchImageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 withDisplayProfile:(id)a5 suffix:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = PDHeavyQueue();
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000F57CC;
    v18[3] = &unk_100643D60;
    id v22 = v15;
    v18[4] = self;
    id v19 = v12;
    int64_t v23 = a4;
    id v20 = v13;
    id v21 = v14;
    dispatch_async(v17, v18);
  }
}

- (BOOL)writeCard:(id)a3 source:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
  id obj = 0LL;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v11 = [WeakRetained shouldWritePass:v7 source:a4 error:&obj];

  if ((v11 & 1) != 0)
  {

    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: writing card %{public}@",  buf,  0xCu);
    }

    uint64_t v68 = 0LL;
    double v69 = &v68;
    uint64_t v70 = 0x2020000000LL;
    char v71 = 0;
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v75 = sub_1000F34DC;
    v76 = sub_1000F34EC;
    id v77 = 0LL;
    context = objc_autoreleasePoolPush();
    id obj = 0LL;
    p_id obj = &obj;
    uint64_t v64 = 0x3032000000LL;
    id v65 = sub_1000F34DC;
    v66 = sub_1000F34EC;
    id v67 = 0LL;
    id v31 = v7;
    id v32 = self;
    uint64_t v56 = 0LL;
    id v57 = &v56;
    uint64_t v58 = 0x3032000000LL;
    v59 = sub_1000F34DC;
    uint64_t v60 = sub_1000F34EC;
    id v61 = 0LL;
    id v15 = v8;
    uint64_t v50 = 0LL;
    v51 = &v50;
    uint64_t v52 = 0x3032000000LL;
    uint64_t v53 = sub_1000F34DC;
    v54 = sub_1000F34EC;
    id v55 = 0LL;
    uint64_t v44 = 0LL;
    BOOL v45 = &v44;
    uint64_t v46 = 0x3032000000LL;
    v47 = sub_1000F34DC;
    uint64_t v48 = sub_1000F34EC;
    id v49 = 0LL;
    directoryCoordinator = v32->_directoryCoordinator;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000F5DF8;
    v36[3] = &unk_100643D88;
    v38 = &v68;
    v36[4] = v32;
    id v17 = v7;
    id v37 = v17;
    v39 = &obj;
    objc_super v40 = &v56;
    uint64_t v41 = &v50;
    double v42 = &v44;
    double v43 = buf;
    -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v36);
    id v18 = p_obj[5];
    BOOL v19 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      id v8 = v15;
      if (v19)
      {
        *(_DWORD *)__int16 v72 = 138412290;
        double v73 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: wrote card with unique ID %@.",  v72,  0xCu);
      }

      if (a4 != 3 && [p_obj[5] supportsSyncing])
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _ubiquityManager](v32, "_ubiquityManager"));
        [v20 updateUbiquitousPass:v17];
      }

      id v21 = objc_loadWeakRetained((id *)p_delegate);
      [v21 passWritten:p_obj[5] withDaemonData:v51[5] diff:v57[5] fromSource:a4];

      if (![(id)v45[5] count]) {
        goto LABEL_21;
      }
      id v13 = (os_log_s *)objc_loadWeakRetained((id *)p_delegate);
      -[os_log_s cardFileManager:didFailToDecryptRemoteAssets:forPass:]( v13,  "cardFileManager:didFailToDecryptRemoteAssets:forPass:",  v32,  v45[5],  p_obj[5]);
    }

    else if (v19)
    {
      *(_DWORD *)__int16 v72 = 138412290;
      id v8 = v15;
      double v73 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: skipped writing card with unique ID %@.",  v72,  0xCu);
    }

    else
    {
      id v8 = v15;
    }

LABEL_21:
    char v26 = (void *)PDOSTransactionCreate("PDCardFileManager.revocation_check.write_card");
    id v27 = p_obj[5];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = nullsub_39;
    v34[3] = &unk_100639300;
    id v28 = v26;
    id v35 = v28;
    -[PDCardFileManager _checkRevocationStatusForPass:withCompletion:]( v32,  "_checkRevocationStatusForPass:withCompletion:",  v27,  v34);

    id v7 = v31;
    _Block_object_dispose(&v44, 8);

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v56, 8);

    _Block_object_dispose(&obj, 8);
    objc_autoreleasePoolPop(context);
    if (a5) {
      objc_storeStrong(a5, *(id *)(*(void *)&buf[8] + 40LL));
    }
    BOOL v25 = *((_BYTE *)v69 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v68, 8);
    goto LABEL_24;
  }

  uint64_t v22 = PKLogFacilityTypeGetObject(0LL);
  int64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = obj;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: not allowed to write card %{public}@ %{public}@",  buf,  0x16u);
  }

  if (a5) {
    objc_storeStrong(a5, obj);
  }

  BOOL v25 = 0;
LABEL_24:

  return v25;
}

- (void)writeCatalogOfRecord:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  directoryCoordinator = self->_directoryCoordinator;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000F5F60;
  v12[3] = &unk_100643DB0;
  id v11 = v6;
  id v13 = v11;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v12);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogOfRecordWritten:v11 source:a4];

  if (a4 != 3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _ubiquityManager](self, "_ubiquityManager"));
    [v10 updateUbiquitousCatalog:v11];
  }

  objc_autoreleasePoolPop(v7);
}

- (void)deleteCardWithUniqueID:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  BOOL v19 = sub_1000F34DC;
  id v20 = sub_1000F34EC;
  id v21 = 0LL;
  id v10 = objc_autoreleasePoolPush();
  directoryCoordinator = self->_directoryCoordinator;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F60F0;
  v13[3] = &unk_100643C20;
  id v15 = &v16;
  v13[4] = self;
  id v12 = v8;
  id v14 = v12;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v13);

  objc_autoreleasePoolPop(v10);
  -[PDCardFileManager _deleteCardWithUniqueID:cardDirectoryCoordinator:forReason:withDiagnosticReason:]( self,  "_deleteCardWithUniqueID:cardDirectoryCoordinator:forReason:withDiagnosticReason:",  v12,  v17[5],  a4,  v9);
  _Block_object_dispose(&v16, 8);
}

- (void)_deleteCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 forReason:(unint64_t)a5 withDiagnosticReason:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_autoreleasePoolPush();
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
    *(_DWORD *)__int128 buf = 138543874;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2114;
    id v34 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: card %{public}@ will be removed: %{public}@ %{public}@",  buf,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passWithUniqueIdentifierWillDisappear:v10 forReason:a5 withDiagnosticReason:v12];

  int v18 = 0;
  if (a5 <= 8 && ((1LL << a5) & 0x11C) != 0)
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _ubiquityManager](self, "_ubiquityManager"));
    [v19 prepareToRemoveUbiquitousPassWithUniqueID:v10];

    int v18 = 1;
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  directoryCoordinator = self->_directoryCoordinator;
  BOOL v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  id v27 = sub_1000F63C4;
  id v28 = &unk_100643DD8;
  id v32 = buf;
  uint64_t v29 = self;
  id v21 = v10;
  id v30 = v21;
  id v22 = v11;
  id v31 = v22;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", &v25);
  if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
  {
    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend( v23,  "passWithUniqueIdentifierDidDisappear:forReason:withDiagnosticReason:",  v21,  a5,  v12,  v25,  v26,  v27,  v28,  v29,  v30);
  }

  if (v18)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _ubiquityManager](self, "_ubiquityManager"));
    [v24 removeUbiquitousPassWithUniqueID:v21 completed:*(unsigned __int8 *)(*(void *)&buf[8] + 24)];
  }

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(v13);
}

- (void)deleteAllWithDiagnosticReason:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting all cards", buf, 2u);
  }

  id v7 = objc_autoreleasePoolPush();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager passUniqueIDs](self, "passUniqueIDs", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[PDCardFileManager deleteCardWithUniqueID:forReason:withDiagnosticReason:]( self,  "deleteCardWithUniqueID:forReason:withDiagnosticReason:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12),  2LL,  v4);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v10);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)registerDatabaseObject:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  id v6 = v5;
  if (v5)
  {
    uint64_t v13 = 0LL;
    __int128 v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    __int128 v16 = sub_1000F34DC;
    id v17 = sub_1000F34EC;
    id v18 = 0LL;
    directoryCoordinator = self->_directoryCoordinator;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000F6694;
    v10[3] = &unk_100643C20;
    id v12 = &v13;
    v10[4] = self;
    id v11 = v5;
    -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v10);
    uint64_t v8 = v14[5];
    if (v8) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _dataAccessorForCardDirectoryCoordinator:error:]( self,  "_dataAccessorForCardDirectoryCoordinator:error:",  v8,  0LL));
    }
    else {
      id v9 = 0LL;
    }
    [v4 setDataAccessor:v9];

    _Block_object_dispose(&v13, 8);
  }
}

- (void)scheduleImmediateRevocationCheck
{
  uint64_t Criteria = PDScheduledActivityGetCriteria(@"PDCardFileManager", @"RevocationCheck");
  id v3 = (id)objc_claimAutoreleasedReturnValue(Criteria);
  PDScheduledActivityRemove(@"PDCardFileManager", @"RevocationCheck");
  PDScheduledActivityRegister(@"PDCardFileManager", @"RevocationCheck", v3);
}

- (void)decryptPassAssets:(id)a3 undecryptableAssets:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 secureElementPass]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dataAccessor]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteAssetManagerForSEIDs:v9]);

    id v11 = objc_alloc_init(&OBJC_CLASS___PDRemoteAssetDecryptionManager);
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v21 = v10;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceSpecificItems]);
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
          if (-[PDRemoteAssetDecryptionManager assetRequiresDecryption:](v11, "assetRequiresDecryption:", v18)
            && !-[PDRemoteAssetDecryptionManager decryptAsset:forPass:](v11, "decryptAsset:forPass:", v18, v7))
          {
            -[NSMutableArray addObject:](v12, "addObject:", v18);
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v15);
    }

    if (a4)
    {
      id v19 = -[NSMutableArray copy](v12, "copy");
      id v20 = *a4;
      *a4 = v19;
    }
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: requested to perform scheduled activity with identifier:%@",  buf,  0xCu);
  }

  if ([v6 isEqualToString:@"CacheMaintenance"])
  {
    directoryCoordinator = self->_directoryCoordinator;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000F6A68;
    v11[3] = &unk_100643DB0;
    v11[4] = self;
    -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v11);
  }

  else if ([v6 isEqualToString:@"RevocationCheck"])
  {
    -[PDCardFileManager _performRevocationCheckActivity](self, "_performRevocationCheckActivity");
  }

  else if ([v6 isEqualToString:@"PDCardFileManagerMissingRemoteAssetsActivityIdentifier"])
  {
    -[PDCardFileManager _performMissingAssetDownloadActivity](self, "_performMissingAssetDownloadActivity");
  }
}

- (void)_performRevocationCheckActivity
{
  id v5 = (id)PDOSTransactionCreate("PDCardFileManager.revocation_check");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager passUniqueIDs](self, "passUniqueIDs"));
  id v4 = [v3 mutableCopy];
  -[PDCardFileManager _recursivelyCheckRevocationStatusForPassUniqueIdentifiers:osTransaction:]( self,  "_recursivelyCheckRevocationStatusForPassUniqueIdentifiers:osTransaction:",  v4,  v5);
}

- (void)_recursivelyCheckRevocationStatusForPassUniqueIdentifiers:(id)a3 osTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager objectWithUniqueID:](self, "objectWithUniqueID:", v8));
    [v6 removeObject:v8];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000F6BCC;
    v10[3] = &unk_100639350;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[PDCardFileManager _checkRevocationStatusForPass:withCompletion:]( self,  "_checkRevocationStatusForPass:withCompletion:",  v9,  v10);
  }
}

- (void)_checkRevocationStatusForPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    v13[0] = 0LL;
    v13[1] = v13;
    v13[2] = 0x3032000000LL;
    v13[3] = sub_1000F34DC;
    v13[4] = sub_1000F34EC;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000F6CFC;
    v9[3] = &unk_100643E28;
    id v10 = v6;
    id v12 = v13;
    id v11 = v8;
    [v10 revocationStatusWithCompletion:v9];

    _Block_object_dispose(v13, 8);
  }

  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

- (void)_createImageSetsForCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 displayProfile:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v13 && v8)
  {
    for (uint64_t i = 0LL; i != 9; ++i)
    {
      if (+[PKImageSet shouldCacheForDisplayProfile:imageSetType:]( &OBJC_CLASS___PKImageSet,  "shouldCacheForDisplayProfile:imageSetType:",  v9,  i))
      {
        id v11 = objc_autoreleasePoolPush();
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _imageSetContainerForUniqueID:cardDirectoryCoordinator:ofType:withDisplayProfile:suffix:]( self,  "_imageSetContainerForUniqueID:cardDirectoryCoordinator:ofType:withDisplayProfile:suffix:",  v13,  v8,  i,  v9,  0LL));
        [v12 invalidate];

        objc_autoreleasePoolPop(v11);
      }
    }
  }
}

- (id)_cachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  __int128 v23 = sub_1000F34DC;
  __int128 v24 = sub_1000F34EC;
  id v25 = 0LL;
  directoryCoordinator = self->_directoryCoordinator;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000F71BC;
  v17[3] = &unk_100643C20;
  id v19 = &v20;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v17);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _cachedImageSetContainerForUniqueID:type:withDisplayProfile:displayTraits:cardDirectoryCoordinator:]( self,  "_cachedImageSetContainerForUniqueID:type:withDisplayProfile:displayTraits:cardDirectoryCoordinator:",  v14,  a4,  v11,  v12,  v21[5]));

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)_cachedImageSetContainerForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6 cardDirectoryCoordinator:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = sub_1000F34DC;
  v33 = sub_1000F34EC;
  id v34 = 0LL;
  uint64_t v16 = objc_autoreleasePoolPush();
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _cacheURLForUniqueID:](self, "_cacheURLForUniqueID:", v12));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000F7380;
  v23[3] = &unk_100643E50;
  id v27 = &v29;
  int64_t v28 = a4;
  id v18 = v13;
  id v24 = v18;
  id v19 = v14;
  id v25 = v19;
  id v20 = v17;
  id v26 = v20;
  [v15 performCoordinatedAction:v23];

  objc_autoreleasePoolPop(v16);
  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (id)_imageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 withDisplayProfile:(id)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  __int128 v23 = sub_1000F34DC;
  id v24 = sub_1000F34EC;
  id v25 = 0LL;
  directoryCoordinator = self->_directoryCoordinator;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000F750C;
  v17[3] = &unk_100643C20;
  id v19 = &v20;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v17);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _imageSetContainerForUniqueID:cardDirectoryCoordinator:ofType:withDisplayProfile:suffix:]( self,  "_imageSetContainerForUniqueID:cardDirectoryCoordinator:ofType:withDisplayProfile:suffix:",  v14,  v21[5],  a4,  v11,  v12));

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)_imageSetContainerForUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 ofType:(int64_t)a5 withDisplayProfile:(id)a6 suffix:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = sub_1000F34DC;
  v33 = sub_1000F34EC;
  id v34 = 0LL;
  uint64_t v16 = objc_autoreleasePoolPush();
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _cacheURLForUniqueID:](self, "_cacheURLForUniqueID:", v12));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000F76D0;
  v23[3] = &unk_100643E50;
  id v27 = &v29;
  int64_t v28 = a5;
  id v18 = v14;
  id v24 = v18;
  id v19 = v15;
  id v25 = v19;
  id v20 = v17;
  id v26 = v20;
  [v13 performCoordinatedAction:v23];

  objc_autoreleasePoolPop(v16);
  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (id)_contentForCardWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0LL;
  int64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1000F34DC;
  uint64_t v31 = sub_1000F34EC;
  id v32 = 0LL;
  id v5 = objc_autoreleasePoolPush();
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1000F34DC;
  id v25 = sub_1000F34EC;
  id v26 = 0LL;
  directoryCoordinator = self->_directoryCoordinator;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000F796C;
  v18[3] = &unk_100643C20;
  id v20 = &v21;
  v18[4] = self;
  id v7 = v4;
  id v19 = v7;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v18);
  id v8 = (void *)v22[5];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000F79A8;
  v17[3] = &unk_100643CC0;
  v17[4] = &v27;
  [v8 performCoordinatedAction:v17];
  if (!v28[5] && v22[5])
  {
    id v9 = PDDefaultQueue();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F79F8;
    block[3] = &unk_100643E78;
    id v14 = v7;
    id v15 = self;
    uint64_t v16 = &v21;
    dispatch_async(v10, block);
  }

  _Block_object_dispose(&v21, 8);
  objc_autoreleasePoolPop(v5);
  id v11 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v11;
}

- (id)_dc_cardDirectoryCoordinatorForUniqueID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = 0LL;
    goto LABEL_10;
  }

  id v5 = (PKDirectoryCoordinator *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cardDirectoryCoordinators, "objectForKey:", v4));
  if (v5)
  {
    id v6 = v5;
    -[NSMapTable removeObjectForKey:](self->_cardDirectoryCoordinators, "removeObjectForKey:", v4);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _objectURLForUniqueID:](self, "_objectURLForUniqueID:", v4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  unsigned int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    id v6 = -[PKDirectoryCoordinator initWithURL:](objc_alloc(&OBJC_CLASS___PKDirectoryCoordinator), "initWithURL:", v7);
    -[NSMapTable setObject:forKey:](self->_cardDirectoryCoordinators, "setObject:forKey:", v6, v4);
  }

  else
  {
    id v6 = 0LL;
  }

LABEL_10:
  return v6;
}

- (void)_dc_invalidateCardDirectoryCoordinatorForUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cardDirectoryCoordinators, "objectForKey:", v4));
    id v6 = v5;
    if (v5)
    {
      [v5 invalidate];
      -[NSMapTable removeObjectForKey:](self->_cardDirectoryCoordinators, "removeObjectForKey:", v7);
    }

    id v4 = v7;
  }
}

- (id)_dataAccessorForCardDirectoryCoordinator:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v19 = 0LL;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    uint64_t v22 = sub_1000F34DC;
    uint64_t v23 = sub_1000F34EC;
    id v24 = 0LL;
    uint64_t v13 = 0LL;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    uint64_t v16 = sub_1000F34DC;
    id v17 = sub_1000F34EC;
    id v18 = 0LL;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000F7DC8;
    v9[3] = &unk_100643D10;
    id v11 = &v19;
    id v12 = &v13;
    id v10 = v5;
    [v10 performCoordinatedAction:v9];
    if (a4) {
      *a4 = (id) v14[5];
    }
    id v7 = (id)v20[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_dc_cardWithUniqueID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _dc_cardDirectoryCoordinatorForUniqueID:]( self,  "_dc_cardDirectoryCoordinatorForUniqueID:",  v6));
  objc_autoreleasePoolPop(v7);
  if (v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _cardWithUniqueID:cardDirectoryCoordinator:error:]( self,  "_cardWithUniqueID:cardDirectoryCoordinator:error:",  v6,  v8,  a4));
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (id)_cardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_autoreleasePoolPush();
  id v18 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _dataAccessorForCardDirectoryCoordinator:error:]( self,  "_dataAccessorForCardDirectoryCoordinator:error:",  v9,  &v18));
  id v12 = v18;
  if (v11)
  {
    id v13 = +[PKPass createWithValidatedFileDataAccessor:]( &OBJC_CLASS___PKPass,  "createWithValidatedFileDataAccessor:",  v11);

    objc_autoreleasePoolPop(v10);
    if (v13)
    {
      [v13 setUniqueID:v8];
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }

  else
  {
    objc_autoreleasePoolPop(v10);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F8048;
  v15[3] = &unk_100643C98;
  id v16 = v8;
  id v17 = v12;
  [v9 performCoordinatedAction:v15];

  id v13 = 0LL;
  if (a5) {
LABEL_7:
  }
    *a5 = v12;
LABEL_8:

  return v13;
}

- (BOOL)_dc_writeCard:(id)a3 writtenCard:(id *)a4 diff:(id *)a5 daemonData:(id *)a6 undecryptableAssets:(id *)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataAccessor]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___PKFileDataAccessor, v13);
  char isKindOfClass = objc_opt_isKindOfClass(v12, v14);

  if ((isKindOfClass & 1) == 0)
  {
    LOBYTE(v25) = 0;
    id v24 = 0LL;
    goto LABEL_49;
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue([v11 dataAccessor]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v63 fileURL]);
  bundleURL = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _objectURLForUniqueID:](self, "_objectURLForUniqueID:", v16));
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (!v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 passTypeIdentifier]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 serialNumber]);
    uint64_t v19 = PKGeneratePassUniqueID(v17, v18);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v19);

    [v11 setUniqueID:v16];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _dc_cardWithUniqueID:error:](self, "_dc_cardWithUniqueID:error:", v16, 0LL));
  id v67 = (void *)objc_claimAutoreleasedReturnValue([v20 sequenceCounter]);
  id v65 = (void *)objc_claimAutoreleasedReturnValue([v11 sequenceCounter]);
  if (v67)
  {
    if (v65)
    {
      id v21 = [v67 integerValue];
      if ((uint64_t)v21 > (uint64_t)[v65 integerValue])
      {
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134218240;
          *(void *)&uint8_t buf[4] = [v67 integerValue];
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = [v65 integerValue];
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Existing pass sequence counter %lu is greater than incoming pass sequence counter %lu. Ignoring.",  buf,  0x16u);
        }

        id v24 = 0LL;
        LOBYTE(v25) = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
  }

  if (!v20
    || (id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 manifestHash]),
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v20 manifestHash]),
        unsigned __int8 v28 = [v26 isEqualToData:v27],
        v27,
        v26,
        (v28 & 1) == 0))
  {
    uint64_t v29 = (void *)PDOSTransactionCreate("PDCardFileManager");
    -[PDCardFileManager _dc_invalidateCardDirectoryCoordinatorForUniqueID:]( self,  "_dc_invalidateCardDirectoryCoordinatorForUniqueID:",  v16);
    missingAssetQueue = self->_missingAssetQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F8978;
    block[3] = &unk_100639350;
    id v56 = v29;
    id v80 = v56;
    v81 = self;
    id v57 = v16;
    id v82 = v57;
    uint64_t v31 = missingAssetQueue;
    dispatch_block_t v32 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v31, v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _cacheURLForUniqueID:](self, "_cacheURLForUniqueID:", v57));
    [v68 removeItemAtURL:v33 error:0];

    if (v20)
    {
      uint64_t v34 = PKTemporaryItemURLWithExtension(PKRawPassExtension, 1LL);
      id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      PKTemporaryItemPrepareDirectory();
      if (v35 && [v68 moveItemAtURL:bundleURL toURL:v35 error:0])
      {
        id v36 = [[PKFileDataAccessor alloc] initWithFileURL:v35 error:0];
        [v20 setDataAccessor:v36];

LABEL_23:
        unsigned int v25 = [v68 copyItemAtURL:v62 toURL:bundleURL error:a8];
        if (v25)
        {
          id v55 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _dc_cardDirectoryCoordinatorForUniqueID:]( self,  "_dc_cardDirectoryCoordinatorForUniqueID:",  v57));
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
          id v24 = [v11 copy];
          v39 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _dataAccessorForCardDirectoryCoordinator:error:]( self,  "_dataAccessorForCardDirectoryCoordinator:error:",  v55,  0LL));
          [v24 setDataAccessor:v39];

          if ([v24 passType] == (id)1) {
            [v24 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v54];
          }
          -[PDCardFileManager decryptPassAssets:undecryptableAssets:]( self,  "decryptPassAssets:undecryptableAssets:",  v24,  a7);
          *(void *)__int128 buf = 0LL;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          v84 = sub_1000F34DC;
          v85 = sub_1000F34EC;
          id v86 = 0LL;
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472LL;
          v78[2] = sub_1000F89B8;
          v78[3] = &unk_100643CC0;
          v78[4] = buf;
          [v55 performCoordinatedAction:v78];
          objc_storeStrong(a6, *(id *)(*(void *)&buf[8] + 40LL));
          CFBundleRef v40 = CFBundleCreate(kCFAllocatorDefault, bundleURL);
          CFBundleRef v41 = v40;
          if (v40)
          {
            _CFBundleFlushBundleCaches(v40);
            _CFBundleRemoveResourceURL(v41, 0LL);
            CFRelease(v41);
          }

          if (a5 && v20)
          {
            double v42 = (void *)objc_claimAutoreleasedReturnValue([v20 diff:v24]);
            id v43 = *a5;
            *a5 = v42;
          }

          if (([v24 supportsSyncing] & 1) == 0
            && (PKStoreDemoModeEnabled() & 1) == 0
            && (PKUIOnlyDemoModeEnabled() & 1) == 0)
          {
            PKExcludeFileURLFromBackup(bundleURL);
          }

          if (v35) {
            [v68 removeItemAtURL:v35 error:0];
          }
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v24 displayProfile]);
          id v45 = PDHeavyUtilityQueue();
          uint64_t v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v45);
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472LL;
          v74[2] = sub_1000F8A1C;
          v74[3] = &unk_10063B060;
          v74[4] = self;
          id v47 = v57;
          id v75 = v47;
          id v61 = v55;
          id v76 = v61;
          locationa = v44;
          id v77 = locationa;
          dispatch_block_t v48 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, v74);
          dispatch_async(v46, v48);

          if (([v24 remoteAssetsDownloadedForSEIDs:v54] & 1) == 0)
          {
            id v49 = self->_missingAssetQueue;
            v69[0] = _NSConcreteStackBlock;
            v69[1] = 3221225472LL;
            v69[2] = sub_1000F8A60;
            v69[3] = &unk_10063B060;
            id v70 = v56;
            id v71 = v61;
            __int16 v72 = self;
            id v73 = v47;
            uint64_t v50 = v49;
            dispatch_block_t v51 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, v69);
            dispatch_async(v50, v51);
          }

          _Block_object_dispose(buf, 8);
        }

        else
        {
          if (v35) {
            [v68 moveItemAtURL:v35 toURL:bundleURL error:0];
          }
          id v24 = 0LL;
        }

        uint64_t v23 = (os_log_s *)v56;
        goto LABEL_44;
      }

      uint64_t v37 = PKLogFacilityTypeGetObject(0LL);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        *(void *)&uint8_t buf[4] = v57;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: failed to move aside pass %{public}@ - falling back to deleting.",  buf,  0xCu);
      }

      [v68 removeItemAtURL:bundleURL error:0];
    }

    else
    {
      [v68 removeItemAtURL:bundleURL error:0];
    }

    id v35 = 0LL;
    id v20 = 0LL;
    goto LABEL_23;
  }

  id v24 = 0LL;
  LOBYTE(v25) = 1;
LABEL_45:

  char v52 = v25 ^ 1;
  if (!a4) {
    char v52 = 1;
  }
  if ((v52 & 1) == 0)
  {
    objc_storeStrong(a4, v24);
    LOBYTE(v25) = 1;
  }

- (BOOL)_dc_deleteCardWithUniqueID:(id)a3 cardDirectoryCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7 || ([v7 isInvalidated] & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    -[PDCardFileManager _dc_invalidateCardDirectoryCoordinatorForUniqueID:]( self,  "_dc_invalidateCardDirectoryCoordinatorForUniqueID:",  v6);
    missingAssetQueue = self->_missingAssetQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F8CD8;
    block[3] = &unk_1006392B0;
    void block[4] = self;
    id v12 = v6;
    id v25 = v12;
    uint64_t v13 = missingAssetQueue;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v13, v14);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _objectURLForUniqueID:](self, "_objectURLForUniqueID:", v12));
    id v23 = 0LL;
    unsigned int v9 = [v10 removeItemAtURL:v15 error:&v23];
    id v16 = v23;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _cacheURLForUniqueID:](self, "_cacheURLForUniqueID:", v12));
    [v10 removeItemAtURL:v17 error:0];

    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v20)
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v27 = v12;
        id v21 = "PDCardFileManager: card was removed %{public}@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      }
    }

    else if (v20)
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v27 = v16;
      id v21 = "PDCardFileManager: error removing card %{public}@";
      goto LABEL_9;
    }

    goto LABEL_11;
  }

  LOBYTE(v9) = 0;
LABEL_11:

  return v9;
}

- (void)_dc_performCacheMaintenanceActivity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = objc_autoreleasePoolPush();
  v66 = self;
  cardsURL = self->_cardsURL;
  id v91 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v3 contentsOfDirectoryAtURL:cardsURL includingPropertiesForKeys:&__NSArray0__struct options:7 error:&v91]);
  id v7 = v91;
  id v8 = v7;
  if (v6)
  {

    objc_autoreleasePoolPop(v4);
    unsigned int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v70 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    context = objc_autoreleasePoolPush();
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    uint64_t v62 = v6;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v87 objects:v95 count:16];
    if (!v11) {
      goto LABEL_14;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v88;
    uint64_t v14 = PKRawPassExtension;
    while (1)
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v88 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)i);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pathExtension]);

        if ([v18 isEqualToString:v14])
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByStandardizingPath]);
          BOOL v20 = v9;
        }

        else
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByStandardizingPath]);
          BOOL v20 = v70;
        }

        -[NSMutableSet addObject:](v20, "addObject:", v19);

LABEL_12:
      }

      id v12 = [v10 countByEnumeratingWithState:&v87 objects:v95 count:16];
      if (!v12)
      {
LABEL_14:

        objc_autoreleasePoolPop(context);
        __int128 v85 = 0u;
        __int128 v86 = 0u;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        id obj = v9;
        id v21 = v70;
        id v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v83,  v94,  16LL);
        if (!v64) {
          goto LABEL_47;
        }
        uint64_t v65 = *(void *)v84;
LABEL_16:
        uint64_t v22 = 0LL;
        while (1)
        {
          if (*(void *)v84 != v65) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v83 + 1) + 8 * v22);
          id v24 = objc_autoreleasePoolPush();
          id v25 = sub_1000F3F44(v23);
          id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager _cacheURLForUniqueID:](v66, "_cacheURLForUniqueID:", v26));
          unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 URLByStandardizingPath]);

          -[NSMutableSet removeObject:](v21, "removeObject:", v28);
          id v82 = 0LL;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( [v3 contentsOfDirectoryAtURL:v28 includingPropertiesForKeys:&__NSArray0__struct options:7 error:&v82]);
          id v30 = v82;
          uint64_t v31 = v30;
          if (!v29)
          {
            uint64_t Object = PKLogFacilityTypeGetObject(0LL);
            id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v97 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Unable to enumerate cache directory: %@",  buf,  0xCu);
            }

LABEL_46:
            objc_autoreleasePoolPop(v24);
            goto LABEL_47;
          }

          uint64_t v67 = v22;
          uint64_t v68 = v28;
          double v69 = v24;

          __int128 v81 = 0u;
          __int128 v79 = 0u;
          __int128 v80 = 0u;
          __int128 v78 = 0u;
          id v32 = v29;
          id v33 = [v32 countByEnumeratingWithState:&v78 objects:v93 count:16];
          if (!v33) {
            goto LABEL_37;
          }
          id v34 = v33;
          uint64_t v35 = *(void *)v79;
          do
          {
            for (j = 0LL; j != v34; j = (char *)j + 1)
            {
              if (*(void *)v79 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)j);
              v38 = (void *)objc_claimAutoreleasedReturnValue([v37 lastPathComponent]);
              v39 = (void *)objc_claimAutoreleasedReturnValue([v38 pathExtension]);

              if ([v39 isEqualToString:@"archive"])
              {
                id v77 = 0LL;
                [v3 removeItemAtURL:v37 error:&v77];
                id v40 = v77;
                uint64_t v41 = PKLogFacilityTypeGetObject(0LL);
                double v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
                if (v40)
                {
                  if (v43)
                  {
                    *(_DWORD *)__int128 buf = 138412290;
                    id v97 = v40;
                    uint64_t v44 = v42;
                    id v45 = "Unable to remove obsolte cache: %@";
                    goto LABEL_33;
                  }
                }

                else if (v43)
                {
                  *(_DWORD *)__int128 buf = 138412290;
                  id v97 = v37;
                  uint64_t v44 = v42;
                  id v45 = "Removed obsolete cache: %@";
LABEL_33:
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v45, buf, 0xCu);
                }
              }
            }

            id v34 = [v32 countByEnumeratingWithState:&v78 objects:v93 count:16];
          }

          while (v34);
LABEL_37:

          objc_autoreleasePoolPop(v69);
          uint64_t v22 = v67 + 1;
          id v21 = v70;
          if ((id)(v67 + 1) == v64)
          {
            id v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v83,  v94,  16LL);
            if (v64) {
              goto LABEL_16;
            }
LABEL_47:

            __int128 v75 = 0u;
            __int128 v76 = 0u;
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            uint64_t v50 = v21;
            id v51 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v73,  v92,  16LL);
            if (!v51) {
              goto LABEL_60;
            }
            id v52 = v51;
            uint64_t v53 = *(void *)v74;
            while (2)
            {
              uint64_t v54 = 0LL;
LABEL_50:
              if (*(void *)v74 != v53) {
                objc_enumerationMutation(v50);
              }
              id v55 = *(void **)(*((void *)&v73 + 1) + 8 * v54);
              id v72 = 0LL;
              [v3 removeItemAtURL:v55 error:&v72];
              id v56 = v72;
              uint64_t v57 = PKLogFacilityTypeGetObject(0LL);
              uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
              BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
              if (v56)
              {
                if (v59)
                {
                  *(_DWORD *)__int128 buf = 138412290;
                  id v97 = v56;
                  uint64_t v60 = v58;
                  id v61 = "Unable to remove cache directory: %@";
                  goto LABEL_57;
                }
              }

              else if (v59)
              {
                *(_DWORD *)__int128 buf = 138412290;
                id v97 = v55;
                uint64_t v60 = v58;
                id v61 = "Removed cache directory with no matching pass: %@";
LABEL_57:
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, v61, buf, 0xCu);
              }

              if (v52 == (id)++v54)
              {
                id v52 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v73,  v92,  16LL);
                if (!v52)
                {
LABEL_60:

                  id v6 = v62;
                  goto LABEL_61;
                }

                continue;
              }

              goto LABEL_50;
            }
          }
        }
      }
    }
  }

  uint64_t v46 = PKLogFacilityTypeGetObject(0LL);
  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v97 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Unable to enumerate cards directory: %@",  buf,  0xCu);
  }

  objc_autoreleasePoolPop(v4);
LABEL_61:
}

- (void)ubiquitousCardDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager objectWithUniqueID:](self, "objectWithUniqueID:", v5));

  if (!v6
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 manifestHash]),
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 manifestHash]),
        unsigned __int8 v9 = [v7 isEqualToData:v8],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    id v19 = 0LL;
    unsigned int v13 = -[PDCardFileManager writeCard:source:error:](self, "writeCard:source:error:", v4, 3LL, &v19);
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v16)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
        *(_DWORD *)__int128 buf = 138412290;
        id v21 = v17;
        id v18 = "card updated via ubiquity: %@";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      }
    }

    else if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
      *(_DWORD *)__int128 buf = 138412290;
      id v21 = v17;
      id v18 = "card update via ubiquity FAILED: %@";
      goto LABEL_11;
    }

    goto LABEL_13;
  }

  uint64_t v10 = PKLogFacilityTypeGetObject(1LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    *(_DWORD *)__int128 buf = 138412290;
    id v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "card NOT updated via ubiquity - manifest hashes are equivalent: %@",  buf,  0xCu);
  }

LABEL_13:
}

- (void)ubiquitousCardWithUniqueIDRemoved:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "card removed via ubiquity: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[PDCardFileManager deleteCardWithUniqueID:forReason:withDiagnosticReason:]( self,  "deleteCardWithUniqueID:forReason:withDiagnosticReason:",  v4,  1LL,  @"Ubiquity");
}

- (void)ubiquitousCatalogDidChange:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "catalog received via ubiquity", buf, 2u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager catalogOfRecord](self, "catalogOfRecord"));
  id v8 = v7;
  if (v7 && ([v7 isEquivalentToCatalog:v4] & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      unsigned __int8 v9 = "---> catalog not updated - equivalent to existing catalog";
      uint64_t v10 = (uint8_t *)&v11;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }

  else
  {
    -[PDCardFileManager writeCatalogOfRecord:source:](self, "writeCatalogOfRecord:source:", v4, 3LL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      unsigned __int8 v9 = "---> catalog updated";
      uint64_t v10 = v12;
      goto LABEL_9;
    }
  }
}

- (id)_objectURLForUniqueID:(id)a3
{
  if (a3)
  {
    cardsURL = self->_cardsURL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathExtension:PKRawPassExtension]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( cardsURL,  "URLByAppendingPathComponent:isDirectory:",  v4,  1LL));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_cacheURLForUniqueID:(id)a3
{
  if (a3)
  {
    cardsURL = self->_cardsURL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathExtension:@"cache"]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( cardsURL,  "URLByAppendingPathComponent:isDirectory:",  v4,  1LL));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received notification of filesystem change at watched URL.",  v7,  2u);
  }

  -[PDCardFileManager startUbiquity](self, "startUbiquity");
}

- (void)_evaluateDownloadMissingAssetsActivityWithForcedReschedule:(BOOL)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: evaluate download missing assets activity",  (uint8_t *)&v13,  2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [WeakRetained missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:self->_maximumDownloadRetries];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maximumDownloadRetries = self->_maximumDownloadRetries;
    int v13 = 134218240;
    id v14 = v8;
    __int16 v15 = 2048;
    unint64_t v16 = maximumDownloadRetries;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: found %lu passes with missing remote assets with maximum retries count:%lu",  (uint8_t *)&v13,  0x16u);
  }

  if (v8)
  {
    if (a3
      || (PDScheduledActivityExists( @"PDCardFileManagerMissingRemoteAssetsClientActivityIdentifier",  @"PDCardFileManagerMissingRemoteAssetsActivityIdentifier") & 1) == 0)
    {
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  600.0));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v11));

      [v12 setRepeating:1];
      [v12 setRepeatInterval:86400.0];
      [v12 setRequireMainsPower:1];
      [v12 setRequireNetworkConnectivity:1];
      [v12 setReason:@"Downlad missing assets"];
      PDScheduledActivityRegister( @"PDCardFileManagerMissingRemoteAssetsClientActivityIdentifier",  @"PDCardFileManagerMissingRemoteAssetsActivityIdentifier",  v12);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: Missing assets maintenance activity scheduled",  (uint8_t *)&v13,  2u);
      }

      id v6 = (os_log_s *)v12;
      goto LABEL_17;
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      uint64_t v10 = "PDCardFileManager: Missing assets maintenance exist, we don't need to schedule a new one";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 2u);
    }
  }

  else
  {
    if (!PDScheduledActivityExists( @"PDCardFileManagerMissingRemoteAssetsClientActivityIdentifier",  @"PDCardFileManagerMissingRemoteAssetsActivityIdentifier")) {
      return;
    }
    PDScheduledActivityRemove( @"PDCardFileManagerMissingRemoteAssetsClientActivityIdentifier",  @"PDCardFileManagerMissingRemoteAssetsActivityIdentifier");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      uint64_t v10 = "PDCardFileManager: Removed Missing assets maintenance activity";
      goto LABEL_16;
    }
  }

- (void)_performMissingAssetDownloadActivity
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: requested download missing assets",  buf,  2u);
  }

  p_performingMissingRemoteAssetDownloadActivity = &self->_performingMissingRemoteAssetDownloadActivity;
  while (!__ldaxr((unsigned __int8 *)p_performingMissingRemoteAssetDownloadActivity))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_performingMissingRemoteAssetDownloadActivity))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:self->_maximumDownloadRetries]);

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v25 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: Will download remote missing assets from passes with uniqueIDs:%@",  buf,  0xCu);
      }

      id v9 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v4 = v8;
      id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v4);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472LL;
            v18[2] = sub_1000F9EE8;
            v18[3] = &unk_10063CB08;
            v18[4] = self;
            void v18[5] = v14;
            [v9 addOperation:v18];
          }

          id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        }

        while (v11);
      }

      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000F9FE4;
      v17[3] = &unk_100643EA0;
      v17[4] = self;
      id v16 = [v9 evaluateWithInput:v15 completion:v17];

      goto LABEL_18;
    }
  }

  __clrex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: we have pending UniqueIDs to process.",  buf,  2u);
  }

- (void)_downloadRemoteAssetsForCardWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v24 = (void (**)(void))a4;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDCardFileManager: downloading missing assets for pass %@",  (uint8_t *)&buf,  0xCu);
  }

  __int128 v22 = (void *)PDOSTransactionCreate("PDCardFileManager.remote_asset_download");
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3032000000LL;
  uint64_t v53 = sub_1000F34DC;
  uint64_t v54 = sub_1000F34EC;
  id v55 = 0LL;
  directoryCoordinator = self->_directoryCoordinator;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000FA518;
  v47[3] = &unk_100643C20;
  p___int128 buf = &buf;
  v47[4] = self;
  id v21 = v6;
  id v48 = v21;
  -[PKDirectoryCoordinator performCoordinatedAction:](directoryCoordinator, "performCoordinatedAction:", v47);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager _dataAccessorForCardDirectoryCoordinator:error:]( self,  "_dataAccessorForCardDirectoryCoordinator:error:",  *(void *)(*((void *)&buf + 1) + 40LL),  0LL));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteAssetManagerForSEIDs:v23]);

  if (*(void *)(*((void *)&buf + 1) + 40LL) && v26)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v26 pendingRemoteAssetsItems]);
    id v12 = [v11 count];
    if (v12)
    {
      id v25 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      id v20 = v12;
      v46[0] = 0LL;
      v46[1] = v46;
      v46[2] = 0x2020000000LL;
      v46[3] = 0LL;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      id v13 = v11;
      id v14 = [v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v43;
        do
        {
          for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472LL;
            v36[2] = sub_1000FA554;
            v36[3] = &unk_100643EC8;
            id v40 = &buf;
            id v37 = v26;
            uint64_t v38 = v17;
            v39 = self;
            uint64_t v41 = v46;
            [v25 addOperation:v36];
          }

          id v14 = [v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }

        while (v14);
      }

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_1000FA698;
      v35[3] = &unk_1006396D8;
      v35[4] = self;
      [v25 addOperation:v35];
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000FA758;
      v27[3] = &unk_100643F18;
      id v28 = v22;
      id v32 = &buf;
      uint64_t v31 = v24;
      uint64_t v29 = self;
      id v33 = v46;
      id v34 = v20;
      id v30 = v21;
      id v19 = [v25 evaluateWithInput:v18 completion:v27];

      _Block_object_dispose(v46, 8);
    }

    else if (v24)
    {
      v24[2]();
    }
  }

  else if (v24)
  {
    v24[2]();
  }

  _Block_object_dispose(&buf, 8);
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinatorDelegate
{
  return self->_cloudStoreCoordinatorDelegate;
}

- (void)setCloudStoreCoordinatorDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end