@interface RescueAbandonedPlaceholderOperation
- (BOOL)_attemptRescueForBundleID:(id)a3 error:(id *)a4;
- (BOOL)_canRescueInstallTypeForBundleID:(id)a3 proxy:(id)a4 error:(id *)a5;
- (BOOL)_isRestoreRunning;
- (RescueAbandonedPlaceholderOperation)initWithBundleIdentifier:(id)a3;
- (id)_fetchAppProxyForBundleID:(id)a3 error:(id *)a4;
- (id)outputBlock;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation RescueAbandonedPlaceholderOperation

- (RescueAbandonedPlaceholderOperation)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RescueAbandonedPlaceholderOperation;
  v5 = -[RescueAbandonedPlaceholderOperation init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = v6;
  }

  return v5;
}

- (id)outputBlock
{
  id v3 = [self->_outputBlock copy];
  -[RescueAbandonedPlaceholderOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  -[RescueAbandonedPlaceholderOperation lock](self, "lock");
  id v5 = [v4 copy];

  id outputBlock = self->_outputBlock;
  self->_id outputBlock = v5;

  -[RescueAbandonedPlaceholderOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    v7 = (void *)objc_opt_class(self);
    bundleID = self->_bundleID;
    int v25 = 138412546;
    v26 = v7;
    __int16 v27 = 2112;
    v28 = bundleID;
    id v9 = v7;
    v10 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%@: Preparing to rescue application with bundleID: %@",  &v25,  22);

    if (!v10) {
      goto LABEL_13;
    }
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    v21 = v6;
    SSFileLog(v3, @"%@");
  }

LABEL_13:
  v11 = self->_bundleID;
  if (v11)
  {
    id v24 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[RescueAbandonedPlaceholderOperation _fetchAppProxyForBundleID:error:]( self,  "_fetchAppProxyForBundleID:error:",  v11,  &v24));
    id v13 = v24;
    BOOL v14 = 0LL;
    if (!v13)
    {
      if (v12)
      {
        v15 = self->_bundleID;
        id v23 = 0LL;
        unsigned int v16 = -[RescueAbandonedPlaceholderOperation _canRescueInstallTypeForBundleID:proxy:error:]( self,  "_canRescueInstallTypeForBundleID:proxy:error:",  v15,  v12,  &v23);
        id v13 = v23;
        BOOL v14 = 0LL;
        if (!v13)
        {
          if (v16)
          {
            v17 = self->_bundleID;
            id v22 = 0LL;
            BOOL v14 = -[RescueAbandonedPlaceholderOperation _attemptRescueForBundleID:error:]( self,  "_attemptRescueForBundleID:error:",  v17,  &v22);
            id v13 = v22;
          }
        }
      }
    }
  }

  else
  {
    uint64_t v18 = SSError(SSErrorDomain, 137LL, 0LL, 0LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v18);
    v12 = 0LL;
    BOOL v14 = 0LL;
  }

  -[RescueAbandonedPlaceholderOperation setError:](self, "setError:", v13, v21);
  -[RescueAbandonedPlaceholderOperation setSuccess:](self, "setSuccess:", v14);
  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[RescueAbandonedPlaceholderOperation outputBlock](self, "outputBlock"));
  v20 = (void *)v19;
  if (v19)
  {
    (*(void (**)(uint64_t, BOOL, id))(v19 + 16))(v19, v14, v13);
    -[RescueAbandonedPlaceholderOperation setOutputBlock:](self, "setOutputBlock:", 0LL);
  }
}

- (BOOL)_attemptRescueForBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    int v26 = 138412546;
    id v27 = (id)objc_opt_class(self);
    __int16 v28 = 2112;
    id v29 = v6;
    id v11 = v27;
    v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Attempting rescue restore for bundleID: %@",  &v26,  22);

    if (!v12) {
      goto LABEL_13;
    }
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    SSFileLog(v7, @"%@");
  }

LABEL_13:
  id v13 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v6, 0LL);
  BOOL v14 = -[RestoreDemotedApplicationsOperation initWithBundleIdentifiers:options:]( objc_alloc(&OBJC_CLASS___RestoreDemotedApplicationsOperation),  "initWithBundleIdentifiers:options:",  v13,  0LL);
  id v25 = 0LL;
  -[RescueAbandonedPlaceholderOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v14,  &v25);
  id v15 = v25;
  if (!v15) {
    goto LABEL_27;
  }
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v16) {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v17 = [v16 shouldLog];
  else {
    LODWORD(v18) = v17;
  }
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v18 = v18;
  }
  else {
    v18 &= 2u;
  }
  if (!(_DWORD)v18) {
    goto LABEL_25;
  }
  v20 = (void *)objc_opt_class(self);
  int v26 = 138412802;
  id v27 = v20;
  __int16 v28 = 2112;
  id v29 = v6;
  __int16 v30 = 2112;
  id v31 = v15;
  id v21 = v20;
  LODWORD(v24) = 32;
  id v22 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: Rescue restore attempt for bundleID: %@ failed due to error: %@",  &v26,  v24);

  if (v22)
  {
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
    free(v22);
    SSFileLog(v16, @"%@");
LABEL_25:
  }

LABEL_27:
  if (a4) {
    *a4 = v15;
  }

  return v15 == 0LL;
}

- (BOOL)_canRescueInstallTypeForBundleID:(id)a3 proxy:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 installType];
  if (v9 == (id)2)
  {
    if (-[RescueAbandonedPlaceholderOperation _isRestoreRunning](self, "_isRestoreRunning"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v10) {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v16 = [v10 shouldLog];
      else {
        LODWORD(v17) = v16;
      }
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v17;
      }
      else {
        v17 &= 2u;
      }
      if (!(_DWORD)v17) {
        goto LABEL_26;
      }
      *(_DWORD *)id v23 = 138412546;
      *(void *)&v23[4] = objc_opt_class(self);
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v8;
      id v14 = *(id *)&v23[4];
      uint64_t v15 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Restore in progress for bundleID: %@",  v23,  22,  *(_OWORD *)v23,  *(void *)&v23[16]);
      goto LABEL_24;
    }

- (id)_fetchAppProxyForBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6));
  if (!v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v25 = 138412546;
      id v26 = (id)objc_opt_class(self);
      __int16 v27 = 2112;
      id v28 = v6;
      id v14 = v26;
      uint64_t v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Cannot find application with bundleID: %@",  &v25,  22);

      if (!v15)
      {
LABEL_18:

        uint64_t v16 = SSError(SSErrorDomain, 118LL, 0LL, 0LL);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
        goto LABEL_32;
      }

      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      SSFileLog(v10, @"%@");
    }

    goto LABEL_18;
  }

  id v8 = v7;
  if (![v7 isInstalled] || (objc_msgSend(v8, "isPlaceholder") & 1) != 0)
  {
    id v9 = 0LL;
    if (!a4) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v17) {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v18 = [v17 shouldLog];
  else {
    LODWORD(v19) = v18;
  }
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v19 = v19;
  }
  else {
    v19 &= 2u;
  }
  if (!(_DWORD)v19) {
    goto LABEL_30;
  }
  int v25 = 138412546;
  id v26 = (id)objc_opt_class(self);
  __int16 v27 = 2112;
  id v28 = v6;
  id v21 = v26;
  id v22 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%@: Application does not need rescue, bundleID: %@ is already installed!",  &v25,  22);

  if (v22)
  {
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
    free(v22);
    SSFileLog(v17, @"%@");
LABEL_30:
  }

  uint64_t v23 = SSError(SSErrorDomain, 144LL, 0LL, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v23);

LABEL_32:
  id v8 = 0LL;
  if (a4) {
LABEL_33:
  }
    *a4 = v9;
LABEL_34:

  return v8;
}

- (BOOL)_isRestoreRunning
{
  id v2 = objc_alloc_init((Class)sub_1000C4498());
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 restoreState]);
  BOOL v4 = [v3 state] == 2;

  return v4;
}

- (void).cxx_destruct
{
}

@end