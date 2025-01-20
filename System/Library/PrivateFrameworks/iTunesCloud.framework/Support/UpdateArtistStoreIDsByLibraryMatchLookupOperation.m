@interface UpdateArtistStoreIDsByLibraryMatchLookupOperation
- (NSURL)artistNameLibraryMatchURL;
- (void)main;
- (void)setArtistNameLibraryMatchURL:(id)a3;
@end

@implementation UpdateArtistStoreIDsByLibraryMatchLookupOperation

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[UpdateArtistStoreIDsByLibraryMatchLookupOperation artistNameLibraryMatchURL]( self,  "artistNameLibraryMatchURL"));

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

    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    v26 = sub_10005F7DC;
    v27 = &unk_1001A3888;
    v28 = self;
    v15 = v14;
    v29 = v15;
    -[os_log_s enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", &v24);
    if (-[UpdateArtistStoreIDsByLibraryMatchLookupOperation isCancelled]( self,  "isCancelled",  v24,  v25,  v26,  v27,  v28))
    {
      v16 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Cancelled after looking up artist store ids by name.",  buf,  2u);
      }
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation operationQueue](self, "operationQueue"));
      if (v17)
      {
        v18 = objc_alloc(&OBJC_CLASS___UpdateArtistArtworkTokensOperation);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation clientIdentity](self, "clientIdentity"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[QueueAwareOperation albumArtistPersistentIDsToUpdate]( self,  "albumArtistPersistentIDsToUpdate"));
        v23 = -[QueueAwareOperation initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:]( v18,  "initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:",  v19,  v20,  v17,  v21,  v22);

        [v17 addOperation:v23];
      }
    }
  }

  else
  {
    os_log_t v10 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to resolve an artist name lookup URL from the library match rules bag, skipping artist hero image upate.",  buf,  2u);
    }
  }
}

- (NSURL)artistNameLibraryMatchURL
{
  return (NSURL *)self->super._artistPersistentIDsToUpdate;
}

- (void)setArtistNameLibraryMatchURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end