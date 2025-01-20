@interface StorageHelper
+ (id)_requestInfoForIndentifier:(id)a3 withError:(id *)a4;
+ (id)approvalRequestWithRequestIdentifier:(id)a3;
@end

@implementation StorageHelper

+ (id)approvalRequestWithRequestIdentifier:(id)a3
{
  id v16 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestInfoForIndentifier:a3 withError:&v16]);
  id v5 = v16;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v8 = 0LL;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class(a1);
    id v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    *(_DWORD *)buf = 138543618;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Request Info: %@.", buf, 0x16u);
  }

  v14 = -[ApprovalRequest initWithCloudPushDictionary:]( objc_alloc(&OBJC_CLASS___ApprovalRequest),  "initWithCloudPushDictionary:",  v8);
  return v14;
}

+ (id)_requestInfoForIndentifier:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 retrieveRequestURL]);

  v35 = @"requestId";
  id v36 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  v10 = objc_alloc_init(&OBJC_CLASS___URLRequestEncoder);
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[URLRequestEncoder requestWithMethod:bagURL:parameters:]( v10,  "requestWithMethod:bagURL:parameters:",  4LL,  v8,  v9));
  id v32 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resultWithTimeout:&v32 error:60.0]);
  id v13 = v32;
  if (!v12)
  {
    v21 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  v28 = v8;
  v29 = a4;
  id v30 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v14) {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_opt_class(a1);
    *(_DWORD *)buf = 138543362;
    v34 = v16;
    id v17 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Encoded request successfully",  buf,  0xCu);
  }

  id v18 = a1;

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[URLSession sharedSession](&OBJC_CLASS___URLSession, "sharedSession"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 dataTaskPromiseWithRequest:v12]);

  id v31 = v13;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 resultWithTimeout:&v31 error:60.0]);
  id v22 = v31;

  if (v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v23) {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_opt_class(v18);
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      id v26 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result",  buf,  0xCu);
    }
  }

  id v13 = v22;
  a4 = v29;
  id v6 = v30;
  id v8 = v28;
  if (v29) {
LABEL_13:
  }
    *a4 = v13;
LABEL_14:

  return v21;
}

@end