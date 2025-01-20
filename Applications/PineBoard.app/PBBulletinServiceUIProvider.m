@interface PBBulletinServiceUIProvider
- (PBBulletinInfo)bulletinInfo;
- (PBBulletinService)bulletinService;
- (PBBulletinServiceUIProvider)initWithBulletinInfo:(id)a3 service:(id)a4;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
@end

@implementation PBBulletinServiceUIProvider

- (PBBulletinServiceUIProvider)initWithBulletinInfo:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBBulletinServiceUIProvider;
  v9 = -[PBBulletinServiceUIProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bulletinInfo, a3);
    objc_storeStrong((id *)&v10->_bulletinService, a4);
  }

  return v10;
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinServiceUIProvider bulletinInfo](self, "bulletinInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinServiceUIProvider bulletinService](self, "bulletinService"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _bulletinForBulletinInfo:v5]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 viewControllerClassName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceIdentifier]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E0874;
  v15[3] = &unk_1003D6450;
  id v16 = v6;
  id v17 = v5;
  id v18 = v7;
  id v19 = v4;
  id v10 = v4;
  id v11 = v7;
  id v12 = v5;
  id v13 = v6;
  id v14 =  +[PBRemoteBulletinViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:]( &OBJC_CLASS___PBRemoteBulletinViewController,  "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:",  v8,  v9,  v15);
}

- (PBBulletinInfo)bulletinInfo
{
  return self->_bulletinInfo;
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (void).cxx_destruct
{
}

@end