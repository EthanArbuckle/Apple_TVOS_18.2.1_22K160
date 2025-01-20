@interface GetAutomaticDownloadKindsOperation
- (NSArray)enabledDownloadKinds;
- (SSAuthenticationContext)authenticationContext;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
@end

@implementation GetAutomaticDownloadKindsOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GetAutomaticDownloadKindsOperation;
  -[GetAutomaticDownloadKindsOperation dealloc](&v3, "dealloc");
}

- (SSAuthenticationContext)authenticationContext
{
  objc_super v3 = self->_authContext;
  -[GetAutomaticDownloadKindsOperation unlock](self, "unlock");
  return v3;
}

- (NSArray)enabledDownloadKinds
{
  objc_super v3 = self->_enabledDownloadKinds;
  -[GetAutomaticDownloadKindsOperation unlock](self, "unlock");
  return v3;
}

- (void)setAuthenticationContext:(id)a3
{
  authContext = self->_authContext;
  if (authContext != a3)
  {

    self->_authContext = (SSAuthenticationContext *)[a3 copy];
  }

  -[GetAutomaticDownloadKindsOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  objc_msgSend( v3,  "setAuthenticationContext:",  -[GetAutomaticDownloadKindsOperation authenticationContext](self, "authenticationContext"));
  objc_msgSend( v3,  "setDataProvider:",  +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v3 setUseUserSpecificURLBag:1];
  v4 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setURLBagKey:](v4, "setURLBagKey:", @"enabled-media-types");
  [v3 setRequestProperties:v4];

  id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  v8 = (os_log_s *)[v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    int v40 = 138412290;
    uint64_t v41 = objc_opt_class(self);
    uint64_t v10 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Fetching enabled kinds",  &v40,  12);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      v36 = v12;
      *(void *)&double v9 = SSFileLog(v5, @"%@").n128_u64[0];
    }
  }

  v39 = 0LL;
  id v13 = -[GetAutomaticDownloadKindsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  &v39,  v9,  v36);
  if ((v13 & 1) != 0)
  {
    id v14 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output");
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      id v17 = [v14 objectForKey:@"enabled-media-kinds"];
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      {
        id v19 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v19) {
          id v19 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v20 = [v19 shouldLog];
        else {
          LODWORD(v21) = v20;
        }
        v22 = (os_log_s *)[v19 OSLogObject];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
          uint64_t v21 = v21;
        }
        else {
          v21 &= 2u;
        }
        if ((_DWORD)v21)
        {
          uint64_t v24 = objc_opt_class(self);
          int v40 = 138412546;
          uint64_t v41 = v24;
          __int16 v42 = 2112;
          id v43 = v17;
          LODWORD(v38) = 22;
          uint64_t v25 = _os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  1LL,  "%@: Found enabled kinds: %@",  &v40,  v38);
          if (v25)
          {
            v26 = (void *)v25;
            v27 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL);
            free(v26);
            v37 = v27;
            *(void *)&double v23 = SSFileLog(v19, @"%@").n128_u64[0];
          }
        }

        -[GetAutomaticDownloadKindsOperation lock](self, "lock", v23, v37);

        self->_enabledDownloadKinds = (NSArray *)v17;
        -[GetAutomaticDownloadKindsOperation unlock](self, "unlock");
      }
    }
  }

  else
  {
    id v28 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v28) {
      id v28 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v29 = [v28 shouldLog];
    else {
      LODWORD(v30) = v29;
    }
    v31 = (os_log_s *)[v28 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v30 = v30;
    }
    else {
      v30 &= 2u;
    }
    if ((_DWORD)v30)
    {
      uint64_t v32 = objc_opt_class(self);
      int v40 = 138412546;
      uint64_t v41 = v32;
      __int16 v42 = 2112;
      id v43 = v39;
      LODWORD(v38) = 22;
      uint64_t v33 = _os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "%@: Could not fetch kinds: %@",  &v40,  v38);
      if (v33)
      {
        v34 = (void *)v33;
        v35 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v33, 4LL);
        free(v34);
        v37 = v35;
        *(void *)&double v16 = SSFileLog(v28, @"%@").n128_u64[0];
      }
    }
  }

  -[GetAutomaticDownloadKindsOperation setError:](self, "setError:", v39, v16, v37);
  -[GetAutomaticDownloadKindsOperation setSuccess:](self, "setSuccess:", v13);
}

@end