@interface SagaCloudSDKAddItemToPlaylistOperation
- (SagaCloudSDKAddItemToPlaylistOperation)initWithClientIdentity:(id)a3 opaqueID:(id)a4 bundleID:(id)a5 playlistPersistentID:(int64_t)a6;
- (SagaCloudSDKAddItemToPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 opaqueID:(id)a5 bundleID:(id)a6 playlistPersistentID:(int64_t)a7;
- (id)requestWithDatabaseID:(int)a3 databaseRevision:(int)a4 opaqueID:(id)a5 bundleID:(id)a6;
@end

@implementation SagaCloudSDKAddItemToPlaylistOperation

- (SagaCloudSDKAddItemToPlaylistOperation)initWithClientIdentity:(id)a3 opaqueID:(id)a4 bundleID:(id)a5 playlistPersistentID:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v14 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v13);
  v15 = -[SagaCloudSDKAddItemToPlaylistOperation initWithConfiguration:clientIdentity:opaqueID:bundleID:playlistPersistentID:]( self,  "initWithConfiguration:clientIdentity:opaqueID:bundleID:playlistPersistentID:",  v14,  v12,  v11,  v10,  a6);

  return v15;
}

- (SagaCloudSDKAddItemToPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 opaqueID:(id)a5 bundleID:(id)a6 playlistPersistentID:(int64_t)a7
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SagaCloudSDKAddItemToPlaylistOperation;
  result = -[SagaCloudSDKAddOperation initWithConfiguration:clientIdentity:opaqueID:bundleID:]( &v9,  "initWithConfiguration:clientIdentity:opaqueID:bundleID:",  a3,  a4,  a5,  a6);
  if (result) {
    result->super._bundleID = (NSString *)a7;
  }
  return result;
}

- (id)requestWithDatabaseID:(int)a3 databaseRevision:(int)a4 opaqueID:(id)a5 bundleID:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  bundleID = self->super._bundleID;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v14 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  bundleID,  v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForProperty:ML3ContainerPropertyStoreCloudID]);
  id v16 = [v15 unsignedIntValue];

  v17 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(-[SagaCloudSDKAddOperation opaqueID](self, "opaqueID"));
    v19 = self->super._bundleID;
    *(_DWORD *)buf = 138543874;
    v37 = v18;
    __int16 v38 = 2048;
    *(void *)v39 = v19;
    *(_WORD *)&v39[8] = 1024;
    v40[0] = (_DWORD)v16;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Adding opaqueID %{public}@ to playlist with persistent id %lld (cloud-id %u)",  buf,  0x1Cu);
  }

  if ((_DWORD)v16)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[ICSDKAddToPlaylistRequest requestWithDatabaseID:databaseRevision:opaqueID:bundleID:containerID:]( &OBJC_CLASS___ICSDKAddToPlaylistRequest,  "requestWithDatabaseID:databaseRevision:opaqueID:bundleID:containerID:",  v8,  v7,  v10,  v11,  v16));
  }

  else
  {
    id v35 = v10;
    uint64_t v21 = ML3ContainerPropertyDateCreated;
    uint64_t v22 = ML3ContainerPropertyIsSourceRemote;
    v41[0] = ML3ContainerPropertyDateCreated;
    v41[1] = ML3ContainerPropertyIsSourceRemote;
    uint64_t v23 = ML3ContainerPropertyDistinguishedKind;
    v41[2] = ML3ContainerPropertyDistinguishedKind;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v14 getValuesForProperties:v24]);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v21]);
    [v26 doubleValue];
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));

    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v22]);
    unsigned int v29 = [v28 intValue];

    v30 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v23]);
    unsigned int v31 = [v30 intValue];

    v32 = os_log_create("com.apple.amp.itunescloudd", "SDK");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = self->super._bundleID;
      *(_DWORD *)buf = 134218754;
      v37 = v33;
      __int16 v38 = 1024;
      *(_DWORD *)v39 = v29;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v31;
      LOWORD(v40[0]) = 2114;
      *(void *)((char *)v40 + 2) = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Playlist pid %lld: is_src_remote %d, distinguished_kind %d, created %{public}@",  buf,  0x22u);
    }

    v20 = 0LL;
    id v10 = v35;
  }

  return v20;
}

@end