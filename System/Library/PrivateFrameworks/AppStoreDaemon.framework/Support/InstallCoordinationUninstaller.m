@interface InstallCoordinationUninstaller
- (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withResultHandler:(id)a5;
@end

@implementation InstallCoordinationUninstaller

- (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withResultHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001E3A18;
    v14[3] = &unk_1003E9C30;
    id v15 = v8;
    +[IXAppInstallCoordinator uninstallAppWithBundleID:requestUserConfirmation:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "uninstallAppWithBundleID:requestUserConfirmation:completion:",  v10,  v6,  v14);

    v11 = v15;
  }

  else
  {
    uint64_t v12 = ASDErrorDomain;
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    v17 = @"No bundle ID was specified";
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  650LL,  v11));
    (*((void (**)(id, void *))v8 + 2))(v8, v13);
  }
}

@end