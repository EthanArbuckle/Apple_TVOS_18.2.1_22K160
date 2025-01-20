@interface SagaCollaborationJoinOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationJoinOperation)initWithCoder:(id)a3;
- (SagaCollaborationJoinOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 globalPlaylistID:(id)a5 invitationURL:(id)a6;
- (id)description;
- (unint64_t)resultingPlaylistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationJoinOperation

- (SagaCollaborationJoinOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 globalPlaylistID:(id)a5 invitationURL:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SagaCollaborationJoinOperation;
  v13 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v16,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 90), a5);
    objc_storeStrong((id *)(v14 + 98), a6);
  }

  return (SagaCollaborationJoinOperation *)v14;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: [%@]>",  objc_opt_class(self, a2),  self,  *(int64_t *)((char *)&self->super.super._status + 2));
}

- (SagaCollaborationJoinOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SagaCollaborationJoinOperation;
  v6 = -[CloudLibraryOperation initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"SagaCollaborationJoinOperationCollaborationGlobalPlaylistIDKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = *(void **)(v6 + 90);
    *(void *)(v6 + 90) = v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"SagaCollaborationJoinOperationCollaborationInvitationURLKey");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = *(void **)(v6 + 98);
    *(void *)(v6 + 98) = v12;
  }

  return (SagaCollaborationJoinOperation *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCollaborationJoinOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  *(int64_t *)((char *)&self->super.super._status + 2),  @"SagaCollaborationJoinOperationCollaborationGlobalPlaylistIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:*(NSError **)((char *)&self->super.super._error + 2) forKey:@"SagaCollaborationJoinOperationCollaborationInvitationURLKey"];
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
    uint64_t v4 = *(int64_t *)((char *)&self->super.super._status + 2);
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super._error + 2);
    *(_DWORD *)buf = 138543874;
    objc_super v16 = self;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    __int16 v19 = 2114;
    uint64_t v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting operation to join collaboration %{public}@. link='%{public}@'",  buf,  0x20u);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SagaCollaborationJoinOperation;
  -[CloudLibraryConcurrentOperation start](&v14, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SagaCollaborationJoinOperation description](self, "description"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - XPCTransaction"),  v6));

  id v8 = [[MSVXPCTransaction alloc] initWithName:v7];
  [v8 beginTransaction];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  uint64_t v10 = -[ICCollaborationJoinRequest initWithDatabaseID:globalPlaylistID:invitationURL:]( [ICCollaborationJoinRequest alloc],  "initWithDatabaseID:globalPlaylistID:invitationURL:",  [v9 databaseID],  *(int64_t *)((char *)&self->super.super._status + 2),  *(NSError **)((char *)&self->super.super._error + 2));
  -[ICDRequest setVerificationInteractionLevel:](v10, "setVerificationInteractionLevel:", 2LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000A0078;
  v12[3] = &unk_1001A6E30;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v9 sendRequest:v10 withResponseHandler:v12];
}

- (unint64_t)resultingPlaylistCloudLibraryID
{
  return *(unint64_t *)((char *)&self->_globalPlaylistID + 2);
}

- (BOOL)libraryUpdateRequired
{
  return *(&self->super._finished + 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end