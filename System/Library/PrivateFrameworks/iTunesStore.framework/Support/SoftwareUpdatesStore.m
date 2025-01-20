@interface SoftwareUpdatesStore
+ (id)defaultStore;
+ (void)hideAppstoredPendingUpdatesBadgeWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)reloadAppstoredUpdatesWithMessage:(id)a3 connection:(id)a4;
- (SoftwareUpdatesStore)init;
@end

@implementation SoftwareUpdatesStore

- (SoftwareUpdatesStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SoftwareUpdatesStore;
  return -[SoftwareUpdatesStore init](&v3, "init");
}

+ (id)defaultStore
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100180820;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A35B8 != -1) {
    dispatch_once(&qword_1003A35B8, block);
  }
  return (id)qword_1003A35B0;
}

+ (void)hideAppstoredPendingUpdatesBadgeWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  int v11 = 138412546;
  id v12 = (id)objc_opt_class(a1);
  __int16 v13 = 2112;
  id v14 = v4;
  id v9 = v12;
  v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "[%@]: Skipping most of server registration for server %@ since we are using appstored software updates",  &v11,  22);

  if (v10)
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_12:
  }

  [v4 addObserver:a1 selector:"hideAppstoredPendingUpdatesBadgeWithMessage:connection:" forMessage:118];
  [v4 addObserver:a1 selector:"reloadAppstoredUpdatesWithMessage:connection:" forMessage:106];
}

+ (void)reloadAppstoredUpdatesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100180AEC;
  v9[3] = &unk_100350878;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  +[AppStoreUtility reloadUpdatesWithCompletionBlock:]( &OBJC_CLASS___AppStoreUtility,  "reloadUpdatesWithCompletionBlock:",  v9);
}

@end