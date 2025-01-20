@interface TVMusicHUDController
+ (TVMusicHUDController)sharedInstance;
- (OS_os_log)log;
- (PBSBulletin)currentBulletin;
- (TVMusicHUDController)init;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)setCurrentBulletin:(id)a3;
- (void)showWithTitle:(id)a3 message:(id)a4 symbolName:(id)a5;
- (void)showWithType:(int64_t)a3;
- (void)startObserving;
@end

@implementation TVMusicHUDController

+ (TVMusicHUDController)sharedInstance
{
  if (qword_1002BE8C8 != -1) {
    dispatch_once(&qword_1002BE8C8, &stru_10026AE30);
  }
  return (TVMusicHUDController *)(id)qword_1002BE8C0;
}

- (TVMusicHUDController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicHUDController;
  v2 = -[TVMusicHUDController init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bulletinServiceProxy]);
    [v4 setDelegate:v2];
  }

  return v2;
}

- (void)startObserving
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  if ((_os_feature_enabled_impl("MediaPlayer", "Favoriting") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    uint64_t v4 = MPContentTasteControllerWillSetTasteTypeNotification;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10004CB80;
    v18[3] = &unk_10026AE58;
    objc_copyWeak(&v19, &location);
    id v5 = [v2 addObserverForName:v4 object:0 queue:v3 usingBlock:v18];

    objc_destroyWeak(&v19);
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004CCB8;
  v16[3] = &unk_10026AE58;
  objc_copyWeak(&v17, &location);
  id v7 =  [v2 addObserverForName:@"TVMusicPlayQueueWillAddToQueueNotification" object:0 queue:v6 usingBlock:v16];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10004CDB4;
  v14[3] = &unk_10026AE58;
  objc_copyWeak(&v15, &location);
  id v9 =  [v2 addObserverForName:@"TVMusicLibraryWillAddItemNotification" object:0 queue:v8 usingBlock:v14];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004CDE4;
  v12[3] = &unk_10026AE58;
  objc_copyWeak(&v13, &location);
  id v11 =  [v2 addObserverForName:@"TVMusicLibraryWillAddGlobalPlaylistNotification" object:0 queue:v10 usingBlock:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

- (void)showWithType:(int64_t)a3
{
  else {
    uint64_t v3 = (uint64_t)*(&off_10026AED8 + a3);
  }
  -[TVMusicHUDController showWithTitle:message:symbolName:]( self,  "showWithTitle:message:symbolName:",  v3,  0LL,  @"music");
}

- (void)showWithTitle:(id)a3 message:(id)a4 symbolName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  id v20 = (id)objc_claimAutoreleasedReturnValue([v11 bulletinServiceProxy]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicHUDController currentBulletin](self, "currentBulletin"));
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicHUDController currentBulletin](self, "currentBulletin"));
    [v20 dismissBulletin:v13];

    -[TVMusicHUDController setCurrentBulletin:](self, "setCurrentBulletin:", 0LL);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:v10 value:&stru_100279068 table:0]);

  [v14 setObject:v16 forKeyedSubscript:PBSSystemBulletinTitleKey];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:v9 value:&stru_100279068 table:0]);

  [v14 setObject:v18 forKeyedSubscript:PBSSystemBulletinMessageKey];
  [v14 setObject:v8 forKeyedSubscript:PBSSystemBulletinSymbolNameKey];

  [v14 setObject:&off_100281850 forKeyedSubscript:PBSSystemBulletinBannerTypeKey];
  id v19 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  -[PBSBulletin setServiceIdentifier:](v19, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  -[PBSBulletin setViewControllerClassName:]( v19,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setMessage:](v19, "setMessage:", v14);
  -[TVMusicHUDController setCurrentBulletin:](self, "setCurrentBulletin:", v19);
  [v20 presentBulletin:v19 withCompletion:&stru_10026AE98];
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_10004D1B4;
  v12 = &unk_100269EF8;
  id v7 = a4;
  id v13 = v7;
  v14 = self;
  unint64_t v15 = a5;
  id v8 = &v9;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v9, v10))
  {
    v11((uint64_t)v8);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004D35C;
    block[3] = &unk_100268D60;
    id v17 = v8;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (PBSBulletin)currentBulletin
{
  return self->_currentBulletin;
}

- (void)setCurrentBulletin:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
}

@end