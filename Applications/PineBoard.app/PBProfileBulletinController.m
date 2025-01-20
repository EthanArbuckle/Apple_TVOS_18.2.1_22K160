@interface PBProfileBulletinController
+ (BOOL)_didShowWelcomeBackBulletinForProfile:(id)a3;
+ (BOOL)_shouldShowWelcomeBackBulletinForProfile:(id)a3;
+ (void)_setDidShowWelcomeBackBulletinForProfile:(id)a3;
- (BOOL)hasActiveUserBulletin;
- (PBProfileBulletinController)initWithCallinQueue:(id)a3 profileStoreSnapshotProvider:(id)a4 bulletinService:(id)a5 presentationElementFocusCoordinator:(id)a6 powerManager:(id)a7;
- (id)welcomeBulletinProfilePictureDataForProfile:(id)a3;
- (void)_mainQueue_releasePausedBulletinsAssertion;
- (void)_queue_presentWelcomeBackBulletinWithReason:(int64_t)a3;
- (void)_queue_releasePausedBulletinsAssertion;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)presentWelcomeBackBulletinWithReason:(int64_t)a3;
- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5;
@end

@implementation PBProfileBulletinController

- (PBProfileBulletinController)initWithCallinQueue:(id)a3 profileStoreSnapshotProvider:(id)a4 bulletinService:(id)a5 presentationElementFocusCoordinator:(id)a6 powerManager:(id)a7
{
  id v13 = a3;
  id v23 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"callingQueue != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100272FF8(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x100036258LL);
  }

  if (!v14)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"bulletinService != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002730B4(a2);
    }
    goto LABEL_11;
  }

  v17 = v16;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PBProfileBulletinController;
  v18 = -[PBProfileBulletinController init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_queue_snapshotProvider, a4);
    objc_storeStrong((id *)&v19->_queue_bulletinService, a5);
    -[PBBulletinService setDelegate:](v19->_queue_bulletinService, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_mainQueue_presentationElementFocusCoordinator, a6);
    objc_storeStrong((id *)&v19->_mainQueue_powerManager, a7);
    v19->_mainQueue_shouldPresentAutomaticWelcomeBackBulletin = 1;
    objc_initWeak(&location, v19);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000362C0;
    block[3] = &unk_1003D0890;
    objc_copyWeak(&v25, &location);
    dispatch_async(&_dispatch_main_q, block);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (BOOL)hasActiveUserBulletin
{
  return self->_queue_currentWelcomeBackBulletin != 0LL;
}

- (id)welcomeBulletinProfilePictureDataForProfile:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v4 = a3;
  dispatch_assert_queue_V2(queue);
  v5 = objc_alloc_init(&OBJC_CLASS___UPProfilePictureStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UPProfilePictureRequest requestForProfileIdentity:]( &OBJC_CLASS___UPProfilePictureRequest,  "requestForProfileIdentity:",  v6));
  uint64_t v25 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[UPProfilePictureStore cachedProfilePictureForRequest:error:]( v5,  "cachedProfilePictureForRequest:error:",  v7,  &v25));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 imageData]);
  [v8 cropRect];
  if (v9
    && (double v14 = v10,
        double v15 = v11,
        double v16 = v12,
        double v17 = v13,
        (uint64_t v18 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v9))) != 0))
  {
    v19 = (void *)v18;
    uint64_t v20 = TVSUIResizedUserProfilePictureImage(80.0, v14, v15, v16, v17);
    v21 = (UIImage *)objc_claimAutoreleasedReturnValue(v20);
    v22 = UIImageJPEGRepresentation(v21, 0.9);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  }

  else
  {
    id v23 = 0LL;
  }

  return v23;
}

- (void)presentWelcomeBackBulletinWithReason:(int64_t)a3
{
}

+ (BOOL)_didShowWelcomeBackBulletinForProfile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"CountShowWelcomeBackBulletin"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pb_identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeNumberForKey:", v6));
  id v8 = [v7 integerValue];

  return v8 != 0LL;
}

+ (void)_setDidShowWelcomeBackBulletinForProfile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"CountShowWelcomeBackBulletin"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryForKey:@"DidShowWelcomeBackBulletin"]);

  if (!v7) {
    goto LABEL_7;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pb_identifier"));
  unsigned __int8 v9 = objc_msgSend(v7, "bs_BOOLForKey:", v8);

  id v10 = [v7 mutableCopy];
  double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pb_identifier"));
  [v10 removeObjectForKey:v11];

  id v12 = [v10 count];
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  double v14 = v13;
  if (v12) {
    [v13 setObject:v10 forKey:@"DidShowWelcomeBackBulletin"];
  }
  else {
    [v13 removeObjectForKey:@"DidShowWelcomeBackBulletin"];
  }

  if ((v9 & 1) != 0)
  {
    uint64_t v15 = 1LL;
  }

  else
  {
LABEL_7:
    double v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pb_identifier"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeNumberForKey:", v16));
    uint64_t v15 = (uint64_t)[v17 integerValue];
  }

  if ((double)v15 <= 5.0)
  {
    uint64_t v18 = v15 + 1;
    id v19 = objc_msgSend(v5, "mutableCopy", (double)v15, 5.0);
    uint64_t v20 = v19;
    if (v19) {
      id v21 = v19;
    }
    else {
      id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    v22 = v21;

    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pb_identifier"));
    [v22 setObject:v23 forKey:v24];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v25 setObject:v22 forKey:@"CountShowWelcomeBackBulletin"];
  }
}

+ (BOOL)_shouldShowWelcomeBackBulletinForProfile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"CountShowWelcomeBackBulletin"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pb_identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeNumberForKey:", v6));
  id v8 = [v7 integerValue];

  return (double)(uint64_t)v8 <= 5.0;
}

- (void)_queue_releasePausedBulletinsAssertion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000368AC;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_queue_presentWelcomeBackBulletinWithReason:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBProfileStoreSnapshotProviding snapshot](self->_queue_snapshotProvider, "snapshot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeProfile]);
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000369A4;
    v8[3] = &unk_1003D17A8;
    int64_t v12 = a3;
    id v9 = v5;
    id v10 = v6;
    double v11 = self;
    BOOL v13 = a3 == 0;
    v7 = objc_retainBlock(v8);
    ((void (*)(void))v7[2])();
  }

  else
  {
    -[PBProfileBulletinController _queue_releasePausedBulletinsAssertion]( self,  "_queue_releasePausedBulletinsAssertion");
  }
}

- (void)_mainQueue_releasePausedBulletinsAssertion
{
  mainQueue_pauseBulletinsAssertion = self->_mainQueue_pauseBulletinsAssertion;
  self->_mainQueue_pauseBulletinsAssertion = 0LL;
}

- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
  v6 = (void (**)(void))a5;
  BSDispatchQueueAssertMain();
  self->_mainQueue_shouldPresentAutomaticWelcomeBackBulletin = 1;
  -[PBBulletinPausedAssertion invalidate](self->_mainQueue_pauseBulletinsAssertion, "invalidate");
  if ((id)-[PBPresentationElementFocusCoordinator activeLayoutLevel]( self->_mainQueue_presentationElementFocusCoordinator,  "activeLayoutLevel") == (id)22)
  {
    v7 = -[PBBulletinPausedAssertion initWithReason:]( objc_alloc(&OBJC_CLASS___PBBulletinPausedAssertion),  "initWithReason:",  @"WelcomeBack");
    mainQueue_pauseBulletinsAssertion = self->_mainQueue_pauseBulletinsAssertion;
    self->_mainQueue_pauseBulletinsAssertion = v7;
  }

  v6[2](v6);
}

- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5
{
  id v8 = a3;
  BSDispatchQueueAssertMain();
  id v9 = sub_1000370B4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100273170(a5, a4, v10);
  }

  if (a5 == 22 && self->_mainQueue_shouldPresentAutomaticWelcomeBackBulletin)
  {
    id v11 = sub_1000370B4();
    int64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[PBProfileBulletinController presentationElementFocusCoordinator:didUpdateToActiveLayoutLevel:fromLevel:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s: The hot black window was dismissed. Scheduling automatic welcome back bulletin delay timer.",  buf,  0xCu);
    }

    self->_mainQueue_shouldPresentAutomaticWelcomeBackBulletin = 0;
    objc_initWeak((id *)buf, self);
    -[NSTimer invalidate](self->_mainQueue_automaticWelcomeBackBulletinDelayTimer, "invalidate");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000370F8;
    v20[3] = &unk_1003D17D0;
    objc_copyWeak(&v21, (id *)buf);
    BOOL v13 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v20,  2.0));
    mainQueue_automaticWelcomeBackBulletinDelayTimer = self->_mainQueue_automaticWelcomeBackBulletinDelayTimer;
    self->_mainQueue_automaticWelcomeBackBulletinDelayTimer = v13;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  if (a4 == 12)
  {
    id v15 = sub_1000370B4();
    double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[PBProfileBulletinController presentationElementFocusCoordinator:didUpdateToActiveLayoutLevel:fromLevel:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s: The control center window was presented. Cleaning up welcome back bulletin.",  buf,  0xCu);
    }

    -[NSTimer invalidate](self->_mainQueue_automaticWelcomeBackBulletinDelayTimer, "invalidate");
    double v17 = self->_mainQueue_automaticWelcomeBackBulletinDelayTimer;
    self->_mainQueue_automaticWelcomeBackBulletinDelayTimer = 0LL;

    queue = (dispatch_queue_s *)self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10003721C;
    v19[3] = &unk_1003CFF08;
    v19[4] = self;
    dispatch_sync(queue, v19);
  }
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v6 = a4;
  BSDispatchQueueAssertMain();
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000372FC;
  v9[3] = &unk_1003CFEB8;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_sync(queue, v9);
}

- (void).cxx_destruct
{
}

@end