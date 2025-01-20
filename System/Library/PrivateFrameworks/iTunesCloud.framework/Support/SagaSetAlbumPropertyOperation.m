@interface SagaSetAlbumPropertyOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaSetAlbumPropertyOperation)initWithCoder:(id)a3;
- (SagaSetAlbumPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 albumPersistentID:(int64_t)a5 properties:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSetAlbumPropertyOperation

- (SagaSetAlbumPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 albumPersistentID:(int64_t)a5 properties:(id)a6
{
  id v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SagaSetAlbumPropertyOperation;
  v11 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v18,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v12 = v11;
  if (v11)
  {
    v11->super._status = a5;
    id v13 = [v10 copy];
    albumPersistentID = (void *)v12->_albumPersistentID;
    v12->_albumPersistentID = (int64_t)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([(id)v12->_albumPersistentID objectForKey:ML3AlbumPropertyCloudLibraryID]);
    error = v12->super._error;
    v12->super._error = (NSError *)v15;
  }

  return v12;
}

- (SagaSetAlbumPropertyOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SagaSetAlbumPropertyOperation;
  id v5 = -[CloudLibraryOperation initWithCoder:](&v24, "initWithCoder:", v4);
  if (v5)
  {
    *((void *)v5 + 11) = [v4 decodeInt64ForKey:@"SagaSetAlbumPropertyOperationAlbumPersistentIDKey"];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    id v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSNumber, v12),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v14 forKey:@"SagaSetAlbumPropertyOperationAlbumPropertiesKey"]);
    v16 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v15;

    id v18 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v17),  @"SagaSetAlbumPropertyOperationAlbumCloudLibraryIDKey");
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v19;

    if (!*((void *)v5 + 12))
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue([*((id *)v5 + 13) objectForKey:ML3AlbumPropertyCloudLibraryID]);
      v22 = (void *)*((void *)v5 + 12);
      *((void *)v5 + 12) = v21;
    }
  }

  return (SagaSetAlbumPropertyOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaSetAlbumPropertyOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"SagaSetAlbumPropertyOperationAlbumPersistentIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_albumPersistentID forKey:@"SagaSetAlbumPropertyOperationAlbumPropertiesKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  v3 = objc_autoreleasePoolPush();
  if (-[NSError length](self->super._error, "length"))
  {
    id v4 = (id)self->_albumPersistentID;
    uint64_t v5 = ML3AlbumPropertyLikedState;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:ML3AlbumPropertyLikedState]);
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v7 setObject:v6 forKeyedSubscript:v5];
      uint64_t v8 = ML3AlbumPropertyLikedStateChangedDate;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:ML3AlbumPropertyLikedStateChangedDate]);
      if (v9) {
        [v7 setObject:v9 forKeyedSubscript:v8];
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    if ([v7 count])
    {
      v34 = v3;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaSetAlbumPropertyOperation - (album_persistent_id = %lld)",  self->super._status));
      id v14 = [[MSVXPCTransaction alloc] initWithName:v13];
      [v14 beginTransaction];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
      [v15 setClientIdentity:v16];

      int64_t status = self->super._status;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
      id v19 = +[ML3Album newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Album,  "newWithPersistentID:inLibrary:",  status,  v18);

      if (([v19 existsInLibrary] & 1) == 0)
      {
        v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int64_t v21 = self->super._status;
          error = self->super._error;
          *(_DWORD *)buf = 134218242;
          int64_t v40 = v21;
          __int16 v41 = 2114;
          int64_t v42 = (int64_t)error;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Album with pid = %lld, cloudLibraryID = %{public}@ does not exist locally",  buf,  0x16u);
        }
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      id v24 = [v23 databaseID];
      v38 = self->super._error;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
      v37 = v7;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkSetItemPropertyRequest requestWithDatabaseID:albumCloudLibraryIDs:properties:]( &OBJC_CLASS___ICBulkSetItemPropertyRequest,  "requestWithDatabaseID:albumCloudLibraryIDs:properties:",  v24,  v25,  v26));

      [v27 setVerificationInteractionLevel:2];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_10008C60C;
      v35[3] = &unk_1001A6E30;
      v35[4] = self;
      dispatch_semaphore_t v36 = dispatch_semaphore_create(0LL);
      v28 = v36;
      [v23 sendRequest:v27 withResponseHandler:v35];
      dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
      uint64_t v30 = MSVTCCIdentityForCurrentProcess();
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      [v29 setClientIdentity:v31];

      [v14 endTransaction];
      v3 = v34;
    }

    else
    {
      v32 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int64_t albumPersistentID = self->_albumPersistentID;
        *(_DWORD *)buf = 138543362;
        int64_t v40 = albumPersistentID;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "No valid album properties to set, skipping updates to cloud library. properties=%{public}@",  buf,  0xCu);
      }

      -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
    }
  }

  else
  {
    uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = self->super._status;
      int64_t v12 = self->_albumPersistentID;
      *(_DWORD *)buf = 134218242;
      int64_t v40 = v11;
      __int16 v41 = 2114;
      int64_t v42 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Album with persistentID=%lld does not have a cloud library id. Not setting properties=%{public}@",  buf,  0x16u);
    }

    -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
  }

  objc_autoreleasePoolPop(v3);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end