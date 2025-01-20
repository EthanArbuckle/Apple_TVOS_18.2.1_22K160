@interface UpdateRequestTask
- (NSString)requestIdentifier;
- (UpdateRequestTask)initWithRequestIdentifier:(id)a3 action:(int64_t)a4;
- (id)_parseResult:(id)a3;
- (id)_serverRequestWithUser:(id)a3 error:(id *)a4;
- (id)perform;
- (int64_t)action;
- (void)_enqueueMetricsWithKeychainError:(id)a3 usedBiometrics:(BOOL)a4 request:(id)a5 error:(id)a6;
- (void)_storeBiometricsToken:(id)a3;
@end

@implementation UpdateRequestTask

- (UpdateRequestTask)initWithRequestIdentifier:(id)a3 action:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UpdateRequestTask;
  v8 = -[UpdateRequestTask init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_requestIdentifier, a3);
    v9->_action = a4;
  }

  return v9;
}

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100017C50;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[UpdateRequestTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (void)_enqueueMetricsWithKeychainError:(id)a3 usedBiometrics:(BOOL)a4 request:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v48 = a6;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[AMSMetrics internalInstanceUsingBag:](&OBJC_CLASS___AMSMetrics, "internalInstanceUsingBag:", v11));

  v47 = (void *)v12;
  if (!v8 && (!v9 || [v9 code] == (id)6))
  {
    id v13 = 0LL;
LABEL_17:
    id v21 = objc_alloc_init(&OBJC_CLASS___APRemoteApprovalPasswordEntryMetricsEvent);
    [v21 setEventType:@"dialog"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[Localizations stringWithKey:]( &OBJC_CLASS___Localizations,  "stringWithKey:",  @"AUTHENTICATION_PROMPT_BODY_REMOTE"));
    v23 = (void *)v22;
    v24 = &stru_100031BA0;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    v25 = v24;

    [v21 setProperty:v25 forBodyKey:@"message"];
    unsigned int v26 = objc_msgSend(v48, "ams_recursiveHasDomain:code:", AKAppleIDAuthenticationErrorDomain, -7003);
    v27 = @"ok";
    if (v26)
    {
      v27 = @"cancel";
      v28 = @"Cancel";
    }

    else
    {
      v28 = @"Ok";
    }

    v29 = v27;
    [v21 setProperty:v29 forBodyKey:@"actionType"];
    if (-[UpdateRequestTask action](self, "action")) {
      v30 = @"ConfirmFamilySharingPurchase.PasswordAuth.Decline";
    }
    else {
      v30 = @"ConfirmFamilySharingPurchase.PasswordAuth.Approve";
    }
    [v21 setProperty:v30 forBodyKey:@"dialogId"];
    [v21 setProperty:v28 forBodyKey:@"targetId"];
    v55[0] = @"targetId";
    v55[1] = @"actionType";
    v56[0] = v28;
    v56[1] = v29;
    v55[2] = @"result";
    v31 = @"success";
    if (v48) {
      v31 = @"failure";
    }
    v56[2] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL));
    v57 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v57, 1LL));

    [v21 setProperty:v33 forBodyKey:@"userActions"];
    id v13 = v21;
    goto LABEL_28;
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___APRemoteApprovalBiometricsMetricsEvent);
  [v13 setEventType:@"dialog"];
  if (-[UpdateRequestTask action](self, "action")) {
    v14 = @"ConfirmFamilySharingPurchase.BioAuth.Decline";
  }
  else {
    v14 = @"ConfirmFamilySharingPurchase.BioAuth.Approve";
  }
  [v13 setProperty:v14 forBodyKey:@"dialogId"];
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v9)
  {
    v58[0] = @"result";
    v58[1] = @"actionType";
    v59[0] = @"failure";
    v59[1] = @"authenticate";
    v59[2] = @"Biometric";
    v58[2] = @"targetId";
    v58[3] = @"reason";
    uint64_t v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_message"));
    v17 = (void *)v16;
    v18 = @"(null)";
    if (v16) {
      v18 = (const __CFString *)v16;
    }
    v59[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  4LL));
    -[NSMutableArray addObject:](v15, "addObject:", v19);
  }

  if (v8) {
    -[NSMutableArray addObject:](v15, "addObject:", &off_100032AD0);
  }
  if (-[NSMutableArray count](v15, "count"))
  {
    id v20 = -[NSMutableArray copy](v15, "copy");
    [v13 setProperty:v20 forBodyKey:@"userActions"];
  }

  if (!v8) {
    goto LABEL_17;
  }
LABEL_28:
  if (v10)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[ApproverStore sharedStore](&OBJC_CLASS___ApproverStore, "sharedStore"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v34 approvalRequestWithRequestIdentifier:v35]);

    if (v36)
    {
      if ([v36 lineOfBusiness] == (id)1)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction));

        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_1000188D0;
        v50[3] = &unk_100030B08;
        v39 = v47;
        id v51 = v47;
        id v52 = v13;
        [v38 addFinishBlock:v50];

LABEL_47:
        goto LABEL_48;
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedFrameworkConfig](&OBJC_CLASS___APLogConfig, "sharedFrameworkConfig"));
      if (!v43) {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
      if (!os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
      {
LABEL_46:

        v39 = v47;
        [v47 enqueueEvent:v13];
        goto LABEL_47;
      }

      *(_DWORD *)buf = 138543362;
      id v54 = (id)objc_opt_class(self);
      id v45 = v54;
      v46 = "%{public}@: LOB is not App Store. Enqueueing standard metrics.";
    }

    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedFrameworkConfig](&OBJC_CLASS___APLogConfig, "sharedFrameworkConfig"));
      if (!v43) {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
      if (!os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 138543362;
      id v54 = (id)objc_opt_class(self);
      id v45 = v54;
      v46 = "%{public}@: Error - Unable to load stored Request object. Enqueueing standard metrics.";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v44, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);

    goto LABEL_46;
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedFrameworkConfig](&OBJC_CLASS___APLogConfig, "sharedFrameworkConfig"));
  if (!v40) {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 OSLogObject]);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v54 = (id)objc_opt_class(self);
    id v42 = v54;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%{public}@: Error - No request object supplied. Enqueueing standard metrics.",  buf,  0xCu);
  }

  v39 = v47;
  [v47 enqueueEvent:v13];
LABEL_48:
}

- (id)_serverRequestWithUser:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 updateRequestURL]);

  v39[0] = @"requestId";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UpdateRequestTask requestIdentifier](self, "requestIdentifier"));
  v39[1] = @"approvalStatus";
  v40[0] = v9;
  int64_t v10 = -[UpdateRequestTask action](self, "action");
  objc_super v11 = &off_100032A60;
  if (!v10) {
    objc_super v11 = &off_100032A48;
  }
  v40[1] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  2LL));

  id v13 = objc_alloc_init(&OBJC_CLASS___URLRequestEncoder);
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[URLRequestEncoder requestWithMethod:bagURL:parameters:]( v13,  "requestWithMethod:bagURL:parameters:",  4LL,  v8,  v12));
  id v36 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 resultWithTimeout:&v36 error:60.0]);
  id v16 = v36;
  if (!v15)
  {
    v29 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  v34 = v8;
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSMutableURLRequest);
  if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
  {
    id v18 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 biometricsToken]);
    objc_msgSend(v18, "ap_setNullableValue:forHTTPHeaderField:", v19, @"X-IC-TouchToken");

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 DSID]);
    objc_msgSend(v18, "ap_setNullableValue:forHTTPHeaderField:", v20, @"X-IC-DSID");

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 password]);
    objc_msgSend(v18, "ap_setNullableValue:forHTTPHeaderField:", v21, @"X-IC-Password");

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
    objc_msgSend(v18, "ap_setNullableValue:forHTTPHeaderField:", v22, @"X-IC-Username");

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v23) {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "OSLogObject", a4));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v38 = v25;
      id v26 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Encoded request successfully",  buf,  0xCu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[URLSession sharedSession](&OBJC_CLASS___URLSession, "sharedSession"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 dataTaskPromiseWithRequest:v18]);

    id v35 = v16;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 resultWithTimeout:&v35 error:60.0]);
    id v30 = v35;

    a4 = v33;
  }

  else
  {
    uint64_t v31 = APError(0LL, @"Request error", @"Could not cast AMSURLRequest to NSMutableURLRequest", 0LL);
    id v30 = (id)objc_claimAutoreleasedReturnValue(v31);
    v29 = 0LL;
    id v18 = v16;
  }

  id v16 = v30;
  BOOL v8 = v34;
  if (a4) {
LABEL_14:
  }
    *a4 = v16;
LABEL_15:

  return v29;
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
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
LABEL_42:

      goto LABEL_43;
    }

    id v8 = [v7 integerValue];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    int64_t v10 = (void *)v9;
    if (!v8)
    {
      if (!v9) {
        int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = (id)objc_opt_class(self);
        id v24 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Success status code",  buf,  0xCu);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"touchToken"]);
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0) {
        id v27 = v25;
      }
      else {
        id v27 = 0LL;
      }

      -[UpdateRequestTask _storeBiometricsToken:](self, "_storeBiometricsToken:", v27);
      id v21 = 0LL;
      goto LABEL_42;
    }

    if (!v9) {
      int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v35 = (id)objc_opt_class(self);
      __int16 v36 = 2050;
      id v37 = v8;
      id v12 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@: Error status code. Status code: %{public}ld",  buf,  0x16u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"errorNumber"]);
    if ((objc_opt_respondsToSelector(v13, "integerValue") & 1) == 0)
    {
      uint64_t v28 = APError(0LL, @"Invalid response", @"Server response does not contain error code", 0LL);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v28);
LABEL_41:

      goto LABEL_42;
    }

    id v14 = [v13 integerValue];
    if (v14 == (id)3711)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v15) {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      v29 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v35 = v29;
      id v18 = v29;
      v19 = "%{public}@: Previously declined error code";
    }

    else if (v14 == (id)3710)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v15) {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      id v30 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v35 = v30;
      id v18 = v30;
      v19 = "%{public}@: Previously approved error code";
    }

    else
    {
      if (v14 != (id)3709)
      {
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Server response contains error. Error code: %ld",  v14));
        uint64_t v32 = APError(0LL, @"Server error", v31, 0LL);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v32);

        goto LABEL_41;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v15) {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      uint64_t v17 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v35 = v17;
      id v18 = v17;
      v19 = "%{public}@: Request expired error code";
    }

    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

LABEL_39:
    id v21 = 0LL;
    goto LABEL_41;
  }

  uint64_t v20 = APError(0LL, @"Invalid response", @"Server response object is nil", 0LL);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
LABEL_43:

  return v21;
}

- (void)_storeBiometricsToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = (id)objc_opt_class(self);
      id v8 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Biometrics token available",  (uint8_t *)&v11,  0xCu);
    }

    +[BiometricsHandler storeToken:](&OBJC_CLASS___BiometricsHandler, "storeToken:", v4);
  }

  else
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = (id)objc_opt_class(self);
      id v10 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Biometrics token not available",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (int64_t)action
{
  return self->_action;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void).cxx_destruct
{
}

@end