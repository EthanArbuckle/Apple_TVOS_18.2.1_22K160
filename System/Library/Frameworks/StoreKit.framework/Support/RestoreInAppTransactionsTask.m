@interface RestoreInAppTransactionsTask
- (BOOL)forceAuthentication;
- (DialogProtocol)dialogContext;
- (NSArray)transactions;
- (NSString)applicationUsername;
- (NSString)logKey;
- (NSString)serverCorrelationID;
- (NSURL)receiptInstallURL;
- (RestoreInAppTransactionsTask)initWithClient:(id)a3;
- (_TtC9storekitd6Client)client;
- (id)_authenticateAccount:(id)a3 error:(id *)a4;
- (id)_runRequestWithError:(id *)a3;
- (void)main;
- (void)setApplicationUsername:(id)a3;
- (void)setDialogContext:(id)a3;
- (void)setForceAuthentication:(BOOL)a3;
- (void)setReceiptInstallURL:(id)a3;
@end

@implementation RestoreInAppTransactionsTask

- (RestoreInAppTransactionsTask)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RestoreInAppTransactionsTask;
  v6 = -[Task init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 50), a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
    v9 = *(void **)(v7 + 74);
    *(void *)(v7 + 74) = v8;
  }

  return (RestoreInAppTransactionsTask *)v7;
}

- (void)main
{
  if (qword_10032E690 != -1) {
    dispatch_once(&qword_10032E690, &stru_1002E8EB0);
  }
  v3 = (void *)qword_10032E660;
  if (os_log_type_enabled((os_log_t)qword_10032E660, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask logKey](self, "logKey"));
    *(_DWORD *)buf = 138543362;
    v34 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Restoring completed purchases",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask client](self, "client"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);

  if (v7) {
    goto LABEL_10;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask client](self, "client"));
  unsigned int v9 = objc_msgSend(v8, "objc_clientType");

  if (v9 == 3)
  {
    v7 = 0LL;
    goto LABEL_10;
  }

  id v32 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[RestoreInAppTransactionsTask _authenticateAccount:error:]( self,  "_authenticateAccount:error:",  0LL,  &v32));
  id v10 = v32;
  if (!v10)
  {
LABEL_10:
    id v31 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask _runRequestWithError:](self, "_runRequestWithError:", &v31));
    id v11 = v31;
    if (!v11) {
      goto LABEL_24;
    }
    goto LABEL_11;
  }

  id v11 = v10;
  v12 = 0LL;
LABEL_11:
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
  if (([v13 isEqualToString:AMSErrorDomain] & 1) == 0)
  {

    goto LABEL_18;
  }

  id v14 = [v11 code];

  if (v14 != (id)305) {
    goto LABEL_18;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:AMSErrorUserInfoKeyServerErrorCode]);
  v17 = (char *)[v16 integerValue];

  id v30 = v11;
  id v18 = -[RestoreInAppTransactionsTask _authenticateAccount:error:](self, "_authenticateAccount:error:", v7, &v30);
  id v19 = v30;

  if (v19)
  {
    id v11 = v19;
LABEL_18:
    if (qword_10032E690 != -1) {
      dispatch_once(&qword_10032E690, &stru_1002E8EB0);
    }
    v20 = (void *)qword_10032E660;
    if (os_log_type_enabled((os_log_t)qword_10032E660, OS_LOG_TYPE_ERROR)) {
      sub_10025FFE4(v20, self, (uint64_t)v11);
    }
    -[AsyncTask completeWithError:](self, "completeWithError:", v11);

    goto LABEL_27;
  }

  id v29 = 0LL;
  uint64_t v21 = objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask _runRequestWithError:](self, "_runRequestWithError:", &v29));
  id v11 = v29;

  v12 = (void *)v21;
  if (v11) {
    goto LABEL_18;
  }
LABEL_24:
  v22 = (void *)objc_claimAutoreleasedReturnValue([v12 object]);
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask client](self, "client"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask receiptInstallURL](self, "receiptInstallURL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask logKey](self, "logKey"));
    id v26 = sub_100025EEC(v22, v23, v24, 1LL, v25, 0, 0);
    v27 = (NSString *)objc_claimAutoreleasedReturnValue(v26);
    v28 = *(NSString **)((char *)&self->_applicationUsername + 2);
    *(NSString **)((char *)&self->_applicationUsername + 2) = v27;
  }

  -[AsyncTask completeWithSuccess](self, "completeWithSuccess");
LABEL_27:
}

- (id)_runRequestWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask client](self, "client"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bag]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask client](self, "client"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 urlSession]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask client](self, "client"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 urlRequestEncoder]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask logKey](self, "logKey"));
  [v9 setLogUUID:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask client](self, "client"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask receiptInstallURL](self, "receiptInstallURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 queryWith:1 customReceiptURL:v12]);
  id v14 = [v13 mutableCopy];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask applicationUsername](self, "applicationUsername"));
  [v14 setObject:v15 forKeyedSubscript:@"applicationUsername"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey restoreTransactionsURL](&OBJC_CLASS____TtC9storekitd6BagKey, "restoreTransactionsURL"));
  id v29 = v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 URLForKey:v16]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 requestWithMethod:4 bagURL:v17 parameters:v14]);

  id v31 = 0LL;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 resultWithError:&v31]);
  id v20 = v31;
  uint64_t v21 = v7;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v7 dataTaskPromiseWithRequest:v19]);
  id v30 = v20;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 resultWithError:&v30]);
  id v24 = v30;

  v25 = (NSString *)objc_claimAutoreleasedReturnValue([v23 responseCorrelationId]);
  id v26 = *(NSString **)((char *)&self->_logKey + 2);
  *(NSString **)((char *)&self->_logKey + 2) = v25;

  if (a3) {
    *a3 = v24;
  }

  return v23;
}

- (id)_authenticateAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v38 = 0LL;
  v39[0] = &v38;
  v39[1] = 0x3032000000LL;
  v39[2] = sub_100045DB0;
  v39[3] = sub_100045DC0;
  id v40 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_100045DB0;
  v36 = sub_100045DC0;
  id v37 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask dialogContext](self, "dialogContext"));
  BOOL v8 = v7 == 0LL;

  if (v8)
  {
    if (qword_10032E690 != -1) {
      dispatch_once(&qword_10032E690, &stru_1002E8EB0);
    }
    id v19 = (os_log_s *)(id)qword_10032E660;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask logKey](self, "logKey"));
      *(_DWORD *)buf = 138543362;
      v42 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] No client available to handle authentication request",  buf,  0xCu);
    }

    uint64_t v21 = ASDErrorWithDescription(ASDErrorDomain, 1061LL, @"No client available to handle authentication request");
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    id v11 = *(id *)(v39[0] + 40LL);
    *(void *)(v39[0] + 40LL) = v22;
  }

  else
  {
    if (qword_10032E690 != -1) {
      dispatch_once(&qword_10032E690, &stru_1002E8EB0);
    }
    unsigned int v9 = (os_log_s *)(id)qword_10032E660;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask logKey](self, "logKey"));
      *(_DWORD *)buf = 138543362;
      v42 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Sending authentication request",  buf,  0xCu);
    }

    id v11 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask client](self, "client"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 processInfo]);
    [v11 setClientInfo:v13];

    [v11 setAuthenticationType:0];
    [v11 setDebugReason:@"Restore In App"];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask logKey](self, "logKey"));
    [v11 setLogKey:v14];

    v15 = -[AMSAuthenticateRequest initWithAccount:options:]( objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest),  "initWithAccount:options:",  v6,  v11);
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask dialogContext](self, "dialogContext"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100045DC8;
    v28[3] = &unk_1002E7628;
    id v30 = &v32;
    id v31 = &v38;
    id v18 = v16;
    id v29 = v18;
    [v17 handleAuthenticateRequest:v15 completionHandler:v28];

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v33[5] account]);
  if (v23)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([(id)v33[5] account]);
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  if (qword_10032E690 != -1) {
    dispatch_once(&qword_10032E690, &stru_1002E8EB0);
  }
  v25 = (os_log_s *)(id)qword_10032E660;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreInAppTransactionsTask logKey](self, "logKey"));
    sub_100260098(v26, (uint64_t)v39, (uint64_t)buf, v25);
  }

  id v24 = 0LL;
  if (a4) {
LABEL_20:
  }
    *a4 = *(id *)(v39[0] + 40LL);
LABEL_21:
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v24;
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

- (NSString)applicationUsername
{
  return *(NSString **)(&self->_forceAuthentication + 2);
}

- (void)setApplicationUsername:(id)a3
{
}

- (BOOL)forceAuthentication
{
  return *(&self->super.super._success + 2);
}

- (void)setForceAuthentication:(BOOL)a3
{
  *(&self->super.super._success + 2) = a3;
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_client + 2);
}

- (NSURL)receiptInstallURL
{
  return *(NSURL **)((char *)&self->_dialogContext + 2);
}

- (void)setReceiptInstallURL:(id)a3
{
}

- (NSArray)transactions
{
  return *(NSArray **)((char *)&self->_applicationUsername + 2);
}

- (NSString)serverCorrelationID
{
  return *(NSString **)((char *)&self->_logKey + 2);
}

- (void).cxx_destruct
{
}

@end