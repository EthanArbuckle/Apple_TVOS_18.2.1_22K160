@interface PostRequestTask
- (ACAccount)account;
- (AMSBag)bag;
- (BOOL)canSendViaMessages;
- (NSURL)requestURL;
- (NSUUID)uuid;
- (PostRequestTask)initWithRequestURL:(id)a3 account:(id)a4;
- (id)_requestIdentifierFromResult:(id)a3 withError:(id *)a4;
- (id)_serverRequestWithError:(id *)a3;
- (id)_storeRequestWithResult:(id)a3 error:(id *)a4;
- (id)perform;
- (void)setBag:(id)a3;
- (void)setCanSendViaMessages:(BOOL)a3;
@end

@implementation PostRequestTask

- (PostRequestTask)initWithRequestURL:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PostRequestTask;
  v9 = -[PostRequestTask init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestURL, a3);
    objc_storeStrong((id *)&v10->_account, a4);
    v10->_canSendViaMessages = 0;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"AskPermission",  @"1"));
    bag = v10->_bag;
    v10->_bag = (AMSBag *)v11;
  }

  return v10;
}

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000EB98;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[PostRequestTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (id)_serverRequestWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PostRequestTask requestURL](self, "requestURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ap_secureURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", v5));
  id v7 = objc_alloc_init(&OBJC_CLASS___URLRequestEncoder);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PostRequestTask account](self, "account"));
  -[URLRequestEncoder setAccount:](v7, "setAccount:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[URLRequestEncoder requestByEncodingRequest:parameters:]( v7,  "requestByEncodingRequest:parameters:",  v6,  0LL));
  id v29 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 resultWithTimeout:&v29 error:60.0]);
  id v11 = v29;
  if (v10)
  {
    v25 = v5;
    v26 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v14 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      id v15 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Encoded request successfully",  buf,  0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[URLSession sharedSession](&OBJC_CLASS___URLSession, "sharedSession"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dataTaskPromiseWithRequest:v10]);

    id v28 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 resultWithTimeout:&v28 error:60.0]);
    id v19 = v28;

    if (v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v20) {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        id v23 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result",  buf,  0xCu);
      }
    }

    id v11 = v19;
    v5 = v25;
    v4 = v26;
  }

  else
  {
    v18 = 0LL;
  }

  if (a3) {
    *a3 = v11;
  }

  return v18;
}

- (id)_storeRequestWithResult:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  if (!v7)
  {
    uint64_t v12 = APError(101LL, @"Invalid Response", @"Server response object is nil", 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_super v14 = 0LL;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"salableAdamId"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"requestId"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    id v11 = v9;
  }
  else {
    id v11 = 0LL;
  }

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[StorageHelper approvalRequestWithRequestIdentifier:]( &OBJC_CLASS___StorageHelper,  "approvalRequestWithRequestIdentifier:",  v11));
  if ((objc_opt_respondsToSelector(v8, "stringValue") & 1) != 0 && v11)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[RequesterStore sharedStore](&OBJC_CLASS___RequesterStore, "sharedStore"));
    [v15 storeRequest:v14];

    v13 = 0LL;
  }

  else
  {
    uint64_t v16 = APError(101LL, @"Invalid Response", @"Server response missing needed keys", 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  if (a4) {
LABEL_15:
  }
    *a4 = v13;
LABEL_16:

  return v14;
}

- (id)_requestIdentifierFromResult:(id)a3 withError:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"requestId"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
      id v10 = v8;
    }
    else {
      id v10 = 0LL;
    }

    if (v10)
    {
      uint64_t v12 = 0LL;
      if (!a4) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }

    id v11 = @"Server response missing needed keys";
  }

  else
  {
    id v11 = @"Server response object is nil";
  }

  uint64_t v13 = APError(101LL, @"Invalid Response", v11, 0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v10 = 0LL;
  if (a4) {
LABEL_14:
  }
    *a4 = v12;
LABEL_15:

  return v10;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (BOOL)canSendViaMessages
{
  return self->_canSendViaMessages;
}

- (void)setCanSendViaMessages:(BOOL)a3
{
  self->_canSendViaMessages = a3;
}

- (void).cxx_destruct
{
}

@end