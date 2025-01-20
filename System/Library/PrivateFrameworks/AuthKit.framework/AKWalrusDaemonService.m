@interface AKWalrusDaemonService
- (AKClient)client;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (id)exportedProtocol;
- (id)serviceName;
- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)configureExportedInterface:(id)a3;
- (void)postWalrusStateUpdateToServerWithContext:(id)a3 urlBagKey:(id)a4 username:(id)a5 password:(id)a6 completion:(id)a7;
- (void)removeAllPCSAuthCredentialWithCompletion:(id)a3;
- (void)verifyEnableWalrusAllowedWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKWalrusDaemonService

- (id)serviceName
{
  return AKWalrusMachService;
}

- (id)exportedProtocol
{
  return &OBJC_PROTOCOL___AKWalrusDaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  id v3 = a3;
  v51[0] = objc_opt_class(&OBJC_CLASS___AKPCSAuthContext, v4, v5, v6);
  v51[1] = objc_opt_class(&OBJC_CLASS___NSData, v7, v8, v9);
  v51[2] = objc_opt_class(&OBJC_CLASS___NSDate, v10, v11, v12);
  v51[3] = objc_opt_class(&OBJC_CLASS___NSDictionary, v13, v14, v15);
  v51[4] = objc_opt_class(&OBJC_CLASS___NSError, v16, v17, v18);
  v51[5] = objc_opt_class(&OBJC_CLASS___NSNull, v19, v20, v21);
  v51[6] = objc_opt_class(&OBJC_CLASS___NSString, v22, v23, v24);
  v51[7] = objc_opt_class(&OBJC_CLASS___NSXPCListenerEndpoint, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 8LL));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));

  v50[0] = objc_opt_class(&OBJC_CLASS___NSData, v30, v31, v32);
  v50[1] = objc_opt_class(&OBJC_CLASS___NSDate, v33, v34, v35);
  v50[2] = objc_opt_class(&OBJC_CLASS___NSDictionary, v36, v37, v38);
  v50[3] = objc_opt_class(&OBJC_CLASS___NSError, v39, v40, v41);
  v50[4] = objc_opt_class(&OBJC_CLASS___NSNull, v42, v43, v44);
  v50[5] = objc_opt_class(&OBJC_CLASS___NSString, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 6LL));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v48));

  [v3 setClasses:v29 forSelector:"PCSAuthContextForWebSessionIdentifier:serviceName:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v49 forSelector:"PCSAuthContextForWebSessionIdentifier:serviceName:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v29 forSelector:"removeAllPCSAuthCredentialWithCompletion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v49 forSelector:"removeAllPCSAuthCredentialWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v29 forSelector:"verifyEnableWalrusAllowedWithContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v29 forSelector:"postWalrusStateUpdateToServerWithContext:urlBagKey:username:password:completion:" argumentIndex:0 ofReply:1];
}

- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10001A584;
  uint64_t v21 = sub_10001A594;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___AKPCSAuthController);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AKWebSessionPCSKeyProvider sharedInstance]( &OBJC_CLASS___AKWebSessionPCSKeyProvider,  "sharedInstance"));
  uint64_t v22 = -[AKPCSAuthController initWithPCSKeyProvider:](v10, "initWithPCSKeyProvider:", v11);

  uint64_t v12 = (void *)v18[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001A59C;
  v14[3] = &unk_1001C6CB0;
  uint64_t v16 = &v17;
  id v13 = v9;
  id v15 = v13;
  [v12 PCSAuthContextForWebSessionIdentifier:v7 serviceName:v8 completion:v14];

  _Block_object_dispose(&v17, 8);
}

- (void)removeAllPCSAuthCredentialWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___AKPCSAuthController);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKWebSessionPCSKeyProvider sharedInstance]( &OBJC_CLASS___AKWebSessionPCSKeyProvider,  "sharedInstance"));
  uint64_t v6 = -[AKPCSAuthController initWithPCSKeyProvider:](v4, "initWithPCSKeyProvider:", v5);

  -[AKPCSAuthController removeAllPCSAuthCredential](v6, "removeAllPCSAuthCredential");
  v3[2](v3, 0LL);
}

- (void)verifyEnableWalrusAllowedWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  if (v8)
  {
    id v9 = objc_alloc(&OBJC_CLASS___AKWalrusRequestProvider);
    uint64_t v10 = -[AKWalrusRequestProvider initWithContext:urlBagKey:]( v9,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianDataRecoveryServiceDisable);
    uint64_t v11 = v10;
    if (self->_client) {
      -[AKURLRequestProviderImpl setClient:](v10, "setClient:");
    }
    uint64_t v12 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v11);
    id v13 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
    [v13 setForceSilentAuth:1];
    -[AKServiceControllerImpl setAuthenticationDelegate:](v12, "setAuthenticationDelegate:", v13);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001A814;
    v16[3] = &unk_1001C6C28;
    id v17 = v7;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v12, "executeRequestWithCompletion:", v16);
  }

  else
  {
    uint64_t v14 = _AKLogSystem(v8);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10012DCB4();
    }

    uint64_t v11 = (AKWalrusRequestProvider *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, AKWalrusRequestProvider *))v7 + 2))(v7, v11);
  }
}

- (void)postWalrusStateUpdateToServerWithContext:(id)a3 urlBagKey:(id)a4 username:(id)a5 password:(id)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  BOOL v13 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  if (v13)
  {
    uint64_t v14 = -[AKWalrusRequestProvider initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKWalrusRequestProvider),  "initWithContext:urlBagKey:",  v10,  v11);
    uint64_t v22 = @"success";
    uint64_t v23 = @"1";
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    -[AKURLRequestProviderImpl setAuthKitBody:](v14, "setAuthKitBody:", v15);

    if (self->_client) {
      -[AKURLRequestProviderImpl setClient:](v14, "setClient:");
    }
    uint64_t v16 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v14);
    id v17 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
    [v17 setForceSilentAuth:1];
    -[AKServiceControllerImpl setAuthenticationDelegate:](v16, "setAuthenticationDelegate:", v17);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10001AAB0;
    v20[3] = &unk_1001C6C28;
    id v21 = v12;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v16, "executeRequestWithCompletion:", v20);
  }

  else
  {
    uint64_t v18 = _AKLogSystem(v13);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10012DCB4();
    }

    uint64_t v14 = (AKWalrusRequestProvider *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, AKWalrusRequestProvider *))v12 + 2))(v12, v14);
  }
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKWalrusDaemonService;
  BOOL v5 = -[AKWalrusDaemonService shouldAcceptNewConnection:](&v9, "shouldAcceptNewConnection:", v4);
  if (v5)
  {
    id v6 = -[AKClient initWithConnection:](objc_alloc(&OBJC_CLASS___AKClient), "initWithConnection:", v4);
    client = self->_client;
    self->_client = v6;
  }

  return v5;
}

- (AKClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end