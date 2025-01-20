@interface AKEducationEnterpriseRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (id)_authKitAccount;
- (id)_continuationToken;
- (id)_passwordResetToken;
- (void)_signWithProxiedDeviceHeaders:(id)a3;
@end

@implementation AKEducationEnterpriseRequestProvider

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___AKEducationEnterpriseRequestProvider;
  BOOL v7 = -[AKGrandSlamRequestProvider signRequest:error:](&v28, "signRequest:error:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 desiredInternalTokens]);
    unsigned int v10 = [v9 containsObject:AKAuthenticationInternalTokenCK];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    unsigned int v12 = [v11 isProtectedWithPasscode];

    if (v10)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[AKEducationEnterpriseRequestProvider _continuationToken](self, "_continuationToken"));
      if (!v13
        || ((v14 = v13,
             (v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKEducationEnterpriseRequestProvider _passwordResetToken](self, "_passwordResetToken"))) == 0LL)
          ? (unsigned int v16 = v12)
          : (unsigned int v16 = 0),
            v15,
            v14,
            v16 == 1))
      {
        uint64_t v17 = _AKLogSystem(v13);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Will ask for ckgen.", v27, 2u);
        }

        id v13 = objc_msgSend(v6, "ak_addCKRequestHeader");
      }
    }

    if (v12)
    {
      uint64_t v19 = _AKLogSystem(v13);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will ask for prkgen.", v27, 2u);
      }

      objc_msgSend(v6, "ak_addPRKRequestHeader");
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 proxiedDevice]);

    if (v22) {
      id v23 = -[AKEducationEnterpriseRequestProvider _signWithProxiedDeviceHeaders:]( self,  "_signWithProxiedDeviceHeaders:",  v6);
    }
    uint64_t v24 = _AKLogSystem(v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_10013FE18(v6, v25);
    }
  }

  return v7;
}

- (void)_signWithProxiedDeviceHeaders:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v38 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Grabbing Anisette data from proxied device.",  v38,  2u);
  }

  BOOL v7 = objc_alloc(&OBJC_CLASS___AKAnisetteProvisioningService);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  unsigned int v10 = -[AKAnisetteProvisioningService initWithClient:context:](v7, "initWithClient:context:", v8, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 proxiedDevice]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[AKAnisetteProvisioningService anisetteDataForDevice:provisionIfNecessary:]( v10,  "anisetteDataForDevice:provisionIfNecessary:",  v12,  1LL));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 proxiedDevice]);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serverFriendlyDescription]);

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 proxiedDevice]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 serverFriendlyDescription]);
    objc_msgSend(v4, "ak_addProxiedClientInfoHeader:", v19);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 proxiedDevice]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueDeviceIdentifier]);

  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 proxiedDevice]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueDeviceIdentifier]);
    objc_msgSend(v4, "ak_addProxiedDeviceUDIDHeader:", v25);
  }

  if (v13) {
    objc_msgSend(v4, "ak_addProxiedAnisetteHeaders:", v13);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 proxiedDevice]);
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue([v27 locale]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:NSLocaleCountryCode]);

  if (v29) {
    objc_msgSend(v4, "ak_addProxiedDeviceCountryHeader:", v29);
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 proxiedDevice]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 serialNumber]);

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 proxiedDevice]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 serialNumber]);
    objc_msgSend(v4, "ak_addProxiedDeviceSerialNumberHeader:", v35);
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 proxiedDevice]);

  if (v37)
  {
    objc_msgSend(v4, "ak_addProxiedDevicePRKRequestHeader");
    objc_msgSend(v4, "ak_addProxiedDeviceICSCIntentHeader");
  }
}

- (id)_authKitAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  uint64_t v5 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 authKitAccount:&v5]);

  return v3;
}

- (id)_passwordResetToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKEducationEnterpriseRequestProvider _authKitAccount](self, "_authKitAccount"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 passwordResetTokenForAccount:v2]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_continuationToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKEducationEnterpriseRequestProvider _authKitAccount](self, "_authKitAccount"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 continuationTokenForAccount:v2]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

@end