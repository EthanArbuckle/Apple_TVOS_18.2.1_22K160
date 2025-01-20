@interface SagaCreateGeniusPlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaCreateGeniusPlaylistOperation)initWithCoder:(id)a3;
- (SagaCreateGeniusPlaylistOperation)initWithConfiguration:(id)a3 geniusPlaylistPersistentID:(int64_t)a4 playlistName:(id)a5 seedItemIDs:(id)a6 itemIDs:(id)a7 clientIdentity:(id)a8;
- (unint64_t)playlistSagaID;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaCreateGeniusPlaylistOperation

- (SagaCreateGeniusPlaylistOperation)initWithConfiguration:(id)a3 geniusPlaylistPersistentID:(int64_t)a4 playlistName:(id)a5 seedItemIDs:(id)a6 itemIDs:(id)a7 clientIdentity:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SagaCreateGeniusPlaylistOperation;
  v17 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v26,  "initWithConfiguration:clientIdentity:",  a3,  a8);
  v18 = v17;
  if (v17)
  {
    v17->super._status = a4;
    v19 = (NSError *)[v14 copy];
    error = v18->super._error;
    v18->super._error = v19;

    id v21 = [v15 copy];
    playlistPersistentID = (void *)v18->_playlistPersistentID;
    v18->_playlistPersistentID = (int64_t)v21;

    v23 = (NSString *)[v16 copy];
    playlistName = v18->_playlistName;
    v18->_playlistName = v23;
  }

  return v18;
}

- (SagaCreateGeniusPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SagaCreateGeniusPlaylistOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v19, "initWithCoder:", v4);
  if (v5)
  {
    v5->super._status = (int64_t)[v4 decodeInt64ForKey:@"SagaAddPlaylistOperationPlaylistPersistentIDKey"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v6),  @"SagaAddPlaylistOperationPlaylistNameKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    error = v5->super._error;
    v5->super._error = (NSError *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSArray, v10),  @"SagaAddPlaylistOperationPlaylistSeedItemIDsKey");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    playlistPersistentID = (void *)v5->_playlistPersistentID;
    v5->_playlistPersistentID = v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSArray, v14),  @"SagaAddPlaylistOperationPlaylistItemIDsKey");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    playlistName = v5->_playlistName;
    v5->_playlistName = (NSString *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCreateGeniusPlaylistOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"SagaAddPlaylistOperationPlaylistPersistentIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->super._error forKey:@"SagaAddPlaylistOperationPlaylistNameKey"];
  [v4 encodeObject:self->_playlistPersistentID forKey:@"SagaAddPlaylistOperationPlaylistSeedItemIDsKey"];
  [v4 encodeObject:self->_playlistName forKey:@"SagaAddPlaylistOperationPlaylistItemIDsKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaCreateGeniusPlaylistOperation - (playlist_persistent_id  = %lld / playlist_name = %@)",  self->super._status,  self->super._error));
  id v5 = [[MSVXPCTransaction alloc] initWithName:v4];
  [v5 beginTransaction];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v6 setClientIdentity:v7];

  int64_t status = self->super._status;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v10 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  status,  v9);

  if ([v10 existsInLibrary])
  {
    os_log_t v11 = (os_log_t)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICCreateGeniusContainerRequest requestWithDatabaseID:playlistName:seedItemIDs:itemIDs:]( &OBJC_CLASS___ICCreateGeniusContainerRequest,  "requestWithDatabaseID:playlistName:seedItemIDs:itemIDs:",  -[os_log_s databaseID](v11, "databaseID"),  self->super._error,  self->_playlistPersistentID,  self->_playlistName));
    [v12 setVerificationInteractionLevel:2];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10004F01C;
    v19[3] = &unk_1001A6E30;
    v19[4] = self;
    v13 = dispatch_semaphore_create(0LL);
    v20 = v13;
    -[os_log_s sendRequest:withResponseHandler:](v11, "sendRequest:withResponseHandler:", v12, v19);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_seedItemIDs)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
      [v10 setValue:v14 forProperty:ML3ContainerPropertyStoreCloudID];
    }
  }

  else
  {
    os_log_t v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int64_t v15 = self->super._status;
      *(_DWORD *)buf = 134217984;
      int64_t v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "Playlist with pid = %lld is not in the database, skipping add to cloud library.",  buf,  0xCu);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v17 = MSVTCCIdentityForCurrentProcess();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v16 setClientIdentity:v18];

  [v5 endTransaction];
  objc_autoreleasePoolPop(v3);
}

- (unint64_t)playlistSagaID
{
  return (unint64_t)self->_seedItemIDs;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end