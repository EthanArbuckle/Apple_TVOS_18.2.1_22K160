@interface RequestBrokerClient
- (id)description;
- (void)cancelAllRequestsWithErrorHandler:(id)a3;
- (void)submitRequest:(id)a3 delegate:(id)a4 withReplyHandler:(id)a5;
@end

@implementation RequestBrokerClient

- (void)cancelAllRequestsWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Canceling all system applications for: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  id v7 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v8 modifyUsingTransaction:&stru_1003F2E38];

  uint64_t v9 = ASDLogHandleForCategory(14LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Finished canceling all system applications for: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  if (v4) {
    v4[2](v4, 0LL);
  }
}

- (void)submitRequest:(id)a3 delegate:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, id *, void))a5;
  id v10 = a4;
  uint64_t v11 = ASDLogHandleForCategory(14LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2114;
    v17 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received request: %{public}@ from: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  v13 = sub_1001DAFB8((id *)objc_alloc(&OBJC_CLASS___RequestProxy), self, v8, v10);
  if (v9) {
    v9[2](v9, v13, 0LL);
  }
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RequestBrokerClient;
  id v3 = -[RequestBrokerClient description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (self) {
    client = self->_client;
  }
  else {
    client = 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient clientID](client, "clientID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v4, v6));

  return v7;
}

- (void).cxx_destruct
{
}

@end