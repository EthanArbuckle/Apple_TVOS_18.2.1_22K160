@interface AKFidoDaemonServerHandler
- (void)_handleFinishFidoResponse:(id)a3 data:(id)a4 context:(id)a5 recoveryToken:(id)a6 error:(id)a7 completion:(id)a8;
- (void)_handleStartFidoResponse:(id)a3 data:(id)a4 context:(id)a5 recoveryToken:(id)a6 error:(id)a7 completion:(id)a8;
- (void)finishFidoAuthWithResponse:(id)a3 client:(id)a4 context:(id)a5 recoveryToken:(id)a6 completion:(id)a7;
- (void)startFidoAuthWithContext:(id)a3 recoveryToken:(id)a4 client:(id)a5 completion:(id)a6;
@end

@implementation AKFidoDaemonServerHandler

- (void)startFidoAuthWithContext:(id)a3 recoveryToken:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 _identityToken]);

  if (!v14)
  {
    uint64_t v16 = _AKLogSystem(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "GS token is missing, giving it a shot to receive it from the account",  (uint8_t *)buf,  2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 authKitAccountWithAltDSID:v19 error:0]);

    if (v20)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v18 masterTokenForAccount:v20]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);
      [v10 _setIdentityToken:v23];
    }

    else
    {
      uint64_t v24 = _AKLogSystem(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
        sub_100137568();
      }
    }
  }

  v25 = (id *)&AKURLBagKeyFidoStartRecoveryAuthKey;
  if (!v11) {
    v25 = (id *)&AKURLBagKeyFidoStartAuthKey;
  }
  id v26 = *v25;
  v27 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKFidoRequestProvider),  "initWithContext:urlBagKey:",  v10,  v26);
  v28 = v27;
  if (v12) {
    -[AKURLRequestProviderImpl setClient:](v27, "setClient:", v12);
  }
  if (v11) {
    -[AKFidoRequestProvider setRecoveryToken:](v28, "setRecoveryToken:", v11);
  }
  v29 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v28);
  uint64_t v30 = _AKLogFido();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_10013753C();
  }

  objc_initWeak(buf, self);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100065058;
  v35[3] = &unk_1001C8FC8;
  objc_copyWeak(&v39, buf);
  id v32 = v10;
  id v36 = v32;
  id v33 = v11;
  id v37 = v33;
  id v34 = v13;
  id v38 = v34;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v29, "executeRequestWithCompletion:", v35);

  objc_destroyWeak(&v39);
  objc_destroyWeak(buf);
}

- (void)_handleStartFidoResponse:(id)a3 data:(id)a4 context:(id)a5 recoveryToken:(id)a6 error:(id)a7 completion:(id)a8
{
  id v10 = a4;
  id v11 = a7;
  id v12 = (void (**)(id, void, id))a8;
  uint64_t v13 = _AKLogFido();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100137698();
    }

    v12[2](v12, 0LL, v11);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10013766C();
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v10,  @"application/json"));
    uint64_t v17 = _AKLogFido();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100137600();
    }

    id v19 = [[AKFidoContext alloc] initWithParameters:v16];
    if (v19)
    {
      id v11 = 0LL;
    }

    else
    {
      uint64_t v20 = _AKLogFido();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1001375A0();
      }

      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7010LL));
    }

    ((void (**)(id, id, id))v12)[2](v12, v19, v11);
  }
}

- (void)finishFidoAuthWithResponse:(id)a3 client:(id)a4 context:(id)a5 recoveryToken:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v32 = a7;
  uint64_t v15 = (id *)&AKURLBagKeyFidoFinishRecoveryAuthKey;
  if (!v14) {
    uint64_t v15 = (id *)&AKURLBagKeyFidoFinishAuthKey;
  }
  id v31 = *v15;
  uint64_t v16 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKFidoRequestProvider),  "initWithContext:urlBagKey:",  v13,  v31);
  uint64_t v17 = v16;
  if (v12) {
    -[AKURLRequestProviderImpl setClient:](v16, "setClient:", v12);
  }
  uint64_t v30 = v12;
  if (v14) {
    -[AKFidoRequestProvider setRecoveryToken:](v17, "setRecoveryToken:", v14);
  }
  v40[0] = @"authenticatorData";
  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 authenticatorData]);
  v41[0] = v18;
  v40[1] = @"clientData";
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 clientData]);
  v41[1] = v19;
  v40[2] = @"signature";
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 signature]);
  v41[2] = v20;
  v40[3] = @"credentialId";
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 credentialID]);
  v41[3] = v21;
  v40[4] = @"userHandle";
  v22 = (void *)objc_claimAutoreleasedReturnValue([v11 userIdentifier]);
  v41[4] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  5LL));

  -[AKURLRequestProviderImpl setAuthKitBody:](v17, "setAuthKitBody:", v23);
  uint64_t v24 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v17);
  uint64_t v25 = _AKLogFido();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_1001376F8();
  }

  objc_initWeak(&location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000655A4;
  v34[3] = &unk_1001C8FC8;
  objc_copyWeak(&v38, &location);
  id v27 = v13;
  id v35 = v27;
  id v28 = v14;
  id v36 = v28;
  id v29 = v32;
  id v37 = v29;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v24, "executeRequestWithCompletion:", v34);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

- (void)_handleFinishFidoResponse:(id)a3 data:(id)a4 context:(id)a5 recoveryToken:(id)a6 error:(id)a7 completion:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a8;
  uint64_t v15 = _AKLogFido();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100137750();
    }

    (*((void (**)(id, void, void, id))v14 + 2))(v14, 0LL, 0LL, v13);
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100137724();
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v12,  @"application/json"));
    id v19 = -[AKAuthenticationServerResponse initWithServerResponse:responseBody:]( objc_alloc(&OBJC_CLASS___AKAuthenticationServerResponse),  "initWithServerResponse:responseBody:",  v11,  v18);
    (*((void (**)(id, AKAuthenticationServerResponse *, uint64_t, void))v14 + 2))(v14, v19, v18, 0LL);

    id v14 = (id)v18;
  }
}

@end