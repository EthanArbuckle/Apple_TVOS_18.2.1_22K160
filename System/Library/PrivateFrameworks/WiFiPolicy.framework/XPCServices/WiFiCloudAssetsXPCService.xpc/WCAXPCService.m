@interface WCAXPCService
- (void)executeFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchWiFiAssetsFromServer;
@end

@implementation WCAXPCService

- (void)executeFetchRequest:(id)a3 completionHandler:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  v6 = +[WCAServer sharedInstance](&OBJC_CLASS___WCAServer, "sharedInstance");
  id v5 = location[0];
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100006140;
  v11 = &unk_10000CF58;
  id v12 = v13;
  -[WCAServer executeFetchRequest:completion:](v6, "executeFetchRequest:completion:", v5);

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)fetchWiFiAssetsFromServer
{
  v2 = +[WCAServer sharedInstance](&OBJC_CLASS___WCAServer, "sharedInstance");
  -[WCAServer fetchWiFiAssetsFromServer](v2, "fetchWiFiAssetsFromServer");
}

@end