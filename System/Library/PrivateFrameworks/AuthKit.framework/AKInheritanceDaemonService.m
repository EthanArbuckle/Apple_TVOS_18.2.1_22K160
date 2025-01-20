@interface AKInheritanceDaemonService
- (id)exportedProtocol;
- (id)serviceName;
- (void)_executeRequestWithContext:(id)a3 urlBagKey:(id)a4 shouldSignWithIdentityToken:(BOOL)a5 completion:(id)a6;
- (void)_setupBeneficiaryAliasWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)configureExportedInterface:(id)a3;
- (void)fetchManifestOptionsWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)removeBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)setupBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)updateBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
@end

@implementation AKInheritanceDaemonService

- (id)serviceName
{
  return AKInheritanceMachService;
}

- (id)exportedProtocol
{
  return &OBJC_PROTOCOL___AKInheritanceInterface;
}

- (void)configureExportedInterface:(id)a3
{
  id v3 = a3;
  v33[0] = objc_opt_class(&OBJC_CLASS___AKBeneficiaryManifest, v4);
  v33[1] = objc_opt_class(&OBJC_CLASS___AKBundleInformation, v5);
  v33[2] = objc_opt_class(&OBJC_CLASS___AKInheritanceAccessKey, v6);
  v33[3] = objc_opt_class(&OBJC_CLASS___AKInheritanceContext, v7);
  v33[4] = objc_opt_class(&OBJC_CLASS___AKInheritanceCLIContext, v8);
  v33[5] = objc_opt_class(&OBJC_CLASS___NSArray, v9);
  v33[6] = objc_opt_class(&OBJC_CLASS___NSData, v10);
  v33[7] = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
  v33[8] = objc_opt_class(&OBJC_CLASS___NSNull, v12);
  v33[9] = objc_opt_class(&OBJC_CLASS___NSUUID, v13);
  v33[10] = objc_opt_class(&OBJC_CLASS___NSString, v14);
  v33[11] = objc_opt_class(&OBJC_CLASS___NSValue, v15);
  v33[12] = objc_opt_class(&OBJC_CLASS___NSXPCListenerEndpoint, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 13LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));

  uint64_t v27 = objc_opt_class(&OBJC_CLASS___AKBeneficiaryAliasSetupResult, v19);
  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray, v20);
  uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSData, v21);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSError, v22);
  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNull, v23);
  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 6LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v25, v27, v28, v29, v30, v31));

  [v3 setClasses:v18 forSelector:"fetchManifestOptionsWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v26 forSelector:"fetchManifestOptionsWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v18 forSelector:"setupBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v26 forSelector:"setupBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v18 forSelector:"updateBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v26 forSelector:"updateBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v18 forSelector:"removeBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v26 forSelector:"removeBeneficiaryWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v18 forSelector:"_setupBeneficiaryAliasWithInheritanceContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v26 forSelector:"_setupBeneficiaryAliasWithInheritanceContext:completion:" argumentIndex:0 ofReply:1];
}

- (void)fetchManifestOptionsWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = AKURLBagKeyInheritanceFetchDataSelectionOptionsKey;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10008667C;
  v9[3] = &unk_1001C7B60;
  id v10 = v6;
  id v8 = v6;
  -[AKInheritanceDaemonService _executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:]( self,  "_executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:",  a3,  v7,  0LL,  v9);
}

- (void)setupBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 beneficiarySetupToken]);

  if (v8)
  {
    uint64_t v10 = AKURLBagKeyInheritanceSetupBeneficiaryKey;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100086838;
    v14[3] = &unk_1001C7640;
    id v15 = v6;
    id v16 = v7;
    -[AKInheritanceDaemonService _executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:]( self,  "_executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:",  v15,  v10,  0LL,  v14);

    uint64_t v11 = v15;
LABEL_7:

    goto LABEL_8;
  }

  uint64_t v12 = _AKLogSystem(v9);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10013B8D0(v13);
  }

  if (v7)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7044LL));
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
    goto LABEL_7;
  }

- (void)removeBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AKURLBagKeyInheritanceRemoveBeneficiaryKey;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100086978;
  v11[3] = &unk_1001C7640;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[AKInheritanceDaemonService _executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:]( self,  "_executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:",  v10,  v8,  0LL,  v11);
}

- (void)updateBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AKURLBagKeyInheritanceUpdateBeneficiaryKey;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100086AB8;
  v11[3] = &unk_1001C7640;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[AKInheritanceDaemonService _executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:]( self,  "_executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:",  v10,  v8,  0LL,  v11);
}

- (void)_setupBeneficiaryAliasWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013BA84((uint64_t)v6, v9);
  }

  uint64_t v10 = AKURLBagKeyInheritanceSetupBeneficiaryAliasKey;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100086C28;
  v13[3] = &unk_1001C7640;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  -[AKInheritanceDaemonService _executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:]( self,  "_executeRequestWithContext:urlBagKey:shouldSignWithIdentityToken:completion:",  v12,  v10,  1LL,  v13);
}

- (void)_executeRequestWithContext:(id)a3 urlBagKey:(id)a4 shouldSignWithIdentityToken:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = -[AKInheritanceRequestProvider initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKInheritanceRequestProvider),  "initWithContext:urlBagKey:",  v9,  v10);
  -[AKInheritanceRequestProvider setSignWithIdentityToken:](v12, "setSignWithIdentityToken:", v7);
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x3032000000LL;
  v21[3] = sub_100086F2C;
  v21[4] = sub_100086F3C;
  id v22 = 0LL;
  id v13 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v12);
  id v14 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
  [v14 setForceSilentAuth:1];
  -[AKServiceControllerImpl setAuthenticationDelegate:](v13, "setAuthenticationDelegate:", v14);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100086F44;
  v17[3] = &unk_1001C9C60;
  id v15 = v12;
  v18 = v15;
  uint64_t v20 = v21;
  id v16 = v11;
  id v19 = v16;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v13, "executeRequestWithCompletion:", v17);

  _Block_object_dispose(v21, 8);
}

@end