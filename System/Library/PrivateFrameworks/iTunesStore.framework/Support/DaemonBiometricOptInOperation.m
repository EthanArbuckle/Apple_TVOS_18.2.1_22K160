@interface DaemonBiometricOptInOperation
- (BOOL)_updateTouchIDSettingsForAccount:(id)a3;
- (BOOL)requiresStoreAuthentication;
- (DaemonBiometricOptInOperation)init;
- (id)_authenticateWithAccount:(id)a3 error:(id *)a4;
- (id)resultBlock;
- (void)run;
- (void)setRequiresStoreAuthentication:(BOOL)a3;
- (void)setResultBlock:(id)a3;
@end

@implementation DaemonBiometricOptInOperation

- (DaemonBiometricOptInOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DaemonBiometricOptInOperation;
  result = -[DaemonBiometricOptInOperation init](&v3, "init");
  if (result) {
    result->_requiresStoreAuthentication = 1;
  }
  return result;
}

- (BOOL)requiresStoreAuthentication
{
  BOOL requiresStoreAuthentication = self->_requiresStoreAuthentication;
  -[DaemonBiometricOptInOperation unlock](self, "unlock");
  return requiresStoreAuthentication;
}

- (id)resultBlock
{
  id v3 = [self->_resultBlock copy];
  -[DaemonBiometricOptInOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setRequiresStoreAuthentication:(BOOL)a3
{
  self->_BOOL requiresStoreAuthentication = a3;
  -[DaemonBiometricOptInOperation unlock](self, "unlock");
}

- (void)setResultBlock:(id)a3
{
  id v6 = a3;
  -[DaemonBiometricOptInOperation lock](self, "lock");
  if (self->_resultBlock != v6)
  {
    id v4 = [v6 copy];
    id resultBlock = self->_resultBlock;
    self->_id resultBlock = v4;
  }

  -[DaemonBiometricOptInOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = objc_alloc_init(&OBJC_CLASS___DaemonBiometricStore);
  if (!-[DaemonBiometricStore canPerformBiometricOptIn](v3, "canPerformBiometricOptIn"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v27 = 138543362;
      id v28 = (id)objc_opt_class(self);
      id v13 = v28;
      v14 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "%{public}@: Failed for no biometrics",  &v27,  12);

      if (!v14)
      {
LABEL_17:

        uint64_t v15 = SSError(SSErrorDomain, 106LL, 0LL, 0LL);
        id v7 = (id)objc_claimAutoreleasedReturnValue(v15);
        BOOL v8 = 0LL;
        goto LABEL_33;
      }

      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      v25 = v12;
      SSFileLog(v9, @"%@");
    }

    goto LABEL_17;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);

  if (!-[DaemonBiometricOptInOperation requiresStoreAuthentication](self, "requiresStoreAuthentication"))
  {
    id v7 = 0LL;
    if (v5) {
      goto LABEL_4;
    }
LABEL_19:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      v20 = (void *)objc_opt_class(self);
      int v27 = 138543362;
      id v28 = v20;
      id v21 = v20;
      v22 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  16LL,  "%{public}@: Failed for no account",  &v27,  12);

      if (!v22)
      {
LABEL_31:

        BOOL v8 = 0LL;
        goto LABEL_32;
      }

      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      v25 = v19;
      SSFileLog(v16, @"%@");
    }

    goto LABEL_31;
  }

  id v26 = 0LL;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( -[DaemonBiometricOptInOperation _authenticateWithAccount:error:]( self,  "_authenticateWithAccount:error:",  v5,  &v26));
  id v7 = v26;

  v5 = (void *)v6;
  if (!v6) {
    goto LABEL_19;
  }
LABEL_4:
  BOOL v8 = -[DaemonBiometricOptInOperation _updateTouchIDSettingsForAccount:](self, "_updateTouchIDSettingsForAccount:", v5);
LABEL_32:

LABEL_33:
  -[DaemonBiometricOptInOperation setError:](self, "setError:", v7, v25);
  -[DaemonBiometricOptInOperation setSuccess:](self, "setSuccess:", v8);
  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[DaemonBiometricOptInOperation resultBlock](self, "resultBlock"));
  v24 = (void *)v23;
  if (v23) {
    (*(void (**)(uint64_t, BOOL, id))(v23 + 16))(v23, v8, v7);
  }
}

- (id)_authenticateWithAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  v5);
  -[SSMutableAuthenticationContext setCanCreateNewAccount:](v6, "setCanCreateNewAccount:", 0LL);
  -[SSMutableAuthenticationContext setCanSetActiveAccount:](v6, "setCanSetActiveAccount:", v5 == 0LL);
  -[SSMutableAuthenticationContext setPromptStyle:](v6, "setPromptStyle:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 accountName]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);

  v9 = (void *)v8;
  unsigned int v10 = objc_opt_new(&OBJC_CLASS___DaemonBiometricStore);
  id v11 = -[DaemonBiometricStore biometricState](v10, "biometricState");
  v86 = v10;
  id v12 = -[DaemonBiometricStore tokenAvailabilityForAccountIdentifier:]( v10,  "tokenAvailabilityForAccountIdentifier:",  v9);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  id v14 = [v13 deviceBiometricStyle];

  if (v12 == (id)2)
  {
    if ([v7 length])
    {
      if (v14 == (id)3)
      {
        id v26 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
        v16 = (void *)objc_claimAutoreleasedReturnValue(v26);
        unsigned int v17 = v16;
        uint64_t v18 = @"PROMPT_REASON_NEW_FACE_FORMAT_%@";
        goto LABEL_15;
      }

      if (v14 == (id)2)
      {
        uint64_t v15 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        unsigned int v17 = v16;
        uint64_t v18 = @"PROMPT_REASON_NEW_FINGERS_FORMAT_%@";
LABEL_15:
        int v27 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:v18 value:&stru_10035EB18 table:@"Mesa"]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v27, v7));

LABEL_28:
LABEL_43:
        -[SSMutableAuthenticationContext setReasonDescription:](v6, "setReasonDescription:", v28, v81);
LABEL_44:

        goto LABEL_45;
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
      if (!v29) {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v30 = [v29 shouldLog];
      else {
        unsigned int v31 = v30;
      }
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v33 = v31;
      }
      else {
        uint64_t v33 = v31 & 2;
      }
      if (!(_DWORD)v33) {
        goto LABEL_41;
      }
      int v87 = 138543362;
      id v88 = (id)objc_opt_class(self);
      id v34 = v88;
      uint64_t v35 = _os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "%{public}@: Failed to determine device biometric style for new identity map",  &v87,  12);
      goto LABEL_39;
    }

    if (v14 == (id)3)
    {
      v36 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v36);
      unsigned int v17 = v24;
      v25 = @"PROMPT_REASON_NEW_FACE_ANONYMOUS";
    }

    else
    {
      if (v14 != (id)2)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
        if (!v29) {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v37 = [v29 shouldLog];
        else {
          unsigned int v38 = v37;
        }
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v39 = v38;
        }
        else {
          uint64_t v39 = v38 & 2;
        }
        if (!(_DWORD)v39) {
          goto LABEL_41;
        }
        int v87 = 138543362;
        id v88 = (id)objc_opt_class(self);
        id v34 = v88;
        uint64_t v35 = _os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "%{public}@: Failed to determine device biometric style for new anonymous idenitty map",  &v87,  12);
LABEL_39:
        v40 = (void *)v35;

        if (!v40)
        {
LABEL_42:

          id v28 = 0LL;
          goto LABEL_43;
        }

        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
        free(v40);
        v81 = v32;
        SSFileLog(v29, @"%@");
LABEL_41:

        goto LABEL_42;
      }

      uint64_t v23 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      unsigned int v17 = v24;
      v25 = @"PROMPT_REASON_NEW_FINGERS_ANONYMOUS";
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:v25 value:&stru_10035EB18 table:@"Mesa"]);
    goto LABEL_28;
  }

  if (v11 != (id)2 && [v7 length])
  {
    if (v14 == (id)2)
    {
      v71 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v71);
      id v21 = v20;
      v22 = @"PROMPT_REASON_GENERIC";
    }

    else
    {
      if (v14 != (id)3)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
        if (!v28) {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v74 = [v28 shouldLog];
        else {
          unsigned int v75 = v74;
        }
        v76 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v77 = v75;
        }
        else {
          uint64_t v77 = v75 & 2;
        }
        if ((_DWORD)v77)
        {
          int v87 = 138543362;
          id v88 = (id)objc_opt_class(self);
          id v78 = v88;
          v79 = (void *)_os_log_send_and_compose_impl( v77,  0LL,  0LL,  0LL,  &_mh_execute_header,  v76,  0LL,  "%{public}@: Failed to determine device biometric style for enabling biometrics",  &v87,  12);

          if (!v79) {
            goto LABEL_44;
          }
          v76 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v79,  4LL));
          free(v79);
          v81 = v76;
          SSFileLog(v28, @"%@");
        }

        goto LABEL_44;
      }

      v19 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = v20;
      v22 = @"PROMPT_REASON_FACE_GENERIC";
    }

    v72 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:v22 value:&stru_10035EB18 table:@"Mesa"]);
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v72, v7));
    -[SSMutableAuthenticationContext setReasonDescription:](v6, "setReasonDescription:", v73);
  }

- (BOOL)_updateTouchIDSettingsForAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", objc_opt_class(self));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);

  id v8 = [[ISBiometricUpdateTouchIDSettingsOperation alloc] initWithAccountIdentifier:v7];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100058028;
  v21[3] = &unk_10034C588;
  id v9 = v6;
  id v22 = v9;
  [v8 setResultBlock:v21];
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v10 addOperation:v8];

  id v11 = objc_alloc_init(&OBJC_CLASS___DaemonBiometricStore);
  -[DaemonBiometricStore setBiometricState:](v11, "setBiometricState:", 2LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonBiometricStore identityMap](v11, "identityMap"));
  -[DaemonBiometricStore saveIdentityMap:forAccountIdentifier:](v11, "saveIdentityMap:forAccountIdentifier:", v12, v7);

  -[DaemonBiometricStore registerAccountIdentifier:](v11, "registerAccountIdentifier:", v7);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v13) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v14 = [v13 shouldLog];
  else {
    LODWORD(v15) = v14;
  }
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v15 = v15;
  }
  else {
    v15 &= 2u;
  }
  if (!(_DWORD)v15) {
    goto LABEL_12;
  }
  unsigned int v17 = (void *)objc_opt_class(self);
  int v23 = 138412546;
  v24 = v17;
  __int16 v25 = 2112;
  id v26 = v7;
  id v18 = v17;
  v19 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Biometrics enabled and cached for DSID: %@",  &v23,  22);

  if (v19)
  {
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    SSFileLog(v13, @"%@");
LABEL_12:
  }

  return 1;
}

- (void).cxx_destruct
{
}

@end