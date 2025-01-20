@interface UpdateArtistArtworkTokensOperation
- (id)_imageURLFromArtworkInfo:(id)a3;
- (void)_addAllStoreArtistIDsToSet:(id)a3;
- (void)_addSpecificStoreArtistIDsToSet:(id)a3;
- (void)main;
@end

@implementation UpdateArtistArtworkTokensOperation

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
  id v4 = [v3 currentRevision];

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (-[QueueAwareOperation shouldProcessSpecificArtists](self, "shouldProcessSpecificArtists")) {
    -[UpdateArtistArtworkTokensOperation _addSpecificStoreArtistIDsToSet:](self, "_addSpecificStoreArtistIDsToSet:", v5);
  }
  else {
    -[UpdateArtistArtworkTokensOperation _addAllStoreArtistIDsToSet:](self, "_addAllStoreArtistIDsToSet:", v5);
  }
  if (-[UpdateArtistArtworkTokensOperation isCancelled](self, "isCancelled"))
  {
    v6 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cancelled after gathering artist artwork tokens.",  buf,  2u);
    }
  }

  else
  {
    v7 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableSet count](v5, "count"));
    v8 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v30 = -[NSMutableSet count](v5, "count");
      __int16 v31 = 1024;
      int v32 = 100;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Batching %lu lookup requests in to chunks of size %d.",  buf,  0x12u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v5, "allObjects"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subarraysOfSize:100]);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100060494;
    v27[3] = &unk_1001A38D8;
    v27[4] = self;
    v6 = v7;
    v28 = v6;
    [v10 enumerateObjectsUsingBlock:v27];
    if (-[UpdateArtistArtworkTokensOperation isCancelled](self, "isCancelled"))
    {
      v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Cancelled after looking up artist hero image URLs.",  buf,  2u);
      }
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000608C4;
      v23[3] = &unk_1001A69E0;
      v24 = v5;
      v25 = self;
      v26 = v6;
      [v12 performDatabaseTransactionWithBlock:v23];

      if (-[UpdateArtistArtworkTokensOperation isCancelled](self, "isCancelled"))
      {
        v13 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Cancelled after updating artist artwork tokens.",  buf,  2u);
        }
      }

      else
      {
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation operationQueue](self, "operationQueue"));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
          unsigned int v15 = [v14 isWatch];

          if (v15) {
            v16 = &OBJC_CLASS___FinishArtistHeroUpdateOperation;
          }
          else {
            v16 = &OBJC_CLASS___DownloadArtistHeroImagesOperation;
          }
          id v22 = objc_alloc(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artworkImporter](self, "artworkImporter"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation clientIdentity](self, "clientIdentity"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
          v20 = (void *)objc_claimAutoreleasedReturnValue( -[QueueAwareOperation albumArtistPersistentIDsToUpdate]( self,  "albumArtistPersistentIDsToUpdate"));
          id v21 = [v22 initWithArtworkImporter:v17 clientIdentity:v18 operationQueue:v13 artistPersistentIDsToUpdate:v19 albumArtistPersistentIDsToUpdate:v20];

          [v21 setCurrentDatabaseRevision:v4];
          -[os_log_s addOperation:](v13, "addOperation:", v21);
        }
      }

      v11 = (os_log_s *)v24;
    }
  }
}

- (void)_addSpecificStoreArtistIDsToSet:(id)a3
{
  id v4 = a3;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation artistPersistentIDsToUpdate](self, "artistPersistentIDsToUpdate"));
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    uint64_t v8 = ML3ArtistPropertyStoreID;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v9) longLongValue];
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
        id v12 = +[ML3Artist newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Artist,  "newWithPersistentID:inLibrary:",  v10,  v11);

        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:v8]);
        if ([v13 longLongValue]) {
          [v4 addObject:v13];
        }

        v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v6);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation albumArtistPersistentIDsToUpdate](self, "albumArtistPersistentIDsToUpdate"));
  id v14 = [obja countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    uint64_t v17 = ML3AlbumArtistPropertyStoreID;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obja);
        }
        id v19 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v18) longLongValue];
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
        id v21 = +[ML3AlbumArtist newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3AlbumArtist,  "newWithPersistentID:inLibrary:",  v19,  v20);

        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 valueForProperty:v17]);
        if ([v22 longLongValue]) {
          [v4 addObject:v22];
        }

        v18 = (char *)v18 + 1;
      }

      while (v15 != v18);
      id v15 = [obja countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v15);
  }
}

- (void)_addAllStoreArtistIDsToSet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000602F8;
  v7[3] = &unk_1001A3928;
  id v8 = v4;
  id v6 = v4;
  [v5 databaseConnectionAllowingWrites:0 withBlock:v7];
}

- (id)_imageURLFromArtworkInfo:(id)a3
{
  id v3 = a3;
  id v4 = [[ICStoreArtworkInfo alloc] initWithArtworkResponseDictionary:v3];

  double BoundingBoxSize = MSVGetMaximumScreenSize();
  double v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 sizeInfo]);
  [v8 maxSupportedSize];
  double v10 = v9;
  double v12 = v11;

  if (v10 != CGSizeZero.width || v12 != CGSizeZero.height)
  {
    double BoundingBoxSize = MSVImageUtilitiesMakeBoundingBoxSize(v10, v12, BoundingBoxSize, v7);
    double v7 = v14;
  }

  id v15 = objc_msgSend( v4,  "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:",  ICStoreArtworkInfoCropStyleSpecificRectangle,  ICStoreArtworkInfoImageFormatJPEG,  MSVDeviceSupportsExtendedColorDisplay(),  BoundingBoxSize,  v7);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

@end