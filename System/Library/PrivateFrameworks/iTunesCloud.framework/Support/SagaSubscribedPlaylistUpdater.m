@interface SagaSubscribedPlaylistUpdater
- (BOOL)ignoreMinRefreshInterval;
- (BOOL)performUpdateWithClientIdentity:(id)a3 error:(id *)a4;
- (BOOL)pinnedOnly;
- (CloudLibraryConnection)connection;
- (NSArray)playlistCloudIDs;
- (NSURL)payloadDownloadPathOverride;
- (SagaSubscribedPlaylistUpdater)initWithSubscribedPlaylistCloudIDs:(id)a3 cloudLibraryConnection:(id)a4;
- (int64_t)requestReason;
- (void)setIgnoreMinRefreshInterval:(BOOL)a3;
- (void)setPayloadDownloadPathOverride:(id)a3;
- (void)setPinnedOnly:(BOOL)a3;
- (void)setRequestReason:(int64_t)a3;
@end

@implementation SagaSubscribedPlaylistUpdater

- (SagaSubscribedPlaylistUpdater)initWithSubscribedPlaylistCloudIDs:(id)a3 cloudLibraryConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SagaSubscribedPlaylistUpdater;
  v9 = -[SagaSubscribedPlaylistUpdater init](&v14, "init");
  if (v9)
  {
    if (!v8)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v13 handleFailureInMethod:a2, v9, @"SagaSubscribedPlaylistUpdater.m", 39, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
    }

    v10 = (NSArray *)[v7 copy];
    playlistCloudIDs = v9->_playlistCloudIDs;
    v9->_playlistCloudIDs = v10;

    objc_storeStrong((id *)&v9->_connection, a4);
  }

  return v9;
}

- (BOOL)performUpdateWithClientIdentity:(id)a3 error:(id *)a4
{
  id v91 = a3;
  v97 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SagaSubscribedPlaylistUpdater connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userIdentity]);
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v6));

  [v93 setClientIdentity:v91];
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  if (v97->_playlistCloudIDs)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ContainmentPredicate predicateWithProperty:values:]( &OBJC_CLASS___ML3ContainmentPredicate,  "predicateWithProperty:values:",  ML3ContainerPropertyStoreCloudID,  v7));
    [v95 addObject:v8];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[ML3PropertyPredicate predicateWithProperty:]( &OBJC_CLASS___ML3PropertyPredicate,  "predicateWithProperty:",  ML3ContainerPropertyCloudIsSubscribed));
    v124[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[ML3PropertyPredicate predicateWithProperty:]( &OBJC_CLASS___ML3PropertyPredicate,  "predicateWithProperty:",  ML3ContainerPropertyCloudIsCuratorPlaylist));
    v124[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v124, 2LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AnyCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AnyCompoundPredicate,  "predicateMatchingPredicates:",  v11));

    [v95 addObject:v12];
  }

  if (v97->_pinnedOnly)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  ML3EntityPropertyKeepLocal,  &off_1001B3AF0,  3LL));
    [v95 addObject:v13];
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v95 count] == (id)1) {
    v89 = (void *)objc_claimAutoreleasedReturnValue([v95 firstObject]);
  }
  else {
    v89 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v95));
  }
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Container unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:]( &OBJC_CLASS___ML3Container,  "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:",  v93,  v89,  &__NSArray0__struct));
  v123[0] = ML3ContainerPropertyStoreCloudID;
  v123[1] = ML3ContainerPropertyCloudMinRefreshInterval;
  v123[2] = ML3ContainerPropertyCloudLastUpdateTime;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v123, 3LL));
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472LL;
  v111[2] = sub_10002F500;
  v111[3] = &unk_1001A2408;
  v111[4] = v97;
  uint64_t v113 = v15;
  id v92 = v16;
  id v112 = v92;
  [v88 enumeratePersistentIDsAndProperties:v17 usingBlock:v111];

  v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v92 count];
    *(_DWORD *)buf = 134217984;
    id v126 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Found %lu subscribed playlists to update for periodic poll.",  buf,  0xCu);
  }

  v20 = (NSArray *)[v92 copy];
  playlistCloudIDs = v97->_playlistCloudIDs;
  v97->_playlistCloudIDs = v20;

  if (-[NSArray count](v97->_playlistCloudIDs, "count"))
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue( +[ICSubscribedContainersRequest requestWithDatabaseID:containerIDs:]( &OBJC_CLASS___ICSubscribedContainersRequest,  "requestWithDatabaseID:containerIDs:",  -[CloudLibraryConnection databaseID](v97->_connection, "databaseID"),  v97->_playlistCloudIDs));
    objc_msgSend(v90, "setReason:", -[SagaSubscribedPlaylistUpdater requestReason](v97, "requestReason"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[SagaSubscribedPlaylistUpdater payloadDownloadPathOverride](v97, "payloadDownloadPathOverride"));
    if (!v22)
    {
      v23 = NSTemporaryDirectory();
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v122[0] = v24;
      v122[1] = @"com.apple.MediaServices";
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 UUIDString]);
      v122[2] = v26;
      v122[3] = @"subscribed-containers.daap";
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 4LL));
      uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v27));

      uint64_t v22 = v28;
    }

    v87 = (void *)v22;
    objc_msgSend(v90, "setResponseDataDestinationFileURL:");
    uint64_t v105 = 0LL;
    v106 = &v105;
    uint64_t v107 = 0x3032000000LL;
    v108 = sub_10002F64C;
    v109 = sub_10002F65C;
    id v110 = 0LL;
    dispatch_semaphore_t v29 = dispatch_semaphore_create(0LL);
    connection = v97->_connection;
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472LL;
    v102[2] = sub_10002F664;
    v102[3] = &unk_1001A6EA0;
    v104 = &v105;
    v31 = v29;
    v103 = v31;
    -[CloudLibraryConnection sendRequest:withResponseHandler:]( connection,  "sendRequest:withResponseHandler:",  v90,  v102);
    v85 = v31;
    dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
    id v32 = [(id)v106[5] responseCode];
    if (v32 == (id)200)
    {
      v121 = v87;
      id v96 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v121,  1LL));
      if (MSVDeviceOSIsInternalInstall())
      {
        v94 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
        uint64_t v33 = MSVMediaLoggingDirectory();
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v128[0] = v34;
        v128[1] = @"DaapDebugging";
        v128[2] = @"SubscribedPlaylists";
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v128, 3LL));
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v35));

        v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v127[0] = NSURLIsDirectoryKey;
        v127[1] = NSURLCreationDateKey;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v127, 2LL));
        v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v94,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v84,  v36,  4LL,  0LL));

        __int128 v118 = 0u;
        __int128 v119 = 0u;
        __int128 v116 = 0u;
        __int128 v117 = 0u;
        id obj = v37;
        v38 = 0LL;
        id v39 = [obj countByEnumeratingWithState:&v116 objects:buf count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v117;
          do
          {
            for (i = 0LL; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v117 != v40) {
                objc_enumerationMutation(obj);
              }
              v42 = *(void **)(*((void *)&v116 + 1) + 8LL * (void)i);
              id v115 = 0LL;
              unsigned int v43 = [v42 getResourceValue:&v115 forKey:NSURLIsDirectoryKey error:0];
              id v44 = v115;
              v45 = v44;
              if (v43 && [v44 BOOLValue])
              {
                v46 = (void *)objc_claimAutoreleasedReturnValue([v42 lastPathComponent]);
                v47 = (void *)objc_claimAutoreleasedReturnValue([v46 componentsSeparatedByString:@"_"]);
                v48 = (void *)objc_claimAutoreleasedReturnValue([v47 lastObject]);
                v49 = (char *)[v48 longLongValue];

                id v114 = 0LL;
                unsigned __int8 v50 = [v42 getResourceValue:&v114 forKey:NSURLCreationDateKey error:0];
                id v51 = v114;
                if ((v50 & 1) == 0)
                {
                  uint64_t v52 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));

                  id v51 = (id)v52;
                }

                [v98 setObject:v42 forKey:v51];
              }
            }

            id v39 = [obj countByEnumeratingWithState:&v116 objects:buf count:16];
          }

          while (v39);
        }

        if ((unint64_t)[v98 count] >= 4)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue([v98 allKeys]);
          v54 = (void *)objc_claimAutoreleasedReturnValue([v53 sortedArrayUsingComparator:&stru_1001A51E8]);

          if ([v54 count] != (id)3)
          {
            v55 = 0LL;
            do
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue([v54 objectAtIndex:v55]);
              v57 = (void *)objc_claimAutoreleasedReturnValue([v98 objectForKey:v56]);

              -[NSFileManager removeItemAtURL:error:](v94, "removeItemAtURL:error:", v57, 0LL);
              ++v55;
            }

            while (v55 < (char *)[v54 count] - 3);
          }
        }

        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SubscribedContainersResponse_%llu",  v38 + 1));
        v59 = (void *)objc_claimAutoreleasedReturnValue([v84 URLByAppendingPathComponent:v58 isDirectory:1]);

        -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v94,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v59,  1LL,  0LL,  0LL);
        if ([v96 count])
        {
          unint64_t v60 = 0LL;
          do
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue([v96 objectAtIndex:v60++]);
            v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"daap_data_%lu.daap",  v60));
            v63 = (void *)objc_claimAutoreleasedReturnValue([v59 URLByAppendingPathComponent:v62 isDirectory:0]);

            -[NSFileManager copyItemAtURL:toURL:error:](v94, "copyItemAtURL:toURL:error:", v61, v63, 0LL);
          }

          while (v60 < (unint64_t)[v96 count]);
        }
      }

      v64 = (void *)objc_claimAutoreleasedReturnValue([v87 path]);
      v120 = v64;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v120, 1LL));
      uint64_t v66 = ML3DatabaseImportDataForDAAPFilePaths();
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);

      id v68 = objc_alloc(&OBJC_CLASS___ML3MutableDatabaseImport);
      v69 = (void *)objc_claimAutoreleasedReturnValue([v93 databasePath]);
      id v70 = [v68 initWithLibraryPath:v69 trackData:v67 playlistData:v67 clientIdentity:v91];

      [v70 setTracksAreLibraryOwnedContent:0];
      [v70 setPlaylistsAreLibraryOwnedContent:1];
      dispatch_semaphore_t v71 = dispatch_semaphore_create(0LL);
      v72 = (void *)objc_claimAutoreleasedReturnValue( +[MLMediaLibraryService sharedMediaLibraryService]( &OBJC_CLASS___MLMediaLibraryService,  "sharedMediaLibraryService"));
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472LL;
      v100[2] = sub_10002F6B0;
      v100[3] = &unk_1001A2430;
      v73 = v71;
      v101 = v73;
      [v72 performImport:v70 fromSource:8 withProgressBlock:0 completionHandler:v100];

      dispatch_semaphore_wait(v73, 0xFFFFFFFFFFFFFFFFLL);
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithURL:](&OBJC_CLASS___NSInputStream, "inputStreamWithURL:", v87));
      id v75 = [[DKDAAPParser alloc] initWithStream:v74];
      v76 = objc_alloc_init(&OBJC_CLASS___SubscribedContainersUpdateRequiredParserDelegate);
      [v75 setDelegate:v76];
      [v75 parse];
      unsigned int v77 = -[SubscribedContainersUpdateRequiredParserDelegate updateRequired](v76, "updateRequired");

      if (v77)
      {
        v78 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Requesting library update because the response contained update-required flag",  buf,  2u);
        }

        v79 = (void *)objc_claimAutoreleasedReturnValue(-[SagaSubscribedPlaylistUpdater connection](v97, "connection"));
        v80 = (void *)objc_claimAutoreleasedReturnValue([v79 configuration]);
        v81 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v80));
        [v81 updateSagaLibraryWithClientIdentity:v91 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];
      }
    }

    else
    {
      v67 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        id v126 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_ERROR,  "Received non-200 HTTP code: %lu, skipping import.",  buf,  0xCu);
      }
    }

    _Block_object_dispose(&v105, 8);
    v82 = (os_log_s *)v90;
  }

  else
  {
    v82 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_INFO,  "No playlists to update (based on min refresh interval).",  buf,  2u);
    }
  }

  if (a4) {
    *a4 = 0LL;
  }

  return 1;
}

- (NSArray)playlistCloudIDs
{
  return self->_playlistCloudIDs;
}

- (CloudLibraryConnection)connection
{
  return self->_connection;
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
}

- (BOOL)ignoreMinRefreshInterval
{
  return self->_ignoreMinRefreshInterval;
}

- (void)setIgnoreMinRefreshInterval:(BOOL)a3
{
  self->_ignoreMinRefreshInterval = a3;
}

- (NSURL)payloadDownloadPathOverride
{
  return self->_payloadDownloadPathOverride;
}

- (void)setPayloadDownloadPathOverride:(id)a3
{
}

- (BOOL)pinnedOnly
{
  return self->_pinnedOnly;
}

- (void)setPinnedOnly:(BOOL)a3
{
  self->_pinnedOnly = a3;
}

- (void).cxx_destruct
{
}

@end