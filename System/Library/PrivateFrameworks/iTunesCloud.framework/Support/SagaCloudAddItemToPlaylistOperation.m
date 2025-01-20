@interface SagaCloudAddItemToPlaylistOperation
+ (BOOL)supportsSecureCoding;
- (SagaCloudAddItemToPlaylistOperation)initWithAdamID:(int64_t)a3 playlistPersistentID:(int64_t)a4 clientIdentity:(id)a5;
- (SagaCloudAddItemToPlaylistOperation)initWithCoder:(id)a3;
- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6;
- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 referralAlbumAdamID:(int64_t)a6 clientIdentity:(id)a7;
- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 referralPlaylistGlobalID:(id)a6 clientIdentity:(id)a7;
- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logCloudAddRequestDescription;
@end

@implementation SagaCloudAddItemToPlaylistOperation

- (SagaCloudAddItemToPlaylistOperation)initWithAdamID:(int64_t)a3 playlistPersistentID:(int64_t)a4 clientIdentity:(id)a5
{
  id v8 = a5;
  v10 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v9);
  v11 = -[SagaCloudAddItemToPlaylistOperation initWithConfiguration:adamID:playlistPersistentID:clientIdentity:]( self,  "initWithConfiguration:adamID:playlistPersistentID:clientIdentity:",  v10,  a3,  a4,  v8);

  return v11;
}

- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SagaCloudAddItemToPlaylistOperation;
  result = -[SagaCloudAddItemOperation initWithConfiguration:adamID:clientIdentity:]( &v8,  "initWithConfiguration:adamID:clientIdentity:",  a3,  a4,  a6);
  if (result) {
    *(int64_t *)((char *)&result->super._referralAlbumAdamID + 1) = a5;
  }
  return result;
}

- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 referralAlbumAdamID:(int64_t)a6 clientIdentity:(id)a7
{
  result = -[SagaCloudAddItemToPlaylistOperation initWithConfiguration:adamID:playlistPersistentID:clientIdentity:]( self,  "initWithConfiguration:adamID:playlistPersistentID:clientIdentity:",  a3,  a4,  a5,  a7);
  if (result) {
    *(NSError **)((char *)&result->super.super.super._error + 1) = (NSError *)a6;
  }
  return result;
}

- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 referralPlaylistGlobalID:(id)a6 clientIdentity:(id)a7
{
  id v13 = a6;
  v14 = -[SagaCloudAddItemToPlaylistOperation initWithConfiguration:adamID:playlistPersistentID:clientIdentity:]( self,  "initWithConfiguration:adamID:playlistPersistentID:clientIdentity:",  a3,  a4,  a5,  a7);
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)(&v14->super.super._updateRequired + 1), a6);
  }

  return v15;
}

- (SagaCloudAddItemToPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaCloudAddItemToPlaylistOperation;
  v5 = -[SagaCloudAddItemOperation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5) {
    *(void *)(v5 + 121) = [v4 decodeInt64ForKey:@"SagaCloudAddItemToPlaylistOperationPlaylistPersistentIDKey"];
  }

  return (SagaCloudAddItemToPlaylistOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCloudAddItemToPlaylistOperation;
  id v4 = a3;
  -[SagaCloudAddItemOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  *(int64_t *)((char *)&self->super._referralAlbumAdamID + 1),  @"SagaCloudAddItemToPlaylistOperationPlaylistPersistentIDKey",  v5.receiver,  v5.super_class);
}

- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = *(int64_t *)((char *)&self->super._referralAlbumAdamID + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v7 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  v5,  v6);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForProperty:ML3ContainerPropertyStoreCloudID]);
  id v9 = [v8 unsignedIntValue];

  v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(int64_t *)((char *)&self->super.super.super._status + 1);
    uint64_t v12 = *(int64_t *)((char *)&self->super._referralAlbumAdamID + 1);
    int v29 = 134218496;
    uint64_t v30 = v11;
    __int16 v31 = 2048;
    *(void *)v32 = v12;
    *(_WORD *)&v32[8] = 1024;
    v33[0] = (_DWORD)v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[SagaCloudAddItemToPlaylistOperation] Adding adam-id %lld to playlist with persistent id %lld (cloud-id %u)",  (uint8_t *)&v29,  0x1Cu);
  }

  if ((_DWORD)v9)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[ICAddToLibraryRequest requestWithDatabaseID:databaseRevision:adamID:containerID:referralAlbumAdamID:referralPlaylistGlobalID:]( &OBJC_CLASS___ICAddToLibraryRequest,  "requestWithDatabaseID:databaseRevision:adamID:containerID:referralAlbumAdamID:referralPlaylistGlobalID:",  v3,  -[SagaCloudAddOperation currentDatabaseRevision](self, "currentDatabaseRevision"),  *(int64_t *)((char *)&self->super.super.super._status + 1),  v9,  *(NSError **)((char *)&self->super.super.super._error + 1),  *(void *)(&self->super.super._updateRequired + 1)));
  }

  else
  {
    uint64_t v14 = ML3ContainerPropertyDateCreated;
    uint64_t v15 = ML3ContainerPropertyIsSourceRemote;
    v34[0] = ML3ContainerPropertyDateCreated;
    v34[1] = ML3ContainerPropertyIsSourceRemote;
    uint64_t v16 = ML3ContainerPropertyDistinguishedKind;
    v34[2] = ML3ContainerPropertyDistinguishedKind;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 3LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 getValuesForProperties:v17]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v14]);
    [v19 doubleValue];
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));

    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v15]);
    unsigned int v22 = [v21 intValue];

    v23 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v16]);
    unsigned int v24 = [v23 intValue];

    v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(int64_t *)((char *)&self->super._referralAlbumAdamID + 1);
      [v20 timeIntervalSince1970];
      int v29 = 134218752;
      uint64_t v30 = v26;
      __int16 v31 = 1024;
      *(_DWORD *)v32 = v22;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v24;
      LOWORD(v33[0]) = 2048;
      *(void *)((char *)v33 + 2) = (uint64_t)v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[SagaCloudAddItemToPlaylistOperation] Playlist pid %lld: is_src_remote %d, distinguished_kind %d, created %{time}zd",  (uint8_t *)&v29,  0x22u);
    }

    id v13 = 0LL;
  }

  return v13;
}

- (void)logCloudAddRequestDescription
{
  uint64_t v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(int64_t *)((char *)&self->super.super.super._status + 1);
    uint64_t v5 = *(int64_t *)((char *)&self->super._referralAlbumAdamID + 1);
    int v6 = 134218240;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Cloud-add request for adam ID = %lld / container_pid = %lld",  (uint8_t *)&v6,  0x16u);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end