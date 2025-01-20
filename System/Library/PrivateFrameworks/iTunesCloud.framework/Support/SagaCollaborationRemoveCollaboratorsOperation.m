@interface SagaCollaborationRemoveCollaboratorsOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationRemoveCollaboratorsOperation)initWithCoder:(id)a3;
- (SagaCollaborationRemoveCollaboratorsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 socialProfileIDs:(id)a6;
- (id)description;
- (unint64_t)playlistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationRemoveCollaboratorsOperation

- (SagaCollaborationRemoveCollaboratorsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 socialProfileIDs:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SagaCollaborationRemoveCollaboratorsOperation;
  v12 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v15,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v13 = (SagaCollaborationRemoveCollaboratorsOperation *)v12;
  if (v12)
  {
    *(void *)(v12 + 90) = a5;
    objc_storeStrong((id *)(v12 + 98), a6);
  }

  return v13;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  uint64_t v4 = *(int64_t *)((char *)&self->super.super._status + 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super._error + 2), "msv_compactDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: [%lld ==> (%@)]>",  v3,  self,  v4,  v5));

  return v6;
}

- (SagaCollaborationRemoveCollaboratorsOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SagaCollaborationRemoveCollaboratorsOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v9, "initWithCoder:", v4);
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationRemoveCollaboratorsOperationPersistentIDKey"];
    uint64_t v6 = objc_claimAutoreleasedReturnValue( [v4 decodeObjectForKey:@"SagaCollaborationRemoveCollaboratorsOperationSocialProfileIDKey"]);
    v7 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v6;
  }

  return (SagaCollaborationRemoveCollaboratorsOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCollaborationRemoveCollaboratorsOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  *(int64_t *)((char *)&self->super.super._status + 2),  @"SagaCollaborationRemoveCollaboratorsOperationPersistentIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:*(NSError **)((char *)&self->super.super._error + 2) forKey:@"SagaCollaborationRemoveCollaboratorsOperationSocialProfileIDKey"];
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
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation", buf, 0xCu);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SagaCollaborationRemoveCollaboratorsOperation;
  -[CloudLibraryConcurrentOperation start](&v24, "start");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SagaCollaborationRemoveCollaboratorsOperation description](self, "description"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - XPCTransaction"),  v4));

  id v6 = [[MSVXPCTransaction alloc] initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc(&OBJC_CLASS___ML3Container);
  uint64_t v8 = *(int64_t *)((char *)&self->super.super._status + 2);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  uint64_t v11 = ML3ContainerPropertyCloudGlobalID;
  uint64_t v12 = ML3ContainerPropertyStoreCloudID;
  v25[0] = ML3ContainerPropertyCloudGlobalID;
  v25[1] = ML3ContainerPropertyStoreCloudID;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 getValuesForProperties:v13]);

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v12]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v18 = -[ICCollaborationRemoveCollaboratorsRequest initWithDatabaseID:globalPlaylistID:socialProfileIDs:]( [ICCollaborationRemoveCollaboratorsRequest alloc],  "initWithDatabaseID:globalPlaylistID:socialProfileIDs:",  [v17 databaseID],  v15,  *(NSError **)((char *)&self->super.super._error + 2));
  -[ICDRequest setVerificationInteractionLevel:](v18, "setVerificationInteractionLevel:", 2LL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000B29C4;
  v21[3] = &unk_1001A6A58;
  v21[4] = self;
  id v22 = v16;
  id v23 = v6;
  id v19 = v6;
  id v20 = v16;
  [v17 sendRequest:v18 withResponseHandler:v21];
}

- (unint64_t)playlistCloudLibraryID
{
  return *(int64_t *)((char *)&self->_persistentID + 2);
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