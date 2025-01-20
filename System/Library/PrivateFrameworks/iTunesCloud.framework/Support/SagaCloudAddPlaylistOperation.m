@interface SagaCloudAddPlaylistOperation
+ (BOOL)supportsSecureCoding;
- (NSDictionary)globalIDToSagaIDMap;
- (SagaCloudAddPlaylistOperation)initWithClientIdentity:(id)a3 playlistGlobalID:(id)a4;
- (SagaCloudAddPlaylistOperation)initWithCoder:(id)a3;
- (SagaCloudAddPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistGlobalID:(id)a5;
- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logCloudAddRequestDescription;
- (void)processAddedItems:(id)a3;
- (void)removePendingAddedItemsForPermanentlyFailedOperation;
- (void)setGlobalIDToSagaIDMap:(id)a3;
@end

@implementation SagaCloudAddPlaylistOperation

- (SagaCloudAddPlaylistOperation)initWithClientIdentity:(id)a3 playlistGlobalID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v8);
  v10 = -[SagaCloudAddPlaylistOperation initWithConfiguration:clientIdentity:playlistGlobalID:]( self,  "initWithConfiguration:clientIdentity:playlistGlobalID:",  v9,  v7,  v6);

  return v10;
}

- (SagaCloudAddPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistGlobalID:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SagaCloudAddPlaylistOperation;
  v10 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v13,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v11 = (SagaCloudAddPlaylistOperation *)v10;
  if (v10) {
    objc_storeStrong((id *)(v10 + 89), a5);
  }

  return v11;
}

- (SagaCloudAddPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SagaCloudAddPlaylistOperation;
  id v6 = -[CloudLibraryOperation initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"SagaCloudAddPlaylistOperationPlaylistGlobalIDKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    id v9 = *(void **)(v6 + 89);
    *(void *)(v6 + 89) = v8;
  }

  return (SagaCloudAddPlaylistOperation *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCloudAddPlaylistOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  *(int64_t *)((char *)&self->super.super._status + 1),  @"SagaCloudAddPlaylistOperationPlaylistGlobalIDKey",  v5.receiver,  v5.super_class);
}

- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3
{
  return +[ICAddToLibraryRequest requestWithDatabaseID:databaseRevision:playlistGlobalID:]( &OBJC_CLASS___ICAddToLibraryRequest,  "requestWithDatabaseID:databaseRevision:playlistGlobalID:",  *(void *)&a3,  -[SagaCloudAddOperation currentDatabaseRevision](self, "currentDatabaseRevision"),  *(int64_t *)((char *)&self->super.super._status + 1));
}

- (void)logCloudAddRequestDescription
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(int64_t *)((char *)&self->super.super._status + 1);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Cloud-add request for playlist global ID = %{public}@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)processAddedItems:(id)a3
{
  id v4 = a3;
  -[SagaCloudAddPlaylistOperation setGlobalIDToSagaIDMap:](self, "setGlobalIDToSagaIDMap:", v4);
  if ([v4 count])
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000E3438;
    v6[3] = &unk_1001A64D0;
    v6[4] = self;
    id v7 = v4;
    [v5 performDatabaseTransactionWithBlock:v6];
  }
}

- (void)removePendingAddedItemsForPermanentlyFailedOperation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3ContainerPropertyStoreCloudID,  0LL));
  v20[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  ML3ContainerPropertyCloudGlobalID,  *(int64_t *)((char *)&self->super.super._status + 1)));
  v20[1] = v4;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ML3Container anyInLibrary:predicate:](&OBJC_CLASS___ML3Container, "anyInLibrary:predicate:", v7, v6));

  if (v8)
  {
    unsigned int v9 = [v8 deleteFromLibrary];
    v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    objc_super v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(int64_t *)((char *)&self->super.super._status + 1);
        int v18 = 138543362;
        uint64_t v19 = v12;
        objc_super v13 = "Deleted pending playlist with global id: %{public}@";
LABEL_7:
        v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v15, v16, v13, (uint8_t *)&v18, 0xCu);
      }
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(int64_t *)((char *)&self->super.super._status + 1);
      int v18 = 138543362;
      uint64_t v19 = v17;
      objc_super v13 = "Failed to delete pending playlist with global id: %{public}@";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }

  else
  {
    objc_super v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(int64_t *)((char *)&self->super.super._status + 1);
      int v18 = 138543362;
      uint64_t v19 = v14;
      objc_super v13 = "Could not find a pending playlist to delete with global id: %{public}@";
      goto LABEL_7;
    }
  }
}

- (NSDictionary)globalIDToSagaIDMap
{
  return *(NSDictionary **)((char *)&self->super.super._error + 1);
}

- (void)setGlobalIDToSagaIDMap:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end