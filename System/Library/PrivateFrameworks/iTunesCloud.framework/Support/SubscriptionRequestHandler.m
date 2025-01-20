@interface SubscriptionRequestHandler
- (CloudArtworkImporter)artworkImporter;
- (ICConnectionConfiguration)configuration;
- (SubscriptionRequestHandler)initWithConfiguration:(id)a3;
- (void)_importAllItemArtworkWithClientIdentity:(id)a3;
- (void)_loadArtworkInfoForSubscriptionPersistentIDs:(id)a3 artworkType:(int64_t)a4 entityType:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)cancelOperationsWithCompletionHandler:(id)a3;
- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3;
- (void)environmentMonitorDidChangePower:(id)a3;
- (void)importContainerArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation SubscriptionRequestHandler

- (SubscriptionRequestHandler)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SubscriptionRequestHandler;
  v6 = -[SubscriptionRequestHandler init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = -[CloudArtworkImporter initWithConfiguration:sourceType:]( objc_alloc(&OBJC_CLASS___CloudArtworkImporter),  "initWithConfiguration:sourceType:",  v5,  600LL);
    artworkImporter = v7->_artworkImporter;
    v7->_artworkImporter = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
    [v10 registerObserver:v7];
  }

  return v7;
}

- (void)importItemArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 musicLibrary]);

  [v11 setClientIdentity:v8];
  id v12 = +[ML3Track newWithPersistentID:inLibrary:](&OBJC_CLASS___ML3Track, "newWithPersistentID:inLibrary:", a3, v11);
  id v13 = [[ML3ArtworkTokenSet alloc] initWithEntity:v12 artworkType:1];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 artworkTokenForSource:600]);
  if ([v14 length])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:ML3TrackPropertyMediaType]);
    v32 = v14;
    v16 = v11;
    id v17 = v12;
    int64_t v18 = a3;
    id v19 = v13;
    id v20 = v8;
    v21 = v9;
    v22 = v15;
    id v23 = [v15 unsignedIntValue];

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    uint64_t v25 = [v24 isCellularDataRestrictedForMusic] ^ 1;

    v9 = v21;
    id v8 = v20;
    id v13 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
    int64_t v27 = v18;
    id v12 = v17;
    v11 = v16;
    v14 = v32;
    [v26 importArtworkForCloudID:v27 artworkType:1 token:v32 mediaType:v23 allowsCellularData:v25 clientIdentity:v8 completionHandler:v9];
  }

  else if (v9)
  {
    v28 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v36 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_FAULT,  "No subscription artwork_token for item with persistent-id = %lld",  buf,  0xCu);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No subscription artwork_token for item with persistent-id = %lld",  a3));
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    v34 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2008LL,  v30));

    v9[2](v9, v31);
  }
}

- (void)importScreenshotForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 musicLibrary]);

  [v11 setClientIdentity:v8];
  id v12 = +[ML3Track newWithPersistentID:inLibrary:](&OBJC_CLASS___ML3Track, "newWithPersistentID:inLibrary:", a3, v11);
  id v13 = [[ML3ArtworkTokenSet alloc] initWithEntity:v12 artworkType:2];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 artworkTokenForSource:600]);
  if ([v14 length])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:ML3TrackPropertyMediaType]);
    v32 = v14;
    v16 = v11;
    id v17 = v12;
    int64_t v18 = a3;
    id v19 = v13;
    id v20 = v8;
    v21 = v9;
    v22 = v15;
    id v23 = [v15 unsignedIntValue];

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    uint64_t v25 = [v24 isCellularDataRestrictedForMusic] ^ 1;

    v9 = v21;
    id v8 = v20;
    id v13 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
    int64_t v27 = v18;
    id v12 = v17;
    v11 = v16;
    v14 = v32;
    [v26 importArtworkForCloudID:v27 artworkType:2 token:v32 mediaType:v23 allowsCellularData:v25 clientIdentity:v8 completionHandler:v9];
  }

  else if (v9)
  {
    v28 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v36 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_FAULT,  "No subscription artwork_token for item with persistent-id = %lld",  buf,  0xCu);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No subscription screenshot_token for item with persistent-id = %lld",  a3));
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    v34 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2008LL,  v30));

    v9[2](v9, v31);
  }
}

- (void)importContainerArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 musicLibrary]);

  [v11 setClientIdentity:v8];
  id v12 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  a3,  v11);
  id v13 = [[ML3ArtworkTokenSet alloc] initWithEntity:v12 artworkType:5];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 artworkTokenForSource:600]);
  if ([v14 length])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    uint64_t v16 = [v15 isCellularDataRestrictedForMusic] ^ 1;

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
    [v17 importArtworkForCloudID:a3 artworkType:5 token:v14 mediaType:8 allowsCellularData:v16 clientIdentity:v8 completionHandler:v9];
  }

  else if (v9)
  {
    int64_t v18 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v25 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "No subscription artwork_token for item with persistent-id = %lld",  buf,  0xCu);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No subscription artwork_token for item with persistent-id = %lld",  a3));
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    id v23 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2008LL,  v20));

    v9[2](v9, v21);
  }
}

- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:1];
}

- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:2];
}

- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:5];
}

- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)environmentMonitorDidChangePower:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v6 = [v5 isWatch];

  if (v6)
  {
    unsigned int v7 = [v4 isCharging];
    id v8 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v14 = 138543362;
        v15 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Device is plugged in - checking for artwork to download",  (uint8_t *)&v14,  0xCu);
      }

      uint64_t v12 = MSVTCCIdentityForCurrentProcess(v10, v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[SubscriptionRequestHandler _importAllItemArtworkWithClientIdentity:]( self,  "_importAllItemArtworkWithClientIdentity:",  v13);
    }

    else
    {
      if (v9)
      {
        int v14 = 138543362;
        v15 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Device was unplugged from power - cancelling artwork downloads",  (uint8_t *)&v14,  0xCu);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
      [v13 cancelAllImports];
    }
  }
}

- (void)_loadArtworkInfoForSubscriptionPersistentIDs:(id)a3 artworkType:(int64_t)a4 entityType:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v43 = a6;
  v41 = self;
  id v42 = a7;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v12 musicLibrary]);

  [v48 setClientIdentity:v43];
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x3032000000LL;
  v74 = sub_1000E12D8;
  v75 = sub_1000E12E8;
  v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x3032000000LL;
  v68 = sub_1000E12D8;
  v69 = sub_1000E12E8;
  id v70 = 0LL;
  if (a5 == 1)
  {
    int v14 = (void *)objc_opt_class(&OBJC_CLASS___ML3Container, v13);
    id v46 = ML3ContainerPropertyStoreCloudID;
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___SagaLoadBulkContainerArtworkInfoOperation, v17);
    goto LABEL_5;
  }

  if (!a5)
  {
    int v14 = (void *)objc_opt_class(&OBJC_CLASS___ML3Track, v13);
    id v46 = ML3TrackPropertyStoreSagaID;
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___SagaLoadBulkItemArtworkInfoOperation, v15);
LABEL_5:
    v40 = (objc_class *)v16;
    goto LABEL_7;
  }

  NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Unsupported entity type %ld for subscription artwork info",  self,  a5));
  v79 = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
  uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2021LL,  v19));
  v21 = (void *)v66[5];
  v66[5] = v20;

  v40 = 0LL;
  id v46 = 0LL;
  int v14 = 0LL;
LABEL_7:
  v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id obj = v11;
  id v22 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v62 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = objc_msgSend( v14,  "newWithPersistentID:inLibrary:",  objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * (void)i), "longLongValue"),  v48);
        id v26 = [[ML3ArtworkTokenSet alloc] initWithEntity:v25 artworkType:a4];
        int64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 artworkTokenForSource:600]);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v27));
        v29 = v28;
        if (v28
          && (v30 = (void *)objc_claimAutoreleasedReturnValue([v28 resourceSpecifier]),
              BOOL v31 = [v30 rangeOfString:@"//"] == 0,
              v30,
              v31))
        {
          NSErrorUserInfoKey v33 = (void *)objc_claimAutoreleasedReturnValue([v29 absoluteString]);
          uint64_t ArtworkInfoDictionary = ICCloudClientCreateArtworkInfoDictionary(v33);
          v32 = (void *)objc_claimAutoreleasedReturnValue(ArtworkInfoDictionary);

          [(id)v72[5] addObject:v32];
        }

        else
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue([v25 valueForProperty:v46]);
          if (v32) {
            -[NSMutableArray addObject:](v44, "addObject:", v32);
          }
        }
      }

      id v22 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
    }

    while (v22);
  }

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_1000E12F0;
  v57[3] = &unk_1001A5BA0;
  v59 = &v65;
  v60 = &v71;
  id v35 = v42;
  id v58 = v35;
  int64_t v36 = objc_retainBlock(v57);
  if (-[NSMutableArray count](v44, "count") && !v66[5])
  {
    id v37 = objc_alloc(v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler configuration](v41, "configuration"));
    id v39 = [v37 initWithConfiguration:v38 cloudIDs:v44];

    objc_initWeak(&location, v39);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1000E1358;
    v49[3] = &unk_1001A5BC8;
    v50 = v44;
    objc_copyWeak(&v55, &location);
    v51 = v41;
    v53 = &v71;
    v54 = &v65;
    v52 = v36;
    [v39 setCompletionBlock:v49];

    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }

  else
  {
    ((void (*)(void *))v36[2])(v36);
  }

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);
}

- (void)_importAllItemArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 musicLibrary]);

  [v6 setClientIdentity:v4];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  char v8 = [v7 isCellularDataRestrictedForMusic] ^ 1;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E110C;
  v10[3] = &unk_1001A6B48;
  char v13 = v8;
  id v11 = v4;
  uint64_t v12 = self;
  id v9 = v4;
  [v6 databaseConnectionAllowingWrites:0 withBlock:v10];
}

- (void)cancelOperationsWithCompletionHandler:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICContentKeySession enhancedAudioSharedContentKeyPath]( &OBJC_CLASS___ICContentKeySession,  "enhancedAudioSharedContentKeyPath",  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = 0LL;
  unsigned __int8 v6 = [v5 removeItemAtPath:v4 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    char v8 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@ - Failed to remove the shared enhanced audio keys. err=%{public}@",  buf,  0x16u);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionRequestHandler artworkImporter](self, "artworkImporter"));
  [v9 cancelAllImportsAndWaitForOperationsToFinish:0];
}

- (CloudArtworkImporter)artworkImporter
{
  return self->_artworkImporter;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end