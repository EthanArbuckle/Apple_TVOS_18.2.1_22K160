@interface ApproverRemoteNotificationTask
- (AMSBag)bag;
- (ApproverRemoteNotificationTask)initWithPayload:(id)a3;
- (NSDictionary)payload;
- (NSString)requestIdentifier;
- (id)_approvalRequestFromResult:(id)a3 withError:(id *)a4;
- (id)_approvalRequestWithError:(id *)a3;
- (id)_requestFromResult:(id)a3 withError:(id *)a4;
- (id)_requestWithError:(id *)a3;
- (id)_serverRequestWithError:(id *)a3;
- (id)perform;
- (int64_t)requestStatus;
- (void)_presentRequest:(id)a3;
- (void)setBag:(id)a3;
@end

@implementation ApproverRemoteNotificationTask

- (ApproverRemoteNotificationTask)initWithPayload:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ApproverRemoteNotificationTask;
  v6 = -[ApproverRemoteNotificationTask init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payload, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"AskPermission",  @"1"));
    bag = v7->_bag;
    v7->_bag = (AMSBag *)v8;
  }

  return v7;
}

- (int64_t)requestStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverRemoteNotificationTask payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"9"]);

  else {
    int64_t v4 = -2LL;
  }

  return v4;
}

- (NSString)requestIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverRemoteNotificationTask payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"8"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000021C8;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[ApproverRemoteNotificationTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (id)_approvalRequestWithError:(id *)a3
{
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverRemoteNotificationTask _serverRequestWithError:](self, "_serverRequestWithError:", &v20));
  id v6 = v20;
  v7 = v6;
  if (!v5)
  {
    v12 = 0LL;
    id v13 = v6;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    __int16 v23 = 2114;
    v24 = v5;
    id v11 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result: %{public}@",  buf,  0x16u);
  }

  id v19 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[ApproverRemoteNotificationTask _approvalRequestFromResult:withError:]( self,  "_approvalRequestFromResult:withError:",  v5,  &v19));
  id v13 = v19;

  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2114;
      v24 = v12;
      id v17 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Decoded server result. Request: %{public}@",  buf,  0x16u);
    }
  }

  if (a3) {
LABEL_13:
  }
    *a3 = v13;
LABEL_14:

  return v12;
}

- (id)_requestWithError:(id *)a3
{
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverRemoteNotificationTask _serverRequestWithError:](self, "_serverRequestWithError:", &v20));
  id v6 = v20;
  v7 = v6;
  if (!v5)
  {
    v12 = 0LL;
    id v13 = v6;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    __int16 v23 = 2114;
    v24 = v5;
    id v11 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result: %{public}@",  buf,  0x16u);
  }

  id v19 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[ApproverRemoteNotificationTask _requestFromResult:withError:]( self,  "_requestFromResult:withError:",  v5,  &v19));
  id v13 = v19;

  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2114;
      v24 = v12;
      id v17 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Decoded server result. Request: %{public}@",  buf,  0x16u);
    }
  }

  if (a3) {
LABEL_13:
  }
    *a3 = v13;
LABEL_14:

  return v12;
}

- (id)_serverRequestWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 retrieveRequestURL]);

  v32 = @"requestId";
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverRemoteNotificationTask requestIdentifier](self, "requestIdentifier"));
  v33 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));

  v9 = objc_alloc_init(&OBJC_CLASS___URLRequestEncoder);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[URLRequestEncoder requestWithMethod:bagURL:parameters:]( v9,  "requestWithMethod:bagURL:parameters:",  4LL,  v6,  v8));
  id v29 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resultWithTimeout:&v29 error:60.0]);
  id v12 = v29;
  if (!v11)
  {
    id v19 = 0LL;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  v27 = v6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v13) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OSLogObject", a3));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543362;
    v31 = v15;
    id v16 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Encoded request successfully",  buf,  0xCu);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[URLSession sharedSession](&OBJC_CLASS___URLSession, "sharedSession"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataTaskPromiseWithRequest:v11]);

  id v28 = v12;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 resultWithTimeout:&v28 error:60.0]);
  id v20 = v28;

  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v21) {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v31 = v23;
      id v24 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result",  buf,  0xCu);
    }
  }

  id v12 = v20;
  a3 = v26;
  id v6 = v27;
  if (v26) {
LABEL_13:
  }
    *a3 = v12;
LABEL_14:

  return v19;
}

- (id)_approvalRequestFromResult:(id)a3 withError:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  if (v7)
  {
    uint64_t v8 = -[ApprovalRequest initWithCloudPushDictionary:]( objc_alloc(&OBJC_CLASS___ApprovalRequest),  "initWithCloudPushDictionary:",  v7);
    if (v8)
    {
      v9 = v8;
      v10 = 0LL;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }

    id v11 = @"Server response missing values";
  }

  else
  {
    id v11 = @"Server response object is nil";
  }

  uint64_t v12 = APError(101LL, @"Invalid Response", v11, 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v9 = 0LL;
  if (a4) {
LABEL_11:
  }
    *a4 = v10;
LABEL_12:

  return v9;
}

- (id)_requestFromResult:(id)a3 withError:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }
  else {
    id v8 = 0LL;
  }

  if (!v8)
  {
    uint64_t v12 = APError(101LL, @"Invalid Response", @"Server response object is nil", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = 0LL;
    if (!a4) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }

  v96 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"requestInfo"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    id v11 = v9;
  }
  else {
    id v11 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"salables"]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
    id v17 = v15;
  }
  else {
    id v17 = 0LL;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"lockupData"]);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
    id v20 = v18;
  }
  else {
    id v20 = 0LL;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"parentSalables"]);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
    id v23 = v21;
  }
  else {
    id v23 = 0LL;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v93 = v23;
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
    id v105 = v24;
  }
  else {
    id v105 = 0LL;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"approveButton"]);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
    id v28 = v26;
  }
  else {
    id v28 = 0LL;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"requestString"]);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0) {
    id v103 = v29;
  }
  else {
    id v103 = 0LL;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"declineButton"]);
  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0) {
    id v33 = v31;
  }
  else {
    id v33 = 0LL;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"bundleIdentifier"]);
  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0) {
    id v36 = v34;
  }
  else {
    id v36 = 0LL;
  }

  v97 = v20;
  if (v36)
  {
    v85 = (__CFString *)v36;
    uint64_t v37 = (uint64_t)v33;
  }

  else
  {
    id v38 = v28;
    v39 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"bundleIdentifier"]);
    uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0) {
      v41 = v39;
    }
    else {
      v41 = 0LL;
    }

    v42 = @"Unknown";
    if (v41) {
      v42 = v41;
    }
    v85 = v42;

    id v28 = v38;
    uint64_t v37 = (uint64_t)v33;
    id v20 = v97;
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"adamId"]);
  uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v43, v44) & 1) != 0) {
    id v102 = v43;
  }
  else {
    id v102 = 0LL;
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"offerName"]);
  uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0) {
    id v92 = v45;
  }
  else {
    id v92 = 0LL;
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"url"]);
  uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0) {
    id v99 = v47;
  }
  else {
    id v99 = 0LL;
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"previewURL"]);
  uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v49, v50) & 1) != 0) {
    id v101 = v49;
  }
  else {
    id v101 = 0LL;
  }
  v51 = self;

  v52 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"productType"]);
  uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v106 = v37;
  if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0) {
    id v54 = v52;
  }
  else {
    id v54 = 0LL;
  }
  uint64_t v55 = (uint64_t)v28;

  v56 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"productTypeName"]);
  uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0) {
    id v58 = v56;
  }
  else {
    id v58 = 0LL;
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"url"]);
  uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0) {
    id v100 = v59;
  }
  else {
    id v100 = 0LL;
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"requesterFirstName"]);
  uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSString);
  v94 = v17;
  id v95 = v8;
  v98 = v11;
  if ((objc_opt_isKindOfClass(v61, v62) & 1) != 0) {
    id v63 = v61;
  }
  else {
    id v63 = 0LL;
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v65 = objc_claimAutoreleasedReturnValue(-[ApproverRemoteNotificationTask requestIdentifier](v51, "requestIdentifier"));
  uint64_t v66 = objc_claimAutoreleasedReturnValue([v102 stringValue]);
  uint64_t v67 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v101));
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v100));
  v89 = (void *)v67;
  v68 = (void *)v65;
  if ([v54 isEqualToString:@"A"] && v99)
  {
    uint64_t v69 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));

    v104 = (void *)v69;
  }

  v70 = v58;
  uint64_t v71 = v55;
  uint64_t v72 = v106;
  if (v71)
  {
    if (v106) {
      goto LABEL_71;
    }
  }

  else
  {
    uint64_t v71 = objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](&OBJC_CLASS___Localizations, "stringWithKey:", @"ACTION_APPROVE"));
    if (v106) {
      goto LABEL_71;
    }
  }

  uint64_t v72 = objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](&OBJC_CLASS___Localizations, "stringWithKey:", @"ACTION_DECLINE"));
LABEL_71:
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[Localizations stringWithKey:]( &OBJC_CLASS___Localizations,  "stringWithKey:",  @"NOTIFICATION_TITLE_APPROVER"));
  if (v73) {
    uint64_t v74 = objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v73,  @"%@",  0LL,  v63));
  }
  else {
    uint64_t v74 = 0LL;
  }
  v90 = v63;

  v91 = (void *)v71;
  v107 = (void *)v72;
  v87 = (void *)v74;
  v75 = -[RequestLocalizations initWithApprove:body:decline:title:]( objc_alloc(&OBJC_CLASS___RequestLocalizations),  "initWithApprove:body:decline:title:",  v71,  v103,  v72,  v74);
  v76 = (void *)v66;
  v86 = v54;
  if (v103 && v66)
  {
    v77 = v104;
    v78 = v89;
    id v84 = v54;
    v79 = v92;
    LOBYTE(v83) = 0;
    v80 = v85;
    v88 = -[Request initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:offerName:previewURL:productType:productTypeName:productURL:requestInfo:status:]( objc_alloc(&OBJC_CLASS___Request),  "initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:off erName:previewURL:productType:productTypeName:productURL:requestInfo:status:",  v64,  v68,  @"N/A",  v85,  v76,  v75,  v83,  v92,  v89,  v84,  v70,  v104,  v98,  -1LL);
    id v13 = 0LL;
  }

  else
  {
    uint64_t v81 = APError(101LL, @"Invalid Response", @"Server response missing values", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v81);
    v88 = 0LL;
    v80 = v85;
    v79 = v92;
    v78 = v89;
    v77 = v104;
  }

  id v8 = v95;
  a4 = v96;
  v14 = v88;
  if (v96) {
LABEL_81:
  }
    *a4 = v13;
LABEL_82:

  return v14;
}

- (void)_presentRequest:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig", a3));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class(self);
    id v6 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@: Cannot present request, unsupported device platform",  (uint8_t *)&v7,  0xCu);
  }
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end