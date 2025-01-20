@interface SagaCollaborationResetInvitationURLOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (NSURL)updatedInvitationURL;
- (SagaCollaborationResetInvitationURLOperation)initWithCoder:(id)a3;
- (SagaCollaborationResetInvitationURLOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5;
- (id)description;
- (unint64_t)playlistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationResetInvitationURLOperation

- (SagaCollaborationResetInvitationURLOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaCollaborationResetInvitationURLOperation;
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

- (SagaCollaborationResetInvitationURLOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaCollaborationResetInvitationURLOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5) {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationResetInvitationURLOperationPersistentIDKey"];
  }

  return (SagaCollaborationResetInvitationURLOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCollaborationResetInvitationURLOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  *(int64_t *)((char *)&self->super.super._status + 2),  @"SagaCollaborationResetInvitationURLOperationPersistentIDKey",  v5.receiver,  v5.super_class);
}

- (BOOL)isPersistent
{
  return 0;
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation", buf, 0xCu);
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SagaCollaborationResetInvitationURLOperation;
  -[CloudLibraryConcurrentOperation start](&v25, "start");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SagaCollaborationResetInvitationURLOperation description](self, "description"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - XPCTransaction"),  v4));

  id v6 = [[MSVXPCTransaction alloc] initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc(&OBJC_CLASS___ML3Container);
  uint64_t v8 = *(int64_t *)((char *)&self->super.super._status + 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  uint64_t v11 = ML3ContainerPropertyCloudGlobalID;
  uint64_t v12 = ML3ContainerPropertyStoreCloudID;
  v26[0] = ML3ContainerPropertyCloudGlobalID;
  v26[1] = ML3ContainerPropertyStoreCloudID;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 getValuesForProperties:v13]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v12]);
  if ([v15 length] && objc_msgSend(v16, "longLongValue"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    v18 = -[ICCollaborationResetInvitationURLRequest initWithDatabaseID:globalPlaylistID:]( [ICCollaborationResetInvitationURLRequest alloc],  "initWithDatabaseID:globalPlaylistID:",  [v17 databaseID],  v15);
    -[ICDRequest setVerificationInteractionLevel:](v18, "setVerificationInteractionLevel:", 2LL);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10008EAC0;
    v21[3] = &unk_1001A40F8;
    v21[4] = self;
    id v22 = v10;
    id v23 = v16;
    id v24 = v6;
    [v17 sendRequest:v18 withResponseHandler:v21];
  }

  else
  {
    v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@ Missing playlist global or cloud ID - aborting",  buf,  0xCu);
    }

    -[CloudLibraryOperation setStatus:](self, "setStatus:", 3LL);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICCloudClientErrorDomain,  2003LL,  @"Missing playlist global or cloud ID"));
    -[CloudLibraryOperation setError:](self, "setError:", v20);

    [v6 endTransaction];
    -[CloudLibraryConcurrentOperation finish](self, "finish");
  }
}

- (NSURL)updatedInvitationURL
{
  return *(NSURL **)(&self->super._finished + 1);
}

- (unint64_t)playlistCloudLibraryID
{
  return *(int64_t *)((char *)&self->_persistentID + 2);
}

- (BOOL)libraryUpdateRequired
{
  return BYTE2(self->super.super._error);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end