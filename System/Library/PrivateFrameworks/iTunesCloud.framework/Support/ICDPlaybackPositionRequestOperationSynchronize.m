@interface ICDPlaybackPositionRequestOperationSynchronize
- (ICDPlaybackPositionRequestOperationSynchronize)initWithContext:(id)a3 completionHandler:(id)a4;
- (id)_serializableRequestBodyPropertyListWithItems:(id)a3 syncAnchor:(id)a4 conflictDetectionType:(id)a5;
- (id)_serializableUpdateItemPayloadDictionaryForEntity:(id)a3 withKey:(id)a4 withConflictDetection:(id)a5;
- (void)_finishWithError:(id)a3;
- (void)_parseResponseData:(id)a3 completion:(id)a4;
- (void)_performSyncWithBodyData:(id)a3 completion:(id)a4;
- (void)_performSyncWithSyncAnchor:(id)a3 itemsToSync:(id)a4 conflictDetectionType:(id)a5 completion:(id)a6;
- (void)_synchronize;
- (void)start;
@end

@implementation ICDPlaybackPositionRequestOperationSynchronize

- (ICDPlaybackPositionRequestOperationSynchronize)initWithContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionRequestOperationSynchronize;
  v9 = -[ICDPlaybackPositionRequestOperationSynchronize init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_urlBagKey, ICURLBagKeyKVSRequestURLSync);
    objc_storeStrong((id *)&v10->_context, a3);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    metadataItemsFromDataSource = v10->_metadataItemsFromDataSource;
    v10->_metadataItemsFromDataSource = (NSMutableDictionary *)v13;
  }

  return v10;
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Setting MPDateToSyncWithUbiquitousStore to distantFuture",  (uint8_t *)&v4,  0xCu);
  }

  -[ICDPlaybackPositionRequestOperationSynchronize _synchronize](self, "_synchronize");
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_description"));
      int v8 = 138543362;
      v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Finished synchronization error=%{public}@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished synchronization", (uint8_t *)&v8, 2u);
  }

  (*((void (**)(void))self->_completionHandler + 2))();
  -[ICDPlaybackPositionRequestOperationSynchronize finishWithError:](self, "finishWithError:", v4);
}

- (void)_synchronize
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning synchronization", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext library](self->_context, "library"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext playbackPositionDomain](self->_context, "playbackPositionDomain"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000D0474;
  v21[3] = &unk_1001A5648;
  v21[4] = self;
  v6 = (ICDPlaybackPositionRequestOperationSynchronize *)objc_claimAutoreleasedReturnValue( [v4 beginTransactionWithItemsToSyncWithDomain:v5 enumerationBlock:v21]);

  id v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_metadataItemsFromDataSource, "allKeys"));
      v10 = (ICDPlaybackPositionRequestOperationSynchronize *)[v9 count];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_metadataItemsFromDataSource, "allKeys"));
      *(_DWORD *)buf = 134218242;
      v23 = v10;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Gathered local %lu items to sync from dataSource: %@",  buf,  0x16u);
    }

    v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "dataSource transaction context = %@",  buf,  0xCu);
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestOperationSynchronize lastSyncedDomainVersion](v6, "lastSyncedDomainVersion"));
    v14 = (void *)v13;
    if (v13) {
      v15 = (const __CFString *)v13;
    }
    else {
      v15 = @"0";
    }
    metadataItemsFromDataSource = self->_metadataItemsFromDataSource;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000D0684;
    v18[3] = &unk_1001A56E8;
    v18[4] = self;
    id v19 = v4;
    v20 = v6;
    -[ICDPlaybackPositionRequestOperationSynchronize _performSyncWithSyncAnchor:itemsToSync:conflictDetectionType:completion:]( self,  "_performSyncWithSyncAnchor:itemsToSync:conflictDetectionType:completion:",  v15,  metadataItemsFromDataSource,  @"ordinal",  v18);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@ beginTransactionWithItemsToSyncWithDomain: did not return database context",  buf,  0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  0LL,  0LL));
    -[ICDPlaybackPositionRequestOperationSynchronize _finishWithError:](self, "_finishWithError:", v17);
  }
}

- (void)_parseResponseData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v37 = (void (**)(id, void *, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 updatedKeys]);
  id v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(ICDPlaybackPositionRequestOperationSynchronize **)(*((void *)&v45 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 metadataWithPlaybackPositionKey:v12 failuresOkay:0]);
        if (v13)
        {
          [v6 setObject:v13 forKeyedSubscript:v12];
        }

        else
        {
          v14 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v51 = self;
            __int16 v52 = 2114;
            v53 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@ Could not create remote entity from key %{public}@",  buf,  0x16u);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }

    while (v9);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  obj = (void *)objc_claimAutoreleasedReturnValue([v5 conflictedKeys]);
  id v15 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(ICDPlaybackPositionRequestOperationSynchronize **)(*((void *)&v41 + 1) + 8LL * (void)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v5 metadataWithPlaybackPositionKey:v19 failuresOkay:0]);
        if (v20)
        {
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_metadataItemsFromDataSource,  "objectForKeyedSubscript:",  v19));
          os_log_t v22 = v21;
          if (v21)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bookmarkTimestamp](v21, "bookmarkTimestamp"));
            [v23 doubleValue];
            double v25 = v24;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v20 bookmarkTimestamp]);
            [v26 doubleValue];
            double v28 = v27;

            if (v25 < v28)
            {
              v29 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v51 = v19;
                v30 = v29;
                v31 = "Merging remote entity with key %{public}@ - remote entity is newer";
                goto LABEL_27;
              }

              goto LABEL_28;
            }

            unsigned int v33 = -[os_log_s isEqual:](v22, "isEqual:", v20);
            v29 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
            BOOL v34 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
            if (v33)
            {
              if (v34)
              {
                *(_DWORD *)buf = 138543362;
                v51 = v19;
                v35 = v29;
                v36 = "Keeping local entity with key %{public}@ - Local and remote entities are the same.";
                goto LABEL_34;
              }
            }

            else if (v34)
            {
              *(_DWORD *)buf = 138543362;
              v51 = v19;
              v35 = v29;
              v36 = "Keeping local entity with key %{public}@";
LABEL_34:
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0xCu);
            }

            v32 = v38;
          }

          else
          {
            v29 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v51 = v19;
              v30 = v29;
              v31 = "Merging remote entity with key %{public}@ - No local entity";
LABEL_27:
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, v31, buf, 0xCu);
            }

- (void)_performSyncWithSyncAnchor:(id)a3 itemsToSync:(id)a4 conflictDetectionType:(id)a5 completion:(id)a6
{
  uint64_t v10 = (ICDPlaybackPositionRequestOperationSynchronize *)a3;
  id v11 = (void (**)(id, void, id))a6;
  id v12 = a5;
  id v13 = a4;
  v14 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Performing sync with server using syncAnchor = %@",  buf,  0xCu);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionRequestOperationSynchronize _serializableRequestBodyPropertyListWithItems:syncAnchor:conflictDetectionType:]( self,  "_serializableRequestBodyPropertyListWithItems:syncAnchor:conflictDetectionType:",  v13,  v10,  v12));
  id v19 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v15,  -[ICDPlaybackPositionRequestOperationBase bodyContentFormat](self, "bodyContentFormat"),  0LL,  &v19));
  id v17 = v19;
  if (v17)
  {
    v18 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@ Error serializing body data. error=%{public}@",  buf,  0x16u);
    }

    v11[2](v11, 0LL, v17);
  }

  else
  {
    -[ICDPlaybackPositionRequestOperationSynchronize _performSyncWithBodyData:completion:]( self,  "_performSyncWithBodyData:completion:",  v16,  v11);
  }
}

- (void)_performSyncWithBodyData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext storeRequestContext](self->_context, "storeRequestContext"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000D006C;
    v12[3] = &unk_1001A5738;
    v12[4] = self;
    id v15 = v7;
    id v13 = v6;
    id v14 = v8;
    [v9 getBagForRequestContext:v14 withCompletionHandler:v12];
  }

  else
  {
    uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ context.requestContext=nil",  buf,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7101LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (id)_serializableRequestBodyPropertyListWithItems:(id)a3 syncAnchor:(id)a4 conflictDetectionType:(id)a5
{
  id v8 = a3;
  id v32 = a4;
  id v9 = a5;
  context = objc_autoreleasePoolPush();
  BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v35 = v8;
  id obj = (id)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  id v10 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v14]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionRequestOperationSynchronize _serializableUpdateItemPayloadDictionaryForEntity:withKey:withConflictDetection:]( self,  "_serializableUpdateItemPayloadDictionaryForEntity:withKey:withConflictDetection:",  v15,  v14,  v9));
        if (v16)
        {
          [v34 addObject:v16];
          id v17 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 138412290;
          id v44 = v14;
          v18 = v17;
          os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
          v20 = "[SYNC-REQUEST] Updating Key: %@";
        }

        else
        {
          id v17 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 138412290;
          id v44 = v14;
          v18 = v17;
          os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
          v20 = "WARNING: no data was provided for updated key %@, skipping just that item";
        }

        _os_log_impl((void *)&_mh_execute_header, v18, v19, v20, buf, 0xCu);
LABEL_12:
      }

      id v11 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v11);
  }

  id v21 = (id)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext playbackPositionDomain](self->_context, "playbackPositionDomain"));
  if (!v21)
  {
    uint64_t v22 = MSVAutoBugCaptureDomainiTunesCloud;
    __int128 v42 = self->_context;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
    +[MSVAutoBugCapture snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:]( &OBJC_CLASS___MSVAutoBugCapture,  "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:",  v22,  @"Bug",  @"ICPlaybackPositionRequestBug",  @"Context missing domain",  0LL,  v23,  0LL);

    id v21 = ICPlaybackPositionServiceDomainDefault;
  }

  id v24 = v9;
  double v25 = (void *)objc_claimAutoreleasedReturnValue([v34 arrayByAddingObjectsFromArray:v30]);
  v40[0] = @"domain";
  v40[1] = @"version";
  v41[0] = v21;
  v41[1] = v32;
  v40[2] = @"ops";
  v41[2] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  3LL));
  id v27 = [v26 mutableCopy];

  if ([v24 length]) {
    [v27 setObject:v24 forKey:@"conflict-detection"];
  }
  double v28 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v27;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sync request payload (plist): %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
  return v27;
}

- (id)_serializableUpdateItemPayloadDictionaryForEntity:(id)a3 withKey:(id)a4 withConflictDetection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionRequestOperationBase keyValueStorePayloadWithEntity:]( self,  "keyValueStorePayloadWithEntity:",  v8));
  v17[0] = @"op";
  v17[1] = @"key";
  v18[0] = @"put";
  v18[1] = v10;
  v17[2] = @"value";
  v18[2] = v11;
  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  id v13 = [(id)v12 mutableCopy];
  LOBYTE(v12) = [v9 isEqualToString:@"none"];

  if ((v12 & 1) == 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 bookmarkTimestamp]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionRequestOperationBase canonicalTimestampFromTimeInterval:]( self,  "canonicalTimestampFromTimeInterval:",  v14));

    if (v15) {
      [v13 setObject:v15 forKey:@"ordinal"];
    }
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end