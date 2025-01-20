@interface AMSPurchaseShim
- (AMSBag)bag;
- (AMSPurchaseResult)result;
- (AMSPurchaseShim)initWithPurchase:(id)a3;
- (ISURLRequestPerformance)requestPerformanceMetrics;
- (NSDictionary)rawOutput;
- (NSDictionary)tidHeaders;
- (NSNumber)authenticatedAccountDSID;
- (NSString)storeCorrelationID;
- (SSAMSPurchase)purchase;
- (SSPurchase)ssPurchase;
- (SSURLConnectionResponse)URLResponse;
- (id)_legacyErrorFromError:(id)a3;
- (id)runPurchase:(id *)a3;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)setAuthenticatedAccountDSID:(id)a3;
- (void)setBag:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setRawOutput:(id)a3;
- (void)setRequestPerformanceMetrics:(id)a3;
- (void)setResult:(id)a3;
- (void)setSsPurchase:(id)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)setTidHeaders:(id)a3;
- (void)setURLResponse:(id)a3;
@end

@implementation AMSPurchaseShim

- (AMSPurchaseShim)initWithPurchase:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AMSPurchaseShim;
  v5 = -[AMSPurchaseShim init](&v18, "init");
  if (v5)
  {
    id v6 = [v4 newAMSPurchase];
    -[AMSPurchaseShim setPurchase:](v5, "setPurchase:", v6);

    -[AMSPurchaseShim setSsPurchase:](v5, "setSsPurchase:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPurchaseTask createBagForSubProfile](&OBJC_CLASS___AMSPurchaseTask, "createBagForSubProfile"));
    -[AMSPurchaseShim setBag:](v5, "setBag:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig"));
    if (!v8) {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      v12 = (void *)objc_opt_class(v5);
      id v13 = v12;
      uint64_t v14 = AMSSetLogKeyIfNeeded();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v19 = 138543618;
      v20 = v12;
      __int16 v21 = 2114;
      v22 = v15;
      v16 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "[%{public}@]: [%{public}@] AMSPurchaseShim is enabled for this purchase",  &v19,  22);

      if (!v16)
      {
LABEL_14:

        goto LABEL_15;
      }

      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      SSFileLog(v8, @"%@");
    }

    goto LABEL_14;
  }

- (id)runPurchase:(id *)a3
{
  uint64_t v5 = AMSSetLogKeyIfNeeded(self, a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    int v60 = 138543618;
    id v61 = (id)objc_opt_class(self);
    __int16 v62 = 2114;
    id v63 = v6;
    id v11 = v61;
    v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "[%{public}@]: [%{public}@] Beginning a shimmed purchase",  &v60,  22);

    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    v50 = v10;
    SSFileLog(v7, @"%@");
  }

LABEL_13:
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPurchaseShim purchase](self, "purchase"));
  [v13 setLogUUID:v6];
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 mediaType]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 accountIdentifier]);

  v55 = (void *)v14;
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  v14));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_accountTypeIdentifierForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_accountTypeIdentifierForMediaType:",  v14));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v13 accountIdentifier]);
    int v19 = a3;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", 0, v18, 0, v17));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v20));

    a3 = v19;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_activeiTunesAccountForMediaType:", v14));
  }

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_1001101EC;
  v57[3] = &unk_10034ECB8;
  v57[4] = self;
  id v22 = v6;
  id v58 = v22;
  id v23 = v13;
  id v59 = v23;
  v54 = v21;
  id v56 = 0LL;
  v53 = (void *)objc_claimAutoreleasedReturnValue([v21 continueWithBlock:v57]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v53 resultWithError:&v56]);
  id v25 = v56;
  if (v25)
  {
    v26 = v25;
    id v27 = (id)objc_claimAutoreleasedReturnValue(-[AMSPurchaseShim _legacyErrorFromError:](self, "_legacyErrorFromError:", v25));
    if (!v27) {
      goto LABEL_42;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig"));
    if (!v28) {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v29) = objc_msgSend(v28, "shouldLog", v50);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      uint64_t v29 = v29;
    }
    else {
      v29 &= 2u;
    }
    id v52 = v22;
    if ((_DWORD)v29)
    {
      v31 = (void *)objc_opt_class(self);
      int v60 = 138543618;
      id v61 = v31;
      __int16 v62 = 2114;
      id v63 = v22;
      v32 = a3;
      id v33 = v31;
      LODWORD(v51) = 22;
      v34 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  1LL,  "[%{public}@]: [%{public}@] Shimmed purchase error was rewritten",  &v60,  v51);

      a3 = v32;
      if (!v34)
      {
LABEL_29:

        id v27 = v27;
        id v35 = v27;
        id v22 = v52;
LABEL_41:

        v26 = v35;
        goto LABEL_42;
      }

      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL));
      free(v34);
      v50 = v30;
      SSFileLog(v28, @"%@");
    }

    goto LABEL_29;
  }

  id v27 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig"));
  if (!v27) {
    id v27 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v36) = objc_msgSend(v27, "shouldLog", v50);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_INFO)) {
    uint64_t v36 = v36;
  }
  else {
    v36 &= 2u;
  }
  if (!(_DWORD)v36)
  {
LABEL_40:
    id v35 = 0LL;
    goto LABEL_41;
  }

  v37 = (void *)objc_opt_class(self);
  int v60 = 138543618;
  id v61 = v37;
  __int16 v62 = 2114;
  id v63 = v22;
  id v38 = v37;
  LODWORD(v51) = 22;
  v39 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  1LL,  "[%{public}@]: [%{public}@] Shimmed purchase was successful",  &v60,  v51);

  if (v39)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v39,  4LL));
    free(v39);
    v50 = (os_log_s *)v26;
    SSFileLog(v27, @"%@");
    goto LABEL_40;
  }

  v26 = 0LL;
LABEL_42:

  if (a3) {
    *a3 = v26;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPurchaseShim ssPurchase](self, "ssPurchase", v50));
  id v41 = [v24 newSSPurchaseResponseWithSSPurchase:v40];

  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 URLResponse]);
  -[AMSPurchaseShim setResult:](self, "setResult:", v24);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v23 account]);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "ams_DSID"));
  -[AMSPurchaseShim setAuthenticatedAccountDSID:](self, "setAuthenticatedAccountDSID:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue([v24 responseDictionary]);
  -[AMSPurchaseShim setRawOutput:](self, "setRawOutput:", v45);

  -[AMSPurchaseShim setRequestPerformanceMetrics:](self, "setRequestPerformanceMetrics:", 0LL);
  -[AMSPurchaseShim setURLResponse:](self, "setURLResponse:", v42);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v42 storeCorrelationID]);
  -[AMSPurchaseShim setStoreCorrelationID:](self, "setStoreCorrelationID:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPurchaseShim ssPurchase](self, "ssPurchase"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v47 tidHeaders]);
  -[AMSPurchaseShim setTidHeaders:](self, "setTidHeaders:", v48);

  return v24;
}

- (id)_legacyErrorFromError:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:AMSErrorUserInfoKeyServerPayload]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kISDialogKey]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kISFailureTypeKey]);
  v7 = -[ISDialog initWithDialogDictionary:](objc_alloc(&OBJC_CLASS___ISDialog), "initWithDialogDictionary:", v5);
  if (-[ISDialog kind](v7, "kind") != (id)1)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ISDialog buttons](v7, "buttons"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      char v12 = 0;
      char v13 = 0;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v9);
          }
          unsigned int v16 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)i) actionType];
          if (v16 == 1)
          {
            char v12 = 1;
          }

          else if (v16 == 11 || v16 == 3)
          {
            char v13 = 1;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v11);
      if ((v13 & 1) != 0)
      {
        unsigned int v8 = 0LL;
LABEL_28:

        goto LABEL_29;
      }

      if ((v12 & 1) != 0)
      {
        uint64_t v18 = ISError(16LL, 0LL, 0LL);
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v18);
        goto LABEL_28;
      }
    }

    int v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"customerMessage"]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
    {

      int v19 = 0LL;
    }

    if (v6)
    {
      uint64_t v21 = SSServerErrorDomain;
      uint64_t v22 = (uint64_t)[v6 integerValue];
      uint64_t v23 = v21;
    }

    else
    {
      uint64_t v23 = SSErrorDomain;
      uint64_t v22 = 13LL;
    }

    uint64_t v24 = SSError(v23, v22, v19, 0LL);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v24);

    goto LABEL_28;
  }

  unsigned int v8 = 0LL;
LABEL_29:

  return v8;
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc(&OBJC_CLASS___AMSAuthenticateTask);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPurchaseShim bag](self, "bag"));
  id v12 = [v9 initWithRequest:v8 bag:v10];

  [v12 setDelegate:self];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 performAuthentication]);
  [v11 addFinishBlock:v7];
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v9 = [[AMSSystemAlertDialogTask alloc] initWithRequest:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 present]);
  [v8 addFinishBlock:v6];
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v9 = [[AMSSystemAlertDialogTask alloc] initWithRequest:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 present]);
  [v8 addFinishBlock:v6];
}

- (NSNumber)authenticatedAccountDSID
{
  return self->_authenticatedAccountDSID;
}

- (void)setAuthenticatedAccountDSID:(id)a3
{
}

- (NSDictionary)rawOutput
{
  return self->_rawOutput;
}

- (void)setRawOutput:(id)a3
{
}

- (ISURLRequestPerformance)requestPerformanceMetrics
{
  return self->_requestPerformanceMetrics;
}

- (void)setRequestPerformanceMetrics:(id)a3
{
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
}

- (SSURLConnectionResponse)URLResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(id)a3
{
}

- (SSAMSPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (SSPurchase)ssPurchase
{
  return self->_ssPurchase;
}

- (void)setSsPurchase:(id)a3
{
}

- (AMSPurchaseResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
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