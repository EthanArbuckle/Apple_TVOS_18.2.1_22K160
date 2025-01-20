@interface TVHETopShelfContentOperation
+ (id)new;
- (BOOL)_updateFromFirstConnectableMediaLibrary;
- (BOOL)_updateFromMediaServerSettings:(id)a3;
- (NSArray)mediaItems;
- (NSArray)mediaItemsSortedByAddedDate;
- (NSArray)mediaItemsSortedByPlayedDate;
- (NSDictionary)imageURLByMediaEntityIdentifier;
- (NSDictionary)imageURLHTTPHeaders;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_source)mediaLibrariesWaitTimer;
- (TVHETopShelfContentOperation)init;
- (TVHETopShelfContentOperation)initWithMediaLibrariesManager:(id)a3;
- (TVHKAsynchronousWorkToken)imageURLsFetchToken;
- (TVHKAsynchronousWorkToken)mediaItemsFetchToken;
- (TVHKMediaLibrariesManager)mediaLibrariesManager;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHKStateMachine)stateMachine;
- (TVTopShelfContent)topShelfContent;
- (id)_filteredMediaItems:(id)a3;
- (id)_imageRequestForMediaItem:(id)a3;
- (id)_imageURLForMediaItem:(id)a3;
- (id)_mediaItemsFetchRequest;
- (id)_mediaItemsSortedByAddedDateFetchRequest;
- (id)_mediaItemsSortedByPlayedDateFetchRequest;
- (id)_topShelfContent;
- (id)_topShelfTitleForMediaItem:(id)a3;
- (int64_t)_sectionedItemImageShape;
- (unint64_t)_topShelfMediaType;
- (unint64_t)mediaCategoryType;
- (void)_cancelFetches;
- (void)_coalesceMediaItems;
- (void)_completeOperation;
- (void)_executionDidBegin;
- (void)_fetchImageURLs;
- (void)_fetchMediaItems;
- (void)_handleMediaLibrariesDidChange;
- (void)_handleMediaLibraryConnectionStateDidChangeNotification:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)_setupStateMachine;
- (void)_startMediaLibrariesWaitTimer;
- (void)_startObservingMediaLibraries;
- (void)_startObservingMediaLibrary:(id)a3;
- (void)_stopMediaLibrariesWaitTimer;
- (void)_stopObservingMediaLibraries;
- (void)_stopObservingMediaLibrary:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setImageURLByMediaEntityIdentifier:(id)a3;
- (void)setImageURLHTTPHeaders:(id)a3;
- (void)setImageURLsFetchToken:(id)a3;
- (void)setMediaCategoryType:(unint64_t)a3;
- (void)setMediaItems:(id)a3;
- (void)setMediaItemsFetchToken:(id)a3;
- (void)setMediaItemsSortedByAddedDate:(id)a3;
- (void)setMediaItemsSortedByPlayedDate:(id)a3;
- (void)setMediaLibrariesWaitTimer:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTopShelfContent:(id)a3;
@end

@implementation TVHETopShelfContentOperation

+ (id)new
{
  return 0LL;
}

- (TVHETopShelfContentOperation)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHETopShelfContentOperation)initWithMediaLibrariesManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHETopShelfContentOperation;
  v6 = -[TVHETopShelfContentOperation init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrariesManager, a3);
    -[TVHETopShelfContentOperation _startObservingMediaLibraries](v7, "_startObservingMediaLibraries");
    dispatch_queue_t v8 = dispatch_queue_create("TVHETopShelfContentOperation-ProcessingQueue", 0LL);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v8;

    v10 = -[TVHKStateMachine initWithName:initialState:mode:]( objc_alloc(&OBJC_CLASS___TVHKStateMachine),  "initWithName:initialState:mode:",  @"TVHETopShelfContentOperation",  @"Idle",  0LL);
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = v10;

    -[TVHETopShelfContentOperation _setupStateMachine](v7, "_setupStateMachine");
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHETopShelfContentOperation;
  -[TVHETopShelfContentOperation dealloc](&v3, "dealloc");
}

- (void)_executionDidBegin
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation processingQueue](self, "processingQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000595C;
  v4[3] = &unk_1000105F0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHETopShelfContentOperation;
  -[TVHETopShelfContentOperation cancel](&v7, "cancel");
  objc_initWeak(&location, self);
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation processingQueue](self, "processingQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005A78;
  v4[3] = &unk_1000105F0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1000155B0 == a6)
  {
    objc_initWeak(&location, self);
    objc_super v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation processingQueue](self, "processingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005BF8;
    block[3] = &unk_1000105F0;
    objc_copyWeak(&v16, &location);
    dispatch_async(v13, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___TVHETopShelfContentOperation;
    -[TVHETopShelfContentOperation observeValueForKeyPath:ofObject:change:context:]( &v14,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_handleMediaLibraryConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005D00;
  block[3] = &unk_100010720;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_handleMediaLibrariesDidChange
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation processingQueue](self, "processingQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100005E38;
  v5[3] = &unk_1000105F0;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setupStateMachine
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation stateMachine](self, "stateMachine"));
  [v3 setShouldAcceptEvents:1];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation stateMachine](self, "stateMachine"));
  id v4 = sub_1000044D4();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v6 setLogObject:v5];
}

- (void)_registerStateMachineHandlers
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation stateMachine](self, "stateMachine"));
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10000637C;
  v30[3] = &unk_100010748;
  objc_copyWeak(&v31, &location);
  id v4 = objc_retainBlock(v30);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100006420;
  v27[3] = &unk_100010770;
  objc_copyWeak(&v29, &location);
  id v5 = v4;
  id v28 = v5;
  [v3 registerHandlerForEvent:@"Start" onState:@"Idle" withBlock:v27];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000064F4;
  v25[3] = &unk_100010798;
  objc_copyWeak(&v26, &location);
  [v3 registerHandlerForEvent:@"Media Entity Server Connection Did Change" onState:@"Connecting Media Entity Server" withBlock:v25];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000065B8;
  v22[3] = &unk_100010770;
  objc_copyWeak(&v24, &location);
  id v6 = v5;
  id v23 = v6;
  [v3 registerHandlerForEvent:@"Media Libraries Did Change" onState:@"WaitingForMediaLibraries" withBlock:v22];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100006640;
  v19[3] = &unk_100010770;
  objc_copyWeak(&v21, &location);
  objc_super v7 = v6;
  id v20 = v7;
  [v3 registerHandlerForEvent:@"Media Libraries Did Change" onState:@"WaitingForMostRecentlyUsedMediaLibrary" withBlock:v19];
  v33[0] = @"WaitingForMostRecentlyUsedMediaLibrary";
  v33[1] = @"WaitingForMediaLibraries";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100006718;
  v17[3] = &unk_100010798;
  objc_copyWeak(&v18, &location);
  [v3 registerHandlerForEvent:@"Media Libraries Wait Timer Did Fire" onStates:v8 withBlock:v17];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100006770;
  v14[3] = &unk_1000107C0;
  id v9 = v3;
  id v15 = v9;
  objc_copyWeak(&v16, &location);
  [v9 registerHandlerForEvent:@"Fetch Media Items Did Complete" onState:@"Fetching Media Entities" withBlock:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000068DC;
  v12[3] = &unk_100010798;
  objc_copyWeak(&v13, &location);
  [v9 registerHandlerForEvent:@"Fetch Image URLs Did Complete" onState:@"Fetching Image URLs" withBlock:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100006984;
  v10[3] = &unk_100010798;
  objc_copyWeak(&v11, &location);
  [v9 registerDefaultHandlerForEvent:@"Cancel" withBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)setMediaLibrary:(id)a3
{
  id v5 = (TVHKMediaLibrary *)a3;
  mediaLibrary = self->_mediaLibrary;
  objc_super v7 = v5;
  if (mediaLibrary != v5)
  {
    if (mediaLibrary) {
      -[TVHETopShelfContentOperation _stopObservingMediaLibrary:](self, "_stopObservingMediaLibrary:");
    }
    objc_storeStrong((id *)&self->_mediaLibrary, a3);
    if (self->_mediaLibrary) {
      -[TVHETopShelfContentOperation _startObservingMediaLibrary:](self, "_startObservingMediaLibrary:");
    }
  }
}

- (BOOL)_updateFromMediaServerSettings:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaServerIdentifier]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrariesManager](self, "mediaLibrariesManager"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaLibraryForMediaServerIdentifier:v5]);

    BOOL v8 = v7 != 0LL;
    if (v7)
    {
      -[TVHETopShelfContentOperation setMediaLibrary:](self, "setMediaLibrary:", v7);
      id v9 = [v4 mediaCategoryType];
      if (v9 == (id)9 || v9 == 0LL) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = (uint64_t)v9;
      }
      -[TVHETopShelfContentOperation setMediaCategoryType:](self, "setMediaCategoryType:", v11);
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_fetchMediaItems
{
  id v3 = sub_1000044D4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = TVHKMediaCategoryTypeLogString(-[TVHETopShelfContentOperation mediaCategoryType](self, "mediaCategoryType"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Fetching media items for media category: %@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrary](self, "mediaLibrary"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHETopShelfContentOperation _mediaItemsSortedByAddedDateFetchRequest]( self,  "_mediaItemsSortedByAddedDateFetchRequest"));
  v14[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHETopShelfContentOperation _mediaItemsSortedByPlayedDateFetchRequest]( self,  "_mediaItemsSortedByPlayedDateFetchRequest"));
  v14[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100006CF8;
  v12[3] = &unk_100010810;
  objc_copyWeak(&v13, (id *)buf);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 enqueueFetchRequests:v10 completionHandler:v12]);

  -[TVHETopShelfContentOperation setMediaItemsFetchToken:](self, "setMediaItemsFetchToken:", v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (id)_mediaItemsSortedByAddedDateFetchRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation _mediaItemsFetchRequest](self, "_mediaItemsFetchRequest"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"addedDate",  0LL));
  id v6 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v2 setSortDescriptors:v4];

  return v2;
}

- (id)_mediaItemsSortedByPlayedDateFetchRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation _mediaItemsFetchRequest](self, "_mediaItemsFetchRequest"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"lastPlayedDate",  0LL));
  id v6 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v2 setSortDescriptors:v4];

  return v2;
}

- (id)_mediaItemsFetchRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  -[TVHETopShelfContentOperation mediaCategoryType](self, "mediaCategoryType")));
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v3, "addObject:", @"title");
  -[NSMutableSet addObject:](v3, "addObject:", @"identifier");
  -[NSMutableSet addObject:](v3, "addObject:", @"type");
  -[NSMutableSet addObject:](v3, "addObject:", @"imageIdentifier");
  -[NSMutableSet addObject:](v3, "addObject:", @"duration");
  -[NSMutableSet addObject:](v3, "addObject:", @"addedDate");
  -[NSMutableSet addObject:](v3, "addObject:", @"albumTitle");
  -[NSMutableSet addObject:](v3, "addObject:", @"albumIdentifier");
  -[NSMutableSet addObject:](v3, "addObject:", @"lastPlayedDate");
  -[NSMutableSet addObject:](v3, "addObject:", @"showTitle");
  -[NSMutableSet addObject:](v3, "addObject:", @"seasonNumber");
  [v2 setProperties:v3];
  objc_msgSend(v2, "setRange:", 0, 100);
  uint64_t v6 = TVHKMediaEntitiesFetchRequestOptionDontUseFetchCache;
  objc_super v7 = &__kCFBooleanTrue;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v2 setOptions:v4];

  return v2;
}

- (void)_coalesceMediaItems
{
  id v3 = sub_1000044D4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Coalescing media items", v13, 2u);
  }

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaItemsSortedByAddedDate](self, "mediaItemsSortedByAddedDate"));
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v6);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaItemsSortedByPlayedDate](self, "mediaItemsSortedByPlayedDate"));
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v7);

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKSortUtilities descendingDateSortComparatorWithBlock:]( &OBJC_CLASS___TVHKSortUtilities,  "descendingDateSortComparatorWithBlock:",  &stru_100010850));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v5, "sortedArrayUsingComparator:", v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation _filteredMediaItems:](self, "_filteredMediaItems:", v9));
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, 25));
  }
  id v12 = v11;
  -[TVHETopShelfContentOperation setMediaItems:](self, "setMediaItems:", v11);
}

- (id)_filteredMediaItems:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000044D4();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = "verArtShape:";
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v3 count];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
    *(_DWORD *)buf = 67109378;
    unsigned int v37 = v7;
    __int16 v38 = 2112;
    v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Filtering media items (%u) [%@]", buf, 0x12u);
  }

  if (v3)
  {
    v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v29 = v3;
    id v11 = v3;
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v12) {
      goto LABEL_20;
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    while (1)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "type", v29));
        if ([v17 mediaCategoryType] == (id)4
          && (uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 showTitle])) != 0)
        {
          v19 = (void *)v18;
          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v18));

          if (v20) {
            goto LABEL_15;
          }
          id v21 = v9;
        }

        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v16 albumIdentifier]);
          if (!v19
            || (v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v10, "objectForKey:", v19)),
                v22,
                v22))
          {
LABEL_15:

            goto LABEL_18;
          }

          id v21 = v10;
        }

        -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v16, v19);

        -[NSMutableArray addObject:](v30, "addObject:", v16);
LABEL_18:
      }

      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v13)
      {
LABEL_20:

        id v23 = -[NSMutableArray copy](v30, "copy");
        id v3 = v29;
        uint64_t v6 = "setMovieCoverArtShape:" + 10;
        goto LABEL_22;
      }
    }
  }

  id v23 = 0LL;
LABEL_22:
  id v24 = sub_1000044D4();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v26 = [v23 count];
    v27 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
    *(_DWORD *)buf = *((void *)v6 + 245);
    unsigned int v37 = v26;
    __int16 v38 = 2112;
    v39 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Filtered media items (%u) [%@]", buf, 0x12u);
  }

  return v23;
}

- (void)_fetchImageURLs
{
  id v3 = sub_1000044D4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaItems](self, "mediaItems"));
    *(_DWORD *)buf = 134217984;
    id v13 = [v5 count];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "!#! Starting image URL fetch for %lu items",  buf,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaItems](self, "mediaItems"));
  id v7 = [[TVHKMediaEntityImageURLsFetchRequest alloc] initWithMediaEntities:v6];
  objc_msgSend(v7, "setScaleToSize:", 600.0, 600.0);
  objc_initWeak((id *)buf, self);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrary](self, "mediaLibrary"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000078A4;
  v10[3] = &unk_100010878;
  objc_copyWeak(&v11, (id *)buf);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 enqueueImageURLsFetchRequest:v7 completionHandler:v10]);

  -[TVHETopShelfContentOperation setImageURLsFetchToken:](self, "setImageURLsFetchToken:", v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (id)_imageURLForMediaItem:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHETopShelfContentOperation imageURLByMediaEntityIdentifier]( self,  "imageURLByMediaEntityIdentifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvhk_URLForKey:", v4));

  return v6;
}

- (id)_imageRequestForMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrariesManager](self, "mediaLibrariesManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaServerIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaLibraryForMediaServerIdentifier:v6]);

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 imageKeyForObject:v4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation _imageURLForMediaItem:](self, "_imageURLForMediaItem:", v4));

  if (v9)
  {
    id v10 = [[TVTopShelfImageRequest alloc] initWithURL:v9 imageIdentifier:v8];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation imageURLHTTPHeaders](self, "imageURLHTTPHeaders"));
    if (v11) {
      [v10 setCustomHeaders:v11];
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_cancelFetches
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation imageURLsFetchToken](self, "imageURLsFetchToken"));
  [v3 cancel];

  -[TVHETopShelfContentOperation setImageURLsFetchToken:](self, "setImageURLsFetchToken:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaItemsFetchToken](self, "mediaItemsFetchToken"));
  [v4 cancel];

  -[TVHETopShelfContentOperation setMediaItemsFetchToken:](self, "setMediaItemsFetchToken:", 0LL);
}

- (id)_topShelfContent
{
  id v3 = sub_1000044D4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Building top shelf content", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaItems](self, "mediaItems"));
  if ([v5 count])
  {
    id v6 = sub_1000044D4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaItems](self, "mediaItems"));
      id v9 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Have media items : [%lu]", buf, 0xCu);
    }

    int64_t v10 = -[TVHETopShelfContentOperation _sectionedItemImageShape](self, "_sectionedItemImageShape");
    id v11 = objc_alloc(&OBJC_CLASS___TVHURLBuilder);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrary](self, "mediaLibrary"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    uint64_t v14 = -[TVHURLBuilder initWithMediaServerIdentifier:](v11, "initWithMediaServerIdentifier:", v13);

    id v15 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaItems](self, "mediaItems"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100007EDC;
    v26[3] = &unk_1000108A0;
    v26[4] = self;
    int64_t v29 = v10;
    v17 = v14;
    v27 = v17;
    uint64_t v18 = v15;
    id v28 = v18;
    [v16 enumerateObjectsUsingBlock:v26];

    if (-[NSMutableArray count](v18, "count"))
    {
      id v19 = [[TVTopShelfItemCollection alloc] initWithItems:v18];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrary](self, "mediaLibrary"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 title]);
      [v19 setTitle:v21];

      id v22 = objc_alloc(&OBJC_CLASS___TVTopShelfSectionedContent);
      id v30 = v19;
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
      id v24 = [v22 initWithSections:v23];
    }

    else
    {
      id v24 = 0LL;
    }
  }

  else
  {
    id v24 = 0LL;
  }

  return v24;
}

- (id)_topShelfTitleForMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
  uint64_t v5 = (char *)[v4 mediaCategoryType];
  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5 == (char *)4)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 showTitle]);
      goto LABEL_7;
    }

    if (v5 != (char *)5)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 albumTitle]);
      goto LABEL_7;
    }
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 title]);
LABEL_7:
  id v7 = (void *)v6;

  return v7;
}

- (int64_t)_sectionedItemImageShape
{
  uint64_t v3 = -[TVHETopShelfContentOperation mediaCategoryType](self, "mediaCategoryType");
  int64_t result = 0LL;
  switch(v3)
  {
    case 0LL:
    case 9LL:
      id v5 = sub_1000044D4();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10000A264(v3, v6);
      }

      int64_t result = 0LL;
      break;
    case 2LL:
    case 3LL:
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrary](self, "mediaLibrary"));
      unsigned int v8 = objc_msgSend(v7, "tvh_shouldDisplayWideMovieCoverArt");

      if (v8) {
        int64_t result = 2LL;
      }
      else {
        int64_t result = 1LL;
      }
      break;
    case 4LL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrary](self, "mediaLibrary"));
      unsigned int v10 = objc_msgSend(v9, "tvh_shouldDisplayWideShowCoverArt");

      if (v10) {
        int64_t result = 2LL;
      }
      else {
        int64_t result = 0LL;
      }
      break;
    case 5LL:
      int64_t result = 2LL;
      break;
    default:
      return result;
  }

  return result;
}

- (unint64_t)_topShelfMediaType
{
  unint64_t v2 = -[TVHETopShelfContentOperation mediaCategoryType](self, "mediaCategoryType");
  if (v2 - 1 < 8) {
    return qword_10000F7D0[v2 - 1];
  }
  unint64_t v4 = v2;
  id v5 = sub_1000044D4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    unint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unexpected media category type: %lu",  (uint8_t *)&v7,  0xCu);
  }

  return 0LL;
}

- (BOOL)_updateFromFirstConnectableMediaLibrary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrariesManager](self, "mediaLibrariesManager"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaLibraries]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      unsigned int v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v12 = v10;

    if (v12)
    {
      -[TVHETopShelfContentOperation setMediaLibrary:](self, "setMediaLibrary:", v12);
      -[TVHETopShelfContentOperation setMediaCategoryType:](self, "setMediaCategoryType:", 3LL);
      BOOL v11 = 1;
      goto LABEL_12;
    }

    BOOL v11 = 0;
  }

  else
  {
LABEL_9:
    BOOL v11 = 0;
    id v12 = v5;
LABEL_12:
  }

  return v11;
}

- (void)_startMediaLibrariesWaitTimer
{
  id v3 = sub_1000044D4();
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting media libraries wait timer.",  (uint8_t *)buf,  2u);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation processingQueue](self, "processingQueue"));
  id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v5);

  -[TVHETopShelfContentOperation setMediaLibrariesWaitTimer:](self, "setMediaLibrariesWaitTimer:", v6);
  dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak(buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100008640;
  handler[3] = &unk_1000105F0;
  objc_copyWeak(&v9, buf);
  dispatch_source_set_event_handler(v6, handler);
  dispatch_resume(v6);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)_stopMediaLibrariesWaitTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrariesWaitTimer](self, "mediaLibrariesWaitTimer"));

  if (v3)
  {
    id v4 = sub_1000044D4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping media libraries wait timer.", v7, 2u);
    }

    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrariesWaitTimer](self, "mediaLibrariesWaitTimer"));
    dispatch_source_cancel(v6);

    -[TVHETopShelfContentOperation setMediaLibrariesWaitTimer:](self, "setMediaLibrariesWaitTimer:", 0LL);
  }

- (void)_startObservingMediaLibraries
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrariesManager](self, "mediaLibrariesManager"));
  [v3 addObserver:self forKeyPath:@"mediaLibraries" options:1 context:off_1000155B0];
}

- (void)_stopObservingMediaLibraries
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation mediaLibrariesManager](self, "mediaLibrariesManager"));
  [v3 removeObserver:self forKeyPath:@"mediaLibraries" context:off_1000155B0];
}

- (void)_startObservingMediaLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleMediaLibraryConnectionStateDidChangeNotification:" name:TVHKMediaLibraryConnectionStateDidChangeNotification object:v4];
}

- (void)_stopObservingMediaLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:TVHKMediaLibraryConnectionStateDidChangeNotification object:v4];
}

- (void)_completeOperation
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentOperation _topShelfContent](self, "_topShelfContent"));
  -[TVHETopShelfContentOperation setTopShelfContent:](self, "setTopShelfContent:", v3);
  -[TVHETopShelfContentOperation _finishExecutionIfPossible](self, "_finishExecutionIfPossible");
}

- (TVTopShelfContent)topShelfContent
{
  return self->_topShelfContent;
}

- (void)setTopShelfContent:(id)a3
{
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHKMediaLibrariesManager)mediaLibrariesManager
{
  return self->_mediaLibrariesManager;
}

- (OS_dispatch_source)mediaLibrariesWaitTimer
{
  return self->_mediaLibrariesWaitTimer;
}

- (void)setMediaLibrariesWaitTimer:(id)a3
{
}

- (TVHKStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (unint64_t)mediaCategoryType
{
  return self->_mediaCategoryType;
}

- (void)setMediaCategoryType:(unint64_t)a3
{
  self->_mediaCategoryType = a3;
}

- (TVHKAsynchronousWorkToken)mediaItemsFetchToken
{
  return self->_mediaItemsFetchToken;
}

- (void)setMediaItemsFetchToken:(id)a3
{
}

- (NSArray)mediaItemsSortedByAddedDate
{
  return self->_mediaItemsSortedByAddedDate;
}

- (void)setMediaItemsSortedByAddedDate:(id)a3
{
}

- (NSArray)mediaItemsSortedByPlayedDate
{
  return self->_mediaItemsSortedByPlayedDate;
}

- (void)setMediaItemsSortedByPlayedDate:(id)a3
{
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
}

- (NSDictionary)imageURLByMediaEntityIdentifier
{
  return self->_imageURLByMediaEntityIdentifier;
}

- (void)setImageURLByMediaEntityIdentifier:(id)a3
{
}

- (NSDictionary)imageURLHTTPHeaders
{
  return self->_imageURLHTTPHeaders;
}

- (void)setImageURLHTTPHeaders:(id)a3
{
}

- (TVHKAsynchronousWorkToken)imageURLsFetchToken
{
  return self->_imageURLsFetchToken;
}

- (void)setImageURLsFetchToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end