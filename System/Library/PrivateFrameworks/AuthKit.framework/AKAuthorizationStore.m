@interface AKAuthorizationStore
- (AKAuthorizationStore)init;
- (AKAuthorizationStore)initWithExecutor:(id)a3;
- (AKAuthorizationStore)initWithPath:(id)a3;
- (AKSQLiteExecutor)executor;
- (BOOL)_shouldUpdateDatabaseToListVersion:(id)a3 withAltDSID:(id)a4;
- (id)_fetchAllAuthorizedClientIDs;
- (id)_fetchAppMetadataForClientID:(id)a3;
- (id)_fetchApplicationsForTeamID:(id)a3;
- (id)_handleRevokedApplicationsForVersion:(id)a3;
- (id)_optionalValueWithString:(id)a3;
- (id)fetchAuthorizationListVersionWithAltDSID:(id)a3;
- (void)_addTemporaryDeveloperTeam:(id)a3;
- (void)_postApplicationsListChangedNotification;
- (void)_setDatabaseVersionWithAltDSID:(id)a3 toVersion:(int64_t)a4;
- (void)_storeConsentedApplication:(id)a3 teamID:(id)a4 listVersion:(id)a5;
- (void)_storeDeveloperTeam:(id)a3 listVersion:(id)a4;
- (void)_storePrimaryAppAMSMetadata:(id)a3;
- (void)clearDatabaseWithAltDSID:(id)a3 error:(id *)a4;
- (void)fetchAllDeveloperTeamsAndApplicationsForAltDSID:(id)a3 withCompletion:(id)a4;
- (void)fetchAllPrimaryApplicationMetadataForAltDSID:(id)a3 withCompletion:(id)a4;
- (void)fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)perform:(id)a3;
- (void)performUnsafeVerificationWithUserID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)removeApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)setExecutor:(id)a3;
- (void)setListVersionToVersion:(id)a3 withAltDSID:(id)a4;
- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5;
- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)updatePrimaryAppsWithAMSAppMetadata:(id)a3 withAltDSID:(id)a4 withCompletion:(id)a5;
@end

@implementation AKAuthorizationStore

- (AKAuthorizationStore)init
{
  return -[AKAuthorizationStore initWithPath:]( self,  "initWithPath:",  @"/Library/Application Support/com.apple.akd/authorization.db");
}

- (AKAuthorizationStore)initWithExecutor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKAuthorizationStore;
  v6 = -[AKAuthorizationStore init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_executor, a3);
  }

  return v7;
}

- (AKAuthorizationStore)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKAuthorizationStore;
  id v5 = -[AKAuthorizationStore init](&v10, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationStoreMigrator);
    v7 = -[AKSQLiteExecutor initWithDatabasePath:migrationController:]( objc_alloc(&OBJC_CLASS___AKSQLiteExecutor),  "initWithDatabasePath:migrationController:",  v4,  v6);
    executor = v5->_executor;
    v5->_executor = v7;
  }

  return v5;
}

- (void)perform:(id)a3
{
}

- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void *, void))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 authorizedAppListVersion]);
  BOOL v12 = -[AKAuthorizationStore _shouldUpdateDatabaseToListVersion:withAltDSID:]( self,  "_shouldUpdateDatabaseToListVersion:withAltDSID:",  v11,  v9);
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _fetchAllAuthorizedClientIDs](self, "_fetchAllAuthorizedClientIDs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 teams]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allValues]);
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_100065AD0;
    v28 = &unk_1001C9018;
    id v18 = v15;
    id v29 = v18;
    v30 = self;
    id v19 = v11;
    id v31 = v19;
    [v17 enumerateObjectsUsingBlock:&v25];

    v20 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationStore _handleRevokedApplicationsForVersion:]( self,  "_handleRevokedApplicationsForVersion:",  v19,  v25,  v26,  v27,  v28));
    -[AKAuthorizationStore setListVersionToVersion:withAltDSID:](self, "setListVersionToVersion:withAltDSID:", v19, v9);
    v32[0] = &off_1001D8DA0;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 allObjects]);
    v32[1] = &off_1001D8DB8;
    v33[0] = v21;
    v33[1] = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));

    if (v10) {
      v10[2](v10, v22, 0LL);
    }
  }

  else
  {
    uint64_t v23 = _AKLogSiwa(v12, v13);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1001377B0(v24);
    }

    if (v10) {
      v10[2](v10, 0LL, 0LL);
    }
  }
}

- (void)updatePrimaryAppsWithAMSAppMetadata:(id)a3 withAltDSID:(id)a4 withCompletion:(id)a5
{
  id v9 = a3;
  v7 = (void (**)(id, uint64_t, void))a5;
  if ([v9 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100065CC4;
    v10[3] = &unk_1001C9040;
    v10[4] = self;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
    if (v7) {
      v7[2](v7, 1LL, 0LL);
    }
  }

  else if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSQLErrorDomain,  -6002LL,  0LL));
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0LL, v8);
  }
}

- (void)fetchAllPrimaryApplicationMetadataForAltDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT client_id, app_name, app_developer_name, adam_id FROM authorized_primary_applications"));
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100065EF0;
  uint64_t v26 = sub_100065F00;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_100065EF0;
  v20 = sub_100065F00;
  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100065F08;
  v15[3] = &unk_1001C66B8;
  v15[4] = &v16;
  [v8 setRowHandler:v15];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100066008;
  v10[3] = &unk_1001C66E0;
  objc_copyWeak(&v13, &location);
  id v9 = v8;
  id v11 = v9;
  BOOL v12 = &v22;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v10);
  if (v23[5]) {
    v7[2](v7, 0LL);
  }
  else {
    v7[2](v7, v17[5]);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)_postApplicationsListChangedNotification
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v3 = [v2 isSiwaInPasswordsFeatureEnabled];

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v4 postNotificationName:AKSignInWithAppleAccountsListChangedNotification object:0 userInfo:0 deliverImmediately:1];
  }

- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizedRequest]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___AKAuthorizationRequest, v10);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v11);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v8 bundleID]);
    if (v15
      && (v17 = (void *)v15,
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 teamID]),
          v18,
          v17,
          v18))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizedRequest]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v7 credential]);
      id v21 = objc_alloc_init(&OBJC_CLASS___AKDeveloperTeam);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 teamID]);
      [v21 setTeamID:v22];

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 userIdentifier]);
      [v21 setUserIdentifier:v23];

      id v24 = objc_alloc_init(&OBJC_CLASS___AKConsentedApplication);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
      [v24 setClientID:v25];

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v19 requestedScopes]);
      [v24 setScopes:v26];

      id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
      v45 = v27;
      id v46 = v24;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
      [v21 setApps:v28];

      -[AKAuthorizationStore _addTemporaryDeveloperTeam:](self, "_addTemporaryDeveloperTeam:", v21);
    }

    else
    {
      uint64_t v37 = _AKLogSiwa(v15, v16);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_1001377EC((os_log_s *)v19, v38, v39, v40, v41, v42, v43, v44);
      }
    }
  }

  else
  {
    uint64_t v29 = _AKLogSiwa(v13, v14);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
      sub_10013781C((os_log_s *)v19, v30, v31, v32, v33, v34, v35, v36);
    }
  }
}

- (void)fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if (v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT team_id, uid FROM authorized_teams WHERE team_id = ?"));
    uint64_t v34 = 0LL;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000LL;
    uint64_t v37 = sub_100065EF0;
    uint64_t v38 = sub_100065F00;
    id v39 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000LL;
    uint64_t v31 = sub_100065EF0;
    uint64_t v32 = sub_100065F00;
    id v33 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    v25 = sub_100065EF0;
    uint64_t v26 = sub_100065F00;
    id v27 = 0LL;
    id obj = 0LL;
    [v11 bindParameter:v8 error:&obj];
    objc_storeStrong(&v39, obj);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000666CC;
    v20[3] = &unk_1001C9068;
    v20[4] = &v28;
    v20[5] = &v22;
    [v11 setRowHandler:v20];
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100066774;
    v15[3] = &unk_1001C66E0;
    objc_copyWeak(&v18, &location);
    id v12 = v11;
    id v16 = v12;
    v17 = &v34;
    +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v15);
    if (v35[5])
    {
      v10[2](v10, 0LL);
    }

    else
    {
      if (v29[5] || v23[5])
      {
        id v13 = objc_alloc_init(&OBJC_CLASS___AKDeveloperTeam);
        [v13 setTeamID:v29[5]];
        [v13 setUserIdentifier:v23[5]];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _fetchApplicationsForTeamID:](self, "_fetchApplicationsForTeamID:", v8));
        [v13 setApps:v14];

        ((void (*)(void (**)(id, void), id, void))v10[2])(v10, v13, 0LL);
      }

      else
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSQLErrorDomain,  -6003LL,  0LL));
        ((void (*)(void (**)(id, void), void, id))v10[2])(v10, 0LL, v13);
      }
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSQLErrorDomain,  -6002LL,  0LL));
    ((void (*)(void (**)(id, void), void, id))v10[2])(v10, 0LL, v12);
  }
}

- (void)fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if (v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT team_id FROM authorized_applications WHERE client_id = ?"));
    uint64_t v32 = 0LL;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000LL;
    uint64_t v35 = sub_100065EF0;
    uint64_t v36 = sub_100065F00;
    id v37 = 0LL;
    uint64_t v26 = 0LL;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    uint64_t v29 = sub_100065EF0;
    uint64_t v30 = sub_100065F00;
    id v31 = 0LL;
    id obj = 0LL;
    [v11 bindParameter:v8 error:&obj];
    objc_storeStrong(&v37, obj);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100066ABC;
    v24[3] = &unk_1001C66B8;
    v24[4] = &v26;
    [v11 setRowHandler:v24];
    objc_initWeak(&location, self);
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    id v18 = sub_100066B20;
    id v19 = &unk_1001C66E0;
    objc_copyWeak(&v22, &location);
    id v12 = v11;
    id v20 = v12;
    id v21 = &v32;
    +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", &v16);
    if (v33[5])
    {
      v10[2](v10, 0LL);
    }

    else
    {
      uint64_t v14 = v27[5];
      if (v14)
      {
        -[AKAuthorizationStore fetchDeveloperTeamWithTeamID:withAltDSID:completion:]( self,  "fetchDeveloperTeamWithTeamID:withAltDSID:completion:",  v14,  v9,  v10,  v16,  v17,  v18,  v19);
      }

      else
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSQLErrorDomain,  -6003LL,  0LL,  v16,  v17,  v18,  v19));
        ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0LL, v15);
      }
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSQLErrorDomain,  -6002LL,  0LL));
    ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0LL, v13);
  }
}

- (void)performUnsafeVerificationWithUserID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT team_id FROM authorized_teams WHERE uid = ?"));
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = sub_100065EF0;
  v24[4] = sub_100065F00;
  id v25 = 0LL;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  id obj = 0LL;
  [v11 bindParameter:v8 error:&obj];
  objc_storeStrong(&v25, obj);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100066DB0;
  v18[3] = &unk_1001C66B8;
  v18[4] = &v20;
  [v11 setRowHandler:v18];
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100066DF8;
  v13[3] = &unk_1001C66E0;
  objc_copyWeak(&v16, &location);
  id v12 = v11;
  id v14 = v12;
  uint64_t v15 = v24;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v13);
  v10[2](v10, *((unsigned __int8 *)v21 + 24));

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
}

- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"UPDATE authorized_applications SET credential_state = ? WHERE client_id = ?"));
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    uint64_t v24 = sub_100065EF0;
    id v25 = sub_100065F00;
    id v26 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v9, v6, 0LL));
    uint64_t v11 = (id *)(v22 + 5);
    id obj = (id)v22[5];
    [v8 bindParameters:v10 error:&obj];
    objc_storeStrong(v11, obj);
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000670B8;
    v15[3] = &unk_1001C66E0;
    objc_copyWeak(&v18, &location);
    id v12 = v8;
    id v16 = v12;
    uint64_t v17 = &v21;
    +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v15);
    id v13 = (void (*)(void *, uint64_t))v7[2];
    if (v22[5]) {
      v13(v7, 0LL);
    }
    else {
      v13(v7, 1LL);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v21, 8);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSQLErrorDomain,  -6002LL,  0LL));
    ((void (*)(void *, void, void *))v7[2])(v7, 0LL, v14);
  }
}

- (void)removeApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = (void (**)(void, void, void))v7;
  if (v6)
  {
    uint64_t v10 = _AKLogSiwa(v7, v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to delete application with clientID: %@ from DB",  (uint8_t *)&buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"DELETE FROM authorized_applications WHERE client_id = ?"));
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x3032000000LL;
    id v33 = sub_100065EF0;
    uint64_t v34 = sub_100065F00;
    id v35 = 0LL;
    id obj = 0LL;
    [v12 bindParameter:v6 error:&obj];
    objc_storeStrong(&v35, obj);
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10006743C;
    v23[3] = &unk_1001C66E0;
    objc_copyWeak(&v26, &location);
    id v13 = v12;
    id v24 = v13;
    p___int128 buf = &buf;
    id v14 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v23);
    uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40LL);
    if (v16)
    {
      uint64_t v17 = _AKLogSiwa(v14, v15);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10013784C((uint64_t)v6, (uint64_t)&buf + 8, v18);
      }

      uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40LL);
    }

    else
    {
      uint64_t v21 = _AKLogSiwa(v14, v15);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v29 = 138412290;
        id v30 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Application with clientID: %@ removed from database successfully",  v29,  0xCu);
      }

      uint64_t v19 = 0LL;
    }

    ((void (**)(void, BOOL, uint64_t))v9)[2](v9, v16 == 0, v19);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKSQLErrorDomain,  -6002LL,  0LL));
    ((void (**)(void, void, void *))v9)[2](v9, 0LL, v20);
  }
}

- (void)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"UPDATE authorized_applications SET credential_state = ?, authorizedAppListVersion = 'TEMPORARY'"));
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_100065EF0;
  id v31 = sub_100065F00;
  id v32 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
  uint64_t v10 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  [v8 bindParameter:v9 error:&obj];
  objc_storeStrong(v10, obj);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _fetchAllAuthorizedClientIDs](self, "_fetchAllAuthorizedClientIDs"));
  objc_initWeak(&location, self);
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  uint64_t v20 = sub_100067754;
  uint64_t v21 = &unk_1001C66E0;
  objc_copyWeak(&v24, &location);
  id v12 = v8;
  id v22 = v12;
  uint64_t v23 = &v27;
  id v13 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", &v18);
  if (v28[5])
  {
    uint64_t v15 = _AKLogSiwa(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1001378CC();
    }

    if (v7) {
      v7[2](v7, 0LL, v28[5]);
    }
  }

  else
  {
    id v33 = &off_1001D8DB8;
    uint64_t v34 = v11;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL,  v18,  v19,  v20,  v21));
    if (v7) {
      ((void (**)(id, void *, uint64_t))v7)[2](v7, v17, 0LL);
    }
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v27, 8);
}

- (void)fetchAllDeveloperTeamsAndApplicationsForAltDSID:(id)a3 withCompletion:(id)a4
{
  id v21 = a3;
  id v6 = (void (**)(id, void, uint64_t))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT team_id, uid, private_email FROM authorized_teams"));
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  uint64_t v42 = sub_100065EF0;
  uint64_t v43 = sub_100065F00;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = sub_100065EF0;
  id v37 = sub_100065F00;
  uint64_t v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  void v32[2] = sub_100067B40;
  v32[3] = &unk_1001C66B8;
  v32[4] = &v33;
  [v7 setRowHandler:v32];
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100067C10;
  v27[3] = &unk_1001C66E0;
  id v22 = &v30;
  objc_copyWeak(&v30, &location);
  id v8 = v7;
  id v28 = v8;
  uint64_t v29 = &v39;
  id v9 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v27);
  if (v40[5])
  {
    uint64_t v11 = _AKLogSiwa(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10013792C();
    }

    v6[2](v6, 0LL, v40[5]);
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v13 = (id)v34[5];
    id v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v45, 16, v21, &v30);
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 teamID]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationStore _fetchApplicationsForTeamID:]( self,  "_fetchApplicationsForTeamID:",  v18));
          [v17 setApps:v19];
        }

        id v14 = [v13 countByEnumeratingWithState:&v23 objects:v45 count:16];
      }

      while (v14);
    }

    id v20 = [(id)v34[5] copy];
    ((void (**)(id, id, uint64_t))v6)[2](v6, v20, 0LL);
  }

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

- (id)_fetchAppMetadataForClientID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT client_id, app_name, app_developer_name, adam_id FROM authorized_primary_applications WHERE client_id = ?"));
  uint64_t v27 = 0LL;
  id v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_100065EF0;
  id v31 = sub_100065F00;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  __int128 v24 = sub_100065EF0;
  __int128 v25 = sub_100065F00;
  id v26 = objc_alloc_init(&OBJC_CLASS___AKAppiTunesMetadata);
  id v6 = v28;
  id obj = v28[5];
  [v5 bindParameter:v4 error:&obj];
  objc_storeStrong(v6 + 5, obj);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100067ED8;
  v19[3] = &unk_1001C66B8;
  v19[4] = &v21;
  [v5 setRowHandler:v19];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100067FD4;
  v14[3] = &unk_1001C66E0;
  objc_copyWeak(&v17, &location);
  id v7 = v5;
  id v15 = v7;
  uint64_t v16 = &v27;
  id v8 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v14);
  if (v28[5])
  {
    uint64_t v10 = _AKLogSiwa(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10013798C();
    }
  }

  id v12 = (id)v22[5];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v12;
}

- (void)_addTemporaryDeveloperTeam:(id)a3
{
}

- (BOOL)_shouldUpdateDatabaseToListVersion:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationStore fetchAuthorizationListVersionWithAltDSID:]( self,  "fetchAuthorizationListVersionWithAltDSID:",  a4));
  LOBYTE(self) = [v6 isEqualToString:v7];

  return self ^ 1;
}

- (void)_storeDeveloperTeam:(id)a3 listVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"INSERT OR REPLACE INTO authorized_teams (team_id, uid, private_email) VALUES (?, ?,?)"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 teamID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentifier]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 privateEmail]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v9, v10, v11, 0LL));

  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_100065EF0;
  id v32 = sub_100065F00;
  id v33 = 0LL;
  id obj = 0LL;
  [v8 bindParameters:v12 error:&obj];
  objc_storeStrong(&v33, obj);
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100068358;
  v22[3] = &unk_1001C66E0;
  objc_copyWeak(&v25, &location);
  id v13 = v8;
  id v23 = v13;
  __int128 v24 = &v28;
  id v14 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v22);
  if (v29[5])
  {
    uint64_t v16 = _AKLogSiwa(v14, v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001379EC();
    }
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 apps]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000683C8;
    v19[3] = &unk_1001C9090;
    v19[4] = self;
    id v20 = v6;
    id v21 = v7;
    [v18 enumerateKeysAndObjectsUsingBlock:v19];
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v28, 8);
}

- (void)_storeConsentedApplication:(id)a3 teamID:(id)a4 listVersion:(id)a5
{
  id v8 = a3;
  id v31 = a4;
  id v30 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopes]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsJoinedByString:@","]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v10));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 transferState]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v11));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryClientID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 origin]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v14));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 clientName]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v17));

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"INSERT OR REPLACE INTO authorized_applications (client_id, team_id, scopes, origin, credential_state, transfer_state, primary_client_id, authorizedAppListVersion, creation_date, client_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 clientID]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v20,  v31,  v29,  v15,  v16,  v28,  v13,  v30,  v21,  v18,  0LL));

  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  uint64_t v41 = sub_100065EF0;
  uint64_t v42 = sub_100065F00;
  id v43 = 0LL;
  id v37 = 0LL;
  [v19 bindParameters:v22 error:&v37];
  objc_storeStrong(&v43, v37);
  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  void v32[2] = sub_1000687AC;
  v32[3] = &unk_1001C66E0;
  objc_copyWeak(&v35, &location);
  id v23 = v19;
  id v33 = v23;
  uint64_t v34 = &v38;
  id v24 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v32);
  if (v39[5])
  {
    uint64_t v26 = _AKLogSiwa(v24, v25);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100137A4C();
    }
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v38, 8);
}

- (void)_storePrimaryAppAMSMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _AKLogSiwa(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100137B10(v4, v7);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleId]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 appName]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 appDeveloperName]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 adamID]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStore _optionalValueWithString:](self, "_optionalValueWithString:", v14));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"INSERT OR REPLACE INTO authorized_primary_applications (client_id, app_name, app_developer_name, adam_id) VALUES (?, ?, ?, ?)"));
  uint64_t v31 = 0LL;
  v32[0] = &v31;
  v32[1] = 0x3032000000LL;
  void v32[2] = sub_100065EF0;
  v32[3] = sub_100065F00;
  id v33 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v9, v11, v13, v15, 0LL));
  id v18 = (id *)(v32[0] + 40LL);
  id obj = *(id *)(v32[0] + 40LL);
  [v16 bindParameters:v17 error:&obj];
  objc_storeStrong(v18, obj);
  objc_initWeak(&location, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100068B2C;
  v25[3] = &unk_1001C66E0;
  objc_copyWeak(&v28, &location);
  id v19 = v16;
  id v26 = v19;
  uint64_t v27 = &v31;
  id v20 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v25);
  if (*(void *)(v32[0] + 40LL))
  {
    uint64_t v22 = _AKLogSiwa(v20, v21);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleId]);
      sub_100137AAC(v24, (uint64_t)v32, (uint64_t)v34, v23);
    }
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v31, 8);
}

- (id)_handleRevokedApplicationsForVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT client_id FROM authorized_applications WHERE authorizedAppListVersion != ? AND authorizedAppListVersion != 'TEMPORARY'"));
  uint64_t v39 = 0LL;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000LL;
  uint64_t v42 = sub_100065EF0;
  id v43 = sub_100065F00;
  id v44 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = v40;
  id v38 = v40[5];
  [v5 bindParameter:v4 error:&v38];
  objc_storeStrong(v7 + 5, v38);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100068F20;
  v36[3] = &unk_1001C6708;
  id v8 = v6;
  id v37 = v8;
  [v5 setRowHandler:v36];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"UPDATE authorized_applications SET credential_state = ?, authorizedAppListVersion = ? WHERE authorizedAppListVersion != ?"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v10, v4, v4, 0LL));
  id v12 = v40;
  id obj = v40[5];
  [v9 bindParameters:v11 error:&obj];
  objc_storeStrong(v12 + 5, obj);
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100068F70;
  v30[3] = &unk_1001C66E0;
  objc_copyWeak(&v33, &location);
  id v13 = v5;
  id v31 = v13;
  id v32 = &v39;
  id v14 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v30);
  if (v40[5])
  {
    uint64_t v16 = _AKLogSiwa(v14, v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100137C08();
    }
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100068FE0;
  v26[3] = &unk_1001C66E0;
  objc_copyWeak(&v29, &location);
  id v18 = v9;
  id v27 = v18;
  id v28 = &v39;
  id v19 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v26);
  if (v40[5])
  {
    uint64_t v21 = _AKLogSiwa(v19, v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100137BA8();
    }
  }

  id v23 = v27;
  id v24 = v8;

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v39, 8);
  return v24;
}

- (id)_fetchApplicationsForTeamID:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_100065EF0;
  id v32 = sub_100065F00;
  id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT client_id, scopes, credential_state, transfer_state, primary_client_id, origin, creation_date, client_name FROM authorized_applications WHERE team_id = ?"));
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100065EF0;
  id v26 = sub_100065F00;
  id v27 = 0LL;
  id obj = 0LL;
  [v5 bindParameter:v4 error:&obj];
  objc_storeStrong(&v27, obj);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000692D4;
  v20[3] = &unk_1001C66B8;
  v20[4] = &v28;
  [v5 setRowHandler:v20];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100069518;
  v15[3] = &unk_1001C66E0;
  objc_copyWeak(&v18, &location);
  id v6 = v5;
  id v16 = v6;
  id v17 = &v22;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v15);
  id v7 = (void *)v29[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100069588;
  v14[3] = &unk_1001C90B8;
  void v14[4] = self;
  v14[5] = &v28;
  id v8 = [v7 enumerateKeysAndObjectsUsingBlock:v14];
  if (v23[5])
  {
    uint64_t v10 = _AKLogSiwa(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100137C68();
    }
  }

  id v12 = [(id)v29[5] copy];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)_optionalValueWithString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"NULL";
  }

  return v5;
}

- (id)_fetchAllAuthorizedClientIDs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT client_id FROM authorized_applications WHERE credential_state = ?"));
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100065EF0;
  id v29 = sub_100065F00;
  id v30 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  uint64_t v5 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  [v3 bindParameter:v4 error:&obj];
  objc_storeStrong(v5, obj);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100069890;
  v22[3] = &unk_1001C6708;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v23 = v6;
  [v3 setRowHandler:v22];
  objc_initWeak(&location, self);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1000698E8;
  id v17 = &unk_1001C66E0;
  objc_copyWeak(&v20, &location);
  id v7 = v3;
  id v18 = v7;
  id v19 = &v25;
  id v8 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", &v14);
  if (v26[5])
  {
    uint64_t v10 = _AKLogSiwa(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100137CC8();
    }
  }

  id v12 = objc_msgSend(v6, "copy", v14, v15, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (id)fetchAuthorizationListVersionWithAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100065EF0;
  id v18 = sub_100065F00;
  id v19 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT authorizedAppListVersion FROM version;"));
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100069AC0;
  v9[3] = &unk_1001C66E0;
  objc_copyWeak(&v12, &location);
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = &v14;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)setListVersionToVersion:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"UPDATE version SET authorizedAppListVersion = ?"));
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100065EF0;
  uint64_t v24 = sub_100065F00;
  id v25 = 0LL;
  id obj = 0LL;
  [v8 bindParameter:v6 error:&obj];
  objc_storeStrong(&v25, obj);
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100069D48;
  v14[3] = &unk_1001C66E0;
  objc_copyWeak(&v17, &location);
  id v9 = v8;
  id v15 = v9;
  uint64_t v16 = &v20;
  id v10 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v14);
  if (v21[5])
  {
    uint64_t v12 = _AKLogSiwa(v10, v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100137D28();
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);
}

- (void)_setDatabaseVersionWithAltDSID:(id)a3 toVersion:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"UPDATE version SET db_version = ?"));
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100065EF0;
  id v23 = sub_100065F00;
  id v24 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100069F7C;
  v18[3] = &unk_1001C9108;
  v18[4] = &v19;
  void v18[5] = a4;
  [v7 setBindHandler:v18];
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100069FEC;
  v13[3] = &unk_1001C66E0;
  objc_copyWeak(&v16, &location);
  id v8 = v7;
  id v14 = v8;
  id v15 = &v19;
  id v9 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v13);
  if (v20[5])
  {
    uint64_t v11 = _AKLogSiwa(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100137D88();
    }
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v19, 8);
}

- (void)clearDatabaseWithAltDSID:(id)a3 error:(id *)a4
{
  executor = self->_executor;
  id v8 = 0LL;
  -[AKSQLiteExecutor wipeDatabase:](executor, "wipeDatabase:", &v8);
  id v6 = v8;
  id v7 = v6;
  if (a4) {
    *a4 = v6;
  }
}

- (AKSQLiteExecutor)executor
{
  return self->_executor;
}

- (void)setExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end