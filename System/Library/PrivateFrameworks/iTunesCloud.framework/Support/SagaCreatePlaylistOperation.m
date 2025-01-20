@interface SagaCreatePlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)waitForLibraryUpdate;
- (SagaCreatePlaylistOperation)initWithCoder:(id)a3;
- (SagaCreatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7;
- (SagaCreatePlaylistOperation)initWithConfiguration:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6 clientIdentity:(id)a7;
- (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6;
- (unint64_t)playlistSagaID;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaCreatePlaylistOperation

- (SagaCreatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7
{
  return -[SagaCreatePlaylistOperation initWithConfiguration:playlistPersistentID:properties:trackList:clientIdentity:]( self,  "initWithConfiguration:playlistPersistentID:properties:trackList:clientIdentity:",  a3,  a5,  a6,  a7,  a4);
}

- (SagaCreatePlaylistOperation)initWithConfiguration:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6 clientIdentity:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SagaCreatePlaylistOperation;
  v15 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v18,  "initWithConfiguration:clientIdentity:",  a3,  a7);
  v16 = v15;
  if (v15)
  {
    v15->super._status = a4;
    objc_storeStrong((id *)&v15->super._error, a5);
    objc_storeStrong((id *)&v16->_playlistPersistentID, a6);
  }

  return v16;
}

- (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6
{
  return +[ICCreateContainerRequest requestWithDatabaseID:databaseRevision:playlistProperties:trackList:]( &OBJC_CLASS___ICCreateContainerRequest,  "requestWithDatabaseID:databaseRevision:playlistProperties:trackList:",  *(void *)&a3,  *(void *)&a4,  a5,  a6);
}

- (SagaCreatePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SagaCreatePlaylistOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v22, "initWithCoder:", v4);
  if (v5)
  {
    v5->super._status = (int64_t)[v4 decodeInt64ForKey:@"SagaCreatePlaylistOperationPlaylistPersistentIDKey"];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    id v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSNumber, v12),  0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"SagaCreatePlaylistOperationProperties"]);
    error = v5->super._error;
    v5->super._error = (NSError *)v15;

    id v18 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(ICCloudItemIDList, v17),  @"SagaCreatePlaylistOperationTrackListKey");
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    playlistPersistentID = (void *)v5->_playlistPersistentID;
    v5->_playlistPersistentID = v19;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCreatePlaylistOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"SagaCreatePlaylistOperationPlaylistPersistentIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->super._error forKey:@"SagaCreatePlaylistOperationProperties"];
  [v4 encodeObject:self->_playlistPersistentID forKey:@"SagaCreatePlaylistOperationTrackListKey"];
}

- (BOOL)waitForLibraryUpdate
{
  return 0;
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  context = objc_autoreleasePoolPush();
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaCreatePlaylistOperation - (playlist persistent-id = %lld)",  self->super._status));
  id v3 = [[MSVXPCTransaction alloc] initWithName:v53];
  [v3 beginTransaction];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v4 setClientIdentity:v5];

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v6 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  self->super._status,  v54);
  if ([v6 existsInLibrary])
  {
    p_error = &self->super._error;
    id obj = -[NSError mutableCopy](self->super._error, "mutableCopy");
    uint64_t v8 = ML3ContainerPropertyDateCreated;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](self->super._error, "objectForKey:", ML3ContainerPropertyDateCreated));

    if (!v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:v8]);
      uint64_t v11 = v10;
      if (v10)
      {
        [v10 doubleValue];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
        [obj setObject:v12 forKey:v8];
      }
    }

    uint64_t v13 = ML3ContainerPropertyParentPersistentID;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](*p_error, "objectForKey:", ML3ContainerPropertyParentPersistentID));
    if (!v50)
    {
LABEL_21:
      uint64_t v22 = ML3ContainerPropertyCoverArtworkRecipe;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](*p_error, "objectForKey:", ML3ContainerPropertyCoverArtworkRecipe));
      if (![v49 length])
      {
        [obj setObject:@"{version:0.1}" forKey:v22];
        [v6 setValue:@"{version:0.1}" forProperty:v22];
      }

      objc_storeStrong((id *)&self->super._error, obj);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
      unsigned int v24 = [v23 sagaOnDiskDatabaseRevision];

      if (v24 <= 1) {
        uint64_t v25 = 1LL;
      }
      else {
        uint64_t v25 = v24;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      v27 = (void *)objc_claimAutoreleasedReturnValue( -[SagaCreatePlaylistOperation requestWithDatabaseID:databaseRevision:playlistProperties:trackList:]( self,  "requestWithDatabaseID:databaseRevision:playlistProperties:trackList:",  [v26 databaseID],  v25,  *p_error,  self->_playlistPersistentID));
      [v27 setVerificationInteractionLevel:2];
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v70 = sub_100023718;
      v71 = sub_100023728;
      id v72 = 0LL;
      uint64_t v59 = 0LL;
      v60 = &v59;
      uint64_t v61 = 0x3032000000LL;
      v62 = sub_100023718;
      v63 = sub_100023728;
      id v64 = 0LL;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_100023730;
      v55[3] = &unk_1001A6E78;
      v57 = buf;
      v58 = &v59;
      v28 = dispatch_semaphore_create(0LL);
      v56 = v28;
      [v26 sendRequest:v27 withResponseHandler:v55];
      dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      if (!v60[5])
      {
        v29 = *(void **)(*(void *)&buf[8] + 40LL);
        if (v29)
        {
          unsigned int v30 = [v29 containerID];
          self->_properties = (NSDictionary *)v30;
          if (v30)
          {
            v31 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              int64_t status = self->super._status;
              properties = self->_properties;
              *(_DWORD *)v65 = 134218240;
              int64_t v66 = status;
              __int16 v67 = 2048;
              v68 = properties;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Updating playlist with persistent-id %lld, setting cloud-id to %llu",  v65,  0x16u);
            }

            v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_properties));
            [v6 setValue:v34 forProperty:ML3ContainerPropertyStoreCloudID];

            v35 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v65 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Triggering playlist artwork upload in case this playlist has user artwork.",  v65,  2u);
            }

            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
            v37 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v36));
            int64_t v38 = self->super._status;
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
            [v37 uploadArtworkForPlaylistWithPersistentID:v38 clientIdentity:v39 completionHandler:&stru_1001A21B8];
          }

          if ([*(id *)(*(void *)&buf[8] + 40) updateRequired])
          {
            if (-[SagaCreatePlaylistOperation waitForLibraryUpdate](self, "waitForLibraryUpdate")) {
              goto LABEL_42;
            }
            v40 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v65 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Requesting library update because the response contained update-required flag",  v65,  2u);
            }

            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
            v42 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v41));
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
            [v42 updateSagaLibraryWithClientIdentity:v43 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];
          }

          else
          {
            v41 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v65 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Skipping library update because the response did not contain update-required flag",  v65,  2u);
            }
          }
        }
      }

- (unint64_t)playlistSagaID
{
  return (unint64_t)self->_properties;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end