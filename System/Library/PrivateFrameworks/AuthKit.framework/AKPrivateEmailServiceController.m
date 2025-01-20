@interface AKPrivateEmailServiceController
- (AKPrivateEmailServiceController)initWithClient:(id)a3 altDSID:(id)a4;
- (BOOL)isSecondCall;
- (id)_constructRequestProviderForClient:(id)a3 altDSID:(id)a4;
- (void)executeFetchHmeListRequestWithCompletion:(id)a3;
- (void)setIsSecondCall:(BOOL)a3;
@end

@implementation AKPrivateEmailServiceController

- (AKPrivateEmailServiceController)initWithClient:(id)a3 altDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKPrivateEmailServiceController _constructRequestProviderForClient:altDSID:]( self,  "_constructRequestProviderForClient:altDSID:",  v7,  v8));
  if (v9
    && (v12.receiver = self,
        v12.super_class = (Class)&OBJC_CLASS___AKPrivateEmailServiceController,
        v10 = -[AKServiceControllerImpl initWithRequestProvider:](&v12, "initWithRequestProvider:", v9),
        (self = v10) != 0LL))
  {
    objc_storeStrong((id *)&v10->_client, a3);
    objc_storeStrong((id *)&self->_altDSID, a4);
    self->_isSecondCall = 0;
  }

  else
  {

    self = 0LL;
  }

  return self;
}

- (void)executeFetchHmeListRequestWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100064978;
  v4[3] = &unk_1001C7F68;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v5, "executeRequestWithCompletion:", v4);
}

- (id)_constructRequestProviderForClient:(id)a3 altDSID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v7, "setAltDSID:", v5);

  id v8 = objc_alloc(&OBJC_CLASS___AKPrivateEmailRequestProvider);
  v9 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v8,  "initWithContext:urlBagKey:",  v7,  AKURLBagKeyPrivateEmailFetchList);
  -[AKURLRequestProviderImpl setClient:](v9, "setClient:", v6);

  -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v9, "setAuthenticatedRequest:", 1LL);
  -[AKGrandSlamRequestProvider setExpectedResponseType:](v9, "setExpectedResponseType:", 1LL);

  return v9;
}

- (BOOL)isSecondCall
{
  return self->_isSecondCall;
}

- (void)setIsSecondCall:(BOOL)a3
{
  self->_isSecondCall = a3;
}

- (void).cxx_destruct
{
}

@end