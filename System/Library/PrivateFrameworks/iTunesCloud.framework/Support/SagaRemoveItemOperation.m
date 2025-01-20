@interface SagaRemoveItemOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaRemoveItemOperation)initWithClientIdentity:(id)a3 ItemSagaIDs:(id)a4;
- (SagaRemoveItemOperation)initWithCoder:(id)a3;
- (SagaRemoveItemOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 itemSagaIDs:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaRemoveItemOperation

- (SagaRemoveItemOperation)initWithClientIdentity:(id)a3 ItemSagaIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v8);
  v10 = -[SagaRemoveItemOperation initWithConfiguration:clientIdentity:itemSagaIDs:]( self,  "initWithConfiguration:clientIdentity:itemSagaIDs:",  v9,  v7,  v6);

  return v10;
}

- (SagaRemoveItemOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 itemSagaIDs:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SagaRemoveItemOperation;
  v9 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v13,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (v9)
  {
    id v10 = [v8 copy];
    status = (void *)v9->super._status;
    v9->super._status = (int64_t)v10;
  }

  return v9;
}

- (SagaRemoveItemOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SagaRemoveItemOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5)
  {
    if ([v4 decodeInt32ForKey:@"SagaRemoveItemOperationArchiveVersionKey"])
    {
      id v7 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(NSNumber, v6),  @"SagaRemoveItemOperationItemSagaIDsKey");
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 decodeInt64ForKey:@"SagaRemoveItemOperationItemSagaIDKey"]));
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
  v5.super_class = (Class)&OBJC_CLASS___SagaRemoveItemOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  1,  @"SagaRemoveItemOperationArchiveVersionKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->super._status forKey:@"SagaRemoveItemOperationItemSagaIDsKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  if ([(id)self->super._status count])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"SagaRemoveItemOperation - (saga_id count = %llu)",  [(id)self->super._status count]));
    id v4 = [[MSVXPCTransaction alloc] initWithName:v3];
    [v4 beginTransaction];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v5 setClientIdentity:v6];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkRemoveItemRequest requestWithDatabaseID:itemIDs:]( ICBulkRemoveItemRequest,  "requestWithDatabaseID:itemIDs:",  [v7 databaseID],  self->super._status));
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
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      v39 = (uint64_t (*)(uint64_t, uint64_t))v14;
      *(_WORD *)v40 = 2114;
      *(void *)&v40[2] = v15;
      *(_WORD *)&v40[10] = 2114;
      *(void *)&v40[12] = status;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending delete request <%{public}@: %p method=%{public}@ action=%{public}@> for item saga ids: %{public}@",  buf,  0x34u);
    }

    dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v39 = sub_100115808;
    *(void *)v40 = sub_100115818;
    *(void *)&v40[8] = 0LL;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100115820;
    v33[3] = &unk_1001A6F68;
    id v18 = v8;
    v37 = buf;
    id v34 = v18;
    v35 = self;
    v19 = v17;
    v36 = v19;
    [v7 sendRequest:v18 withResponseHandler:v33];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v20 = (uint64_t)[*(id *)(*(void *)&buf[8] + 40) responseCode];
    if (v20 > 399)
    {
      if (v20 == 404 || v20 == 400)
      {
        uint64_t v21 = 3LL;
LABEL_18:
        -[CloudLibraryOperation setStatus:](self, "setStatus:", v21);
        if ((id)-[CloudLibraryOperation status](self, "status") == (id)1)
        {
          unsigned int v23 = [*(id *)(*(void *)&buf[8] + 40) updateRequired];
          v24 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if (v23)
          {
            if (v25)
            {
              *(_WORD *)v32 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Requesting library update because the response contained update-required flag",  v32,  2u);
            }

            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v24));
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
            [v26 updateSagaLibraryWithClientIdentity:v27 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];
          }

          else if (v25)
          {
            *(_WORD *)v32 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Skipping library update because the response did not contain update-required flag",  v32,  2u);
          }
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
        uint64_t v30 = MSVTCCIdentityForCurrentProcess(v28, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        [v28 setClientIdentity:v31];

        [v4 endTransaction];
        _Block_object_dispose(buf, 8);

        return;
      }
    }

    else
    {
      uint64_t v21 = 1LL;
      if (v20 == 200 || v20 == 204) {
        goto LABEL_18;
      }
    }

    uint64_t v21 = 2LL;
    goto LABEL_18;
  }

  v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No item saga ids to delete.", buf, 2u);
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