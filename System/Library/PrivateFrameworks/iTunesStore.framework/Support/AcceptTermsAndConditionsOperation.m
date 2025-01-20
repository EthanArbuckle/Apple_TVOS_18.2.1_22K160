@interface AcceptTermsAndConditionsOperation
- (AcceptTermsAndConditionsOperation)init;
- (AcceptTermsAndConditionsOperation)initWithAccount:(id)a3;
- (BOOL)isUserAccepted;
- (id)_newTermsAcceptSrvOperation;
- (id)_newTermsCheckSrvOperation;
- (void)_acceptTermsAndConditionsWithBlock:(id)a3;
- (void)_checkTermsAndConditionsWithBlock:(id)a3;
- (void)_dismissTermsAndConditionsWithAcceptance:(BOOL)a3;
- (void)_presentTermsAndConditions;
- (void)alertProxy:(id)a3 didReceiveMessage:(id)a4;
- (void)alertProxyDidCancel:(id)a3;
- (void)run;
- (void)setUserAccepted:(BOOL)a3;
@end

@implementation AcceptTermsAndConditionsOperation

- (AcceptTermsAndConditionsOperation)init
{
  return -[AcceptTermsAndConditionsOperation initWithAccount:](self, "initWithAccount:", 0LL);
}

- (AcceptTermsAndConditionsOperation)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AcceptTermsAndConditionsOperation;
  v6 = -[AcceptTermsAndConditionsOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (BOOL)isUserAccepted
{
  BOOL userAccepted = self->_userAccepted;
  -[AcceptTermsAndConditionsOperation unlock](self, "unlock");
  return userAccepted;
}

- (void)setUserAccepted:(BOOL)a3
{
  self->_BOOL userAccepted = a3;
  -[AcceptTermsAndConditionsOperation unlock](self, "unlock");
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    LODWORD(v29) = 138412290;
    *(void *)((char *)&v29 + 4) = objc_opt_class(self);
    id v7 = *(id *)((char *)&v29 + 4);
    v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  2LL,  "%@: Operation started",  &v29,  12);

    if (v8)
    {
      objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
      free(v8);
      v22 = v9;
      SSFileLog(v3, @"%@");
    }
  }

  else
  {
  }

  *(void *)&__int128 v29 = 0LL;
  *((void *)&v29 + 1) = &v29;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_100010398;
  v32 = sub_1000103A8;
  id v33 = 0LL;
  if (!self->_account)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v13) = objc_msgSend(v12, "shouldLog", v22);
    unsigned int v14 = [v12 shouldLogToDisk];
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    v16 = v15;
    if (v14) {
      LODWORD(v13) = v13 | 2;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)objc_opt_class(self);
      id v17 = *(id *)((char *)location + 4);
      LODWORD(v23) = 12;
      v18 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Terminating with no account",  location,  v23);

      if (!v18)
      {
LABEL_29:

        uint64_t v19 = SSError(SSErrorDomain, 137LL, 0LL, 0LL);
        uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = *(void **)(*((void *)&v29 + 1) + 40LL);
        *(void *)(*((void *)&v29 + 1) + 40LL) = v20;

        goto LABEL_30;
      }

      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
      free(v18);
      v22 = v16;
      SSFileLog(v12, @"%@");
    }

    goto LABEL_29;
  }

  objc_initWeak(location, self);
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000103B0;
  v24[3] = &unk_10034B030;
  objc_copyWeak(&v27, location);
  v26 = &v29;
  v24[4] = self;
  v11 = v10;
  v25 = v11;
  -[AcceptTermsAndConditionsOperation _checkTermsAndConditionsWithBlock:]( self,  "_checkTermsAndConditionsWithBlock:",  v24);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->_userAccepted && !*(void *)(*((void *)&v29 + 1) + 40LL)) {
    -[AcceptTermsAndConditionsOperation _presentTermsAndConditions](self, "_presentTermsAndConditions");
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(location);
LABEL_30:
  -[AcceptTermsAndConditionsOperation setError:](self, "setError:", *(void *)(*((void *)&v29 + 1) + 40LL), v22);
  -[AcceptTermsAndConditionsOperation setSuccess:](self, "setSuccess:", self->_result);
  _Block_object_dispose(&v29, 8);
}

- (void)alertProxy:(id)a3 didReceiveMessage:(id)a4
{
  xpc_object_t value = xpc_dictionary_get_value(a4, "1");
  v6 = (void *)objc_claimAutoreleasedReturnValue(value);
  xpc_object_t xBOOL = v6;
  BOOL v7 = v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(xBOOL);
  -[AcceptTermsAndConditionsOperation _dismissTermsAndConditionsWithAcceptance:]( self,  "_dismissTermsAndConditionsWithAcceptance:",  v7);
}

- (void)alertProxyDidCancel:(id)a3
{
}

- (void)_acceptTermsAndConditionsWithBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, id, id))a3;
  id v5 = -[AcceptTermsAndConditionsOperation _newTermsAcceptSrvOperation](self, "_newTermsAcceptSrvOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ISDataProvider provider](&OBJC_CLASS___ISDataProvider, "provider"));
  [v5 setDataProvider:v6];

  [v5 setNeedsAuthentication:1];
  [v5 setNeedsTermsAndConditionsAcceptance:0];
  id v14 = 0LL;
  unsigned int v7 = -[AcceptTermsAndConditionsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v5,  &v14);
  id v8 = v14;
  if (v4 && v7)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v5 dataProvider]);
    dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 output]);

    if (v10)
    {
      id v13 = v8;
      v11 = -[SSTermsAndConditions initWithResponseData:error:]( objc_alloc(&OBJC_CLASS___SSTermsAndConditions),  "initWithResponseData:error:",  v10,  &v13);
      id v12 = v13;

      id v8 = v12;
    }

    else
    {
      v11 = 0LL;
    }

    v4[2](v4, -[SSTermsAndConditions isUserAccepted](v11, "isUserAccepted"), v8);
  }
}

- (void)_checkTermsAndConditionsWithBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, SSTermsAndConditions *, id))a3;
  id v5 = -[AcceptTermsAndConditionsOperation _newTermsCheckSrvOperation](self, "_newTermsCheckSrvOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ISDataProvider provider](&OBJC_CLASS___ISDataProvider, "provider"));
  [v5 setDataProvider:v6];

  [v5 setNeedsAuthentication:1];
  [v5 setNeedsTermsAndConditionsAcceptance:0];
  id v13 = 0LL;
  LODWORD(v6) = -[AcceptTermsAndConditionsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v5,  &v13);
  id v7 = v13;
  if ((_DWORD)v6)
  {
    if (v4)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dataProvider]);
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 output]);

      if (v9)
      {
        id v12 = v7;
        dispatch_semaphore_t v10 = -[SSTermsAndConditions initWithResponseData:error:]( objc_alloc(&OBJC_CLASS___SSTermsAndConditions),  "initWithResponseData:error:",  v9,  &v12);
        id v11 = v12;

        id v7 = v11;
      }

      else
      {
        dispatch_semaphore_t v10 = 0LL;
      }

      v4[2](v4, v10, v7);
    }
  }

  else if (v4)
  {
    v4[2](v4, 0LL, v7);
  }
}

- (void)_dismissTermsAndConditionsWithAcceptance:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_14;
  }
  objc_super v9 = (void *)objc_opt_class(self);
  dispatch_semaphore_t v10 = @"NO";
  if (v3) {
    dispatch_semaphore_t v10 = @"YES";
  }
  int v19 = 138412546;
  uint64_t v20 = v9;
  __int16 v21 = 2112;
  v22 = v10;
  id v11 = v9;
  id v12 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  2LL,  "%@: Ending alert with acceptance: %@",  &v19,  22);

  if (v12)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    id v17 = v8;
    SSFileLog(v5, @"%@");
LABEL_14:
  }

  -[AcceptTermsAndConditionsOperation lock](self, "lock");
  self->_BOOL userAccepted = v3;
  self->_result = 1;
  alertSemaphore = (dispatch_semaphore_s *)self->_alertSemaphore;
  if (alertSemaphore)
  {
    id v14 = alertSemaphore;
    v15 = self->_alertSemaphore;
    self->_alertSemaphore = 0LL;
  }

  -[SpringBoardAlertProxy setDelegate:](self->_alertProxy, "setDelegate:", 0LL, v17);
  alertProxy = self->_alertProxy;
  self->_alertProxy = 0LL;

  -[AcceptTermsAndConditionsOperation unlock](self, "unlock");
  if (self->_userAccepted)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100010F5C;
    v18[3] = &unk_10034B058;
    v18[4] = self;
    -[AcceptTermsAndConditionsOperation _acceptTermsAndConditionsWithBlock:]( self,  "_acceptTermsAndConditionsWithBlock:",  v18);
  }

  if (alertSemaphore) {
    dispatch_semaphore_signal(alertSemaphore);
  }
}

- (id)_newTermsAcceptSrvOperation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v4, "setITunesStoreRequest:", 1LL);
  -[SSMutableURLRequestProperties setURLBagKey:](v4, "setURLBagKey:", @"terms-check");
  -[SSMutableURLRequestProperties setHTTPMethod:](v4, "setHTTPMethod:", @"POST");
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SSTermsAndConditions currentVersionIdentifier](self->_conditions, "currentVersionIdentifier")));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, @"accepted");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  0LL,  0LL));
  -[SSMutableURLRequestProperties setHTTPBody:](v4, "setHTTPBody:", v7);

  [v3 setRequestProperties:v4];
  id v8 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  self->_account);
  -[SSMutableAuthenticationContext setShouldIgnoreAccountConversion:](v8, "setShouldIgnoreAccountConversion:", 1LL);
  -[SSMutableAuthenticationContext setPromptStyle:](v8, "setPromptStyle:", 1001LL);
  id v9 = -[SSMutableAuthenticationContext copy](v8, "copy");
  [v3 setAuthenticationContext:v9];

  return v3;
}

- (id)_newTermsCheckSrvOperation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v4, "setITunesStoreRequest:", 1LL);
  -[SSMutableURLRequestProperties setURLBagKey:](v4, "setURLBagKey:", @"terms-check");
  [v3 setRequestProperties:v4];
  id v5 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  self->_account);
  -[SSMutableAuthenticationContext setShouldIgnoreAccountConversion:](v5, "setShouldIgnoreAccountConversion:", 1LL);
  -[SSMutableAuthenticationContext setPromptStyle:](v5, "setPromptStyle:", 1001LL);
  id v6 = -[SSMutableAuthenticationContext copy](v5, "copy");
  [v3 setAuthenticationContext:v6];

  return v3;
}

- (void)_presentTermsAndConditions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  id v4 = -[AcceptTermsAndConditionsOperation copyActivePowerAssertionIdentifiers]( self,  "copyActivePowerAssertionIdentifiers");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    id v9 = (void *)objc_opt_class(self);
    id v10 = v9;
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v9;
    __int16 v44 = 2048;
    id v45 = [v4 count];
    id v11 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  2LL,  "%@: Disabling %lu power assertions before user interaction",  location,  22);

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      uint64_t v30 = v12;
      SSFileLog(v5, @"%@");
    }
  }

  else
  {
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v3, "releasePowerAssertion:", *(void *)(*((void *)&v37 + 1) + 8 * (void)i), v30);
      }

      id v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v14);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v17 beginShowingDialog];
  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v18,  "setObject:forKey:",  @"ServiceTermsPageViewController",  SBSUIRemoteAlertOptionViewControllerClass);
  int v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  conditions = self->_conditions;
  if (conditions)
  {
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SSTermsAndConditions currentText](conditions, "currentText"));
    v22 = v21;
    if (v21 && [v21 length]) {
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v22, @"terms");
    }
  }

  uint64_t v23 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  alertSemaphore = self->_alertSemaphore;
  self->_alertSemaphore = v23;

  objc_initWeak((id *)location, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100011844;
  v35[3] = &unk_10034B080;
  objc_copyWeak(&v36, (id *)location);
  v35[4] = self;
  [v25 activateAlertWithDescription:v18 options:v19 completionBlock:v35];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_alertSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)location);

  [v17 endShowingDialog];
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v26 = v13;
  id v27 = [v26 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend(v3, "takePowerAssertion:", *(void *)(*((void *)&v31 + 1) + 8 * (void)j), v30);
      }

      id v27 = [v26 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }

    while (v27);
  }
}

- (void).cxx_destruct
{
}

@end