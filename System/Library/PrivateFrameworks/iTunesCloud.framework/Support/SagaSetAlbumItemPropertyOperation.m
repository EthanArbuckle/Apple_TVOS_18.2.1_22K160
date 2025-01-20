@interface SagaSetAlbumItemPropertyOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaSetAlbumItemPropertyOperation)initWithCoder:(id)a3;
- (SagaSetAlbumItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 albumPersistentID:(int64_t)a5 albumItemProperties:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSetAlbumItemPropertyOperation

- (SagaSetAlbumItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 albumPersistentID:(int64_t)a5 albumItemProperties:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SagaSetAlbumItemPropertyOperation;
  v11 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v16,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v12 = v11;
  if (v11)
  {
    v11->super._status = a5;
    v13 = (NSError *)[v10 copy];
    error = v12->super._error;
    v12->super._error = v13;
  }

  return v12;
}

- (SagaSetAlbumItemPropertyOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SagaSetAlbumItemPropertyOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v18, "initWithCoder:", v4);
  if (v5)
  {
    v5->super._status = (int64_t)[v4 decodeInt64ForKey:@"SagaSetAlbumItemPropertyOperationAlbumPersistentIDKey"];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSString, v12),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v14 forKey:@"SagaSetAlbumItemPropertyOperationAlbumItemPropertiesKey"]);
    error = v5->super._error;
    v5->super._error = (NSError *)v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaSetAlbumItemPropertyOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"SagaSetAlbumItemPropertyOperationAlbumPersistentIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->super._error forKey:@"SagaSetAlbumItemPropertyOperationAlbumItemPropertiesKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[NSError objectForKeyedSubscript:](self->super._error, "objectForKeyedSubscript:", ML3AlbumPropertyLikedState));
  objc_super v5 = (void *)v4;
  if (v4)
  {
    uint64_t v50 = ML3TrackPropertyAlbumLikedState;
    *(void *)buf = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v50,  1LL));
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  if ([v6 count])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaSetAlbumItemPropertyOperation - (album_persistent_id = %lld)",  self->super._status));
    id v8 = [[MSVXPCTransaction alloc] initWithName:v7];
    [v8 beginTransaction];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v9 setClientIdentity:v10];

    int64_t status = self->super._status;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    id v13 = +[ML3Album newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Album,  "newWithPersistentID:inLibrary:",  status,  v12);

    if ([v13 existsInLibrary])
    {
      v41 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyAlbumPersistentID,  self->super._status));
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "queryWithLibrary:predicate:",  v14,  v15));

      if ([v16 countOfEntities])
      {
        v40 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        uint64_t v49 = ML3TrackPropertyStoreSagaID;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v49, 1LL));
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_100111A18;
        v44[3] = &unk_1001A6E08;
        id v20 = v17;
        id v45 = v20;
        id v39 = v18;
        id v46 = v39;
        id v47 = v6;
        [v16 enumeratePersistentIDsAndProperties:v19 usingBlock:v44];

        id v21 = [v20 count];
        v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            id v24 = [v20 count];
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Sending edit request for %lu items",  buf,  0xCu);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
          v26 = v39;
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkSetItemPropertyRequest requestWithDatabaseID:itemIDs:properties:useLongIDs:]( ICBulkSetItemPropertyRequest,  "requestWithDatabaseID:itemIDs:properties:useLongIDs:",  [v25 databaseID],  v20,  v39,  0));
          [v27 setVerificationInteractionLevel:2];
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_100111A6C;
          v42[3] = &unk_1001A6E30;
          v42[4] = self;
          dispatch_semaphore_t v43 = dispatch_semaphore_create(0LL);
          v28 = v43;
          [v25 sendRequest:v27 withResponseHandler:v42];
          dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

          uint64_t v7 = v41;
        }

        else
        {
          if (v23)
          {
            int64_t v34 = self->super._status;
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Album with pid = %lld has zero tracks with cloud_ids in the database, skipping updates to cloud library.",  buf,  0xCu);
          }

          -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
          uint64_t v7 = v41;
          v26 = v39;
        }

        v3 = v40;
      }

      else
      {
        v32 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v33 = self->super._status;
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Album with pid = %lld has zero tracks in the database, skipping updates to cloud library.",  buf,  0xCu);
        }

        -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
        uint64_t v7 = v41;
      }
    }

    else
    {
      v30 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v31 = self->super._status;
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Album with pid = %lld is not in the database, skipping updates to cloud library.",  buf,  0xCu);
      }

      -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v37 = MSVTCCIdentityForCurrentProcess(v35, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    [v35 setClientIdentity:v38];

    [v8 endTransaction];
  }

  else
  {
    v29 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "No valid album item properties to set, skipping updates to cloud library.",  buf,  2u);
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