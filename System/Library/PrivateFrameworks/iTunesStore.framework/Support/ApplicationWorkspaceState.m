@interface ApplicationWorkspaceState
+ (BOOL)_completeNotification:(id)a3 bundleIdentifier:(id)a4;
+ (BOOL)_incompleteNotification:(id)a3 forDownload:(int64_t)a4 bundleIdentifier:(id)a5;
+ (BOOL)completeNotificationForCanceledBundleIdentifier:(id)a3;
+ (BOOL)completeNotificationForFailedBundleIdentifier:(id)a3;
+ (BOOL)completeNotificationForInstallingBundleIdentifier:(id)a3;
+ (BOOL)deleteIncompleteNotification:(id)a3 forBundleIdentifier:(id)a4;
+ (BOOL)incompleteNotificationForCanceledDownload:(int64_t)a3 bundleIdentifier:(id)a4;
+ (BOOL)incompleteNotificationForFailedDownload:(int64_t)a3 bundleIdentifier:(id)a4;
+ (BOOL)incompleteNotificationForInstallingDownload:(int64_t)a3 bundleIdentifier:(id)a4;
+ (id)databaseTable;
@end

@implementation ApplicationWorkspaceState

+ (id)databaseTable
{
  return @"application_workspace_state";
}

+ (BOOL)completeNotificationForCanceledBundleIdentifier:(id)a3
{
  return [a1 _completeNotification:SSDownloadPhaseCanceled bundleIdentifier:a3];
}

+ (BOOL)completeNotificationForFailedBundleIdentifier:(id)a3
{
  return [a1 _completeNotification:SSDownloadPhaseFailed bundleIdentifier:a3];
}

+ (BOOL)completeNotificationForInstallingBundleIdentifier:(id)a3
{
  return [a1 _completeNotification:SSDownloadPhaseInstalling bundleIdentifier:a3];
}

+ (BOOL)deleteIncompleteNotification:(id)a3 forBundleIdentifier:(id)a4
{
  return [a1 _completeNotification:a3 bundleIdentifier:a4];
}

+ (BOOL)incompleteNotificationForCanceledDownload:(int64_t)a3 bundleIdentifier:(id)a4
{
  return [a1 _incompleteNotification:SSDownloadPhaseCanceled forDownload:a3 bundleIdentifier:a4];
}

+ (BOOL)incompleteNotificationForFailedDownload:(int64_t)a3 bundleIdentifier:(id)a4
{
  return [a1 _incompleteNotification:SSDownloadPhaseFailed forDownload:a3 bundleIdentifier:a4];
}

+ (BOOL)incompleteNotificationForInstallingDownload:(int64_t)a3 bundleIdentifier:(id)a4
{
  return [a1 _incompleteNotification:SSDownloadPhaseInstalling forDownload:a3 bundleIdentifier:a4];
}

+ (BOOL)_completeNotification:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3);
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  v9 = (os_log_s *)[v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if ((_DWORD)v8)
  {
    int v13 = 138412546;
    uint64_t v14 = objc_opt_class(a1);
    __int16 v15 = 2112;
    id v16 = a4;
    uint64_t v10 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "[%@] Ignoring complete notification for %@ because appstored is enabled",  &v13,  22);
    if (v10)
    {
      v11 = (void *)v10;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      SSFileLog(v6, @"%@");
    }
  }

  return 0;
}

+ (BOOL)_incompleteNotification:(id)a3 forDownload:(int64_t)a4 bundleIdentifier:(id)a5
{
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  if (SSDebugShouldUseAppstored(a1, a2))
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v10) = [v9 shouldLog];
    unsigned int v11 = [v9 shouldLogToDisk];
    v12 = (os_log_s *)[v9 OSLogObject];
    int v13 = v12;
    if (v11) {
      LODWORD(v10) = v10 | 2;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      uint64_t v14 = objc_opt_class(a1);
      id v15 = +[SSStackShot generateSymbolicatedStackShot](&OBJC_CLASS___SSStackShot, "generateSymbolicatedStackShot");
      int v34 = 138412802;
      uint64_t v35 = v14;
      __int16 v36 = 2048;
      int64_t v37 = a4;
      __int16 v38 = 2112;
      id v39 = v15;
      uint64_t v16 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "[%@] Ignoring incomplete notification for %lld because appstored is enabled: %@",  &v34,  32);
      if (v16)
      {
        v17 = (void *)v16;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        SSFileLog(v9, @"%@");
      }
    }
  }

  else
  {
    id v18 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v18) {
      id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v19) = [v18 shouldLog];
    unsigned int v20 = [v18 shouldLogToDisk];
    v21 = (os_log_s *)[v18 OSLogObject];
    v22 = v21;
    if (v20) {
      LODWORD(v19) = v19 | 2;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      uint64_t v23 = objc_opt_class(a1);
      int v34 = 138412802;
      uint64_t v35 = v23;
      __int16 v36 = 2112;
      int64_t v37 = (int64_t)a3;
      __int16 v38 = 2112;
      id v39 = a5;
      uint64_t v24 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  1LL,  "[%@] Requesting [%@] Notification: [%@]",  &v34,  32);
      if (v24)
      {
        v25 = (void *)v24;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v24, 4LL);
        free(v25);
        SSFileLog(v18, @"%@");
      }
    }

    v26 = objc_autoreleasePoolPush();
    if ([a5 length])
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10003E040;
      v29[3] = &unk_10034BC68;
      v29[4] = a5;
      v29[5] = a3;
      v29[6] = &v30;
      v29[7] = a4;
      objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingTransactionBlock:",  v29);
    }

    objc_autoreleasePoolPop(v26);
  }

  char v27 = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v30, 8);
  return v27;
}

@end