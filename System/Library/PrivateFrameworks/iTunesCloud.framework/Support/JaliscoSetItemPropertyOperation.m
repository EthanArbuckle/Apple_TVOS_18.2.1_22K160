@interface JaliscoSetItemPropertyOperation
- (JaliscoSetItemPropertyOperation)initWithCoder:(id)a3;
- (JaliscoSetItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 purchaseHistoryID:(unint64_t)a5 properties:(id)a6;
- (JaliscoSetItemPropertyOperation)initWithPurchaseHistoryID:(unint64_t)a3 properties:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation JaliscoSetItemPropertyOperation

- (JaliscoSetItemPropertyOperation)initWithPurchaseHistoryID:(unint64_t)a3 properties:(id)a4
{
  id v6 = a4;
  v8 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v7);
  uint64_t v9 = MSVTCCIdentityForCurrentProcess();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = -[JaliscoSetItemPropertyOperation initWithConfiguration:clientIdentity:purchaseHistoryID:properties:]( self,  "initWithConfiguration:clientIdentity:purchaseHistoryID:properties:",  v8,  v10,  a3,  v6);

  return v11;
}

- (JaliscoSetItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 purchaseHistoryID:(unint64_t)a5 properties:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___JaliscoSetItemPropertyOperation;
  v11 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v16,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v12 = v11;
  if (v11)
  {
    v11->super._status = a5;
    v13 = (NSError *)[v10 copy];
    error = v12->super._error;
    v12->super._error = v13;
  }

  return v12;
}

- (JaliscoSetItemPropertyOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___JaliscoSetItemPropertyOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v5->super._status = (int64_t)[v4 decodeInt64ForKey:@"JaliscoSetItemPropertyOperationPurchaseHistoryIDKey"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDictionary, v6),  @"JaliscoSetItemPropertyOperationPropertiesKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    error = v5->super._error;
    v5->super._error = (NSError *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___JaliscoSetItemPropertyOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"JaliscoSetItemPropertyOperationPurchaseHistoryIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->super._error forKey:@"JaliscoSetItemPropertyOperationPropertiesKey"];
}

- (void)main
{
  context = objc_autoreleasePoolPush();
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"JaliscoSetItemPropertyOperation - (purchase_history_id = %llu)",  self->super._status));
  id v3 = [[MSVXPCTransaction alloc] initWithName:v26];
  [v3 beginTransaction];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v4 setClientIdentity:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  id v7 = [v6 databaseID];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->super._status));
  v45 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  error = self->super._error;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &error, 1LL));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkSetItemPropertyRequest requestWithDatabaseID:itemIDs:properties:useLongIDs:]( &OBJC_CLASS___ICBulkSetItemPropertyRequest,  "requestWithDatabaseID:itemIDs:properties:useLongIDs:",  v7,  v9,  v10,  1LL));

  [v11 setVerificationInteractionLevel:2];
  v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class(v11, v13);
    v15 = NSStringFromClass(v14);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ([v11 method]) {
      v17 = @"POST";
    }
    else {
      v17 = @"GET";
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 action]);
    int64_t status = self->super._status;
    v20 = self->super._error;
    *(_DWORD *)buf = 138544642;
    v33 = v16;
    __int16 v34 = 2048;
    v35 = v11;
    __int16 v36 = 2114;
    v37 = v17;
    __int16 v38 = 2114;
    v39 = v18;
    __int16 v40 = 2048;
    int64_t v41 = status;
    __int16 v42 = 2114;
    v43 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Sending set item properties request <%{public}@: %p method=%{public}@ action=%{public}@> for purchase history id: %llu properties: %{public}@",  buf,  0x3Eu);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100021044;
  v28[3] = &unk_1001A6A58;
  id v29 = v11;
  v30 = self;
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0LL);
  v21 = v31;
  id v22 = v11;
  [v6 sendRequest:v22 withResponseHandler:v28];
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v24 = MSVTCCIdentityForCurrentProcess();
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v23 setClientIdentity:v25];

  [v3 endTransaction];
  objc_autoreleasePoolPop(context);
}

- (void).cxx_destruct
{
}

@end