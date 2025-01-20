@interface JaliscoLoadChapterArtworkOperation
- (JaliscoLoadChapterArtworkOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 dictionary:(id)a5;
- (JaliscoLoadChapterArtworkOperation)initWithDictionary:(id)a3;
- (void)cancel;
- (void)main;
@end

@implementation JaliscoLoadChapterArtworkOperation

- (JaliscoLoadChapterArtworkOperation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v6 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v5);
  uint64_t v7 = MSVTCCIdentityForCurrentProcess();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[JaliscoLoadChapterArtworkOperation initWithConfiguration:clientIdentity:dictionary:]( self,  "initWithConfiguration:clientIdentity:dictionary:",  v6,  v8,  v4);

  return v9;
}

- (JaliscoLoadChapterArtworkOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 dictionary:(id)a5
{
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___JaliscoLoadChapterArtworkOperation;
  id v10 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v23,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v11 = (JaliscoLoadChapterArtworkOperation *)v10;
  if (v10)
  {
    objc_storeStrong((id *)v10 + 11, a5);
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.itunescloudd.%@",  objc_opt_class(v11, v12));
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    error = v11->super._error;
    v11->super._error = (NSError *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    [v16 setHTTPShouldUsePipelining:1];
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    objc_msgSend( v16,  "setAllowsCellularAccess:",  objc_msgSend(v17, "isCellularDataRestrictedForVideos") ^ 1);

    v18 = -[ICURLSession initWithConfiguration:maxConcurrentRequests:qualityOfService:]( objc_alloc(&OBJC_CLASS___ICURLSession),  "initWithConfiguration:maxConcurrentRequests:qualityOfService:",  v16,  5LL,  17LL);
    chapterArtworkToLoad = v11->_chapterArtworkToLoad;
    v11->_chapterArtworkToLoad = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    powerAssertionIdentifier = v11->_powerAssertionIdentifier;
    v11->_powerAssertionIdentifier = (NSString *)&v20->super.isa;

    -[NSString setMaxConcurrentOperationCount:](v11->_powerAssertionIdentifier, "setMaxConcurrentOperationCount:", 5LL);
  }

  return v11;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned __int8 v4 = [v3 shouldProhibitVideosActionForCurrentNetworkConditions];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      error = self->super._error;
      *(_DWORD *)buf = 138543362;
      v62 = error;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Loading Chapter Artwork with power assertion: %{public}@",  buf,  0xCu);
    }

    CPSetPowerAssertionWithIdentifier(1LL, self->super._error);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v7 setClientIdentity:v8];

    group = dispatch_group_create();
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([(id)self->super._status allKeys]);
    id v40 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v58;
      uint64_t v46 = ML3TrackPropertyPurchaseHistoryID;
      uint64_t v42 = ML3TrackPropertyMediaType;
LABEL_6:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v58 != v39) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v57 + 1) + 8 * v9);
        uint64_t v41 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue([(id)self->super._status objectForKeyedSubscript:v10]);
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        v45 = v11;
        id v44 = (id)objc_claimAutoreleasedReturnValue([v11 allKeys]);
        id v48 = [v44 countByEnumeratingWithState:&v53 objects:v67 count:16];
        if (v48)
        {
          uint64_t v47 = *(void *)v54;
LABEL_12:
          uint64_t v12 = 0LL;
          while (1)
          {
            if (*(void *)v54 != v47) {
              objc_enumerationMutation(v44);
            }
            v13 = *(void **)(*((void *)&v53 + 1) + 8 * v12);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
            v15 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  v46,  [v10 longLongValue]));
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:options:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:options:",  v14,  v15,  3LL));

            if (v16)
            {
              uint64_t v17 = objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v13]);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForProperty:v42]);
              unsigned int v49 = [v18 unsignedIntValue];

              id v19 = [v16 persistentID];
              [v13 doubleValue];
              v50 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:]( &OBJC_CLASS___ML3MusicLibrary,  "artworkTokenForChapterWithItemPID:retrievalTime:",  v19,  v20 / 1000.0));
              v21 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = (NSError *)[v10 longLongValue];
                id v23 = [v13 longLongValue];
                *(_DWORD *)buf = 134218498;
                v62 = v22;
                __int16 v63 = 2048;
                id v64 = v23;
                __int16 v65 = 2114;
                uint64_t v66 = v17;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Fetching chapter artwork (purchase history ID = %lld, chapter time = %lld): %{public}@",  buf,  0x20u);
              }

              v24 = objc_alloc(&OBJC_CLASS___CloudArtworkImportOperation);
              chapterArtworkToLoad = self->_chapterArtworkToLoad;
              v26 = (void *)v17;
              v27 = self;
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
              id v29 = [v10 unsignedLongLongValue];
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](v27, "clientIdentity"));
              v31 = -[CloudArtworkImportOperation initWithURLSession:configuration:cloudID:artworkToken:artworkType:sourceType:clientIdentity:]( v24,  "initWithURLSession:configuration:cloudID:artworkToken:artworkType:sourceType:clientIdentity:",  chapterArtworkToLoad,  v28,  v29,  v50,  3LL,  400LL,  v30);

              self = v27;
              -[CloudArtworkImportOperation setMediaType:](v31, "setMediaType:", v49);
              -[CloudArtworkImportOperation setAssetURL:](v31, "setAssetURL:", v26);
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472LL;
              v51[2] = sub_10002496C;
              v51[3] = &unk_1001A6B90;
              v32 = group;
              v52 = v32;
              -[CloudArtworkImportOperation setCompletionBlock:](v31, "setCompletionBlock:", v51);
              -[CloudArtworkImportOperation setQualityOfService:](v31, "setQualityOfService:", 25LL);
              dispatch_group_enter(v32);
              -[NSString addOperation:](v27->_powerAssertionIdentifier, "addOperation:", v31);
            }

            if (v48 == (id)++v12)
            {
              id v48 = [v44 countByEnumeratingWithState:&v53 objects:v67 count:16];
              if (v48) {
                goto LABEL_12;
              }
              break;
            }
          }
        }

        uint64_t v9 = v41 + 1;
        if ((id)(v41 + 1) == v40)
        {
          id v40 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
          if (v40) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v34 = MSVTCCIdentityForCurrentProcess();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    [v33 setClientIdentity:v35];

    v36 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = self->super._error;
      *(_DWORD *)buf = 138543362;
      v62 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Loading Chapter Artwork Complete, releasing power assertion: %{public}@",  buf,  0xCu);
    }

    CPSetPowerAssertionWithIdentifier(0LL, self->super._error);
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
  }

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___JaliscoLoadChapterArtworkOperation;
  -[JaliscoLoadChapterArtworkOperation cancel](&v3, "cancel");
}

- (void).cxx_destruct
{
}

@end