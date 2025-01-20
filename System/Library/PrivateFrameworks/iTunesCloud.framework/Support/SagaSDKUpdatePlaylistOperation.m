@interface SagaSDKUpdatePlaylistOperation
- (SagaSDKUpdatePlaylistOperation)initWithCoder:(id)a3;
- (SagaSDKUpdatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7 requestingBundleID:(id)a8;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSDKUpdatePlaylistOperation

- (SagaSDKUpdatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7 requestingBundleID:(id)a8
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SagaSDKUpdatePlaylistOperation;
  v16 = -[SagaUpdatePlaylistOperation initWithClientIdentity:playlistPersistentID:properties:trackList:]( &v25,  "initWithClientIdentity:playlistPersistentID:properties:trackList:",  a4,  a5,  v13,  v14);
  v17 = v16;
  if (v16)
  {
    *(void *)(v16 + 121) = a5;
    id v18 = [v13 copy];
    v19 = *(void **)(v17 + 129);
    *(void *)(v17 + 129) = v18;

    id v20 = [v14 copy];
    v21 = *(void **)(v17 + 137);
    *(void *)(v17 + 137) = v20;

    id v22 = [v15 copy];
    v23 = *(void **)(v17 + 113);
    *(void *)(v17 + 113) = v22;
  }

  return (SagaSDKUpdatePlaylistOperation *)v17;
}

- (void)main
{
  context = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaUpdatePlaylistOperation - (playlist_persistent_id = %lld)",  *(ICCloudItemIDList **)((char *)&self->super._trackList + 1)));
  id v4 = [[MSVXPCTransaction alloc] initWithName:v3];
  [v4 beginTransaction];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v5 setClientIdentity:v6];

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v7 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  *(ICCloudItemIDList **)((char *)&self->super._trackList + 1),  v55);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForProperty:ML3ContainerPropertyExternalVendorIdentifier]);
  v9 = v8;
  if (v8
    && [v8 isEqualToString:*(NSDictionary **)((char *)&self->super._properties + 1)])
  {
    if (![v7 existsInLibrary])
    {
      v31 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(uint64_t *)((char *)&self->super._trackList + 1);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld is not in the database, skipping save to cloud library.",  buf,  0xCu);
      }

      -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
      goto LABEL_40;
    }

    uint64_t v10 = ML3ContainerPropertyStoreCloudID;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForProperty:ML3ContainerPropertyStoreCloudID]);
    v12 = v3;
    unsigned int v13 = [v11 unsignedIntValue];

    unsigned int v52 = v13;
    if (!v13)
    {
      v33 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = *(uint64_t *)((char *)&self->super._trackList + 1);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld does not have a cloud_id in the database, skipping save to cloud library.",  buf,  0xCu);
      }

      v3 = v12;
      -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
      goto LABEL_40;
    }

    uint64_t v14 = ML3ContainerPropertyParentPersistentID;
    v53 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(&self->super._libraryUpdateRequired + 1) objectForKey:ML3ContainerPropertyParentPersistentID]);
    v3 = v12;
    if (!v53)
    {
LABEL_26:
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
      unsigned int v38 = [v37 sagaOnDiskDatabaseRevision];

      if (v38 <= 1) {
        uint64_t v39 = 1LL;
      }
      else {
        uint64_t v39 = v38;
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[ICSetContainerPropertiesRequest requestWithDatabaseID:databaseRevision:containerID:trackList:properties:]( ICSetContainerPropertiesRequest,  "requestWithDatabaseID:databaseRevision:containerID:trackList:properties:",  [v40 databaseID],  v39,  v52,  *(NSString **)((char *)&self->_requestingBundleID + 1),  *(void *)(&self->super._libraryUpdateRequired + 1)));
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v68 = sub_1000A21D8;
      v69 = sub_1000A21E8;
      id v70 = 0LL;
      dispatch_semaphore_t v42 = dispatch_semaphore_create(0LL);
      v43 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = *(uint64_t *)((char *)&self->_requestingBundleID + 1);
        uint64_t v45 = *(void *)(&self->super._libraryUpdateRequired + 1);
        *(_DWORD *)v61 = 67109634;
        unsigned int v62 = v52;
        __int16 v63 = 2114;
        uint64_t v64 = v44;
        __int16 v65 = 2114;
        uint64_t v66 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Updating playlist with cloud-id %u, setting trackList: %{public}@ properties: %{public}@",  v61,  0x1Cu);
      }

      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_1000A2D1C;
      v56[3] = &unk_1001A6EA0;
      v58 = buf;
      v46 = v42;
      v57 = v46;
      [v40 sendRequest:v41 withResponseHandler:v56];
      dispatch_semaphore_wait(v46, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v47 = (uint64_t)[*(id *)(*(void *)&buf[8] + 40) responseCode];
      if (v47 > 399)
      {
        if (v47 == 404 || v47 == 400)
        {
          uint64_t v48 = 3LL;
LABEL_39:
          -[CloudLibraryOperation setStatus:](self, "setStatus:", v48);

          _Block_object_dispose(buf, 8);
LABEL_40:
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          uint64_t v50 = MSVTCCIdentityForCurrentProcess();
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          [v49 setClientIdentity:v51];

          [v4 endTransaction];
          goto LABEL_41;
        }
      }

      else
      {
        uint64_t v48 = 1LL;
        if (v47 == 200 || v47 == 204) {
          goto LABEL_39;
        }
      }

      uint64_t v48 = 2LL;
      goto LABEL_39;
    }

    id v15 = [*(id *)(&self->super._libraryUpdateRequired + 1) mutableCopy];
    if (![v53 longLongValue])
    {
      [v15 setObject:v53 forKey:v14];
      v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      v17 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Resetting parent persistent-id to 0 (default root level)",  buf,  2u);
      }

      goto LABEL_25;
    }

    v16 = (os_log_s *)+[ML3Container newWithPersistentID:inLibrary:]( ML3Container,  "newWithPersistentID:inLibrary:",  [v53 longLongValue],  v55);
    v17 = v15;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s valueForProperty:](v16, "valueForProperty:", v10));
    if ((uint64_t)[v18 longLongValue] < 1)
    {
      [v17 removeObjectForKey:v14];
      os_log_t v35 = sub_1000DD86C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = [v53 unsignedLongLongValue];
        id v20 = "Failed to find parent cloud-id for persistent-id %llu";
        v21 = v19;
        os_log_type_t v22 = OS_LOG_TYPE_ERROR;
        uint32_t v23 = 12;
        goto LABEL_23;
      }
    }

    else
    {
      [v17 setObject:v18 forKey:v14];
      v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = [v53 unsignedLongLongValue];
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v18 unsignedLongLongValue];
        id v20 = "Translated parent persistent-id %llu to cloud-id %llu";
        v21 = v19;
        os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
        uint32_t v23 = 22;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
      }
    }

LABEL_25:
    v36 = *(void **)(&self->super._libraryUpdateRequired + 1);
    *(void *)(&self->super._libraryUpdateRequired + 1) = v17;

    goto LABEL_26;
  }

  v24 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(uint64_t *)((char *)&self->super._properties + 1);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Skipping library update because the vendor bundle identifier, %{public}@, did not match the request bundle identifier %{public}@",  buf,  0x16u);
  }

  NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
  v60 = @"Updating playlists are only allowed when updating a playlist that your app has created.";
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
  v27 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"ICPlaylistUpdateErrorDomain",  -1LL,  v26);
  -[CloudLibraryOperation setError:](self, "setError:", v27);
  -[CloudLibraryOperation setStatus:](self, "setStatus:", 2LL);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v29 = MSVTCCIdentityForCurrentProcess();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  [v28 setClientIdentity:v30];

  [v4 endTransaction];
LABEL_41:

  objc_autoreleasePoolPop(context);
}

- (SagaSDKUpdatePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SagaSDKUpdatePlaylistOperation;
  v6 = -[SagaUpdatePlaylistOperation initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"SagaSDKUpdatePlaylistOperationRequestingBundleKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = *(void **)(v6 + 113);
    *(void *)(v6 + 113) = v8;
  }

  return (SagaSDKUpdatePlaylistOperation *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaSDKUpdatePlaylistOperation;
  id v4 = a3;
  -[SagaUpdatePlaylistOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  *(NSDictionary **)((char *)&self->super._properties + 1),  @"SagaSDKUpdatePlaylistOperationRequestingBundleKey",  v5.receiver,  v5.super_class);
}

- (void).cxx_destruct
{
}

@end