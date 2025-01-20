@interface AKAuthorizationRevokeUpgradeController
- (id)_authenticationContextForRevokingUpgrade;
- (id)_requestBodyForUpgradeRevokeContext:(id)a3;
- (void)revokeUpgradeWithContext:(id)a3 client:(id)a4 completion:(id)a5;
@end

@implementation AKAuthorizationRevokeUpgradeController

- (void)revokeUpgradeWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationRevokeUpgradeController _authenticationContextForRevokingUpgrade]( self,  "_authenticationContextForRevokingUpgrade"));
  uint64_t v12 = _AKLogSystem(v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10013DD14(v8, v13);
  }

  v14 = objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider);
  v15 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v14,  "initWithContext:urlBagKey:",  v11,  AKURLBagKeyDeleteAuthorizedApp);
  -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v15, "setAuthenticatedRequest:", 1LL);
  -[AKURLRequestProviderImpl setClient:](v15, "setClient:", v10);

  v16 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationRevokeUpgradeController _requestBodyForUpgradeRevokeContext:]( self,  "_requestBodyForUpgradeRevokeContext:",  v8));
  -[AKURLRequestProviderImpl setAuthKitBody:](v15, "setAuthKitBody:", v16);

  v17 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v15);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000962F4;
  v19[3] = &unk_1001C6C28;
  id v20 = v9;
  id v18 = v9;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v17, "executeRequestWithCompletion:", v19);
}

- (id)_requestBodyForUpgradeRevokeContext:(id)a3
{
  v9[0] = @"atxid";
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionID]);
  v10[0] = v4;
  v9[1] = @"client_id";
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleID]);
  v10[1] = v5;
  v9[2] = @"team_id";
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 teamID]);

  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)_authenticationContextForRevokingUpgrade
{
  v2 = objc_alloc_init(&OBJC_CLASS___AKAccountManager);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDforPrimaryiCloudAccount](v2, "altDSIDforPrimaryiCloudAccount"));
  v4 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v4, "setAltDSID:", v3);

  return v4;
}

@end