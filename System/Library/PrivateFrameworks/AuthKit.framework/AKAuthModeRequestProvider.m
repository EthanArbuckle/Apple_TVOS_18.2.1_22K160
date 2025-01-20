@interface AKAuthModeRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
@end

@implementation AKAuthModeRequestProvider

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AKAuthModeRequestProvider;
  BOOL v7 = -[AKGrandSlamRequestProvider signRequest:error:](&v18, "signRequest:error:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
    objc_msgSend(v6, "ak_addAppleIDHeaderWithValue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    objc_msgSend(v6, "ak_addAppleIDUserModeHeaderWithValue:", objc_msgSend(v10, "isMultiUserMode"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 appProvidedContext]);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appProvidedContext]);
      objc_msgSend(v6, "ak_addAppProvidedContext:", v14);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    unsigned int v16 = [v15 isContextRequestingReauthForExistingService];

    if (v16) {
      objc_msgSend(v6, "ak_addReAuthenticationHeader");
    }
  }

  return v7;
}

@end