@interface ApplicationWorkspaceOperation
- (ApplicationHandle)applicationHandle;
- (ApplicationWorkspaceOperation)initWithApplicationHandle:(id)a3;
- (BOOL)applicationIsInstalled:(id)a3;
- (BOOL)blocksAppInstallation;
- (void)dealloc;
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceOperation

- (ApplicationWorkspaceOperation)initWithApplicationHandle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ApplicationWorkspaceOperation;
  v4 = -[ApplicationWorkspaceOperation init](&v6, "init");
  if (v4) {
    v4->_applicationHandle = (ApplicationHandle *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ApplicationWorkspaceOperation;
  -[ApplicationWorkspaceOperation dealloc](&v3, "dealloc");
}

- (BOOL)applicationIsInstalled:(id)a3
{
  if (a3)
  {
    id v4 = [a3 length];
    if (v4)
    {
      id v4 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  a3);
      if (v4)
      {
        v5 = v4;
        else {
          LOBYTE(v4) = [v5 isPlaceholder];
        }
      }
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (BOOL)blocksAppInstallation
{
  return 0;
}

- (void)runWithCompletionBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void, void))a3 + 2))(a3, 0LL, 0LL, 0LL);
  }
}

- (ApplicationHandle)applicationHandle
{
  return self->_applicationHandle;
}

@end