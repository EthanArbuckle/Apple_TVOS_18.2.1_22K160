@interface RemoteWebViewOperation
- (BOOL)didActivate;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)alertSemaphore;
- (RemoteWebViewOperation)initWithWebViewRequest:(id)a3;
- (SSRemoteWebViewRequest)request;
- (id)activationHandler;
- (void)_sendActivationWithError:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)run;
- (void)setActivationHandler:(id)a3;
- (void)setAlertSemaphore:(id)a3;
- (void)setDidActivate:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation RemoteWebViewOperation

- (RemoteWebViewOperation)initWithWebViewRequest:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RemoteWebViewOperation;
  v6 = -[RemoteWebViewOperation init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunesstored.RemoteWebView", 0LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }

  return v7;
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    v7 = (void *)objc_opt_class(self);
    id v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteWebViewOperation request](self, "request"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLString]);
    int v45 = 138543618;
    v46 = v7;
    __int16 v47 = 2114;
    v48 = v10;
    objc_super v11 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%{public}@: Presenting remote SKUI with URL: %{public}@",  &v45,  22);

    if (!v11) {
      goto LABEL_13;
    }
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    v41 = v6;
    SSFileLog(v3, @"%@");
  }

LABEL_13:
  v12 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  alertSemaphore = self->_alertSemaphore;
  self->_alertSemaphore = v12;

  id v14 = [[SBSRemoteAlertDefinition alloc] initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServiceWebViewPromptViewController"];
  id v15 = objc_alloc_init(&OBJC_CLASS___SBSRemoteAlertConfigurationContext);
  v43[0] = @"referrer";
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteWebViewOperation request](self, "request"));
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 referrer]);
  v18 = (void *)v17;
  if (v17) {
    v19 = (const __CFString *)v17;
  }
  else {
    v19 = &stru_10035EB18;
  }
  v43[1] = @"URLString";
  v44[0] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteWebViewOperation request](self, "request", v41));
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 URLString]);
  v22 = (void *)v21;
  if (v21) {
    v23 = (const __CFString *)v21;
  }
  else {
    v23 = &stru_10035EB18;
  }
  v44[1] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
  [v15 setUserInfo:v24];

  id v25 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:]( &OBJC_CLASS___SBSRemoteAlertHandle,  "newHandleWithDefinition:configurationContext:",  v14,  v15);
  v26 = v25;
  if (v25)
  {
    [v25 addObserver:self];
    [v26 activateWithContext:0];
    v27 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[RemoteWebViewOperation alertSemaphore](self, "alertSemaphore"));
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    uint64_t v34 = SSError(SSErrorDomain, 0LL, 0LL, 0LL);
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    if (v35)
    {
      v33 = (void *)v35;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v28) {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v36 = [v28 shouldLog];
      else {
        LODWORD(v37) = v36;
      }
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        uint64_t v37 = v37;
      }
      else {
        v37 &= 2u;
      }
      if ((_DWORD)v37)
      {
        v38 = (void *)objc_opt_class(self);
        int v45 = 138543618;
        v46 = v38;
        __int16 v47 = 2114;
        v48 = v33;
        id v39 = v38;
        LODWORD(v42) = 22;
        v40 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  16LL,  "%{public}@: Error presenting remote SKUI view controller. Error: %{public}@",  &v45,  v42);

        if (!v40) {
          goto LABEL_33;
        }
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
        free(v40);
        SSFileLog(v28, @"%@");
      }

      goto LABEL_32;
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v28) {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v29) = [v28 shouldLog];
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v29 = v29;
  }
  else {
    v29 &= 2u;
  }
  if (!(_DWORD)v29)
  {
LABEL_31:
    v33 = 0LL;
LABEL_32:

    goto LABEL_33;
  }

  v31 = (void *)objc_opt_class(self);
  int v45 = 138543362;
  v46 = v31;
  id v32 = v31;
  LODWORD(v42) = 12;
  v33 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%{public}@: Remote SKUI view controller presented",  &v45,  v42);

  if (v33)
  {
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  4LL));
    free(v33);
    SSFileLog(v28, @"%@");
    goto LABEL_31;
  }

- (void)remoteAlertHandleDidActivate:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3));
  if (!v4) {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if (!(_DWORD)v6) {
    goto LABEL_12;
  }
  int v10 = 138543362;
  id v11 = (id)objc_opt_class(self);
  id v8 = v11;
  v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%{public}@: Remote handle did activate",  &v10,  12);

  if (v9)
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    SSFileLog(v4, @"%@");
LABEL_12:
  }

  -[RemoteWebViewOperation _sendActivationWithError:](self, "_sendActivationWithError:", 0LL);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3));
  if (!v4) {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if (!(_DWORD)v6) {
    goto LABEL_12;
  }
  int v10 = 138543362;
  id v11 = (id)objc_opt_class(self);
  id v8 = v11;
  v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%{public}@: Remote handle did deactivate",  &v10,  12);

  if (v9)
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    SSFileLog(v4, @"%@");
LABEL_12:
  }

  -[RemoteWebViewOperation _sendActivationWithError:](self, "_sendActivationWithError:", 0LL);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_alertSemaphore);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_12;
  }
  int v12 = 138543618;
  id v13 = (id)objc_opt_class(self);
  __int16 v14 = 2114;
  id v15 = v5;
  id v10 = v13;
  id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%{public}@: Remote handle did invalidate with error: %{public}@",  &v12,  22);

  if (v11)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    SSFileLog(v6, @"%@");
LABEL_12:
  }

  -[RemoteWebViewOperation _sendActivationWithError:](self, "_sendActivationWithError:", v5);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_alertSemaphore);
}

- (void)_sendActivationWithError:(id)a3
{
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RemoteWebViewOperation queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001341E8;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
}

- (SSRemoteWebViewRequest)request
{
  return self->_request;
}

- (OS_dispatch_semaphore)alertSemaphore
{
  return self->_alertSemaphore;
}

- (void)setAlertSemaphore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (void).cxx_destruct
{
}

@end