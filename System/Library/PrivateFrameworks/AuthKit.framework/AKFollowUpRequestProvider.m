@interface AKFollowUpRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (unint64_t)expectedResponseType;
@end

@implementation AKFollowUpRequestProvider

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  objc_msgSend(v6, "set_shouldSendIdentityTokenForRemoteUI:", 0);

  v7 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v9 = -[AKDServerUIController initWithClient:](v7, "initWithClient:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](v9, "resourceLoadDelegateWithContext:", v10));

  [v11 setBagUrlKey:AKURLBagKeyFetchFollowUps];
  [v5 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v5 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [v11 signRequest:v5];

  return 1;
}

- (unint64_t)expectedResponseType
{
  return 1LL;
}

@end