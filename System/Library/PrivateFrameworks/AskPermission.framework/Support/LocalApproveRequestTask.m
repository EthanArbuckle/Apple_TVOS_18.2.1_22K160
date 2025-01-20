@interface LocalApproveRequestTask
- (LocalApproveRequestTask)initWithItemIdentifier:(id)a3;
- (NSString)itemIdentifier;
- (id)_parseResult:(id)a3;
- (id)_serverRequestWithUser:(id)a3 requestIdentifier:(id)a4 error:(id *)a5;
- (id)perform;
@end

@implementation LocalApproveRequestTask

- (LocalApproveRequestTask)initWithItemIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LocalApproveRequestTask;
  v6 = -[LocalApproveRequestTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemIdentifier, a3);
  }

  return v7;
}

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000C3BC;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[LocalApproveRequestTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (id)_serverRequestWithUser:(id)a3 requestIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 updateRequestURL]);

  v40[0] = @"requestId";
  v40[1] = @"approvalStatus";
  v41[0] = v8;
  v41[1] = &off_100032A30;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));
  v12 = objc_alloc_init(&OBJC_CLASS___URLRequestEncoder);
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[URLRequestEncoder requestWithMethod:bagURL:parameters:]( v12,  "requestWithMethod:bagURL:parameters:",  4LL,  v10,  v11));
  id v37 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 resultWithTimeout:&v37 error:60.0]);
  id v15 = v37;
  if (v14)
  {
    id v34 = v8;
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSMutableURLRequest);
    if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
    {
      v31 = self;
      id v17 = v14;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v7 DSID]);
      objc_msgSend(v17, "ap_setNullableValue:forHTTPHeaderField:", v18, @"X-IC-DSID");

      v19 = (void *)objc_claimAutoreleasedReturnValue([v7 password]);
      objc_msgSend(v17, "ap_setNullableValue:forHTTPHeaderField:", v19, @"X-IC-Password");

      v20 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
      objc_msgSend(v17, "ap_setNullableValue:forHTTPHeaderField:", v20, @"X-IC-Username");

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v21) {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig", v31));
      }
      id v33 = v7;
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "OSLogObject", v31));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class(v32);
        *(_DWORD *)buf = 138543362;
        v39 = v23;
        id v24 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Encoded request successfully",  buf,  0xCu);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[URLSession sharedSession](&OBJC_CLASS___URLSession, "sharedSession"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dataTaskPromiseWithRequest:v17]);

      id v36 = v15;
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 resultWithTimeout:&v36 error:60.0]);
      id v28 = v36;

      id v7 = v33;
    }

    else
    {
      uint64_t v29 = APError(0LL, @"Request error", @"Could not cast AMSURLRequest to NSMutableURLRequest", 0LL);
      id v28 = (id)objc_claimAutoreleasedReturnValue(v29);
      v27 = 0LL;
      id v17 = v15;
    }

    id v15 = v28;
    id v8 = v34;
  }

  else
  {
    v27 = 0LL;
  }

  if (a5) {
    *a5 = v15;
  }

  return v27;
}

- (id)_parseResult:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"status"]);
    if ((objc_opt_respondsToSelector(v7, "integerValue") & 1) == 0)
    {
      uint64_t v22 = APError(0LL, @"Invalid response", @"Server response does not contain status code", 0LL);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
LABEL_39:

      goto LABEL_40;
    }

    id v8 = [v7 integerValue];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    v10 = (void *)v9;
    if (!v8)
    {
      if (!v9) {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = (id)objc_opt_class(self);
        id v24 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Success status code",  buf,  0xCu);
      }

      v21 = 0LL;
      goto LABEL_39;
    }

    if (!v9) {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = (id)objc_opt_class(self);
      __int16 v33 = 2050;
      id v34 = v8;
      id v12 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@: Error status code. Status code: %{public}ld",  buf,  0x16u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"errorNumber"]);
    if ((objc_opt_respondsToSelector(v13, "integerValue") & 1) == 0)
    {
      uint64_t v25 = APError(0LL, @"Invalid response", @"Server response does not contain error code", 0LL);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v25);
LABEL_38:

      goto LABEL_39;
    }

    id v14 = [v13 integerValue];
    if (v14 == (id)3711)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v15) {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      v26 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v32 = v26;
      id v18 = v26;
      v19 = "%{public}@: Previously declined error code";
    }

    else if (v14 == (id)3710)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v15) {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      v27 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v32 = v27;
      id v18 = v27;
      v19 = "%{public}@: Previously approved error code";
    }

    else
    {
      if (v14 != (id)3709)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Server response contains error. Error code: %ld",  v14));
        uint64_t v29 = APError(0LL, @"Server error", v28, 0LL);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v29);

        goto LABEL_38;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v15) {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      id v17 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v32 = v17;
      id v18 = v17;
      v19 = "%{public}@: Request expired error code";
    }

    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

LABEL_36:
    v21 = 0LL;
    goto LABEL_38;
  }

  uint64_t v20 = APError(0LL, @"Invalid response", @"Server response object is nil", 0LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
LABEL_40:

  return v21;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
}

@end