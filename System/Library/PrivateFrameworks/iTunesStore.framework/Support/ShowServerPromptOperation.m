@interface ShowServerPromptOperation
- (BOOL)_automaticDownloadsPromptNeedsDisplay;
- (BOOL)_promptNeedsDisplay;
- (NSString)promptIdentifier;
- (ShowServerPromptOperation)init;
- (ShowServerPromptOperation)initWithPromptIdentifier:(id)a3;
- (id)_newStoreURLOperation:(id *)a3;
- (void)dealloc;
- (void)run;
@end

@implementation ShowServerPromptOperation

- (ShowServerPromptOperation)init
{
  return -[ShowServerPromptOperation initWithPromptIdentifier:](self, "initWithPromptIdentifier:", 0LL);
}

- (ShowServerPromptOperation)initWithPromptIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ShowServerPromptOperation;
  v4 = -[ShowServerPromptOperation init](&v6, "init");
  if (v4) {
    v4->_promptIdentifier = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ShowServerPromptOperation;
  -[ShowServerPromptOperation dealloc](&v3, "dealloc");
}

- (NSString)promptIdentifier
{
  return self->_promptIdentifier;
}

- (void)run
{
  if (-[ShowServerPromptOperation _promptNeedsDisplay](self, "_promptNeedsDisplay"))
  {
    uint64_t v33 = 0LL;
    id v3 = -[ShowServerPromptOperation _newStoreURLOperation:](self, "_newStoreURLOperation:", &v33);
    id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    id v5 = v4;
    if (v3)
    {
      if (!v4) {
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
        uint64_t v9 = objc_opt_class(self);
        promptIdentifier = self->_promptIdentifier;
        int v34 = 138412546;
        uint64_t v35 = v9;
        __int16 v36 = 2112;
        v37 = promptIdentifier;
        uint64_t v11 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Showing prompt for prompt identifier: %@",  &v34,  22);
        if (v11)
        {
          v12 = (void *)v11;
          v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
          free(v12);
          v32 = v13;
          SSFileLog(v5, @"%@");
        }
      }

      id v14 = -[ShowServerPromptOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  &v33,  v32);
      if ((_DWORD)v14) {
        +[SSDevice setPromptWithIdentifier:needsDisplay:]( &OBJC_CLASS___SSDevice,  "setPromptWithIdentifier:needsDisplay:",  self->_promptIdentifier,  0LL);
      }
      else {
        +[SSDevice setLastPromptAttemptDate:forPromptWithIdentifier:]( &OBJC_CLASS___SSDevice,  "setLastPromptAttemptDate:forPromptWithIdentifier:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  self->_promptIdentifier);
      }
      CFPreferencesAppSynchronize(kSSUserDefaultsIdentifier);
    }

    else
    {
      if (!v4) {
        id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v24 = [v5 shouldLog];
      else {
        LODWORD(v25) = v24;
      }
      v26 = (os_log_s *)[v5 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v25 = v25;
      }
      else {
        v25 &= 2u;
      }
      if ((_DWORD)v25)
      {
        uint64_t v27 = objc_opt_class(self);
        v28 = self->_promptIdentifier;
        int v34 = 138412546;
        uint64_t v35 = v27;
        __int16 v36 = 2112;
        v37 = v28;
        uint64_t v29 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: No operation for prompt identifier: %@",  &v34,  22);
        if (v29)
        {
          v30 = (void *)v29;
          v31 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v29, 4LL);
          free(v30);
          v32 = v31;
          SSFileLog(v5, @"%@");
        }
      }

      id v14 = 0LL;
    }

    -[ShowServerPromptOperation setError:](self, "setError:", v33, v32);
    -[ShowServerPromptOperation setSuccess:](self, "setSuccess:", v14);
  }

  else
  {
    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v16 = [v15 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    v18 = (os_log_s *)[v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      uint64_t v19 = objc_opt_class(self);
      v20 = self->_promptIdentifier;
      int v34 = 138412546;
      uint64_t v35 = v19;
      __int16 v36 = 2112;
      v37 = v20;
      uint64_t v21 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "%@: Prompt does not need display: %@",  &v34,  22);
      if (v21)
      {
        v22 = (void *)v21;
        v23 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
        free(v22);
        v32 = v23;
        SSFileLog(v15, @"%@");
      }
    }

    -[ShowServerPromptOperation setSuccess:](self, "setSuccess:", 1LL, v32);
    +[SSDevice setLastPromptAttemptDate:forPromptWithIdentifier:]( &OBJC_CLASS___SSDevice,  "setLastPromptAttemptDate:forPromptWithIdentifier:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  self->_promptIdentifier);
    CFPreferencesAppSynchronize(kSSUserDefaultsIdentifier);
  }

- (BOOL)_automaticDownloadsPromptNeedsDisplay
{
  id v2 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  unsigned int v3 = [v2 isManagedAppleID] ^ 1;
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (id)_newStoreURLOperation:(id *)a3
{
  if (!-[NSString isEqualToString:]( self->_promptIdentifier,  "isEqualToString:",  SSDevicePromptIdentifierAutomaticDownloadsAvailable)) {
    return 0LL;
  }
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  objc_msgSend( v3,  "setDataProvider:",  +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v3 setUseUserSpecificURLBag:1];
  id v4 = -[SSAuthenticationContext initWithAccount:]( [SSAuthenticationContext alloc],  "initWithAccount:",  objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"));
  [v3 setAuthenticationContext:v4];

  id v5 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setURLBagURLBlock:](v5, "setURLBagURLBlock:", &stru_10034C9E0);
  -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v5,  "setValue:forRequestParameter:",  -[ISDevice guid](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "guid"),  @"guid");
  [v3 setRequestProperties:v5];

  return v3;
}

- (BOOL)_promptNeedsDisplay
{
  if (+[SSDevice promptNeedsDisplay:]( &OBJC_CLASS___SSDevice,  "promptNeedsDisplay:",  self->_promptIdentifier)
    && -[NSString isEqualToString:]( self->_promptIdentifier,  "isEqualToString:",  SSDevicePromptIdentifierAutomaticDownloadsAvailable))
  {
    return -[ShowServerPromptOperation _automaticDownloadsPromptNeedsDisplay]( self,  "_automaticDownloadsPromptNeedsDisplay");
  }

  else
  {
    return 0;
  }

@end