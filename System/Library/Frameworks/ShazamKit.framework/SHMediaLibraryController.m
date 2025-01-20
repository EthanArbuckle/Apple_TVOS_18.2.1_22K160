@interface SHMediaLibraryController
- (BOOL)_synchronizeLocalSnapshot:(id)a3 error:(id *)a4;
- (NSString)syncID;
- (SHLShazamLibrary)remoteLibrary;
- (SHMediaLibraryContext)currentContext;
- (SHMediaLibraryController)initWithBundleIdentifier:(id)a3 clientType:(int64_t)a4;
- (SHMediaLibraryController)initWithDataStore:(id)a3 remoteLibrary:(id)a4 libraryInfoFetcher:(id)a5 snapshotUpdater:(id)a6;
- (SHMediaLibraryDataStore)dataStore;
- (SHMediaLibraryInfoFetcher)libraryInfoFetcher;
- (SHMediaLibrarySnapshot)currentSnapshot;
- (SHMediaLibrarySnapshot)syncSnapshot;
- (SHMediaLibrarySnapshotUpdater)snapshotUpdater;
- (SHMediaLibrarySyncDelegate)delegate;
- (id)mapInternalLibraryErrorToMediaLibrary:(id)a3 keyOverrides:(id)a4;
- (id)shazamLibrarySyncStartConditionForMediaLibraryStartCondition:(id)a3;
- (id)unsyncedGroupChangeset;
- (id)unsyncedTrackChangeset;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)_synchronizeRemoteSnapshot:(id)a3 startCondition:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)beginLibrarySync;
- (void)commonInitWithDataStore:(id)a3 remoteLibrary:(id)a4 libraryInfoFetcher:(id)a5 snapshotUpdater:(id)a6;
- (void)failedToSyncContext:(id)a3;
- (void)finishLibrarySync;
- (void)handleLibraryError:(id)a3 failedItemIdentifiers:(id)a4;
- (void)library:(id)a3 didChangeGroups:(id)a4 syncAction:(int64_t)a5;
- (void)library:(id)a3 didChangeTracks:(id)a4 syncAction:(int64_t)a5;
- (void)library:(id)a3 didCompleteSyncWithCompletionHandler:(id)a4;
- (void)library:(id)a3 didDeleteItemsWithIdentifiers:(id)a4 syncAction:(int64_t)a5;
- (void)library:(id)a3 didProduceError:(id)a4 withFailedItemIdentifiers:(id)a5 syncAction:(int64_t)a6;
- (void)libraryDataStore:(id)a3 didUpdateWithChange:(id)a4;
- (void)libraryWillBeginSync:(id)a3;
- (void)persistChangesAndCompleteSyncWithCompletionHandler:(id)a3;
- (void)removeInvalidChangesFromSnapshot:(id)a3;
- (void)resetDataIfNeededForSyncError:(id)a3;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLibraryInfoFetcher:(id)a3;
- (void)setRemoteLibrary:(id)a3;
- (void)setSnapshotUpdater:(id)a3;
- (void)setSyncID:(id)a3;
- (void)setSyncSnapshot:(id)a3;
- (void)synchronizeRemoteSnapshot:(id)a3 startCondition:(id)a4;
- (void)synchronizeWithContext:(id)a3;
@end

@implementation SHMediaLibraryController

- (SHMediaLibraryController)initWithBundleIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHMediaLibraryController;
  v6 = -[SHMediaLibraryController init](&v12, "init");
  if (v6)
  {
    v7 = -[SHMediaLibraryDataStore initWithStoreType:]( objc_alloc(&OBJC_CLASS___SHMediaLibraryDataStore),  "initWithStoreType:",  1LL);
    v8 = objc_alloc_init(&OBJC_CLASS___SHMediaLibraryInfoFetcher);
    v9 = -[SHLShazamLibrary initWithCallingProcessIdentifier:]( objc_alloc(&OBJC_CLASS___SHLShazamLibrary),  "initWithCallingProcessIdentifier:",  v5);
    v10 = objc_alloc_init(&OBJC_CLASS___SHMediaLibrarySnapshotUpdater);
    -[SHMediaLibraryController commonInitWithDataStore:remoteLibrary:libraryInfoFetcher:snapshotUpdater:]( v6,  "commonInitWithDataStore:remoteLibrary:libraryInfoFetcher:snapshotUpdater:",  v7,  v9,  v8,  v10);
  }

  return v6;
}

- (SHMediaLibraryController)initWithDataStore:(id)a3 remoteLibrary:(id)a4 libraryInfoFetcher:(id)a5 snapshotUpdater:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SHMediaLibraryController;
  v14 = -[SHMediaLibraryController init](&v17, "init");
  v15 = v14;
  if (v14) {
    -[SHMediaLibraryController commonInitWithDataStore:remoteLibrary:libraryInfoFetcher:snapshotUpdater:]( v14,  "commonInitWithDataStore:remoteLibrary:libraryInfoFetcher:snapshotUpdater:",  v10,  v11,  v12,  v13);
  }

  return v15;
}

- (void)commonInitWithDataStore:(id)a3 remoteLibrary:(id)a4 libraryInfoFetcher:(id)a5 snapshotUpdater:(id)a6
{
  id v10 = (SHMediaLibraryDataStore *)a3;
  id v11 = (SHLShazamLibrary *)a4;
  id v12 = (SHMediaLibraryInfoFetcher *)a5;
  id v13 = (SHMediaLibrarySnapshotUpdater *)a6;
  dataStore = self->_dataStore;
  self->_dataStore = v10;
  v20 = v10;

  -[SHMediaLibraryDataStore setDelegate:](self->_dataStore, "setDelegate:", self);
  remoteLibrary = self->_remoteLibrary;
  self->_remoteLibrary = v11;
  v16 = v11;

  -[SHLShazamLibrary setDelegate:](self->_remoteLibrary, "setDelegate:", self);
  libraryInfoFetcher = self->_libraryInfoFetcher;
  self->_libraryInfoFetcher = v12;
  v18 = v12;

  snapshotUpdater = self->_snapshotUpdater;
  self->_snapshotUpdater = v13;
}

- (void)synchronizeWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  -[SHMediaLibraryController setSyncID:](self, "setSyncID:", v6);

  -[SHMediaLibraryController setCurrentContext:](self, "setCurrentContext:", v4);
  v7 = objc_alloc_init(&OBJC_CLASS___SHMediaLibrarySnapshot);
  -[SHMediaLibraryController setCurrentSnapshot:](self, "setCurrentSnapshot:", v7);

  uint64_t v9 = sh_log_object(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController syncID](self, "syncID"));
    *(_DWORD *)buf = 138412290;
    v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Media Library started syncing. Sync ID: %@",  buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
  BOOL v13 = v12 == 0LL;

  if (v13)
  {
    uint64_t v17 = sh_log_object(v14);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to start sync, missing data store",  buf,  2u);
    }

    -[SHMediaLibraryController failedToSyncContext:](self, "failedToSyncContext:", v4);
  }

  else
  {
    objc_initWeak((id *)buf, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController snapshotUpdater](self, "snapshotUpdater"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 snapshot]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001BE68;
    v19[3] = &unk_10006D410;
    id v20 = v4;
    objc_copyWeak(&v21, (id *)buf);
    [v15 updateSnapshot:v16 completionHandler:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController libraryInfoFetcher](self, "libraryInfoFetcher"));
  [v5 fetchLibraryInfoWithCompletionHandler:v4];
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController libraryInfoFetcher](self, "libraryInfoFetcher"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001C158;
  v11[3] = &unk_10006D4B0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 fetchLibraryInfoWithCompletionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)_synchronizeLocalSnapshot:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 changes]);
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 changes]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  v52 = v4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 changes]);
  id v10 = [v9 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v67;
    id v13 = &AMSErrorDomain_ptr;
    uint64_t v53 = *(void *)v67;
    do
    {
      id v14 = 0LL;
      id v55 = v11;
      do
      {
        if (*(void *)v67 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)v14);
        v16 = (char *)[v15 changeType];
        if ((unint64_t)(v16 - 1) >= 2)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v15 libraryItem]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 identifier]);
          [v8 addObject:v34];

          goto LABEL_20;
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 libraryItem]);
        uint64_t v19 = objc_opt_class(v13[164], v18);
        char isKindOfClass = objc_opt_isKindOfClass(v17, v19);

        if ((isKindOfClass & 1) != 0)
        {
          id v21 = v9;
          v22 = v8;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v15 libraryItem]);
          [v54 addObject:v23];
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v63 = 0u;
          __int128 v62 = 0u;
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 tracksToSave]);
          id v25 = [v24 countByEnumeratingWithState:&v62 objects:v72 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v63;
            do
            {
              for (i = 0LL; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v63 != v27) {
                  objc_enumerationMutation(v24);
                }
                [v5 addObject:*(void *)(*((void *)&v62 + 1) + 8 * (void)i)];
              }

              id v26 = [v24 countByEnumeratingWithState:&v62 objects:v72 count:16];
            }

            while (v26);
          }

          uint64_t v8 = v22;
          id v9 = v21;
          uint64_t v12 = v53;
          id v13 = &AMSErrorDomain_ptr;
          id v11 = v55;
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue([v15 libraryItem]);
        uint64_t v31 = objc_opt_class(&OBJC_CLASS___SHMediaLibraryTrack, v30);
        char v32 = objc_opt_isKindOfClass(v29, v31);

        if ((v32 & 1) != 0)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v15 libraryItem]);
          [v5 addObject:v33];
LABEL_20:
        }

- (void)synchronizeRemoteSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController libraryInfoFetcher](self, "libraryInfoFetcher"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001D0DC;
  v11[3] = &unk_10006D500;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 fetchLibraryInfoWithCompletionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_synchronizeRemoteSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v51 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___SHLLibraryChangeset);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController unsyncedGroupChangeset](self, "unsyncedGroupChangeset"));
  -[SHLLibraryChangeset mergeChangeset:](v7, "mergeChangeset:", v8);

  v50 = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController unsyncedTrackChangeset](self, "unsyncedTrackChangeset"));
  -[SHLLibraryChangeset mergeChangeset:](v7, "mergeChangeset:", v9);

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  v52 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 changes]);
  id v11 = [v10 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v11)
  {
    id v12 = v11;
    id v13 = &AMSErrorDomain_ptr;
    uint64_t v14 = *(void *)v54;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        uint64_t v17 = (char *)[v16 changeType];
        if ((unint64_t)(v17 - 1) >= 2)
        {
          if (v17 == (char *)3)
          {
            char v32 = (void *)objc_claimAutoreleasedReturnValue([v16 libraryItem]);
            uint64_t v34 = objc_opt_class(v13[170], v33);
            char isKindOfClass = objc_opt_isKindOfClass(v32, v34);

            if ((isKindOfClass & 1) != 0)
            {
              uint64_t v36 = objc_alloc(&OBJC_CLASS___SHLLibraryTrack);
              v37 = (void *)objc_claimAutoreleasedReturnValue([v16 libraryItem]);
              v38 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
              v39 = -[SHLLibraryTrack initWithIdentifier:](v36, "initWithIdentifier:", v38);

              id v13 = &AMSErrorDomain_ptr;
              v58 = v39;
              v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v58,  1LL));
              -[SHLLibraryChangeset deleteTracks:](v7, "deleteTracks:", v40);
            }

            v41 = (void *)objc_claimAutoreleasedReturnValue([v16 libraryItem]);
            uint64_t v43 = objc_opt_class(&OBJC_CLASS___SHMediaLibraryGroup, v42);
            char v44 = objc_opt_isKindOfClass(v41, v43);

            if ((v44 & 1) != 0)
            {
              v45 = objc_alloc(&OBJC_CLASS___SHLLibraryGroup);
              v46 = (void *)objc_claimAutoreleasedReturnValue([v16 libraryItem]);
              v47 = (void *)objc_claimAutoreleasedReturnValue([v46 identifier]);
              uint64_t v30 = -[SHLLibraryGroup initWithIdentifier:](v45, "initWithIdentifier:", v47);

              id v13 = &AMSErrorDomain_ptr;
              id v57 = v30;
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v57,  1LL));
              -[SHLLibraryChangeset deleteGroups:](v7, "deleteGroups:", v31);
LABEL_19:

LABEL_20:
              continue;
            }
          }
        }

        else
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 libraryItem]);
          uint64_t v20 = objc_opt_class(v13[170], v19);
          char v21 = objc_opt_isKindOfClass(v18, v20);

          if ((v21 & 1) != 0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue([v16 libraryItem]);
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaLibraryItemMapper shazamLibraryTrackFromLibraryTrack:]( &OBJC_CLASS___SHMediaLibraryItemMapper,  "shazamLibraryTrackFromLibraryTrack:",  v22));

            if (v23)
            {
              v60 = v23;
              v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v60,  1LL));
              -[SHLLibraryChangeset addTracks:](v7, "addTracks:", v24);
            }
          }

          id v25 = (void *)objc_claimAutoreleasedReturnValue([v16 libraryItem]);
          uint64_t v27 = objc_opt_class(&OBJC_CLASS___SHMediaLibraryGroup, v26);
          char v28 = objc_opt_isKindOfClass(v25, v27);

          if ((v28 & 1) != 0)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue([v16 libraryItem]);
            uint64_t v30 = (SHLLibraryGroup *)objc_claimAutoreleasedReturnValue( +[SHMediaLibraryItemMapper shazamLibraryGroupFromLibraryGroup:]( &OBJC_CLASS___SHMediaLibraryItemMapper,  "shazamLibraryGroupFromLibraryGroup:",  v29));

            if (v30)
            {
              id v59 = v30;
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v59,  1LL));
              -[SHLLibraryChangeset addGroups:](v7, "addGroups:", v31);
              goto LABEL_19;
            }

            goto LABEL_20;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }

    while (v12);
  }

  unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryController shazamLibrarySyncStartConditionForMediaLibraryStartCondition:]( v50,  "shazamLibrarySyncStartConditionForMediaLibraryStartCondition:",  v51));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController remoteLibrary](v50, "remoteLibrary"));
  [v49 synchronizeChanges:v7 startCondition:v48];
}

- (id)unsyncedGroupChangeset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fetchAllUploadableGroupsMissingLibrarySyncMetadata]);

  id v4 = objc_alloc_init(&OBJC_CLASS___SHLLibraryChangeset);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_claimAutoreleasedReturnValue( +[SHMediaLibraryItemMapper shazamLibraryGroupFromLibraryGroup:]( &OBJC_CLASS___SHMediaLibraryItemMapper,  "shazamLibraryGroupFromLibraryGroup:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9),  (void)v14));
        id v11 = (void *)v10;
        if (v10)
        {
          uint64_t v18 = v10;
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v18,  1LL));
          -[SHLLibraryChangeset addGroups:](v4, "addGroups:", v12);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)unsyncedTrackChangeset
{
  v3 = objc_alloc_init(&OBJC_CLASS___SHLLibraryChangeset);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchAllUploadableTracksMissingLibrarySyncMetadata]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_claimAutoreleasedReturnValue( +[SHMediaLibraryItemMapper shazamLibraryTrackFromLibraryTrack:]( &OBJC_CLASS___SHMediaLibraryItemMapper,  "shazamLibraryTrackFromLibraryTrack:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10),  (void)v15));
        id v12 = (void *)v11;
        if (v11)
        {
          uint64_t v19 = v11;
          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v19,  1LL));
          -[SHLLibraryChangeset addTracks:](v3, "addTracks:", v13);
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v8);
  }

  return v3;
}

- (id)shazamLibrarySyncStartConditionForMediaLibraryStartCondition:(id)a3
{
  id v3 = a3;
  id v4 = &off_10006DAE8;
  if (([v3 isEqualToString:SHMediaLibrarySyncStartConditionUserAction] & 1) == 0)
  {
    if ([v3 isEqualToString:SHMediaLibrarySyncStartConditionInitialFetch])
    {
      id v4 = &off_10006DAD8;
    }

    else if ([v3 isEqualToString:SHMediaLibrarySyncStartConditionInitialUpload])
    {
      id v4 = &off_10006DAE0;
    }

    else if ([v3 isEqualToString:SHMediaLibrarySyncStartConditionRemotePush])
    {
      id v4 = &off_10006DAF0;
    }

    else if ([v3 isEqualToString:SHMediaLibrarySyncStartConditionMigration])
    {
      id v4 = &off_10006DAF8;
    }
  }

  id v5 = *v4;

  return v5;
}

- (void)libraryWillBeginSync:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SHMediaLibrarySnapshot);
  -[SHMediaLibraryController setSyncSnapshot:](self, "setSyncSnapshot:", v4);
}

- (void)library:(id)a3 didChangeTracks:(id)a4 syncAction:(int64_t)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaLibraryItemMapper libraryTrackFromShazamLibraryTrack:]( &OBJC_CLASS___SHMediaLibraryItemMapper,  "libraryTrackFromShazamLibraryTrack:",  *(void *)(*((void *)&v50 + 1) + 8LL * (void)i)));
        [v7 addObject:v13];
      }

      id v10 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }

    while (v10);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  if (a5)
  {
    if (a5 != 1) {
      goto LABEL_29;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 updateReportForLibraryTrack:v7]);

    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    v37 = v16;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 missingFromLocalStoreTracks]);
    id v18 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v47;
      do
      {
        for (j = 0LL; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentSnapshot](self, "currentSnapshot"));
          unsigned __int8 v24 = [v23 containsLibraryItem:v22];

          if ((v24 & 1) == 0)
          {
            id v25 = -[SHMediaLibraryChange initWithLibraryItem:changeType:]( objc_alloc(&OBJC_CLASS___SHMediaLibraryChange),  "initWithLibraryItem:changeType:",  v22,  1LL);
            [v38 addObject:v25];
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }

      while (v19);
    }

    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v37 locallyFoundTracks]);
    id v27 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (k = 0LL; k != v28; k = (char *)k + 1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v42 + 1) + 8 * (void)k) updatedTrack]);
          [v14 addObject:v31];
        }

        id v28 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }

      while (v28);
    }

    char v32 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController syncSnapshot](self, "syncSnapshot"));
    id v33 = v38;
    id v34 = [v38 copy];
    [v32 addChanges:v34];
  }

  else
  {
    id v33 = [v7 copy];
    [v14 addObjectsFromArray:v33];
  }

LABEL_29:
  if ([v14 count])
  {
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
    id v36 = [v14 copy];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10001DFB4;
    v40[3] = &unk_10006D438;
    id v41 = v14;
    [v35 persistUpdatedTracks:v36 completionHandler:v40];
  }
}

- (void)library:(id)a3 didChangeGroups:(id)a4 syncAction:(int64_t)a5
{
  id v18 = self;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaLibraryItemMapper libraryGroupFromShazamLibraryGroup:]( &OBJC_CLASS___SHMediaLibraryItemMapper,  "libraryGroupFromShazamLibraryGroup:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v12),  v18));
        if (a5 != 1
          || (__int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentSnapshot](v18, "currentSnapshot")),
              unsigned __int8 v15 = [v14 containsLibraryItem:v13],
              v14,
              (v15 & 1) == 0))
        {
          [v7 addObject:v13];
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](v18, "dataStore"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001E25C;
  v19[3] = &unk_10006D438;
  id v20 = v7;
  id v17 = v7;
  [v16 persistLibraryGroups:v17 completionHandler:v19];
}

- (void)library:(id)a3 didDeleteItemsWithIdentifiers:(id)a4 syncAction:(int64_t)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001E3BC;
  v9[3] = &unk_10006D4D8;
  id v10 = v6;
  id v8 = v6;
  [v7 deleteItemsByIdentifiers:v8 completionHandler:v9];
}

- (void)library:(id)a3 didProduceError:(id)a4 withFailedItemIdentifiers:(id)a5 syncAction:(int64_t)a6
{
}

- (void)library:(id)a3 didCompleteSyncWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController syncSnapshot](self, "syncSnapshot"));
  id v9 = [v8 copy];

  -[SHMediaLibraryController setSyncSnapshot:](self, "setSyncSnapshot:", 0LL);
  objc_initWeak(&location, self);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController snapshotUpdater](self, "snapshotUpdater"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001E5D0;
  v13[3] = &unk_10006D528;
  id v11 = v9;
  id v14 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v7;
  id v15 = v12;
  [v10 updateSnapshot:v11 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)beginLibrarySync
{
  uint64_t v3 = sh_log_object(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController syncID](self, "syncID"));
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Remote] Media Library sync starts. Sync ID: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);
  char v8 = objc_opt_respondsToSelector(v7, "_libraryWillBeginSync:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
    [v10 _libraryWillBeginSync:self];
  }

- (void)persistChangesAndCompleteSyncWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
  id v30 = 0LL;
  id v6 = [v5 commitChangesWithError:&v30];
  id v7 = v30;

  if (v7)
  {
    uint64_t v9 = sh_log_object(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to persist sync changes with error: %@",  buf,  0xCu);
    }
  }

  if (v4) {
    v4[2](v4, v6);
  }
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
  -[SHMediaLibraryController resetDataIfNeededForSyncError:](self, "resetDataIfNeededForSyncError:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentSnapshot](self, "currentSnapshot"));
  LODWORD(v12) = [v13 hasChanges];

  if ((_DWORD)v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentSnapshot](self, "currentSnapshot"));
    id v15 = [v14 copy];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 delegate]);
    char v18 = objc_opt_respondsToSelector(v17, "_library:didChangeWithSnapshot:");

    if ((v18 & 1) != 0)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 delegate]);
      [v20 _library:self didChangeWithSnapshot:v15];
    }
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 delegate]);
  char v23 = objc_opt_respondsToSelector(v22, "_libraryDidCompleteSync:");

  if ((v23 & 1) != 0)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 delegate]);
    [v26 _libraryDidCompleteSync:self];
  }

  uint64_t v27 = sh_log_object(v24);
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController syncID](self, "syncID"));
    *(_DWORD *)buf = 138412290;
    id v32 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[Remote] Media Library completed sync. Sync ID: %@",  buf,  0xCu);
  }

  -[SHMediaLibraryController finishLibrarySync](self, "finishLibrarySync");
}

- (void)handleLibraryError:(id)a3 failedItemIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sh_log_object(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Media Library sync error: %@. Failed item identifiers: %@",  (uint8_t *)&v20,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryController mapInternalLibraryErrorToMediaLibrary:keyOverrides:]( self,  "mapInternalLibraryErrorToMediaLibrary:keyOverrides:",  v6,  0LL));
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
  [v11 setError:v10];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 delegate]);
  char v14 = objc_opt_respondsToSelector(v13, "_library:didProduceError:failedItemIdentifiers:");

  if ((v14 & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 delegate]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentContext](self, "currentContext"));
    char v18 = (void *)objc_claimAutoreleasedReturnValue([v17 error]);
    id v19 = [v7 copy];
    [v16 _library:self didProduceError:v18 failedItemIdentifiers:v19];
  }
}

- (void)resetDataIfNeededForSyncError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v10 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    unsigned int v7 = [v6 isEqualToString:SHMediaLibraryErrorDomain];

    id v5 = v10;
    if (v7)
    {
      id v8 = [v10 code];
      id v5 = v10;
      if (v8 == (id)201) {
        goto LABEL_6;
      }
      if (v8 == (id)402)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
        [v9 deleteAllItems];
        goto LABEL_8;
      }

      if (v8 == (id)401)
      {
LABEL_6:
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
        [v9 deleteAllSyncMetadataItems];
LABEL_8:

        id v5 = v10;
      }
    }
  }
}

- (id)mapInternalLibraryErrorToMediaLibrary:(id)a3 keyOverrides:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  unsigned __int8 v8 = [v7 isEqualToString:@"com.shazam.library"];

  if ((v8 & 1) != 0)
  {
    unint64_t v9 = (unint64_t)[v5 code];
    if (v9 > 8) {
      uint64_t v10 = 301LL;
    }
    else {
      uint64_t v10 = qword_1000522D0[v9];
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v12,  [v5 code],  0));

    char v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    [v14 setValue:v15 forKey:NSDebugDescriptionErrorKey];

    [v14 setValue:v13 forKey:NSUnderlyingErrorKey];
    if (v6) {
      [v14 addEntriesFromDictionary:v6];
    }
    uint64_t v16 = SHMediaLibraryErrorDomain;
    id v17 = [v14 copy];
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  v10,  v17));
  }

  else
  {
    id v11 = v5;
  }

  return v11;
}

- (void)finishLibrarySync
{
  uint64_t v3 = sh_log_object(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController syncID](self, "syncID"));
    int v6 = 138412290;
    unsigned int v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Media Library finished syncing. Sync ID: %@",  (uint8_t *)&v6,  0xCu);
  }

  -[SHMediaLibraryController setSyncID:](self, "setSyncID:", 0LL);
  -[SHMediaLibraryController setCurrentContext:](self, "setCurrentContext:", 0LL);
  -[SHMediaLibraryController setCurrentSnapshot:](self, "setCurrentSnapshot:", 0LL);
}

- (void)failedToSyncContext:(id)a3
{
  uint64_t v4 = SHMediaLibraryErrorDomain;
  NSErrorUserInfoKey v10 = NSDebugDescriptionErrorKey;
  id v11 = @"Failed to synchronize library. Try again later.";
  id v5 = a3;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  500LL,  v6));

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 snapshot]);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allItemIdentifiers]);
  -[SHMediaLibraryController handleLibraryError:failedItemIdentifiers:]( self,  "handleLibraryError:failedItemIdentifiers:",  v7,  v9);

  -[SHMediaLibraryController finishLibrarySync](self, "finishLibrarySync");
}

- (void)removeInvalidChangesFromSnapshot:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001F334;
  v10[3] = &unk_10006D550;
  objc_copyWeak(&v11, &location);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v10));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredSnapshotUsingPredicate:v5]);
  if ([v6 hasChanges])
  {
    NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
    char v14 = @"Items with invalid Shazam IDs are not supported.";
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SHMediaLibraryErrorDomain,  500LL,  v7));

    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 allItemIdentifiers]);
    -[SHMediaLibraryController handleLibraryError:failedItemIdentifiers:]( self,  "handleLibraryError:failedItemIdentifiers:",  v8,  v9);
  }

  [v4 removeSnapshot:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)libraryDataStore:(id)a3 didUpdateWithChange:(id)a4
{
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController currentSnapshot](self, "currentSnapshot"));
  id v8 = v5;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  [v6 addChanges:v7];
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v4 = NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"%@ is not supported by shazamd, please use synchronizeWithContext:",  v5);
}

- (SHMediaLibrarySyncDelegate)delegate
{
  return (SHMediaLibrarySyncDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHLShazamLibrary)remoteLibrary
{
  return self->_remoteLibrary;
}

- (void)setRemoteLibrary:(id)a3
{
}

- (SHMediaLibraryDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (SHMediaLibraryInfoFetcher)libraryInfoFetcher
{
  return self->_libraryInfoFetcher;
}

- (void)setLibraryInfoFetcher:(id)a3
{
}

- (SHMediaLibrarySnapshotUpdater)snapshotUpdater
{
  return self->_snapshotUpdater;
}

- (void)setSnapshotUpdater:(id)a3
{
}

- (SHMediaLibrarySnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (SHMediaLibrarySnapshot)syncSnapshot
{
  return self->_syncSnapshot;
}

- (void)setSyncSnapshot:(id)a3
{
}

- (SHMediaLibraryContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end