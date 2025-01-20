@interface AKApplicationAuthorizationController
- (AKApplicationAuthorizationController)init;
- (AKApplicationAuthorizationController)initWithStoreManager:(id)a3;
- (AKApplicationAuthorizationController)initWithStoreManager:(id)a3 sharedAccountsStorageController:(id)a4;
- (BOOL)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 error:(id *)a4;
- (id)currentAuthorizationListVersionWithAltDSID:(id)a3;
- (void)_broadcastCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4;
- (void)_broadcastCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4 withHandlerBundleID:(id)a5;
- (void)_credentialStateDidChange:(int64_t)a3 forApplicationWithClientID:(id)a4;
- (void)_notifyCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4;
- (void)_processCredentialStateChanges:(id)a3;
- (void)_processCredentialStateChanges:(id)a3 completion:(id)a4;
- (void)removeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5;
- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4;
- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
@end

@implementation AKApplicationAuthorizationController

- (AKApplicationAuthorizationController)init
{
  return -[AKApplicationAuthorizationController initWithStoreManager:](self, "initWithStoreManager:", 0LL);
}

- (AKApplicationAuthorizationController)initWithStoreManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKApplicationAuthorizationController;
  v5 = -[AKApplicationAuthorizationController init](&v9, "init");
  if (v5)
  {
    if (v4) {
      v6 = (AKAuthorizationStoreManager *)v4;
    }
    else {
      v6 = (AKAuthorizationStoreManager *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationStoreManager sharedInstance]( &OBJC_CLASS___AKAuthorizationStoreManager,  "sharedInstance"));
    }
    storeManager = v5->_storeManager;
    v5->_storeManager = v6;
  }

  return v5;
}

- (AKApplicationAuthorizationController)initWithStoreManager:(id)a3 sharedAccountsStorageController:(id)a4
{
  id v7 = a4;
  v8 = -[AKApplicationAuthorizationController initWithStoreManager:](self, "initWithStoreManager:", a3);
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_sharedAccountsStorageController, a4);
  }

  return v9;
}

- (id)currentAuthorizationListVersionWithAltDSID:(id)a3
{
  return -[AKAuthorizationStoreManager fetchAuthorizationListVersionWithAltDSID:]( self->_storeManager,  "fetchAuthorizationListVersionWithAltDSID:",  a3);
}

- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  storeManager = self->_storeManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007D4FC;
  v11[3] = &unk_1001C89A0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  -[AKAuthorizationStoreManager updateAuthorizationListWithMetadataInfo:withAltDSID:completion:]( storeManager,  "updateAuthorizationListWithMetadataInfo:withAltDSID:completion:",  a3,  a4,  v11);
}

- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4
{
  storeManager = self->_storeManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007D5C0;
  v5[3] = &unk_1001C9180;
  v5[4] = self;
  -[AKAuthorizationStoreManager updateAuthorizationListWithMetadataInfo:withAltDSID:completion:]( storeManager,  "updateAuthorizationListWithMetadataInfo:withAltDSID:completion:",  a3,  a4,  v5);
}

- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5
{
  storeManager = self->_storeManager;
  id v9 = a5;
  -[AKAuthorizationStoreManager storeAuthorization:withAltDSID:forClient:]( storeManager,  "storeAuthorization:withAltDSID:forClient:",  a3,  a4,  v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 bundleID]);

  -[AKApplicationAuthorizationController _credentialStateDidChange:forApplicationWithClientID:]( self,  "_credentialStateDidChange:forApplicationWithClientID:",  1LL,  v10);
}

- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storeManager = self->_storeManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007D6FC;
  v11[3] = &unk_1001C7EC8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[AKAuthorizationStoreManager revokeAuthorizationForApplicationWithClientID:completion:]( storeManager,  "revokeAuthorizationForApplicationWithClientID:completion:",  v10,  v11);
}

- (void)removeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
}

- (BOOL)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10007D878;
  v15 = sub_10007D888;
  id v16 = 0LL;
  storeManager = self->_storeManager;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10007D890;
  v10[3] = &unk_1001C99A8;
  v10[4] = self;
  v10[5] = &v11;
  -[AKAuthorizationStoreManager revokeAuthorizationForAllApplicationsWithAltDSID:completion:]( storeManager,  "revokeAuthorizationForAllApplicationsWithAltDSID:completion:",  v6,  v10);
  if (a4) {
    *a4 = (id) v12[5];
  }
  -[AKAuthorizationStoreManager setListVersionToVersion:withAltDSID:]( self->_storeManager,  "setListVersionToVersion:withAltDSID:",  @"0",  v6);
  BOOL v8 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)_processCredentialStateChanges:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10007D934;
  v3[3] = &unk_1001C99F8;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)_processCredentialStateChanges:(id)a3 completion:(id)a4
{
  id v7 = a4;
  -[AKApplicationAuthorizationController _processCredentialStateChanges:](self, "_processCredentialStateChanges:", a3);
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1LL, 0LL);
    id v6 = v7;
  }
}

- (void)_credentialStateDidChange:(int64_t)a3 forApplicationWithClientID:(id)a4
{
  id v6 = a4;
  -[AKApplicationAuthorizationController _notifyCredentialStateChange:forApplicationWithClientID:]( self,  "_notifyCredentialStateChange:forApplicationWithClientID:",  a3,  v6);
  -[AKApplicationAuthorizationController _broadcastCredentialStateChange:forApplicationWithClientID:]( self,  "_broadcastCredentialStateChange:forApplicationWithClientID:",  a3,  v6);
}

- (void)_notifyCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationConnectionManager sharedManager]( &OBJC_CLASS___AKAuthorizationConnectionManager,  "sharedManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 remoteObjectProxyWithProtocol:&OBJC_PROTOCOL___AKAuthorizationNotificationHandler forBundleID:v5 errorHandler:&stru_1001C9A18]);

  if (v7)
  {
    uint64_t v10 = _AKLogSiwa(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v5;
      __int16 v16 = 1024;
      int v17 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Notifying client (%@) of credential state change %d.",  buf,  0x12u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007DC18;
    v12[3] = &unk_1001C78A8;
    id v13 = v5;
    [v7 credentialStateDidChange:a3 completion:v12];
  }
}

- (void)_broadcastCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationConnectionManager sharedManager]( &OBJC_CLASS___AKAuthorizationConnectionManager,  "sharedManager"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 bundleIDs]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10007DDB8;
  v10[3] = &unk_1001C9A40;
  id v11 = v6;
  int64_t v12 = a3;
  v10[4] = self;
  id v8 = v6;
  [v9 enumerateObjectsUsingBlock:v10];
}

- (void)_broadcastCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4 withHandlerBundleID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationConnectionManager sharedManager]( &OBJC_CLASS___AKAuthorizationConnectionManager,  "sharedManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 remoteObjectProxyWithProtocol:&OBJC_PROTOCOL___AKAuthorizationStateBroadcastHandler forBundleID:v8 errorHandler:&stru_1001C9A60]);

  if (v10)
  {
    uint64_t v13 = _AKLogSiwa(v11, v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      id v16 = v8;
      __int16 v17 = 1024;
      int v18 = a3;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Notifying client (%@) of credential state change (%d) for client ID (%@).",  (uint8_t *)&v15,  0x1Cu);
    }

    [v10 credentialStateDidChange:a3 forApplicationWithClientID:v7];
  }
}

- (void).cxx_destruct
{
}

@end