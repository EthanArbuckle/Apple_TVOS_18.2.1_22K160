@interface SagaSDKAddItemToPlaylistOperation
- (SagaSDKAddItemToPlaylistOperation)initWithCoder:(id)a3;
- (SagaSDKAddItemToPlaylistOperation)initWithConfiguration:(id)a3 itemSagaID:(unint64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSDKAddItemToPlaylistOperation

- (SagaSDKAddItemToPlaylistOperation)initWithConfiguration:(id)a3 itemSagaID:(unint64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SagaSDKAddItemToPlaylistOperation;
  v13 = -[SagaAddItemToPlaylistOperation initWithConfiguration:itemSagaID:playlistPersistentID:clientIdentity:]( &v18,  "initWithConfiguration:itemSagaID:playlistPersistentID:clientIdentity:",  a3,  a4,  a5,  a6);
  v14 = v13;
  if (v13)
  {
    v13->super._itemSagaID = a4;
    v13->super._playlistPersistentID = a5;
    id v15 = [v12 copy];
    itemSagaID = (void *)v14->_itemSagaID;
    v14->_itemSagaID = (unint64_t)v15;
  }

  return v14;
}

- (void)main
{
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaSDKAddItemToPlaylistOperation - (saga_id = %llu)",  self->super._itemSagaID));
  id v3 = [[MSVXPCTransaction alloc] initWithName:v46];
  [v3 beginTransaction];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v4 setClientIdentity:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v7 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  self->super._playlistPersistentID,  v6);
  if ([v7 existsInLibrary])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForProperty:ML3ContainerPropertyStoreCloudID]);
    id v9 = [v8 unsignedIntValue];

    if ((_DWORD)v9)
    {
      unsigned int v10 = [v6 sagaOnDiskDatabaseRevision];
      if (v10 <= 1) {
        int v11 = 1;
      }
      else {
        int v11 = v10;
      }
      unsigned int v44 = v11;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      uint64_t v12 = ML3TrackPropertyStoreSagaID;
      if (self->super._itemSagaID
        && (v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyStoreSagaID)),  v14 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:",  v6,  v13)),  v13,  v14))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[ICAddToLibraryRequest requestWithDatabaseID:databaseRevision:sagaID:containerID:]( ICAddToLibraryRequest,  "requestWithDatabaseID:databaseRevision:sagaID:containerID:",  [v45 databaseID],  v44,  self->super._itemSagaID,  v9));
        *(void *)&__int128 v58 = 0LL;
        *((void *)&v58 + 1) = &v58;
        uint64_t v59 = 0x3032000000LL;
        v60 = sub_100112D74;
        v61 = sub_100112D84;
        id v62 = 0LL;
        v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t itemSagaID = self->super._itemSagaID;
          *(_DWORD *)buf = 134218240;
          *(void *)v57 = itemSagaID;
          *(_WORD *)&v57[8] = 1024;
          *(_DWORD *)&v57[10] = (_DWORD)v9;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Appending cloud-id %lld to playlist with cloud-id %u",  buf,  0x12u);
        }

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_100113944;
        v52[3] = &unk_1001A6EA0;
        v54 = &v58;
        objc_super v18 = dispatch_semaphore_create(0LL);
        v53 = v18;
        [v45 sendRequest:v15 withResponseHandler:v52];
        dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
        v19 = *(void **)(*((void *)&v58 + 1) + 40LL);
        if (v19)
        {
          unsigned __int8 v20 = [v19 updateRequired];
          uint64_t v21 = (uint64_t)[*(id *)(*((void *)&v58 + 1) + 40) responseCode];
        }

        else
        {
          uint64_t v21 = 0LL;
          unsigned __int8 v20 = 0;
        }

        _Block_object_dispose(&v58, 8);
        if ((v20 & 1) == 0)
        {
LABEL_29:
          v35 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v58) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Skipping library update because the response did not contain update-required flag",  (uint8_t *)&v58,  2u);
          }

          goto LABEL_31;
        }
      }

      else
      {
        v24 = objc_alloc_init(&OBJC_CLASS___ICCloudItemIDList);
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track containerQueryWithContainer:]( &OBJC_CLASS___ML3Track,  "containerQueryWithContainer:",  v7));
        uint64_t v55 = v12;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_100113990;
        v50[3] = &unk_1001A6EC8;
        v26 = v24;
        v51 = v26;
        [v43 enumeratePersistentIDsAndProperties:v25 usingBlock:v50];

        -[ICCloudItemIDList addCloudItemID:idType:](v26, "addCloudItemID:idType:", self->super._itemSagaID, 0LL);
        v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKey:]( v27,  "setObject:forKey:",  self->_itemSagaID,  ML3ContainerPropertyExternalVendorIdentifier);

        v28 = (void *)objc_claimAutoreleasedReturnValue( +[ICSetContainerPropertiesRequest requestWithDatabaseID:databaseRevision:containerID:trackList:properties:]( ICSetContainerPropertiesRequest,  "requestWithDatabaseID:databaseRevision:containerID:trackList:properties:",  [v45 databaseID],  v44,  v9,  v26,  0));
        *(void *)&__int128 v58 = 0LL;
        *((void *)&v58 + 1) = &v58;
        uint64_t v59 = 0x3032000000LL;
        v60 = sub_100112D74;
        v61 = sub_100112D84;
        id v62 = 0LL;
        v29 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v57 = (_DWORD)v9;
          *(_WORD *)&v57[4] = 2114;
          *(void *)&v57[6] = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Updating playlist with cloud-id %u, setting trackList: %{public}@",  buf,  0x12u);
        }

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_1001139E8;
        v47[3] = &unk_1001A6EA0;
        v49 = &v58;
        v30 = dispatch_semaphore_create(0LL);
        v48 = v30;
        [v45 sendRequest:v28 withResponseHandler:v47];
        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
        v31 = *(void **)(*((void *)&v58 + 1) + 40LL);
        if (v31)
        {
          unsigned int v32 = [v31 updateRequired];
          uint64_t v21 = (uint64_t)[*(id *)(*((void *)&v58 + 1) + 40) responseCode];
        }

        else
        {
          uint64_t v21 = 0LL;
          unsigned int v32 = 0;
        }

        _Block_object_dispose(&v58, 8);
        v14 = 0LL;
        if (!v32) {
          goto LABEL_29;
        }
      }

      v34 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v58) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Requesting library update because the response contained update-required flag",  (uint8_t *)&v58,  2u);
      }

      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v35));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
      [v36 updateSagaLibraryWithClientIdentity:v37 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];

LABEL_31:
      if (v21 > 399)
      {
        if (v21 == 404 || v21 == 400)
        {
          uint64_t v38 = 3LL;
LABEL_39:
          -[CloudLibraryOperation setStatus:](self, "setStatus:", v38);

          goto LABEL_40;
        }
      }

      else
      {
        uint64_t v38 = 1LL;
        if (v21 == 200 || v21 == 204) {
          goto LABEL_39;
        }
      }

      uint64_t v38 = 2LL;
      goto LABEL_39;
    }

    v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int64_t playlistPersistentID = self->super._playlistPersistentID;
      LODWORD(v58) = 134217984;
      *(void *)((char *)&v58 + 4) = playlistPersistentID;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld does not have a cloud_id in the database, skipping save to cloud library.",  (uint8_t *)&v58,  0xCu);
    }
  }

  else
  {
    v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v23 = self->super._playlistPersistentID;
      LODWORD(v58) = 134217984;
      *(void *)((char *)&v58 + 4) = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld is not in the database, skipping save to cloud library.",  (uint8_t *)&v58,  0xCu);
    }
  }

  -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
LABEL_40:
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v41 = MSVTCCIdentityForCurrentProcess(v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  [v39 setClientIdentity:v42];

  [v3 endTransaction];
}

- (SagaSDKAddItemToPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SagaSDKAddItemToPlaylistOperation;
  v6 = -[SagaAddItemToPlaylistOperation initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"RequestingBundleKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    unint64_t itemSagaID = (void *)v6->_itemSagaID;
    v6->_unint64_t itemSagaID = v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaSDKAddItemToPlaylistOperation;
  id v4 = a3;
  -[SagaAddItemToPlaylistOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemSagaID, @"RequestingBundleKey", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end