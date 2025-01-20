@interface AKDServerUIContext
+ (id)serverUIContextFromResponse:(id)a3 authContext:(id)a4 urlRequest:(id)a5;
- (AKAppleIDAuthenticationContext)authContext;
- (AKAuthenticationServerResponse)initiatingServerResponse;
- (AKServerRequestConfiguration)requestConfiguration;
- (BOOL)shouldPreventDismissAfterUserSkip;
- (void)setAuthContext:(id)a3;
- (void)setInitiatingServerResponse:(id)a3;
- (void)setRequestConfiguration:(id)a3;
- (void)setShouldPreventDismissAfterUserSkip:(BOOL)a3;
@end

@implementation AKDServerUIContext

+ (id)serverUIContextFromResponse:(id)a3 authContext:(id)a4 urlRequest:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setInitiatingServerResponse:v10];

  [v11 setAuthContext:v9];
  v12 = -[AKServerRequestConfiguration initWithRequest:requestType:]( objc_alloc(&OBJC_CLASS___AKServerRequestConfiguration),  "initWithRequest:requestType:",  v8,  0LL);

  [v11 setRequestConfiguration:v12];
  return v11;
}

- (BOOL)shouldPreventDismissAfterUserSkip
{
  return self->_shouldPreventDismissAfterUserSkip;
}

- (void)setShouldPreventDismissAfterUserSkip:(BOOL)a3
{
  self->_shouldPreventDismissAfterUserSkip = a3;
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (AKAuthenticationServerResponse)initiatingServerResponse
{
  return self->_initiatingServerResponse;
}

- (void)setInitiatingServerResponse:(id)a3
{
}

- (AKServerRequestConfiguration)requestConfiguration
{
  return self->_requestConfiguration;
}

- (void)setRequestConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end