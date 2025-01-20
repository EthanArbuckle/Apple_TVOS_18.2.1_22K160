@interface GratisClaimProtocolDataProvider
- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4;
- (NSURL)redirectedClaimURL;
- (void)dealloc;
- (void)setRedirectedClaimURL:(id)a3;
@end

@implementation GratisClaimProtocolDataProvider

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GratisClaimProtocolDataProvider;
  -[DaemonProtocolDataProvider dealloc](&v3, "dealloc");
}

- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4
{
  v23 = 0LL;
  [a3 setPerformsButtonAction:0];
  unsigned int v7 = -[GratisClaimProtocolDataProvider runSubOperation:error:](self, "runSubOperation:error:", a3, &v23);
  id v8 = [a3 redirectURL];
  id v9 = [a3 selectedButton];
  if (v8
    || (v20 = v9, [v9 actionType] == 1)
    && ([v20 urlType] != (id)1
     || objc_msgSend(objc_msgSend(v20, "subtarget"), "isEqualToString:", @"account.upToDateClaim"))
    && (id v8 = [v20 parameter]) != 0)
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      uint64_t v15 = objc_opt_class(self);
      int v24 = 138412546;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v8;
      uint64_t v16 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Redirecting claim to URL: %@",  &v24,  22);
      if (v16)
      {
        v17 = (void *)v16;
        v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        v22 = v18;
        *(void *)&double v14 = SSFileLog(v10, @"%@").n128_u64[0];
      }
    }

    -[GratisClaimProtocolDataProvider setAuthenticatedAccountDSID:]( self,  "setAuthenticatedAccountDSID:",  objc_msgSend(a3, "authenticatedAccountDSID", v14, v22));
    -[GratisClaimProtocolDataProvider setRedirectedClaimURL:](self, "setRedirectedClaimURL:", v8);
  }

  else
  {
    if (v7)
    {
      -[GratisClaimProtocolDataProvider setAuthenticatedAccountDSID:]( self,  "setAuthenticatedAccountDSID:",  [a3 authenticatedAccountDSID]);
      return v7;
    }

    objc_msgSend(v20, "performDefaultActionForDialog:", objc_msgSend(a3, "dialog"));
  }

  if (a4) {
    char v19 = v7;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0) {
    *a4 = v23;
  }
  return v7;
}

- (NSURL)redirectedClaimURL
{
  return (NSURL *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setRedirectedClaimURL:(id)a3
{
}

@end