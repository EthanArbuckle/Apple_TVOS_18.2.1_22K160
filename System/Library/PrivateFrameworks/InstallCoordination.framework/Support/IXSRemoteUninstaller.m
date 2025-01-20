@interface IXSRemoteUninstaller
+ (BOOL)isUninstallProhibited;
- (IXSRemoteUninstaller)initWithBundleID:(id)a3;
- (IXSRemoteUninstallerDelegate)delegate;
- (NSString)bundleID;
- (unsigned)remoteAction;
- (void)beginUninstall;
- (void)setBundleID:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IXSRemoteUninstaller

- (IXSRemoteUninstaller)initWithBundleID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXSRemoteUninstaller;
  v5 = -[IXSRemoteUninstaller init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[IXSRemoteUninstaller setBundleID:](v5, "setBundleID:", v4);
  }

  return v6;
}

- (void)beginUninstall
{
  if ([(id)objc_opt_class(self) isUninstallProhibited])
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[IXSRemoteUninstaller delegate](self, "delegate"));
    if (v8)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteUninstaller bundleID](self, "bundleID"));
      id v5 = sub_1000095BC( (uint64_t)"-[IXSRemoteUninstaller beginUninstall]",  77LL,  @"IXRemoteErrorDomain",  10LL,  0LL,  0LL,  @"Cannot uninstall %@ because it's prohibited by ManagedConfiguration",  v4,  (uint64_t)v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

      [v8 remoteUninstaller:self completedWithError:v6];
    }
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100012DB4;
    v9[3] = &unk_100020880;
    v9[4] = self;
    v7 = objc_retainBlock(v9);
    ((void (*)(void))v7[2])();
  }

- (unsigned)remoteAction
{
  return 3;
}

+ (BOOL)isUninstallProhibited
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAppRemovalAllowed] == 2;

  return v3;
}

- (IXSRemoteUninstallerDelegate)delegate
{
  return (IXSRemoteUninstallerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end