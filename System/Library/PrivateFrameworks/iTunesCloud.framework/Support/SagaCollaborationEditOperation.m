@interface SagaCollaborationEditOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationEditOperation)initWithCoder:(id)a3;
- (SagaCollaborationEditOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 collaborationPersistentID:(int64_t)a5 properties:(id)a6 trackEdits:(id)a7;
- (id)description;
- (unint64_t)playlistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationEditOperation

- (SagaCollaborationEditOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 collaborationPersistentID:(int64_t)a5 properties:(id)a6 trackEdits:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SagaCollaborationEditOperation;
  v15 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v18,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v16 = v15;
  if (v15)
  {
    *(void *)(v15 + 90) = a5;
    objc_storeStrong((id *)(v15 + 98), a6);
    objc_storeStrong((id *)(v16 + 106), a7);
  }

  return (SagaCollaborationEditOperation *)v16;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: [%llu]>",  objc_opt_class(self, a2),  self,  *(int64_t *)((char *)&self->super.super._status + 2));
}

- (SagaCollaborationEditOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SagaCollaborationEditOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v25, "initWithCoder:", v4);
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationEditOperationPersistentIDKey"];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    id v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSString, v12),  0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"SagaCollaborationEditOperationPropertiesKey"]);
    v16 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v15;

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v17);
    v20 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v18,  objc_opt_class(&OBJC_CLASS___ICCloudClientCollaborationEditParams, v19),  0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v21 forKey:@"SagaCollaborationEditOperationTrackEditsKey"]);
    v23 = *(void **)(v5 + 106);
    *(void *)(v5 + 106) = v22;
  }

  return (SagaCollaborationEditOperation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaCollaborationEditOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  *(int64_t *)((char *)&self->super.super._status + 2),  @"SagaCollaborationEditOperationPersistentIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:*(NSError **)((char *)&self->super.super._error + 2) forKey:@"SagaCollaborationEditOperationPropertiesKey"];
  [v4 encodeObject:*(void *)(&self->super._finished + 1) forKey:@"SagaCollaborationEditOperationTrackEditsKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(int64_t *)((char *)&self->super.super._status + 2);
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super._error + 2);
    uint64_t v6 = *(void *)(&self->super._finished + 1);
    *(_DWORD *)buf = 138544130;
    v26 = self;
    __int16 v27 = 2048;
    uint64_t v28 = v4;
    __int16 v29 = 2114;
    uint64_t v30 = v5;
    __int16 v31 = 2114;
    uint64_t v32 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting operation to edit collaboration %llu. properties = %{public}@, trackEdits = %{public}@",  buf,  0x2Au);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SagaCollaborationEditOperation;
  -[CloudLibraryConcurrentOperation start](&v24, "start");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SagaCollaborationEditOperation description](self, "description"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - XPCTransaction"),  v7));

  id v9 = [[MSVXPCTransaction alloc] initWithName:v8];
  [v9 beginTransaction];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  LODWORD(v12) = [v11 sagaOnDiskDatabaseRevision];

  else {
    uint64_t v12 = v12;
  }
  id v13 = objc_alloc(&OBJC_CLASS___ML3Container);
  uint64_t v14 = *(int64_t *)((char *)&self->super.super._status + 2);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v16 = [v13 initWithPersistentID:v14 inLibrary:v15];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForProperty:ML3ContainerPropertyStoreCloudID]);
  uint64_t v18 = -[ICCollaborationEditRequest initWithDatabaseID:playlistSagaID:cloudLibraryRevision:properties:trackEdits:]( [ICCollaborationEditRequest alloc],  "initWithDatabaseID:playlistSagaID:cloudLibraryRevision:properties:trackEdits:",  [v10 databaseID],  objc_msgSend(v17, "unsignedLongLongValue"),  v12,  *(NSError **)((char *)&self->super.super._error + 2),  *(void *)(&self->super._finished + 1));
  -[ICDRequest setVerificationInteractionLevel:](v18, "setVerificationInteractionLevel:", 2LL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001073E8;
  v21[3] = &unk_1001A6A58;
  v21[4] = self;
  id v22 = v17;
  id v23 = v9;
  id v19 = v9;
  id v20 = v17;
  [v10 sendRequest:v18 withResponseHandler:v21];
}

- (unint64_t)playlistCloudLibraryID
{
  return *(unint64_t *)((char *)&self->_properties + 2);
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