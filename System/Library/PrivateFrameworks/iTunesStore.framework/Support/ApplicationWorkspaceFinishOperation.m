@interface ApplicationWorkspaceFinishOperation
- (ApplicationWorkspaceFinishOperation)initWithApplicationHandle:(id)a3;
- (ApplicationWorkspaceFinishOperation)initWithApplicationHandle:(id)a3 isPlaceholderRestore:(BOOL)a4;
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceFinishOperation

- (ApplicationWorkspaceFinishOperation)initWithApplicationHandle:(id)a3
{
  return -[ApplicationWorkspaceFinishOperation initWithApplicationHandle:isPlaceholderRestore:]( self,  "initWithApplicationHandle:isPlaceholderRestore:",  a3,  0LL);
}

- (ApplicationWorkspaceFinishOperation)initWithApplicationHandle:(id)a3 isPlaceholderRestore:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ApplicationWorkspaceFinishOperation;
  result = -[ApplicationWorkspaceOperation initWithApplicationHandle:](&v6, "initWithApplicationHandle:", a3);
  if (result) {
    result->_isPlaceholderRestore = a4;
  }
  return result;
}

- (void)runWithCompletionBlock:(id)a3
{
  v5 = -[ApplicationHandle bundleID]( -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle"),  "bundleID");
  id v6 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  BOOL isPlaceholderRestore = self->_isPlaceholderRestore;
  id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v9 = v8;
  if (isPlaceholderRestore)
  {
    if (!v8) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      *(_DWORD *)v37 = 138412290;
      *(void *)&v37[4] = -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle");
      uint64_t v14 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[ApplicationWorkspace]: Restoring placeholder for %@",  v37,  12,  *(_OWORD *)v37);
      goto LABEL_22;
    }
  }

  else
  {
    if (!v8) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v15 = [v9 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    v17 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      *(_DWORD *)v37 = 138412290;
      *(void *)&v37[4] = -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle");
      uint64_t v14 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[ApplicationWorkspace]: Updating placeholder for %@",  v37,  12,  *(_OWORD *)v37);
LABEL_22:
      v18 = (void *)v14;
      if (v14)
      {
        v19 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v18);
        v35 = v19;
        *(void *)&double v13 = SSFileLog(v9, @"%@").n128_u64[0];
      }
    }
  }

  if (-[ApplicationWorkspaceOperation applicationIsInstalled:](self, "applicationIsInstalled:", v5, v13, v35))
  {
    uint64_t v20 = (uint64_t)+[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v5,  1LL);
    if (v20)
    {
      id v22 = [v6 installProgressForApplication:v20 withPhase:0];
      if ([v22 installState] != (id)5)
      {
        [v22 setCompletedUnitCount:1];
        [v22 setInstallState:5];
        [v22 setTotalUnitCount:1];
      }

      if ([v6 installPhaseFinishedForProgress:v22])
      {
        uint64_t v20 = 1LL;
      }

      else
      {
        id v29 = [v6 installProgressForApplication:v20 withPhase:0];
        if ([v29 installState] != (id)5)
        {
          [v29 setCompletedUnitCount:1];
          [v29 setInstallState:5];
          [v29 setTotalUnitCount:1];
        }

        uint64_t v20 = (uint64_t)[v6 installPhaseFinishedForProgress:v29];
      }

      id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v23) {
        id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      int v30 = [v23 shouldLog];
      LODWORD(v31) = [v23 shouldLogToDisk] ? v30 | 2 : v30;
      v32 = (os_log_s *)[v23 OSLogObject];
      uint64_t v31 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT) ? v31 : v31 & 2u;
      if ((_DWORD)v31)
      {
        v33 = self->_isPlaceholderRestore ? @"restored" : @"updated";
        v34 = -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle");
        *(_DWORD *)v37 = 138412802;
        *(void *)&v37[4] = v33;
        *(_WORD *)&v37[12] = 2112;
        *(void *)&v37[14] = v34;
        __int16 v38 = 1024;
        int v39 = v20;
        LODWORD(v36) = 28;
        v28 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "[ApplicationWorkspace]: Placeholder %@ for %@ success: %d",  v37,  v36);
        if (v28)
        {
LABEL_58:
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v28, 4LL);
          free(v28);
          __n128 v21 = SSFileLog(v23, @"%@");
        }
      }
    }
  }

  else
  {
    id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v23) {
      id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v24 = [v23 shouldLog];
    else {
      LODWORD(v25) = v24;
    }
    v26 = (os_log_s *)[v23 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v25 = v25;
    }
    else {
      v25 &= 2u;
    }
    if (!(_DWORD)v25)
    {
      uint64_t v20 = 0LL;
      goto LABEL_59;
    }

    v27 = -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle");
    *(_DWORD *)v37 = 138412290;
    *(void *)&v37[4] = v27;
    LODWORD(v36) = 12;
    v28 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[ApplicationWorkspace]: Placeholder not installed for %@ because application not installed",  v37,  v36);
    uint64_t v20 = 0LL;
    if (v28) {
      goto LABEL_58;
    }
  }

@end