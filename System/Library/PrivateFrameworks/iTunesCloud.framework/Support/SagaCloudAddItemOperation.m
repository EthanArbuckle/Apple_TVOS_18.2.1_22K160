@interface SagaCloudAddItemOperation
+ (BOOL)supportsSecureCoding;
- (NSDictionary)adamIDToSagaIDMap;
- (SagaCloudAddItemOperation)initWithCoder:(id)a3;
- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 clientIdentity:(id)a5;
- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 referralAlbumAdamID:(int64_t)a5 clientIdentity:(id)a6;
- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 referralPlaylistGlobalID:(id)a5 clientIdentity:(id)a6;
- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logCloudAddRequestDescription;
- (void)processAddedItems:(id)a3;
- (void)removePendingAddedItemsForPermanentlyFailedOperation;
- (void)setAdamIDToSagaIDMap:(id)a3;
@end

@implementation SagaCloudAddItemOperation

- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 clientIdentity:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaCloudAddItemOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v7,  "initWithConfiguration:clientIdentity:",  a3,  a5);
  if (result) {
    *(int64_t *)((char *)&result->super.super._status + 1) = a4;
  }
  return result;
}

- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 referralAlbumAdamID:(int64_t)a5 clientIdentity:(id)a6
{
  result = -[SagaCloudAddItemOperation initWithConfiguration:adamID:clientIdentity:]( self,  "initWithConfiguration:adamID:clientIdentity:",  a3,  a4,  a6);
  if (result) {
    *(NSError **)((char *)&result->super.super._error + 1) = (NSError *)a5;
  }
  return result;
}

- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 referralPlaylistGlobalID:(id)a5 clientIdentity:(id)a6
{
  id v11 = a5;
  v12 = -[SagaCloudAddItemOperation initWithConfiguration:adamID:clientIdentity:]( self,  "initWithConfiguration:adamID:clientIdentity:",  a3,  a4,  a6);
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)(&v12->super._updateRequired + 1), a5);
  }

  return v13;
}

- (SagaCloudAddItemOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaCloudAddItemOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5) {
    *(void *)(v5 + 89) = [v4 decodeInt64ForKey:@"SagaCloudAddItemOperationAdamIDKey"];
  }

  return (SagaCloudAddItemOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCloudAddItemOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  *(int64_t *)((char *)&self->super.super._status + 1),  @"SagaCloudAddItemOperationAdamIDKey",  v5.receiver,  v5.super_class);
}

- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3
{
  return +[ICAddToLibraryRequest requestWithDatabaseID:databaseRevision:adamID:referralAlbumAdamID:referralPlaylistGlobalID:]( &OBJC_CLASS___ICAddToLibraryRequest,  "requestWithDatabaseID:databaseRevision:adamID:referralAlbumAdamID:referralPlaylistGlobalID:",  *(void *)&a3,  -[SagaCloudAddOperation currentDatabaseRevision](self, "currentDatabaseRevision"),  *(int64_t *)((char *)&self->super.super._status + 1),  *(NSError **)((char *)&self->super.super._error + 1),  *(void *)(&self->super._updateRequired + 1));
}

- (void)logCloudAddRequestDescription
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(int64_t *)((char *)&self->super.super._status + 1);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Cloud-add request for adam ID = %lld",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)processAddedItems:(id)a3
{
  id v4 = a3;
  -[SagaCloudAddItemOperation setAdamIDToSagaIDMap:](self, "setAdamIDToSagaIDMap:", v4);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  sub_10011439C(v4, v5, v6);

  objc_super v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating in_my_library for cloud-add success.",  v13,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v12 = objc_opt_class(self, v11);
  sub_1000E25BC(v8, v9, v10, v12, *(int64_t *)((char *)&self->super.super._status + 1));
}

- (void)removePendingAddedItemsForPermanentlyFailedOperation
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Updating in_my_library for cloud-add failure.",  v9,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v8 = objc_opt_class(self, v7);
  sub_1000E25BC(v4, v5, v6, v8, *(int64_t *)((char *)&self->super.super._status + 1));
}

- (NSDictionary)adamIDToSagaIDMap
{
  return *(NSDictionary **)((char *)&self->_adamID + 1);
}

- (void)setAdamIDToSagaIDMap:(id)a3
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