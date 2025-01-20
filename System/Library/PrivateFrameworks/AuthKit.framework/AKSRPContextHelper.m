@interface AKSRPContextHelper
- (ACAccount)authKitAccount;
- (AKAuthenticationContext)authContext;
- (AKClient)client;
- (AKSRPContextHelper)initWithContext:(id)a3;
- (BOOL)biometricAuth;
- (BOOL)eligibleForContinuationKeyAuthentication;
- (BOOL)hasSOSActiveDevice;
- (BOOL)ignoreInternalTokens;
- (BOOL)isContextSecretValidForSRP:(id *)a3;
- (BOOL)passcodeAuth;
- (BOOL)passcodeAuthEnabled;
- (BOOL)retryAuth;
- (BOOL)walrusEnabled;
- (BOOL)walrusWebAccessEnabled;
- (NSDictionary)additionalHeaders;
- (NSString)accountRecoveryMasterKey;
- (NSString)altDSID;
- (NSString)decodedRecoveryIdentityToken;
- (NSString)decodedRecoveryPET;
- (NSString)idmsDataToken;
- (NSString)password;
- (NSString)passwordResetToken;
- (NSString)passwordlessToken;
- (NSString)username;
- (id)_anisetteHeadersFromAttestationData:(id)a3;
- (id)authKitAccount:(id *)a3;
- (id)continuationToken:(id *)a3;
- (void)_addExperimentalFeaturesInfoToClientProvidedData:(id)a3;
- (void)_clearDeviceListCacheForAltDSID:(id)a3;
- (void)authenticationParametersWithCompletion:(id)a3;
- (void)clearContinuationTokenIfSupportedWithError:(id)a3;
- (void)setAccountRecoveryMasterKey:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setAuthKitAccount:(id)a3;
- (void)setBiometricAuth:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setDecodedRecoveryIdentityToken:(id)a3;
- (void)setDecodedRecoveryPET:(id)a3;
- (void)setHasSOSActiveDevice:(BOOL)a3;
- (void)setIdmsDataToken:(id)a3;
- (void)setIgnoreInternalTokens:(BOOL)a3;
- (void)setPasscodeAuth:(BOOL)a3;
- (void)setPasscodeAuthEnabled:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordlessToken:(id)a3;
- (void)setRetryAuth:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setWalrusEnabled:(BOOL)a3;
- (void)setWalrusWebAccessEnabled:(BOOL)a3;
@end

@implementation AKSRPContextHelper

- (AKSRPContextHelper)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKSRPContextHelper;
  v6 = -[AKSRPContextHelper init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authContext, a3);
  }

  return v7;
}

- (BOOL)isContextSecretValidForSRP:(id *)a3
{
  if (self->_password)
  {
    uint64_t v3 = _AKLogSystem(self);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1001408C8();
    }
LABEL_10:
    BOOL v7 = 1;
    goto LABEL_11;
  }

  if (self->_accountRecoveryMasterKey)
  {
    uint64_t v5 = _AKLogSystem(self);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10014089C();
    }
    goto LABEL_10;
  }

  if (self->_passwordlessToken)
  {
    uint64_t v6 = _AKLogSystem(self);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100140870();
    }
    goto LABEL_10;
  }

  id v15 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper continuationToken:](self, "continuationToken:", &v15));
  v4 = (os_log_s *)v15;
  BOOL v7 = v10 != 0LL;

  if (v10)
  {
    uint64_t v12 = _AKLogSystem(v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1001407D0();
    }
  }

  else
  {
    if (a3)
    {
      v11 = v4;
      *a3 = v11;
    }

    uint64_t v14 = _AKLogSystem(v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001407FC((uint64_t)v4, v13);
    }
  }

LABEL_11:
  return v7;
}

- (void)authenticationParametersWithCompletion:(id)a3
{
  id v129 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper username](self, "username"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper username](self, "username"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v8,  kAppleIDAuthSupportUsername);
  }

  passwordlessToken = self->_passwordlessToken;
  if (passwordlessToken) {
    BOOL v10 = -[NSString length](passwordlessToken, "length") != 0;
  }
  else {
    BOOL v10 = 0;
  }
  idmsDataToken = self->_idmsDataToken;
  if (idmsDataToken)
  {
    idmsDataToken = -[NSString length](idmsDataToken, "length");
    BOOL v12 = idmsDataToken != 0LL;
  }

  else
  {
    BOOL v12 = 0;
  }

  uint64_t v13 = _AKLogSystem(idmsDataToken);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = @"NO";
    if (v10) {
      v16 = @"YES";
    }
    else {
      v16 = @"NO";
    }
    if (v12) {
      id v15 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v137 = v16;
    __int16 v138 = 2112;
    v139 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Adding passwordlessToken: %@, and idmsDataToken: %@, to auth-params",  buf,  0x16u);
  }

  if (self->_password)
  {
    v17 = v4;
    goto LABEL_18;
  }

  if (v10)
  {
    id v18 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  self->_passwordlessToken,  kAppleIDAuthSupportPassword);
    if (!v12) {
      goto LABEL_19;
    }
    v17 = v5;
LABEL_18:
    id v18 = -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:");
LABEL_19:
    uint64_t v114 = 0LL;
    goto LABEL_20;
  }

  v89 = (NSString *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper continuationToken:](self, "continuationToken:", 0LL));
  if (v89
    && -[AKSRPContextHelper eligibleForContinuationKeyAuthentication](self, "eligibleForContinuationKeyAuthentication"))
  {
    int v90 = 0;
    int v91 = 1;
    accountRecoveryMasterKey = v89;
  }

  else
  {
    int v91 = 0;
    accountRecoveryMasterKey = self->_accountRecoveryMasterKey;
    if (!accountRecoveryMasterKey)
    {
      uint64_t v114 = 0LL;
      goto LABEL_128;
    }

    int v90 = 1;
  }

  HIDWORD(v114) = v91;
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  accountRecoveryMasterKey,  kAppleIDAuthSupportPassword);
  LODWORD(v114) = v90;
LABEL_128:

LABEL_20:
  if (self->_biometricAuth)
  {
    uint64_t v19 = _AKLogSystem(v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "bio metric PET requested.", buf, 2u);
    }

    v21 = @"biopet";
LABEL_31:

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v21);
    goto LABEL_32;
  }

  if (self->_passcodeAuth)
  {
    uint64_t v22 = _AKLogSystem(v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "passcode PET requested.", buf, 2u);
    }

    v21 = @"passcodepet";
    goto LABEL_31;
  }

- (id)_anisetteHeadersFromAttestationData:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v19[0] = AKHTTPHeaderMID;
  v19[1] = AKHTTPHeaderOTP;
  v19[2] = AKHTTPHeaderRoutingInfo;
  v19[3] = AKHTTPHeaderLocalUserUUID;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attestationHeaders", (void)v14));
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

        if (v12) {
          [v4 setObject:v12 forKey:v10];
        }

        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)_addExperimentalFeaturesInfoToClientProvidedData:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned int v5 = [v4 isInternalBuild];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
    id v7 = [v6 internalFeaturesMaskValue];

    if (v7)
    {
      uint64_t v9 = _AKLogSystem(v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        id v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sending experimental features as %lu",  (uint8_t *)&v13,  0xCu);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);
      [v3 setObject:v12 forKeyedSubscript:AKInternalFeatureMasksHeaderKey];
    }
  }
}

- (void)clearContinuationTokenIfSupportedWithError:(id)a3
{
  id v4 = a3;
  if (!self->_password)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper continuationToken:](self, "continuationToken:", 0LL));

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper authKitAccount:](self, "authKitAccount:", 0LL));
      uint64_t v7 = _AKLogSystem(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = self;
        __int16 v23 = 2112;
        v24 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Attempting to clear continuation token for account (%@)",  buf,  0x16u);
      }

      authContext = self->_authContext;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___AKAppleIDAuthenticationContext, v10);
      if ((objc_opt_isKindOfClass(authContext, v11) & 1) != 0) {
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext telemetryFlowID](self->_authContext, "telemetryFlowID"));
      }
      else {
        BOOL v12 = 0LL;
      }
      int v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      [v13 removeContinuationTokenForAccount:v6 telemetryFlowID:v12 error:v4];

      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext altDSID](self->_authContext, "altDSID"));
      if (v14)
      {
        __int128 v15 = (void *)v14;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
        unsigned int v17 = [v16 isDeviceListCacheEnableDryMode];

        if (v17)
        {
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
          uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000AD520;
          block[3] = &unk_1001C7300;
          block[4] = self;
          dispatch_async(v19, block);
        }
      }
    }
  }
}

- (void)_clearDeviceListCacheForAltDSID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_alloc(&OBJC_CLASS___AKDeviceListRequester);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKDeviceListStoreManager sharedManager](&OBJC_CLASS___AKDeviceListStoreManager, "sharedManager"));
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___AKCDPFactory);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v9 = -[AKDeviceListRequester initWithStoreManager:cdpFactory:accountManager:client:]( v5,  "initWithStoreManager:cdpFactory:accountManager:client:",  v6,  v7,  v8,  self->_client);

  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___AKDeviceListRequestContext);
  -[AKDeviceListRequestContext setAltDSID:](v10, "setAltDSID:", v4);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000AD688;
  v12[3] = &unk_1001C78A8;
  int v13 = v10;
  uint64_t v11 = v10;
  -[AKDeviceListRequester clearDeviceListCacheWithContext:completionHandler:]( v9,  "clearDeviceListCacheWithContext:completionHandler:",  v11,  v12);
}

- (id)authKitAccount:(id *)a3
{
  if (self->_authKitAccount) {
    goto LABEL_7;
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext altDSID](self->_authContext, "altDSID"));

  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    uint64_t v8 = (ACAccount *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext altDSID](self->_authContext, "altDSID"));
    uint64_t v9 = (ACAccount *)objc_claimAutoreleasedReturnValue([v7 authKitAccountWithAltDSID:v8 error:a3]);
    authKitAccount = self->_authKitAccount;
    self->_authKitAccount = v9;

LABEL_6:
LABEL_7:
    BOOL v12 = self->_authKitAccount;
    return v12;
  }

  if (self->_username)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    uint64_t v11 = (ACAccount *)objc_claimAutoreleasedReturnValue([v7 authKitAccountWithAppleID:self->_username error:a3]);
    uint64_t v8 = self->_authKitAccount;
    self->_authKitAccount = v11;
    goto LABEL_6;
  }

  if (a3)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7050LL));
    *a3 = v6;
  }

  uint64_t v14 = _AKLogSystem(v6);
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100140A68();
  }

  BOOL v12 = 0LL;
  return v12;
}

- (id)continuationToken:(id *)a3
{
  if (self->_ignoreInternalTokens)
  {
    if (a3)
    {
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
      return 0LL;
    }

    return 0LL;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
  if (!v6
    || (uint64_t v7 = (void *)v6,
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionDevice](self->_authContext, "companionDevice")),
        v8,
        v7,
        !v8))
  {
    continuationToken = self->_continuationToken;
    if (!continuationToken)
    {
      id v22 = 0LL;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper authKitAccount:](self, "authKitAccount:", &v22));
      id v17 = v22;
      if (v17)
      {
        id v18 = v17;
        if (a3) {
          *a3 = v17;
        }

        return 0LL;
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      v20 = (NSString *)objc_claimAutoreleasedReturnValue([v19 continuationTokenForAccount:v16 error:a3]);
      v21 = self->_continuationToken;
      self->_continuationToken = v20;

      continuationToken = self->_continuationToken;
    }

    return continuationToken;
  }

  uint64_t v10 = _AKLogSystem(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Using continuation key provided by companion key envelope (%@)",  buf,  0x16u);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 continuationKey]);

  return v14;
}

- (NSString)passwordResetToken
{
  if (self->_ignoreInternalTokens) {
    return (NSString *)0LL;
  }
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
  if (v4
    && (unsigned int v5 = (void *)v4,
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionDevice](self->_authContext, "companionDevice")),
        v6,
        v5,
        v6))
  {
    uint64_t v8 = _AKLogSystem(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
      *(_DWORD *)buf = 138412546;
      id v22 = self;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Using password reset key provided by companion key envelope (%@)",  buf,  0x16u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordResetKey]);

    return (NSString *)v12;
  }

  else
  {
    passwordResetToken = self->_passwordResetToken;
    if (!passwordResetToken)
    {
      id v20 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper authKitAccount:](self, "authKitAccount:", &v20));
      id v15 = v20;
      if (v15)
      {
        __int128 v16 = v15;

        return (NSString *)0LL;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      id v18 = (NSString *)objc_claimAutoreleasedReturnValue([v17 passwordResetTokenForAccount:v14 error:0]);
      uint64_t v19 = self->_passwordResetToken;
      self->_passwordResetToken = v18;

      passwordResetToken = self->_passwordResetToken;
    }

    return passwordResetToken;
  }

- (NSString)username
{
  username = self->_username;
  if (!username)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
    if (v4)
    {
      unsigned int v5 = (void *)v4;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionDevice](self->_authContext, "companionDevice"));

      if (v6)
      {
        uint64_t v8 = _AKLogSystem(v7);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
          int v20 = 138412802;
          v21 = self;
          __int16 v22 = 2112;
          __int16 v23 = v11;
          __int16 v24 = 2112;
          __int16 v25 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Using username (%@) from companion key envelope (%@)",  (uint8_t *)&v20,  0x20u);
        }

        int v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
        uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue([v13 username]);
        id v15 = self->_username;
        self->_username = v14;
      }
    }

    username = self->_username;
    if (!username)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper authKitAccount:](self, "authKitAccount:", 0LL));
      id v17 = (NSString *)objc_claimAutoreleasedReturnValue([v16 username]);
      id v18 = self->_username;
      self->_username = v17;

      username = self->_username;
    }
  }

  return username;
}

- (NSString)altDSID
{
  altDSID = self->_altDSID;
  if (!altDSID)
  {
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext altDSID](self->_authContext, "altDSID"));
    unsigned int v5 = self->_altDSID;
    self->_altDSID = v4;

    altDSID = self->_altDSID;
    if (!altDSID)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionDevice](self->_authContext, "companionDevice"));

        if (v8)
        {
          uint64_t v10 = _AKLogSystem(v9);
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
            int v21 = 138412546;
            __int16 v22 = self;
            __int16 v23 = 2112;
            __int16 v24 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Using altDSID from companion key envelope (%@)",  (uint8_t *)&v21,  0x16u);
          }

          int v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationContext companionKeyEnvelope](self->_authContext, "companionKeyEnvelope"));
          uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue([v13 altDSID]);
          id v15 = self->_altDSID;
          self->_altDSID = v14;
        }
      }

      altDSID = self->_altDSID;
      if (!altDSID)
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper authKitAccount:](self, "authKitAccount:", 0LL));
        id v18 = (NSString *)objc_claimAutoreleasedReturnValue([v16 altDSIDForAccount:v17]);
        uint64_t v19 = self->_altDSID;
        self->_altDSID = v18;

        altDSID = self->_altDSID;
      }
    }
  }

  return altDSID;
}

- (BOOL)eligibleForContinuationKeyAuthentication
{
  if (-[AKAuthenticationContext authenticationType](self->_authContext, "authenticationType") == (id)3
    && !-[AKSRPContextHelper biometricAuth](self, "biometricAuth"))
  {
    return -[AKSRPContextHelper passcodeAuth](self, "passcodeAuth");
  }

  else
  {
    return 1;
  }

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)passwordlessToken
{
  return self->_passwordlessToken;
}

- (void)setPasswordlessToken:(id)a3
{
}

- (NSString)idmsDataToken
{
  return self->_idmsDataToken;
}

- (void)setIdmsDataToken:(id)a3
{
}

- (NSString)accountRecoveryMasterKey
{
  return self->_accountRecoveryMasterKey;
}

- (void)setAccountRecoveryMasterKey:(id)a3
{
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)decodedRecoveryPET
{
  return self->_decodedRecoveryPET;
}

- (void)setDecodedRecoveryPET:(id)a3
{
}

- (NSString)decodedRecoveryIdentityToken
{
  return self->_decodedRecoveryIdentityToken;
}

- (void)setDecodedRecoveryIdentityToken:(id)a3
{
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (ACAccount)authKitAccount
{
  return self->_authKitAccount;
}

- (void)setAuthKitAccount:(id)a3
{
}

- (BOOL)ignoreInternalTokens
{
  return self->_ignoreInternalTokens;
}

- (void)setIgnoreInternalTokens:(BOOL)a3
{
  self->_ignoreInternalTokens = a3;
}

- (AKAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (BOOL)biometricAuth
{
  return self->_biometricAuth;
}

- (void)setBiometricAuth:(BOOL)a3
{
  self->_biometricAuth = a3;
}

- (BOOL)passcodeAuth
{
  return self->_passcodeAuth;
}

- (void)setPasscodeAuth:(BOOL)a3
{
  self->_passcodeAuth = a3;
}

- (BOOL)retryAuth
{
  return self->_retryAuth;
}

- (void)setRetryAuth:(BOOL)a3
{
  self->_retryAuth = a3;
}

- (BOOL)walrusEnabled
{
  return self->_walrusEnabled;
}

- (void)setWalrusEnabled:(BOOL)a3
{
  self->_walrusEnabled = a3;
}

- (BOOL)walrusWebAccessEnabled
{
  return self->_walrusWebAccessEnabled;
}

- (void)setWalrusWebAccessEnabled:(BOOL)a3
{
  self->_walrusWebAccessEnabled = a3;
}

- (BOOL)hasSOSActiveDevice
{
  return self->_hasSOSActiveDevice;
}

- (void)setHasSOSActiveDevice:(BOOL)a3
{
  self->_hasSOSActiveDevice = a3;
}

- (BOOL)passcodeAuthEnabled
{
  return self->_passcodeAuthEnabled;
}

- (void)setPasscodeAuthEnabled:(BOOL)a3
{
  self->_passcodeAuthEnabled = a3;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end