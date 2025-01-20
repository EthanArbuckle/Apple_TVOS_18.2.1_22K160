@interface JaliscoHideItemOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (JaliscoHideItemOperation)initWithCoder:(id)a3;
- (JaliscoHideItemOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 itemPurchaseHistoryIDs:(id)a5;
- (JaliscoHideItemOperation)initWithItemPurchaseHistoryIDs:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation JaliscoHideItemOperation

- (JaliscoHideItemOperation)initWithItemPurchaseHistoryIDs:(id)a3
{
  id v4 = a3;
  v6 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v5);
  uint64_t v7 = MSVTCCIdentityForCurrentProcess();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[JaliscoHideItemOperation initWithConfiguration:clientIdentity:itemPurchaseHistoryIDs:]( self,  "initWithConfiguration:clientIdentity:itemPurchaseHistoryIDs:",  v6,  v8,  v4);

  return v9;
}

- (JaliscoHideItemOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 itemPurchaseHistoryIDs:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___JaliscoHideItemOperation;
  v9 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v13,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (v9)
  {
    id v10 = [v8 copy];
    status = (void *)v9->super._status;
    v9->super._status = (int64_t)v10;
  }

  return v9;
}

- (JaliscoHideItemOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___JaliscoHideItemOperation;
  v6 = -[CloudLibraryOperation initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___NSNumber, v8),  0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v10 forKey:@"JaliscoHideItemOperationItemPurchaseHistoryIDsKey"]);
    id v12 = [v11 copy];
    status = (void *)v6->super._status;
    v6->super._status = (int64_t)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___JaliscoHideItemOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->super._status,  @"JaliscoHideItemOperationItemPurchaseHistoryIDsKey",  v5.receiver,  v5.super_class);
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  if ([(id)self->super._status count])
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"JaliscoHideItemOperation - (purchase_history_id count = %llu)",  [(id)self->super._status count]));
    id v3 = [[MSVXPCTransaction alloc] initWithName:v26];
    [v3 beginTransaction];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v4 setClientIdentity:v5];

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if ([(id)self->super._status count])
    {
      unint64_t v8 = 0LL;
      uint64_t v9 = ML3TrackPropertyHidden;
      do
      {
        uint64_t v41 = v9;
        v42 = &__kCFBooleanTrue;
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
        [v7 addObject:v10];

        ++v8;
      }

      while (v8 < (unint64_t)[(id)self->super._status count]);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkSetItemPropertyRequest requestWithDatabaseID:itemIDs:properties:useLongIDs:]( ICBulkSetItemPropertyRequest,  "requestWithDatabaseID:itemIDs:properties:useLongIDs:",  [v6 databaseID],  self->super._status,  v7,  1));
    [v11 setVerificationInteractionLevel:2];
    id v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync_Oversize");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class(v11, v13);
      objc_super v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if ([v11 method]) {
        v17 = @"POST";
      }
      else {
        v17 = @"GET";
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 action]);
      int64_t status = self->super._status;
      *(_DWORD *)buf = 138544386;
      v32 = v16;
      __int16 v33 = 2048;
      v34 = v11;
      __int16 v35 = 2114;
      v36 = v17;
      __int16 v37 = 2114;
      v38 = v18;
      __int16 v39 = 2114;
      int64_t v40 = status;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Sending hide items request <%{public}@: %p method=%{public}@ action=%{public}@> for purchase history ids: %{public}@",  buf,  0x34u);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000B21DC;
    v27[3] = &unk_1001A6A58;
    id v28 = v11;
    v29 = self;
    dispatch_semaphore_t v30 = dispatch_semaphore_create(0LL);
    v20 = v30;
    id v21 = v11;
    [v6 sendRequest:v21 withResponseHandler:v27];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v23 = MSVTCCIdentityForCurrentProcess();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    [v22 setClientIdentity:v24];

    [v3 endTransaction];
  }

  else
  {
    v25 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "No item purchase history ids to delete.",  buf,  2u);
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