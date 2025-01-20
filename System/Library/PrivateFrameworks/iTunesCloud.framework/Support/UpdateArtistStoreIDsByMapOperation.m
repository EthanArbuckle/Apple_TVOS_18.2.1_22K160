@interface UpdateArtistStoreIDsByMapOperation
- (NSNumber)updateIntervalSeconds;
- (NSURL)allArtistImagesMapURL;
- (NSURL)artistNameLibraryMatchURL;
- (id)_fetchAndCacheLatestAllArtistImagesMap;
- (id)_latestAllArtistImagesMap;
- (void)_updateAllArtistStoreIDsUsingAllArtistImagesMap:(id)a3;
- (void)_updateSpecificArtistStoreIDsUsingAllArtistImagesMap:(id)a3;
- (void)main;
- (void)setAllArtistImagesMapURL:(id)a3;
- (void)setArtistNameLibraryMatchURL:(id)a3;
- (void)setUpdateIntervalSeconds:(id)a3;
@end

@implementation UpdateArtistStoreIDsByMapOperation

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UpdateArtistStoreIDsByMapOperation _latestAllArtistImagesMap](self, "_latestAllArtistImagesMap"));
  if (-[UpdateArtistStoreIDsByMapOperation isCancelled](self, "isCancelled"))
  {
    v4 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      v5 = "Cancelled after getting latest all artist image map data.";
      v6 = (uint8_t *)&v21;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_14;
    }

    goto LABEL_14;
  }

  if (!v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation operationQueue](self, "operationQueue"));
    if (v7)
    {
      v8 = objc_alloc(&OBJC_CLASS___UpdateArtistStoreIDsByLibraryMatchLookupOperation);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation clientIdentity](self, "clientIdentity"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation albumArtistPersistentIDsToUpdate](self, "albumArtistPersistentIDsToUpdate"));
      v13 = -[QueueAwareOperation initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:]( v8,  "initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:",  v9,  v10,  v7,  v11,  v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UpdateArtistStoreIDsByMapOperation artistNameLibraryMatchURL](self, "artistNameLibraryMatchURL"));
      -[UpdateArtistStoreIDsByLibraryMatchLookupOperation setArtistNameLibraryMatchURL:]( v13,  "setArtistNameLibraryMatchURL:",  v14);

LABEL_17:
      [v7 addOperation:v13];
    }

- (id)_latestAllArtistImagesMap
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CloudArtistHeroImageImporter allArtistImagesMapCacheFilePathURL]( &OBJC_CLASS___CloudArtistHeroImageImporter,  "allArtistImagesMapCacheFilePathURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v3));
  v5 = v4;
  if (!v4)
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109120;
      LODWORD(v20) = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "allArtistImagesMap.plist (null) needsUpdate: %d",  (uint8_t *)&v19,  8u);
    }

    goto LABEL_11;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"AllArtistImagesMapNextUpdateDateKey"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 earlierDate:v6]);
    BOOL v10 = v8 != v9;
  }

  else
  {
    BOOL v10 = 1;
  }

  v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"AllArtistImagesMapDataDictionaryKey"]);
    int v19 = 134218240;
    id v20 = [v13 count];
    __int16 v21 = 1024;
    BOOL v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "allArtistImagesMap.plist (count = %lu) needsUpdate: %d",  (uint8_t *)&v19,  0x12u);
  }

  if (v10)
  {
LABEL_11:
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[UpdateArtistStoreIDsByMapOperation _fetchAndCacheLatestAllArtistImagesMap]( self,  "_fetchAndCacheLatestAllArtistImagesMap"));
    v15 = v14;
    if (v14)
    {
      id v16 = v14;

      v5 = v16;
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"AllArtistImagesMapDataDictionaryKey"]);

  return v17;
}

- (id)_fetchAndCacheLatestAllArtistImagesMap
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Attempting to fetch latest all-artist-images-map",  (uint8_t *)&buf,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UpdateArtistStoreIDsByMapOperation allArtistImagesMapURL](self, "allArtistImagesMapURL"));
  v5 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpdateArtistStoreIDsByMapOperation allArtistImagesMapURL](self, "allArtistImagesMapURL"));
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "all-artist-images-map-url: %{public}@",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v37 = 0x3032000000LL;
    v38 = sub_10005D5D4;
    v39 = sub_10005D5E4;
    id v40 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UpdateArtistStoreIDsByMapOperation allArtistImagesMapURL](self, "allArtistImagesMapURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v8));

    [v9 setTimeoutInterval:180.0];
    BOOL v10 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation userIdentity](self, "userIdentity"));
    v12 = -[ICStoreRequestContext initWithIdentity:](v10, "initWithIdentity:", v11);

    v13 = -[ICStoreURLRequest initWithURLRequest:requestContext:]( objc_alloc(&OBJC_CLASS___ICStoreURLRequest),  "initWithURLRequest:requestContext:",  v9,  v12);
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager defaultSession](&OBJC_CLASS___ICURLSessionManager, "defaultSession"));
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    v28 = sub_100063B2C;
    v29 = &unk_1001A3860;
    p___int128 buf = &buf;
    id v16 = v14;
    v30 = v16;
    [v15 enqueueDataRequest:v13 withCompletionHandler:&v26];

    dispatch_time_t v17 = dispatch_time(0LL, 300000000000LL);
    if (dispatch_semaphore_wait(v16, v17))
    {
      v18 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v34 = 67109120;
        int v35 = 300;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Failed to receive response for all-artist-images-map after %d seconds, cancelling request",  v34,  8u);
      }

      int v19 = (void *)objc_claimAutoreleasedReturnValue( +[ICURLSessionManager defaultSession]( &OBJC_CLASS___ICURLSessionManager,  "defaultSession",  v26,  v27,  v28,  v29));
      [v19 cancelRequest:v13];
    }

    if (*(void *)(*((void *)&buf + 1) + 40LL))
    {
      v32[0] = @"AllArtistImagesMapNextUpdateDateKey";
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[UpdateArtistStoreIDsByMapOperation updateIntervalSeconds](self, "updateIntervalSeconds"));
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v20,  "dateByAddingTimeInterval:",  (double)(unint64_t)objc_msgSend(v21, "unsignedIntegerValue")));
      v32[1] = @"AllArtistImagesMapDataDictionaryKey";
      v33[0] = v22;
      v33[1] = *(void *)(*((void *)&buf + 1) + 40LL);
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));

      v24 = (void *)objc_claimAutoreleasedReturnValue( +[CloudArtistHeroImageImporter allArtistImagesMapCacheFilePathURL]( &OBJC_CLASS___CloudArtistHeroImageImporter,  "allArtistImagesMapCacheFilePathURL"));
      [v23 writeToURL:v24 atomically:1];
    }

    else
    {
      v23 = 0LL;
    }

    _Block_object_dispose(&buf, 8);
    return v23;
  }

  else
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Failed to get 'all-artist-images-map-url'. Cannot fetch map at this time.",  (uint8_t *)&buf,  2u);
    }

    return 0LL;
  }

- (void)_updateSpecificArtistStoreIDsUsingAllArtistImagesMap:(id)a3
{
  id v42 = a3;
  v43 = self;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
  id v5 = [v4 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v49;
    uint64_t v8 = ML3ArtistPropertyStoreID;
    id obj = (id)ML3ArtistPropertyName;
    do
    {
      v9 = 0LL;
      id v38 = v6;
      do
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * (void)v9), "longLongValue", v38);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](v43, "musicLibrary"));
        id v12 = +[ML3Artist newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Artist,  "newWithPersistentID:inLibrary:",  v10,  v11);

        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:v8]);
        id v14 = [v13 longLongValue];

        if (!v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:obj]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:v15]);
          if (v16)
          {
            uint64_t v17 = v7;
            v18 = v4;
            int v19 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](v43, "musicLibrary"));
            sub_100063960(v19, (uint64_t)v10, v15, [v16 longLongValue]);

            v4 = v18;
            uint64_t v7 = v17;
            id v6 = v38;
          }
        }

        v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }

    while (v6);
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation albumArtistPersistentIDsToUpdate](v43, "albumArtistPersistentIDsToUpdate"));
  id v20 = [obja countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v45;
    uint64_t v23 = ML3AlbumArtistPropertyStoreID;
    uint64_t v39 = ML3AlbumArtistPropertyName;
    v24 = &AMSFamilyContentDeletionNotification_ptr;
    do
    {
      v25 = 0LL;
      do
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(obja);
        }
        id v26 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * (void)v25), "longLongValue", v39);
        uint64_t v27 = v24[486];
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](v43, "musicLibrary"));
        id v29 = [v27 newWithPersistentID:v26 inLibrary:v28];

        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 valueForProperty:v23]);
        id v31 = [v30 longLongValue];

        if (!v31)
        {
          uint64_t v32 = v23;
          uint64_t v33 = v22;
          v34 = v24;
          int v35 = (void *)objc_claimAutoreleasedReturnValue([v29 valueForProperty:v39]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:v35]);
          if (v36)
          {
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](v43, "musicLibrary"));
            sub_100063794(v37, (uint64_t)v26, v35, [v36 longLongValue]);
          }

          v24 = v34;
          uint64_t v22 = v33;
          uint64_t v23 = v32;
        }

        v25 = (char *)v25 + 1;
      }

      while (v21 != v25);
      id v21 = [obja countByEnumeratingWithState:&v44 objects:v52 count:16];
    }

    while (v21);
  }
}

- (void)_updateAllArtistStoreIDsUsingAllArtistImagesMap:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
  id v6 = sub_100062468(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
  id v9 = sub_100062538(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  uint64_t v23 = ML3ArtistPropertyName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10006356C;
  v19[3] = &unk_1001A5C18;
  id v12 = v4;
  id v20 = v12;
  id v21 = self;
  [v7 enumeratePersistentIDsAndProperties:v11 usingBlock:v19];

  if (-[UpdateArtistStoreIDsByMapOperation isCancelled](self, "isCancelled"))
  {
    v13 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Cancelled after updating artist store ids.",  buf,  2u);
    }
  }

  else
  {
    uint64_t v22 = ML3AlbumArtistPropertyName;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100063680;
    v15[3] = &unk_1001A5C18;
    id v16 = (os_log_s *)v12;
    uint64_t v17 = self;
    [v10 enumeratePersistentIDsAndProperties:v14 usingBlock:v15];

    v13 = v16;
  }
}

- (NSNumber)updateIntervalSeconds
{
  return (NSNumber *)self->super._artistPersistentIDsToUpdate;
}

- (void)setUpdateIntervalSeconds:(id)a3
{
}

- (NSURL)allArtistImagesMapURL
{
  return (NSURL *)self->super._albumArtistPersistentIDsToUpdate;
}

- (void)setAllArtistImagesMapURL:(id)a3
{
}

- (NSURL)artistNameLibraryMatchURL
{
  return (NSURL *)self->_updateIntervalSeconds;
}

- (void)setArtistNameLibraryMatchURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end