@interface SagaLoadLyricsOperation
- (SagaLoadLyricsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaIDs:(id)a5;
- (void)main;
@end

@implementation SagaLoadLyricsOperation

- (SagaLoadLyricsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaIDs:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SagaLoadLyricsOperation;
  id v10 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v13,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v11 = (SagaLoadLyricsOperation *)v10;
  if (v10) {
    objc_storeStrong((id *)v10 + 11, a5);
  }

  return v11;
}

- (void)main
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned __int8 v3 = [v2 shouldProhibitMusicActionForCurrentNetworkConditions];

  if ((v3 & 1) == 0)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    id v4 = [(id)self->super._status count];
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaLoadLyricsOperation-bulk (item count = %llu)",  v4));
    id v37 = [[MSVXPCTransaction alloc] initWithName:v38];
    [v37 beginTransaction];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v5 setClientIdentity:v6];

    v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Taking power assertion: com.apple.itunescloudd.SagaLoadLyricsOperation",  buf,  2u);
    }

    CPSetPowerAssertionWithIdentifier(1LL, @"com.apple.itunescloudd.SagaLoadLyricsOperation");
    v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 100;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Fetching lyrics for %ld tracks (batch size = %u)",  buf,  0x12u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)self->super._status subarraysOfSize:100]);
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v64 = 0u;
    __int128 v63 = 0u;
    id obj = v9;
    id v41 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v64;
      uint64_t v46 = ML3TrackPropertyStoreSagaID;
      uint64_t v42 = ML3TrackPropertyLyrics;
      while (2)
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v64 != v40)
          {
            uint64_t v11 = v10;
            objc_enumerationMutation(obj);
            uint64_t v10 = v11;
          }

          uint64_t v43 = v10;
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkLyricsInfoRequest requestWithDatabaseID:itemIDs:useLongIDs:]( ICBulkLyricsInfoRequest,  "requestWithDatabaseID:itemIDs:useLongIDs:",  [v45 databaseID],  *(void *)(*((void *)&v63 + 1) + 8 * v10),  0));
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          v73 = sub_1000A1004;
          v74 = sub_1000A1014;
          id v75 = 0LL;
          dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472LL;
          v60[2] = sub_1000A101C;
          v60[3] = &unk_1001A6EA0;
          v62 = buf;
          objc_super v13 = v12;
          v61 = v13;
          [v45 sendRequest:v49 withResponseHandler:v60];
          dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
          v44 = v13;
          if ((-[SagaLoadLyricsOperation isCancelled](self, "isCancelled") & 1) != 0)
          {

            _Block_object_dispose(buf, 8);
            goto LABEL_42;
          }

          v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) lyricsInfoDictionaries]);
          if (v48)
          {
            v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = [v48 count];
              *(_DWORD *)v67 = 134217984;
              id v68 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[Bulk] Received %lu lyrics info dictionaries",  v67,  0xCu);
            }

            __int128 v58 = 0u;
            __int128 v59 = 0u;
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            id v50 = v48;
            id v16 = [v50 countByEnumeratingWithState:&v56 objects:v71 count:16];
            if (v16)
            {
              uint64_t v52 = *(void *)v57;
LABEL_17:
              uint64_t v17 = 0LL;
              id v53 = v16;
              while (1)
              {
                if (*(void *)v57 != v52) {
                  objc_enumerationMutation(v50);
                }
                v18 = *(void **)(*((void *)&v56 + 1) + 8 * v17);
                v19 = objc_autoreleasePoolPush();
                unsigned __int8 v20 = -[SagaLoadLyricsOperation isCancelled](self, "isCancelled");
                if ((v20 & 1) == 0)
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"dmap.itemid"]);
                  id v22 = [v21 longLongValue];

                  v51 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"dmap.dictionary"]);
                  v23 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKey:@"text-url"]);
                  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v23));
                  v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v67 = 138543362;
                    id v68 = v24;
                    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[Bulk] Loading lyrics from URL '%{public}@'...",  v67,  0xCu);
                  }

                  id v55 = 0LL;
                  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v24,  4LL,  &v55));
                  id v27 = v55;
                  if (v27)
                  {
                    v28 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v67 = 138543618;
                      id v68 = v24;
                      __int16 v69 = 2114;
                      id v70 = v27;
                      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "[Bulk] Error getting lyrics from %{public}@: %{public}@",  v67,  0x16u);
                    }
                  }

                  else
                  {
                    v29 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  v46,  v22));
                    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:",  v47,  v29));

                    v30 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                    v31 = v30;
                    if (v28)
                    {
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                      {
                        id v32 = [v26 length];
                        *(_DWORD *)v67 = 134218240;
                        id v68 = v32;
                        __int16 v69 = 2048;
                        id v70 = v22;
                        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[Bulk] Setting lyrics of length: %lu on track with saga ID %lld",  v67,  0x16u);
                      }

                      -[os_log_s setValue:forProperty:](v28, "setValue:forProperty:", v26, v42);
                    }

                    else
                    {
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v67 = 134217984;
                        id v68 = v22;
                        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "[Bulk] No track found for saga ID %lld when attempting to set lyrics.",  v67,  0xCu);
                      }

                      v28 = 0LL;
                    }
                  }
                }

                objc_autoreleasePoolPop(v19);
                if ((v20 & 1) != 0) {
                  break;
                }
                if (v53 == (id)++v17)
                {
                  id v16 = [v50 countByEnumeratingWithState:&v56 objects:v71 count:16];
                  if (v16) {
                    goto LABEL_17;
                  }
                  break;
                }
              }
            }
          }

          _Block_object_dispose(buf, 8);
          uint64_t v10 = v43 + 1;
        }

        while ((id)(v43 + 1) != v41);
        id v41 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }

- (void).cxx_destruct
{
}

@end