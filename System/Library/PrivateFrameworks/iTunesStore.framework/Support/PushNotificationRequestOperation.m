@interface PushNotificationRequestOperation
- (BOOL)_loadResponseWithAccountIdentifier:(id)a3 URL:(id)a4 error:(id *)a5;
- (NSString)userAgent;
- (PushNotificationRequestOperation)initWithPushNotificationParameters:(id)a3;
- (SSURLConnectionResponse)URLResponse;
- (void)dealloc;
- (void)run;
- (void)setUserAgent:(id)a3;
@end

@implementation PushNotificationRequestOperation

- (PushNotificationRequestOperation)initWithPushNotificationParameters:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PushNotificationRequestOperation;
  v4 = -[PushNotificationRequestOperation init](&v6, "init");
  if (v4) {
    v4->_parameters = (SSVPushNotificationParameters *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PushNotificationRequestOperation;
  -[PushNotificationRequestOperation dealloc](&v3, "dealloc");
}

- (void)setUserAgent:(id)a3
{
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  -[PushNotificationRequestOperation unlock](self, "unlock");
}

- (SSURLConnectionResponse)URLResponse
{
  objc_super v3 = self->_response;
  -[PushNotificationRequestOperation unlock](self, "unlock");
  return v3;
}

- (NSString)userAgent
{
  objc_super v3 = self->_userAgent;
  -[PushNotificationRequestOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  uint64_t v56 = 0LL;
  id v3 = -[SSVPushNotificationParameters accountIdentifier](self->_parameters, "accountIdentifier");
  if (!v3)
  {
    id v3 = objc_msgSend( objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"),  "uniqueIdentifier");
    if (!v3)
    {
      id v33 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v33) {
        id v33 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v34 = [v33 shouldLog];
      else {
        LODWORD(v35) = v34;
      }
      v36 = (os_log_s *)[v33 OSLogObject];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v35 = v35;
      }
      else {
        v35 &= 2u;
      }
      if ((_DWORD)v35)
      {
        int v57 = 138412290;
        uint64_t v58 = objc_opt_class(self);
        uint64_t v37 = _os_log_send_and_compose_impl( v35,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "%@: Can't perform request with no accountID",  &v57,  12);
        if (v37)
        {
          v38 = (void *)v37;
          v39 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v37, 4LL);
          free(v38);
          v53 = v39;
          SSFileLog(v33, @"%@");
        }
      }

      uint64_t v31 = SSErrorDomain;
      uint64_t v32 = 119LL;
      goto LABEL_50;
    }
  }

  v4 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL);
  -[SSURLBagContext setUserIdentifier:](v4, "setUserIdentifier:", v3);
  v5 = -[PushNotificationRequestOperation userAgent](self, "userAgent");
  -[SSURLBagContext setValue:forHTTPHeaderField:](v4, "setValue:forHTTPHeaderField:", v5, SSHTTPHeaderUserAgent);
  id v6 = -[PushNotificationRequestOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v4,  0LL);
  id v7 = [v6 valueForKey:@"push-notification-types"];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0) {
    goto LABEL_19;
  }
  id v9 = -[SSVPushNotificationParameters requestType](self->_parameters, "requestType");
  if (!v9)
  {
    id v10 = [v7 objectForKey:@"add-push-notification-type-url"];
    LODWORD(v11) = 1;
    goto LABEL_21;
  }

  if (v9 == (id)1)
  {
    id v10 = [v7 objectForKey:@"remove-push-notification-type-url"];
LABEL_20:
    LODWORD(v11) = 0;
    goto LABEL_21;
  }

  id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v12) {
    id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  int v13 = [v12 shouldLog];
  LODWORD(v14) = [v12 shouldLogToDisk] ? v13 | 2 : v13;
  v15 = (os_log_s *)[v12 OSLogObject];
  uint64_t v14 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT) ? v14 : v14 & 2u;
  if (!(_DWORD)v14)
  {
LABEL_19:
    id v10 = 0LL;
    goto LABEL_20;
  }

  uint64_t v16 = objc_opt_class(self);
  id v17 = -[SSVPushNotificationParameters requestType](self->_parameters, "requestType");
  int v57 = 138412546;
  uint64_t v58 = v16;
  __int16 v59 = 2048;
  id v60 = v17;
  v11 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: Unknown request type: %ld",  &v57,  22);
  if (v11)
  {
    v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
    free(v11);
    v53 = v18;
    SSFileLog(v12, @"%@");
    goto LABEL_19;
  }

  id v10 = 0LL;
LABEL_21:
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v19) & 1) == 0)
  {
    id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v23) {
      id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v24 = objc_msgSend(v23, "shouldLog", v53);
    else {
      LODWORD(v25) = v24;
    }
    v26 = (os_log_s *)[v23 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v25 = v25;
    }
    else {
      v25 &= 2u;
    }
    if ((_DWORD)v25)
    {
      uint64_t v27 = objc_opt_class(self);
      int v57 = 138412290;
      uint64_t v58 = v27;
      LODWORD(v54) = 12;
      uint64_t v28 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: Can't perform request with no URL",  &v57,  v54);
      if (v28)
      {
        v29 = (void *)v28;
        v30 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v28, 4LL);
        free(v29);
        v53 = v30;
        SSFileLog(v23, @"%@");
      }
    }

    uint64_t v31 = SSErrorDomain;
    uint64_t v32 = 124LL;
LABEL_50:
    uint64_t v40 = SSError(v31, v32, 0LL, 0LL);
    BOOL v41 = 0LL;
    uint64_t v56 = v40;
    goto LABEL_66;
  }

  if ((_DWORD)v11)
  {
    id v20 = -[SSVPushNotificationParameters environmentName](self->_parameters, "environmentName");
    if (!v20)
    {
      id v21 = [v6 valueForKey:@"push-notifications"];
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
        id v20 = [v21 objectForKey:@"environment"];
      }
      else {
        id v20 = 0LL;
      }
    }

    uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v20, v42) & 1) != 0)
    {
      id v43 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v43) {
        id v43 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v44 = objc_msgSend(v43, "shouldLog", v53);
      else {
        LODWORD(v45) = v44;
      }
      v46 = (os_log_s *)[v43 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO)) {
        uint64_t v45 = v45;
      }
      else {
        v45 &= 2u;
      }
      if ((_DWORD)v45)
      {
        uint64_t v47 = objc_opt_class(self);
        int v57 = 138412802;
        uint64_t v58 = v47;
        __int16 v59 = 2112;
        id v60 = v20;
        __int16 v61 = 2112;
        id v62 = v10;
        LODWORD(v54) = 32;
        uint64_t v48 = _os_log_send_and_compose_impl( v45,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  1LL,  "%@: Waiting for token register for environment: %@, URL: %@",  &v57,  v54);
        if (v48)
        {
          v49 = (void *)v48;
          v50 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v48, 4LL);
          free(v49);
          v53 = v50;
          SSFileLog(v43, @"%@");
        }
      }

      v51 = dispatch_semaphore_create(0LL);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_1000688A8;
      v55[3] = &unk_10034AE98;
      v55[4] = v51;
      -[PushNotificationController registerTokenForEnvironmentName:accountIdentifier:completionBlock:]( +[PushNotificationController sharedInstance](&OBJC_CLASS___PushNotificationController, "sharedInstance"),  "registerTokenForEnvironmentName:accountIdentifier:completionBlock:",  v20,  v3,  v55);
      dispatch_time_t v52 = dispatch_time(0LL, 60000000000LL);
      dispatch_semaphore_wait(v51, v52);
      dispatch_release(v51);
    }
  }

  BOOL v41 = -[PushNotificationRequestOperation _loadResponseWithAccountIdentifier:URL:error:]( self,  "_loadResponseWithAccountIdentifier:URL:error:",  v3,  +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10, v53),  &v56);
  uint64_t v40 = v56;
LABEL_66:
  -[PushNotificationRequestOperation setError:](self, "setError:", v40, v53);
  -[PushNotificationRequestOperation setSuccess:](self, "setSuccess:", v41);
}

- (BOOL)_loadResponseWithAccountIdentifier:(id)a3 URL:(id)a4 error:(id *)a5
{
  v29 = 0LL;
  id v9 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  objc_msgSend( v9,  "setDataProvider:",  +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  id v10 = -[SSMutableAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccountIdentifier:",  a3);
  -[SSMutableAuthenticationContext setPromptStyle:](v10, "setPromptStyle:", 1000LL);
  v11 = -[PushNotificationRequestOperation userAgent](self, "userAgent");
  uint64_t v12 = SSHTTPHeaderUserAgent;
  -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  v11,  SSHTTPHeaderUserAgent);
  [v9 setAuthenticationContext:v10];

  int v13 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setHTTPMethod:](v13, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURL:](v13, "setURL:", a4);
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v13,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v13,  "setValue:forHTTPHeaderField:",  -[PushNotificationRequestOperation userAgent](self, "userAgent"),  v12);
  id v14 = -[SSVPushNotificationParameters _copyParametersDictionary](self->_parameters, "_copyParametersDictionary");
  id v15 = -[ISDevice guid](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "guid");
  if (v15) {
    [v14 setObject:v15 forKey:@"guid"];
  }
  -[SSMutableURLRequestProperties setRequestParameters:](v13, "setRequestParameters:", v14);

  [v9 setRequestProperties:v13];
  id v16 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v16) {
    id v16 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v17 = [v16 shouldLog];
  else {
    LODWORD(v18) = v17;
  }
  uint64_t v19 = (os_log_s *)[v16 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
    uint64_t v18 = v18;
  }
  else {
    v18 &= 2u;
  }
  if ((_DWORD)v18)
  {
    int v30 = 138412546;
    uint64_t v31 = objc_opt_class(self);
    __int16 v32 = 2112;
    id v33 = a4;
    uint64_t v20 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Performing push notification request: %@",  &v30,  22);
    if (v20)
    {
      id v21 = (void *)v20;
      uint64_t v22 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v20, 4LL);
      free(v21);
      uint64_t v28 = v22;
      SSFileLog(v16, @"%@");
    }
  }

  unsigned int v23 = -[PushNotificationRequestOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v9,  &v29,  v28);
  if (v23)
  {
    id v24 = objc_msgSend(objc_msgSend(v9, "dataProvider"), "output");
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
      v26 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v24,  100LL,  0LL,  0LL);
    }
    else {
      v26 = 0LL;
    }
    -[PushNotificationRequestOperation lock](self, "lock");

    self->_response = -[SSURLConnectionResponse initWithURLResponse:bodyData:]( [SSURLConnectionResponse alloc],  "initWithURLResponse:bodyData:",  [v9 response],  v26);
    -[PushNotificationRequestOperation unlock](self, "unlock");
  }

  else
  {

    if (a5) {
      *a5 = v29;
    }
  }

  return v23;
}

@end