@interface DetermineArtistStoreIDLookupTypeOperation
- (void)main;
@end

@implementation DetermineArtistStoreIDLookupTypeOperation

- (void)main
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  uint64_t v62 = 0LL;
  v63 = &v62;
  uint64_t v64 = 0x3032000000LL;
  v65 = sub_10005D5D4;
  v66 = sub_10005D5E4;
  id v67 = 0LL;
  v3 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation userIdentity](self, "userIdentity"));
  v57 = -[ICStoreRequestContext initWithIdentity:](v3, "initWithIdentity:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_10005F00C;
  v59[3] = &unk_1001A37C0;
  v61 = &v62;
  dispatch_semaphore_t dsema = v2;
  dispatch_semaphore_t v60 = dsema;
  [v5 getBagForRequestContext:v57 withCompletionHandler:v59];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (-[DetermineArtistStoreIDLookupTypeOperation isCancelled](self, "isCancelled"))
  {
    v6 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Cancelled after loading URL bag";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_61;
    }

    goto LABEL_61;
  }

  v8 = (void *)v63[5];
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionaryForBagKey:ICURLBagKeyLibraryMatchRules]);
    v54 = v9;
    if (!((uint64_t (*)(void))_NSIsNSDictionary)())
    {
      id v16 = 0LL;
      v51 = 0LL;
      v52 = 0LL;
      v53 = 0LL;
      v55 = 0LL;
LABEL_47:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation operationQueue](self, "operationQueue"));
      if (v27)
      {
        if (v55)
        {
          v28 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v73 = (uint64_t)v53;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Updating artist store IDs using the bulk artist name lookup service (batch size = %@)",  buf,  0xCu);
          }

          v29 = objc_alloc(&OBJC_CLASS___UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation clientIdentity](self, "clientIdentity"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
          v33 = (void *)objc_claimAutoreleasedReturnValue( -[QueueAwareOperation albumArtistPersistentIDsToUpdate]( self,  "albumArtistPersistentIDsToUpdate"));
          v34 = -[QueueAwareOperation initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:]( v29,  "initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:",  v30,  v31,  v27,  v32,  v33);

          -[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation setBulkArtistNameLibraryMatchURL:]( v34,  "setBulkArtistNameLibraryMatchURL:",  v55);
          -[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation setBulkArtistNameLibraryMatchBatchSize:]( v34,  "setBulkArtistNameLibraryMatchBatchSize:",  v53);
          [v27 addOperation:v34];
        }

        else
        {
          v35 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
          BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
          if (v51)
          {
            if (v36)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Updating artist store IDs using the allArtistImagesMap",  buf,  2u);
            }

            v37 = objc_alloc(&OBJC_CLASS___UpdateArtistStoreIDsByMapOperation);
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation clientIdentity](self, "clientIdentity"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
            v41 = (void *)objc_claimAutoreleasedReturnValue( -[QueueAwareOperation albumArtistPersistentIDsToUpdate]( self,  "albumArtistPersistentIDsToUpdate"));
            v34 = -[QueueAwareOperation initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:]( v37,  "initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:",  v38,  v39,  v27,  v40,  v41);

            -[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation setUpdateIntervalSeconds:]( v34,  "setUpdateIntervalSeconds:",  v52);
            -[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation setAllArtistImagesMapURL:]( v34,  "setAllArtistImagesMapURL:",  v51);
            -[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation setArtistNameLibraryMatchURL:]( v34,  "setArtistNameLibraryMatchURL:",  v16);
            [v27 addOperation:v34];
          }

          else
          {
            if (v36)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Updating artist store IDs using the single artist name lookup service",  buf,  2u);
            }

            v42 = objc_alloc(&OBJC_CLASS___UpdateArtistStoreIDsByLibraryMatchLookupOperation);
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation clientIdentity](self, "clientIdentity"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
            v46 = (void *)objc_claimAutoreleasedReturnValue( -[QueueAwareOperation albumArtistPersistentIDsToUpdate]( self,  "albumArtistPersistentIDsToUpdate"));
            v34 = -[QueueAwareOperation initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:]( v42,  "initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:",  v43,  v44,  v27,  v45,  v46);

            -[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation setArtistNameLibraryMatchURL:]( v34,  "setArtistNameLibraryMatchURL:",  v16);
            [v27 addOperation:v34];
          }
        }
      }

      v6 = v55;
      goto LABEL_61;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"artist-image-match-bulk-url"]);
    v48 = v10;
    if (((uint64_t (*)(void))_NSIsNSDictionary)())
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"url"]);
      if (_NSIsNSString(v11) && [v11 length])
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
        v53 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"an-batch-size"]);
        v55 = (os_log_s *)v12;
        v13 = v9;
        if (!v53)
        {
          os_log_t v14 = sub_1000DD848();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v73 = 100LL;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "'an-batch-size' was not in the bag, defaulting to batches of %lld.",  buf,  0xCu);
          }

          v53 = &off_1001B3CE8;
        }
      }

      else
      {
        v13 = v9;
        v53 = 0LL;
        v55 = 0LL;
      }

      v9 = v13;
    }

    else
    {
      v53 = 0LL;
      v55 = 0LL;
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"all-artist-images-map-url"]);
    if ([v50 length])
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v50));
      v52 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"update-interval-seconds"]);
      if (!v52)
      {
        v17 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v73 = 604800LL;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "'update-interval-seconds' was not in the bag, defaulting to %lld seconds.",  buf,  0xCu);
        }

        v52 = &off_1001B3D00;
      }
    }

    else
    {
      v51 = 0LL;
      v52 = 0LL;
    }

    id v47 = v54;
    v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"artist"]);
    if (_NSIsNSArray(v49))
    {
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      id v18 = v49;
      id v19 = [v18 countByEnumeratingWithState:&v68 objects:buf count:16];
      if (v19)
      {
        v20 = 0LL;
        uint64_t v21 = *(void *)v69;
        do
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v69 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
            if (_NSIsNSDictionary(v23))
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"required-fields"]);
              if (_NSIsNSArray(v24) && [v24 containsObject:@"an"])
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"url"]);

                if ((_NSIsNSString(v25) & 1) != 0)
                {
                  v20 = v25;
                }

                else
                {

                  v20 = 0LL;
                }
              }
            }
          }

          id v19 = [v18 countByEnumeratingWithState:&v68 objects:buf count:16];
        }

        while (v19);

        if (v20)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
LABEL_46:
          id v16 = v26;

          goto LABEL_47;
        }

@end