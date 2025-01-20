@interface UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation
- (NSNumber)bulkArtistNameLibraryMatchBatchSize;
- (NSURL)bulkArtistNameLibraryMatchURL;
- (void)main;
- (void)setBulkArtistNameLibraryMatchBatchSize:(id)a3;
- (void)setBulkArtistNameLibraryMatchURL:(id)a3;
@end

@implementation UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation bulkArtistNameLibraryMatchURL]( self,  "bulkArtistNameLibraryMatchURL"));

  if (v3)
  {
    unsigned int v4 = -[QueueAwareOperation shouldProcessSpecificArtists](self, "shouldProcessSpecificArtists");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
    v6 = v5;
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation albumArtistPersistentIDsToUpdate](self, "albumArtistPersistentIDsToUpdate"));
      id v9 = sub_10005F33C(v6, v7, v8);
      os_log_t v10 = (os_log_t)objc_claimAutoreleasedReturnValue(v9);
    }

    else
    {
      id v11 = sub_10005F62C(v5);
      os_log_t v10 = (os_log_t)objc_claimAutoreleasedReturnValue(v11);
    }

    v12 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation userIdentity](self, "userIdentity"));
    v14 = -[ICStoreRequestContext initWithIdentity:](v12, "initWithIdentity:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
    id v16 = [v15 mutableCopy];

    [v16 removeCharactersInString:@"+?"];
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation bulkArtistNameLibraryMatchBatchSize]( self,  "bulkArtistNameLibraryMatchBatchSize"));
    id v18 = [v17 integerValue];

    v19 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v35 = -[os_log_s count](v10, "count");
      __int16 v36 = 2048;
      id v37 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Batching %lu library match requests in to chunks of size %ld.",  buf,  0x16u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allObjects](v10, "allObjects"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 subarraysOfSize:v18]);

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100064150;
    v31[3] = &unk_1001A3838;
    v31[4] = self;
    id v22 = v16;
    id v32 = v22;
    v23 = v14;
    v33 = v23;
    [v21 enumerateObjectsUsingBlock:v31];
    if (-[UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation isCancelled](self, "isCancelled"))
    {
      v24 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Cancelled after looking up artist store ids by name.",  buf,  2u);
      }
    }

    else
    {
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation operationQueue](self, "operationQueue"));
      if (v24)
      {
        v25 = objc_alloc(&OBJC_CLASS___UpdateArtistArtworkTokensOperation);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation clientIdentity](self, "clientIdentity"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
        v29 = (void *)objc_claimAutoreleasedReturnValue( -[QueueAwareOperation albumArtistPersistentIDsToUpdate]( self,  "albumArtistPersistentIDsToUpdate"));
        v30 = -[QueueAwareOperation initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:]( v25,  "initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:",  v26,  v27,  v24,  v28,  v29);

        -[os_log_s addOperation:](v24, "addOperation:", v30);
      }
    }
  }

  else
  {
    os_log_t v10 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to resolve bulk artist name lookup URL from the library match rules bag, skipping artist hero image upate.",  buf,  2u);
    }
  }
}

- (NSURL)bulkArtistNameLibraryMatchURL
{
  return (NSURL *)self->super._artistPersistentIDsToUpdate;
}

- (void)setBulkArtistNameLibraryMatchURL:(id)a3
{
}

- (NSNumber)bulkArtistNameLibraryMatchBatchSize
{
  return (NSNumber *)self->super._albumArtistPersistentIDsToUpdate;
}

- (void)setBulkArtistNameLibraryMatchBatchSize:(id)a3
{
}

- (void).cxx_destruct
{
}

@end