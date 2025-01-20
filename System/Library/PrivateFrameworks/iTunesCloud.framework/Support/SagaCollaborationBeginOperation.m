@interface SagaCollaborationBeginOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationBeginOperation)initWithCoder:(id)a3;
- (SagaCollaborationBeginOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 sharingMode:(unint64_t)a6;
- (id)description;
- (unint64_t)resultingCollaborationCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationBeginOperation

- (SagaCollaborationBeginOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 sharingMode:(unint64_t)a6
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SagaCollaborationBeginOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v9,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (result)
  {
    *(int64_t *)((char *)&result->super.super._status + 2) = a5;
    *(NSError **)((char *)&result->super.super._error + 2) = (NSError *)a6;
  }

  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: [%lld]>",  objc_opt_class(self, a2),  self,  *(int64_t *)((char *)&self->super.super._status + 2));
}

- (SagaCollaborationBeginOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaCollaborationBeginOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationBeginOperationPlaylistPersistentIDIDKey"];
    *(void *)(v5 + 98) = (int)[v4 decodeIntForKey:@"SagaCollaborationBeginOperationPlaylistSharingModeKey"];
  }

  return (SagaCollaborationBeginOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCollaborationBeginOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  *(int64_t *)((char *)&self->super.super._status + 2),  @"SagaCollaborationBeginOperationPlaylistPersistentIDIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeInt:*(unsigned int *)((char *)&self->super.super._error + 2) forKey:@"SagaCollaborationBeginOperationPlaylistSharingModeKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting operation to begin collaboration",  buf,  0xCu);
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SagaCollaborationBeginOperation;
  -[CloudLibraryConcurrentOperation start](&v19, "start");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SagaCollaborationBeginOperation description](self, "description"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - XPCTransaction"),  v4));

  id v6 = [[MSVXPCTransaction alloc] initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc(&OBJC_CLASS___ML3Container);
  uint64_t v8 = *(int64_t *)((char *)&self->super.super._status + 2);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:ML3ContainerPropertyStoreCloudID]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v13 = -[ICCollaborationBeginRequest initWithDatabaseID:playlistSagaID:sharingMode:]( [ICCollaborationBeginRequest alloc],  "initWithDatabaseID:playlistSagaID:sharingMode:",  [v12 databaseID],  objc_msgSend(v11, "longLongValue"),  *(NSError **)((char *)&self->super.super._error + 2));
  -[ICDRequest setVerificationInteractionLevel:](v13, "setVerificationInteractionLevel:", 2LL);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002172C;
  v16[3] = &unk_1001A6A58;
  v16[4] = self;
  id v17 = v10;
  id v18 = v6;
  id v14 = v6;
  id v15 = v10;
  [v12 sendRequest:v13 withResponseHandler:v16];
}

- (unint64_t)resultingCollaborationCloudLibraryID
{
  return *(unint64_t *)((char *)&self->_persistentID + 2);
}

- (BOOL)libraryUpdateRequired
{
  return *(&self->super._finished + 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end