@interface SagaCollaborationRespondToPendingCollaboratorOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationRespondToPendingCollaboratorOperation)initWithCoder:(id)a3;
- (SagaCollaborationRespondToPendingCollaboratorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 socialProfileID:(id)a6 approval:(BOOL)a7;
- (id)description;
- (unint64_t)playlistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationRespondToPendingCollaboratorOperation

- (SagaCollaborationRespondToPendingCollaboratorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 socialProfileID:(id)a6 approval:(BOOL)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SagaCollaborationRespondToPendingCollaboratorOperation;
  v14 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v17,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v15 = (SagaCollaborationRespondToPendingCollaboratorOperation *)v14;
  if (v14)
  {
    *(void *)(v14 + 90) = a5;
    objc_storeStrong((id *)(v14 + 98), a6);
    *(&v15->super._finished + 1) = a7;
  }

  return v15;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  if (*(&self->super._finished + 1)) {
    v4 = "approve";
  }
  else {
    v4 = "deny";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: [%lld, %@ ==> %s]>",  v3,  self,  *(int64_t *)((char *)&self->super.super._status + 2),  *(NSError **)((char *)&self->super.super._error + 2),  v4);
}

- (SagaCollaborationRespondToPendingCollaboratorOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SagaCollaborationRespondToPendingCollaboratorOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v9, "initWithCoder:", v4);
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationRespondToPendingCollaboratorOperationpersistentIDIDKey"];
    uint64_t v6 = objc_claimAutoreleasedReturnValue( [v4 decodeObjectForKey:@"SagaCollaborationRespondToPendingCollaboratorOperationSocialProfileIDKey"]);
    v7 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v6;

    v5[106] = [v4 decodeBoolForKey:@"SagaCollaborationRespondToPendingCollaboratorOperationApprovalKey"];
  }

  return (SagaCollaborationRespondToPendingCollaboratorOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCollaborationRespondToPendingCollaboratorOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  *(int64_t *)((char *)&self->super.super._status + 2),  @"SagaCollaborationRespondToPendingCollaboratorOperationpersistentIDIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:*(NSError **)((char *)&self->super.super._error + 2) forKey:@"SagaCollaborationRespondToPendingCollaboratorOperationSocialProfileIDKey"];
  [v4 encodeBool:*((unsigned __int8 *)&self->super._finished + 1) forKey:@"SagaCollaborationRespondToPendingCollaboratorOperationApprovalKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)start
{
  uint64_t v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting operation to respond to join collaboration request",  buf,  0xCu);
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SagaCollaborationRespondToPendingCollaboratorOperation;
  -[CloudLibraryConcurrentOperation start](&v20, "start");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SagaCollaborationRespondToPendingCollaboratorOperation description](self, "description"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - XPCTransaction"),  v4));

  id v6 = [[MSVXPCTransaction alloc] initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc(&OBJC_CLASS___ML3Container);
  uint64_t v8 = *(int64_t *)((char *)&self->super.super._status + 2);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:ML3ContainerPropertyCloudGlobalID]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:ML3ContainerPropertyStoreCloudID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v14 = -[ICCollaborationRespondToPendingCollaboratorRequest initWithDatabaseID:globalPlaylistID:socialProfileID:approval:]( [ICCollaborationRespondToPendingCollaboratorRequest alloc],  "initWithDatabaseID:globalPlaylistID:socialProfileID:approval:",  [v13 databaseID],  v11,  *(NSError **)((char *)&self->super.super._error + 2),  *((unsigned __int8 *)&self->super._finished + 1));
  -[ICDRequest setVerificationInteractionLevel:](v14, "setVerificationInteractionLevel:", 2LL);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003C9FC;
  v17[3] = &unk_1001A6A58;
  v17[4] = self;
  id v18 = v12;
  id v19 = v6;
  id v15 = v6;
  id v16 = v12;
  [v13 sendRequest:v14 withResponseHandler:v17];
}

- (unint64_t)playlistCloudLibraryID
{
  return *(int64_t *)((char *)&self->_persistentID + 2);
}

- (BOOL)libraryUpdateRequired
{
  return *(&self->super._finished + 2);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end