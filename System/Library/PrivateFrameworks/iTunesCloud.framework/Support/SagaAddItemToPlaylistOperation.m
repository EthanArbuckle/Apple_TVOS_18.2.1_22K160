@interface SagaAddItemToPlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaAddItemToPlaylistOperation)initWithCoder:(id)a3;
- (SagaAddItemToPlaylistOperation)initWithConfiguration:(id)a3 itemSagaID:(unint64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6;
- (SagaAddItemToPlaylistOperation)initWithItemSagaID:(unint64_t)a3 playlistPersistentID:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaAddItemToPlaylistOperation

- (SagaAddItemToPlaylistOperation)initWithItemSagaID:(unint64_t)a3 playlistPersistentID:(int64_t)a4
{
  v7 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, a2);
  uint64_t v9 = MSVTCCIdentityForCurrentProcess(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = -[SagaAddItemToPlaylistOperation initWithConfiguration:itemSagaID:playlistPersistentID:clientIdentity:]( self,  "initWithConfiguration:itemSagaID:playlistPersistentID:clientIdentity:",  v7,  a3,  a4,  v10);

  return v11;
}

- (SagaAddItemToPlaylistOperation)initWithConfiguration:(id)a3 itemSagaID:(unint64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SagaAddItemToPlaylistOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v9,  "initWithConfiguration:clientIdentity:",  a3,  a6);
  if (result)
  {
    result->super._status = a4;
    result->super._error = (NSError *)a5;
  }

  return result;
}

- (SagaAddItemToPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaAddItemToPlaylistOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {
    v5->super._status = (int64_t)[v4 decodeInt64ForKey:@"ItemSagaIDKey"];
    v5->super._error = (NSError *)[v4 decodeInt64ForKey:@"PlaylistPersistentIDKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaAddItemToPlaylistOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->super._status, @"ItemSagaIDKey", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->super._error forKey:@"PlaylistPersistentIDKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaAddItemToPlaylistOperation - (saga_id = %llu)",  self->super._status));
  id v3 = [[MSVXPCTransaction alloc] initWithName:v44];
  [v3 beginTransaction];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v4 setClientIdentity:v5];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v6 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  self->super._error,  v45);
  if ([v6 existsInLibrary])
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:ML3ContainerPropertyStoreCloudID]);
    id v8 = [v7 unsignedIntValue];

    if ((_DWORD)v8)
    {
      unsigned int v9 = [v45 sagaOnDiskDatabaseRevision];
      if (v9 <= 1) {
        uint64_t v10 = 1LL;
      }
      else {
        uint64_t v10 = v9;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      uint64_t v11 = ML3TrackPropertyStoreSagaID;
      if (self->super._status
        && (v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyStoreSagaID)),  v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:",  v45,  v12)),  v12,  v13))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[ICAddToLibraryRequest requestWithDatabaseID:databaseRevision:sagaID:containerID:]( ICAddToLibraryRequest,  "requestWithDatabaseID:databaseRevision:sagaID:containerID:",  [v43 databaseID],  v10,  self->super._status,  v8));
        *(void *)&__int128 v65 = 0LL;
        *((void *)&v65 + 1) = &v65;
        uint64_t v66 = 0x3032000000LL;
        v67 = sub_100112D74;
        v68 = sub_100112D84;
        id v69 = 0LL;
        uint64_t v56 = 0LL;
        v57 = &v56;
        uint64_t v58 = 0x3032000000LL;
        v59 = sub_100112D74;
        v60 = sub_100112D84;
        id v61 = 0LL;
        v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int64_t status = self->super._status;
          *(_DWORD *)buf = 134218240;
          *(void *)v64 = status;
          *(_WORD *)&v64[8] = 1024;
          *(_DWORD *)&v64[10] = (_DWORD)v8;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Appending cloud-id %lld to playlist with cloud-id %u",  buf,  0x12u);
        }

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_100112D8C;
        v52[3] = &unk_1001A6E78;
        v54 = &v65;
        v55 = &v56;
        v17 = dispatch_semaphore_create(0LL);
        v53 = v17;
        [v43 sendRequest:v14 withResponseHandler:v52];
        dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v18 = *((void *)&v65 + 1);
        if (v57[5] || (v33 = *(void **)(*((void *)&v65 + 1) + 40LL)) == 0LL)
        {
          unsigned int v19 = 0;
        }

        else
        {
          unsigned int v19 = [v33 updateRequired];
          uint64_t v18 = *((void *)&v65 + 1);
        }

        uint64_t v32 = (uint64_t)[*(id *)(v18 + 40) responseCode];

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v65, 8);
      }

      else
      {
        v22 = objc_alloc_init(&OBJC_CLASS___ICCloudItemIDList);
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track containerQueryWithContainer:]( &OBJC_CLASS___ML3Track,  "containerQueryWithContainer:",  v6));
        uint64_t v62 = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v62, 1LL));
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_100112E14;
        v50[3] = &unk_1001A6EC8;
        v25 = v22;
        v51 = v25;
        [v23 enumeratePersistentIDsAndProperties:v24 usingBlock:v50];

        v26 = (void *)objc_claimAutoreleasedReturnValue( +[ICSetContainerPropertiesRequest requestWithDatabaseID:databaseRevision:containerID:trackList:properties:]( ICSetContainerPropertiesRequest,  "requestWithDatabaseID:databaseRevision:containerID:trackList:properties:",  [v43 databaseID],  v10,  v8,  v25,  0));
        *(void *)&__int128 v65 = 0LL;
        *((void *)&v65 + 1) = &v65;
        uint64_t v66 = 0x3032000000LL;
        v67 = sub_100112D74;
        v68 = sub_100112D84;
        id v69 = 0LL;
        uint64_t v56 = 0LL;
        v57 = &v56;
        uint64_t v58 = 0x3032000000LL;
        v59 = sub_100112D74;
        v60 = sub_100112D84;
        id v61 = 0LL;
        v27 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v64 = (_DWORD)v8;
          *(_WORD *)&v64[4] = 2114;
          *(void *)&v64[6] = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Updating playlist with cloud-id %u, setting trackList: %{public}@",  buf,  0x12u);
        }

        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_100112E6C;
        v46[3] = &unk_1001A6E78;
        v48 = &v65;
        v49 = &v56;
        v28 = dispatch_semaphore_create(0LL);
        v47 = v28;
        [v43 sendRequest:v26 withResponseHandler:v46];
        dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v29 = *((void *)&v65 + 1);
        if (v57[5] || (v31 = *(void **)(*((void *)&v65 + 1) + 40LL)) == 0LL)
        {
          unsigned int v19 = 0;
        }

        else
        {
          unsigned int v19 = [v31 updateRequired];
          uint64_t v29 = *((void *)&v65 + 1);
        }

        uint64_t v32 = (uint64_t)[*(id *)(v29 + 40) responseCode];

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v65, 8);

        v13 = 0LL;
      }

      if (v19)
      {
        v34 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v65) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Requesting library update because the response contained update-required flag",  (uint8_t *)&v65,  2u);
        }

        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v35));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
        [v36 updateSagaLibraryWithClientIdentity:v37 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];
      }

      else
      {
        v35 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v65) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Skipping library update because the response did not contain update-required flag",  (uint8_t *)&v65,  2u);
        }
      }

      if (v32 > 399)
      {
        if (v32 == 404 || v32 == 400)
        {
          uint64_t v38 = 3LL;
LABEL_42:
          -[CloudLibraryOperation setStatus:](self, "setStatus:", v38);

          goto LABEL_43;
        }
      }

      else
      {
        uint64_t v38 = 1LL;
        if (v32 == 200 || v32 == 204) {
          goto LABEL_42;
        }
      }

      uint64_t v38 = 2LL;
      goto LABEL_42;
    }

    v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      error = self->super._error;
      LODWORD(v65) = 134217984;
      *(void *)((char *)&v65 + 4) = error;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld does not have a cloud_id in the database, skipping save to cloud library.",  (uint8_t *)&v65,  0xCu);
    }
  }

  else
  {
    v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->super._error;
      LODWORD(v65) = 134217984;
      *(void *)((char *)&v65 + 4) = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld is not in the database, skipping save to cloud library.",  (uint8_t *)&v65,  0xCu);
    }
  }

  -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
LABEL_43:
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v41 = MSVTCCIdentityForCurrentProcess(v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  [v39 setClientIdentity:v42];

  [v3 endTransaction];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end