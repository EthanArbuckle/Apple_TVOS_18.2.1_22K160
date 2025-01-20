@interface WCAServer
+ (id)sharedInstance;
- (WCAServer)init;
- (WCAServer)initWithAssets:(id)a3;
- (id)_readInstalledKeys:(id)a3 ofAsset:(id)a4;
- (id)_readSQLiteDataBase:(id)a3 ofAsset:(id)a4;
- (unint64_t)assetSource;
- (unsigned)_getNetworkReachability;
- (void)_cancelDownload:(id)a3;
- (void)_downloadAsset:(id)a3 withLocalAsset:(id)a4 completion:(id)a5;
- (void)_fetchAssetCatalogueFromServer:(id)a3 completion:(id)a4;
- (void)_findBestVersionOfAsset:(id)a3 fromResults:(id)a4 completion:(id)a5;
- (void)_findLocallyInstalledAssetWithCompletion:(id)a3;
- (void)_loadDefaultsFromLocalFile;
- (void)_queryAndFindBestVersionOfAsset:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)executeFetchRequest:(id)a3 completion:(id)a4;
- (void)fetchWiFiAssetsFromServer;
- (void)setAssetSource:(unint64_t)a3;
@end

@implementation WCAServer

+ (id)sharedInstance
{
  v4 = (dispatch_once_t *)&unk_100011570;
  id location = 0LL;
  objc_storeStrong(&location, &stru_10000C9D0);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100011568;
}

- (WCAServer)init
{
  SEL v23 = a2;
  v24 = 0LL;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___WCAServer;
  v24 = -[WCAServer init](&v22, "init");
  objc_storeStrong((id *)&v24, v24);
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.wificloudassets.wcaserver", v9);
  queue = v24->_queue;
  v24->_queue = (OS_dispatch_queue *)v2;

  id v11 = +[WCAAsset wifiBehaviorPlistAsset](&OBJC_CLASS___WCAAsset, "wifiBehaviorPlistAsset");
  v25[0] = v11;
  id v10 = +[WCAAsset beaconsDataAsset](&OBJC_CLASS___WCAAsset, "beaconsDataAsset");
  v25[1] = v10;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL);
  assets = v24->_assets;
  v24->_assets = v4;

  v6 = (NSMutableDictionary *)+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  assetLocalURL = v24->_assetLocalURL;
  v24->_assetLocalURL = v6;

  signal(15, (void (__cdecl *)(int))1);
  v12 = &_dispatch_main_q;
  v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v12);

  v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_10000255C;
  v18 = &unk_10000CA18;
  v19 = v24;
  v20 = objc_retainBlock(&v14);
  dispatch_source_set_event_handler(v21, v20);
  dispatch_activate(v21);
  v13 = v24;
  objc_storeStrong((id *)&v20, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  objc_storeStrong((id *)&v24, 0LL);
  return v13;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[WCAServer _cancelDownload:](self, "_cancelDownload:", &stru_10000CA38);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___WCAServer;
  -[WCAServer dealloc](&v2, "dealloc");
}

- (WCAServer)initWithAssets:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___WCAServer;
  v8 = -[WCAServer init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  objc_storeStrong((id *)&v8->_assets, location[0]);
  v8->_didFetchLatestAssets = 1;
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)executeFetchRequest:(id)a3 completion:(id)a4
{
  int v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  queue = (dispatch_queue_s *)v16->_queue;
  objc_super v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_100002858;
  id v10 = &unk_10000CA60;
  id v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_sync(queue, &v6);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)fetchWiFiAssetsFromServer
{
  v21 = self;
  v20[1] = (id)a2;
  v20[0] = dispatch_group_create();
  memset(__b, 0, sizeof(__b));
  obj = v21->_assets;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v22,  16LL);
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(__b[1] + 8 * v8);
      dispatch_group_enter((dispatch_group_t)v20[0]);
      v5 = v21;
      uint64_t v4 = v19;
      id v12 = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      int v15 = sub_100002DE4;
      int v16 = &unk_10000CA18;
      id v17 = v20[0];
      -[WCAServer _fetchAssetCatalogueFromServer:completion:]( v5,  "_fetchAssetCatalogueFromServer:completion:",  v4,  &v12);
      objc_storeStrong(&v17, 0LL);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v22,  16LL);
        if (!v9) {
          break;
        }
      }
    }
  }

  group = (dispatch_group_s *)v20[0];
  dispatch_time_t v2 = dispatch_time(0LL, 1000000000 * kMobileAssetResponseTimeout);
  dispatch_group_wait(group, v2);
  objc_storeStrong(v20, 0LL);
}

- (void)_fetchAssetCatalogueFromServer:(id)a3 completion:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  if (-[WCAServer _getNetworkReachability](v18, "_getNetworkReachability"))
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
    id v4 = v15;
    uint64_t v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = sub_10000308C;
    id v11 = &unk_10000CB10;
    id v12 = v18;
    id v13 = location[0];
    id v14 = v16;
    +[MAAsset startCatalogDownload:options:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:then:",  @"com.apple.MobileAsset.WiFi",  v4,  &v7);
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v13, 0LL);
    objc_storeStrong((id *)&v12, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

  else
  {
    id v5 = [location[0] name];
    NSLog( @"[%s][%@] No network connectivity, will use locally installed assets",  "-[WCAServer _fetchAssetCatalogueFromServer:completion:]",  v5);

    AnalyticsSendEventLazy(@"com.apple.com.wifi.wificloudasset.event", &stru_10000CAA0);
    (*((void (**)(void))v16 + 2))();
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_findLocallyInstalledAssetWithCompletion:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[WCAServer _loadDefaultsFromLocalFile](v14, "_loadDefaultsFromLocalFile");
  id v12 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.WiFi"];
  [v12 returnTypes:1];
  id v3 = v12;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = sub_100003424;
  int v8 = &unk_10000CB10;
  id v9 = v12;
  id v10 = v14;
  id v11 = location[0];
  objc_msgSend(v3, "queryMetaData:");
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_loadDefaultsFromLocalFile
{
  v24 = self;
  v23[1] = (id)a2;
  self->_assetSource = 1LL;
  v23[0] = -[NSArray firstObject](v24->_assets, "firstObject");
  id v9 = [v23[0] name];
  id v8 = [v23[0] extension];
  id v22 = objc_msgSend(v9, "stringByAppendingPathExtension:");

  id v12 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v11 = -[NSBundle bundlePath](v12, "bundlePath");
  id v10 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:");
  v21 = -[NSURL URLByAppendingPathComponent:](v10, "URLByAppendingPathComponent:", v22);

  id v13 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v14 = -[NSURL path](v21, "path");
  dispatch_time_t v2 = -[NSMutableDictionary initWithContentsOfFile:](v13, "initWithContentsOfFile:");
  wifiBehaviorData = v24->_wifiBehaviorData;
  v24->_wifiBehaviorData = v2;

  id v20 = -[NSArray lastObject](v24->_assets, "lastObject");
  id v16 = [v20 name];
  id v15 = [v20 extension];
  id v4 = objc_msgSend(v16, "stringByAppendingPathExtension:");
  id v5 = v22;
  id v22 = v4;

  uint64_t v19 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v18 = -[NSBundle bundlePath](v19, "bundlePath");
  id v17 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:");
  int v6 = -[NSURL URLByAppendingPathComponent:](v17, "URLByAppendingPathComponent:", v22);
  beaconDBFile = v24->_beaconDBFile;
  v24->_beaconDBFile = v6;

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(v23, 0LL);
}

- (void)_queryAndFindBestVersionOfAsset:(id)a3 completion:(id)a4
{
  id obj = a4;
  v33 = self;
  location[1] = (id)a2;
  uint64_t v19 = location;
  id v20 = 0LL;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v18 = &v31;
  id v31 = 0LL;
  objc_storeStrong(&v31, obj);
  id v10 = [location[0] name];
  NSLog(@"[%s][%@] ", "-[WCAServer _queryAndFindBestVersionOfAsset:completion:]", v10);

  id v4 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.WiFi"];
  id v17 = &v30;
  id v30 = v4;
  [v4 returnTypes:2];
  id v12 = v30;
  id v11 = (id *)&v21;
  v21 = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  v24 = sub_100003BA0;
  v25 = &unk_10000CB38;
  id v5 = v31;
  id v16 = v11 + 7;
  id v29 = v5;
  id v6 = v30;
  id v15 = v11 + 4;
  id v26 = v6;
  uint64_t v7 = v33;
  id v14 = v11 + 5;
  v27 = v7;
  id v8 = location[0];
  id v13 = v11 + 6;
  id v28 = v8;
  objc_msgSend(v12, "queryMetaData:");
  objc_storeStrong(v13, v20);
  objc_storeStrong(v14, v20);
  objc_storeStrong(v15, v20);
  objc_storeStrong(v16, v20);
  objc_storeStrong(v17, v20);
  objc_storeStrong(v18, v20);
  objc_storeStrong(v19, v20);
}

- (void)_findBestVersionOfAsset:(id)a3 fromResults:(id)a4 completion:(id)a5
{
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v57 = 0LL;
  objc_storeStrong(&v57, a4);
  id v56 = 0LL;
  objc_storeStrong(&v56, a5);
  id v38 = [location[0] name];
  NSLog(@"[%s][%@] ", "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]", v38);

  [location[0] setLatestInstalledVersion:0x7FFFFFFFFFFFFFFFLL];
  [location[0] setLatestInstalledAsset:0];
  [location[0] setLatestNotInstalledVersion:0x7FFFFFFFFFFFFFFFLL];
  [location[0] setLatestNotInstalledAsset:0];
  memset(__b, 0, sizeof(__b));
  id v39 = v57;
  id v40 = [v39 countByEnumeratingWithState:__b objects:v60 count:16];
  if (v40)
  {
    uint64_t v33 = *(void *)__b[2];
    uint64_t v34 = 0LL;
    id v35 = v40;
    while (1)
    {
      uint64_t v32 = v34;
      if (*(void *)__b[2] != v33) {
        objc_enumerationMutation(v39);
      }
      id v55 = *(id *)(__b[1] + 8 * v34);
      id v25 = [v55 attributes];
      id v53 = [v25 objectForKeyedSubscript:@"WiFiCloudAssetType"];

      id v27 = [v55 attributes];
      id v26 = [v27 objectForKeyedSubscript:ASAttributeCompatibilityVersion];
      uint64_t v28 = (int)[v26 intValue];

      uint64_t v52 = v28;
      id v30 = [v55 attributes];
      id v29 = [v30 objectForKeyedSubscript:ASAttributeContentVersion];
      unint64_t v31 = (int)[v29 intValue];

      unint64_t v51 = v31;
      if (kMetadataCurrentSchemaVersion == v52)
      {
        id v23 = [location[0] name];
        unsigned __int8 v24 = [v23 isEqualToString:v53];

        if ((v24 & 1) != 0)
        {
          id v22 = [location[0] name];
          NSLog( @"[%s][%@] Checking server asset w/ state: %ld",  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]",  v22,  [v55 state]);

          if ([v55 state] == (id)1)
          {
            if ([location[0] latestNotInstalledVersion] == (id)0x7FFFFFFFFFFFFFFFLL
              || (id v5 = [location[0] latestNotInstalledVersion], (unint64_t)v5 < v51))
            {
              id v21 = [location[0] name];
              NSLog( @"[%s][%@] Server asset %lu is latest uninstalled version. Marking for download.",  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]",  v21,  v51);

              [location[0] setLatestNotInstalledVersion:v51];
              [location[0] setLatestNotInstalledAsset:v55];
            }

            else
            {
              id v20 = [location[0] name];
              NSLog( @"[%s][%@] Server asset %lu is not latest uninstalled version. Ignoring.",  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]",  v20,  v51);
            }
          }

          else if ([v55 state] == (id)2)
          {
            id v49 = 0LL;
            if ([location[0] latestInstalledVersion] == (id)0x7FFFFFFFFFFFFFFFLL
              || (id v6 = [location[0] latestInstalledVersion], (unint64_t)v6 < v51))
            {
              id v19 = [location[0] name];
              NSLog( @"[%s][%@] Server asset %lu is latest installed version. Purging older installed version if needed.",  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]",  v19,  v51);

              id v7 = [location[0] latestInstalledAsset];
              id v8 = v49;
              id v49 = v7;

              [location[0] setLatestInstalledAsset:v55];
              [location[0] setLatestInstalledVersion:v51];
              if (v49)
              {
                id v16 = [v49 attributes];
                id v48 = [v16 objectForKeyedSubscript:ASAttributeContentVersion];

                id v17 = [location[0] name];
                NSLog( @"[%s][%@] Purging asset version %@",  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]",  v17,  v48);

                id v18 = v49;
                v41 = _NSConcreteStackBlock;
                int v42 = -1073741824;
                int v43 = 0;
                v44 = sub_1000046C4;
                v45 = &unk_10000CB60;
                id v46 = location[0];
                id v47 = v48;
                [v18 purge:&v41];
                objc_storeStrong(&v47, 0LL);
                objc_storeStrong(&v46, 0LL);
                objc_storeStrong(&v48, 0LL);
              }
            }

            else
            {
              id v15 = [location[0] name];
              NSLog( @"[%s][%@] Server asset %lu is not latest installed version. Ignoring.",  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]",  v15,  v51);
            }

            objc_storeStrong(&v49, 0LL);
          }

          int v50 = 0;
        }

        else
        {
          int v50 = 3;
        }
      }

      else
      {
        int v50 = 3;
      }

      objc_storeStrong(&v53, 0LL);
      ++v34;
      if (v32 + 1 >= (unint64_t)v35)
      {
        uint64_t v34 = 0LL;
        id v35 = [v39 countByEnumeratingWithState:__b objects:v60 count:16];
        if (!v35) {
          break;
        }
      }
    }
  }

  if ([location[0] latestInstalledVersion] != (id)0x7FFFFFFFFFFFFFFFLL
    && [location[0] latestNotInstalledVersion] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [location[0] latestNotInstalledVersion];
    if (v14 < [location[0] latestInstalledVersion])
    {
      id v13 = [location[0] name];
      id v12 = [location[0] latestInstalledVersion];
      NSLog( @"[%s][%@] Installed asset (%lu) is newer than latest uninstalled asset (%lu) so we don't need to download",  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]",  v13,  v12,  [location[0] latestNotInstalledVersion]);

      [location[0] setLatestNotInstalledVersion:0x7FFFFFFFFFFFFFFFLL];
      [location[0] setLatestNotInstalledAsset:0];
    }
  }

  id v11 = [location[0] latestNotInstalledAsset];

  if (v11)
  {
    id v9 = v59;
    id v10 = [location[0] latestNotInstalledAsset];
    -[WCAServer _downloadAsset:withLocalAsset:completion:](v9, "_downloadAsset:withLocalAsset:completion:");
  }

  else
  {
    (*((void (**)(void))v56 + 2))();
  }

  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_downloadAsset:(id)a3 withLocalAsset:(id)a4 completion:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  [location[0] attachProgressCallBack:&stru_10000CBA0];
  id v7 = location[0];
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_100004934;
  id v12 = &unk_10000CB10;
  id v13 = location[0];
  id v14 = v17;
  id v15 = v16;
  objc_msgSend(v7, "startDownload:");
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_readInstalledKeys:(id)a3 ofAsset:(id)a4
{
  v71 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v69 = 0LL;
  objc_storeStrong(&v69, a4);
  assetLocalURL = v71->_assetLocalURL;
  id v38 = [v69 name];
  id v68 = -[NSMutableDictionary objectForKey:](assetLocalURL, "objectForKey:");

  if (v68)
  {
    AnalyticsSendEventLazy(@"com.apple.com.wifi.wificloudasset.event", &stru_10000CC28);
    id v31 = [v69 name];
    id v30 = [v69 extension];
    id v67 = objc_msgSend(v31, "stringByAppendingPathExtension:");

    id v66 = [v68 URLByAppendingPathComponent:v67];
    uint64_t v32 = objc_alloc(&OBJC_CLASS___NSDictionary);
    id v33 = [v66 path];
    id v65 = -[NSDictionary initWithContentsOfFile:](v32, "initWithContentsOfFile:");

    id v64 = [v65 objectForKey:@"Override"];
    uint64_t v63 = MGCopyAnswer(@"ProductType", 0LL);
    memset(__b, 0, sizeof(__b));
    id v34 = v64;
    id v35 = [v34 countByEnumeratingWithState:__b objects:v75 count:16];
    if (v35)
    {
      uint64_t v27 = *(void *)__b[2];
      uint64_t v28 = 0LL;
      id v29 = v35;
      while (1)
      {
        uint64_t v26 = v28;
        if (*(void *)__b[2] != v27) {
          objc_enumerationMutation(v34);
        }
        id v62 = *(id *)(__b[1] + 8 * v28);
        id v25 = [v62 objectForKeyedSubscript:@"Country"];
        char v59 = 0;
        char v57 = 0;
        char v55 = 0;
        char v53 = 0;
        char v51 = 0;
        if (!v25) {
          goto LABEL_9;
        }
        id v23 = [v62 objectForKeyedSubscript:@"Country"];
        id v60 = v23;
        char v59 = 1;
        id v58 = +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale");
        char v57 = 1;
        id v56 = [v58 countryCode];
        char v55 = 1;
        unsigned __int8 v24 = 0;
        if (objc_msgSend(v23, "containsObject:"))
        {
LABEL_9:
          id v54 = [v62 objectForKeyedSubscript:@"Device"];
          char v53 = 1;
          unsigned __int8 v22 = 1;
          if (v54)
          {
            id v52 = [v62 objectForKeyedSubscript:@"Device"];
            char v51 = 1;
            unsigned __int8 v22 = [v52 containsObject:v63];
          }

          unsigned __int8 v24 = v22;
        }

        if ((v51 & 1) != 0) {

        }
        if ((v53 & 1) != 0) {
        if ((v55 & 1) != 0)
        }

        if ((v57 & 1) != 0) {
        if ((v59 & 1) != 0)
        }

        if ((v24 & 1) != 0)
        {
          wifiBehaviorData = v71->_wifiBehaviorData;
          id v21 = [v62 objectForKeyedSubscript:@"Value"];
          id v20 = [v62 objectForKeyedSubscript:@"KeyPath"];
          -[NSMutableDictionary setValue:forKeyPath:](wifiBehaviorData, "setValue:forKeyPath:", v21);

          v45 = _NSConcreteStackBlock;
          int v46 = -1073741824;
          int v47 = 0;
          id v48 = sub_100005824;
          id v49 = &unk_10000CBC8;
          id v50 = v62;
          AnalyticsSendEventLazy(@"com.apple.com.wifi.wificloudasset.event", &v45);
          objc_storeStrong(&v50, 0LL);
        }

        ++v28;
        if (v26 + 1 >= (unint64_t)v29)
        {
          uint64_t v28 = 0LL;
          id v29 = [v34 countByEnumeratingWithState:__b objects:v75 count:16];
          if (!v29) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v64, 0LL);
    objc_storeStrong(&v65, 0LL);
    objc_storeStrong(&v66, 0LL);
    objc_storeStrong(&v67, 0LL);
  }

  else
  {
    AnalyticsSendEventLazy(@"com.apple.com.wifi.wificloudasset.event", &stru_10000CC08);
    v71->_assetSource = 1LL;
  }

  v44 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  memset(v42, 0, sizeof(v42));
  id v17 = location[0];
  id v18 = [v17 countByEnumeratingWithState:v42 objects:v74 count:16];
  if (v18)
  {
    uint64_t v14 = *(void *)v42[2];
    uint64_t v15 = 0LL;
    id v16 = v18;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)v42[2] != v14) {
        objc_enumerationMutation(v17);
      }
      uint64_t v43 = *(void *)(v42[1] + 8 * v15);
      if ([location[0] containsObject:v43])
      {
        id v41 = -[NSMutableDictionary objectForKeyedSubscript:](v71->_wifiBehaviorData, "objectForKeyedSubscript:", v43);
        id v4 = objc_alloc(&OBJC_CLASS___WCAKeyValueItem);
        id v12 = [v4 initWithKey:v43 value:v41];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:");

        objc_storeStrong(&v41, 0LL);
      }

      else
      {
        uint64_t v9 = WCAErrorDomain;
        v72 = @"Key";
        uint64_t v73 = v43;
        int v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL);
        id v40 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  -2LL);

        id v5 = objc_alloc(&OBJC_CLASS___WCAKeyValueItem);
        id v11 = [v5 initWithKey:v43 error:v40];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:");

        objc_storeStrong((id *)&v40, 0LL);
      }

      ++v15;
      if (v13 + 1 >= (unint64_t)v16)
      {
        uint64_t v15 = 0LL;
        id v16 = [v17 countByEnumeratingWithState:v42 objects:v74 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  id v6 = objc_alloc(&OBJC_CLASS___WCAFetchKeyValuesResponse);
  id v39 = [v6 initWithKeyValues:v44];
  id v8 = v39;
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong((id *)&v44, 0LL);
  objc_storeStrong(&v68, 0LL);
  objc_storeStrong(&v69, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (void)_cancelDownload:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  NSLog(@"%s: _cancelDownload called", "-[WCAServer _cancelDownload:]");
  memset(__b, 0, sizeof(__b));
  id obj = v20->_assets;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v21,  16LL);
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(id *)(__b[1] + 8 * v6);
      id v16 = [v18 latestNotInstalledAsset];
      id v3 = v16;
      int v10 = _NSConcreteStackBlock;
      int v11 = -1073741824;
      int v12 = 0;
      uint64_t v13 = sub_100005BB4;
      uint64_t v14 = &unk_10000CC50;
      id v15 = location[0];
      [v3 cancelDownload:&v10];
      objc_storeStrong(&v15, 0LL);
      objc_storeStrong(&v16, 0LL);
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v21,  16LL);
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (id)_readSQLiteDataBase:(id)a3 ofAsset:(id)a4
{
  unsigned __int8 v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  assetLocalURL = v24->_assetLocalURL;
  id v17 = [v22 name];
  id v21 = -[NSMutableDictionary objectForKey:](assetLocalURL, "objectForKey:");

  if (v21)
  {
    id v14 = [v22 name];
    id v13 = [v22 extension];
    id v20 = objc_msgSend(v14, "stringByAppendingPathExtension:");

    uint64_t v4 = (NSURL *)[v21 URLByAppendingPathComponent:v20];
    beaconDBFile = v24->_beaconDBFile;
    v24->_beaconDBFile = v4;

    objc_storeStrong(&v20, 0LL);
  }

  id v11 = objc_msgSend(location[0], "parameters", v24->_beaconDBFile);
  id v10 = [location[0] tableName];
  id v9 = [location[0] columnNames];
  id v19 = WFRunSqliteQuery(v8, v11, v10, v9, (uint64_t)[location[0] limit]);

  id v6 = objc_alloc(&OBJC_CLASS___WCAFetchSQLiteResponse);
  id v18 = [v6 initWithRecords:v19];
  id v12 = v18;
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

- (unsigned)_getNetworkReachability
{
  id v7 = self;
  SEL v6 = a2;
  sockaddr address = (sockaddr)xmmword_10000BE80;
  SCNetworkReachabilityRef target = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
  SCNetworkReachabilityFlags flags = 0;
  if (target)
  {
    SCNetworkReachabilityGetFlags(target, &flags);
    CFRelease(target);
  }

  BOOL v3 = 0;
  if ((flags & 0x40000) == 0) {
    return (flags & 2) != 0;
  }
  return v3;
}

- (unint64_t)assetSource
{
  return self->_assetSource;
}

- (void)setAssetSource:(unint64_t)a3
{
  self->_assetSource = a3;
}

- (void).cxx_destruct
{
}

@end