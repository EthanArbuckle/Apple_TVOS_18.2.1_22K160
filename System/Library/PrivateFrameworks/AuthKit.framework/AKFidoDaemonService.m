@interface AKFidoDaemonService
- (id)exportedProtocol;
- (id)serviceName;
- (void)configureExportedInterface:(id)a3;
- (void)registerFidoKeyWithContext:(id)a3 completion:(id)a4;
- (void)verifyFidoKeyWithContext:(id)a3 completion:(id)a4;
- (void)verifyFidoKeyWithFidoContext:(id)a3 completion:(id)a4;
- (void)verifyFidoRecoveryWithContext:(id)a3 recoveryToken:(id)a4 completion:(id)a5;
@end

@implementation AKFidoDaemonService

- (id)serviceName
{
  return @"com.apple.ak.puffin.xpc";
}

- (id)exportedProtocol
{
  return &OBJC_PROTOCOL___AKFidoInterface;
}

- (void)configureExportedInterface:(id)a3
{
  id v3 = a3;
  v52[0] = objc_opt_class(&OBJC_CLASS___AKAppleIDAuthenticationContext, v4, v5, v6);
  v52[1] = objc_opt_class(&OBJC_CLASS___AKFidoContext, v7, v8, v9);
  v52[2] = objc_opt_class(&OBJC_CLASS___NSArray, v10, v11, v12);
  v52[3] = objc_opt_class(&OBJC_CLASS___NSData, v13, v14, v15);
  v52[4] = objc_opt_class(&OBJC_CLASS___NSNull, v16, v17, v18);
  v52[5] = objc_opt_class(&OBJC_CLASS___NSNumber, v19, v20, v21);
  v52[6] = objc_opt_class(&OBJC_CLASS___NSString, v22, v23, v24);
  v52[7] = objc_opt_class(&OBJC_CLASS___NSXPCListenerEndpoint, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 8LL));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));

  uint64_t v47 = objc_opt_class(&OBJC_CLASS___AKFidoAuthenticationResponse, v30, v31, v32);
  uint64_t v48 = objc_opt_class(&OBJC_CLASS___AKFidoRegistrationResponse, v33, v34, v35);
  uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSData, v36, v37, v38);
  uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSError, v39, v40, v41);
  uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSNull, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 5LL));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v45, v47, v48, v49, v50));

  [v3 setClasses:v29 forSelector:"registerFidoKeyWithContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v46 forSelector:"registerFidoKeyWithContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v29 forSelector:"verifyFidoKeyWithContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v46 forSelector:"verifyFidoKeyWithContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v29 forSelector:"verifyFidoRecoveryWithContext:recoveryToken:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v46 forSelector:"verifyFidoRecoveryWithContext:recoveryToken:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v29 forSelector:"verifyFidoKeyWithFidoContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v46 forSelector:"verifyFidoKeyWithFidoContext:completion:" argumentIndex:0 ofReply:1];
}

- (void)registerFidoKeyWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (void)verifyFidoKeyWithFidoContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (void)verifyFidoKeyWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, void, id))a4 + 2))(v5, 0LL, 0LL, v6);
}

- (void)verifyFidoRecoveryWithContext:(id)a3 recoveryToken:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, void, id))a5 + 2))(v6, 0LL, 0LL, v7);
}

- (void).cxx_destruct
{
}

@end