@interface CloudSetFavoriteSongAddToLibraryBehaviorOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (CloudSetFavoriteSongAddToLibraryBehaviorOperation)initWithCoder:(id)a3;
- (CloudSetFavoriteSongAddToLibraryBehaviorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 addToLibraryBehavior:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation CloudSetFavoriteSongAddToLibraryBehaviorOperation

- (CloudSetFavoriteSongAddToLibraryBehaviorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 addToLibraryBehavior:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CloudSetFavoriteSongAddToLibraryBehaviorOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v7,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (result) {
    result->super._status = a5;
  }
  return result;
}

- (CloudSetFavoriteSongAddToLibraryBehaviorOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CloudSetFavoriteSongAddToLibraryBehaviorOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5) {
    v5->super._status = (int64_t)[v4 decodeIntegerForKey:@"CloudSetFavoriteSongAddToLibraryBehaviorOperationIDKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CloudSetFavoriteSongAddToLibraryBehaviorOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"CloudSetFavoriteSongAddToLibraryBehaviorOperationIDKey",  v5.receiver,  v5.super_class);
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  uint64_t StringForAddToLibraryBehavior = ICCloudClientGetStringForAddToLibraryBehavior(self->super._status);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(StringForAddToLibraryBehavior);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CloudSetFavoriteSongAddToLibraryBehaviorOperation - (add to library behavior = %@)",  v4));
  id v6 = [[MSVXPCTransaction alloc] initWithName:v5];
  [v6 beginTransaction];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v7 setClientIdentity:v8];

  int64_t status = self->super._status;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  objc_msgSend((id)v11, "icd_setSagaCloudFavoriteSongAddToLibraryBehavior:", status);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  LODWORD(v11) = [v10 sagaOnDiskDatabaseRevision];

  else {
    uint64_t v11 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[ICSetFavoriteSongAddToLibraryBehaviorRequest requestWithDatabaseID:databaseRevision:addToLibraryBehavior:]( ICSetFavoriteSongAddToLibraryBehaviorRequest,  "requestWithDatabaseID:databaseRevision:addToLibraryBehavior:",  [v12 databaseID],  v11,  LOBYTE(self->super._status)));
  [v13 setVerificationInteractionLevel:2];
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = v13;
    __int16 v27 = 2114;
    v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Sending request %p to set add to library behavior to %{public}@",  buf,  0x16u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C633C;
  v21[3] = &unk_1001A6A58;
  id v22 = v13;
  v23 = self;
  dispatch_semaphore_t v24 = v14;
  v16 = v14;
  id v17 = v13;
  [v12 sendRequest:v17 withResponseHandler:v21];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v19 = MSVTCCIdentityForCurrentProcess();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v18 setClientIdentity:v20];

  [v6 endTransaction];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end