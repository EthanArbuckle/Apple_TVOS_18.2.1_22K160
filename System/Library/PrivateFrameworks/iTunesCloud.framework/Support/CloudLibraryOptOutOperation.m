@interface CloudLibraryOptOutOperation
- (CloudLibraryOptOutOperation)initWithCUID:(id)a3 troveID:(id)a4;
- (CloudLibraryOptOutOperation)initWithConfiguration:(id)a3 CUID:(id)a4 troveID:(id)a5;
- (NSString)cuid;
- (NSString)troveID;
- (void)_sendOptOutWithCUID:(id)a3 troveID:(id)a4;
- (void)main;
- (void)setCuid:(id)a3;
- (void)setTroveID:(id)a3;
@end

@implementation CloudLibraryOptOutOperation

- (CloudLibraryOptOutOperation)initWithCUID:(id)a3 troveID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v8);
  v10 = -[CloudLibraryOptOutOperation initWithConfiguration:CUID:troveID:]( self,  "initWithConfiguration:CUID:troveID:",  v9,  v7,  v6);

  return v10;
}

- (CloudLibraryOptOutOperation)initWithConfiguration:(id)a3 CUID:(id)a4 troveID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CloudLibraryOptOutOperation;
  v10 = -[CloudLibraryOperation initWithConfiguration:](&v16, "initWithConfiguration:", a3);
  if (v10)
  {
    id v11 = [v8 copy];
    status = (void *)v10->super._status;
    v10->super._status = (int64_t)v11;

    v13 = (NSError *)[v9 copy];
    error = v10->super._error;
    v10->super._error = v13;
  }

  return v10;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOptOutOperation cuid](self, "cuid"));
  if ([v3 length])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOptOutOperation troveID](self, "troveID"));
    id v5 = [v4 length];

    if (v5)
    {
      id v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOptOutOperation cuid](self, "cuid"));
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOptOutOperation troveID](self, "troveID"));
        int v12 = 138543618;
        v13 = v7;
        __int16 v14 = 2114;
        v15 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending cloud library opt-out for Cloud CUID: %{public}@ TroveID: %{public}@",  (uint8_t *)&v12,  0x16u);
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOptOutOperation cuid](self, "cuid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOptOutOperation troveID](self, "troveID"));
      -[CloudLibraryOptOutOperation _sendOptOutWithCUID:troveID:](self, "_sendOptOutWithCUID:troveID:", v9, v10);

      return;
    }
  }

  else
  {
  }

  id v11 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No Cloud CUID or TroveID, skipping opt-out request.",  (uint8_t *)&v12,  2u);
  }

  -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
}

- (void)_sendOptOutWithCUID:(id)a3 troveID:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOptOutOperation cuid](self, "cuid", a3, a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOptOutOperation troveID](self, "troveID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_1001B4108,  @"min-itunes-match-compatible-version",  &off_1001B4120,  @"itunes-match-protocol-version",  v5,  @"cuid",  v6,  @"troveid",  0LL));

  id v8 = sub_10008DF80(0LL, @"cloud-library-opt-out-url", 0LL, v7, 0.0);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager defaultSession](&OBJC_CLASS___ICURLSessionManager, "defaultSession"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000CC1B0;
    v13[3] = &unk_1001A5518;
    v13[4] = self;
    dispatch_semaphore_t v14 = v10;
    int v12 = v10;
    [v11 enqueueDataRequest:v9 withCompletionHandler:v13];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (NSString)cuid
{
  return (NSString *)self->super._status;
}

- (void)setCuid:(id)a3
{
}

- (NSString)troveID
{
  return (NSString *)&self->super._error->super.isa;
}

- (void)setTroveID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end