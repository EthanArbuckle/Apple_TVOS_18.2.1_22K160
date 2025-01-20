@interface DownloadArtistHeroImagesOperation
- (int64_t)currentDatabaseRevision;
- (void)main;
- (void)setCurrentDatabaseRevision:(int64_t)a3;
@end

@implementation DownloadArtistHeroImagesOperation

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100060DC8;
  v30[3] = &unk_1001A3928;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v31 = v4;
  [v3 databaseConnectionAllowingWrites:0 withBlock:v30];
  v5 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Found %lu artist artwork tokens to download",  (uint8_t *)&buf,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2050000000LL;
  v8 = (void *)qword_1001DB6D0;
  uint64_t v35 = qword_1001DB6D0;
  if (!qword_1001DB6D0)
  {
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    v37 = sub_100060ED4;
    v38 = &unk_1001A6978;
    v39 = &v32;
    sub_100060ED4((uint64_t)&buf);
    v8 = (void *)v33[3];
  }

  id v9 = v8;
  _Block_object_dispose(&v32, 8);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[QueueAwareOperation userIdentity](self, "userIdentity"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceMediaLibraryWithUserIdentity:v10]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v24 artworkDataSource]);
  [v11 setUsesFallbackCache:0];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  LOBYTE(v10) = [v12 isCellularDataRestrictedForMusic];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100061070;
  v25[3] = &unk_1001A3950;
  id v13 = v3;
  id v26 = v13;
  v27 = self;
  char v29 = v10 ^ 1;
  id v14 = v7;
  id v28 = v14;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];
  if (-[DownloadArtistHeroImagesOperation isCancelled](self, "isCancelled"))
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cancelled after starting downloads for artist hero images.",  (uint8_t *)&buf,  2u);
    }
  }

  else
  {
    if ([v14 count])
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
      [v16 importCloudArtworkForRequests:v14];
    }

    v17 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Enqueued all artist hero images to download.",  (uint8_t *)&buf,  2u);
    }

    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation operationQueue](self, "operationQueue"));
    if (v15)
    {
      v18 = objc_alloc(&OBJC_CLASS___FinishArtistHeroUpdateOperation);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation clientIdentity](self, "clientIdentity"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation albumArtistPersistentIDsToUpdate](self, "albumArtistPersistentIDsToUpdate"));
      v23 = -[QueueAwareOperation initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:]( v18,  "initWithArtworkImporter:clientIdentity:operationQueue:artistPersistentIDsToUpdate:albumArtistPersistentIDsToUpdate:",  v19,  v20,  v15,  v21,  v22);

      -[FinishArtistHeroUpdateOperation setCurrentDatabaseRevision:]( v23,  "setCurrentDatabaseRevision:",  -[DownloadArtistHeroImagesOperation currentDatabaseRevision](self, "currentDatabaseRevision"));
      -[os_log_s addOperation:](v15, "addOperation:", v23);
    }
  }
}

- (int64_t)currentDatabaseRevision
{
  return (int64_t)self->super._artistPersistentIDsToUpdate;
}

- (void)setCurrentDatabaseRevision:(int64_t)a3
{
  self->super._artistPersistentIDsToUpdate = (NSArray *)a3;
}

@end