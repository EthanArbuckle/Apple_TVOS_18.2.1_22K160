@interface IXSRemoteReverter
- (IXSRemoteReverter)initWithBundleID:(id)a3;
- (IXSRemoteReverterDelegate)delegate;
- (NSString)bundleID;
- (unsigned)remoteAction;
- (void)beginRevert;
- (void)setBundleID:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IXSRemoteReverter

- (IXSRemoteReverter)initWithBundleID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXSRemoteReverter;
  v5 = -[IXSRemoteReverter init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[IXSRemoteReverter setBundleID:](v5, "setBundleID:", v4);
  }

  return v6;
}

- (void)beginRevert
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000DCA0;
  v4[3] = &unk_100020830;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IXSRemoteReverter bundleID](self, "bundleID"));
  v6 = self;
  id v3 = v5;
  +[IXAppInstallCoordinator revertAppWithBundleID:completionWithApplicationRecord:]( &OBJC_CLASS___IXAppInstallCoordinator,  "revertAppWithBundleID:completionWithApplicationRecord:",  v3,  v4);
}

- (unsigned)remoteAction
{
  return 2;
}

- (IXSRemoteReverterDelegate)delegate
{
  return (IXSRemoteReverterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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