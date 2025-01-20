@interface MISharedAppNotificationManager
+ (id)instanceForCurrentUser;
- (BOOL)clearPendingUpdates:(id)a3 error:(id *)a4;
- (BOOL)markAppAsUpdatedForOtherUsers:(id)a3 error:(id *)a4;
- (MISharedAppNotificationManager)init;
- (id)updatedAppsWithError:(id *)a3;
@end

@implementation MISharedAppNotificationManager

+ (id)instanceForCurrentUser
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002192C;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095B18 != -1) {
    dispatch_once(&qword_100095B18, block);
  }
  return (id)qword_100095B10;
}

- (MISharedAppNotificationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MISharedAppNotificationManager;
  return -[MISharedAppNotificationManager init](&v3, "init");
}

- (BOOL)markAppAsUpdatedForOtherUsers:(id)a3 error:(id *)a4
{
  id v6 = sub_1000130F4( (uint64_t)"-[MISharedAppNotificationManager markAppAsUpdatedForOtherUsers:error:]",  42LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v4,  (uint64_t)"-[MISharedAppNotificationManager markAppAsUpdatedForOtherUsers:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (id)updatedAppsWithError:(id *)a3
{
  id v5 = sub_1000130F4( (uint64_t)"-[MISharedAppNotificationManager updatedAppsWithError:]",  51LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v3,  (uint64_t)"-[MISharedAppNotificationManager updatedAppsWithError:]");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (a3) {
    *a3 = v6;
  }

  return 0LL;
}

- (BOOL)clearPendingUpdates:(id)a3 error:(id *)a4
{
  id v6 = sub_1000130F4( (uint64_t)"-[MISharedAppNotificationManager clearPendingUpdates:error:]",  60LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v4,  (uint64_t)"-[MISharedAppNotificationManager clearPendingUpdates:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

@end