@interface AuthorizeMachineOperation
- (AuthorizeMachineOperation)initWithAuthorizationRequest:(id)a3;
- (BOOL)_handleResponse:(id)a3 error:(id *)a4;
- (BOOL)_runAuthentication:(id *)a3;
- (BOOL)_runAuthorizationWithAuthentication:(BOOL)a3 error:(id *)a4;
- (BOOL)allowSilentAuthentication;
- (BOOL)shouldAddKeysToKeyBag;
- (BOOL)shouldPromptForCredentials;
- (NSNumber)accountIdentifier;
- (NSNumber)familyMemberAccountIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)keybagPath;
- (NSString)reason;
- (NSString)userAgent;
- (SSURLConnectionResponse)response;
- (id)_accountIdentifier;
- (id)_newAuthenticationContext;
- (id)_newBodyDictionary;
- (id)_newMachineDataOperationWithResponse:(id)a3;
- (id)_newURLOperation;
- (id)authorizationToken;
- (void)_run;
- (void)_setResponse:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setAllowSilentAuthentication:(BOOL)a3;
- (void)setAuthorizationToken:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setFamilyMemberAccountIdentifier:(id)a3;
- (void)setKeybagPath:(id)a3;
- (void)setReason:(id)a3;
- (void)setShouldAddKeysToKeyBag:(BOOL)a3;
- (void)setShouldPromptForCredentials:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation AuthorizeMachineOperation

- (AuthorizeMachineOperation)initWithAuthorizationRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AuthorizeMachineOperation;
  v4 = -[AuthorizeMachineOperation init](&v6, "init");
  if (v4)
  {
    v4->_accountIdentifier = (NSNumber *)[a3 accountIdentifier];
    v4->_allowSilentAuthentication = [a3 allowSilentAuthentication];
    if ([a3 familyAccountIdentifier]) {
      v4->_familyMemberAccountIdentifier = (NSNumber *)[a3 familyAccountIdentifier];
    }
    v4->_keybagPath = (NSString *)[a3 keybagPath];
    v4->_token = [a3 authorizationToken];
    v4->_reason = (NSString *)[a3 reason];
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AuthorizeMachineOperation;
  -[AuthorizeMachineOperation dealloc](&v3, "dealloc");
}

- (NSNumber)accountIdentifier
{
  objc_super v3 = self->_accountIdentifier;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (BOOL)allowSilentAuthentication
{
  BOOL allowSilentAuthentication = self->_allowSilentAuthentication;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return allowSilentAuthentication;
}

- (id)authorizationToken
{
  id v3 = self->_token;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (NSString)clientIdentifierHeader
{
  id v3 = self->_clientIdentifierHeader;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (NSNumber)familyMemberAccountIdentifier
{
  id v3 = self->_familyMemberAccountIdentifier;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (NSString)keybagPath
{
  id v3 = (NSString *)-[NSString copy](self->_keybagPath, "copy");
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (NSString)reason
{
  id v3 = self->_reason;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (SSURLConnectionResponse)response
{
  id v3 = self->_response;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (void)setAccountIdentifier:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier != a3)
  {

    self->_accountIdentifier = (NSNumber *)[a3 copy];
  }

  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setAllowSilentAuthentication:(BOOL)a3
{
  BOOL v3 = a3;
  -[AuthorizeMachineOperation lock](self, "lock");
  if (self->_allowSilentAuthentication != v3) {
    self->_BOOL allowSilentAuthentication = v3;
  }
  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setAuthorizationToken:(id)a3
{
  id token = self->_token;
  if (token != a3)
  {

    self->_id token = a3;
  }

  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setClientIdentifierHeader:(id)a3
{
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setFamilyMemberAccountIdentifier:(id)a3
{
  familyMemberAccountIdentifier = self->_familyMemberAccountIdentifier;
  if (familyMemberAccountIdentifier != a3)
  {

    self->_familyMemberAccountIdentifier = (NSNumber *)[a3 copy];
  }

  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setKeybagPath:(id)a3
{
  keybagPath = self->_keybagPath;
  if (keybagPath != a3)
  {

    self->_keybagPath = (NSString *)[a3 copy];
  }

  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setReason:(id)a3
{
  reason = self->_reason;
  if (reason != a3)
  {

    self->_reason = (NSString *)[a3 copy];
  }

  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setShouldAddKeysToKeyBag:(BOOL)a3
{
  self->_shouldAddKeysToKeyBag = a3;
  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setShouldPromptForCredentials:(BOOL)a3
{
  self->_shouldPromptForCredentials = a3;
  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (void)setUserAgent:(id)a3
{
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  -[AuthorizeMachineOperation unlock](self, "unlock");
}

- (BOOL)shouldAddKeysToKeyBag
{
  BOOL shouldAddKeysToKeyBag = self->_shouldAddKeysToKeyBag;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return shouldAddKeysToKeyBag;
}

- (BOOL)shouldPromptForCredentials
{
  BOOL shouldPromptForCredentials = self->_shouldPromptForCredentials;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return shouldPromptForCredentials;
}

- (NSString)userAgent
{
  BOOL v3 = self->_userAgent;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
}

- (id)_accountIdentifier
{
  BOOL v3 = self->_accountIdentifier;
  -[AuthorizeMachineOperation unlock](self, "unlock");
  return v3;
}

- (BOOL)_handleResponse:(id)a3 error:(id *)a4
{
  id v7 = [a3 objectForKey:@"failureType"];
  v8 = v7;
  if (!v7)
  {
    if (-[AuthorizeMachineOperation shouldAddKeysToKeyBag](self, "shouldAddKeysToKeyBag"))
    {
      id v10 = [a3 objectForKey:@"keybag"];
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        id v12 = [v10 length];
        if (!v12) {
          goto LABEL_20;
        }
        id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v13) {
          id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v14 = [v13 shouldLog];
        else {
          LODWORD(v15) = v14;
        }
        v16 = (os_log_s *)[v13 OSLogObject];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
          uint64_t v15 = v15;
        }
        else {
          v15 &= 2u;
        }
        if ((_DWORD)v15)
        {
          int v20 = 138412546;
          uint64_t v21 = objc_opt_class(self);
          __int16 v22 = 2048;
          id v23 = [v10 length];
          uint64_t v17 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Importing %lu keybag bytes",  &v20,  22);
          if (v17)
          {
            v18 = (void *)v17;
            +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
            free(v18);
            SSFileLog(v13, @"%@");
          }
        }

        sub_100023280(v10);
      }
    }

    id v12 = 0LL;
LABEL_20:
    if (!a4) {
      return v8 == 0LL;
    }
LABEL_21:
    *a4 = v12;
    return v8 == 0LL;
  }

  else {
    id v9 = 0LL;
  }
  id v12 = (id)SSError(SSServerErrorDomain, v9, 0LL, 0LL);
  if (a4) {
    goto LABEL_21;
  }
  return v8 == 0LL;
}

- (id)_newAuthenticationContext
{
  BOOL v3 = -[AuthorizeMachineOperation accountIdentifier](self, "accountIdentifier");
  v4 = objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext);
  if (v3) {
    v5 = -[SSMutableAuthenticationContext initWithAccountIdentifier:](v4, "initWithAccountIdentifier:", v3);
  }
  else {
    v5 = -[SSMutableAuthenticationContext initWithAccount:]( v4,  "initWithAccount:",  objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"));
  }
  objc_super v6 = v5;
  -[SSMutableAuthenticationContext setAllowsSilentAuthentication:]( v5,  "setAllowsSilentAuthentication:",  -[AuthorizeMachineOperation allowSilentAuthentication](self, "allowSilentAuthentication"));
  -[SSMutableAuthenticationContext setClientIdentifierHeader:]( v6,  "setClientIdentifierHeader:",  -[AuthorizeMachineOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  id v7 = -[AuthorizeMachineOperation userAgent](self, "userAgent");
  -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:]( v6,  "setValue:forHTTPHeaderField:",  v7,  SSHTTPHeaderUserAgent);
  if (-[SpringBoardUtility isScreenLocked]( +[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"),  "isScreenLocked"))
  {
    -[SSMutableAuthenticationContext setPromptStyle:](v6, "setPromptStyle:", 1000LL);
  }

  return v6;
}

- (id)_newBodyDictionary
{
  BOOL v3 = -[AuthorizeMachineOperation reason](self, "reason");
  id v4 = -[AuthorizeMachineOperation _accountIdentifier](self, "_accountIdentifier");
  if (!v4) {
    goto LABEL_40;
  }
  v5 = v4;
  uint64_t v6 = -[NSString isEqualToString:](v3, "isEqualToString:", @"refetch") ? 8LL : 1LL;
  id v7 = -[AuthorizeMachineOperation keybagPath](self, "keybagPath");
  id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v9 = v8;
  if (v7)
  {
    if (!v8) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    id v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v40 = 138412802;
      uint64_t v41 = objc_opt_class(self);
      __int16 v42 = 2112;
      v43 = v5;
      __int16 v44 = 2112;
      v45 = v7;
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Getting kbsync for account: %@ path: %@",  &v40,  32);
      if (v13)
      {
        unsigned int v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        v38 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    CFDataRef v16 = sub_100022430((uint64_t)objc_msgSend(v5, "unsignedLongLongValue", v38), v6, v7);
  }

  else
  {
    if (!v8) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v17 = [v9 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    v19 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      int v40 = 138412546;
      uint64_t v41 = objc_opt_class(self);
      __int16 v42 = 2112;
      v43 = v5;
      uint64_t v20 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: Getting kbsync data for account: %@",  &v40,  22);
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        __int16 v22 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v20, 4LL);
        free(v21);
        v38 = v22;
        SSFileLog(v9, @"%@");
      }
    }

    CFDataRef v16 = sub_100022204((uint64_t)objc_msgSend(v5, "unsignedLongLongValue", v38), v6);
  }

  CFDataRef v23 = v16;
  if (v16)
  {
    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v25 = v24;
    id token = self->_token;
    if (token) {
      -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", token, @"token");
    }
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v23, @"kbsync");
    v27 = +[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance");
    id v28 = objc_msgSend(-[ISDevice guid](v27, "guid"), "uppercaseString");
    if (v28) {
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v28, @"guid");
    }
    id v29 = -[ISDevice deviceName](v27, "deviceName");
    if (v29) {
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v29, @"machineName");
    }
    if (v3) {
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v3, @"reason");
    }
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v5, @"ownerDsid");
  }

  else
  {
LABEL_40:
    id v30 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v30) {
      id v30 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v31 = [v30 shouldLog];
    else {
      LODWORD(v32) = v31;
    }
    v33 = (os_log_s *)[v30 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v32 = v32;
    }
    else {
      v32 &= 2u;
    }
    if ((_DWORD)v32)
    {
      uint64_t v34 = objc_opt_class(self);
      int v40 = 138412290;
      uint64_t v41 = v34;
      LODWORD(v39) = 12;
      uint64_t v35 = _os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "%@: Failing authorization: could not get kbsync",  &v40,  v39);
      if (v35)
      {
        v36 = (void *)v35;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v35, 4LL);
        free(v36);
        SSFileLog(v30, @"%@");
      }
    }

    CFDataRef v23 = 0LL;
    v25 = 0LL;
  }

  return v25;
}

- (id)_newMachineDataOperationWithResponse:(id)a3
{
  id v4 = [[SSMachineDataRequest alloc] initWithURLResponse:a3];
  if (!v4) {
    return 0LL;
  }
  v5 = v4;
  objc_msgSend(v4, "setAccountIdentifier:", -[AuthorizeMachineOperation accountIdentifier](self, "accountIdentifier"));
  id v6 = [[ISMachineDataActionOperation alloc] initWithMachineDataRequest:v5];
  objc_msgSend(v6, "setUserAgent:", -[AuthorizeMachineOperation userAgent](self, "userAgent"));

  return v6;
}

- (id)_newURLOperation
{
  id v3 = -[AuthorizeMachineOperation _newBodyDictionary](self, "_newBodyDictionary");
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  v5 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  100LL,  0LL,  0LL);
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    objc_msgSend( v7,  "setDataProvider:",  +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
    [v7 setMachineDataStyle:0];
    [v7 setUseUserSpecificURLBag:1];
    id v8 = -[AuthorizeMachineOperation _newAuthenticationContext](self, "_newAuthenticationContext");
    [v7 setAuthenticationContext:v8];

    id v9 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    -[SSMutableURLRequestProperties setAllowedRetryCount:](v9, "setAllowedRetryCount:", 0LL);
    -[SSMutableURLRequestProperties setClientIdentifier:]( v9,  "setClientIdentifier:",  -[AuthorizeMachineOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
    -[SSMutableURLRequestProperties setHTTPBody:](v9, "setHTTPBody:", v6);
    -[SSMutableURLRequestProperties setHTTPMethod:](v9, "setHTTPMethod:", @"POST");
    -[SSMutableURLRequestProperties setURLBagKey:](v9, "setURLBagKey:", @"authorizeMachine");
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v9,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
    unsigned int v10 = -[AuthorizeMachineOperation userAgent](self, "userAgent");
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v9,  "setValue:forHTTPHeaderField:",  v10,  SSHTTPHeaderUserAgent);
    -[AuthorizeMachineOperation lock](self, "lock");
    familyMemberAccountIdentifier = self->_familyMemberAccountIdentifier;
    if (familyMemberAccountIdentifier) {
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v9,  "setValue:forHTTPHeaderField:",  -[NSNumber stringValue](familyMemberAccountIdentifier, "stringValue"),  @"X-FM-Dsid");
    }
    mdSyncState = self->_mdSyncState;
    if (mdSyncState) {
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v9,  "setValue:forHTTPHeaderField:",  mdSyncState,  SSHTTPHeaderXAppleMDS);
    }
    -[AuthorizeMachineOperation unlock](self, "unlock");
    if (-[NSString isEqualToString:]( -[AuthorizeMachineOperation reason](self, "reason"),  "isEqualToString:",  @"refetch"))
    {
      -[SSMutableURLRequestProperties setTimeoutInterval:](v9, "setTimeoutInterval:", 15.0);
    }

    MachineDataAddHeadersToRequestProperties( v9,  -[AuthorizeMachineOperation accountIdentifier](self, "accountIdentifier"));
    [v7 setRequestProperties:v9];
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_run
{
  uint64_t v35 = 0LL;
  id v3 = -[AuthorizeMachineOperation accountIdentifier](self, "accountIdentifier");
  if (v3)
  {
    id v4 = v3;
    char v34 = 0;
    v5 = (const __CFData *)-[AuthorizeMachineOperation authorizationToken](self, "authorizationToken");
    if (v5)
    {
      CFDataRef v6 = v5;
LABEL_4:
      BOOL v7 = 0LL;
      goto LABEL_5;
    }

    v33 = 0LL;
    CFDataRef v6 = sub_100022D98(-[NSNumber longLongValue](v4, "longLongValue"), &v34, &v33);
    if (v6)
    {
      -[AuthorizeMachineOperation setAuthorizationToken:](self, "setAuthorizationToken:", v6);
      if (!v34) {
        goto LABEL_4;
      }
    }

    else
    {
      char v34 = 1;
    }

    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v16 = [v15 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    uint64_t v18 = (os_log_s *)[v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      uint64_t v19 = objc_opt_class(self);
      int v36 = 138412802;
      uint64_t v37 = v19;
      __int16 v38 = 2112;
      uint64_t v39 = v4;
      __int16 v40 = 2112;
      uint64_t v41 = v33;
      uint64_t v20 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Needs authentication for account: %@ token error: %@",  &v36,  32);
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        __int16 v22 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v20, 4LL);
        free(v21);
        unsigned int v31 = v22;
        SSFileLog(v15, @"%@");
      }
    }

    if (!-[AuthorizeMachineOperation shouldPromptForCredentials](self, "shouldPromptForCredentials", v31))
    {
      id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v23) {
        id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v24 = [v23 shouldLog];
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
        int v36 = 138412546;
        uint64_t v37 = v27;
        __int16 v38 = 2112;
        uint64_t v39 = v4;
        LODWORD(v32) = 22;
        uint64_t v28 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: Failing silent request needing authentication for account: %@",  &v36,  v32);
        if (v28)
        {
          id v29 = (void *)v28;
          id v30 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v28, 4LL);
          free(v29);
          unsigned int v31 = v30;
          SSFileLog(v23, @"%@");
        }
      }

      uint64_t v8 = 0LL;
      uint64_t v35 = v33;
      goto LABEL_6;
    }

    if (!-[AuthorizeMachineOperation _runAuthentication:](self, "_runAuthentication:", &v35))
    {
      uint64_t v8 = 0LL;
      goto LABEL_6;
    }

    BOOL v7 = v34 != 0;
LABEL_5:
    uint64_t v8 = -[AuthorizeMachineOperation _runAuthorizationWithAuthentication:error:]( self,  "_runAuthorizationWithAuthentication:error:",  v7,  &v35);
LABEL_6:

    id v9 = v35;
    goto LABEL_23;
  }

  id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  uint64_t v13 = (os_log_s *)[v10 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if ((_DWORD)v12)
  {
    int v36 = 138412290;
    uint64_t v37 = objc_opt_class(self);
    uint64_t v8 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Missing account for authorize",  &v36,  12);
    if (!v8)
    {
      id v9 = 0LL;
      goto LABEL_23;
    }

    unsigned int v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v8, 4LL);
    free((void *)v8);
    unsigned int v31 = v14;
    SSFileLog(v10, @"%@");
  }

  id v9 = 0LL;
  uint64_t v8 = 0LL;
LABEL_23:
  -[AuthorizeMachineOperation setError:](self, "setError:", v9, v31);
  -[AuthorizeMachineOperation setSuccess:](self, "setSuccess:", v8);
}

- (BOOL)_runAuthentication:(id *)a3
{
  id v5 = +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig");
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  uint64_t v8 = (os_log_s *)[v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    int v18 = 138543362;
    uint64_t v19 = objc_opt_class(self);
    uint64_t v9 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%{public}@: Performing authentication.",  &v18,  12);
    if (v9)
    {
      id v10 = (void *)v9;
      unsigned int v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
      free(v10);
      uint64_t v17 = v11;
      SSFileLog(v5, @"%@");
    }
  }

  id v12 = -[AuthorizeMachineOperation _newAuthenticationContext](self, "_newAuthenticationContext", v17);
  id v13 = [[SSAuthenticateRequest alloc] initWithAuthenticationContext:v12];
  id v14 = [v13 run];
  id v15 = [v14 error];
  if (!v15) {
    -[AuthorizeMachineOperation setAccountIdentifier:]( self,  "setAccountIdentifier:",  objc_msgSend(objc_msgSend(v14, "authenticatedAccount"), "uniqueIdentifier"));
  }

  if (a3 && v15) {
    *a3 = 0LL;
  }
  return v15 == 0LL;
}

- (BOOL)_runAuthorizationWithAuthentication:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v37 = 0LL;
  uint64_t v35 = SSErrorDomain;
  while (1)
  {
    id v6 = -[AuthorizeMachineOperation _newURLOperation](self, "_newURLOperation");
    if (!v6)
    {
      LOBYTE(self) = 0;
      uint64_t v37 = SSError(v35, 600LL, 0LL, 0LL);
      goto LABEL_27;
    }

    uint64_t v7 = v6;
    [v6 setNeedsAuthentication:v4];
    id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v9) = [v8 shouldLog];
    id v10 = (os_log_s *)[v8 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      uint64_t v11 = objc_opt_class(self);
      id token = self->_token;
      int v38 = 138412802;
      uint64_t v39 = v11;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)token;
      __int16 v42 = 1024;
      BOOL v43 = v4;
      LODWORD(v34) = 28;
      uint64_t v13 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Authorizing with token: %@, authentication: %d",  &v38,  v34,  v35);
      if (v13)
      {
        id v14 = (void *)v13;
        id v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        v33 = v15;
        SSFileLog(v8, @"%@");
      }
    }

    if (!-[AuthorizeMachineOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v37,  v33)) {
      goto LABEL_40;
    }
    id v16 = objc_msgSend(objc_msgSend(v7, "dataProvider"), "output");
    if (-[AuthorizeMachineOperation _handleResponse:error:](self, "_handleResponse:error:", v16, &v37)) {
      break;
    }
    id v17 = -[AuthorizeMachineOperation _newMachineDataOperationWithResponse:]( self,  "_newMachineDataOperationWithResponse:",  [v7 response]);
    if (!v17) {
      goto LABEL_40;
    }
    int v18 = v17;
    unsigned __int8 v19 = -[AuthorizeMachineOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v17,  0LL);
    id v20 = [v18 syncState];
    -[AuthorizeMachineOperation lock](self, "lock");
    int64_t mdRetryCount = self->_mdRetryCount;
    self->_int64_t mdRetryCount = mdRetryCount + 1;

    self->_mdSyncState = (NSString *)[v20 copy];
    -[AuthorizeMachineOperation unlock](self, "unlock");
    if (mdRetryCount > 0)
    {

LABEL_26:
      LOBYTE(self) = 0;
LABEL_27:
      uint64_t v25 = a4;
      if (!a4) {
        return (char)self;
      }
      goto LABEL_43;
    }

    if (v20) {
      char v22 = 1;
    }
    else {
      char v22 = v19;
    }

    if ((v22 & 1) == 0) {
      goto LABEL_26;
    }
  }

  id v23 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v16,  100LL,  0LL,  &v37);
  if (v23)
  {
    unsigned int v24 = -[SSURLConnectionResponse initWithURLResponse:bodyData:]( [SSURLConnectionResponse alloc],  "initWithURLResponse:bodyData:",  [v7 response],  v23);
    -[AuthorizeMachineOperation _setResponse:](self, "_setResponse:", v24);

    LOBYTE(self) = 1;
    goto LABEL_41;
  }

  id v26 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v26) {
    id v26 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v27 = [v26 shouldLog];
  else {
    unsigned int v28 = v27;
  }
  id v29 = (os_log_s *)[v26 OSLogObject];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v30 = v28;
  }
  else {
    uint64_t v30 = v28 & 2;
  }
  if ((_DWORD)v30)
  {
    uint64_t v31 = objc_opt_class(self);
    int v38 = 138412546;
    uint64_t v39 = v31;
    __int16 v40 = 2112;
    uint64_t v41 = v37;
    LODWORD(v34) = 22;
    self = (AuthorizeMachineOperation *)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "%@: Could not encode plist: %@",  &v38,  v34);
    uint64_t v25 = a4;
    if (self)
    {
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", self, 4LL);
      free(self);
      SSFileLog(v26, @"%@");
      LOBYTE(self) = 0;
    }
  }

  else
  {
LABEL_40:
    LOBYTE(self) = 0;
LABEL_41:
    uint64_t v25 = a4;
  }

  if (!v25) {
    return (char)self;
  }
LABEL_43:
  return (char)self;
}

- (void)_setResponse:(id)a3
{
  response = self->_response;
  if (response != a3)
  {

    self->_response = (SSURLConnectionResponse *)a3;
  }

  -[AuthorizeMachineOperation unlock](self, "unlock");
}

@end