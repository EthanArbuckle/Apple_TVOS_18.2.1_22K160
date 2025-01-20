@interface ApplicationWorkspaceClearProgressOperation
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceClearProgressOperation

- (void)runWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  unsigned int v8 = -[ApplicationWorkspaceOperation applicationIsInstalled:](self, "applicationIsInstalled:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  self->_bundleID,  1LL));
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 installProgressForApplication:v9 withPhase:0]);
    v11 = v10;
    if (v10)
    {
      -[os_log_s cancel](v10, "cancel");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v12) {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v13 = [v12 shouldLog];
      else {
        LODWORD(v14) = v13;
      }
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v14;
      }
      else {
        v14 &= 2u;
      }
      if (!(_DWORD)v14) {
        goto LABEL_37;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle"));
      *(_DWORD *)v25 = 138412546;
      *(void *)&v25[4] = v16;
      *(_WORD *)&v25[12] = 2112;
      *(void *)&v25[14] = v11;
      uint64_t v17 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[ApplicationWorkspace]: Cancelled progress for %@ progress: %@",  v25,  22,  *(_OWORD *)v25,  *(void *)&v25[16]);
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v12) {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v22 = [v12 shouldLog];
      else {
        LODWORD(v23) = v22;
      }
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v23 = v23;
      }
      else {
        v23 &= 2u;
      }
      if (!(_DWORD)v23) {
        goto LABEL_37;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle"));
      *(_DWORD *)v25 = 138412546;
      *(void *)&v25[4] = v16;
      *(_WORD *)&v25[12] = 2112;
      *(void *)&v25[14] = 0LL;
      uint64_t v17 = _os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[ApplicationWorkspace]: Could not find progress to cancel for %@ progress: %@",  v25,  22,  *(_OWORD *)v25,  *(void *)&v25[16]);
    }

    v24 = (void *)v17;

    if (!v24)
    {
LABEL_38:

      goto LABEL_39;
    }

    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
    free(v24);
    SSFileLog(v12, @"%@");
LABEL_37:

    goto LABEL_38;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v18 = [v9 shouldLog];
  else {
    LODWORD(v19) = v18;
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v19 = v19;
  }
  else {
    v19 &= 2u;
  }
  if ((_DWORD)v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle"));
    *(_DWORD *)v25 = 138412290;
    *(void *)&v25[4] = v20;
    v21 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[ApplicationWorkspace]: No placeholder with progress to cancel, skipping uninstall: %@",  v25,  12);

    if (!v21) {
      goto LABEL_40;
    }
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
    free(v21);
    SSFileLog(v9, @"%@");
  }

- (void).cxx_destruct
{
}

@end