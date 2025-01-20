@interface AKEDPRequestController
- (AKClient)client;
- (void)_edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 serviceController:(id)a5 completion:(id)a6;
- (void)_performRepairWithContext:(id)a3 completionHandler:(id)a4;
- (void)edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 completion:(id)a5;
- (void)isEDPHealthyForCDPContext:(id)a3 completion:(id)a4;
- (void)repairEDPStateForContext:(id)a3 authenticationResults:(id)a4 completion:(id)a5;
- (void)setClient:(id)a3;
@end

@implementation AKEDPRequestController

- (void)edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v14 = objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v14, "setAltDSID:", v10);
  v11 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider),  "initWithContext:urlBagKey:",  v14,  v9);
  -[AKGrandSlamRequestProvider setExpectedResponseType:](v11, "setExpectedResponseType:", 1LL);
  -[AKGrandSlamRequestProvider setRequestBodyType:](v11, "setRequestBodyType:", 1LL);
  -[AKURLRequestProviderImpl setAuthKitBody:](v11, "setAuthKitBody:", &__NSDictionary0__struct);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKEDPRequestController client](self, "client"));
  -[AKURLRequestProviderImpl setClient:](v11, "setClient:", v12);

  v13 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v11);
  -[AKEDPRequestController _edpRequestWithAltDSID:URLKey:serviceController:completion:]( self,  "_edpRequestWithAltDSID:URLKey:serviceController:completion:",  v10,  v9,  v13,  v8);
}

- (void)_edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 serviceController:(id)a5 completion:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000142F0;
  v10[3] = &unk_1001C6968;
  id v11 = a4;
  id v12 = a6;
  id v8 = v12;
  id v9 = v11;
  [a5 executeRequestWithCompletion:v10];
}

- (void)repairEDPStateForContext:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10012D02C((uint64_t)v8, v12);
  }

  id v38 = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 authKitAccount:&v38]);
  id v14 = v38;
  v15 = v14;
  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v17 = [v16 edpStateValueForAccount:v13];

    uint64_t v19 = _AKLogSystem(v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v17 == (id)1)
    {
      if (v21) {
        sub_10012CFCC(v20, v22, v23, v24, v25, v26, v27, v28);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[AKCDPFactory contextWithAuthResults:](&OBJC_CLASS___AKCDPFactory, "contextWithAuthResults:", v9));
      [v29 setType:11];
      -[AKEDPRequestController _performRepairWithContext:completionHandler:]( self,  "_performRepairWithContext:completionHandler:",  v29,  v10);
    }

    else
    {
      if (v21) {
        sub_10012CFFC(v20, v22, v23, v24, v25, v26, v27, v28);
      }

      if (v10) {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
      }
    }
  }

  else
  {
    uint64_t v30 = _AKLogSystem(v14);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10012CF68((uint64_t)v15, v31, v32, v33, v34, v35, v36, v37);
    }

    if (v10) {
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
    }
  }
}

- (void)_performRepairWithContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKCDPFactory stateControllerWithContext:]( &OBJC_CLASS___AKCDPFactory,  "stateControllerWithContext:",  a3));
  if ((objc_opt_respondsToSelector(v6, "repairEDPStateWithCompletion:") & 1) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100014700;
    v8[3] = &unk_1001C6990;
    id v9 = v5;
    [v6 repairEDPStateWithCompletion:v8];
  }

  else if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0LL, v7);
  }
}

- (void)isEDPHealthyForCDPContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKCDPFactory stateControllerWithContext:]( &OBJC_CLASS___AKCDPFactory,  "stateControllerWithContext:",  v6));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100014848;
  v9[3] = &unk_1001C69B8;
  id v10 = v5;
  id v8 = v5;
  [v7 validateEDPIdentitiesWithContext:v6 completion:v9];
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end