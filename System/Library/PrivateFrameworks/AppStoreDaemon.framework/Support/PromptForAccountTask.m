@interface PromptForAccountTask
- (void)main;
@end

@implementation PromptForAccountTask

- (void)main
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___AMSAuthenticateOptions);
  [v3 setDebugReason:@"Prompt For Account"];
  else {
    v4 = @"PROMPT_FOR_ACCOUNT_SIGN_IN_PURCHASE";
  }
  uint64_t v5 = ASDLocalizedString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v3 setPromptTitle:v6];

  if (*(void *)&self->super._success)
  {
    uint64_t v7 = ASDLocalizedString(@"PROMPT_FOR_ACCOUNT_SIGN_IN_WITH_APPLE_ACCOUNT_%@");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v8,  *(void *)&self->super._success));
    [v3 setReason:v9];
  }

  uint64_t v10 = ASDLocalizedString(@"PROMPT_FOR_ACCOUNT_SIGN_IN");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v3 setDefaultButtonString:v11];

  id v13 = objc_msgSend(objc_getProperty(self, v12, 64, 1), "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v3 setLogKey:v14];

  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_10023B554;
  v58 = sub_10023B564;
  id v59 = 0LL;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_10023B554;
  v52 = sub_10023B564;
  id v53 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSAuthenticateResult notificationClient](self->_authenticateResult, "notificationClient"));

  if (v15)
  {
    uint64_t v16 = ASDLogHandleForCategory(25LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_getProperty(self, v18, 64LL, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AMSAuthenticateResult notificationClient](self->_authenticateResult, "notificationClient"));
      *(_DWORD *)buf = 138412546;
      id v61 = v19;
      __int16 v62 = 2114;
      v63 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] Sending authentication request to client %{public}@",  buf,  0x16u);
    }

    v21 = -[AMSAuthenticateRequest initWithDSID:altDSID:username:options:]( objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest),  "initWithDSID:altDSID:username:options:",  0LL,  0LL,  *(void *)&self->super._success,  v3);
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AMSAuthenticateResult notificationClient](self->_authenticateResult, "notificationClient"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10023B56C;
    v44[3] = &unk_1003EDEB8;
    v46 = &v48;
    v47 = &v54;
    v24 = v22;
    v45 = v24;
    sub_100277630((uint64_t)&OBJC_CLASS___CallerRequestPresenter, v21, v23, v44);

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    uint64_t v25 = ASDLogHandleForCategory(25LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id Property = objc_getProperty(self, v27, 64LL, 1);
      *(_DWORD *)buf = 138412290;
      id v61 = Property;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@] No client available to handle authentication request",  buf,  0xCu);
    }

    uint64_t v29 = ASDErrorWithDescription(ASDErrorDomain, 1061LL, @"No client available to handle authentication request");
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    v21 = (AMSAuthenticateRequest *)v55[5];
    v55[5] = v30;
  }

  if (v49[5])
  {
    uint64_t v31 = ASDLogHandleForCategory(25LL);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = objc_getProperty(self, v33, 64LL, 1);
      *(_DWORD *)buf = 138412290;
      id v61 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%@] Authenticated successfully", buf, 0xCu);
    }

    v35 = (NSString *)(id)v49[5];
    username = self->_username;
    self->_username = v35;
  }

  else
  {
    if (v55[5]) {
      goto LABEL_21;
    }
    uint64_t v40 = ASDErrorWithDescription(ASDErrorDomain, 1002LL, @"An unknown error occurred");
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    username = (NSString *)v55[5];
    v55[5] = v41;
  }

  if (!v55[5])
  {
    -[Task completeWithSuccess](self, "completeWithSuccess");
    goto LABEL_24;
  }

- (void).cxx_destruct
{
}

@end