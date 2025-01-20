@interface CloudSetAddToPlaylistBehaviorOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (CloudSetAddToPlaylistBehaviorOperation)initWithAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4;
- (CloudSetAddToPlaylistBehaviorOperation)initWithCoder:(id)a3;
- (CloudSetAddToPlaylistBehaviorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 addToPlaylistBehavior:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation CloudSetAddToPlaylistBehaviorOperation

- (CloudSetAddToPlaylistBehaviorOperation)initWithAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4
{
  id v6 = a4;
  v8 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v7);
  v9 = -[CloudSetAddToPlaylistBehaviorOperation initWithConfiguration:clientIdentity:addToPlaylistBehavior:]( self,  "initWithConfiguration:clientIdentity:addToPlaylistBehavior:",  v8,  v6,  a3);

  return v9;
}

- (CloudSetAddToPlaylistBehaviorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 addToPlaylistBehavior:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CloudSetAddToPlaylistBehaviorOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v7,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (result) {
    result->super._status = a5;
  }
  return result;
}

- (CloudSetAddToPlaylistBehaviorOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CloudSetAddToPlaylistBehaviorOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5) {
    v5->super._status = (int64_t)[v4 decodeIntegerForKey:@"CloudSetAddToPlaylistBehaviorOperationBehaviorIDKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CloudSetAddToPlaylistBehaviorOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"CloudSetAddToPlaylistBehaviorOperationBehaviorIDKey",  v5.receiver,  v5.super_class);
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  uint64_t StringForAddToPlaylistBehavior = ICCloudClientGetStringForAddToPlaylistBehavior(self->super._status);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(StringForAddToPlaylistBehavior);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CloudSetAddToPlaylistBehaviorOperation - (add to playlist behavior = %@)",  v4));
  id v6 = [[MSVXPCTransaction alloc] initWithName:v5];
  [v6 beginTransaction];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v7 setClientIdentity:v8];

  int64_t status = self->super._status;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  objc_msgSend((id)v11, "icd_setSagaCloudAddToPlaylistBehavior:", status);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  LODWORD(v11) = [v10 sagaOnDiskDatabaseRevision];

  else {
    uint64_t v11 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[ICSetAddToPlaylistBehaviorRequest requestWithDatabaseID:databaseRevision:addToPlaylistBehavior:]( ICSetAddToPlaylistBehaviorRequest,  "requestWithDatabaseID:databaseRevision:addToPlaylistBehavior:",  [v12 databaseID],  v11,  LOBYTE(self->super._status)));
  [v13 setVerificationInteractionLevel:2];
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v27 = v13;
    __int16 v28 = 2114;
    v29 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Sending request %p to set add to playlist behavior to %{public}@",  buf,  0x16u);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100109CDC;
  v22[3] = &unk_1001A6A58;
  id v23 = v13;
  v24 = self;
  dispatch_semaphore_t v25 = v14;
  v16 = v14;
  id v17 = v13;
  [v12 sendRequest:v17 withResponseHandler:v22];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v20 = MSVTCCIdentityForCurrentProcess(v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v18 setClientIdentity:v21];

  [v6 endTransaction];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end