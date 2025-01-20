@interface ApplicationWorkspaceInstallPlaceholderOperation
- (ApplicationWorkspaceInstallPlaceholderOperation)initWithApplicationHandle:(id)a3 forceUpdate:(BOOL)a4;
- (ApplicationWorkspaceInstallPlaceholderOperation)initWithApplicationHandle:(id)a3 iconData:(id)a4;
- (BOOL)blocksAppInstallation;
- (id)_download;
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceInstallPlaceholderOperation

- (ApplicationWorkspaceInstallPlaceholderOperation)initWithApplicationHandle:(id)a3 forceUpdate:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ApplicationWorkspaceInstallPlaceholderOperation;
  return -[ApplicationWorkspaceOperation initWithApplicationHandle:](&v5, "initWithApplicationHandle:", a3, a4);
}

- (ApplicationWorkspaceInstallPlaceholderOperation)initWithApplicationHandle:(id)a3 iconData:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ApplicationWorkspaceInstallPlaceholderOperation;
  return -[ApplicationWorkspaceOperation initWithApplicationHandle:](&v5, "initWithApplicationHandle:", a3, a4);
}

- (BOOL)blocksAppInstallation
{
  return 1;
}

- (void)runWithCompletionBlock:(id)a3
{
  id v5 = -[ApplicationWorkspaceInstallPlaceholderOperation _download](self, "_download");
  v6 = -[ApplicationHandle bundleID]( -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle"),  "bundleID");
  if (!v6) {
    v6 = (NSString *)[v5 valueForProperty:@"bundle_id"];
  }
  +[ApplicationWorkspaceState completeNotificationForInstallingBundleIdentifier:]( &OBJC_CLASS___ApplicationWorkspaceState,  "completeNotificationForInstallingBundleIdentifier:",  v6);
  if (a3) {
    (*((void (**)(id, uint64_t, void, void))a3 + 2))(a3, 1LL, 0LL, 0LL);
  }
}

- (id)_download
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  v8 = sub_10017D434;
  v9 = sub_10017D444;
  uint64_t v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10017D450;
  v4[3] = &unk_10034FD38;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "readUsingTransactionBlock:",  v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end