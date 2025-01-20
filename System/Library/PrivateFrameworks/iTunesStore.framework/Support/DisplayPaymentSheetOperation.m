@interface DisplayPaymentSheetOperation
- (AKAppleIDAuthenticationContext)authenticationContext;
- (BOOL)touchIDDelayEnabled;
- (DisplayPaymentSheetOperation)initWithPaymentSheet:(id)a3;
- (NSData)challenge;
- (NSDictionary)localAuthOptions;
- (NSNumber)accountIdentifier;
- (NSString)accountName;
- (NSString)dialogId;
- (NSString)userAgent;
- (SSPaymentSheet)paymentSheet;
- (id)_metricsDialogEvent;
- (id)completionHandler;
- (id)completionHandlerForAutoEnrollment;
- (id)containerCompletionHandler;
- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_loadURLBag;
- (void)_postMetricsWithDialogEvent:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandlerForAutoEnrollment:(id)a3;
- (void)setContainerCompletionHandler:(id)a3;
- (void)setDialogId:(id)a3;
- (void)setLocalAuthOptions:(id)a3;
- (void)setTouchIDDelayEnabled:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation DisplayPaymentSheetOperation

- (DisplayPaymentSheetOperation)initWithPaymentSheet:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DisplayPaymentSheetOperation;
  v6 = -[DisplayPaymentSheetOperation init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    v6->_didAuthorizePayment = 0;
    v6->_didBiometricsLockout = 0;
    v6->_didCancelHomeButton = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunesstored.DisplayPaymentSheetOperation.dispatchQueue", 0LL);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v8;

    fpanID = v7->_fpanID;
    v7->_fpanID = 0LL;

    v7->_isASNPurchase = 0;
    objc_storeStrong((id *)&v7->_paymentSheet, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    userActions = v7->_userActions;
    v7->_userActions = v11;
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___DisplayPaymentSheetOperation;
  -[DisplayPaymentSheetOperation dealloc](&v2, "dealloc");
}

- (SSPaymentSheet)paymentSheet
{
  return self->_paymentSheet;
}

- (void)run
{
  uint64_t v3 = SSError(SSErrorDomain, 20LL, 0LL, 0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[DisplayPaymentSheetOperation _completeWithSuccess:error:](self, "_completeWithSuccess:error:", 0LL, v4);
}

- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if (!(_DWORD)v9) {
    goto LABEL_14;
  }
  v11 = (void *)objc_opt_class(self);
  v12 = @"NO";
  int v27 = 138543874;
  v28 = v11;
  __int16 v29 = 2114;
  if (v4) {
    v12 = @"YES";
  }
  v30 = v12;
  __int16 v31 = 2114;
  id v32 = v6;
  id v13 = v11;
  objc_super v14 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%{public}@: Completion block with success: %{public}@, error: %{public}@",  &v27,  32);

  if (v14)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    v24 = v10;
    SSFileLog(v7, @"%@");
LABEL_14:
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPaymentSheetOperation _metricsDialogEvent](self, "_metricsDialogEvent"));
  v16 = v15;
  if (v15)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100060184;
    block[3] = &unk_10034AD58;
    block[4] = self;
    id v26 = v15;
    dispatch_async(dispatchQueue, block);
  }

  -[DisplayPaymentSheetOperation setError:](self, "setError:", v6, v24);
  -[DisplayPaymentSheetOperation setSuccess:](self, "setSuccess:", v4);
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[DisplayPaymentSheetOperation completionHandlerForAutoEnrollment](self, "completionHandlerForAutoEnrollment"));
  v19 = (void *)v18;
  if (v18)
  {
    (*(void (**)(uint64_t, NSData *, NSString *, BOOL, NSData *, NSString *, id))(v18 + 16))( v18,  self->_signedChallenge,  self->_passwordEquivalentToken,  self->_didAuthorizePayment,  self->_paymentTokenData,  self->_fpanID,  v6);
  }

  else
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[DisplayPaymentSheetOperation completionHandler](self, "completionHandler"));
    v21 = (void *)v20;
    if (v20) {
      (*(void (**)(uint64_t, NSData *, NSString *, BOOL, id))(v20 + 16))( v20,  self->_signedChallenge,  self->_passwordEquivalentToken,  self->_didAuthorizePayment,  v6);
    }
  }

  -[DisplayPaymentSheetOperation setCompletionHandler:](self, "setCompletionHandler:", 0LL);
  -[DisplayPaymentSheetOperation setCompletionHandlerForAutoEnrollment:]( self,  "setCompletionHandlerForAutoEnrollment:",  0LL);
  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[DisplayPaymentSheetOperation containerCompletionHandler](self, "containerCompletionHandler"));
  v23 = (void *)v22;
  if (v22) {
    (*(void (**)(uint64_t))(v22 + 16))(v22);
  }
  -[DisplayPaymentSheetOperation setContainerCompletionHandler:](self, "setContainerCompletionHandler:", 0LL);
}

- (void)_loadURLBag
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___ISLoadURLBagOperation);
  id v16 = 0LL;
  unsigned int v4 = -[DisplayPaymentSheetOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  &v16);
  id v5 = v16;
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v15 = (ISURLBag *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v3, "URLBag"));
    urlBag = self->_urlBag;
    self->_urlBag = v15;
    goto LABEL_18;
  }

  urlBag = (ISURLBag *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!urlBag) {
    urlBag = (ISURLBag *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = -[ISURLBag shouldLog](urlBag, "shouldLog");
  else {
    LODWORD(v10) = v9;
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ISURLBag OSLogObject](urlBag, "OSLogObject"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_16;
  }
  v12 = (void *)objc_opt_class(self);
  int v17 = 138543618;
  uint64_t v18 = v12;
  __int16 v19 = 2114;
  uint64_t v20 = v6;
  id v13 = v12;
  objc_super v14 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "%{public}@: Failed to load URL bag with error: %{public}@",  &v17,  22);

  if (v14)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    SSFileLog(urlBag, @"%@");
LABEL_16:
  }

- (id)_metricsDialogEvent
{
  return 0LL;
}

- (void)_postMetricsWithDialogEvent:(id)a3
{
  id v4 = a3;
  urlBag = self->_urlBag;
  if (urlBag || (-[DisplayPaymentSheetOperation _loadURLBag](self, "_loadURLBag"), (urlBag = self->_urlBag) != 0LL))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ISURLBag valueForKey:](urlBag, "valueForKey:", SSMetricsURLBagKey));
    if ([v6 count])
    {
      objc_initWeak(location, self);
      id v7 = [[SSMetricsConfiguration alloc] initWithGlobalConfiguration:v6];
      unsigned int v8 = objc_alloc_init(&OBJC_CLASS___SSMetricsController);
      -[SSMetricsController setGlobalConfiguration:](v8, "setGlobalConfiguration:", v7);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000607C4;
      v24[3] = &unk_10034C640;
      objc_copyWeak(&v25, location);
      -[SSMetricsController insertEvent:withCompletionHandler:](v8, "insertEvent:withCompletionHandler:", v4, v24);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100060970;
      v22[3] = &unk_10034C640;
      objc_copyWeak(&v23, location);
      -[SSMetricsController flushUnreportedEventsWithCompletionHandler:]( v8,  "flushUnreportedEventsWithCompletionHandler:",  v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);

      objc_destroyWeak(location);
    }

    else
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v9) {
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v10 = [v9 shouldLog];
      else {
        LODWORD(v11) = v10;
      }
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        uint64_t v11 = v11;
      }
      else {
        v11 &= 2u;
      }
      if ((_DWORD)v11)
      {
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = (id)objc_opt_class(self);
        id v13 = *(id *)((char *)location + 4);
        objc_super v14 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "%{public}@: Metrics failed with no bag key",  location,  12);

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
          free(v14);
          SSFileLog(v9, @"%@");
        }
      }

      else
      {
      }
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v6 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class(self);
      id v19 = *(id *)((char *)location + 4);
      uint64_t v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  16LL,  "%{public}@: Metrics failed with no bag",  location,  12);

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
        free(v20);
        SSFileLog(v6, @"%@");
      }
    }

    else
    {
    }
  }
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setAccountName:(id)a3
{
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  return (AKAppleIDAuthenticationContext *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setAuthenticationContext:(id)a3
{
}

- (NSData)challenge
{
  return (NSData *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setChallenge:(id)a3
{
}

- (BOOL)touchIDDelayEnabled
{
  return self->_touchIDDelayEnabled;
}

- (void)setTouchIDDelayEnabled:(BOOL)a3
{
  self->_touchIDDelayEnabled = a3;
}

- (id)containerCompletionHandler
{
  return objc_getProperty(self, a2, 208LL, 1);
}

- (void)setContainerCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 216LL, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandlerForAutoEnrollment
{
  return objc_getProperty(self, a2, 224LL, 1);
}

- (void)setCompletionHandlerForAutoEnrollment:(id)a3
{
}

- (NSString)dialogId
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setDialogId:(id)a3
{
}

- (NSDictionary)localAuthOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setLocalAuthOptions:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end