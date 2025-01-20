@interface PurchaseProtocolDataProvider
- (BOOL)_processBuyFailuresFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4;
- (BOOL)processDictionary:(id)a3 error:(id *)a4;
- (NSString)redirectActionParameters;
- (void)_performActionsForButton:(id)a3 withDialog:(id)a4;
- (void)setRedirectActionParameters:(id)a3;
@end

@implementation PurchaseProtocolDataProvider

- (void)_performActionsForButton:(id)a3 withDialog:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unsigned int v7 = [v9 actionType];
  switch(v7)
  {
    case 1u:
      if ([v9 urlType] != (id)1) {
        break;
      }
LABEL_6:
      [v9 performDefaultActionForDialog:v6];
      break;
    case 4u:
      goto LABEL_6;
    case 3u:
      v8 = (void *)objc_claimAutoreleasedReturnValue([v9 parameter]);
      -[PurchaseProtocolDataProvider setRedirectActionParameters:](self, "setRedirectActionParameters:", v8);

      break;
  }
}

- (BOOL)processDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PurchaseProtocolDataProvider;
  id v15 = 0LL;
  unsigned int v7 = -[DaemonProtocolDataProvider processDictionary:error:](&v14, "processDictionary:error:", v6, &v15);
  id v8 = v15;
  id v9 = v8;
  if (v7)
  {
    id v13 = v8;
    BOOL v10 = -[PurchaseProtocolDataProvider _processBuyFailuresFromDictionary:error:]( self,  "_processBuyFailuresFromDictionary:error:",  v6,  &v13);
    id v11 = v13;

    id v9 = v11;
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }

  if (!v10) {
    *a4 = v9;
  }
LABEL_7:

  return v10;
}

- (BOOL)_processBuyFailuresFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:kISFailureTypeKey]);
  if ((objc_opt_respondsToSelector(v6, "intValue") & 1) != 0)
  {
    switch([v6 intValue])
    {
      case 0xF3Cu:
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v7) {
          unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v8 = [v7 shouldLog];
        else {
          LODWORD(v9) = v8;
        }
        BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          uint64_t v9 = v9;
        }
        else {
          v9 &= 2u;
        }
        if (!(_DWORD)v9) {
          goto LABEL_14;
        }
        id v11 = (void *)objc_opt_class(self);
        id v12 = v11;
        int v38 = 138543618;
        v39 = v11;
        __int16 v40 = 1024;
        unsigned int v41 = [v6 intValue];
        id v13 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  16LL,  "%{public}@: AdHocOfferNotFound: %d",  &v38,  18);

        if (v13)
        {
          BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
          free(v13);
          SSFileLog(v7, @"%@");
LABEL_14:
        }

        uint64_t v14 = 3900LL;
        break;
      case 0xF3Du:
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v7) {
          unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v17 = [v7 shouldLog];
        else {
          LODWORD(v18) = v17;
        }
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          uint64_t v18 = v18;
        }
        else {
          v18 &= 2u;
        }
        if (!(_DWORD)v18) {
          goto LABEL_28;
        }
        v20 = (void *)objc_opt_class(self);
        id v21 = v20;
        int v38 = 138543618;
        v39 = v20;
        __int16 v40 = 1024;
        unsigned int v41 = [v6 intValue];
        v22 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  16LL,  "%{public}@: AdHocOfferPriceNotValid: %d",  &v38,  18);

        if (v22)
        {
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
          free(v22);
          SSFileLog(v7, @"%@");
LABEL_28:
        }

        uint64_t v14 = 3901LL;
        break;
      case 0xF3Eu:
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v7) {
          unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v23 = [v7 shouldLog];
        else {
          LODWORD(v24) = v23;
        }
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          uint64_t v24 = v24;
        }
        else {
          v24 &= 2u;
        }
        if (!(_DWORD)v24) {
          goto LABEL_41;
        }
        v26 = (void *)objc_opt_class(self);
        id v27 = v26;
        int v38 = 138543618;
        v39 = v26;
        __int16 v40 = 1024;
        unsigned int v41 = [v6 intValue];
        v28 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  16LL,  "%{public}@: AdHocOfferMissingKeyParams: %d",  &v38,  18);

        if (v28)
        {
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL));
          free(v28);
          SSFileLog(v7, @"%@");
LABEL_41:
        }

        uint64_t v14 = 3902LL;
        break;
      case 0xF3Fu:
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v7) {
          unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v29 = [v7 shouldLog];
        else {
          LODWORD(v30) = v29;
        }
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          uint64_t v30 = v30;
        }
        else {
          v30 &= 2u;
        }
        if (!(_DWORD)v30) {
          goto LABEL_54;
        }
        v32 = (void *)objc_opt_class(self);
        id v33 = v32;
        int v38 = 138543618;
        v39 = v32;
        __int16 v40 = 1024;
        unsigned int v41 = [v6 intValue];
        v34 = (void *)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  16LL,  "%{public}@: AdHocOfferSignatureNotValid: %d",  &v38,  18);

        if (v34)
        {
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL));
          free(v34);
          SSFileLog(v7, @"%@");
LABEL_54:
        }

        uint64_t v14 = 3903LL;
        break;
      default:
        goto LABEL_16;
    }

    uint64_t v35 = SSError(SSServerErrorDomain, v14, 0LL, 0LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    id v15 = v36;
    if (a4)
    {
      id v15 = v36;
      BOOL v16 = 0;
      *a4 = v15;
    }

    else
    {
      BOOL v16 = 0;
    }
  }

  else
  {
LABEL_16:
    id v15 = 0LL;
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v88 = 0LL;
  v89 = (id *)&v88;
  uint64_t v90 = 0x3032000000LL;
  v91 = sub_10003FFF4;
  v92 = sub_100040004;
  id v93 = 0LL;
  uint64_t v84 = 0LL;
  v85 = &v84;
  uint64_t v86 = 0x2020000000LL;
  char v87 = 0;
  [v5 setPerformsButtonAction:0];
  uint64_t v80 = 0LL;
  v81 = &v80;
  uint64_t v82 = 0x2020000000LL;
  char v83 = 0;
  uint64_t v74 = 0LL;
  v75 = &v74;
  uint64_t v76 = 0x3032000000LL;
  v77 = sub_10003FFF4;
  v78 = sub_100040004;
  id v79 = 0LL;
  id v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", objc_opt_class(self));
  v65 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dialog]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 paymentSheet]);

  if (!v8)
  {
LABEL_48:
    v42 = v89;
    id obj = v89[5];
    unsigned __int8 v43 = -[PurchaseProtocolDataProvider runSubOperation:error:]( self,  "runSubOperation:error:",  v5,  &obj,  v61);
    objc_storeStrong(v42 + 5, obj);
    *((_BYTE *)v85 + 24) = v43;
    goto LABEL_49;
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationContext]);
  uint64_t v9 = -[DisplayPaymentSheetOperation initWithPaymentSheet:]( objc_alloc(&OBJC_CLASS___DisplayPaymentSheetOperation),  "initWithPaymentSheet:",  v8);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v63 requiredUniqueIdentifier]);
  -[DisplayPaymentSheetOperation setAccountIdentifier:](v9, "setAccountIdentifier:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultAuthKitAuthenticationContext]);
  -[DisplayPaymentSheetOperation setAuthenticationContext:](v9, "setAuthenticationContext:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 dialogId]);
  -[DisplayPaymentSheetOperation setDialogId:](v9, "setDialogId:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.ISProtocolDataProvider_opaque[OBJC_IVAR___ISDataProvider__authenticationContext] accountName]);
  -[DisplayPaymentSheetOperation setAccountName:](v9, "setAccountName:", v13);

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_10004000C;
  v68[3] = &unk_10034BD10;
  id v14 = v65;
  id v69 = v14;
  v70 = &v88;
  v71 = &v80;
  v72 = &v74;
  v73 = &v84;
  -[DisplayPaymentSheetOperation setCompletionHandler:](v9, "setCompletionHandler:", v68);
  id v15 = -[DisplayPaymentSheetContainerOperation initWithDisplayPaymentSheetOperation:]( objc_alloc(&OBJC_CLASS___DisplayPaymentSheetContainerOperation),  "initWithDisplayPaymentSheetOperation:",  v9);
  if (!v15)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v27) {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    unsigned int v29 = [v27 shouldLogToDisk];
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    v31 = v30;
    if (v29) {
      v28 |= 2u;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      uint64_t v32 = v28;
    }
    else {
      uint64_t v32 = v28 & 2;
    }
    if ((_DWORD)v32)
    {
      int v94 = 138543362;
      id v95 = v14;
      id v33 = (void *)_os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  16LL,  "%{public}@: [PW] Payment sheet encountered an unknown error",  &v94,  12);

      if (!v33)
      {
        uint64_t v24 = 0LL;
        goto LABEL_41;
      }

      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  4LL));
      free(v33);
      v61 = v31;
      SSFileLog(v27, @"%@");
    }

    uint64_t v24 = 0LL;
    goto LABEL_40;
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v16) {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v17 = [v16 shouldLog];
  unsigned int v18 = [v16 shouldLogToDisk];
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
  v20 = v19;
  if (v18) {
    v17 |= 2u;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v21 = v17;
  }
  else {
    uint64_t v21 = v17 & 2;
  }
  if ((_DWORD)v21)
  {
    int v94 = 138543362;
    id v95 = v14;
    v22 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%{public}@: Preparing to display payment sheet",  &v94,  12);

    if (!v22) {
      goto LABEL_14;
    }
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
    free(v22);
    v61 = v20;
    SSFileLog(v16, @"%@");
  }

LABEL_14:
  id v67 = 0LL;
  -[PurchaseProtocolDataProvider runSubOperation:error:](self, "runSubOperation:error:", v15, &v67);
  id v23 = v67;
  uint64_t v24 = v23;
  if (!v23) {
    goto LABEL_42;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue([v23 domain]);
  if ([v25 isEqualToString:SSErrorDomain])
  {
    BOOL v26 = [v24 code] == (id)140;

    if (v26) {
      *((_BYTE *)v81 + 24) = 1;
    }
  }

  else
  {
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v61));
  if (!v27) {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v34) = [v27 shouldLog];
  unsigned int v35 = [v27 shouldLogToDisk];
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
  v31 = v36;
  if (v35) {
    LODWORD(v34) = v34 | 2;
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    uint64_t v34 = v34;
  }
  else {
    v34 &= 2u;
  }
  if (!(_DWORD)v34) {
    goto LABEL_40;
  }
  v37 = (void *)objc_opt_class(self);
  int v94 = 138543618;
  id v95 = v37;
  __int16 v96 = 2114;
  v97 = v24;
  id v38 = v37;
  LODWORD(v62) = 22;
  v39 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  16LL,  "%{public}@: Display payment sheet container operation failed with error: %{public}@",  &v94,  v62);

  if (v39)
  {
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v39,  4LL));
    free(v39);
    v61 = v31;
    SSFileLog(v27, @"%@");
LABEL_40:
  }

- (NSString)redirectActionParameters
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setRedirectActionParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end