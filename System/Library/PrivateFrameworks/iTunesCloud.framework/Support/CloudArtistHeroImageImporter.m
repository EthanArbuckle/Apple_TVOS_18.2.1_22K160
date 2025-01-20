@interface CloudArtistHeroImageImporter
+ (id)allArtistImagesMapCacheFilePathURL;
- (CloudArtistHeroImageImporter)initWithConfiguration:(id)a3;
- (CloudArtworkImporter)artworkImporter;
- (DetermineArtistStoreIDLookupTypeOperation)currentUpdateOperation;
- (DetermineArtistStoreIDLookupTypeOperation)followupUpdateOpertion;
- (ICConnectionConfiguration)configuration;
- (ML3MusicLibrary)musicLibrary;
- (MSVWatchdog)watchdog;
- (NSOperationQueue)operationQueue;
- (NSString)powerAssertionIdentifier;
- (OS_dispatch_queue)accessQueue;
- (id)userIdentity;
- (int64_t)_synchronouslyLoadArtistUpdatePollingFrequencyFromBag;
- (void)_artistHeroImageUpdateFinished;
- (void)_importHeroImageForArtistType:(int64_t)a3 withPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)cancelArtistHeroImageUpdate;
- (void)cancelArtistHeroImageUpdateAndWaitForOperationToFinish:(BOOL)a3;
- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3;
- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3;
- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccessQueue:(id)a3;
- (void)setArtworkImporter:(id)a3;
- (void)setCurrentUpdateOperation:(id)a3;
- (void)setFollowupUpdateOpertion:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPowerAssertionIdentifier:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:(id)a3;
- (void)updateArtistHeroImagesWithClientIdentity:(id)a3;
@end

@implementation CloudArtistHeroImageImporter

- (CloudArtistHeroImageImporter)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CloudArtistHeroImageImporter;
  v6 = -[CloudArtistHeroImageImporter init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userIdentity]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v8));
    musicLibrary = v7->_musicLibrary;
    v7->_musicLibrary = (ML3MusicLibrary *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.itunescloudd.cloudartistheroimageimporter.accessqueue", 0LL);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v13;

    -[NSOperationQueue setName:]( v7->_operationQueue,  "setName:",  @"com.apple.itunescloudd.cloudartistheroimageimporter.operationqueue");
    -[NSOperationQueue setQualityOfService:](v7->_operationQueue, "setQualityOfService:", 17LL);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    currentUpdateOperation = v7->_currentUpdateOperation;
    v7->_currentUpdateOperation = 0LL;

    followupUpdateOpertion = v7->_followupUpdateOpertion;
    v7->_followupUpdateOpertion = 0LL;

    -[NSOperationQueue addObserver:forKeyPath:options:context:]( v7->_operationQueue,  "addObserver:forKeyPath:options:context:",  v7,  @"operationCount",  3LL,  0LL);
    powerAssertionIdentifier = v7->_powerAssertionIdentifier;
    v7->_powerAssertionIdentifier = (NSString *)@"com.apple.itunescloudd.cloudartistheroimageimporter";

    v18 = objc_alloc_init(&OBJC_CLASS___MSVWatchdog);
    watchdog = v7->_watchdog;
    v7->_watchdog = v18;

    -[MSVWatchdog setTimeoutInterval:](v7->_watchdog, "setTimeoutInterval:", 3600.0);
    objc_initWeak(&location, v7);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000652B0;
    v21[3] = &unk_1001A5CB8;
    objc_copyWeak(&v22, &location);
    -[MSVWatchdog setTimeoutCallback:](v7->_watchdog, "setTimeoutCallback:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (CloudArtworkImporter)artworkImporter
{
  artworkImporter = self->_artworkImporter;
  if (!artworkImporter)
  {
    v4 = objc_alloc(&OBJC_CLASS___CloudArtworkImporter);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter configuration](self, "configuration"));
    v6 = -[CloudArtworkImporter initWithConfiguration:sourceType:](v4, "initWithConfiguration:sourceType:", v5, 500LL);
    v7 = self->_artworkImporter;
    self->_artworkImporter = v6;

    artworkImporter = self->_artworkImporter;
  }

  return artworkImporter;
}

- (id)userIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userIdentity]);

  return v3;
}

- (void)updateArtistHeroImagesWithClientIdentity:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CloudArtistHeroImageImporter _synchronouslyLoadArtistUpdatePollingFrequencyFromBag]( self,  "_synchronouslyLoadArtistUpdatePollingFrequencyFromBag");
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100064EF8;
  block[3] = &unk_1001A5D08;
  id v9 = v4;
  int64_t v10 = v5;
  block[4] = self;
  id v7 = v4;
  dispatch_async(v6, block);
}

- (void)updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:(id)a3
{
  id v4 = a3;
  int64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005D9D8;
  v7[3] = &unk_1001A6C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelArtistHeroImageUpdate
{
}

- (void)cancelArtistHeroImageUpdateAndWaitForOperationToFinish:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter operationQueue](self, "operationQueue"));
  [v5 cancelAllOperations];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter artworkImporter](self, "artworkImporter"));
  [v6 cancelAllImportsAndWaitForOperationsToFinish:v3];

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter accessQueue](self, "accessQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005D988;
  v8[3] = &unk_1001A5D58;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_sync(v7, v8);
}

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter artworkImporter](self, "artworkImporter"));
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:4];
}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter artworkImporter](self, "artworkImporter"));
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  if ([a3 isEqualToString:@"operationCount"])
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:NSKeyValueChangeNewKey]);
    id v10 = [v9 unsignedIntegerValue];

    dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:NSKeyValueChangeOldKey]);
    id v12 = [v11 unsignedIntegerValue];

    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter accessQueue](self, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005D78C;
    block[3] = &unk_1001A5D30;
    block[4] = self;
    void block[5] = v10;
    block[6] = v12;
    dispatch_async(v13, block);
  }
}

- (int64_t)_synchronouslyLoadArtistUpdatePollingFrequencyFromBag
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  objc_super v24 = sub_10005D5D4;
  v25 = sub_10005D5E4;
  id v26 = 0LL;
  id v4 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter userIdentity](self, "userIdentity"));
  id v6 = -[ICStoreRequestContext initWithIdentity:](v4, "initWithIdentity:", v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_10005D740;
  v18 = &unk_1001A37C0;
  v20 = &v21;
  id v8 = v3;
  v19 = v8;
  [v7 getBagForRequestContext:v6 withCompletionHandler:&v15];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v9 = (void *)v22[5];
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "numberForBagKey:",  @"min-artist-update-polling-frequency-secs",  v15,  v16,  v17,  v18));
    if ((objc_opt_respondsToSelector(v10, "integerValue") & 1) != 0)
    {
      int64_t v11 = (int64_t)[v10 integerValue];
      id v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v28 = v11;
        v13 = "Using polling frequency from bag: %ld";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }

    else
    {
      int64_t v11 = 604800LL;
      id v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v28 = 604800LL;
        v13 = "Failed to get polling frequency from the URL bag, using default polling frequency: %ld";
        goto LABEL_10;
      }
    }
  }

  else
  {
    int64_t v11 = 604800LL;
    id v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = 604800LL;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to receive response for URL bag, using default polling frequency: %ld",  buf,  0xCu);
    }

    id v10 = 0LL;
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (void)_artistHeroImageUpdateFinished
{
  dispatch_semaphore_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D658;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_importHeroImageForArtistType:(int64_t)a3 withPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  char v13 = [v12 isCellularDataRestrictedForMusic] ^ 1;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtistHeroImageImporter musicLibrary](self, "musicLibrary"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10005D284;
  v17[3] = &unk_1001A3810;
  int64_t v21 = a3;
  int64_t v22 = a4;
  v19 = self;
  id v20 = v11;
  char v23 = v13;
  id v18 = v10;
  id v15 = v11;
  id v16 = v10;
  [v14 databaseConnectionAllowingWrites:0 withBlock:v17];
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSString)powerAssertionIdentifier
{
  return self->_powerAssertionIdentifier;
}

- (void)setPowerAssertionIdentifier:(id)a3
{
}

- (MSVWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
}

- (DetermineArtistStoreIDLookupTypeOperation)currentUpdateOperation
{
  return self->_currentUpdateOperation;
}

- (void)setCurrentUpdateOperation:(id)a3
{
}

- (DetermineArtistStoreIDLookupTypeOperation)followupUpdateOpertion
{
  return self->_followupUpdateOpertion;
}

- (void)setFollowupUpdateOpertion:(id)a3
{
}

- (void)setArtworkImporter:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)allArtistImagesMapCacheFilePathURL
{
  id v2 = sub_1000C0F14();
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v8[0] = v3;
  v8[1] = @"allArtistImagesMap.plist";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));

  return v6;
}

@end