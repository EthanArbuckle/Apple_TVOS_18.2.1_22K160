@interface SagaCollaborationEndOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationEndOperation)initWithCoder:(id)a3;
- (SagaCollaborationEndOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 collaborationPersistentID:(int64_t)a5;
- (id)description;
- (unint64_t)resultingPlaylistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationEndOperation

- (SagaCollaborationEndOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 collaborationPersistentID:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaCollaborationEndOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v7,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (result) {
    *(int64_t *)((char *)&result->super.super._status + 2) = a5;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: [%lld]>",  objc_opt_class(self, a2),  self,  *(int64_t *)((char *)&self->super.super._status + 2));
}

- (SagaCollaborationEndOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SagaCollaborationEndOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationEndOperationCollaborationPersistentIDKey"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v6),  @"SagaCollaborationEndOperationCollaborationGlobalPlaylistIDKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v10),  @"SagaCollaborationEndOperationCollaborationCloudLibraryIDKey");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = *(void **)(v5 + 106);
    *(void *)(v5 + 106) = v12;
  }

  return (SagaCollaborationEndOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCollaborationEndOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  *(int64_t *)((char *)&self->super.super._status + 2),  @"SagaCollaborationEndOperationCollaborationPersistentIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:*(NSError **)((char *)&self->super.super._error + 2) forKey:@"SagaCollaborationEndOperationCollaborationGlobalPlaylistIDKey"];
  [v4 encodeObject:*(void *)(&self->super._finished + 1) forKey:@"SagaCollaborationEndOperationCollaborationCloudLibraryIDKey"];
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
    v33 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting operation to end collaboration",  buf,  0xCu);
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SagaCollaborationEndOperation;
  -[CloudLibraryConcurrentOperation start](&v30, "start");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SagaCollaborationEndOperation description](self, "description"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - XPCTransaction"),  v4));

  id v6 = [[MSVXPCTransaction alloc] initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc(&OBJC_CLASS___ML3Container);
  uint64_t v8 = *(int64_t *)((char *)&self->super.super._status + 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  uint64_t v11 = ML3ContainerPropertyCloudGlobalID;
  uint64_t v12 = ML3ContainerPropertyStoreCloudID;
  v31[0] = ML3ContainerPropertyCloudGlobalID;
  v31[1] = ML3ContainerPropertyStoreCloudID;
  uint64_t v13 = ML3ContainerPropertyIsOwner;
  v31[2] = ML3ContainerPropertyIsOwner;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v10 getValuesForProperties:v14]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v13]);
  unsigned int v17 = [v16 BOOLValue];

  if (![*(id *)((char *)&self->super.super._error + 2) length])
  {
    v18 = (NSError *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v11]);
    v19 = *(NSError **)((char *)&self->super.super._error + 2);
    *(NSError **)((char *)&self->super.super._error + 2) = v18;
  }

  if (![*(id *)(&self->super._finished + 1) unsignedLongLongValue])
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v12]);
    v21 = *(void **)(&self->super._finished + 1);
    *(void *)(&self->super._finished + 1) = v20;
  }

  if ([*(id *)((char *)&self->super.super._error + 2) length]
    && [*(id *)(&self->super._finished + 1) unsignedLongLongValue])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    if (v17) {
      v23 = -[ICCollaborationEndRequest initWithDatabaseID:playlistSagaID:]( [ICCollaborationEndRequest alloc],  "initWithDatabaseID:playlistSagaID:",  [v22 databaseID],  objc_msgSend(*(id *)(&self->super._finished + 1), "unsignedLongLongValue"));
    }
    else {
      v23 = -[ICCollaborationLeaveRequest initWithDatabaseID:globalPlaylistID:]( [ICCollaborationLeaveRequest alloc],  "initWithDatabaseID:globalPlaylistID:",  [v22 databaseID],  *(NSError **)((char *)&self->super.super._error + 2));
    }
    v25 = v23;
    -[ICDRequest setVerificationInteractionLevel:](v23, "setVerificationInteractionLevel:", 2LL);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100066DA8;
    v26[3] = &unk_1001A3990;
    v26[4] = self;
    char v29 = v17;
    id v27 = v10;
    id v28 = v6;
    [v22 sendRequest:v25 withResponseHandler:v26];
  }

  else
  {
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 3LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICCloudClientErrorDomain,  2003LL,  @"Missing cloud IDs"));
    -[CloudLibraryOperation setError:](self, "setError:", v24);

    [v6 endTransaction];
    -[CloudLibraryConcurrentOperation finish](self, "finish");
  }
}

- (unint64_t)resultingPlaylistCloudLibraryID
{
  return *(unint64_t *)((char *)&self->_globalPlaylistID + 2);
}

- (BOOL)libraryUpdateRequired
{
  return BYTE2(self->_collaborationPersistentID);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end