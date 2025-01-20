@interface SagaUpdatePlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaUpdatePlaylistOperation)initWithClientIdentity:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6;
- (SagaUpdatePlaylistOperation)initWithCoder:(id)a3;
- (SagaUpdatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaUpdatePlaylistOperation

- (SagaUpdatePlaylistOperation)initWithClientIdentity:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v14 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v13);
  v15 = -[SagaUpdatePlaylistOperation initWithConfiguration:clientIdentity:playlistPersistentID:properties:trackList:]( self,  "initWithConfiguration:clientIdentity:playlistPersistentID:properties:trackList:",  v14,  v12,  a4,  v11,  v10);

  return v15;
}

- (SagaUpdatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SagaUpdatePlaylistOperation;
  v14 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v21,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v15 = v14;
  if (v14)
  {
    v14->super._status = a5;
    v16 = (NSError *)[v12 copy];
    error = v15->super._error;
    v15->super._error = v16;

    id v18 = [v13 copy];
    playlistPersistentID = (void *)v15->_playlistPersistentID;
    v15->_playlistPersistentID = (int64_t)v18;
  }

  return v15;
}

- (SagaUpdatePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___SagaUpdatePlaylistOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v40, "initWithCoder:", v4);
  if (v5)
  {
    unsigned int v6 = [v4 decodeInt32ForKey:@"SagaUpdatePlaylistOperationArchiveVersionKey"];
    if (v6 == 1)
    {
      id v7 = [v4 decodeInt64ForKey:@"SagaUpdatePlaylistOperationPlaylistPersistentIDKey"];
      id v18 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(ICCloudItemIDList, v17),  @"SagaUpdatePlaylistOperationcloudItemIDListKey");
      id v11 = (ICCloudItemIDList *)objc_claimAutoreleasedReturnValue(v18);
    }

    else
    {
      if (v6)
      {
        id v7 = [v4 decodeInt64ForKey:@"SagaUpdatePlaylistOperationPlaylistPersistentIDKey"];
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary, v20);
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDate, v22);
        uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber, v24);
        v27 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v21,  v23,  v25,  objc_opt_class(&OBJC_CLASS___NSString, v26),  0LL);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v28 forKey:@"SagaUpdatePlaylistOperationProperties"]);

        id v30 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(ICCloudItemIDList, v29),  @"SagaUpdatePlaylistOperationTrackListKey");
        id v11 = (ICCloudItemIDList *)objc_claimAutoreleasedReturnValue(v30);
        goto LABEL_15;
      }

      id v7 = [v4 decodeInt64ForKey:@"SagaUpdatePlaylistOperationPlaylistPersistentIDKey"];
      id v9 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSArray, v8),  @"SagaUpdatePlaylistOperationItemSagaIDsKey");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      id v11 = objc_alloc_init(&OBJC_CLASS___ICCloudItemIDList);
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v37;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v37 != v15) {
              objc_enumerationMutation(v12);
            }
            -[ICCloudItemIDList addCloudItemID:idType:]( v11,  "addCloudItemID:idType:",  [*(id *)(*((void *)&v36 + 1) + 8 * (void)i) unsignedLongLongValue],  0);
          }

          id v14 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }

        while (v14);
      }
    }

    v19 = 0LL;
LABEL_15:
    v5->super._status = (int64_t)v7;
    v31 = (NSError *)[v19 copy];
    error = v5->super._error;
    v5->super._error = v31;

    id v33 = -[ICCloudItemIDList copy](v11, "copy");
    playlistPersistentID = (void *)v5->_playlistPersistentID;
    v5->_playlistPersistentID = (int64_t)v33;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaUpdatePlaylistOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  2,  @"SagaUpdatePlaylistOperationArchiveVersionKey",  v5.receiver,  v5.super_class);
  [v4 encodeInt64:self->super._status forKey:@"SagaUpdatePlaylistOperationPlaylistPersistentIDKey"];
  [v4 encodeObject:self->super._error forKey:@"SagaUpdatePlaylistOperationProperties"];
  [v4 encodeObject:self->_playlistPersistentID forKey:@"SagaUpdatePlaylistOperationTrackListKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  context = objc_autoreleasePoolPush();
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaUpdatePlaylistOperation - (playlist_persistent_id = %lld)",  self->super._status));
  id v3 = [[MSVXPCTransaction alloc] initWithName:v58];
  [v3 beginTransaction];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v4 setClientIdentity:v5];

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v7 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  self->super._status,  v6);
  if ([v7 existsInLibrary])
  {
    uint64_t v8 = ML3ContainerPropertyStoreCloudID;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForProperty:ML3ContainerPropertyStoreCloudID]);
    unint64_t v10 = (unint64_t)[v9 unsignedIntValue];

    if ((_DWORD)v10)
    {
      uint64_t v11 = ML3ContainerPropertyParentPersistentID;
      v56 = (void *)objc_claimAutoreleasedReturnValue( -[NSError objectForKey:]( self->super._error,  "objectForKey:",  ML3ContainerPropertyParentPersistentID));
      if (!v56) {
        goto LABEL_22;
      }
      unsigned int v53 = v10;
      id v12 = v3;
      id v13 = v7;
      id v14 = v6;
      uint64_t v15 = (NSError *)-[NSError mutableCopy](self->super._error, "mutableCopy");
      v54 = v15;
      if (![v56 longLongValue])
      {
        -[NSError setObject:forKey:](v15, "setObject:forKey:", v56, v11);
        v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Resetting parent persistent-id to 0 (default root level)",  buf,  2u);
        }

        unsigned int v6 = v14;
        id v7 = v13;
        id v3 = v12;
        unint64_t v10 = v53;
        goto LABEL_21;
      }

      unsigned int v6 = v14;
      v16 = (os_log_s *)+[ML3Container newWithPersistentID:inLibrary:]( ML3Container,  "newWithPersistentID:inLibrary:",  [v56 longLongValue],  v14);
      id v7 = v13;
      id v3 = v12;
      unint64_t v10 = v53;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s valueForProperty:](v16, "valueForProperty:", v8));
      if ((uint64_t)[v17 longLongValue] < 1)
      {
        -[NSError removeObjectForKey:](v54, "removeObjectForKey:", v11);
        id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = [v56 unsignedLongLongValue];
          v19 = "Failed to find parent cloud-id for persistent-id %llu";
          uint64_t v20 = v18;
          os_log_type_t v21 = OS_LOG_TYPE_ERROR;
          uint32_t v22 = 12;
          goto LABEL_19;
        }
      }

      else
      {
        -[NSError setObject:forKey:](v54, "setObject:forKey:", v17, v11);
        id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = [v56 unsignedLongLongValue];
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = [v17 unsignedLongLongValue];
          v19 = "Translated parent persistent-id %llu to cloud-id %llu";
          uint64_t v20 = v18;
          os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
          uint32_t v22 = 22;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
        }
      }

LABEL_21:
      error = self->super._error;
      self->super._error = v54;

LABEL_22:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
      unsigned int v28 = [v27 sagaOnDiskDatabaseRevision];

      if (v28 <= 1) {
        uint64_t v29 = 1LL;
      }
      else {
        uint64_t v29 = v28;
      }
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      v55 = (void *)objc_claimAutoreleasedReturnValue( +[ICSetContainerPropertiesRequest requestWithDatabaseID:databaseRevision:containerID:trackList:properties:]( ICSetContainerPropertiesRequest,  "requestWithDatabaseID:databaseRevision:containerID:trackList:properties:",  [v30 databaseID],  v29,  v10,  self->_playlistPersistentID,  self->super._error));
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v74 = sub_1000A21D8;
      v75 = sub_1000A21E8;
      id v76 = 0LL;
      uint64_t v63 = 0LL;
      v64 = &v63;
      uint64_t v65 = 0x3032000000LL;
      v66 = sub_1000A21D8;
      v67 = sub_1000A21E8;
      id v68 = 0LL;
      dispatch_semaphore_t v31 = dispatch_semaphore_create(0LL);
      v32 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int64_t playlistPersistentID = self->_playlistPersistentID;
        v34 = self->super._error;
        *(_DWORD *)v69 = 67109634;
        *(_DWORD *)v70 = v10;
        *(_WORD *)&v70[4] = 2114;
        *(void *)&v70[6] = playlistPersistentID;
        __int16 v71 = 2114;
        v72 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Updating playlist with cloud-id %u, setting trackList: %{public}@ properties: %{public}@",  v69,  0x1Cu);
      }

      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_1000A21F0;
      v59[3] = &unk_1001A6E78;
      v61 = buf;
      v62 = &v63;
      v35 = v31;
      v60 = v35;
      [v30 sendRequest:v55 withResponseHandler:v59];
      dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v36 = *(void *)&buf[8];
      if (!v64[5])
      {
        __int128 v37 = *(void **)(*(void *)&buf[8] + 40LL);
        if (v37)
        {
          id v38 = v37;
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
          objc_super v40 = (void *)objc_claimAutoreleasedReturnValue([v38 globalPlaylistID]);
          BOOL v41 = [v40 length] == 0;

          if (!v41)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue([v38 globalPlaylistID]);
            [v39 setObject:v42 forKey:ML3ContainerPropertyCloudGlobalID];
          }

          v43 = (void *)objc_claimAutoreleasedReturnValue([v38 subscribedContainerURL]);
          BOOL v44 = [v43 length] == 0;

          if (!v44)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue([v38 subscribedContainerURL]);
            [v39 setObject:v45 forKey:ML3ContainerPropertyCloudShareURL];
          }

          if ([v39 count]
            && ([v7 setValuesForPropertiesWithDictionary:v39] & 1) == 0)
          {
            v46 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v69 = 138543362;
              *(void *)v70 = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "Failed to set updated properties on container %{public}@",  v69,  0xCu);
            }
          }

          if ([v38 updateRequired])
          {
            LOBYTE(self->_properties) = 1;
          }

          else
          {
            v47 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v69 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Skipping library update because the response did not contain update-required flag",  v69,  2u);
            }
          }

          uint64_t v36 = *(void *)&buf[8];
        }
      }

      uint64_t v48 = (uint64_t)[*(id *)(v36 + 40) responseCode];
      if (v48 > 399)
      {
        if (v48 == 404 || v48 == 400)
        {
          uint64_t v49 = 3LL;
LABEL_52:
          -[CloudLibraryOperation setStatus:](self, "setStatus:", v49);

          _Block_object_dispose(&v63, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_53;
        }
      }

      else
      {
        uint64_t v49 = 1LL;
        if (v48 == 200 || v48 == 204) {
          goto LABEL_52;
        }
      }

      uint64_t v49 = 2LL;
      goto LABEL_52;
    }

    uint64_t v23 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int64_t status = self->super._status;
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = status;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld does not have a cloud_id in the database, skipping save to cloud library.",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v23 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v24 = self->super._status;
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld is not in the database, skipping save to cloud library.",  buf,  0xCu);
    }
  }

  -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
LABEL_53:
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v51 = MSVTCCIdentityForCurrentProcess();
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  [v50 setClientIdentity:v52];

  [v3 endTransaction];
  objc_autoreleasePoolPop(context);
}

- (BOOL)libraryUpdateRequired
{
  return (BOOL)self->_properties;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end