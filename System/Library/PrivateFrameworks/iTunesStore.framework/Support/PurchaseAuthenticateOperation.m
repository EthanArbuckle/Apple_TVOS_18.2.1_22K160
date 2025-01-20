@interface PurchaseAuthenticateOperation
- (NSString)clientIdentifierHeader;
- (PurchaseAuthenticateOperation)initWithPurchases:(id)a3;
- (id)_clientIdentifierForPurchases:(id)a3;
- (id)_userAgentForPurchases:(id)a3;
- (id)authenticationBlock;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationBlock:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
@end

@implementation PurchaseAuthenticateOperation

- (PurchaseAuthenticateOperation)initWithPurchases:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PurchaseAuthenticateOperation;
  v4 = -[PurchaseAuthenticateOperation init](&v11, "init");
  if (v4)
  {
    id v5 = [a3 objectAtIndex:0];
    v6 = -[SSMutableAuthenticationContext initWithAccountIdentifier:]( [SSMutableAuthenticationContext alloc],  "initWithAccountIdentifier:",  [v5 accountIdentifier]);
    v4->_authenticationContext = v6;
    -[SSMutableAuthenticationContext setPromptStyle:](v6, "setPromptStyle:", 1LL);
    -[SSMutableAuthenticationContext setPreferredITunesStoreClient:]( v4->_authenticationContext,  "setPreferredITunesStoreClient:",  -[PurchaseAuthenticateOperation _clientIdentifierForPurchases:](v4, "_clientIdentifierForPurchases:", a3));
    id v7 = -[SSMutableAuthenticationContext HTTPHeaders](v4->_authenticationContext, "HTTPHeaders");
    uint64_t v8 = SSHTTPHeaderUserAgent;
    if (![v7 objectForKey:SSHTTPHeaderUserAgent]) {
      -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:]( v4->_authenticationContext,  "setValue:forHTTPHeaderField:",  -[PurchaseAuthenticateOperation _userAgentForPurchases:](v4, "_userAgentForPurchases:", a3),  v8);
    }
    if ([a3 count] == (id)1 && objc_msgSend(v5, "buyParameters"))
    {
      v9 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v5 buyParameters],  @"product",  0);
      -[SSMutableAuthenticationContext setSignupRequestParameters:]( v4->_authenticationContext,  "setSignupRequestParameters:",  v9);
    }
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PurchaseAuthenticateOperation;
  -[PurchaseAuthenticateOperation dealloc](&v3, "dealloc");
}

- (id)authenticationBlock
{
  id v3 = self->_authenticationBlock;
  -[PurchaseAuthenticateOperation unlock](self, "unlock");
  return v3;
}

- (NSString)clientIdentifierHeader
{
  id v3 = (NSString *)-[SSMutableAuthenticationContext clientIdentifierHeader]( self->_authenticationContext,  "clientIdentifierHeader");
  -[PurchaseAuthenticateOperation unlock](self, "unlock");
  return v3;
}

- (void)setAuthenticationBlock:(id)a3
{
  id authenticationBlock = self->_authenticationBlock;
  if (authenticationBlock != a3)
  {

    self->_id authenticationBlock = [a3 copy];
  }

  -[PurchaseAuthenticateOperation unlock](self, "unlock");
}

- (void)setClientIdentifierHeader:(id)a3
{
}

- (void)run
{
  uint64_t v14 = 0LL;
  id v15 = 0LL;
  id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)[v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    int v16 = 138412290;
    uint64_t v17 = objc_opt_class(self);
    uint64_t v8 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Authenticating for purchase batch",  &v16,  12);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v8, 4LL);
      free(v9);
      v13 = v10;
      *(void *)&double v7 = SSFileLog(v3, @"%@").n128_u64[0];
    }
  }

  id v11 = -[PurchaseAuthenticateOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:]( self,  "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:",  &v15,  0LL,  self->_authenticationContext,  &v14,  v7,  v13);
  v12 = -[PurchaseAuthenticateOperation authenticationBlock](self, "authenticationBlock");
  if (v12) {
    v12[2](v12, v15, v14);
  }
  -[PurchaseAuthenticateOperation setError:](self, "setError:", v14);
  -[PurchaseAuthenticateOperation setSuccess:](self, "setSuccess:", v11);
}

- (id)_clientIdentifierForPurchases:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  v6 = 0LL;
  uint64_t v7 = *(void *)v13;
  uint64_t v8 = SSDownloadPropertyKind;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      v10 = (void *)SSClientIdentifierForDownloadKind([*(id *)(*((void *)&v12 + 1) + 8 * (void)i) valueForDownloadProperty:v8]);
      if (v6)
      {
      }

      else
      {
        v6 = v10;
      }
    }

    id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }

  while (v5);
  return v6;
}

- (id)_userAgentForPurchases:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  v6 = 0LL;
  uint64_t v7 = *(void *)v13;
  uint64_t v8 = SSHTTPHeaderUserAgent;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      id v10 = objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "requestProperties"),  "HTTPHeaders"),  "objectForKey:",  v8);
      if (v6)
      {
      }

      else
      {
        v6 = v10;
      }
    }

    id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }

  while (v5);
  return v6;
}

@end