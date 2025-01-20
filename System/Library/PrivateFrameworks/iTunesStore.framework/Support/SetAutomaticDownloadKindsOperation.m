@interface SetAutomaticDownloadKindsOperation
- (BOOL)_isFatalError:(id)a3;
- (BOOL)_postDownloadKinds:(id)a3 error:(id *)a4;
- (BOOL)runsOnlyIfKindsAreDirty;
- (BOOL)shouldSuppressServerDialogs;
- (NSSet)downloadKinds;
- (NSSet)previousDownloadKinds;
- (NSString)clientIdentifierHeader;
- (SSAuthenticationContext)authenticationContext;
- (SetAutomaticDownloadKindsOperation)initWithDownloadKinds:(id)a3;
- (id)_copyFilteredDownloadKinds;
- (id)uniqueKey;
- (void)_run;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setPreviousDownloadKinds:(id)a3;
- (void)setRunsOnlyIfKindsAreDirty:(BOOL)a3;
- (void)setShouldSuppressServerDialogs:(BOOL)a3;
@end

@implementation SetAutomaticDownloadKindsOperation

- (SetAutomaticDownloadKindsOperation)initWithDownloadKinds:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SetAutomaticDownloadKindsOperation;
  v4 = -[SetAutomaticDownloadKindsOperation init](&v6, "init");
  if (v4) {
    v4->_downloadKinds = (NSSet *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SetAutomaticDownloadKindsOperation;
  -[SetAutomaticDownloadKindsOperation dealloc](&v3, "dealloc");
}

- (SSAuthenticationContext)authenticationContext
{
  objc_super v3 = (SSAuthenticationContext *)-[SSAuthenticationContext copy](self->_authenticationContext, "copy");
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
  return v3;
}

- (NSString)clientIdentifierHeader
{
  objc_super v3 = self->_clientIdentifierHeader;
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
  return v3;
}

- (NSSet)downloadKinds
{
  return self->_downloadKinds;
}

- (NSSet)previousDownloadKinds
{
  objc_super v3 = (NSSet *)-[NSSet copy](self->_previousDownloadKinds, "copy");
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
  return v3;
}

- (BOOL)runsOnlyIfKindsAreDirty
{
  BOOL runsOnlyIfKindsAreDirty = self->_runsOnlyIfKindsAreDirty;
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
  return runsOnlyIfKindsAreDirty;
}

- (void)setAuthenticationContext:(id)a3
{
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
  }

  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
}

- (void)setClientIdentifierHeader:(id)a3
{
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)a3;
  }

  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
}

- (void)setPreviousDownloadKinds:(id)a3
{
  previousDownloadKinds = self->_previousDownloadKinds;
  if (previousDownloadKinds != a3)
  {

    self->_previousDownloadKinds = (NSSet *)[a3 copy];
  }

  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
}

- (void)setRunsOnlyIfKindsAreDirty:(BOOL)a3
{
  self->_BOOL runsOnlyIfKindsAreDirty = a3;
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
}

- (void)setShouldSuppressServerDialogs:(BOOL)a3
{
  self->_shouldSuppressServerDialogs = a3;
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
}

- (BOOL)shouldSuppressServerDialogs
{
  BOOL shouldSuppressServerDialogs = self->_shouldSuppressServerDialogs;
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
  return shouldSuppressServerDialogs;
}

- (void)run
{
  if (-[SetAutomaticDownloadKindsOperation runsOnlyIfKindsAreDirty](self, "runsOnlyIfKindsAreDirty")
    && !CFPreferencesGetAppBooleanValue(@"DirtyAutoDownloadKinds", kITunesStoreDaemonDefaultsID, 0LL))
  {
    id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v4 = [v3 shouldLog];
    else {
      LODWORD(v5) = v4;
    }
    objc_super v6 = (os_log_s *)[v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      uint64_t v5 = v5;
    }
    else {
      v5 &= 2u;
    }
    if ((_DWORD)v5)
    {
      int v11 = 138412290;
      uint64_t v12 = objc_opt_class(self);
      uint64_t v7 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Skipping since kinds are no longer dirty",  &v11,  12);
      if (v7)
      {
        v8 = (void *)v7;
        v9 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v7, 4LL);
        free(v8);
        v10 = v9;
        SSFileLog(v3, @"%@");
      }
    }

    -[SetAutomaticDownloadKindsOperation setSuccess:](self, "setSuccess:", 1LL, v10);
  }

  else
  {
    -[SetAutomaticDownloadKindsOperation _run](self, "_run");
  }

- (id)uniqueKey
{
  return @"SetAutomaticDownloadKindsOperation";
}

- (id)_copyFilteredDownloadKinds
{
  id v3 = -[NSSet mutableCopy](self->_downloadKinds, "mutableCopy");
  unsigned int v4 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL);
  -[SetAutomaticDownloadKindsOperation lock](self, "lock");
  -[SSURLBagContext setUserIdentifier:]( v4,  "setUserIdentifier:",  -[SSAuthenticationContext requiredUniqueIdentifier](self->_authenticationContext, "requiredUniqueIdentifier"));
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
  if (-[SetAutomaticDownloadKindsOperation loadURLBagWithContext:returningError:]( self,  "loadURLBagWithContext:returningError:",  v4,  0LL))
  {
    id v5 = +[ISURLBag copyAllowedAutomaticDownloadKindsInBagContext:]( &OBJC_CLASS___ISURLBag,  "copyAllowedAutomaticDownloadKindsInBagContext:",  v4);
    [v3 intersectSet:v5];
  }

  id v6 = -[NSSet count](self->_downloadKinds, "count");
  if (v6 != [v3 count])
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      uint64_t v11 = objc_opt_class(self);
      downloadKinds = self->_downloadKinds;
      int v18 = 138412802;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      v21 = downloadKinds;
      __int16 v22 = 2112;
      id v23 = v3;
      uint64_t v13 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Filtered download kinds: %@ => %@",  &v18,  32);
      if (v13)
      {
        v14 = (void *)v13;
        v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        v17 = v15;
        SSFileLog(v7, @"%@");
      }
    }

    objc_msgSend( +[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v17),  "commitAutomaticDownloadKinds:markAsDirty:",  v3,  1);
  }

  return v3;
}

- (BOOL)_isFatalError:(id)a3
{
  return SSErrorIsNetworkError(a3, a2) ^ 1;
}

- (BOOL)_postDownloadKinds:(id)a3 error:(id *)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v7 setUseUserSpecificURLBag:1];
  unsigned int v8 = -[SetAutomaticDownloadKindsOperation shouldSuppressServerDialogs](self, "shouldSuppressServerDialogs");
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  uint64_t v10 = v8 ^ 1;
  -[DaemonProtocolDataProvider setShouldProcessAuthenticationDialogs:]( v9,  "setShouldProcessAuthenticationDialogs:",  v10);
  -[DaemonProtocolDataProvider setShouldProcessDialogs:](v9, "setShouldProcessDialogs:", v10);
  [v7 setDataProvider:v9];
  -[SetAutomaticDownloadKindsOperation lock](self, "lock");
  [v7 setAuthenticationContext:self->_authenticationContext];
  -[SetAutomaticDownloadKindsOperation unlock](self, "unlock");
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setClientIdentifier:]( v11,  "setClientIdentifier:",  -[SetAutomaticDownloadKindsOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  if (objc_msgSend( +[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"),  "isMultiUser")) {
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  @"true",  SSHTTPHeaderXAppleMMeMultiUser);
  }
  -[SSMutableURLRequestProperties setHTTPMethod:](v11, "setHTTPMethod:", @"POST");
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v13 = -[ISDevice guid](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "guid");
  if (v13) {
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, @"guid");
  }
  if (a3) {
    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  [a3 allObjects],  @"media-types");
  }
  -[SSMutableURLRequestProperties setRequestParameters:](v11, "setRequestParameters:", v12);

  -[SSMutableURLRequestProperties setURLBagURLBlock:](v11, "setURLBagURLBlock:", &stru_10034C9C0);
  [v7 setRequestProperties:v11];
  id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v14) {
    id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v15 = [v14 shouldLog];
  else {
    LODWORD(v16) = v15;
  }
  v17 = (os_log_s *)[v14 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    uint64_t v16 = v16;
  }
  else {
    v16 &= 2u;
  }
  if ((_DWORD)v16)
  {
    int v34 = 138412546;
    uint64_t v35 = objc_opt_class(self);
    __int16 v36 = 2112;
    id v37 = a3;
    uint64_t v18 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "%@: Setting automatic download kinds: %@",  &v34,  22);
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      __int16 v20 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v18, 4LL);
      free(v19);
      v31 = v20;
      SSFileLog(v14, @"%@");
    }
  }

  v33 = 0LL;
  if (-[SetAutomaticDownloadKindsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v33,  v31))
  {
    id v21 = objc_msgSend(-[DaemonProtocolDataProvider output](v9, "output"), "objectForKey:", @"status");
    if ((objc_opt_respondsToSelector(v21, "intValue") & 1) != 0 && ![v21 intValue])
    {
      BOOL v29 = 1;
    }

    else
    {
      id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v22) {
        id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v23 = [v22 shouldLog];
      else {
        LODWORD(v24) = v23;
      }
      v25 = (os_log_s *)[v22 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v24 = v24;
      }
      else {
        v24 &= 2u;
      }
      if ((_DWORD)v24)
      {
        uint64_t v26 = objc_opt_class(self);
        int v34 = 138412546;
        uint64_t v35 = v26;
        __int16 v36 = 2112;
        id v37 = v21;
        LODWORD(v32) = 22;
        uint64_t v27 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%@: Received invalid status: %@",  &v34,  v32);
        if (v27)
        {
          v28 = (void *)v27;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v27, 4LL);
          free(v28);
          SSFileLog(v22, @"%@");
        }
      }

      BOOL v29 = 0;
      v33 = (void *)ISError(2LL, 0LL, 0LL);
    }
  }

  else
  {
    BOOL v29 = 0;
  }

  if (a4) {
    *a4 = v33;
  }
  return v29;
}

- (void)_run
{
  uint64_t v17 = 0LL;
  id v3 = -[SetAutomaticDownloadKindsOperation _copyFilteredDownloadKinds](self, "_copyFilteredDownloadKinds");
  BOOL v4 = -[SetAutomaticDownloadKindsOperation _postDownloadKinds:error:](self, "_postDownloadKinds:error:", v3, &v17);
  if (v4)
  {
    id v5 = (const __CFString *)kITunesStoreDaemonDefaultsID;
    CFPreferencesSetAppValue(@"DirtyAutoDownloadKinds", kCFBooleanFalse, kITunesStoreDaemonDefaultsID);
    CFPreferencesAppSynchronize(v5);
  }

  else if (-[SetAutomaticDownloadKindsOperation _isFatalError:](self, "_isFatalError:", v17))
  {
    id v6 = -[SetAutomaticDownloadKindsOperation previousDownloadKinds](self, "previousDownloadKinds");
    if (v6)
    {
      id v7 = v6;
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
        int v18 = 138412546;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        uint64_t v21 = v17;
        uint64_t v13 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Rolling back automatic download kinds after fatal error: %@",  &v18,  22);
        if (v13)
        {
          id v14 = (void *)v13;
          unsigned int v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
          free(v14);
          uint64_t v16 = v15;
          SSFileLog(v8, @"%@");
        }
      }

      objc_msgSend( +[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v16),  "commitAutomaticDownloadKinds:markAsDirty:",  v7,  0);
    }
  }

  -[SetAutomaticDownloadKindsOperation setSuccess:](self, "setSuccess:", v4);
  -[SetAutomaticDownloadKindsOperation setError:](self, "setError:", v17);
}

@end