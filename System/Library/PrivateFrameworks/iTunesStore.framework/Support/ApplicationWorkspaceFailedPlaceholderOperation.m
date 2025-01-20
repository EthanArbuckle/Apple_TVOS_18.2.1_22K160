@interface ApplicationWorkspaceFailedPlaceholderOperation
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceFailedPlaceholderOperation

- (void)runWithCompletionBlock:(id)a3
{
  id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  v8 = (os_log_s *)[v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    int v21 = 138412546;
    uint64_t v22 = objc_opt_class(self);
    __int16 v23 = 2112;
    v24 = -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle");
    uint64_t v10 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "[%@]: Failed Placeholder for %@",  &v21,  22);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      v20 = v12;
      *(void *)&double v9 = SSFileLog(v5, @"%@").n128_u64[0];
    }
  }

  v13 = -[ApplicationHandle bundleID]( -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle", v9, v20),  "bundleID");
  id v14 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  if (!-[ApplicationWorkspaceOperation applicationIsInstalled:](self, "applicationIsInstalled:", v13)) {
    goto LABEL_20;
  }
  id v15 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v13,  1LL);
  if (!v15) {
    goto LABEL_23;
  }
  id v16 = v15;
  id v17 = [v14 installProgressForApplication:v15 withPhase:0];
  if ([v17 installState] != (id)4) {
    [v17 setInstallState:4];
  }
  id v18 = [v14 installProgressForApplication:v16 withPhase:0];
  if ([v18 installState] != (id)4) {
    [v18 setInstallState:4];
  }
  if ([v14 installPhaseFinishedForProgress:v18])
  {
LABEL_20:
    +[ApplicationWorkspaceState completeNotificationForFailedBundleIdentifier:]( &OBJC_CLASS___ApplicationWorkspaceState,  "completeNotificationForFailedBundleIdentifier:",  v13);
    uint64_t v19 = 1LL;
    if (!a3) {
      return;
    }
  }

  else
  {
LABEL_23:
    uint64_t v19 = 0LL;
    if (!a3) {
      return;
    }
  }

  (*((void (**)(id, uint64_t, void, void))a3 + 2))(a3, v19, 0LL, 0LL);
}

@end