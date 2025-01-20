@interface SagaFavoriteEntityOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)_recomputeInUsersLibraryForTrackPids:(id)a3 resetFavoriteState:(BOOL)a4 usingConnection:(id)a5;
- (BOOL)isPersistent;
- (SagaFavoriteEntityOperation)initWithCoder:(id)a3;
- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 albumCloudLibraryID:(id)a6 time:(id)a7;
- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 artistCloudLibraryID:(id)a6 time:(id)a7;
- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 globalPlaylistID:(id)a6 time:(id)a7;
- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 storeID:(int64_t)a6 entityType:(int64_t)a7 time:(id)a8;
- (id)_containerPidsMatchingRequestGlobalPlaylistID;
- (id)_initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 storeID:(int64_t)a6 globalPlaylistID:(id)a7 albumCloudLibraryID:(id)a8 artistCloudLibraryID:(id)a9 entityType:(int64_t)a10 time:(id)a11;
- (id)description;
- (unsigned)_currentDatabaseRevision;
- (void)_canRunOperationWithCompletionHandler:(id)a3;
- (void)_revertFavoritingEntityTypeAlbum;
- (void)_revertFavoritingEntityTypeArtist;
- (void)_revertFavoritingEntityTypePlaylist;
- (void)_revertFavoritingEntityTypeTrack;
- (void)_revertPendingFavoriteEntityForPermanentlyFailedOperation;
- (void)_setCloudIDsFromResponse:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaFavoriteEntityOperation

- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 storeID:(int64_t)a6 entityType:(int64_t)a7 time:(id)a8
{
  return (SagaFavoriteEntityOperation *)-[SagaFavoriteEntityOperation _initWithConfiguration:clientIdentity:persistentID:storeID:globalPlaylistID:albumCloudLibraryID:artistCloudLibraryID:entityType:time:]( self,  "_initWithConfiguration:clientIdentity:persistentID:storeID:globalPlaylistID:al bumCloudLibraryID:artistCloudLibraryID:entityType:time:",  a3,  a4,  a5,  a6,  0LL,  0LL,  0LL,  a7,  a8);
}

- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 globalPlaylistID:(id)a6 time:(id)a7
{
  return (SagaFavoriteEntityOperation *)-[SagaFavoriteEntityOperation _initWithConfiguration:clientIdentity:persistentID:storeID:globalPlaylistID:albumCloudLibraryID:artistCloudLibraryID:entityType:time:]( self,  "_initWithConfiguration:clientIdentity:persistentID:storeID:globalPlaylistID:al bumCloudLibraryID:artistCloudLibraryID:entityType:time:",  a3,  a4,  a5,  0LL,  a6,  0LL,  0LL,  1LL,  a7);
}

- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 albumCloudLibraryID:(id)a6 time:(id)a7
{
  return (SagaFavoriteEntityOperation *)-[SagaFavoriteEntityOperation _initWithConfiguration:clientIdentity:persistentID:storeID:globalPlaylistID:albumCloudLibraryID:artistCloudLibraryID:entityType:time:]( self,  "_initWithConfiguration:clientIdentity:persistentID:storeID:globalPlaylistID:al bumCloudLibraryID:artistCloudLibraryID:entityType:time:",  a3,  a4,  a5,  0LL,  0LL,  a6,  0LL,  3LL,  a7);
}

- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 artistCloudLibraryID:(id)a6 time:(id)a7
{
  return (SagaFavoriteEntityOperation *)-[SagaFavoriteEntityOperation _initWithConfiguration:clientIdentity:persistentID:storeID:globalPlaylistID:albumCloudLibraryID:artistCloudLibraryID:entityType:time:]( self,  "_initWithConfiguration:clientIdentity:persistentID:storeID:globalPlaylistID:al bumCloudLibraryID:artistCloudLibraryID:entityType:time:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  a6,  2LL,  a7);
}

- (id)_initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 storeID:(int64_t)a6 globalPlaylistID:(id)a7 albumCloudLibraryID:(id)a8 artistCloudLibraryID:(id)a9 entityType:(int64_t)a10 time:(id)a11
{
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a11;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SagaFavoriteEntityOperation;
  v21 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v32,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v22 = v21;
  if (v21)
  {
    v21->super._status = a6;
    v21->super._error = (NSError *)a5;
    v23 = (NSString *)[v20 copy];
    albumCloudLibraryID = v22->_albumCloudLibraryID;
    v22->_albumCloudLibraryID = v23;

    id v25 = [v17 copy];
    adamID = (void *)v22->_adamID;
    v22->_adamID = (int64_t)v25;

    id v27 = [v18 copy];
    persistentID = (void *)v22->_persistentID;
    v22->_persistentID = (int64_t)v27;

    v29 = (NSString *)[v19 copy];
    globalPlaylistID = v22->_globalPlaylistID;
    v22->_globalPlaylistID = v29;

    v22->_artistCloudLibraryID = (NSString *)a10;
  }

  return v22;
}

- (BOOL)isPersistent
{
  return 1;
}

- (SagaFavoriteEntityOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SagaFavoriteEntityOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v23, "initWithCoder:", v4);
  if (v5)
  {
    v5->super._status = (int64_t)[v4 decodeInt64ForKey:@"SagaFavoriteEntityOperationAdamIDKey"];
    v5->super._error = (NSError *)[v4 decodeInt64ForKey:@"SagaFavoriteEntityOperationPersistentIDKey"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v6),  @"SagaFavoriteEntityOperationGlobalPlaylistIDKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    adamID = (void *)v5->_adamID;
    v5->_adamID = v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"SagaFavoriteEntityOperationCloudAlbumIDKey");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    persistentID = (void *)v5->_persistentID;
    v5->_persistentID = v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"SagaFavoriteEntityOperationCloudArtistIDKey");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    globalPlaylistID = v5->_globalPlaylistID;
    v5->_globalPlaylistID = (NSString *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v18),  @"SagaFavoriteEntityOperationTimeStampKey");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    albumCloudLibraryID = v5->_albumCloudLibraryID;
    v5->_albumCloudLibraryID = (NSString *)v20;

    v5->_artistCloudLibraryID = (NSString *)[v4 decodeIntegerForKey:@"SagaFavoriteEntityOperationTypeKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaFavoriteEntityOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"SagaFavoriteEntityOperationAdamIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeInt64:self->super._error forKey:@"SagaFavoriteEntityOperationPersistentIDKey"];
  [v4 encodeObject:self->_albumCloudLibraryID forKey:@"SagaFavoriteEntityOperationTimeStampKey"];
  [v4 encodeObject:self->_adamID forKey:@"SagaFavoriteEntityOperationGlobalPlaylistIDKey"];
  [v4 encodeObject:self->_persistentID forKey:@"SagaFavoriteEntityOperationCloudAlbumIDKey"];
  [v4 encodeObject:self->_globalPlaylistID forKey:@"SagaFavoriteEntityOperationCloudArtistIDKey"];
  [v4 encodeInteger:self->_artistCloudLibraryID forKey:@"SagaFavoriteEntityOperationTypeKey"];
}

- (id)description
{
  int64_t status = self->super._status;
  int64_t adamID = self->_adamID;
  int64_t persistentID = self->_persistentID;
  globalPlaylistID = self->_globalPlaylistID;
  uint64_t v7 = NSStringFromICFavoriteMediaEntityType(self->_artistCloudLibraryID);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<SagaFavoriteEntityOperation=%p, adamID=%lld, globalPlaylistID=%@, albumCloudLibraryID=%@, artistCloudLibraryID=%@, entityType=%@, _persistentID=%lld, timeStamp=%@>",  self,  status,  adamID,  persistentID,  globalPlaylistID,  v8,  self->super._error,  self->_albumCloudLibraryID));

  return v9;
}

- (void)main
{
  v3 = objc_autoreleasePoolPush();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003ADF4;
  v4[3] = &unk_1001A5C68;
  v4[4] = self;
  -[SagaFavoriteEntityOperation _canRunOperationWithCompletionHandler:]( self,  "_canRunOperationWithCompletionHandler:",  v4);
  objc_autoreleasePoolPop(v3);
}

- (unsigned)_currentDatabaseRevision
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  unsigned int v3 = [v2 sagaOnDiskDatabaseRevision];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)_setCloudIDsFromResponse:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 addedItems]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromICFavoriteMediaEntityType(self->_artistCloudLibraryID);
    v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(v8);
    int64_t status = self->super._status;
    int64_t adamID = self->_adamID;
    int64_t persistentID = self->_persistentID;
    globalPlaylistID = self->_globalPlaylistID;
    *(_DWORD *)buf = 138544898;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v39 = v9;
    *(_WORD *)v40 = 2048;
    *(void *)&v40[2] = status;
    *(_WORD *)&v40[10] = 2114;
    *(void *)&v40[12] = adamID;
    __int16 v41 = 2114;
    int64_t v42 = persistentID;
    __int16 v43 = 2114;
    v44 = globalPlaylistID;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Processing success response with addedItems=%{public}@ for entity type=%{public}@, storeID:%lld, global PlaylistID:%{public}@, cloudAlbumID=%{public}@, cloudArtistID=%{public}@",  buf,  0x48u);
  }

  switch((unint64_t)self->_artistCloudLibraryID)
  {
    case 0uLL:
      if (self->super._status)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
        sub_10011439C(v5, v6, v14);

        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        v39 = sub_10003A734;
        *(void *)v40 = sub_10003A744;
        *(void *)&v40[8] = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertySubscriptionStoreItemID,  self->super._status));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:]( &OBJC_CLASS___ML3Track,  "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:",  v6,  v15,  &__NSArray0__struct,  0LL));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_10003A74C;
        v37[3] = &unk_1001A2EF0;
        v37[4] = buf;
        [v16 enumeratePersistentIDsUsingBlock:v37];
        if ([*(id *)(*(void *)&buf[8] + 40) count])
        {
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_10003A7A0;
          v36[3] = &unk_1001A6CD0;
          v36[4] = self;
          v36[5] = buf;
          [v6 performDatabaseTransactionWithBlock:v36];
        }

        _Block_object_dispose(buf, 8);
      }

      break;
    case 1uLL:
      if (self->_adamID)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:"));
        if (_NSIsNSNumber())
        {
          id v20 = [v19 longLongValue];
          os_log_t v21 = (os_log_t)objc_claimAutoreleasedReturnValue( -[SagaFavoriteEntityOperation _containerPidsMatchingRequestGlobalPlaylistID]( self,  "_containerPidsMatchingRequestGlobalPlaylistID"));
          if (-[os_log_s count](v21, "count"))
          {
            *(void *)buf = 0LL;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000LL;
            LOBYTE(v39) = 0;
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472LL;
            v31[2] = sub_10003A84C;
            v31[3] = &unk_1001A26E8;
            v31[4] = self;
            os_log_t v21 = v21;
            os_log_t v32 = v21;
            v34 = buf;
            id v35 = v20;
            id v33 = v6;
            [v33 performDatabaseTransactionWithBlock:v31];

            _Block_object_dispose(buf, 8);
          }
        }

        else
        {
          os_log_t v21 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            int64_t v24 = self->_adamID;
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2114;
            v39 = (uint64_t (*)(uint64_t, uint64_t))v19;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@ Could not set store_cloud_id for playlist with globalID=%{public}@ as cloudid=%{public}@ is not a number",  buf,  0x20u);
          }
        }
      }

      break;
    case 2uLL:
      break;
    case 3uLL:
      if (self->super._status)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:"));
        objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v22]);

        if (_NSIsNSString(v23))
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_10003A974;
          v28[3] = &unk_1001A69E0;
          v28[4] = self;
          id v29 = v23;
          id v30 = v6;
          [v30 performDatabaseTransactionWithBlock:v28];
        }

        else
        {
          id v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            int64_t v26 = self->super._status;
            error = self->super._error;
            *(_DWORD *)buf = 138544130;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v26;
            *(_WORD *)&buf[22] = 2048;
            v39 = (uint64_t (*)(uint64_t, uint64_t))error;
            *(_WORD *)v40 = 2114;
            *(void *)&v40[2] = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}@ Could not set cloud_library_id for album with adamID=%lld, persistentID=%lld as cloudid=%{publi c}@ is not a string",  buf,  0x2Au);
          }
        }
      }

      break;
    default:
      id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        artistCloudLibraryID = self->_artistCloudLibraryID;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (_DWORD)artistCloudLibraryID;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@ EntityType=%d is not supported",  buf,  0x12u);
      }

      break;
  }
}

- (void)_revertPendingFavoriteEntityForPermanentlyFailedOperation
{
  unsigned int v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = NSStringFromICFavoriteMediaEntityType(self->_artistCloudLibraryID);
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int64_t status = self->super._status;
    int64_t adamID = self->_adamID;
    int64_t persistentID = self->_persistentID;
    globalPlaylistID = self->_globalPlaylistID;
    int v10 = 138544642;
    id v11 = self;
    __int16 v12 = 2114;
    v13 = v5;
    __int16 v14 = 2048;
    int64_t v15 = status;
    __int16 v16 = 2114;
    int64_t v17 = adamID;
    __int16 v18 = 2114;
    int64_t v19 = persistentID;
    __int16 v20 = 2114;
    os_log_t v21 = globalPlaylistID;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Processing failed response for entity type=%{public}@, storeID:%lld, globalPlaylistID:%{public}@, cloud AlbumID=%{public}@, cloudArtistID=%{public}@",  (uint8_t *)&v10,  0x3Eu);
  }

  switch((unint64_t)self->_artistCloudLibraryID)
  {
    case 0uLL:
      -[SagaFavoriteEntityOperation _revertFavoritingEntityTypeTrack](self, "_revertFavoritingEntityTypeTrack");
      break;
    case 1uLL:
      -[SagaFavoriteEntityOperation _revertFavoritingEntityTypePlaylist](self, "_revertFavoritingEntityTypePlaylist");
      break;
    case 2uLL:
      -[SagaFavoriteEntityOperation _revertFavoritingEntityTypeArtist](self, "_revertFavoritingEntityTypeArtist");
      break;
    case 3uLL:
      -[SagaFavoriteEntityOperation _revertFavoritingEntityTypeAlbum](self, "_revertFavoritingEntityTypeAlbum");
      break;
    default:
      return;
  }

- (void)_revertFavoritingEntityTypeTrack
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v4 = v3;
  if (self->super._status)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10003A624;
    v10[3] = &unk_1001A6598;
    v10[4] = self;
    [v3 performDatabaseTransactionWithBlock:v10];
  }

  else
  {
    objc_super v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromICFavoriteMediaEntityType(self->_artistCloudLibraryID);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int64_t status = self->super._status;
      error = self->super._error;
      *(_DWORD *)buf = 138544130;
      __int16 v12 = self;
      __int16 v13 = 2114;
      __int16 v14 = v7;
      __int16 v15 = 2048;
      int64_t v16 = status;
      __int16 v17 = 2048;
      __int16 v18 = error;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@ Invalid identifier to revert favoriting entityType=%{public}@, adamID=%lld, persistentID=%lld",  buf,  0x2Au);
    }
  }
}

- (void)_revertFavoritingEntityTypePlaylist
{
  if (self->_adamID)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3ContainerPropertyStoreCloudID,  0LL));
    v33[0] = v3;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  ML3ContainerPropertyCloudGlobalID,  self->_adamID));
    v33[1] = v4;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3ContainerPropertyContainerPersistentId,  self->super._error));
    v33[2] = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL));
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v6));

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Container anyInLibrary:predicate:]( &OBJC_CLASS___ML3Container,  "anyInLibrary:predicate:",  v8,  v7));

    if (v9)
    {
      unsigned int v10 = [v9 deleteFromLibrary];
      id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      os_log_t v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int64_t adamID = self->_adamID;
          int v25 = 138543618;
          int64_t v26 = self;
          __int16 v27 = 2114;
          int64_t v28 = adamID;
          __int16 v14 = "%{public}@ Deleted playlist with global id: %{public}@";
          __int16 v15 = v12;
          os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
          uint32_t v17 = 22;
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v25, v17);
        }

- (void)_revertFavoritingEntityTypeAlbum
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v4 = v3;
  if (self->super._status)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10003A100;
    v13[3] = &unk_1001A64D0;
    v13[4] = self;
    id v14 = v3;
    [v14 performDatabaseTransactionWithBlock:v13];
    id v5 = v14;
LABEL_5:

    goto LABEL_6;
  }

  if (self->_persistentID)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10003A3D8;
    v11[3] = &unk_1001A64D0;
    v11[4] = self;
    id v12 = v3;
    [v12 performDatabaseTransactionWithBlock:v11];
    id v5 = v12;
    goto LABEL_5;
  }

  uint64_t v6 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromICFavoriteMediaEntityType(self->_artistCloudLibraryID);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int64_t status = self->super._status;
    int64_t persistentID = self->_persistentID;
    *(_DWORD *)buf = 138544130;
    os_log_type_t v16 = self;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    int64_t v20 = status;
    __int16 v21 = 2114;
    int64_t v22 = persistentID;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@ Invalid identifier to revert favoriting entityType=%{public}@, adamID=%lld, cloudLibraryID=%{public}@",  buf,  0x2Au);
  }

LABEL_6:
}

- (void)_revertFavoritingEntityTypeArtist
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v4 = v3;
  if (self->super._status)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100039CE8;
    v13[3] = &unk_1001A64D0;
    v13[4] = self;
    id v14 = v3;
    [v14 performDatabaseTransactionWithBlock:v13];
    id v5 = v14;
LABEL_5:

    goto LABEL_6;
  }

  if (self->_globalPlaylistID)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100039F00;
    v11[3] = &unk_1001A64D0;
    v11[4] = self;
    id v12 = v3;
    [v12 performDatabaseTransactionWithBlock:v11];
    id v5 = v12;
    goto LABEL_5;
  }

  uint64_t v6 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromICFavoriteMediaEntityType(self->_artistCloudLibraryID);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int64_t status = self->super._status;
    globalPlaylistID = self->_globalPlaylistID;
    *(_DWORD *)buf = 138544130;
    os_log_type_t v16 = self;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    int64_t v20 = status;
    __int16 v21 = 2114;
    int64_t v22 = globalPlaylistID;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@ Invalid identifier to revert favoriting entityType=%{public}@, adamID=%lld, cloudUniversalLibraryID=%{public}@",  buf,  0x2Au);
  }

LABEL_6:
}

- (BOOL)_recomputeInUsersLibraryForTrackPids:(id)a3 resetFavoriteState:(BOOL)a4 usingConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 1;
  if ([v8 count])
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
    unsigned int v11 = sub_100114150(v10);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    id v13 = [v12 sagaCloudFavoriteSongAddToLibraryBehavior];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentDeviceFavoriteSongsPlaylist]);

    if (v15)
    {
      os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForProperty:ML3ContainerPropertyKeepLocal]);
      signed int v17 = [v16 intValue];

      BOOL v18 = v17 > 0;
    }

    else
    {
      BOOL v18 = 0;
    }

    if (v13 == (id)1) {
      unsigned int v19 = v11;
    }
    else {
      unsigned int v19 = 0;
    }
    int v20 = v18 | v19;
    __int16 v21 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v37 = self;
      __int16 v38 = 1024;
      unsigned int v39 = v11;
      __int16 v40 = 1024;
      BOOL v41 = v13 == (id)1;
      __int16 v42 = 1024;
      BOOL v43 = v18;
      __int16 v44 = 1024;
      int v45 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@ _recomputeInUsersLibraryForTrackPids isAutomaticDownloadsEnabled=%{BOOL}u, addToLibraryBehaviorWhenFa voriting=%d, isFSPPinned=%{BOOL}u, shouldDownloadTrack=%{BOOL}u",  buf,  0x24u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000398A4;
    v26[3] = &unk_1001A2710;
    BOOL v30 = a4;
    __int16 v29 = &v32;
    id v22 = v9;
    id v27 = v22;
    int64_t v28 = self;
    char v31 = v20;
    [v8 enumerateObjectsUsingBlock:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100039C8C;
    v25[3] = &unk_1001A5C68;
    v25[4] = self;
    [v22 enqueueBlockForTransactionCommit:v25];
  }

  BOOL v23 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v32, 8);

  return v23;
}

- (id)_containerPidsMatchingRequestGlobalPlaylistID
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3ContainerPropertyStoreCloudID,  0LL));
  v14[0] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  ML3ContainerPropertyCloudGlobalID,  self->_adamID));
  v14[1] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Container queryWithLibrary:predicate:usingSections:]( &OBJC_CLASS___ML3Container,  "queryWithLibrary:predicate:usingSections:",  v3,  v8,  0LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100039858;
  v12[3] = &unk_1001A6458;
  id v10 = v4;
  id v13 = v10;
  [v9 enumeratePersistentIDsUsingBlock:v12];

  return v10;
}

- (void)_canRunOperationWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  id v5 = objc_alloc(&OBJC_CLASS___CloudPendingChangesCoordinator);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
  id v8 = -[CloudPendingChangesCoordinator initWithConfiguration:prefix:loggable:]( v5,  "initWithConfiguration:prefix:loggable:",  v6,  @"Saga",  objc_opt_class(&OBJC_CLASS___SagaLibrary, v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation userIdentity](self, "userIdentity"));
  id v26 = 0LL;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 getPropertiesForUserIdentity:v10 error:&v26]);
  id v12 = v26;

  if (!v11 || v12)
  {
    __int16 v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation userIdentity](self, "userIdentity"));
      *(_DWORD *)buf = 138543874;
      char v31 = self;
      __int16 v32 = 2114;
      id v33 = v16;
      __int16 v34 = 2114;
      id v35 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@ loading account properties for %{public}@ failed with error: %{public}@",  buf,  0x20u);
    }

    -[CloudPendingChangesCoordinator addPendingChange:](v8, "addPendingChange:", self);
    if (!v4) {
      goto LABEL_9;
    }
LABEL_8:
    v4[2](v4, 0LL);
    goto LABEL_9;
  }

  if ([v11 isActiveLocker])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation userIdentity](self, "userIdentity"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100039664;
    v22[3] = &unk_1001A2738;
    BOOL v23 = v8;
    int64_t v24 = self;
    int v25 = v4;
    [v13 getSubscriptionStatusForUserIdentity:v14 withCompletionHandler:v22];

    goto LABEL_9;
  }

  signed int v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v31 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@ Cannot run operation as iCloud Music Library is not enabled",  buf,  0xCu);
  }

  uint64_t v18 = MSVAutoBugCaptureDomainMusicLibrary;
  id v27 = @"FavoriteChangeOperation";
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[SagaFavoriteEntityOperation description](self, "description"));
  int64_t v28 = v19;
  int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  __int16 v29 = v20;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  +[MSVAutoBugCapture snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:]( &OBJC_CLASS___MSVAutoBugCapture,  "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:",  v18,  @"Bug",  @"OFT-FavoriteEntityWithCloudLibraryOff",  @"Unsupported API call",  0LL,  v21,  0LL);

  -[SagaFavoriteEntityOperation _revertPendingFavoriteEntityForPermanentlyFailedOperation]( self,  "_revertPendingFavoriteEntityForPermanentlyFailedOperation");
  if (v4) {
    goto LABEL_8;
  }
LABEL_9:
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end