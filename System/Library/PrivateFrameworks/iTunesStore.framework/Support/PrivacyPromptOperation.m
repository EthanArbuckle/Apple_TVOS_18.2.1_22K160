@interface PrivacyPromptOperation
- (NSString)privacyIdentifier;
- (OS_dispatch_semaphore)privacyPromptSemaphore;
- (PrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3;
- (id)_privacyAcknowledgementURLString;
- (id)completion;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)run;
- (void)setCompletion:(id)a3;
- (void)setPrivacyIdentifier:(id)a3;
- (void)setPrivacyPromptSemaphore:(id)a3;
@end

@implementation PrivacyPromptOperation

- (PrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PrivacyPromptOperation;
  v6 = -[PrivacyPromptOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_privacyIdentifier, a3);
  }

  return v7;
}

- (void)run
{
  int v3 = MKBGetDeviceLockState(0LL, a2);
  if (!v3 || v3 == 3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PrivacyPromptOperation privacyIdentifier](self, "privacyIdentifier"));
    if (!+[SSPrivacyController shouldDisplayPrivacyLinkWithIdentifier:]( &OBJC_CLASS___SSPrivacyController,  "shouldDisplayPrivacyLinkWithIdentifier:",  v4))
    {
      v34 = 0LL;
      uint64_t v26 = 2LL;
LABEL_84:

      goto LABEL_85;
    }

    id v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    privacyPromptSemaphore = self->_privacyPromptSemaphore;
    self->_privacyPromptSemaphore = v5;

    *(void *)v83 = 0LL;
    *(void *)&v83[8] = v83;
    *(void *)&v83[16] = 0x2020000000LL;
    LOBYTE(v84) = 0;
    id v76 = [[SBSRemoteAlertDefinition alloc] initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServicePrivacyPromptViewController"];
    id v7 = objc_alloc_init(&OBJC_CLASS___SBSRemoteAlertConfigurationContext);
    id v8 = objc_alloc_init(&OBJC_CLASS___BSMutableSettings);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472LL;
    v78[2] = sub_1001052A0;
    v78[3] = &unk_10034E100;
    v78[4] = self;
    v78[5] = v83;
    id v9 = [[BSAction alloc] initWithInfo:v8 timeout:0 forResponseOnQueue:v78 withHandler:0.0];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
    [v7 setActions:v10];
    v74 = v8;
    v75 = v9;
    v77 = v7;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[PrivacyPromptOperation _privacyAcknowledgementURLString](self, "_privacyAcknowledgementURLString"));
    v12 = (void *)v11;
    if (v4) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    int v14 = !v13;
    HIDWORD(v73) = v14;
    if (!v13)
    {
      v79[0] = @"privacyIdentifier";
      v79[1] = @"privacyAcknowledgementUrlString";
      v80[0] = v4;
      v80[1] = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  2LL));
      [v7 setUserInfo:v15];

      id v16 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:]( &OBJC_CLASS___SBSRemoteAlertHandle,  "newHandleWithDefinition:configurationContext:",  v76,  v7);
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v17) {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        LODWORD(v18) = [v17 shouldLog];
        unsigned int v19 = [v17 shouldLogToDisk];
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
        v21 = v20;
        if (v19) {
          LODWORD(v18) = v18 | 2;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v18 = v18;
        }
        else {
          v18 &= 2u;
        }
        if ((_DWORD)v18)
        {
          v22 = (void *)objc_opt_class(self);
          int v81 = 138543362;
          v82 = v22;
          id v23 = v22;
          LODWORD(v73) = 12;
          v24 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%{public}@: Remote handle created for privacy prompt operation",  &v81,  v73,  v74,  v75);

          if (!v24)
          {
LABEL_23:

            [v16 addObserver:self];
            [v16 activateWithContext:0];
            dispatch_semaphore_wait((dispatch_semaphore_t)self->_privacyPromptSemaphore, 0xFFFFFFFFFFFFFFFFLL);
            if (!*(_BYTE *)(*(void *)&v83[8] + 24LL))
            {
              uint64_t v26 = 0LL;
              goto LABEL_66;
            }

            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));
            +[SSPrivacyController acknowledgePrivacyLinkWithIdentifier:URL:]( &OBJC_CLASS___SSPrivacyController,  "acknowledgePrivacyLinkWithIdentifier:URL:",  v4,  v25);
            uint64_t v26 = 1LL;
LABEL_65:

LABEL_66:
            v34 = 0LL;
            goto LABEL_83;
          }

          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
          free(v24);
          v72 = v21;
          SSFileLog(v17, @"%@");
        }

        goto LABEL_23;
      }

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v53) {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      LODWORD(v54) = [v53 shouldLog];
      unsigned int v55 = [v53 shouldLogToDisk];
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue([v53 OSLogObject]);
      v57 = v56;
      if (v55) {
        LODWORD(v54) = v54 | 2;
      }
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        uint64_t v54 = v54;
      }
      else {
        v54 &= 2u;
      }
      if ((_DWORD)v54)
      {
        v58 = (void *)objc_opt_class(self);
        int v81 = 138543362;
        v82 = v58;
        id v59 = v58;
        LODWORD(v73) = 12;
        v60 = (void *)_os_log_send_and_compose_impl( v54,  0LL,  0LL,  0LL,  &_mh_execute_header,  v57,  16LL,  "%{public}@: Error creating remote alert handle for privacy prompt",  &v81,  v73,  v74,  v75);

        if (!v60)
        {
LABEL_80:

          uint64_t v61 = SSError(SSErrorDomain, 0LL, 0LL, 0LL);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v61);
          goto LABEL_82;
        }

        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v60,  4LL));
        free(v60);
        v72 = v57;
        SSFileLog(v53, @"%@");
      }

      goto LABEL_80;
    }

    if (v4)
    {
LABEL_50:
      if (v12)
      {
LABEL_63:
        id v16 = (id)objc_claimAutoreleasedReturnValue(-[PrivacyPromptOperation completion](self, "completion", v72));
        if (v16)
        {
          uint64_t v51 = SSError(SSErrorDomain, 0LL, 0LL, 0LL);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v51);
          uint64_t v26 = 3LL;
          (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, 3LL, v25);
          goto LABEL_65;
        }

        v34 = 0LL;
LABEL_82:
        uint64_t v26 = 3LL;
LABEL_83:

        _Block_object_dispose(v83, 8);
        if ((v73 & 0x100000000LL) == 0) {
          goto LABEL_99;
        }
        goto LABEL_84;
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v43) {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      LODWORD(v44) = objc_msgSend(v43, "shouldLog", v72);
      unsigned int v45 = [v43 shouldLogToDisk];
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
      v47 = v46;
      if (v45) {
        LODWORD(v44) = v44 | 2;
      }
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        uint64_t v44 = v44;
      }
      else {
        v44 &= 2u;
      }
      if ((_DWORD)v44)
      {
        v48 = (void *)objc_opt_class(self);
        int v81 = 138543362;
        v82 = v48;
        id v49 = v48;
        LODWORD(v73) = 12;
        v50 = (void *)_os_log_send_and_compose_impl( v44,  0LL,  0LL,  0LL,  &_mh_execute_header,  v47,  16LL,  "%{public}@: Ack URL nil",  &v81,  v73);

        if (!v50)
        {
LABEL_62:

          goto LABEL_63;
        }

        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v50,  4LL));
        free(v50);
        v72 = v47;
        SSFileLog(v43, @"%@");
      }

      goto LABEL_62;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v35) {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v36) = [v35 shouldLog];
    unsigned int v37 = [v35 shouldLogToDisk];
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
    v39 = v38;
    if (v37) {
      LODWORD(v36) = v36 | 2;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      uint64_t v36 = v36;
    }
    else {
      v36 &= 2u;
    }
    if ((_DWORD)v36)
    {
      v40 = (void *)objc_opt_class(self);
      int v81 = 138543362;
      v82 = v40;
      id v41 = v40;
      LODWORD(v73) = 12;
      v42 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  16LL,  "%{public}@: Identifier nil",  &v81,  v73,  v74,  v75);

      if (!v42)
      {
LABEL_49:

        goto LABEL_50;
      }

      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v42,  4LL));
      free(v42);
      v72 = v39;
      SSFileLog(v35, @"%@");
    }

    goto LABEL_49;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v27) {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v28 = [v27 shouldLog];
  else {
    LODWORD(v29) = v28;
  }
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    uint64_t v29 = v29;
  }
  else {
    v29 &= 2u;
  }
  if ((_DWORD)v29)
  {
    *(_DWORD *)v83 = 138543362;
    *(void *)&v83[4] = objc_opt_class(self);
    id v31 = *(id *)&v83[4];
    v32 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  16LL,  "%{public}@: Denying request to display privacy prompt because the device is locked.",  v83,  12);

    if (v32)
    {
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
      free(v32);
      v72 = v33;
      SSFileLog(v27, @"%@");
    }
  }

  else
  {
  }

  uint64_t v52 = SSError(SSErrorDomain, 14LL, 0LL, 0LL);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v52);
  uint64_t v26 = 3LL;
LABEL_85:
  -[PrivacyPromptOperation setError:](self, "setError:", v34, v72);
  -[PrivacyPromptOperation setSuccess:](self, "setSuccess:", (unint64_t)(v26 - 1) < 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v62) {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v63 = [v62 shouldLog];
  else {
    unsigned int v64 = v63;
  }
  v65 = (os_log_s *)objc_claimAutoreleasedReturnValue([v62 OSLogObject]);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v66 = v64;
  }
  else {
    uint64_t v66 = v64 & 2;
  }
  if ((_DWORD)v66)
  {
    v67 = (void *)objc_opt_class(self);
    id v68 = v67;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v26));
    *(_DWORD *)v83 = 138543874;
    *(void *)&v83[4] = v67;
    *(_WORD *)&v83[12] = 2114;
    *(void *)&v83[14] = v69;
    *(_WORD *)&v83[22] = 2114;
    v84 = v34;
    LODWORD(v73) = 32;
    v70 = (void *)_os_log_send_and_compose_impl( v66,  0LL,  0LL,  0LL,  &_mh_execute_header,  v65,  0LL,  "%{public}@: Privacy prompt operation completed with result: %{public}@, error: %{public}@",  v83,  v73);

    if (!v70) {
      goto LABEL_97;
    }
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v70,  4LL));
    free(v70);
    SSFileLog(v62, @"%@");
  }

LABEL_97:
  uint64_t v71 = objc_claimAutoreleasedReturnValue(-[PrivacyPromptOperation completion](self, "completion"));
  v4 = (void *)v71;
  if (v71) {
    (*(void (**)(uint64_t, uint64_t, void *))(v71 + 16))(v71, v26, v34);
  }
LABEL_99:
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3));
  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if (!(_DWORD)v6) {
    goto LABEL_12;
  }
  int v10 = 138543362;
  id v11 = (id)objc_opt_class(self);
  id v8 = v11;
  id v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%{public}@: Remote handle did deactivate",  &v10,  12);

  if (v9)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    SSFileLog(v4, @"%@");
LABEL_12:
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_privacyPromptSemaphore);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_12;
  }
  int v12 = 138543618;
  id v13 = (id)objc_opt_class(self);
  __int16 v14 = 2114;
  id v15 = v5;
  id v10 = v13;
  id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%{public}@: Remote handle did invalidate with error: %{public}@",  &v12,  22);

  if (v11)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    SSFileLog(v6, @"%@");
LABEL_12:
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_privacyPromptSemaphore);
}

- (id)_privacyAcknowledgementURLString
{
  int v3 = objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  id v5 = -[ISLoadURLBagOperation initWithBagContext:](v3, "initWithBagContext:", v4);

  id v20 = 0LL;
  unsigned int v6 = -[PrivacyPromptOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v5,  &v20);
  id v7 = v20;
  uint64_t v8 = v7;
  if (!v6)
  {
    if (!v7)
    {
LABEL_17:
      id v9 = 0LL;
      goto LABEL_18;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      __int16 v14 = (void *)objc_opt_class(self);
      int v21 = 138543362;
      v22 = v14;
      id v15 = v14;
      id v16 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "%{public}@: Error fetching bag",  &v21,  12);

      if (!v16)
      {
LABEL_16:

        goto LABEL_17;
      }

      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      unsigned int v19 = v13;
      SSFileLog(v10, @"%@");
    }

    goto LABEL_16;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v5, "URLBag"));
LABEL_18:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", @"privacyAcknowledgementUrl", v19));

  return v17;
}

- (id)completion
{
  return objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCompletion:(id)a3
{
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void)setPrivacyIdentifier:(id)a3
{
}

- (OS_dispatch_semaphore)privacyPromptSemaphore
{
  return self->_privacyPromptSemaphore;
}

- (void)setPrivacyPromptSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end