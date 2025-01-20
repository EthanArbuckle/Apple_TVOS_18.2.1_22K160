@interface AKAuthorizationStoreManager
+ (id)sharedInstance;
- (AKAuthorizationProviding)storeProvider;
- (AKAuthorizationStoreManager)init;
- (NSMutableDictionary)stores;
- (id)fetchAuthorizationListVersionWithAltDSID:(id)a3;
- (id)storeForAltDSID:(id)a3;
- (void)clearDatabaseWithAltDSID:(id)a3 error:(id *)a4;
- (void)fetchAllDeveloperTeamsAndApplicationsForAltDSID:(id)a3 withCompletion:(id)a4;
- (void)fetchAllPrimaryApplicationMetadataForAltDSID:(id)a3 withCompletion:(id)a4;
- (void)fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)performUnsafeVerificationWithUserID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)removeApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)setListVersionToVersion:(id)a3 withAltDSID:(id)a4;
- (void)setStoreProvider:(id)a3;
- (void)setStores:(id)a3;
- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5;
- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)updatePrimaryAppsWithAMSAppMetadata:(id)a3 withAltDSID:(id)a4 withCompletion:(id)a5;
@end

@implementation AKAuthorizationStoreManager

+ (id)sharedInstance
{
  if (qword_10020F258 != -1) {
    dispatch_once(&qword_10020F258, &stru_1001C69D8);
  }
  return (id)qword_10020F250;
}

- (AKAuthorizationStoreManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AKAuthorizationStoreManager;
  v2 = -[AKAuthorizationStoreManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationStoreProvider);
    storeProvider = v2->_storeProvider;
    v2->_storeProvider = (AKAuthorizationProviding *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    stores = v2->_stores;
    v2->_stores = (NSMutableDictionary *)v5;
  }

  return v2;
}

- (id)storeForAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSiwa();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Finding AKAuthorizationStore for altDSID: %@",  (uint8_t *)&v13,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_stores, "objectForKeyedSubscript:", v4));
  if (v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_stores, "objectForKeyedSubscript:", v4));
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeProvider](self, "storeProvider"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v9 storeForAltDSID:v4]);

    if (v4 && v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager stores](self, "stores"));
      [v10 setObject:v8 forKeyedSubscript:v4];
    }

    else
    {
      uint64_t v11 = _AKLogSiwa();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        sub_10012D130((os_log_t)v10);
      }
    }
  }

  return v8;
}

- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v9));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100014D88;
  v15[3] = &unk_1001C6A00;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)updatePrimaryAppsWithAMSAppMetadata:(id)a3 withAltDSID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v9));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100014E80;
  v15[3] = &unk_1001C6A00;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v9));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100014F78;
  v15[3] = &unk_1001C6A28;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v9));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100015070;
  v15[3] = &unk_1001C6A00;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v9));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100015168;
  v15[3] = &unk_1001C6A00;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)performUnsafeVerificationWithUserID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v9));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100015260;
  v15[3] = &unk_1001C6A00;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSIDForAuthKitAccountRequestingAuthorization]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v9));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001535C;
  v13[3] = &unk_1001C6A50;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 perform:v13];
}

- (void)removeApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSIDForAuthKitAccountRequestingAuthorization]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v9));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100015454;
  v13[3] = &unk_1001C6A50;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 perform:v13];
}

- (void)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v6));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001551C;
  v11[3] = &unk_1001C6A50;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 perform:v11];
}

- (void)fetchAllDeveloperTeamsAndApplicationsForAltDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v6));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000155E4;
  v11[3] = &unk_1001C6A50;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 perform:v11];
}

- (void)fetchAllPrimaryApplicationMetadataForAltDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v6));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000156AC;
  v11[3] = &unk_1001C6A50;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 perform:v11];
}

- (id)fetchAuthorizationListVersionWithAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000157C4;
  id v16 = sub_1000157D4;
  id v17 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000157DC;
  v9[3] = &unk_1001C6A78;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 perform:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setListVersionToVersion:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v7));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000158D4;
  v11[3] = &unk_1001C6AA0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 perform:v11];
}

- (void)clearDatabaseWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreManager storeForAltDSID:](self, "storeForAltDSID:", v6));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100015980;
  v9[3] = &unk_1001C6AC8;
  id v10 = v6;
  id v11 = a4;
  id v8 = v6;
  [v7 perform:v9];
}

- (NSMutableDictionary)stores
{
  return self->_stores;
}

- (void)setStores:(id)a3
{
}

- (AKAuthorizationProviding)storeProvider
{
  return self->_storeProvider;
}

- (void)setStoreProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end