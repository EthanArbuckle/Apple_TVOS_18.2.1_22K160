@interface AKGrandSlamRequestProvider
- (AKAppleIDServerResourceLoadDelegate)loadDelegate;
- (BOOL)authenticatedRequest;
- (BOOL)shouldSendIdentityToken;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)setAuthenticatedRequest:(BOOL)a3;
- (void)setExpectedResponseType:(unint64_t)a3;
- (void)setRequestBodyType:(unint64_t)a3;
- (void)setShouldSendIdentityToken:(BOOL)a3;
@end

@implementation AKGrandSlamRequestProvider

- (AKAppleIDServerResourceLoadDelegate)loadDelegate
{
  BOOL v3 = -[AKGrandSlamRequestProvider shouldSendIdentityToken](self, "shouldSendIdentityToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  objc_msgSend(v4, "set_shouldSendIdentityTokenForRemoteUI:", v3);

  v5 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v7 = -[AKDServerUIController initWithClient:](v5, "initWithClient:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](v7, "resourceLoadDelegateWithContext:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v9 setInitialURLRequestKey:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v9 setBagUrlKey:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl dataCenterIdentifier](self, "dataCenterIdentifier"));
  [v9 setDataCenterIdentifier:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
  [v9 setClientBundleID:v14];

  return (AKAppleIDServerResourceLoadDelegate *)v9;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[AKGrandSlamRequestProvider authenticatedRequest](self, "authenticatedRequest"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKGrandSlamRequestProvider loadDelegate](self, "loadDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 heartbeatToken]);

    if (!v8)
    {
      uint64_t v21 = _AKLogSystem(v9);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1001388EC(self, v22);
      }

      if (a4)
      {
        BOOL v20 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7042LL));
        goto LABEL_16;
      }

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKGrandSlamRequestProvider;
  BOOL v6 = -[AKURLRequestProviderImpl validateResponseData:error:](&v11, "validateResponseData:error:", a3);
  if (a4 && *a4)
  {
    v7 = objc_alloc(&OBJC_CLASS___AKGrandSlamResponseHandler);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
    uint64_t v9 = -[AKGrandSlamResponseHandler initWithContext:](v7, "initWithContext:", v8);

    -[AKGrandSlamResponseHandler handleResponseError:](v9, "handleResponseError:", *a4);
  }

  return v6;
}

- (BOOL)authenticatedRequest
{
  return self->_authenticatedRequest;
}

- (void)setAuthenticatedRequest:(BOOL)a3
{
  self->_authenticatedRequest = a3;
}

- (BOOL)shouldSendIdentityToken
{
  return self->_shouldSendIdentityToken;
}

- (void)setShouldSendIdentityToken:(BOOL)a3
{
  self->_shouldSendIdentityToken = a3;
}

- (unint64_t)expectedResponseType
{
  return self->_expectedResponseType;
}

- (void)setExpectedResponseType:(unint64_t)a3
{
  self->_expectedResponseType = a3;
}

- (unint64_t)requestBodyType
{
  return self->_requestBodyType;
}

- (void)setRequestBodyType:(unint64_t)a3
{
  self->_requestBodyType = a3;
}

@end