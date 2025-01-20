@interface AKTokenUpgrader
- (AKTokenUpgrader)initWithClient:(id)a3;
- (id)_fetchDependentAuthTokenForAltDSID:(id)a3;
- (void)_performTokenUpgradeWithContext:(id)a3 completion:(id)a4;
- (void)upgradeTokenWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKTokenUpgrader

- (AKTokenUpgrader)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKTokenUpgrader;
  v6 = -[AKTokenUpgrader init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v7->_accountManager;
    v7->_accountManager = (AKAccountManager *)v8;
  }

  return v7;
}

- (void)upgradeTokenWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 authenticationType];
  if (v8 != (id)2)
  {
    id v8 = [v6 authenticationType];
    if (v8 != (id)3)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000B3B8C;
      v12[3] = &unk_1001CAC30;
      id v14 = v7;
      id v13 = v6;
      -[AKTokenUpgrader _performTokenUpgradeWithContext:completion:]( self,  "_performTokenUpgradeWithContext:completion:",  v13,  v12);

      objc_super v11 = v14;
      goto LABEL_8;
    }
  }

  uint64_t v9 = _AKLogSystem(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Current context requires interactive auth, skipping token upgrade flow.",  buf,  2u);
  }

  if (v7)
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7034LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
LABEL_8:
  }
}

- (id)_fetchDependentAuthTokenForAltDSID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appleIDAccountWithAltDSID:v3]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dependentAuthTokenForAccount:v5]);
  }

  else
  {
    uint64_t v7 = _AKLogSystem(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100141924((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (void)_performTokenUpgradeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Attempting Upgrade Token request with altDSID %@...",  buf,  0xCu);
  }

  uint64_t v11 = objc_alloc(&OBJC_CLASS___AKTokenUpgradeRequestProvider);
  uint64_t v12 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v11,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyTokenUpgrade);
  -[AKURLRequestProviderImpl setClient:](v12, "setClient:", self->_client);
  uint64_t v13 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B3F24;
  v15[3] = &unk_1001C6C28;
  id v16 = v7;
  id v14 = v7;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v13, "executeRequestWithCompletion:", v15);
}

- (void).cxx_destruct
{
}

@end