@interface ICCloudContentTasteUpdateOperation
- (ICCloudContentTasteUpdateItem)requestItem;
- (ICCloudContentTasteUpdateOperation)init;
- (ICCloudContentTasteUpdateOperation)initWithContentTasteUpdateItem:(id)a3 invalidateLocalCache:(BOOL)a4 configuration:(id)a5 operationIdentifier:(id)a6;
- (ICCloudContentTasteUpdateResponse)contentTasteUpdateResponse;
- (NSError)error;
- (NSString)operationIdentifier;
- (id)_contentTasteUpdateResponseWithServerResponse:(id)a3 expirationDate:(id)a4 revisionID:(unint64_t)a5 isCachedResponse:(BOOL)a6;
- (id)_prepareCachedResponseFromResponse:(id)a3 byAddingResponseTimeIntervalKey:(BOOL)a4 withResponseTimeInterval:(id)a5;
- (void)_getPBData:(id *)a3 includedContentTasteItemUpdates:(id *)a4 fromContentTasteUpdateItems:(id)a5;
- (void)_getStoreAdamIDLikedState:(id *)a3 playlistGlobalIDLikedState:(id *)a4 artistStoreAdamIDLikedState:(id *)a5;
- (void)_prepareContentTasteResponse:(id *)a3 withContentTasteItems:(id *)a4 fromCachedContentTasteResponseItems:(id)a5 includedContentTasteItems:(id)a6;
- (void)_setCachedContentTasteResponse:(id)a3;
- (void)_updateContentTasteForAlbumArtistItems:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6;
- (void)_updateContentTasteForGlobalPlaylists:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6;
- (void)_updateContentTasteForMediaItems:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6;
- (void)main;
- (void)setError:(id)a3;
@end

@implementation ICCloudContentTasteUpdateOperation

- (ICCloudContentTasteUpdateOperation)init
{
  return 0LL;
}

- (ICCloudContentTasteUpdateOperation)initWithContentTasteUpdateItem:(id)a3 invalidateLocalCache:(BOOL)a4 configuration:(id)a5 operationIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ICCloudContentTasteUpdateOperation;
  v14 = -[ICCloudContentTasteUpdateOperation init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->super._private, a3);
    LOBYTE(v15->_contentTasteItem) = a4;
    objc_storeStrong((id *)&v15->super._private1, a5);
    objc_storeStrong((id *)&v15->_configuration, a6);
    v16 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationIdentifier = v15->_operationIdentifier;
    v15->_operationIdentifier = (NSString *)&v16->super.isa;

    -[NSString setName:]( v15->_operationIdentifier,  "setName:",  @"com.apple.iTunesCloud.ICUpdateContentTasteOperation.operationQueue");
    -[NSString setMaxConcurrentOperationCount:](v15->_operationIdentifier, "setMaxConcurrentOperationCount:", 3LL);
  }

  return v15;
}

- (NSString)operationIdentifier
{
  return (NSString *)self->_configuration;
}

- (ICCloudContentTasteUpdateItem)requestItem
{
  return (ICCloudContentTasteUpdateItem *)self->super._private;
}

- (NSError)error
{
  return (NSError *)*(id *)&self->_invalidateLocalCache;
}

- (void)main
{
  if (-[ICCloudContentTasteUpdateOperation isCancelled](self, "isCancelled"))
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7004LL,  0LL));
    v4 = *(void **)&self->_invalidateLocalCache;
    *(void *)&self->_invalidateLocalCache = v3;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._private1 userIdentity]);
    v6 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100104AD0;
    v23[3] = &unk_1001A6640;
    id v7 = v5;
    id v24 = v7;
    v8 = -[ICStoreRequestContext initWithBlock:](v6, "initWithBlock:", v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:]( &OBJC_CLASS___ICPrivacyInfo,  "sharedPrivacyInfoForUserIdentity:",  v7));
    unsigned int v10 = [v9 privacyAcknowledgementRequiredForMusic];

    if (v10)
    {
      id v11 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Skipping content tast update because privacy acknowledgement is required",  buf,  0xCu);
      }

      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7007LL,  0LL));
      id v13 = *(dispatch_semaphore_s **)&self->_invalidateLocalCache;
      *(void *)&self->_invalidateLocalCache = v12;
    }

    else
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      uint64_t v15 = v14;
      dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
      v17 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting content taste update for media entities",  buf,  0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100104B30;
      v19[3] = &unk_1001A67A8;
      v19[4] = self;
      uint64_t v22 = v15;
      v20 = v8;
      dispatch_semaphore_t v21 = v16;
      id v13 = v16;
      [v18 getBagForRequestContext:v20 withCompletionHandler:v19];

      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    }
  }

- (void)_getPBData:(id *)a3 includedContentTasteItemUpdates:(id *)a4 fromContentTasteUpdateItems:(id)a5
{
  v31 = a3;
  id v6 = a5;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    if (a4) {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
    }
    else {
      v8 = 0LL;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  objc_msgSend(v7, "count", v31)));
  }

  else
  {
    v9 = 0LL;
    v8 = 0LL;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v13);
        uint64_t v15 = objc_alloc_init(&OBJC_CLASS___ICCloudContentTastePBFuseItemPreference);
        id v16 = [v14 storeID];
        if (v15)
        {
          *(_BYTE *)&v15->_has |= 2u;
          v15->_adamId = (int64_t)v16;
          v17 = (void *)objc_claimAutoreleasedReturnValue([v14 globalPlaylistID]);
          objc_storeStrong((id *)&v15->_externalId, v17);

          id v18 = [v14 contentTasteType];
          int v19 = v18 == (id)1;
          if (v18 == (id)2) {
            int v19 = 2;
          }
          v15->_preference = v19;
          *(_BYTE *)&v15->_has |= 8u;
          v15->_preferenceType = 0;
        }

        else
        {

          [v14 contentTasteType];
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "updateActionTimeStamp", v31));
        [v20 timeIntervalSinceNow];
        double v22 = v21;

        if (v15)
        {
          *(_BYTE *)&v15->_has |= 4u;
          v15->_createdOffsetMillis = 1000 * (uint64_t)fmax(-v22, 0.0);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue([v14 updateActionTimeStamp]);
        [v23 timeIntervalSince1970];
        double v25 = v24;

        if (v15)
        {
          *(_BYTE *)&v15->_has |= 1u;
          v15->_int64_t actionTimestampMillis = (uint64_t)(v25 * 1000.0);
        }

        v26 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          if (v15) {
            int64_t actionTimestampMillis = v15->_actionTimestampMillis;
          }
          else {
            int64_t actionTimestampMillis = 0LL;
          }
          *(_DWORD *)buf = 138543874;
          v39 = self;
          __int16 v40 = 2114;
          v41 = v14;
          __int16 v42 = 2048;
          int64_t v43 = actionTimestampMillis;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Adding content taste item=%{public}@. actionTimestampMillis=%lld",  buf,  0x20u);
        }

        [v9 addObject:v15];
        [v8 addObject:v14];

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v28 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      id v11 = v28;
    }

    while (v28);
  }

  if (v31)
  {
    if (![v9 count])
    {
      id *v31 = 0LL;
      if (!a4) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }

    v29 = objc_alloc_init(&OBJC_CLASS___ICCloudContentTastePBFusePreferences);
    v30 = v29;
    if (v29) {
      objc_storeStrong((id *)&v29->_preferences, v9);
    }
    id *v31 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudContentTastePBFusePreferences data](v30, "data", v31));
  }

  if (a4) {
LABEL_36:
  }
    *a4 = v8;
LABEL_37:
}

- (id)_contentTasteUpdateResponseWithServerResponse:(id)a3 expirationDate:(id)a4 revisionID:(unint64_t)a5 isCachedResponse:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = -[ICCloudContentTastePBFusePreferences initWithData:]( objc_alloc(&OBJC_CLASS___ICCloudContentTastePBFusePreferences),  "initWithData:",  v10);
  __int16 v40 = v11;
  unint64_t v39 = a5;
  __int128 v37 = self;
  v38 = v12;
  if (!v12)
  {
    uint64_t v14 = 0LL;
LABEL_6:
    uint64_t v15 = 0LL;
    goto LABEL_7;
  }

  id v13 = v12->_preferences;
  uint64_t v14 = v13;
  if (!v13 || !-[NSMutableArray count](v13, "count")) {
    goto LABEL_6;
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableArray count](v14, "count")));
LABEL_7:
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v14;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v56,  16LL);
  if (!v16) {
    goto LABEL_46;
  }
  id v17 = v16;
  uint64_t v18 = *(void *)v43;
  do
  {
    int v19 = 0LL;
    do
    {
      if (*(void *)v43 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)v19);
      double v21 = objc_alloc_init(&OBJC_CLASS___ICCloudContentTasteUpdateItem);
      double v22 = v21;
      if (v20)
      {
        -[ICCloudContentTasteUpdateItem setStoreID:](v21, "setStoreID:", *(void *)(v20 + 16));
        int v23 = *(_DWORD *)(v20 + 40);
        if (v23 == 2) {
          uint64_t v24 = 2LL;
        }
        else {
          uint64_t v24 = v23 == 1;
        }
        -[ICCloudContentTasteUpdateItem setContentTasteType:](v22, "setContentTasteType:", v24);
        if ((*(_BYTE *)(v20 + 48) & 8) != 0)
        {
          int v26 = *(_DWORD *)(v20 + 44);
          uint64_t v27 = 4LL;
          if (v26 != 46) {
            uint64_t v27 = 0LL;
          }
          if (v26 == 20) {
            uint64_t v27 = 8LL;
          }
          if (v26 == 5) {
            uint64_t v27 = 2LL;
          }
          uint64_t v28 = 3LL;
          if (v26 != 2) {
            uint64_t v28 = 0LL;
          }
          if (v26 == 1) {
            uint64_t v28 = 1LL;
          }
          if (v26 <= 4) {
            uint64_t v25 = v28;
          }
          else {
            uint64_t v25 = v27;
          }
        }

        else
        {
          uint64_t v25 = 0LL;
        }

        -[ICCloudContentTasteUpdateItem setContentTasteItem:](v22, "setContentTasteItem:", v25);
        uint64_t v29 = *(void *)(v20 + 8);
      }

      else
      {
        -[ICCloudContentTasteUpdateItem setStoreID:](v21, "setStoreID:", 0LL);
        -[ICCloudContentTasteUpdateItem setContentTasteType:](v22, "setContentTasteType:", 0LL);
        -[ICCloudContentTasteUpdateItem setContentTasteItem:](v22, "setContentTasteItem:", 0LL);
        uint64_t v29 = 0LL;
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)((double)v29 / 1000.0)));
      -[ICCloudContentTasteUpdateItem setUpdateActionTimeStamp:](v22, "setUpdateActionTimeStamp:", v30);

      if ((id)-[ICCloudContentTasteUpdateItem contentTasteItem](v22, "contentTasteItem") == (id)4)
      {
        if (v20) {
          v31 = *(void **)(v20 + 32);
        }
        else {
          v31 = 0LL;
        }
LABEL_35:
        id v32 = v31;
        -[ICCloudContentTasteUpdateItem setGlobalPlaylistID:](v22, "setGlobalPlaylistID:", v32);

        goto LABEL_37;
      }

      if (!-[ICCloudContentTasteUpdateItem contentTasteItem](v22, "contentTasteItem")
        && !-[ICCloudContentTasteUpdateItem storeID](v22, "storeID"))
      {
        if (v20)
        {
          v31 = *(void **)(v20 + 32);
          if (v31) {
            goto LABEL_35;
          }
        }
      }

- (void)_getStoreAdamIDLikedState:(id *)a3 playlistGlobalIDLikedState:(id *)a4 artistStoreAdamIDLikedState:(id *)a5
{
  id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v27 = self;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError contentTasteItems](self->_error, "contentTasteItems"));
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        id v12 = [v11 storeID];
        id v13 = [v11 contentTasteType];
        id v14 = v13;
        uint64_t v15 = 1LL;
        if (v13 == (id)1) {
          uint64_t v15 = 2LL;
        }
        if (v13 == (id)2) {
          uint64_t v16 = 3LL;
        }
        else {
          uint64_t v16 = v15;
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 updateActionTimeStamp]);
        if (!v12)
        {
          os_log_t v18 = (os_log_t)objc_claimAutoreleasedReturnValue([v11 globalPlaylistID]);
          if (!-[os_log_s length](v18, "length")) {
            goto LABEL_22;
          }
          int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
          v35[0] = v19;
          v35[1] = v17;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
          double v21 = v29;
          double v22 = v20;
          os_log_t v23 = v18;
          goto LABEL_21;
        }

        if ([v11 contentTasteItem] != (id)8)
        {
          os_log_t v18 = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
          v36[0] = v18;
          v36[1] = v17;
          int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
          double v21 = v30;
LABEL_20:
          double v22 = v19;
          os_log_t v23 = (os_log_t)v20;
LABEL_21:
          [v21 setObject:v22 forKey:v23];

          goto LABEL_22;
        }

        if (v14 != (id)1)
        {
          os_log_t v18 = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
          v37[0] = v18;
          v37[1] = v17;
          int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
          double v21 = v28;
          goto LABEL_20;
        }

        os_log_t v18 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          unint64_t v39 = v27;
          __int16 v40 = 2114;
          v41 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Skip setting tasteType for content taste item=%{public}@",  buf,  0x16u);
        }

- (void)_setCachedContentTasteResponse:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudContentTasteResponseCacheManager sharedCloudContentTasteResponseCacheManager]( &OBJC_CLASS___ICCloudContentTasteResponseCacheManager,  "sharedCloudContentTasteResponseCacheManager"));
  [v5 setCachedContentTasteUpdateResponse:v4 forConnectionConfiguration:*(void *)&self->super._private1];
}

- (id)_prepareCachedResponseFromResponse:(id)a3 byAddingResponseTimeIntervalKey:(BOOL)a4 withResponseTimeInterval:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  id v10 = (NSMutableDictionary *)[v9 mutableCopy];

  if (v5)
  {
    if (v7)
    {
      if (!v10) {
        id v10 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
      }
      -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  v7,  @"_MediaContentTasteUpdateResponseTimeIntervalSinceReferenceDate");
    }
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:]( v10,  "removeObjectForKey:",  @"_MediaContentTasteUpdateResponseTimeIntervalSinceReferenceDate");
    if (!-[NSMutableDictionary count](v10, "count"))
    {

      id v10 = 0LL;
    }
  }

  id v11 = objc_alloc(&OBJC_CLASS___NSCachedURLResponse);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 response]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
  id v14 = [v8 storagePolicy];

  uint64_t v15 = -[NSCachedURLResponse initWithResponse:data:userInfo:storagePolicy:]( v11,  "initWithResponse:data:userInfo:storagePolicy:",  v12,  v13,  v10,  v14);
  return v15;
}

- (void)_prepareContentTasteResponse:(id *)a3 withContentTasteItems:(id *)a4 fromCachedContentTasteResponseItems:(id)a5 includedContentTasteItems:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100104A04;
  v41[3] = &unk_1001A67D0;
  id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v42 = v28;
  id v12 = v11;
  __int128 v43 = v12;
  id v13 = objc_retainBlock(v41);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
        if (((unsigned int (*)(void *, uint64_t))v13[2])(v13, v19))
        {
          -[NSMutableArray addObject:](v9, "addObject:", v19);
          -[NSMutableArray addObject:](v10, "addObject:", v19);
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }

    while (v16);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v20 = v7;
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)j);
        if (((unsigned int (*)(void *, uint64_t))v13[2])(v13, v25))
        {
          -[NSMutableArray addObject:](v9, "addObject:", v25);
          -[NSMutableArray addObject:](v10, "addObject:", v25);
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v33 objects:v44 count:16];
    }

    while (v22);
  }

  id v32 = 0LL;
  -[ICCloudContentTasteUpdateOperation _getPBData:includedContentTasteItemUpdates:fromContentTasteUpdateItems:]( self,  "_getPBData:includedContentTasteItemUpdates:fromContentTasteUpdateItems:",  &v32,  0LL,  v10);
  id v26 = v32;
  uint64_t v27 = v26;
  if (a3) {
    *a3 = v26;
  }
  if (a4) {
    *a4 = v10;
  }
}

- (void)_updateContentTasteForAlbumArtistItems:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6
{
  id v9 = a3;
  id v52 = a4;
  id v48 = a5;
  id v51 = a6;
  uint64_t v10 = (uint64_t)[v9 count];
  id v11 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating content taste for %lu album artists",  (uint8_t *)&buf,  0xCu);
  }

  if (v10)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v13 = v12;
    BOOL v55 = (void *)objc_claimAutoreleasedReturnValue([v52 checkoutReaderConnection]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
    id v15 = [v14 mutableCopy];

    __int16 v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v80 = 0x3032000000LL;
    v81 = sub_100102E4C;
    v82 = sub_100102E5C;
    id v83 = 0LL;
    v49 = (void *)objc_claimAutoreleasedReturnValue([v52 valueForDatabaseProperty:@"ArtistsMatchingDifferentStoreAdamIds"]);
    if ([v49 length])
    {
      id v16 = objc_alloc(&OBJC_CLASS___NSSet);
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v17);
      id v20 = -[NSSet initWithObjects:](v16, "initWithObjects:", v18, objc_opt_class(&OBJC_CLASS___NSNumber, v19), 0LL);
      uint64_t v21 = MSVUnarchivedObjectOfClasses(v20, v49);
      __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(v21);

      if (_NSIsNSArray(v50))
      {
        [v15 removeObjectsInArray:v50];
        uint64_t v10 = (uint64_t)[v15 count];
        id v22 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v50 count];
          *(_DWORD *)v84 = 134218498;
          *(void *)&v84[4] = v23;
          *(_WORD *)&v84[12] = 2112;
          *(void *)&v84[14] = v50;
          *(_WORD *)&v84[22] = 1024;
          LODWORD(v85) = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Removing [Count:(%lu), artists:(%@)] mapped to different store_ids, pendingItemsCount=%d",  v84,  0x1Cu);
        }

LABEL_13:
        if (v10 >= 1)
        {
          do
          {
            else {
              uint64_t v24 = v10;
            }
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[ML3DatabaseStatementRenderer defaultRenderer]( &OBJC_CLASS___ML3DatabaseStatementRenderer,  "defaultRenderer"));
            id v26 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v25,  "statementWithPrefix:inParameterCount:",  @"SELECT album_artist_pid, liked_state, cloud_universal_library_id, store_id FROM album_artist WHERE store_id ",  v24));
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subarrayWithRange:", (char *)objc_msgSend(v15, "count") - v10, v24));
            id v28 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v84 = 134218240;
              *(void *)&v84[4] = v10;
              *(_WORD *)&v84[12] = 2048;
              *(void *)&v84[14] = v24;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "processing album artists with pendingItemCount: %lu, currentBatchCount: %lu",  v84,  0x16u);
            }

            id v29 = (void *)objc_claimAutoreleasedReturnValue([v55 executeQuery:v26 withParameters:v27]);
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472LL;
            v70[2] = sub_100103E28;
            v70[3] = &unk_1001A6838;
            id v71 = v15;
            id v72 = v9;
            id v73 = v54;
            id v74 = v53;
            [v29 enumerateRowsWithBlock:v70];

            BOOL v30 = v10 <= v24;
            v10 -= v24;
          }

          while (!v30);
        }

        [v52 checkInDatabaseConnection:v55];
        if (-[ICCloudContentTasteUpdateOperation isCancelled](self, "isCancelled"))
        {
          __int128 v31 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v84 = 138543362;
            *(void *)&v84[4] = self;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ is cancelled", v84, 0xCu);
          }

          if (!v51) {
            goto LABEL_37;
          }
          id v32 = 0LL;
          __int128 v33 = 0LL;
          uint64_t v34 = 0LL;
        }

        else
        {
          if ([v15 count])
          {
            __int128 v35 = objc_autoreleasePoolPush();
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472LL;
            v68[2] = sub_1001040E0;
            v68[3] = &unk_1001A6860;
            id v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            id v69 = v36;
            [v15 enumerateObjectsUsingBlock:v68];
            uint64_t v75 = 0LL;
            v76 = &v75;
            uint64_t v77 = 0x2050000000LL;
            __int128 v37 = (void *)qword_1001DB888;
            uint64_t v78 = qword_1001DB888;
            if (!qword_1001DB888)
            {
              *(void *)v84 = _NSConcreteStackBlock;
              *(void *)&v84[8] = 3221225472LL;
              *(void *)&v84[16] = sub_1001041E0;
              v85 = &unk_1001A6978;
              v86 = &v75;
              sub_1001041E0((uint64_t)v84);
              __int128 v37 = (void *)v76[3];
            }

            __int128 v38 = v37;
            _Block_object_dispose(&v75, 8);
            id v39 = [[v38 alloc] initUsingLocalDeviceLibraryDestinationWithImportElements:v36 referralObject:0 usingLocalLibraryDestination :0 usingCloudLibraryDestination:0];
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472LL;
            v56[2] = sub_1001042A4;
            v56[3] = &unk_1001A68B0;
            id v40 = v36;
            id v57 = v40;
            id v65 = v51;
            v58 = self;
            id v59 = v52;
            id v60 = v9;
            id v61 = v54;
            id v62 = v53;
            id v63 = v15;
            double v67 = v13;
            id v64 = v50;
            p___int128 buf = &buf;
            [v48 performStoreAlbumArtistLibraryImport:v39 withCompletion:v56];

            objc_autoreleasePoolPop(v35);
            goto LABEL_37;
          }

          v41 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            id v42 = [v15 count];
            +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
            *(_DWORD *)v84 = 134218240;
            *(void *)&v84[4] = v42;
            *(_WORD *)&v84[12] = 2048;
            *(double *)&v84[14] = v43 - v13;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Finished loading content taste for %lu album artists in %3f seconds",  v84,  0x16u);
          }

          [v15 addObjectsFromArray:v50];
          if ([v15 count])
          {
            uint64_t v44 = MSVArchivedDataWithRootObject(v15);
            uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);
            v46 = *(void **)(*((void *)&buf + 1) + 40LL);
            *(void *)(*((void *)&buf + 1) + 40LL) = v45;
          }

          if (!v51) {
            goto LABEL_37;
          }
          uint64_t v34 = *(void *)(*((void *)&buf + 1) + 40LL);
          __int128 v33 = v53;
          id v32 = v54;
        }

        (*((void (**)(id, void *, void *, uint64_t, void))v51 + 2))(v51, v32, v33, v34, 0LL);
LABEL_37:

        _Block_object_dispose(&buf, 8);
        goto LABEL_38;
      }

      [v52 databaseConnectionAllowingWrites:1 withBlock:&stru_1001A6810];
    }

    __int16 v50 = 0LL;
    goto LABEL_13;
  }

  if (v51) {
    (*((void (**)(id, void, void, void, void))v51 + 2))(v51, 0LL, 0LL, 0LL, 0LL);
  }
LABEL_38:
}

- (void)_updateContentTasteForMediaItems:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6
{
  id v63 = a3;
  id v52 = a4;
  id v49 = a5;
  id v51 = a6;
  id v9 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v63 count];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updating content taste for %lu items",  (uint8_t *)&buf,  0xCu);
  }

  if ([v63 count])
  {
    id v62 = (void *)objc_claimAutoreleasedReturnValue([v52 checkoutReaderConnection]);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v11 = v10;
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v63 allKeys]);
    id v13 = [v12 mutableCopy];

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v96 = 0x3032000000LL;
    v97 = sub_100102E4C;
    v98 = sub_100102E5C;
    id v99 = 0LL;
    id v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int16 v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v61 = (void *)objc_claimAutoreleasedReturnValue( +[ML3DatabaseStatementRenderer defaultRenderer]( &OBJC_CLASS___ML3DatabaseStatementRenderer,  "defaultRenderer"));
    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v52 valueForDatabaseProperty:@"NonMediaItemStoreAdamIds"]);
    if ([v50 length])
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v50 componentsSeparatedByString:@"$"]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 valueForKey:@"longLongValue"]);
      id v16 = *(void **)(*((void *)&buf + 1) + 40LL);
      *(void *)(*((void *)&buf + 1) + 40LL) = v15;

      [v13 removeObjectsInArray:*(void *)(*((void *)&buf + 1) + 40)];
      uint64_t v17 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [*(id *)(*((void *)&buf + 1) + 40) count];
        uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40LL);
        *(_DWORD *)v91 = 134218242;
        *(void *)&v91[4] = v18;
        *(_WORD *)&v91[12] = 2112;
        *(void *)&v91[14] = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Removing [Count:(%lu), items:(%@)] non media items from import list",  v91,  0x16u);
      }
    }

    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    id obj =  -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"store_item_id",  @"subscription_store_item_id",  0LL);
    id v57 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v87,  v94,  16LL);
    if (v57)
    {
      uint64_t v56 = *(void *)v88;
      do
      {
        for (i = 0LL; i != v57; i = (char *)i + 1)
        {
          if (*(void *)v88 != v56) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v87 + 1) + 8LL * (void)i);
          uint64_t v21 = [v13 count];
          for (j = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( @"SELECT item_pid, liked_state, store_item_id, subscription_store_item_id, store_saga_id, is_subscription FROM item_store JOIN item_stats USING (item_pid) WHERE ",  "stringByAppendingString:",  v20)); v21; v21 -= v23)
          {
            else {
              uint64_t v23 = (uint64_t)v21;
            }
            uint64_t v24 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v91 = 134218498;
              *(void *)&v91[4] = v21;
              *(_WORD *)&v91[12] = 2048;
              *(void *)&v91[14] = v23;
              *(_WORD *)&v91[22] = 2112;
              v92 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "processing tracks with pendingItemCount: %lu, currentBatchCount: %lu for property: %@",  v91,  0x20u);
            }

            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v61 statementWithPrefix:j inParameterCount:v23]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subarrayWithRange:", (_BYTE *)objc_msgSend(v13, "count") - v21, v23));
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v62 executeQuery:v25 withParameters:v26]);
            v82[0] = _NSConcreteStackBlock;
            v82[1] = 3221225472LL;
            v82[2] = sub_100102E64;
            v82[3] = &unk_1001A68D8;
            v82[4] = v20;
            id v83 = v13;
            id v84 = v63;
            id v85 = v59;
            id v86 = v60;
            [v27 enumerateRowsWithBlock:v82];
          }
        }

        id v57 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v87,  v94,  16LL);
      }

      while (v57);
    }

    for (k = [v13 count]; k; k -= v29)
    {
      else {
        uint64_t v29 = (uint64_t)k;
      }
      BOOL v30 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v91 = 134218240;
        *(void *)&v91[4] = k;
        *(_WORD *)&v91[12] = 2048;
        *(void *)&v91[14] = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "processing albums with pendingItemCount: %lu, currentBatchCount: %lu",  v91,  0x16u);
      }

      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v61,  "statementWithPrefix:inParameterCount:",  @"SELECT album_pid, liked_state, store_playlist_id, item_store.item_pid, item_store.store_saga_id, item_store.is_subscription FROM album JOIN item_store ON (album.representative_item_pid == item_store.ROWID) WHERE item_store.store_playlist_id",  v29));
      id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subarrayWithRange:", (_BYTE *)objc_msgSend(v13, "count") - k, v29));
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v62 executeQuery:v31 withParameters:v32]);

      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472LL;
      v77[2] = sub_100103274;
      v77[3] = &unk_1001A6838;
      id v78 = v13;
      id v79 = v63;
      id v80 = v53;
      id v81 = v54;
      [v33 enumerateRowsWithBlock:v77];
    }

    [v52 checkInDatabaseConnection:v62];
    unsigned int v34 = -[ICCloudContentTasteUpdateOperation isCancelled](self, "isCancelled");
    __int128 v35 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v36)
      {
        *(_DWORD *)v91 = 138543362;
        *(void *)&v91[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ is cancelled", v91, 0xCu);
      }

      if (!v51) {
        goto LABEL_44;
      }
      __int128 v37 = 0LL;
      __int128 v38 = 0LL;
      id v39 = 0LL;
      id v40 = 0LL;
    }

    else
    {
      if (v36)
      {
        id v41 = [v60 count];
        id v42 = [v54 count];
        double v43 = (uint64_t (*)(uint64_t, uint64_t))[v13 count];
        *(_DWORD *)v91 = 134218754;
        *(void *)&v91[4] = v41;
        *(_WORD *)&v91[12] = 2048;
        *(void *)&v91[14] = v42;
        *(_WORD *)&v91[22] = 2048;
        v92 = v43;
        LOWORD(v93) = 2112;
        *(void *)((char *)&v93 + 2) = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "updated [tracks:(%lu) albums:(%lu)] new items to import[count:(%lu) items:(%@)]",  v91,  0x2Au);
      }

      if ([v13 count])
      {
        uint64_t v44 = objc_autoreleasePoolPush();
        *(void *)v91 = 0LL;
        *(void *)&v91[8] = v91;
        *(void *)&v91[16] = 0x3032000000LL;
        v92 = sub_100102E4C;
        *(void *)&__int128 v93 = sub_100102E5C;
        *((void *)&v93 + 1) = 0LL;
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472LL;
        v64[2] = sub_1001035B4;
        v64[3] = &unk_1001A6900;
        id v65 = v13;
        id v73 = v51;
        id v66 = v59;
        id v67 = v60;
        id v68 = v53;
        id v69 = v54;
        v70 = self;
        id v71 = v52;
        id v72 = v63;
        p___int128 buf = &buf;
        uint64_t v75 = v91;
        double v76 = v11;
        [v49 addStoreItemIDs:v65 andAddTracksToCloudLibrary:0 withCompletion:v64];

        _Block_object_dispose(v91, 8);
        objc_autoreleasePoolPop(v44);
LABEL_44:

        _Block_object_dispose(&buf, 8);
        goto LABEL_45;
      }

      uint64_t v45 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = [v13 count];
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        *(_DWORD *)v91 = 134218240;
        *(void *)&v91[4] = v46;
        *(_WORD *)&v91[12] = 2048;
        *(double *)&v91[14] = v47 - v11;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Finished loading content taste for %lu items/albums in %3f seconds",  v91,  0x16u);
      }

      __int128 v37 = v59;
      __int128 v38 = v60;
      id v39 = v53;
      id v40 = v54;
      if (!v51) {
        goto LABEL_44;
      }
    }

    (*((void (**)(id, void *, void *, void *, void *, void, void))v51 + 2))( v51,  v37,  v38,  v39,  v40,  0LL,  0LL);
    goto LABEL_44;
  }

  if (v51) {
    (*((void (**)(id, void, void, void, void, void, void))v51 + 2))( v51,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
  }
LABEL_45:
}

- (void)_updateContentTasteForGlobalPlaylists:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    id v53 = [v10 count];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Updating content taste for %lu global playlists",  buf,  0xCu);
  }

  if ([v10 count])
  {
    __int128 v33 = self;
    unsigned int v34 = (void (**)(void, void, void, void))v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
    double v16 = COERCE_DOUBLE([v15 mutableCopy]);

    __int128 v35 = v11;
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v11 checkoutReaderConnection]);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v18 = v17;
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue( +[ML3DatabaseStatementRenderer defaultRenderer]( &OBJC_CLASS___ML3DatabaseStatementRenderer,  "defaultRenderer"));
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v19 = [*(id *)&v16 count];
    if (v19)
    {
      unint64_t v20 = (unint64_t)v19;
      do
      {
        if (v20 >= 0xFA) {
          *(void *)&double v21 = 250LL;
        }
        else {
          double v21 = *(double *)&v20;
        }
        id v22 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134218240;
          id v53 = (id)v20;
          __int16 v54 = 2048;
          double v55 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "processing playlists with pendingplayListCount: %lu, currentBatchCount: %lu",  buf,  0x16u);
        }

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v36,  "statementWithPrefix:inParameterCount:",  @"SELECT container_pid, liked_state, cloud_global_id FROM container WHERE cloud_global_id",  *(void *)&v21));
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)&v16,  "subarrayWithRange:",  (char *)objc_msgSend(*(id *)&v16, "count") - v20,  *(void *)&v21));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v39 executeQuery:v23 withParameters:v24]);

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_100102824;
        v47[3] = &unk_1001A6838;
        id v48 = *(id *)&v16;
        id v49 = v10;
        id v50 = v38;
        id v51 = v37;
        [v25 enumerateRowsWithBlock:v47];
        v20 -= *(void *)&v21;
      }

      while (*(double *)&v20 != 0.0);
    }

    id v11 = v35;
    [v35 checkInDatabaseConnection:v39];
    unsigned int v26 = -[ICCloudContentTasteUpdateOperation isCancelled](v33, "isCancelled");
    uint64_t v27 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      id v13 = v34;
      if (v28)
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v53 = v33;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ is cancelled", buf, 0xCu);
      }

      if (v34) {
        v34[2](v34, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      id v13 = v34;
      if (v28)
      {
        id v29 = [*(id *)&v16 count];
        *(_DWORD *)__int128 buf = 134218242;
        id v53 = v29;
        __int16 v54 = 2112;
        double v55 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Playlist Import [Count:(%lu) - Ids:(%@)]",  buf,  0x16u);
      }

      if ([*(id *)&v16 count])
      {
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_100102A28;
        v40[3] = &unk_1001A6950;
        uint64_t v45 = v34;
        v40[4] = v33;
        id v41 = v10;
        id v42 = v38;
        id v43 = v37;
        id v44 = *(id *)&v16;
        double v46 = v18;
        [v12 addNonLibraryOwnedPlaylistsWithGlobalIDs:v44 completion:v40];
      }

      else
      {
        BOOL v30 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [*(id *)&v16 count];
          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          *(_DWORD *)__int128 buf = 134218240;
          id v53 = v31;
          __int16 v54 = 2048;
          double v55 = v32 - v18;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Finished loading content taste for %lu playlists in %3f seconds",  buf,  0x16u);
        }

        if (v34) {
          ((void (**)(void, void *, void *, void))v34)[2](v34, v38, v37, 0LL);
        }
      }
    }
  }

  else if (v13)
  {
    (*((void (**)(id, void, void, void))v13 + 2))(v13, 0LL, 0LL, 0LL);
  }
}

- (void)setError:(id)a3
{
}

- (ICCloudContentTasteUpdateResponse)contentTasteUpdateResponse
{
  return (ICCloudContentTasteUpdateResponse *)self->_error;
}

- (void).cxx_destruct
{
}

@end