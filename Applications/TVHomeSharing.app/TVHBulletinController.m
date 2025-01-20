@interface TVHBulletinController
+ (id)sharedController;
- (PBSBulletin)currentBulletin;
- (PBSBulletinService)bulletinService;
- (TVHBulletinController)init;
- (id)_init;
- (void)_postBulletinWithTitle:(id)a3 message:(id)a4 imageName:(id)a5;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)postPlayLastBulletin;
- (void)postPlayNextBulletin;
- (void)setCurrentBulletin:(id)a3;
@end

@implementation TVHBulletinController

+ (id)sharedController
{
  if (qword_1001572F0 != -1) {
    dispatch_once(&qword_1001572F0, &stru_1000FDAD0);
  }
  return (id)qword_1001572E8;
}

- (TVHBulletinController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHBulletinController;
  v2 = -[TVHBulletinController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[PBSBulletinService sharedInstance](&OBJC_CLASS___PBSBulletinService, "sharedInstance"));
    bulletinService = v2->_bulletinService;
    v2->_bulletinService = (PBSBulletinService *)v3;

    -[PBSBulletinService setDelegate:](v2->_bulletinService, "setDelegate:", v2);
  }

  return v2;
}

- (void)postPlayNextBulletin
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"BULLETIN_PLAY_NEXT_TITLE" value:0 table:0]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"BULLETIN_PLAY_NEXT_MESSAGE" value:0 table:0]);

  id v7 = sub_10007A1C8();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Posting play next bulletin", v9, 2u);
  }

  -[TVHBulletinController _postBulletinWithTitle:message:imageName:]( self,  "_postBulletinWithTitle:message:imageName:",  v4,  v6,  @"text.insert");
}

- (void)postPlayLastBulletin
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"BULLETIN_PLAY_LAST_TITLE" value:0 table:0]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"BULLETIN_PLAY_LAST_MESSAGE" value:0 table:0]);

  id v7 = sub_10007A1C8();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Posting play last bulletin", v9, 2u);
  }

  -[TVHBulletinController _postBulletinWithTitle:message:imageName:]( self,  "_postBulletinWithTitle:message:imageName:",  v4,  v6,  @"text.append");
}

- (void)_postBulletinWithTitle:(id)a3 message:(id)a4 imageName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v26 = (id)objc_claimAutoreleasedReturnValue(-[TVHBulletinController currentBulletin](self, "currentBulletin"));
  if (v26)
  {
    -[TVHBulletinController setCurrentBulletin:](self, "setCurrentBulletin:", 0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHBulletinController bulletinService](self, "bulletinService"));
    [v11 dismissBulletin:v26];
  }

  v12 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  3LL);
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v10, PBSSystemBulletinTitleKey);

  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v9, PBSSystemBulletinMessageKey);
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", &off_100105F58, PBSSystemBulletinBannerTypeKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithTextStyle:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithTextStyle:",  UIFontTextStyleTitle1));
  v14 = (UIImage *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v8,  v13));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 traitCollection]);
    id v17 = [v16 userInterfaceStyle];

    if (((unint64_t)-[UIImage renderingMode](v14, "renderingMode") | 2) == 2)
    {
      if (v17 == (id)2) {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](&OBJC_CLASS___UIColor, "systemWhiteColor"));
      }
      else {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](&OBJC_CLASS___UIColor, "systemBlackColor"));
      }
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 colorWithAlphaComponent:0.84]);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(-[UIImage _flatImageWithColor:](v14, "_flatImageWithColor:", v20));

      v14 = (UIImage *)v21;
    }

    v22 = UIImagePNGRepresentation(v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (v23) {
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v23, PBSSystemBulletinImageDataKey);
    }
  }

  v24 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  -[PBSBulletin setServiceIdentifier:](v24, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  -[PBSBulletin setViewControllerClassName:]( v24,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setMessage:](v24, "setMessage:", v12);
  -[TVHBulletinController setCurrentBulletin:](self, "setCurrentBulletin:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVHBulletinController bulletinService](self, "bulletinService"));
  [v25 presentBulletin:v24 withCompletion:&stru_1000FDB10];
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v7 = a4;
  id v8 = sub_10007A1C8();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Bulletin dismissed for reason: %@:", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002F6E8;
  v12[3] = &unk_1000FDB38;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = v7;
  id v11 = v7;
  dispatch_async(&_dispatch_main_q, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (PBSBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (PBSBulletin)currentBulletin
{
  return self->_currentBulletin;
}

- (void)setCurrentBulletin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end