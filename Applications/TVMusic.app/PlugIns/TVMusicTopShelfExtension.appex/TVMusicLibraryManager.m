@interface TVMusicLibraryManager
+ (TVMusicLibraryManager)sharedInstance;
- (BOOL)libraryHasContent;
- (MPCloudController)mpCloudController;
- (TVMusicLibraryManager)init;
- (double)syncProgress;
- (id)_debugNameForCloudStatus:(int64_t)a3;
- (id)_debugNameForState:(int64_t)a3;
- (int64_t)cloudAddToPlaylistBehavior;
- (int64_t)cloudStatus;
- (int64_t)state;
- (void)_initializeLibrary;
- (void)_libraryDidChange:(id)a3;
- (void)_loadUpdateProgressWithCompletionHandler:(id)a3;
- (void)_subscriptionStatusDidChange:(id)a3;
- (void)_updateInProgressDidChange:(id)a3;
- (void)_updateSyncProgress;
- (void)_updateSyncState;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4;
- (void)setCloudStatus:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setSyncProgress:(double)a3;
@end

@implementation TVMusicLibraryManager

+ (TVMusicLibraryManager)sharedInstance
{
  if (qword_100018FA0 != -1) {
    dispatch_once(&qword_100018FA0, &stru_100014810);
  }
  return (TVMusicLibraryManager *)(id)qword_100018F98;
}

- (TVMusicLibraryManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicLibraryManager;
  v2 = -[TVMusicLibraryManager init](&v11, "init");
  if (v2)
  {
    id v3 = sub_100002F18();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TVMusicLibraryManager init", v10, 2u);
    }

    v2->_state = 0LL;
    v2->_cloudStatus = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v2 selector:"_subscriptionStatusDidChange:" name:TVMusicSubscriptionStatusChangedNotification object:0];
    [v6 addObserver:v2 selector:"_libraryDidChange:" name:MPMediaLibraryDidChangeNotification object:v5];
    uint64_t v7 = MPCloudControllerIsUpdateInProgressDidChangeNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryManager mpCloudController](v2, "mpCloudController"));
    [v6 addObserver:v2 selector:"_updateInProgressDidChange:" name:v7 object:v8];

    -[TVMusicLibraryManager _initializeLibrary](v2, "_initializeLibrary");
  }

  return v2;
}

- (BOOL)libraryHasContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  BOOL v3 = [v2 filterAvailableContentGroups:992 withOptions:0] != 0;

  return v3;
}

- (MPCloudController)mpCloudController
{
  return (MPCloudController *)+[MPCloudController sharedCloudController]( &OBJC_CLASS___MPCloudController,  "sharedCloudController");
}

- (void)setState:(int64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v5 = sub_100003070;
  v6 = &unk_100014838;
  uint64_t v7 = self;
  int64_t v8 = a3;
  BOOL v3 = v4;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v5((uint64_t)v3);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003D98;
    block[3] = &unk_1000148F8;
    v10 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)setSyncProgress:(double)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v5 = sub_10000327C;
  v6 = &unk_100014838;
  uint64_t v7 = self;
  double v8 = a3;
  BOOL v3 = v4;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v5((uint64_t)v3);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003D98;
    block[3] = &unk_1000148F8;
    v10 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (int64_t)cloudAddToPlaylistBehavior
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryManager mpCloudController](self, "mpCloudController"));
  id v3 = [v2 cloudAddToPlaylistBehavior];

  if (v3 == (id)1) {
    return 1LL;
  }
  else {
    return 2LL * (v3 == (id)2);
  }
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4
{
  if (a3 == 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = 2LL * (a3 == 2);
  }
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryManager mpCloudController](self, "mpCloudController"));
  [v7 setCloudAddToPlaylistBehavior:v5 completionHandler:v6];
}

- (void)_loadUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryManager mpCloudController](self, "mpCloudController"));
  [v5 loadUpdateProgressWithCompletionHandler:v4];
}

- (void)_updateSyncProgress
{
  if ((id)-[TVMusicLibraryManager state](self, "state") == (id)2)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000034DC;
    v3[3] = &unk_100014888;
    v3[4] = self;
    -[TVMusicLibraryManager _loadUpdateProgressWithCompletionHandler:]( self,  "_loadUpdateProgressWithCompletionHandler:",  v3);
  }

- (void)_updateSyncState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned int v4 = [v3 hasCloudLibrary];

  if (v4)
  {
    -[TVMusicLibraryManager setCloudStatus:](self, "setCloudStatus:", 1LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryManager mpCloudController](self, "mpCloudController"));
    unsigned int v6 = [v5 isCloudLibraryInitialImport];
  }

  else
  {
    -[TVMusicLibraryManager setCloudStatus:](self, "setCloudStatus:", 2LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryManager mpCloudController](self, "mpCloudController"));
    unsigned int v6 = [v5 isJaliscoInitialImport];
  }

  if (v6) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = 3LL;
  }
  -[TVMusicLibraryManager setState:](self, "setState:", v7);

  id v8 = sub_100002F18();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryManager _debugNameForState:]( self,  "_debugNameForState:",  -[TVMusicLibraryManager state](self, "state")));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryManager _debugNameForCloudStatus:]( self,  "_debugNameForCloudStatus:",  -[TVMusicLibraryManager cloudStatus](self, "cloudStatus")));
    int v12 = 138412546;
    v13 = v10;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Library state: %@, Cloud status: %@",  (uint8_t *)&v12,  0x16u);
  }
}

- (void)_initializeLibrary
{
}

- (id)_debugNameForState:(int64_t)a3
{
  else {
    return *(&off_100014918 + a3 - 1);
  }
}

- (id)_debugNameForCloudStatus:(int64_t)a3
{
  id v3 = @"Unknown";
  if (a3 == 1) {
    id v3 = @"Has Cloud Library";
  }
  if (a3 == 2) {
    return @"No Cloud Library";
  }
  else {
    return (id)v3;
  }
}

- (void)_subscriptionStatusDidChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  id v5 = sub_10000387C;
  unsigned int v6 = &unk_1000148B0;
  uint64_t v7 = self;
  id v3 = v4;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v5((uint64_t)v3);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003D98;
    block[3] = &unk_1000148F8;
    v9 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_libraryDidChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  id v5 = sub_1000039FC;
  unsigned int v6 = &unk_1000148B0;
  uint64_t v7 = self;
  id v3 = v4;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v5((uint64_t)v3);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003D98;
    block[3] = &unk_1000148F8;
    v9 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_updateInProgressDidChange:(id)a3
{
  id v4 = sub_100002F18();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[TVMusicLibraryManager _updateInProgressDidChange:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TVMusicLibraryManager _updateInProgressDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  id v8 = sub_100003C38;
  v9 = &unk_1000148B0;
  v10 = self;
  unsigned int v6 = v7;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v8((uint64_t)v6);
  }

  else
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_100003D98;
    int v12 = &unk_1000148F8;
    v13 = v6;
    dispatch_async(&_dispatch_main_q, buf);
  }
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)cloudStatus
{
  return self->_cloudStatus;
}

- (void)setCloudStatus:(int64_t)a3
{
  self->_cloudStatus = a3;
}

- (double)syncProgress
{
  return self->_syncProgress;
}

@end