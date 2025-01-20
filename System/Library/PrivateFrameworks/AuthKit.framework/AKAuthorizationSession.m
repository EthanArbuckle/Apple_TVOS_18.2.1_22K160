@interface AKAuthorizationSession
- (AKAuthorizationUserResponse)userResponse;
- (AKClient)client;
- (AKCredentialRequestContext)context;
- (NSDate)requestTime;
- (NSString)clientBundleID;
- (NSString)sessionID;
- (id)completionHandler;
- (id)description;
- (void)setClient:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setRequestTime:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setUserResponse:(id)a3;
@end

@implementation AKAuthorizationSession

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Authorization Session - <%@: %p context %@, requested by %@, sessionID: %@>",  v5,  self,  self->_context,  self->_clientBundleID,  self->_sessionID));

  return v6;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (AKCredentialRequestContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSDate)requestTime
{
  return self->_requestTime;
}

- (void)setRequestTime:(id)a3
{
}

- (AKAuthorizationUserResponse)userResponse
{
  return self->_userResponse;
}

- (void)setUserResponse:(id)a3
{
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end