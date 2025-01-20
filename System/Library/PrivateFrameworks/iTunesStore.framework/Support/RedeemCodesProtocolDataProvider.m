@interface RedeemCodesProtocolDataProvider
- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4;
- (ISDialogButton)dialogButton;
- (void)setDialogButton:(id)a3;
@end

@implementation RedeemCodesProtocolDataProvider

- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v85 = 0LL;
  v86 = (id *)&v85;
  uint64_t v87 = 0x3032000000LL;
  v88 = sub_1000CF928;
  v89 = sub_1000CF938;
  id v90 = 0LL;
  uint64_t v81 = 0LL;
  v82 = &v81;
  uint64_t v83 = 0x2020000000LL;
  char v84 = 0;
  [v5 setPerformsButtonAction:0];
  uint64_t v77 = 0LL;
  v78 = &v77;
  uint64_t v79 = 0x2020000000LL;
  char v80 = 0;
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x3032000000LL;
  v74 = sub_1000CF928;
  v75 = sub_1000CF938;
  id v76 = 0LL;
  v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", objc_opt_class(self));
  v62 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dialog]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 paymentSheet]);

  if (!v8) {
    goto LABEL_60;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationContext]);
  v9 = -[DisplayPaymentSheetOperation initWithPaymentSheet:]( objc_alloc(&OBJC_CLASS___DisplayPaymentSheetOperation),  "initWithPaymentSheet:",  v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v60 requiredUniqueIdentifier]);
  -[DisplayPaymentSheetOperation setAccountIdentifier:](v9, "setAccountIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultAuthKitAuthenticationContext]);
  -[DisplayPaymentSheetOperation setAuthenticationContext:](v9, "setAuthenticationContext:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 dialogId]);
  -[DisplayPaymentSheetOperation setDialogId:](v9, "setDialogId:", v12);

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_1000CF940;
  v65[3] = &unk_10034BD10;
  id v13 = v62;
  id v66 = v13;
  v67 = &v85;
  v68 = &v77;
  v69 = &v71;
  v70 = &v81;
  -[DisplayPaymentSheetOperation setCompletionHandler:](v9, "setCompletionHandler:", v65);
  v14 = -[DisplayPaymentSheetContainerOperation initWithDisplayPaymentSheetOperation:]( objc_alloc(&OBJC_CLASS___DisplayPaymentSheetContainerOperation),  "initWithDisplayPaymentSheetOperation:",  v9);
  if (!v14)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v26) {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v27 = [v26 shouldLog];
    unsigned int v28 = [v26 shouldLogToDisk];
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
    v30 = v29;
    if (v28) {
      v27 |= 2u;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      uint64_t v31 = v27;
    }
    else {
      uint64_t v31 = v27 & 2;
    }
    if ((_DWORD)v31)
    {
      int v91 = 138543362;
      id v92 = v13;
      v32 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  16LL,  "%{public}@: [PW] Payment sheet encountered an unknown error",  &v91,  12);

      if (!v32)
      {
        v23 = 0LL;
        goto LABEL_41;
      }

      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
      free(v32);
      v58 = v30;
      SSFileLog(v26, @"%@");
    }

    v23 = 0LL;
    goto LABEL_40;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v15) {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v16 = [v15 shouldLog];
  unsigned int v17 = [v15 shouldLogToDisk];
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
  v19 = v18;
  if (v17) {
    v16 |= 2u;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v20 = v16;
  }
  else {
    uint64_t v20 = v16 & 2;
  }
  if ((_DWORD)v20)
  {
    int v91 = 138543362;
    id v92 = v13;
    v21 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%{public}@: Preparing to display payment sheet",  &v91,  12);

    if (!v21) {
      goto LABEL_14;
    }
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
    free(v21);
    v58 = v19;
    SSFileLog(v15, @"%@");
  }

LABEL_14:
  id v64 = 0LL;
  -[RedeemCodesProtocolDataProvider runSubOperation:error:](self, "runSubOperation:error:", v14, &v64);
  id v22 = v64;
  v23 = v22;
  if (!v22) {
    goto LABEL_42;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue([v22 domain]);
  if ([v24 isEqualToString:SSErrorDomain])
  {
    BOOL v25 = [v23 code] == (id)140;

    if (v25) {
      *((_BYTE *)v78 + 24) = 1;
    }
  }

  else
  {
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v58));
  if (!v26) {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v33) = [v26 shouldLog];
  unsigned int v34 = [v26 shouldLogToDisk];
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
  v30 = v35;
  if (v34) {
    LODWORD(v33) = v33 | 2;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    uint64_t v33 = v33;
  }
  else {
    v33 &= 2u;
  }
  if (!(_DWORD)v33) {
    goto LABEL_40;
  }
  v36 = (void *)objc_opt_class(self);
  int v91 = 138543618;
  id v92 = v36;
  __int16 v93 = 2114;
  v94 = v23;
  id v37 = v36;
  LODWORD(v59) = 22;
  v38 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  16LL,  "%{public}@: Display payment sheet container operation failed with error: %{public}@",  &v91,  v59);

  if (v38)
  {
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
    free(v38);
    v58 = v30;
    SSFileLog(v26, @"%@");
LABEL_40:
  }

- (ISDialogButton)dialogButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setDialogButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end