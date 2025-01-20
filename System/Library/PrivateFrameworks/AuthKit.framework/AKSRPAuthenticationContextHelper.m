@interface AKSRPAuthenticationContextHelper
- (AKAppleIDAuthenticationContext)authContext;
- (AKSRPAuthenticationContextHelper)initWithContext:(id)a3;
- (BOOL)_masterKeyAsSecondFactor;
- (BOOL)canPresentRemoteUI;
- (id)_identityAuthorizationPayload;
- (id)_passwordResetBackupToken;
- (void)_authenticationParameters:(id)a3;
- (void)_setMasterKeyAsSecondFactor:(BOOL)a3;
- (void)_updateHeadersWithCompanionAnisetteData:(id)a3 clientProvidedData:(id)a4 completion:(id)a5;
- (void)_updateHeadersWithProxiedDeviceAnisetteData:(id)a3 clientProvidedData:(id)a4 completion:(id)a5;
- (void)authenticationParametersWithCompletion:(id)a3;
- (void)clientProvidedDataHelper:(id)a3;
- (void)setAuthContext:(id)a3;
@end

@implementation AKSRPAuthenticationContextHelper

- (AKSRPAuthenticationContextHelper)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKSRPAuthenticationContextHelper;
  v6 = -[AKSRPContextHelper initWithContext:](&v9, "initWithContext:", v5);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authContext, a3);
  }

  return v7;
}

- (void)authenticationParametersWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F0F0;
  v4[3] = &unk_1001C7018;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[AKSRPAuthenticationContextHelper _authenticationParameters:](v5, "_authenticationParameters:", v4);
}

- (void)_authenticationParameters:(id)a3
{
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x3032000000LL;
  v9[3] = sub_10001F5C4;
  v9[4] = sub_10001F5D4;
  id v10 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001F5DC;
  v6[3] = &unk_1001C7090;
  id v4 = a3;
  id v7 = v4;
  v8 = v9;
  v6[4] = self;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKSRPAuthenticationContextHelper;
  -[AKSRPContextHelper authenticationParametersWithCompletion:](&v5, "authenticationParametersWithCompletion:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)_updateHeadersWithProxiedDeviceAnisetteData:(id)a3 clientProvidedData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext proxiedDeviceAnisetteData](self->_authContext, "proxiedDeviceAnisetteData"));
  v12 = (void *)v11;
  if (v11)
  {
    uint64_t v13 = _AKLogSystem(v11);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Context has provided Anisette data for proxied device.",  buf,  2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest ak_proxiedAnisetteHeadersWithData:]( &OBJC_CLASS___NSMutableURLRequest,  "ak_proxiedAnisetteHeadersWithData:",  v12));
    [v9 addEntriesFromDictionary:v15];
    [v8 addEntriesFromDictionary:v15];
    v10[2](v10, 1LL, 0LL);
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext proxiedDevice](self->_authContext, "proxiedDevice"));

    if (v16)
    {
      uint64_t v18 = _AKLogSystem(v17);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Grabbing Anisette data from proxied device.",  buf,  2u);
      }

      v20 = objc_alloc(&OBJC_CLASS___AKAnisetteProvisioningService);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper client](self, "client"));
      v22 = -[AKAnisetteProvisioningService initWithClient:context:]( v20,  "initWithClient:context:",  v21,  self->_authContext);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext proxiedDevice](self->_authContext, "proxiedDevice"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10002092C;
      v24[3] = &unk_1001C70B8;
      id v25 = v9;
      id v26 = v8;
      v27 = self;
      v28 = v10;
      -[AKAnisetteProvisioningService fetchAnisetteDataAndProvisionIfNecessary:device:completion:]( v22,  "fetchAnisetteDataAndProvisionIfNecessary:device:completion:",  1LL,  v23,  v24);
    }

    else
    {
      v10[2](v10, 1LL, 0LL);
    }
  }
}

- (void)_updateHeadersWithCompanionAnisetteData:(id)a3 clientProvidedData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = objc_alloc(&OBJC_CLASS___AKAnisetteProvisioningService);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper client](self, "client"));
  uint64_t v13 = -[AKAnisetteProvisioningService initWithClient:context:]( v11,  "initWithClient:context:",  v12,  self->_authContext);

  uint64_t v14 = objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationContext companionDeviceAnisetteData]( self->_authContext,  "companionDeviceAnisetteData"));
  v15 = (void *)v14;
  if (v14)
  {
    uint64_t v16 = _AKLogSystem(v14);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Context has provided Anisette data for companion device.",  buf,  2u);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest ak_anisetteHeadersWithCompanionData:]( &OBJC_CLASS___NSMutableURLRequest,  "ak_anisetteHeadersWithCompanionData:",  v15));
    [v9 addEntriesFromDictionary:v18];
    [v8 addEntriesFromDictionary:v18];
    v10[2](v10, 1LL, 0LL);
  }

  else
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext companionDevice](self->_authContext, "companionDevice"));
    if (v19
      && (v20 = (void *)v19,
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext companionDevice](self->_authContext, "companionDevice")),
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueDeviceIdentifier]),
          v22,
          v21,
          v20,
          v22))
    {
      uint64_t v24 = _AKLogSystem(v23);
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Looking to set companion Anisette data in CPD.",  buf,  2u);
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext companionDevice](self->_authContext, "companionDevice"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100020C70;
      v27[3] = &unk_1001C70B8;
      id v28 = v9;
      id v29 = v8;
      v30 = self;
      v31 = v10;
      -[AKAnisetteProvisioningService fetchAnisetteDataAndProvisionIfNecessary:device:completion:]( v13,  "fetchAnisetteDataAndProvisionIfNecessary:device:completion:",  1LL,  v26,  v27);
    }

    else
    {
      v10[2](v10, 1LL, 0LL);
    }
  }
}

- (void)clientProvidedDataHelper:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext appProvidedData](self->_authContext, "appProvidedData"));

  authContext = self->_authContext;
  if (v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext appProvidedData](authContext, "appProvidedData"));
  }

  else
  {
    id v8 = -[AKAppleIDAuthenticationContext verifyCredentialReason](authContext, "verifyCredentialReason");
    if (v8 == (id)1)
    {
      uint64_t v13 = _AKLogSystem(1LL);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client has request a beneficiary setup token.",  buf,  2u);
      }

      v53 = @"addBeneficiaryToken";
      v54 = @"true";
      uint64_t v11 = &v54;
      v12 = &v53;
    }

    else
    {
      if (v8 != (id)2) {
        goto LABEL_13;
      }
      uint64_t v9 = _AKLogSystem(2LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client has request a custodian setup token.",  buf,  2u);
      }

      v55 = @"addCustodianToken";
      v56 = @"true";
      uint64_t v11 = &v56;
      v12 = &v55;
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v12,  1LL));
  }

  v15 = (void *)v7;
  [v4 setObject:v7 forKeyedSubscript:@"apd"];

LABEL_13:
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext appProvidedContext](self->_authContext, "appProvidedContext"));

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext appProvidedContext](self->_authContext, "appProvidedContext"));
    [v4 setObject:v17 forKeyedSubscript:@"X-Apple-I-App-Provided-Context"];
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext proxiedDevice](self->_authContext, "proxiedDevice"));

  if (v18)
  {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"X-Apple-I-Proxied-ICSCREC"];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"X-Apple-I-Proxied-PRK-Gen"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext proxiedDevice](self->_authContext, "proxiedDevice"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 serverFriendlyDescription]);
    [v4 setObject:v20 forKeyedSubscript:@"X-MMe-Proxied-Client-Info"];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext appProvidedContext](self->_authContext, "appProvidedContext"));
    id v22 = [v21 length];

    if (v22)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[AKSRPAuthenticationContextHelper _identityAuthorizationPayload]( self,  "_identityAuthorizationPayload"));
      [v4 setObject:v23 forKeyedSubscript:@"X-Apple-Identity-Token"];
    }
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext _masterKey](self->_authContext, "_masterKey"));

  if (v24)
  {
    uint64_t v26 = _AKLogSystem(v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Context has masterKey set! Setting masterKeyIsEligible",  buf,  2u);
    }

    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"mke"];
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPAuthenticationContextHelper authContext](self, "authContext"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 _proxiedAppBundleID]);

  id v30 = [v29 length];
  if (v30)
  {
    uint64_t v31 = _AKLogSystem(v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Context has a proxied bundle id set!",  buf,  2u);
    }

    [v4 setObject:v29 forKeyedSubscript:@"pbid"];
  }

  BOOL v33 = -[AKSRPAuthenticationContextHelper _masterKeyAsSecondFactor](self, "_masterKeyAsSecondFactor");
  if (v33)
  {
    uint64_t v34 = _AKLogSystem(v33);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Context has set masterKeyAsSecondFactor",  buf,  2u);
    }

    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"mk2fa"];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext _identityToken](self->_authContext, "_identityToken"));
    [v4 setObject:v36 forKeyedSubscript:@"X-Apple-Identity-Token"];
  }

  if (+[AKFeatureManager isEnforceMDMPolicyEnabled]( &OBJC_CLASS___AKFeatureManager,  "isEnforceMDMPolicyEnabled"))
  {
    v37 = objc_alloc_init(&OBJC_CLASS___AKMDMInformationProvider);
    v38 = (void *)objc_claimAutoreleasedReturnValue( -[AKMDMInformationProvider fetchMDMInformationIfNecessaryForAuthContext:]( v37,  "fetchMDMInformationIfNecessaryForAuthContext:",  self->_authContext));

    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 deviceManagedState]);
    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v38 deviceManagedState]);
      [v4 setObject:v40 forKeyedSubscript:@"X-Apple-I-MDM-Device-Posture"];
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v38 organizationToken]);

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue([v38 organizationToken]);
      [v4 setObject:v42 forKeyedSubscript:@"X-Apple-I-MDM-Org-Token"];
    }
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  +[AKDevice currentDeviceAuthenticationModeForAuthContext:]( &OBJC_CLASS___AKDevice,  "currentDeviceAuthenticationModeForAuthContext:",  self->_authContext)));
  [v4 setObject:v43 forKeyedSubscript:@"X-Apple-I-Device-Configuration-Mode"];

  id v44 = -[AKAppleIDAuthenticationContext isContextRequestingReauthForExistingService]( self->_authContext,  "isContextRequestingReauthForExistingService");
  if ((_DWORD)v44)
  {
    uint64_t v45 = _AKLogSystem(v44);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Context indicates we are performing reauth for existing service",  buf,  2u);
    }

    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"X-Apple-I-ReAuth"];
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext proxiedAppleID](self->_authContext, "proxiedAppleID"));

  if (v47)
  {
    uint64_t v49 = _AKLogSystem(v48);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Context has set proxiedAppleID", buf, 2u);
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext proxiedAppleID](self->_authContext, "proxiedAppleID"));
    [v4 setObject:v51 forKeyedSubscript:@"proxiedAppleID"];
  }
}

- (BOOL)canPresentRemoteUI
{
  if (-[AKAppleIDAuthenticationContext _capabilityForUIDisplay](self->_authContext, "_capabilityForUIDisplay") == (id)2
    || -[AKAppleIDAuthenticationContext _capabilityForUIDisplay](self->_authContext, "_capabilityForUIDisplay") == (id)3)
  {
    return 1;
  }

  if (-[AKAppleIDAuthenticationContext _capabilityForUIDisplay](self->_authContext, "_capabilityForUIDisplay") == (id)1) {
    return -[AKAppleIDAuthenticationContext _performUIOutOfProcess]( self->_authContext,  "_performUIOutOfProcess");
  }
  return 0;
}

- (id)_passwordResetBackupToken
{
  if (-[AKSRPContextHelper ignoreInternalTokens](self, "ignoreInternalTokens"))
  {
    id v3 = 0LL;
  }

  else
  {
    passwordResetBackupToken = self->_passwordResetBackupToken;
    if (!passwordResetBackupToken)
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext authKitAccount:](self->_authContext, "authKitAccount:", 0LL));
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v5 passwordResetTokenBackupForAccount:v6]);
      id v8 = self->_passwordResetBackupToken;
      self->_passwordResetBackupToken = v7;

      passwordResetBackupToken = self->_passwordResetBackupToken;
    }

    id v3 = passwordResetBackupToken;
  }

  return v3;
}

- (id)_identityAuthorizationPayload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 altDSIDforPrimaryiCloudAccount]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authKitAccountWithAltDSID:v3 error:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 masterTokenForAccount:v5]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v3, v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 base64EncodedStringWithOptions:0]);

  return v11;
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (BOOL)_masterKeyAsSecondFactor
{
  return self->__masterKeyAsSecondFactor;
}

- (void)_setMasterKeyAsSecondFactor:(BOOL)a3
{
  self->__masterKeyAsSecondFactor = a3;
}

- (void).cxx_destruct
{
}

@end