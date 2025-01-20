@interface StoreKitServiceConnection
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
@end

@implementation StoreKitServiceConnection

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    v8 = @"com.apple.private.storekit.background-auth";
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForEntitlement:@"com.apple.private.storekit.background-auth"]);

    unsigned __int8 v11 = [v10 BOOLValue];
    uint64_t v12 = ASDLogHandleForCategory(36LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Starting authenticate task",  buf,  0xCu);
      }

      id v15 = [[AMSAuthenticateTask alloc] initWithRequest:v6];
      [v15 setDelegate:self];
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 performAuthentication]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1001E7F2C;
      v19[3] = &unk_1003EBD80;
      v19[4] = self;
      id v20 = v7;
      [v16 addFinishBlock:v19];

      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v17 = ASDLogHandleForCategory(36LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "[%{public}@] Process is not entitled for background authentication",  buf,  0xCu);
  }

  uint64_t v18 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  505LL,  @"Not entitled",  @"Process is  not entitled for background authentication");
  id v15 = (id)objc_claimAutoreleasedReturnValue(v18);
  (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v15);
LABEL_10:
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  uint64_t v5 = ASDErrorDomain;
  id v6 = a4;
  uint64_t v7 = ASDErrorWithTitleAndMessage(v5, 535LL, @"Not implemented", @"Feature is disabled");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v8);
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  uint64_t v5 = ASDErrorDomain;
  id v6 = a4;
  uint64_t v7 = ASDErrorWithTitleAndMessage(v5, 535LL, @"Not implemented", @"Feature is disabled");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v8);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = ASDLogHandleForCategory(36LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  unsigned __int8 v11 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v11, "present"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001E8264;
  v14[3] = &unk_1003EBDA8;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 addFinishBlock:v14];
}

@end