@interface FetchReceiptTask
- (BOOL)_isUnifiedReceiptValidAndCurrentAtBundleURL:(id)a3;
- (BOOL)_useVPPBagURL;
- (DialogProtocol)dialogContext;
- (FetchReceiptTask)initWithClient:(id)a3;
- (NSString)logKey;
- (NSString)receiptString;
- (_TtC9storekitd6Client)client;
- (id)_URLRequestWithBag:(id)a3 error:(id *)a4;
- (id)_accountWithError:(id *)a3;
- (id)_requestBody;
- (id)_requestReceiptStringError:(id *)a3;
- (int64_t)apiVersion;
- (unint64_t)receiptFlags;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)_authenticateAndRequestReceipt;
- (void)main;
- (void)setApiVersion:(int64_t)a3;
- (void)setDialogContext:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setReceiptFlags:(unint64_t)a3;
@end

@implementation FetchReceiptTask

- (FetchReceiptTask)initWithClient:(id)a3
{
  id v5 = a3;
  v6 = -[Task init](self, "init");
  v7 = v6;
  if (v6)
  {
    *(void *)(&v6->super.super._success + 2) = 1LL;
    objc_storeStrong((id *)((char *)&v6->super.super._error + 2), a3);
  }

  return v7;
}

- (void)main
{
  if (!*(int64_t *)((char *)&self->_apiVersion + 2))
  {
    int64_t v3 = objc_claimAutoreleasedReturnValue( +[NSUUID lib_shortLogKeyWithAPIVersion:]( &OBJC_CLASS___NSUUID,  "lib_shortLogKeyWithAPIVersion:",  -[FetchReceiptTask apiVersion](self, "apiVersion")));
    v4 = *(void **)((char *)&self->_apiVersion + 2);
    *(int64_t *)((char *)&self->_apiVersion + 2) = v3;
  }

  if (qword_10032E1A0 != -1) {
    dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
  }
  id v5 = (void *)qword_10032E180;
  if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
    *(_DWORD *)buf = 138543618;
    v29 = v7;
    __int16 v30 = 2114;
    id v31 = (id)objc_opt_class(self);
    id v8 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@]: Started task",  buf,  0x16u);
  }

  if ((id)-[FetchReceiptTask apiVersion](self, "apiVersion") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    if (objc_msgSend(v9, "objc_clientType") == 3)
    {
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 callerBundleURL]);
      unsigned int v12 = -[FetchReceiptTask _isUnifiedReceiptValidAndCurrentAtBundleURL:]( self,  "_isUnifiedReceiptValidAndCurrentAtBundleURL:",  v11);

      if (v12)
      {
        if (qword_10032E1A0 != -1) {
          dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
        }
        v13 = (void *)qword_10032E180;
        if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 requestBundleID]);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 callerBundleURL]);
          *(_DWORD *)buf = 138543874;
          v29 = v15;
          __int16 v30 = 2114;
          id v31 = v17;
          __int16 v32 = 2114;
          v33 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Receipt is valid and current at %{public}@. Skipping refresh.",  buf,  0x20u);
        }

        uint64_t v20 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  603LL,  @"Request throttled",  @"Unified receipt is valid and current");
        uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
        if (v21)
        {
          id v22 = (id)v21;
          v23 = 0LL;
          goto LABEL_25;
        }
      }
    }
  }

  id v27 = 0LL;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask _requestReceiptStringError:](self, "_requestReceiptStringError:", &v27));
  id v22 = v27;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
  char v25 = objc_opt_respondsToSelector(v24, "handleAuthenticateRequest:completionHandler:");

  if ((v25 & 1) == 0)
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    v26 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_ERROR))
    {
      sub_10025D44C(v26);
      if (v22) {
        goto LABEL_25;
      }
      goto LABEL_27;
    }

- (id)_accountWithError:(id *)a3
{
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = sub_100028750;
  v55 = sub_100028760;
  id v56 = 0LL;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = sub_100028750;
  v49 = sub_100028760;
  id v50 = 0LL;
  if (qword_10032E1A0 != -1) {
    dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
  }
  id v5 = (os_log_s *)(id)qword_10032E180;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestBundleID]);
    *(_DWORD *)buf = 138543618;
    v58 = v6;
    __int16 v59 = 2114;
    v60 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Sending authentication request for receipt renewal",  buf,  0x16u);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 processInfo]);
  [v9 setClientInfo:v11];

  [v9 setDebugReason:@"Receipt renewal"];
  unsigned int v12 = -[AMSAuthenticateRequest initWithDSID:altDSID:username:options:]( objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest),  "initWithDSID:altDSID:username:options:",  0LL,  0LL,  0LL,  v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
  char v14 = objc_opt_respondsToSelector(v13, "handleAuthenticateRequest:completionHandler:");

  if ((v14 & 1) != 0)
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    v15 = (os_log_s *)(id)qword_10032E180;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      v58 = v16;
      __int16 v59 = 2114;
      v60 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Handling authentication request",  buf,  0x16u);
    }

    dispatch_semaphore_t v19 = dispatch_semaphore_create(0LL);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100028768;
    v41[3] = &unk_1002E7628;
    v43 = &v45;
    v44 = &v51;
    uint64_t v21 = v19;
    v42 = v21;
    [v20 handleAuthenticateRequest:v12 completionHandler:v41];

    int64_t v22 = dispatch_time(0LL, 300000000000LL);
    dispatch_time_t v23 = dispatch_time(0LL, v22);
    if (dispatch_semaphore_wait(v21, v23))
    {
      uint64_t v24 = ASDErrorWithDescription(ASDErrorDomain, 530LL, @"Authenticate timed out");
      uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)v52[5];
      v52[5] = v25;
    }
  }

  else
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    id v27 = (os_log_s *)(id)qword_10032E180;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      v58 = v34;
      __int16 v59 = 2114;
      v60 = v36;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@] No delegate to handle authentication request",  buf,  0x16u);
    }

    uint64_t v28 = ASDErrorWithDescription(ASDErrorDomain, 530LL, @"Client authenticate not supported");
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    uint64_t v21 = (dispatch_semaphore_s *)v52[5];
    v52[5] = v29;
  }

  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v46[5] account]);
  if (v30)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue([(id)v46[5] account]);
  }

  else
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    __int16 v32 = (os_log_s *)(id)qword_10032E180;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 requestBundleID]);
      uint64_t v40 = v52[5];
      *(_DWORD *)buf = 138543874;
      v58 = v37;
      __int16 v59 = 2114;
      v60 = v39;
      __int16 v61 = 2114;
      uint64_t v62 = v40;
      _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@] No account for receipt renewal: %{public}@",  buf,  0x20u);
    }

    id v31 = 0LL;
    if (a3) {
      *a3 = (id) v52[5];
    }
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v31;
}

- (void)_authenticateAndRequestReceipt
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));

  if (v3)
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    v4 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      int64_t v22 = v6;
      __int16 v23 = 2114;
      uint64_t v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Handling authentication request",  buf,  0x16u);
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 processInfo]);
    [v9 setClientInfo:v11];

    [v9 setDebugReason:@"Receipt"];
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 account]);

    char v14 = -[AMSAuthenticateRequest initWithAccount:options:]( objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest),  "initWithAccount:options:",  v13,  v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100028ACC;
    v20[3] = &unk_1002E7EE8;
    v20[4] = self;
    [v15 handleAuthenticateRequest:v14 completionHandler:v20];
  }

  else
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    v16 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      *(_DWORD *)buf = 138543362;
      int64_t v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] No client available to handle authentication request",  buf,  0xCu);
    }

    uint64_t v19 = ASDErrorWithDescription(ASDErrorDomain, 1061LL, @"No client available to handle authentication request");
    id v9 = (id)objc_claimAutoreleasedReturnValue(v19);
    -[AsyncTask completeWithError:](self, "completeWithError:", v9);
  }
}

- (id)_requestReceiptStringError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bag]);

  id v34 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask _URLRequestWithBag:error:](self, "_URLRequestWithBag:error:", v6, &v34));
  id v8 = v34;
  if (v8)
  {
    id v9 = v8;
    v10 = 0LL;
    v11 = 0LL;
    goto LABEL_30;
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 urlSession]);

  [v13 setDelegate:self];
  char v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataTaskPromiseWithRequest:v7]);
  id v33 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 resultWithError:&v33]);
  id v9 = v33;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v15 object]);

  v11 = 0LL;
  if (!v9 && v10)
  {
    int64_t v16 = -[FetchReceiptTask apiVersion](self, "apiVersion");
    if (v16 == 1) {
      v17 = @"status";
    }
    else {
      v17 = @"errorCode";
    }
    if (v16 == 1) {
      v18 = @"receipt";
    }
    else {
      v18 = @"signedReceipt";
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v17]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v18]);
    if (v19 && [v19 integerValue])
    {
      if (qword_10032E1A0 != -1) {
        dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
      }
      uint64_t v21 = (void *)qword_10032E180;
      if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_ERROR)) {
        sub_10025D594(v21, self, (uint64_t)v19);
      }
      uint64_t v22 = ASDServerErrorDomain;
      uint64_t v23 = (uint64_t)[v19 integerValue];
      uint64_t v24 = v22;
      uint64_t v25 = 0LL;
      v26 = 0LL;
LABEL_28:
      uint64_t v31 = ASDErrorWithTitleAndMessage(v24, v23, v25, v26);
      id v9 = (id)objc_claimAutoreleasedReturnValue(v31);
      v11 = 0LL;
      goto LABEL_29;
    }

    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v20, v27) & 1) != 0)
    {
      id v28 = (id)objc_claimAutoreleasedReturnValue([v20 base64EncodedStringWithOptions:0]);
    }

    else
    {
      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v20, v29) & 1) == 0)
      {
        if (qword_10032E1A0 != -1) {
          dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
        }
        __int16 v30 = (void *)qword_10032E180;
        if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_ERROR)) {
          sub_10025D4F0(v30);
        }
        uint64_t v24 = ASDErrorDomain;
        uint64_t v25 = @"Invalid receipt data";
        uint64_t v23 = 507LL;
        v26 = @"Invalid receipt data";
        goto LABEL_28;
      }

      id v28 = v20;
    }

    v11 = v28;
    id v9 = 0LL;
LABEL_29:
  }

- (BOOL)_isUnifiedReceiptValidAndCurrentAtBundleURL:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ASFReceipt receiptFromBundleAtURL:](&OBJC_CLASS___ASFReceipt, "receiptFromBundleAtURL:", a3));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestBundleID]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
    unsigned int v54 = [v6 isEqualToString:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requestBundleVersion]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleVersion]);
    LODWORD(v11) = [v9 isEqualToString:v10];

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
    [v12 timeIntervalSinceNow];
    double v14 = v13;

    v15 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceVendorID]);
    [v17 getUUIDBytes:buf];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 16LL));
    -[NSMutableData appendData:](v15, "appendData:", v18);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 opaqueDSIDData]);
    -[NSMutableData appendData:](v15, "appendData:", v19);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIDData]);
    -[NSMutableData appendData:](v15, "appendData:", v20);

    *(void *)md = 0LL;
    uint64_t v71 = 0LL;
    int v72 = 0;
    uint64_t v21 = v15;
    CC_SHA1(-[NSMutableData bytes](v21, "bytes"), (CC_LONG)-[NSMutableData length](v21, "length"), md);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 sha1]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 20LL));
    LODWORD(v24) = [v22 isEqualToData:v23];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bag]);

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey receiptRefreshMinAge](&OBJC_CLASS____TtC9storekitd6BagKey, "receiptRefreshMinAge"));
    uint64_t v53 = v26;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 integerForKey:v27]);

    id v55 = 0LL;
    v52 = v28;
    uint64_t v29 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v28 valueWithError:&v55]);
    id v30 = v55;
    id v31 = v30;
    if (!v29)
    {
      else {
        uint64_t v29 = 0LL;
      }
    }

    uint64_t v51 = v31;
    [v29 doubleValue];
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v32));
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v4 creationDate]);
    id v35 = [v33 compare:v34];

    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    v36 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
    {
      log = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      int v50 = (int)v24;
      v38 = (void *)objc_claimAutoreleasedReturnValue([v48 requestBundleID]);
      v49 = v21;
      if (v54) {
        v39 = @"PASS";
      }
      else {
        v39 = @"FAIL";
      }
      id v24 = v35;
      if ((_DWORD)v11) {
        uint64_t v40 = @"PASS";
      }
      else {
        uint64_t v40 = @"FAIL";
      }
      char v46 = (char)v11;
      if (v50) {
        v11 = @"PASS";
      }
      else {
        v11 = @"FAIL";
      }
      if (v14 < 0.0) {
        v41 = @"FAIL";
      }
      else {
        v41 = @"PASS";
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue([v4 creationDate]);
      *(_DWORD *)buf = 138544898;
      v57 = v37;
      __int16 v58 = 2114;
      __int16 v59 = v38;
      __int16 v60 = 2114;
      __int16 v61 = v39;
      uint64_t v21 = v49;
      __int16 v62 = 2114;
      v63 = v40;
      id v35 = v24;
      __int16 v64 = 2114;
      v65 = v11;
      LOBYTE(v11) = v46;
      __int16 v66 = 2114;
      v67 = v41;
      __int16 v68 = 2114;
      v69 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Receipt Validation \n \tBundle ID Check: %{public}@\n \tBundle Version Check: %{public}@\n \tGUID Check: %{public}@\n \tExpiration Check: %{public}@\n \tCreation Date: %{public}@",  buf,  0x48u);

      LOBYTE(v24) = v50;
    }

    char v43 = v54 & v11 & v24;
    if (v14 < 0.0) {
      char v43 = 0;
    }
    if (v35 == (id)-1LL) {
      BOOL v44 = v43;
    }
    else {
      BOOL v44 = 0;
    }
  }

  else
  {
    BOOL v44 = 0;
  }

  return v44;
}

- (id)_URLRequestWithBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 account]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  unsigned int v10 = objc_msgSend(v9, "objc_clientType");

  unsigned int v11 = -[FetchReceiptTask _useVPPBagURL](self, "_useVPPBagURL");
  unsigned int v12 = v11;
  id v13 = 0LL;
  if (v8) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v10 == 3;
  }
  if (v14) {
    v15 = (void *)v8;
  }
  else {
    v15 = 0LL;
  }
  if (!v14 && (v11 & 1) == 0)
  {
    id v46 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask _accountWithError:](self, "_accountWithError:", &v46));
    id v13 = v46;
  }

  if (v15) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v10 == 3;
  }
  if (v16) {
    int v17 = 1;
  }
  else {
    int v17 = v12;
  }
  if (v17 != 1)
  {
    id v24 = 0LL;
    if (!a4) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }

  BOOL v44 = a4;
  if (v12)
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    v18 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v18;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      v48 = v20;
      __int16 v49 = 2114;
      int v50 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Fetching vpp app receipt",  buf,  0x16u);
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[BagKey createVPPReceiptURL](&OBJC_CLASS____TtC9storekitd6BagKey, "createVPPReceiptURL"));
  }

  else
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    uint64_t v25 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      v48 = v27;
      __int16 v49 = 2114;
      int v50 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Fetching app receipt",  buf,  0x16u);
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[BagKey createAppReceiptURL](&OBJC_CLASS____TtC9storekitd6BagKey, "createAppReceiptURL"));
  }

  id v30 = (void *)v23;
  id v31 = v6;
  double v32 = (void *)objc_claimAutoreleasedReturnValue([v6 URLForKey:v23]);

  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 urlRequestEncoder]);

  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask _requestBody](self, "_requestBody"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v34 requestWithMethod:4 bagURL:v32 parameters:v35]);

  id v45 = v13;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v36 resultWithError:&v45]);
  id v37 = v45;

  if ((id)-[FetchReceiptTask apiVersion](self, "apiVersion") != (id)1)
  {
    v38 = sub_100026E88(*(void *)(&self->super.super._success + 2));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    [v24 setValue:v39 forHTTPHeaderField:@"X-Apple-Client-StoreKit-Version"];
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 callerBundleID]);
  unsigned int v42 = [v41 isEqualToString:@"com.apple.news"];

  if (v42) {
    [v24 setValue:@"News" forHTTPHeaderField:AMSHTTPHeaderClientApplication];
  }

  id v13 = v37;
  id v6 = v31;
  a4 = v44;
  if (v44) {
LABEL_35:
  }
    *a4 = v13;
LABEL_36:

  return v24;
}

- (id)_requestBody
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 account]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_DSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  objc_msgSend(v7, "objc_clientType");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_secureTokenForAccount:", v5));

  if (v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"xToken");
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"guid");

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice serialNumber](&OBJC_CLASS___AMSDevice, "serialNumber"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"serialNumber");

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceVendorID]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, @"vid");

  if ((id)-[FetchReceiptTask apiVersion](self, "apiVersion") != (id)1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceVendorID]);
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lowercaseString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v18,  @"deviceVerification");
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  unsigned int v20 = [v19 isBeta];

  if (v20) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  off_100327F70[0]);
  }
  unsigned int v21 = -[FetchReceiptTask receiptFlags](self, "receiptFlags") & 1;
  if (v21) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"want-expired");
  }
  if ((-[FetchReceiptTask receiptFlags](self, "receiptFlags") & 2) != 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"want-revoked");
    unsigned int v21 = 1;
  }

  int v22 = v21 | (-[FetchReceiptTask receiptFlags](self, "receiptFlags") >> 3) & 1;
  if (v22 == 1) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"want-vpp");
  }
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 callerBundleURL]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[ASFReceipt receiptFromBundleAtURL:](&OBJC_CLASS___ASFReceipt, "receiptFromBundleAtURL:", v24));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
  unsigned int v27 = objc_msgSend(v26, "objc_clientType");

  if (v27 == 1)
  {
    id v28 = @"adam-id";
    if (v22) {
      id v28 = @"appAdamId";
    }
    uint64_t v29 = v9;
    id v30 = v6;
    if (v22) {
      id v31 = @"appExtVrsId";
    }
    else {
      id v31 = @"software-version-external-identifier";
    }
    double v32 = v28;
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v33 storeItemID]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v34, v32);

    id v35 = v31;
    id v6 = v30;
    id v9 = v29;
    v36 = v35;
    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v37 storeExternalVersionID]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v38, v36);
  }

  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 requestBundleID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v40, @"bundle-id");

    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 requestBundleVersion]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v38, @"version-id");
  }

  return v3;
}

- (BOOL)_useVPPBagURL
{
  return (BYTE2(self->_client) & 0xB) != 0;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, void, void *))a6;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
  char v11 = objc_opt_respondsToSelector(v10, "handleDialogRequest:completionHandler:");

  if ((v11 & 1) != 0)
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    unsigned int v12 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 requestBundleID]);
      int v20 = 138543618;
      unsigned int v21 = v14;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Handling dialog request",  (uint8_t *)&v20,  0x16u);
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
    [v17 handleDialogRequest:v8 completionHandler:v9];
  }

  else
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    v18 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_ERROR)) {
      sub_10025D684(v18);
    }
    uint64_t v19 = ASDErrorWithDescription(ASDErrorDomain, 908LL, @"Operation Canceled");
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v9[2](v9, 0LL, v17);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, void, void *))a6;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
  char v11 = objc_opt_respondsToSelector(v10, "handleAuthenticateRequest:completionHandler:");

  if ((v11 & 1) != 0)
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    unsigned int v12 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 requestBundleID]);
      int v20 = 138543618;
      unsigned int v21 = v14;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Handling authentication request",  (uint8_t *)&v20,  0x16u);
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
    [v17 handleAuthenticateRequest:v8 completionHandler:v9];
  }

  else
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    v18 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_ERROR)) {
      sub_10025D44C(v18);
    }
    uint64_t v19 = ASDErrorWithDescription(ASDErrorDomain, 908LL, @"Operation Canceled");
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v9[2](v9, 0LL, v17);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
  char v11 = objc_opt_respondsToSelector(v10, "handleEngagementRequest:bag:completionHandler:");

  if ((v11 & 1) != 0)
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    unsigned int v12 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask logKey](self, "logKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 requestBundleID]);
      int v22 = 138543618;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Handling engagement request",  (uint8_t *)&v22,  0x16u);
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask dialogContext](self, "dialogContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FetchReceiptTask client](self, "client"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bag]);
    [v17 handleEngagementRequest:v8 bag:v19 completionHandler:v9];

    id v9 = v18;
  }

  else
  {
    if (qword_10032E1A0 != -1) {
      dispatch_once(&qword_10032E1A0, &stru_1002E7F08);
    }
    int v20 = (void *)qword_10032E180;
    if (os_log_type_enabled((os_log_t)qword_10032E180, OS_LOG_TYPE_ERROR)) {
      sub_10025D728(v20);
    }
    uint64_t v21 = ASDErrorWithDescription(ASDErrorDomain, 908LL, @"Operation Canceled");
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v17);
  }
}

- (int64_t)apiVersion
{
  return *(void *)(&self->super.super._success + 2);
}

- (void)setApiVersion:(int64_t)a3
{
  *(void *)(&self->super.super._success + 2) = a3;
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->super.super._error + 2);
}

- (DialogProtocol)dialogContext
{
  return *(DialogProtocol **)(&self->super._finished + 1);
}

- (void)setDialogContext:(id)a3
{
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_apiVersion + 2);
}

- (void)setLogKey:(id)a3
{
}

- (unint64_t)receiptFlags
{
  return *(unint64_t *)((char *)&self->_client + 2);
}

- (void)setReceiptFlags:(unint64_t)a3
{
  *(_TtC9storekitd6Client **)((char *)&self->_client + 2) = (_TtC9storekitd6Client *)a3;
}

- (NSString)receiptString
{
  return *(NSString **)((char *)&self->_dialogContext + 2);
}

- (void).cxx_destruct
{
}

@end