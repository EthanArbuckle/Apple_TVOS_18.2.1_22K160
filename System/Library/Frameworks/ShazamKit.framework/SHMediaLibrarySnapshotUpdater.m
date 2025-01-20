@interface SHMediaLibrarySnapshotUpdater
- (SHMediaItemFetcher)mediaItemFetcher;
- (SHMediaLibrarySnapshotUpdater)init;
- (SHMediaLibrarySnapshotUpdater)initWithMediaItemFetcher:(id)a3 remoteConfiguration:(id)a4;
- (SHRemoteConfiguration)remoteConfiguration;
- (id)condition;
- (void)setMediaItemFetcher:(id)a3;
- (void)setRemoteConfiguration:(id)a3;
- (void)updateChanges:(id)a3 completionHandler:(id)a4;
- (void)updateSnapshot:(id)a3 completionHandler:(id)a4;
@end

@implementation SHMediaLibrarySnapshotUpdater

- (SHMediaLibrarySnapshotUpdater)init
{
  v3 = -[SHMediaItemFetcher initWithBundleIdentifier:clientType:]( objc_alloc(&OBJC_CLASS___SHMediaItemFetcher),  "initWithBundleIdentifier:clientType:",  @"com.apple.shazamd",  1LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SHRemoteConfiguration sharedInstance](&OBJC_CLASS___SHRemoteConfiguration, "sharedInstance"));
  v5 = -[SHMediaLibrarySnapshotUpdater initWithMediaItemFetcher:remoteConfiguration:]( self,  "initWithMediaItemFetcher:remoteConfiguration:",  v3,  v4);

  return v5;
}

- (SHMediaLibrarySnapshotUpdater)initWithMediaItemFetcher:(id)a3 remoteConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHMediaLibrarySnapshotUpdater;
  v9 = -[SHMediaLibrarySnapshotUpdater init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItemFetcher, a3);
    objc_storeStrong((id *)&v10->_remoteConfiguration, a4);
  }

  return v10;
}

- (id)condition
{
  return &stru_10006DA40;
}

- (void)updateSnapshot:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 changes]);
  id v9 = [v8 count];

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 trackChanges]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002DE50;
    v12[3] = &unk_10006D1A8;
    id v13 = v7;
    -[SHMediaLibrarySnapshotUpdater updateChanges:completionHandler:]( self,  "updateChanges:completionHandler:",  v10,  v12);
  }

  else
  {
    v11 = objc_alloc_init(&OBJC_CLASS___SHMediaLibrarySnapshot);
    (*((void (**)(id, SHMediaLibrarySnapshot *, void))v7 + 2))(v7, v11, 0LL);
  }
}

- (void)updateChanges:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v6 count]));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        v14 = (unsigned int (**)(void, void))objc_claimAutoreleasedReturnValue( -[SHMediaLibrarySnapshotUpdater condition]( self,  "condition"));
        if (((unsigned int (**)(void, void *))v14)[2](v14, v13))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 libraryItem]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 shazamKey]);

          if (!v16) {
            continue;
          }
          v14 = (unsigned int (**)(void, void))objc_claimAutoreleasedReturnValue([v13 libraryItem]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v14 shazamKey]);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 validatedKey]);
          [v7 addObject:v18];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v10);
  }

  id v19 = [v7 count];
  if (v19)
  {
    uint64_t v20 = sh_log_object(v19);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    v22 = v26;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v23 = [v7 count];
      *(_DWORD *)buf = 134217984;
      id v35 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Trying to update %li tracks", buf, 0xCu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySnapshotUpdater mediaItemFetcher](self, "mediaItemFetcher"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10002E1C8;
    v27[3] = &unk_10006DA68;
    id v28 = v8;
    id v29 = v26;
    [v24 mediaItemsForShazamIDs:v25 completionHandler:v27];
  }

  else
  {
    v22 = v26;
    (*((void (**)(id, void *, void))v26 + 2))(v26, &__NSArray0__struct, 0LL);
  }
}

- (SHMediaItemFetcher)mediaItemFetcher
{
  return self->_mediaItemFetcher;
}

- (void)setMediaItemFetcher:(id)a3
{
}

- (SHRemoteConfiguration)remoteConfiguration
{
  return self->_remoteConfiguration;
}

- (void)setRemoteConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end