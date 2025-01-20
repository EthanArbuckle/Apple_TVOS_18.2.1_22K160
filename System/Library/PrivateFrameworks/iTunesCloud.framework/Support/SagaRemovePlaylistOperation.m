@interface SagaRemovePlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaRemovePlaylistOperation)initWithClientIdentity:(id)a3 PlaylistSagaIDs:(id)a4;
- (SagaRemovePlaylistOperation)initWithCoder:(id)a3;
- (SagaRemovePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistSagaIDs:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaRemovePlaylistOperation

- (SagaRemovePlaylistOperation)initWithClientIdentity:(id)a3 PlaylistSagaIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v8);
  v10 = -[SagaRemovePlaylistOperation initWithConfiguration:clientIdentity:playlistSagaIDs:]( self,  "initWithConfiguration:clientIdentity:playlistSagaIDs:",  v9,  v7,  v6);

  return v10;
}

- (SagaRemovePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistSagaIDs:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SagaRemovePlaylistOperation;
  v9 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v13,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (v9)
  {
    id v10 = [v8 copy];
    status = (void *)v9->super._status;
    v9->super._status = (int64_t)v10;
  }

  return v9;
}

- (SagaRemovePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SagaRemovePlaylistOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5)
  {
    if ([v4 decodeInt32ForKey:@"SagaRemovePlaylistOperationArchiveVersionKey"])
    {
      id v7 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(NSNumber, v6),  @"SagaRemovePlaylistOperationPlaylistSagaIDsKey");
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 decodeInt64ForKey:@"SagaRemovePlaylistOperationPlaylistSagaIDKey"]));
      v14 = v9;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    }

    id v10 = [v8 copy];
    status = (void *)v5->super._status;
    v5->super._status = (int64_t)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaRemovePlaylistOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  1,  @"SagaRemovePlaylistOperationArchiveVersionKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->super._status forKey:@"SagaRemovePlaylistOperationPlaylistSagaIDsKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  if ([(id)self->super._status count])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"SagaRemovePlaylistOperation - (saga_id count = %llu)",  [(id)self->super._status count]));
    id v4 = [[MSVXPCTransaction alloc] initWithName:v3];
    [v4 beginTransaction];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v5 setClientIdentity:v6];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkRemovePlaylistRequest requestWithDatabaseID:containerIDs:]( ICBulkRemovePlaylistRequest,  "requestWithDatabaseID:containerIDs:",  [v7 databaseID],  self->super._status));
    [v8 setVerificationInteractionLevel:2];
    v9 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class(v8, v10);
      v12 = NSStringFromClass(v11);
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if ([v8 method]) {
        v14 = @"POST";
      }
      else {
        v14 = @"GET";
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 action]);
      int64_t status = self->super._status;
      *(_DWORD *)buf = 138544386;
      v28 = v13;
      __int16 v29 = 2048;
      v30 = v8;
      __int16 v31 = 2114;
      v32 = v14;
      __int16 v33 = 2114;
      v34 = v15;
      __int16 v35 = 2114;
      int64_t v36 = status;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending delete request <%{public}@: %p method=%{public}@ action=%{public}@> for playlist saga ids: %{public}@",  buf,  0x34u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000A3A84;
    v23[3] = &unk_1001A6A58;
    id v24 = v8;
    v25 = self;
    dispatch_semaphore_t v26 = dispatch_semaphore_create(0LL);
    v17 = v26;
    id v18 = v8;
    [v7 sendRequest:v18 withResponseHandler:v23];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v20 = MSVTCCIdentityForCurrentProcess();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    [v19 setClientIdentity:v21];

    [v4 endTransaction];
  }

  else
  {
    v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No playlist saga ids to delete.", buf, 2u);
    }

    -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
  }

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end