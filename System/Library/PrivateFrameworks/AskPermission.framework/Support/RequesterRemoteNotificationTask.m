@interface RequesterRemoteNotificationTask
- (BOOL)suppressDialog;
- (NSDictionary)payload;
- (NSString)requestIdentifier;
- (RequesterRemoteNotificationTask)initWithPayload:(id)a3 andSuppressDialog:(BOOL)a4;
- (id)_notifyExtensionWithResult:(id)a3;
- (id)_requestFromResult:(id)a3 withError:(id *)a4;
- (id)_requestResultFromResult:(id)a3 withError:(id *)a4;
- (id)_serverRequestWithError:(id *)a3;
- (id)perform;
- (int64_t)requestStatus;
- (void)_presentRequest:(id)a3;
@end

@implementation RequesterRemoteNotificationTask

- (RequesterRemoteNotificationTask)initWithPayload:(id)a3 andSuppressDialog:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RequesterRemoteNotificationTask;
  v8 = -[RequesterRemoteNotificationTask init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_payload, a3);
    v9->_suppressDialog = a4;
  }

  return v9;
}

- (int64_t)requestStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRemoteNotificationTask payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"9"]);

  else {
    int64_t v4 = -2LL;
  }

  return v4;
}

- (NSString)requestIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRemoteNotificationTask payload](self, "payload"));
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
  v3[2] = sub_100011AC8;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[RequesterRemoteNotificationTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (id)_serverRequestWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 retrieveRequestURL]);

  v32 = @"requestId";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRemoteNotificationTask requestIdentifier](self, "requestIdentifier"));
  v33 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));

  v9 = objc_alloc_init(&OBJC_CLASS___URLRequestEncoder);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[URLRequestEncoder requestWithMethod:bagURL:parameters:]( v9,  "requestWithMethod:bagURL:parameters:",  4LL,  v6,  v8));
  id v29 = 0LL;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resultWithTimeout:&v29 error:60.0]);
  id v12 = v29;
  if (!v11)
  {
    v19 = 0LL;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  v27 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v13) {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
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

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[URLSession sharedSession](&OBJC_CLASS___URLSession, "sharedSession"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataTaskPromiseWithRequest:v11]);

  id v28 = v12;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 resultWithTimeout:&v28 error:60.0]);
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
      v23 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v31 = v23;
      id v24 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result",  buf,  0xCu);
    }
  }

  id v12 = v20;
  a3 = v26;
  v6 = v27;
  if (v26) {
LABEL_13:
  }
    *a3 = v12;
LABEL_14:

  return v19;
}

- (id)_requestFromResult:(id)a3 withError:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
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
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = 0LL;
    if (!a4) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"requestInfo"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    id v11 = v9;
  }
  else {
    id v11 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"approverFirstName"]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
    id v17 = v15;
  }
  else {
    id v17 = 0LL;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"adamId"]);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
    id v20 = v18;
  }
  else {
    id v20 = 0LL;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"salables"]);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
    id v23 = v21;
  }
  else {
    id v23 = 0LL;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"lockupData"]);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v48 = v23;
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
    id v54 = v24;
  }
  else {
    id v54 = 0LL;
  }

  uint64_t v46 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRemoteNotificationTask requestIdentifier](self, "requestIdentifier"));
  v49 = v20;
  v27 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
  int64_t v28 = -[RequesterRemoteNotificationTask requestStatus](self, "requestStatus");
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[Localizations stringWithKey:]( &OBJC_CLASS___Localizations,  "stringWithKey:",  @"ACTION_APPROVE"));
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[Localizations stringWithKey:]( &OBJC_CLASS___Localizations,  "stringWithKey:",  @"ACTION_DECLINE"));
  v50 = v17;
  v51 = a4;
  if (v28 == 1)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"approvalString"]);
    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0) {
      id v31 = v29;
    }
    else {
      id v31 = 0LL;
    }

    v34 = @"NOTIFICATION_TITLE_REQUESTER_APPROVED";
  }

  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"declinedString"]);
    uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0) {
      id v31 = v32;
    }
    else {
      id v31 = 0LL;
    }

    v34 = @"NOTIFICATION_TITLE_REQUESTER_DECLINED";
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](&OBJC_CLASS___Localizations, "stringWithKey:", v34));
  if (v35) {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v35,  @"%@",  0LL,  v17));
  }
  else {
    v36 = 0LL;
  }

  v37 = -[RequestLocalizations initWithApprove:body:decline:title:]( objc_alloc(&OBJC_CLASS___RequestLocalizations),  "initWithApprove:body:decline:title:",  v53,  v31,  v52,  v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"offerName"]);
  uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0) {
    id v40 = v38;
  }
  else {
    id v40 = 0LL;
  }

  id v47 = v8;
  if (v31 && v27)
  {
    if (_os_feature_enabled_impl("AskPermission", "BiomeDonation"))
    {
      v41 = (void *)v46;
      v42 = -[RequesterRequest initWithDate:requestIdentifier:uniqueIdentifier:itemIdentifier:localizations:offerName:status:]( objc_alloc(&OBJC_CLASS___RequesterRequest),  "initWithDate:requestIdentifier:uniqueIdentifier:itemIdentifier:localizations:offerName:status:",  v46,  v26,  @"xxxxxxxxx",  v27,  v37,  v40,  v28);
    }

    else
    {
      LOBYTE(v45) = 0;
      v41 = (void *)v46;
      v42 = -[Request initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:offerName:previewURL:productType:productTypeName:productURL:requestInfo:status:]( objc_alloc(&OBJC_CLASS___Request),  "initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:o fferName:previewURL:productType:productTypeName:productURL:requestInfo:status:",  v46,  v26,  @"xxxxxxxxx",  0LL,  v27,  v37,  v45,  0LL,  0LL,  0LL,  0LL,  0LL,  v11,  v28);
    }

    v14 = v42;
    v13 = 0LL;
  }

  else
  {
    uint64_t v43 = APError(101LL, @"Invalid Response", @"Server response missing values", 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v14 = 0LL;
    v41 = (void *)v46;
  }

  a4 = v51;
  id v8 = v47;
  if (v51) {
LABEL_45:
  }
    *a4 = v13;
LABEL_46:

  return v14;
}

- (void)_presentRequest:(id)a3
{
}

- (id)_requestResultFromResult:(id)a3 withError:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  if (!v7)
  {
    uint64_t v11 = APError(101LL, @"Invalid Response", @"Server response object is nil", 0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = 0LL;
    if (!a4) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"requestInfo"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    id v10 = v8;
  }
  else {
    id v10 = 0LL;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"salables"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
    id v16 = v14;
  }
  else {
    id v16 = 0LL;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"bundleIdentifier"]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
    id v19 = v17;
  }
  else {
    id v19 = 0LL;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"buyParams"]);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
    id v22 = v20;
  }
  else {
    id v22 = 0LL;
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"adamId"]);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0) {
    id v25 = v23;
  }
  else {
    id v25 = 0LL;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"productType"]);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
    id v28 = v26;
  }
  else {
    id v28 = 0LL;
  }

  if (v22 && v25 && v28)
  {
    id v13 = [[APResult alloc] initWithBundleIdentifier:v19 buyParams:v22 itemIdentifier:v25 productType:v28];
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v29 = APError(101LL, @"Invalid Response", @"Server response missing values", 0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v29);
    id v13 = 0LL;
  }

  if (a4) {
LABEL_31:
  }
    *a4 = v12;
LABEL_32:

  return v13;
}

- (id)_notifyExtensionWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class(self);
    id v7 = v24;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Notifying extension.", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ExtensionManager sharedExtensionManager](&OBJC_CLASS___ExtensionManager, "sharedExtensionManager"));
  id v22 = 0LL;
  unsigned int v9 = [v8 notifyWithResult:v4 error:&v22];

  id v10 = v22;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  uint64_t v12 = (void *)v11;
  if (v9)
  {
    if (!v11) {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v24 = v14;
      id v15 = v14;
      id v16 = "%{public}@: Notified extension succesfully.";
      id v17 = v13;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      uint32_t v19 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
    }
  }

  else
  {
    if (!v11) {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v20 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      id v24 = v20;
      __int16 v25 = 2114;
      id v26 = v10;
      id v15 = v20;
      id v16 = "%{public}@: Failed to notify extension. Error: %{public}@.";
      id v17 = v13;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 22;
      goto LABEL_14;
    }
  }

  return v10;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (BOOL)suppressDialog
{
  return self->_suppressDialog;
}

- (void).cxx_destruct
{
}

@end