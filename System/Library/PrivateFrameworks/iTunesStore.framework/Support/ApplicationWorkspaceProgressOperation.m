@interface ApplicationWorkspaceProgressOperation
- (ApplicationWorkspaceProgressOperation)initWithApplicationDownloadProgress:(id)a3;
- (void)dealloc;
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceProgressOperation

- (ApplicationWorkspaceProgressOperation)initWithApplicationDownloadProgress:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ApplicationWorkspaceProgressOperation;
  v4 = -[ApplicationWorkspaceOperation initWithApplicationHandle:]( &v6,  "initWithApplicationHandle:",  [a3 applicationHandle]);
  if (v4) {
    v4->_applicationProgress = (ApplicationDownloadProgress *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ApplicationWorkspaceProgressOperation;
  -[ApplicationWorkspaceOperation dealloc](&v3, "dealloc");
}

- (void)runWithCompletionBlock:(id)a3
{
  v5 = -[ApplicationHandle bundleID]( -[ApplicationWorkspaceOperation applicationHandle](self, "applicationHandle"),  "bundleID");
  if (v5)
  {
    id v6 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v5,  1LL);
    if ([v6 foundBackingBundle])
    {
      id v7 = objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "installProgressForApplication:withPhase:",  v6,  0);
      [v7 setInstallState:1];
      objc_msgSend( v7,  "setCompletedUnitCount:",  -[ApplicationDownloadProgress completedUnitCount](self->_applicationProgress, "completedUnitCount"));
      objc_msgSend( v7,  "setTotalUnitCount:",  -[ApplicationDownloadProgress totalUnitCount](self->_applicationProgress, "totalUnitCount"));
    }
  }

  if (a3) {
    (*((void (**)(id, void, void, void))a3 + 2))(a3, 0LL, 0LL, 0LL);
  }
}

@end