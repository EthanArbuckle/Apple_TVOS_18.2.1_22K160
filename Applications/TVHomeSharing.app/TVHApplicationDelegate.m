@interface TVHApplicationDelegate
+ (id)sharedApplicationDelegate;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (TVHApplicationDelegate)init;
- (TVHKMediaLibrariesManager)mediaLibrariesManager;
- (TVHMainSceneDelegate)mainSceneDelegate;
- (void)_enqueueAsyncMainQueueBlock:(id)a3;
- (void)_initializeAssetLibrary;
- (void)_initializeMediaLibrariesManager;
- (void)_initializeScreenSaverProvider;
- (void)_performMigrations;
- (void)applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVHApplicationDelegate

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVHPPTController sharedInstance](&OBJC_CLASS___TVHPPTController, "sharedInstance"));
  unsigned int v9 = [v8 canHandleTest:v7];

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVHPPTController sharedInstance](&OBJC_CLASS___TVHPPTController, "sharedInstance"));
    [v10 runTest:v7 application:v6];
  }

  return v9;
}

- (TVHApplicationDelegate)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHApplicationDelegate;
  v2 = -[TVHApplicationDelegate init](&v7, "init");
  if (v2)
  {
    v3 = -[TVHKMediaLibrariesManager initWithAccessMode:]( objc_alloc(&OBJC_CLASS___TVHKMediaLibrariesManager),  "initWithAccessMode:",  0LL);
    mediaLibrariesManager = v2->_mediaLibrariesManager;
    v2->_mediaLibrariesManager = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
    [v5 addObserver:v2 forKeyPath:@"mediaServerDiscoveryConfiguration" options:1 context:off_100156BF0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"mediaServerDiscoveryConfiguration" context:off_100156BF0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHApplicationDelegate;
  -[TVHApplicationDelegate dealloc](&v4, "dealloc");
}

+ (id)sharedApplicationDelegate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  return v3;
}

- (TVHMainSceneDelegate)mainSceneDelegate
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 windows]);

  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * v7) windowScene]);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 delegate]);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVHMainSceneDelegate);
      id v11 = v9;
      v12 = v11;
      if (v10) {
        v13 = (objc_opt_isKindOfClass(v11, v10) & 1) != 0 ? v12 : 0LL;
      }
      else {
        v13 = 0LL;
      }
      id v14 = v13;

      if (v14) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }

  else
  {
LABEL_14:
    id v14 = 0LL;
  }

  return (TVHMainSceneDelegate *)v14;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = +[TVHPPTController sharedInstance](&OBJC_CLASS___TVHPPTController, "sharedInstance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAnalyticsController sharedController](&OBJC_CLASS___TVHAnalyticsController, "sharedController"));
  [v6 sendAppLaunchedEvent];

  -[TVHApplicationDelegate _performMigrations](self, "_performMigrations");
  -[TVHApplicationDelegate _initializeAssetLibrary](self, "_initializeAssetLibrary");
  -[TVHApplicationDelegate _initializeMediaLibrariesManager](self, "_initializeMediaLibrariesManager");
  -[TVHApplicationDelegate _initializeScreenSaverProvider](self, "_initializeScreenSaverProvider");
  return 1;
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHApplicationDelegate mediaLibrariesManager](self, "mediaLibrariesManager", a3));
  [v3 restartIfNotConnectedToAnyMediaLibraries];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100156BF0 == a6)
  {
    id v7 = sub_100079BA8();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received KVO notification that the media server discovery configuration has changed.",  buf,  2u);
    }

    -[TVHApplicationDelegate _enqueueAsyncMainQueueBlock:](self, "_enqueueAsyncMainQueueBlock:", &stru_1000FF258);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVHApplicationDelegate;
    -[TVHApplicationDelegate observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_enqueueAsyncMainQueueBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100076DB4;
  block[3] = &unk_1000FD2E8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_performMigrations
{
  id v2 = [[PBSMigration alloc] initWithName:@"Playlist Title Sort Mode" handler:&stru_1000FF298];
  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v2);

  +[PBSMigrator performMigrationIfNeeded](&OBJC_CLASS___PBSMigrator, "performMigrationIfNeeded");
}

- (void)_initializeMediaLibrariesManager
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHApplicationDelegate mediaLibrariesManager](self, "mediaLibrariesManager"));
  [v2 setCompletionDispatchQueue:&_dispatch_main_q];
  [v2 setNotificationDispatchQueue:&_dispatch_main_q];
  [v2 start];
}

- (void)_initializeAssetLibrary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (id)objc_claimAutoreleasedReturnValue( [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.TVHomeSharing"]);

  id v3 = v6;
  if (v6)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"AssetLibrary"]);
    +[TVAssetLibrary initializeAssetLibraryWithCachePath:]( &OBJC_CLASS___TVAssetLibrary,  "initializeAssetLibraryWithCachePath:",  v5);

    id v3 = v6;
  }
}

- (void)_initializeScreenSaverProvider
{
  id v3 = objc_alloc(&OBJC_CLASS___TVHScreenSaverProviderService);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHApplicationDelegate mediaLibrariesManager](self, "mediaLibrariesManager"));
  id v6 = -[TVHScreenSaverProviderService initWithMediaLibrariesManager:](v3, "initWithMediaLibrariesManager:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  [v5 registerAppWithProviderObject:v6];
}

- (TVHKMediaLibrariesManager)mediaLibrariesManager
{
  return self->_mediaLibrariesManager;
}

- (void).cxx_destruct
{
}

@end