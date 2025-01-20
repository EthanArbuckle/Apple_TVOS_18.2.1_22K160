@interface SagaImporter
- (BOOL)_updateGlobalPlaylistsFromContainersPayloadAtPath:(id)a3 downloadPathForSubscribedContainersPayload:(id)a4;
- (BOOL)isCancelled;
- (CloudLibraryConnection)connection;
- (ICConnectionConfiguration)configuration;
- (SagaImporter)initWithConnection:(id)a3 serverInitiatedReset:(BOOL)a4 clientInitiatedReset:(BOOL)a5 clientFeaturesVersion:(id)a6 clientIdentity:(id)a7 fromRevision:(unsigned int)a8 toRevision:(unsigned int)a9;
- (float)progress;
- (id)_importDataFromResponseFileURLs:(id)a3;
- (id)description;
- (void)_fetchUpdatedAlbumsWithCompletion:(id)a3;
- (void)_fetchUpdatedAlbumsWithPaginationToken:(id)a3 responseFileURLs:(id)a4 completion:(id)a5;
- (void)_fetchUpdatedArtistsWithCompletion:(id)a3;
- (void)_fetchUpdatedArtistsWithPaginationToken:(id)a3 responseFileURLs:(id)a4 completion:(id)a5;
- (void)_fetchUpdatedPlaylistsWithCompletion:(id)a3;
- (void)_fetchUpdatedTracksWithCompletion:(id)a3;
- (void)_fetchUpdatedTracksWithPaginationToken:(id)a3 responseFileURLs:(id)a4 currentIncludesBookmarkable:(BOOL)a5 cloudIDToLyricsTokenMap:(id)a6 completion:(id)a7;
- (void)_importLyricsWithLyricsTokenMap:(id)a3;
- (void)_removeUnavailableSubscriptionAssetsInLibrary:(id)a3;
- (void)_updateProgressWithItemsProgress:(float)itemsProgress albumsProgress:(float)albumsProgress artistsProgress:(float)artistsProgress playlistProgress:(float)playlistProgress importerProgress:(float)a7;
- (void)cancel;
- (void)performUpdateWithCompletionHandler:(id)a3;
@end

@implementation SagaImporter

- (SagaImporter)initWithConnection:(id)a3 serverInitiatedReset:(BOOL)a4 clientInitiatedReset:(BOOL)a5 clientFeaturesVersion:(id)a6 clientIdentity:(id)a7 fromRevision:(unsigned int)a8 toRevision:(unsigned int)a9
{
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  if (!v17)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v34 handleFailureInMethod:a2, self, @"SagaImporter.m", 64, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }

  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___SagaImporter;
  v20 = -[SagaImporter init](&v35, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_connection, a3);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v17 configuration]);
    configuration = v21->_configuration;
    v21->_configuration = (ICConnectionConfiguration *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v17 userIdentity]);
    userIdentity = v21->_userIdentity;
    v21->_userIdentity = (ICUserIdentity *)v24;

    v21->_clientInitiatedReset = a5;
    v21->_serverInitiatedReset = a4;
    v21->_fromRevision = a8;
    v21->_toRevision = a9;
    v21->_lock._os_unfair_lock_opaque = 0;
    v26 = NSTemporaryDirectory();
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v36[0] = v27;
    v36[1] = @"com.apple.MediaServices";
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
    v36[2] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 3LL));
    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v30));
    updateBaseDirectory = v21->_updateBaseDirectory;
    v21->_updateBaseDirectory = (NSString *)v31;

    objc_storeStrong((id *)&v21->_clientFeaturesVersionString, a6);
  }

  return v21;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p [identity=%@, serverInitiatedReset=%d, clientInitiatedReset=%d, revision %u --> %u]>",  objc_opt_class(self, a2),  self,  self->_userIdentity,  self->_serverInitiatedReset,  self->_clientInitiatedReset,  self->_fromRevision,  self->_toRevision);
}

- (void)cancel
{
  self->_isCancelled = 1;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MLMediaLibraryService sharedMediaLibraryService]( &OBJC_CLASS___MLMediaLibraryService,  "sharedMediaLibraryService"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009FB84;
  v5[3] = &unk_1001A5AC0;
  dispatch_semaphore_t v6 = v2;
  v4 = v2;
  [v3 cancelImportOperation:2 completionHandler:v5];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)performUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL serverInitiatedReset = self->_serverInitiatedReset;
    BOOL clientInitiatedReset = self->_clientInitiatedReset;
    clientFeaturesVersionString = self->_clientFeaturesVersionString;
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = serverInitiatedReset;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = clientInitiatedReset;
    LOWORD(v57) = 2114;
    *(void *)((char *)&v57 + 2) = clientFeaturesVersionString;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Performing saga update - serverInitiatedReset=%{BOOL}u, clientInitiatedReset=%{BOOL}u, clientFeaturesVe rsionString=%{public}@",  buf,  0x22u);
  }

  self->_progress = 0.0;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&__int128 v57 = sub_10009EC40;
  *((void *)&v57 + 1) = sub_10009EC50;
  id v58 = 0LL;
  v54[0] = 0LL;
  v54[1] = v54;
  v54[2] = 0x3032000000LL;
  v54[3] = sub_10009EC40;
  v54[4] = sub_10009EC50;
  id v55 = 0LL;
  v52[0] = 0LL;
  v52[1] = v52;
  v52[2] = 0x3032000000LL;
  v52[3] = sub_10009EC40;
  v52[4] = sub_10009EC50;
  id v53 = 0LL;
  id v49 = 0LL;
  v50[0] = 0LL;
  v50[1] = v50;
  v50[2] = 0x3032000000LL;
  v50[3] = sub_10009EC40;
  v50[4] = sub_10009EC50;
  id v51 = 0LL;
  v48[0] = 0LL;
  v48[1] = v48;
  v48[2] = 0x3032000000LL;
  v48[3] = sub_10009EC40;
  v48[4] = sub_10009EC50;
  v46[0] = 0LL;
  v46[1] = v46;
  v46[2] = 0x2020000000LL;
  char v47 = 0;
  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x3032000000LL;
  v44[3] = sub_10009EC40;
  v44[4] = sub_10009EC50;
  id v45 = 0LL;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10009EC58;
  v38[3] = &unk_1001A4328;
  v38[4] = self;
  v40 = buf;
  v41 = v50;
  v42 = v46;
  v43 = v44;
  v10 = v9;
  v39 = v10;
  -[SagaImporter _fetchUpdatedTracksWithCompletion:](self, "_fetchUpdatedTracksWithCompletion:", v38);
  dispatch_group_enter(v10);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10009ED40;
  v34[3] = &unk_1001A4350;
  v34[4] = self;
  v36 = buf;
  v37 = v52;
  v11 = v10;
  objc_super v35 = v11;
  -[SagaImporter _fetchUpdatedAlbumsWithCompletion:](self, "_fetchUpdatedAlbumsWithCompletion:", v34);
  dispatch_group_enter(v11);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10009EDE4;
  v30[3] = &unk_1001A4350;
  v30[4] = self;
  v32 = buf;
  v33 = v54;
  v12 = v11;
  uint64_t v31 = v12;
  -[SagaImporter _fetchUpdatedArtistsWithCompletion:](self, "_fetchUpdatedArtistsWithCompletion:", v30);
  dispatch_group_enter(v12);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10009EE88;
  v26[3] = &unk_1001A4378;
  v26[4] = self;
  v28 = buf;
  v29 = v48;
  v13 = v12;
  v27 = v13;
  -[SagaImporter _fetchUpdatedPlaylistsWithCompletion:](self, "_fetchUpdatedPlaylistsWithCompletion:", v26);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009EF2C;
  block[3] = &unk_1001A43C8;
  block[4] = self;
  id v18 = v4;
  id v19 = buf;
  v20 = v50;
  v21 = v48;
  uint64_t v22 = v54;
  v23 = v52;
  uint64_t v24 = v44;
  v25 = v46;
  id v16 = v4;
  dispatch_group_notify(v13, v15, block);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_updateProgressWithItemsProgress:(float)itemsProgress albumsProgress:(float)albumsProgress artistsProgress:(float)artistsProgress playlistProgress:(float)playlistProgress importerProgress:(float)a7
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (itemsProgress == 0.0) {
    itemsProgress = self->_itemsProgress;
  }
  self->_itemsProgress = itemsProgress;
  if (albumsProgress == 0.0) {
    albumsProgress = self->_albumsProgress;
  }
  self->_albumsProgress = albumsProgress;
  if (artistsProgress == 0.0) {
    artistsProgress = self->_artistsProgress;
  }
  self->_artistsProgress = artistsProgress;
  if (playlistProgress == 0.0) {
    playlistProgress = self->_playlistProgress;
  }
  self->_playlistProgress = playlistProgress;
  float importerProgress = a7;
  if (a7 == 0.0) {
    float importerProgress = self->_importerProgress;
  }
  self->_float importerProgress = importerProgress;
  self->_progress = (float)((float)((float)((float)((float)(albumsProgress * 10.0) + (float)(itemsProgress * 10.0))
                                          + (float)(artistsProgress * 10.0))
                                  + (float)(playlistProgress * 10.0))
  os_unfair_lock_unlock(p_lock);
}

- (void)_removeUnavailableSubscriptionAssetsInLibrary:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009E7C0;
  v5[3] = &unk_1001A64D0;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [v4 performDatabaseTransactionWithBlock:v5];
}

- (void)_importLyricsWithLyricsTokenMap:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 allKeys]);
  id v4 = objc_alloc(&OBJC_CLASS___SagaLoadLyricsOperation);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SagaImporter configuration](self, "configuration"));
  id v6 = -[SagaLoadLyricsOperation initWithConfiguration:clientIdentity:sagaIDs:]( v4,  "initWithConfiguration:clientIdentity:sagaIDs:",  v5,  self->_clientIdentity,  v9);

  -[SagaLoadLyricsOperation setName:](v6, "setName:", @"com.apple.itunescloudd.SagaImporter.loadLyricsOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SagaImporter configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v7));
  [v8 addBackgroundOperation:v6 forLibraryType:1 priority:1];
}

- (BOOL)_updateGlobalPlaylistsFromContainersPayloadAtPath:(id)a3 downloadPathForSubscribedContainersPayload:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithURL:](&OBJC_CLASS___NSInputStream, "inputStreamWithURL:", v7));
  id v9 = [[DKDAAPParser alloc] initWithStream:v8];
  v10 = objc_alloc_init(&OBJC_CLASS___ContainerCloudIDsParserDelegate);
  [v9 setDelegate:v10];
  [v9 parse];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerCloudIDsParserDelegate subscribedPlaylistCloudIDs](v10, "subscribedPlaylistCloudIDs"));

  v12 = objc_alloc(&OBJC_CLASS___SagaSubscribedPlaylistUpdater);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SagaImporter connection](self, "connection"));
  v14 = -[SagaSubscribedPlaylistUpdater initWithSubscribedPlaylistCloudIDs:cloudLibraryConnection:]( v12,  "initWithSubscribedPlaylistCloudIDs:cloudLibraryConnection:",  v11,  v13);

  -[SagaSubscribedPlaylistUpdater setPayloadDownloadPathOverride:](v14, "setPayloadDownloadPathOverride:", v6);
  -[SagaSubscribedPlaylistUpdater setIgnoreMinRefreshInterval:](v14, "setIgnoreMinRefreshInterval:", 1LL);
  clientIdentity = self->_clientIdentity;
  id v20 = 0LL;
  unsigned __int8 v16 = -[SagaSubscribedPlaylistUpdater performUpdateWithClientIdentity:error:]( v14,  "performUpdateWithClientIdentity:error:",  clientIdentity,  &v20);
  id v17 = v20;
  if ((v16 & 1) == 0)
  {
    id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = self;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@ Error updating global playlists: %{public}@",  buf,  0x16u);
    }
  }

  return v16;
}

- (id)_importDataFromResponseFileURLs:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "msv_map:", &stru_1001A4430));
  uint64_t v4 = ML3DatabaseImportDataForDAAPFilePaths();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (void)_fetchUpdatedTracksWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting items update",  (uint8_t *)&v8,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[SagaImporter _fetchUpdatedTracksWithPaginationToken:responseFileURLs:currentIncludesBookmarkable:cloudIDToLyricsTokenMap:completion:]( self,  "_fetchUpdatedTracksWithPaginationToken:responseFileURLs:currentIncludesBookmarkable:cloudIDToLyricsTokenMap:completion:",  0LL,  v6,  0LL,  v7,  v4);
}

- (void)_fetchUpdatedTracksWithPaginationToken:(id)a3 responseFileURLs:(id)a4 currentIncludesBookmarkable:(BOOL)a5 cloudIDToLyricsTokenMap:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SagaImporter connection](self, "connection"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_updateBaseDirectory,  "stringByAppendingPathComponent:",  @"Items"));
  v39 = v16;
  uint64_t v40 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"items_%lu.daap",  (char *)[v11 count] + 1));
  uint64_t v31 = (void *)v40;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 2LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v17));

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[ICItemsRequest requestWithDatabaseID:paginationToken:]( ICItemsRequest,  "requestWithDatabaseID:paginationToken:",  [v15 databaseID],  v14));
  [v19 setValue:@"all" forArgument:@"meta"];
  unsigned int fromRevision = self->_fromRevision;
  if (fromRevision)
  {
    uint64_t toRevision = self->_toRevision;
    if (toRevision > fromRevision)
    {
      if (self->_serverInitiatedReset)
      {
        uint64_t v22 = &OBJC_CLASS___MSVAutoBugCapture_ptr;
      }

      else
      {
        uint64_t v22 = &OBJC_CLASS___MSVAutoBugCapture_ptr;
        if (!self->_clientInitiatedReset)
        {
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  self->_fromRevision));
          [v19 setValue:v23 forArgument:@"delta"];

          uint64_t toRevision = self->_toRevision;
        }
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[47], "stringWithFormat:", @"%u", toRevision));
      [v19 setValue:v24 forArgument:@"revision-id"];
    }
  }

  [v19 setSagaClientFeaturesVersion:self->_clientFeaturesVersionString];
  [v19 setResponseDataDestinationFileURL:v18];
  [v19 setAllowedRetryCount:5];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10009E18C;
  v32[3] = &unk_1001A4458;
  v32[4] = self;
  id v33 = v18;
  id v34 = v11;
  id v35 = v16;
  BOOL v38 = a5;
  id v36 = v12;
  id v37 = v13;
  id v25 = v12;
  id v26 = v16;
  id v27 = v11;
  id v28 = v18;
  id v29 = v13;
  [v15 sendRequest:v19 withResponseHandler:v32];
}

- (void)_fetchUpdatedPlaylistsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting playlists update",  buf,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SagaImporter connection](self, "connection"));
  v23[0] = self->_updateBaseDirectory;
  v23[1] = @"containers.daap";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  self->_userIdentity));
  [v9 setClientIdentity:self->_clientIdentity];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForDatabaseProperty:@"MLCloudNeedsContainerRefetch"]);
  unsigned int v11 = [v10 BOOLValue];

  if (v11) {
    [v9 setValue:0 forDatabaseProperty:@"MLCloudNeedsContainerRefetch"];
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICContainersRequest requestWithDatabaseID:]( ICContainersRequest,  "requestWithDatabaseID:",  [v6 databaseID]));
  unsigned int fromRevision = self->_fromRevision;
  if (fromRevision)
  {
    uint64_t toRevision = self->_toRevision;
    char v15 = toRevision <= fromRevision ? 1 : v11;
    if ((v15 & 1) == 0)
    {
      if (!self->_serverInitiatedReset && !self->_clientInitiatedReset)
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  self->_fromRevision));
        [v12 setValue:v16 forArgument:@"delta"];

        uint64_t toRevision = self->_toRevision;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  toRevision));
      [v12 setValue:v17 forArgument:@"revision-id"];
    }
  }

  [v12 setSagaClientFeaturesVersion:self->_clientFeaturesVersionString];
  [v12 setValue:@"daap.playlistsongs" forArgument:@"meta"];
  [v12 setResponseDataDestinationFileURL:v8];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10009DEF4;
  v20[3] = &unk_1001A4480;
  id v21 = v8;
  id v22 = v4;
  v20[4] = self;
  id v18 = v8;
  id v19 = v4;
  [v6 sendRequest:v12 withResponseHandler:v20];
}

- (void)_fetchUpdatedAlbumsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting albums update",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[SagaImporter _fetchUpdatedAlbumsWithPaginationToken:responseFileURLs:completion:]( self,  "_fetchUpdatedAlbumsWithPaginationToken:responseFileURLs:completion:",  0LL,  v6,  v4);
}

- (void)_fetchUpdatedAlbumsWithPaginationToken:(id)a3 responseFileURLs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SagaImporter connection](self, "connection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_updateBaseDirectory,  "stringByAppendingPathComponent:",  @"Albums"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"albums_%lu.daap",  (char *)[v9 count] + 1));
  v30[0] = v12;
  v30[1] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  char v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v14));

  unsigned __int8 v16 = -[ICAlbumsRequest initWithDatabaseID:paginationToken:]( [ICAlbumsRequest alloc],  "initWithDatabaseID:paginationToken:",  [v11 databaseID],  v8);
  unsigned int fromRevision = self->_fromRevision;
  if (fromRevision)
  {
    uint64_t toRevision = self->_toRevision;
    if (toRevision > fromRevision)
    {
      if (!self->_serverInitiatedReset && !self->_clientInitiatedReset)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  self->_fromRevision));
        -[ICDRequest setValue:forArgument:](v16, "setValue:forArgument:", v19, @"delta");

        uint64_t toRevision = self->_toRevision;
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  toRevision));
      -[ICDRequest setValue:forArgument:](v16, "setValue:forArgument:", v20, @"revision-id");
    }
  }

  if ([v8 length]) {
    -[ICDRequest setValue:forArgument:](v16, "setValue:forArgument:", v8, @"dmap.paginationtoken");
  }
  -[ICDRequest setSagaClientFeaturesVersion:](v16, "setSagaClientFeaturesVersion:", self->_clientFeaturesVersionString);
  -[ICDRequest setResponseDataDestinationFileURL:](v16, "setResponseDataDestinationFileURL:", v15);
  -[ICDRequest setAllowedRetryCount:](v16, "setAllowedRetryCount:", 5LL);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10009D960;
  v25[3] = &unk_1001A44A8;
  id v28 = v12;
  id v29 = v10;
  v25[4] = self;
  id v26 = v15;
  id v27 = v9;
  id v21 = v12;
  id v22 = v9;
  id v23 = v15;
  id v24 = v10;
  [v11 sendRequest:v16 withResponseHandler:v25];
}

- (void)_fetchUpdatedArtistsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting artist update",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[SagaImporter _fetchUpdatedArtistsWithPaginationToken:responseFileURLs:completion:]( self,  "_fetchUpdatedArtistsWithPaginationToken:responseFileURLs:completion:",  0LL,  v6,  v4);
}

- (void)_fetchUpdatedArtistsWithPaginationToken:(id)a3 responseFileURLs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SagaImporter connection](self, "connection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_updateBaseDirectory,  "stringByAppendingPathComponent:",  @"Artists"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"artists_%lu.daap",  (char *)[v9 count] + 1));
  v30[0] = v12;
  v30[1] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  char v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v14));

  unsigned __int8 v16 = -[ICArtistsRequest initWithDatabaseID:paginationToken:]( [ICArtistsRequest alloc],  "initWithDatabaseID:paginationToken:",  [v11 databaseID],  v8);
  unsigned int fromRevision = self->_fromRevision;
  if (fromRevision)
  {
    uint64_t toRevision = self->_toRevision;
    if (toRevision > fromRevision)
    {
      if (!self->_serverInitiatedReset && !self->_clientInitiatedReset)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  self->_fromRevision));
        -[ICDRequest setValue:forArgument:](v16, "setValue:forArgument:", v19, @"delta");

        uint64_t toRevision = self->_toRevision;
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  toRevision));
      -[ICDRequest setValue:forArgument:](v16, "setValue:forArgument:", v20, @"revision-id");
    }
  }

  if ([v8 length]) {
    -[ICDRequest setValue:forArgument:](v16, "setValue:forArgument:", v8, @"dmap.paginationtoken");
  }
  -[ICDRequest setSagaClientFeaturesVersion:](v16, "setSagaClientFeaturesVersion:", self->_clientFeaturesVersionString);
  -[ICDRequest setResponseDataDestinationFileURL:](v16, "setResponseDataDestinationFileURL:", v15);
  -[ICDRequest setAllowedRetryCount:](v16, "setAllowedRetryCount:", 5LL);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10009D3EC;
  v25[3] = &unk_1001A44A8;
  id v28 = v12;
  id v29 = v10;
  v25[4] = self;
  id v26 = v15;
  id v27 = v9;
  id v21 = v12;
  id v22 = v9;
  id v23 = v15;
  id v24 = v10;
  [v11 sendRequest:v16 withResponseHandler:v25];
}

- (CloudLibraryConnection)connection
{
  return self->_connection;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end