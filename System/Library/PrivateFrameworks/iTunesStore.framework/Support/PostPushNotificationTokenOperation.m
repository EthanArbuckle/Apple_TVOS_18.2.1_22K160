@interface PostPushNotificationTokenOperation
- (BOOL)_postTokenToURL:(id)a3 error:(id *)a4;
- (NSData)tokenData;
- (NSString)environmentName;
- (PostPushNotificationTokenOperation)init;
- (PostPushNotificationTokenOperation)initWithEnvironmentName:(id)a3 tokenData:(id)a4;
- (SSAuthenticationContext)authenticationContext;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
@end

@implementation PostPushNotificationTokenOperation

- (PostPushNotificationTokenOperation)init
{
  return -[PostPushNotificationTokenOperation initWithEnvironmentName:tokenData:]( self,  "initWithEnvironmentName:tokenData:",  0LL,  0LL);
}

- (PostPushNotificationTokenOperation)initWithEnvironmentName:(id)a3 tokenData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PostPushNotificationTokenOperation;
  v6 = -[PostPushNotificationTokenOperation init](&v8, "init");
  if (v6)
  {
    v6->_environmentName = (NSString *)[a3 copy];
    v6->_tokenData = (NSData *)[a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PostPushNotificationTokenOperation;
  -[PostPushNotificationTokenOperation dealloc](&v3, "dealloc");
}

- (SSAuthenticationContext)authenticationContext
{
  objc_super v3 = self->_authenticationContext;
  -[PostPushNotificationTokenOperation unlock](self, "unlock");
  return v3;
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setAuthenticationContext:(id)a3
{
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
  }

  -[PostPushNotificationTokenOperation unlock](self, "unlock");
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)run
{
  uint64_t v38 = 0LL;
  if (self->_tokenData)
  {
    id v3 = -[PostPushNotificationTokenOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL),  &v38);
    if (!v3)
    {
      LODWORD(v18) = 0;
LABEL_49:
      BOOL v28 = (_DWORD)v18 != 0;
      uint64_t v27 = v38;
      goto LABEL_50;
    }

    id v4 = [v3 valueForKey:@"push-notifications"];
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = [v4 objectForKey:@"environment"];
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0
        && (environmentName = self->_environmentName,
            uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString),
            (objc_opt_isKindOfClass(environmentName, v9) & 1) != 0)
        && !-[NSString isEqualToString:](self->_environmentName, "isEqualToString:", v6))
      {
        id v29 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v29) {
          id v29 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v30 = [v29 shouldLog];
        else {
          LODWORD(v31) = v30;
        }
        v32 = (os_log_s *)[v29 OSLogObject];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
          uint64_t v31 = v31;
        }
        else {
          v31 &= 2u;
        }
        if ((_DWORD)v31)
        {
          uint64_t v33 = objc_opt_class(self);
          int v39 = 138412290;
          uint64_t v40 = v33;
          uint64_t v34 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  1LL,  "%@: Environment name mismatch, skipping token POST",  &v39,  12);
          if (v34)
          {
            v35 = (void *)v34;
            v36 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL);
            free(v35);
            v37 = v36;
            SSFileLog(v29, @"%@");
          }
        }

        v12 = 0LL;
      }

      else
      {
        id v10 = [v4 objectForKey:@"register-success"];
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0) {
          goto LABEL_9;
        }
        v12 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v10);
        if (!v12) {
          goto LABEL_9;
        }
      }

      LODWORD(v18) = -[PostPushNotificationTokenOperation _postTokenToURL:error:]( self,  "_postTokenToURL:error:",  v12,  &v38,  v37);
      goto LABEL_48;
    }

- (BOOL)_postTokenToURL:(id)a3 error:(id *)a4
{
  unsigned int v30 = 0LL;
  id v7 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  objc_msgSend( v7,  "setAuthenticationContext:",  -[PostPushNotificationTokenOperation authenticationContext](self, "authenticationContext"));
  objc_msgSend( v7,  "setDataProvider:",  +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v7 setDelegate:self];
  [v7 setUseUserSpecificURLBag:1];
  id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v8) {
    id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  uint64_t v11 = (os_log_s *)[v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if ((_DWORD)v10)
  {
    uint64_t v12 = objc_opt_class(self);
    environmentName = self->_environmentName;
    tokenData = self->_tokenData;
    int v31 = 138543874;
    uint64_t v32 = v12;
    __int16 v33 = 2114;
    uint64_t v34 = environmentName;
    __int16 v35 = 2112;
    v36 = tokenData;
    uint64_t v15 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%{public}@: Posting APS token for %{public}@. Token: %@",  &v31,  32);
    if (v15)
    {
      v16 = (void *)v15;
      uint64_t v17 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v15, 4LL);
      free(v16);
      id v29 = v17;
      SSFileLog(v8, @"%@");
    }
  }

  v18 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  a3);
  -[SSMutableURLRequestProperties setHTTPMethod:](v18, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v18,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v20 = +[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance");
  unsigned int v21 = self->_environmentName;
  if (v21) {
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v21, @"environment");
  }
  uint64_t v22 = self->_tokenData;
  if (v22) {
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v22, @"token");
  }
  id v23 = -[ISDevice deviceName](v20, "deviceName", v29);
  if (v23)
  {
    id v24 = [v23 dataUsingEncoding:4 allowLossyConversion:1];
    if (v24) {
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v24, @"device-name-data");
    }
  }

  id v25 = -[ISDevice serialNumber](v20, "serialNumber");
  if (v25) {
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v25, @"serial-number");
  }
  id v26 = -[ISDevice guid](v20, "guid");
  if (v26) {
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v26, @"guid");
  }
  -[SSMutableURLRequestProperties setRequestParameters:](v18, "setRequestParameters:", v19);

  [v7 setRequestProperties:v18];
  unsigned __int8 v27 = -[PostPushNotificationTokenOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v30);
  [v7 setDelegate:0];

  if (a4) {
    *a4 = v30;
  }
  return v27;
}

@end