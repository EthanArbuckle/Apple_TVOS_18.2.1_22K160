@interface AKTokenUpgradeRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (void)buildRequestWithCompletion:(id)a3;
@end

@implementation AKTokenUpgradeRequestProvider

- (void)buildRequestWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _shortLivedToken]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _identityToken]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceToken]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v12 = [v11 isPltUpgradeEnabled];

  if (v12)
  {
    uint64_t v14 = _AKLogSystem(v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100141A70(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 passwordlessToken]);

    BOOL v25 = v24 == 0LL;
    if (v6) {
      goto LABEL_13;
    }
  }

  else
  {
    BOOL v25 = 1;
    if (v6) {
      goto LABEL_13;
    }
  }

  if (v8 || !v25 || v10)
  {
LABEL_13:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v29 altDSID]);

    if (v28)
    {
      v34.receiver = self;
      v34.super_class = (Class)&OBJC_CLASS___AKTokenUpgradeRequestProvider;
      -[AKURLRequestProviderImpl buildRequestWithCompletion:](&v34, "buildRequestWithCompletion:", v4);
    }

    else
    {
      uint64_t v31 = _AKLogSystem(v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Attempt to perform authentication without altDSID!",  buf,  2u);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7025LL));
      v4[2](v4, 0LL, v33);
    }

    goto LABEL_18;
  }

  uint64_t v26 = _AKLogSystem(v13);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Attempt to perform authentication without an upgrade token!",  buf,  2u);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7044LL));
  v4[2](v4, 0LL, v28);
LABEL_18:
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v8 = -[AKDServerUIController initWithClient:](v6, "initWithClient:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](v8, "resourceLoadDelegateWithContext:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v10 setBagUrlKey:v11];

  [v10 signRequestWithCommonHeaders:v5];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _shortLivedToken]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v15 = v14;
  if (v13)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 _shortLivedToken]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);
    objc_msgSend(v5, "ak_addShortLivedTokenHeaderWithIdentityToken:forAltDSID:", v16, v18);
LABEL_8:

    goto LABEL_9;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 _identityToken]);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v15 = v20;
  if (v19)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v20 _identityToken]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);
    objc_msgSend(v5, "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:", v16, v18);
    goto LABEL_8;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 serviceToken]);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v15 = v22;
  if (v21)
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 serviceToken]);
LABEL_7:
    uint64_t v16 = (void *)v23;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);
    objc_msgSend(v5, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v16, v18);
    goto LABEL_8;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue([v22 passwordlessToken]);

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    unsigned int v40 = [v39 isPltUpgradeEnabled];

    if (v40)
    {
      uint64_t v42 = _AKLogSystem(v41);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        sub_100141AA4(v43, v44, v45, v46, v47, v48, v49, v50);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v15 passwordlessToken]);
      goto LABEL_7;
    }
  }

@end