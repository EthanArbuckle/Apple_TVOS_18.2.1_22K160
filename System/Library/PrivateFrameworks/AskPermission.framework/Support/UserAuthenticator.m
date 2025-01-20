@interface UserAuthenticator
+ (void)authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4 completion:(id)a5;
@end

@implementation UserAuthenticator

+ (void)authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = (id)objc_opt_class(a1);
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2050;
    int64_t v29 = a4;
    id v12 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Authenticating user. Username: %@, authenticationType: %{public}ld.",  buf,  0x20u);
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  [v13 setAuthenticationType:2];
  [v13 setIsEphemeral:1];
  [v13 _setProxyingForApp:1];
  [v13 setIsUsernameEditable:a4 == 0];
  [v13 setServiceType:1];
  [v13 setShouldAllowAppleIDCreation:0];
  [v13 setUsername:v8];
  if (a4 == 2)
  {
    v16 = @"AUTHENTICATION_PROMPT_TITLE_DECLINE_REMOTE";
LABEL_11:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](&OBJC_CLASS___Localizations, "stringWithKey:", v16));
    v15 = @"AUTHENTICATION_PROMPT_BODY_REMOTE";
    goto LABEL_12;
  }

  if (a4 == 1)
  {
    v16 = @"AUTHENTICATION_PROMPT_TITLE_APPROVE_REMOTE";
    goto LABEL_11;
  }

  if (a4)
  {
    v18 = 0LL;
    v14 = 0LL;
    goto LABEL_17;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[Localizations stringWithKey:]( &OBJC_CLASS___Localizations,  "stringWithKey:",  @"AUTHENTICATION_PROMPT_TITLE_APPROVE_LOCAL"));
  v15 = @"AUTHENTICATION_PROMPT_BODY_LOCAL";
LABEL_12:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](&OBJC_CLASS___Localizations, "stringWithKey:", v15));
  if (v17) {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v17,  @"%@",  0LL,  v8));
  }
  else {
    v18 = 0LL;
  }

LABEL_17:
  objc_msgSend(v13, "set_passwordPromptTitle:", v14);
  [v13 setReason:v18];
  id v19 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000215DC;
  v21[3] = &unk_100030C60;
  id v22 = v9;
  id v23 = a1;
  id v20 = v9;
  [v19 authenticateWithContext:v13 completion:v21];
}

@end