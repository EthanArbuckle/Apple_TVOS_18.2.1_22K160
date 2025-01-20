@interface PBScheduledSleepManager
- (BNBannerSource)bannerSource;
- (NSTimer)currentCountdownTimer;
- (NSTimer)currentScheduledSleepTimer;
- (OS_dispatch_queue)scheduledSleepBannerQueue;
- (PBBulletinService)bulletinService;
- (PBSBulletin)sleepCancelledBulletin;
- (PBSScheduledSleep)currentScheduledSleep;
- (PBScheduledSleepManager)initWithPowerManager:(id)a3 userProfileManager:(id)a4;
- (PBSystemUIServiceCurrentScheduledSleepPublishing)currentScheduledSleepPublisher;
- (id)_cancelReasonFromBundleID:(id)a3;
- (id)_createScheduledSleepWithRequest:(id)a3;
- (void)_cancelScheduledSleepWithReason:(id)a3;
- (void)_postScheduledSleepCancelledBulletin;
- (void)_reportCanceledScheduledSleepWithReason:(id)a3 scheduledSleep:(id)a4;
- (void)_reportScheduledSleepRequestFromClient:(id)a3 scheduledSleep:(id)a4;
- (void)_scheduledSleepBannerQueue_dismissScheduledSleepCountdownBannerWithReason:(id)a3;
- (void)_scheduledSleepBannerQueue_postScheduledSleepCountdownBanner;
- (void)_startScheduledSleepTimerWithDuration:(double)a3;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)cancelScheduledSleepRequestFromClient:(id)a3 completion:(id)a4;
- (void)cancelScheduledSleepRequestWithReason:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)getAvailableScheduledSleepRequestsWithCompletion:(id)a3;
- (void)getCurrentScheduledSleepWithCompletion:(id)a3;
- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)scheduledSleepRequestedByClient:(id)a3 request:(id)a4 completion:(id)a5;
- (void)setBannerSource:(id)a3;
- (void)setBulletinService:(id)a3;
- (void)setCurrentCountdownTimer:(id)a3;
- (void)setCurrentScheduledSleep:(id)a3;
- (void)setCurrentScheduledSleepPublisher:(id)a3;
- (void)setCurrentScheduledSleepTimer:(id)a3;
- (void)setSleepCancelledBulletin:(id)a3;
- (void)userProfileManager:(id)a3 didSwitchToUserWithIdentifier:(id)a4 previousUserIdentifier:(id)a5;
@end

@implementation PBScheduledSleepManager

- (PBScheduledSleepManager)initWithPowerManager:(id)a3 userProfileManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBScheduledSleepManager;
  v8 = -[PBScheduledSleepManager init](&v16, "init");
  if (v8)
  {
    [v6 addObserver:v8];
    [v7 addObserver:v8];
    v9 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
    bulletinService = v8->_bulletinService;
    v8->_bulletinService = v9;

    -[PBBulletinService setDelegate:](v8->_bulletinService, "setDelegate:", v8);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:]( &OBJC_CLASS___BNBannerSource,  "bannerSourceForDestination:forRequesterIdentifier:",  0LL,  @"com.apple.PineBoard"));
    bannerSource = v8->_bannerSource;
    v8->_bannerSource = (BNBannerSource *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.PineBoard.ScheduledSleepBanner", 0LL);
    scheduledSleepBannerQueue = v8->_scheduledSleepBannerQueue;
    v8->_scheduledSleepBannerQueue = (OS_dispatch_queue *)v13;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBScheduledSleepManager;
  -[PBScheduledSleepManager dealloc](&v3, "dealloc");
}

- (void)cancelScheduledSleepRequestFromClient:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepManager _cancelReasonFromBundleID:](self, "_cancelReasonFromBundleID:", v7));

  -[PBScheduledSleepManager _cancelScheduledSleepWithReason:](self, "_cancelScheduledSleepWithReason:", v8);
  if (v6) {
    v6[2](v6, 1LL, 0LL);
  }
}

- (void)cancelScheduledSleepRequestWithReason:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  -[PBScheduledSleepManager _cancelScheduledSleepWithReason:](self, "_cancelScheduledSleepWithReason:", v7);

  if (v6) {
    v6[2](v6, 1LL, 0LL);
  }
}

- (void)getAvailableScheduledSleepRequestsWithCompletion:(id)a3
{
  objc_super v3 = (void (**)(id, void *, void))a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v4 = [[PBSScheduledSleepRequest alloc] initWithDuration:7200.0];
  id v5 = [[PBSScheduledSleepRequest alloc] initWithDuration:3600.0];
  id v6 = [[PBSScheduledSleepRequest alloc] initWithDuration:1800.0];
  id v7 = [[PBSScheduledSleepRequest alloc] initWithDuration:900.0];
  v14[0] = v4;
  v14[1] = v5;
  v14[2] = v6;
  v14[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 4LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 customScheduledSleepDuration]);

  if (v10)
  {
    id v11 = objc_alloc(&OBJC_CLASS___PBSScheduledSleepRequest);
    [v10 doubleValue];
    id v12 = objc_msgSend(v11, "initWithDuration:");
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 arrayByAddingObject:v12]);

    v8 = (void *)v13;
  }

  if (v3) {
    v3[2](v3, v8, 0LL);
  }
}

- (void)getCurrentScheduledSleepWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepManager currentScheduledSleep](self, "currentScheduledSleep"));
    v4[2](v4, v5, 0LL);
  }
}

- (void)scheduledSleepRequestedByClient:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *, void))a5;
  id v10 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  -[PBScheduledSleepManager _cancelScheduledSleepWithReason:]( self,  "_cancelScheduledSleepWithReason:",  @"New Sleep Timer");
  [v8 duration];
  double v12 = v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBScheduledSleepManager _createScheduledSleepWithRequest:]( self,  "_createScheduledSleepWithRequest:",  v8));
  -[PBScheduledSleepManager setCurrentScheduledSleep:](self, "setCurrentScheduledSleep:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepManager currentScheduledSleepPublisher](self, "currentScheduledSleepPublisher"));
  [v14 setCurrentScheduledSleep:v13];

  id v15 = sub_1000F7744();
  objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 predictedEndDate]);
    int v18 = 134218242;
    double v19 = v12;
    __int16 v20 = 2112;
    v21 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Starting sleep timer with duration %f and expected end date %@",  (uint8_t *)&v18,  0x16u);
  }

  -[PBScheduledSleepManager _startScheduledSleepTimerWithDuration:](self, "_startScheduledSleepTimerWithDuration:", v12);
  -[PBScheduledSleepManager _reportScheduledSleepRequestFromClient:scheduledSleep:]( self,  "_reportScheduledSleepRequestFromClient:scheduledSleep:",  v10,  v8);

  if (v9) {
    v9[2](v9, v13, 0LL);
  }
}

- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(void))a5;
  if (a4 == 8)
  {
    id v10 = 0LL;
  }

  else
  {
    id v11 = sub_1000F7744();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Cancelling sleep timer due to system sleep",  buf,  2u);
    }

    id v10 = @"System Sleep";
  }

  -[PBScheduledSleepManager _cancelScheduledSleepWithReason:](self, "_cancelScheduledSleepWithReason:", v10);
  scheduledSleepBannerQueue = (dispatch_queue_s *)self->_scheduledSleepBannerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014BA44;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(scheduledSleepBannerQueue, block);
  if (v9) {
    v9[2](v9);
  }
}

- (void)userProfileManager:(id)a3 didSwitchToUserWithIdentifier:(id)a4 previousUserIdentifier:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014BABC;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10014BB6C;
  v6[3] = &unk_1003CFEB8;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)_startScheduledSleepTimerWithDuration:(double)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10014BCF4;
  v11[3] = &unk_1003D17D0;
  objc_copyWeak(&v12, &location);
  id v5 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v11,  a3));
  currentScheduledSleepTimer = self->_currentScheduledSleepTimer;
  self->_currentScheduledSleepTimer = v5;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10014BDE0;
  v9[3] = &unk_1003D94B8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  id v7 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v9,  a3 + -20.0));
  currentCountdownTimer = self->_currentCountdownTimer;
  self->_currentCountdownTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_cancelScheduledSleepWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepManager currentScheduledSleep](self, "currentScheduledSleep"));

  if (v5)
  {
    if (v4)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepManager currentScheduledSleep](self, "currentScheduledSleep"));
      -[PBScheduledSleepManager _reportCanceledScheduledSleepWithReason:scheduledSleep:]( self,  "_reportCanceledScheduledSleepWithReason:scheduledSleep:",  v4,  v6);
    }

    -[NSTimer invalidate](self->_currentScheduledSleepTimer, "invalidate");
    currentScheduledSleepTimer = self->_currentScheduledSleepTimer;
    self->_currentScheduledSleepTimer = 0LL;

    -[NSTimer invalidate](self->_currentCountdownTimer, "invalidate");
    currentCountdownTimer = self->_currentCountdownTimer;
    self->_currentCountdownTimer = 0LL;

    currentScheduledSleep = self->_currentScheduledSleep;
    self->_currentScheduledSleep = 0LL;

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepManager currentScheduledSleepPublisher](self, "currentScheduledSleepPublisher"));
    [v10 setCurrentScheduledSleep:0];
  }
}

- (id)_createScheduledSleepWithRequest:(id)a3
{
  double v4 = v3;
  id v5 = objc_alloc(&OBJC_CLASS___PBSScheduledSleep);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:v4]);
  id v8 = -[PBSScheduledSleep initWithDuration:predictedEndDate:](v5, "initWithDuration:predictedEndDate:", v7, v4);

  return v8;
}

- (void)_postScheduledSleepCancelledBulletin
{
  if (!self->_sleepCancelledBulletin)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepManager currentScheduledSleep](self, "currentScheduledSleep"));

    if (v3)
    {
      double v4 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
      id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_1003FDCE0, PBSSystemBulletinStyleKey);
      id v6 = sub_1001C307C(@"ScheduledSleepCancelledTitle", 0LL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, PBSSystemBulletinTitleKey);

      -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  @"fitness.timer",  PBSSystemBulletinSymbolNameKey);
      -[PBSBulletin setMessage:](v4, "setMessage:", v5);
      -[PBSBulletin setViewControllerClassName:]( v4,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
      -[PBSBulletin setServiceIdentifier:](v4, "setServiceIdentifier:", PBSSystemBulletinServiceName);
      sleepCancelledBulletin = self->_sleepCancelledBulletin;
      self->_sleepCancelledBulletin = v4;
      v9 = v4;

      -[PBBulletinService presentBulletin:withCompletion:]( self->_bulletinService,  "presentBulletin:withCompletion:",  v9,  0LL);
    }
  }

- (void)_scheduledSleepBannerQueue_postScheduledSleepCountdownBanner
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepManager currentScheduledSleep](self, "currentScheduledSleep"));

  if (v3)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___PBScheduledSleepCountdownBannerViewController);
    v8[0] = TVSPBannerPresentableKeyBannerType;
    v8[1] = TVSPBannerPresentableKeyTimeout;
    v9[0] = &off_1003FDCF8;
    v9[1] = &off_1003FDD10;
    v8[2] = TVSPBannerPresentableKeyAutoDismissOnAction;
    v8[3] = TVSPBannerPresentableKeyHostedBannerWantsGestureForAction;
    v9[2] = &__kCFBooleanTrue;
    v9[3] = &__kCFBooleanTrue;
    v8[4] = TVSPBannerPresentableKeyActionTrigger;
    v8[5] = TVSPBannerPresentableKeyHighPriority;
    v9[4] = &off_1003FDD28;
    void v9[5] = &__kCFBooleanTrue;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  6LL));
    bannerSource = self->_bannerSource;
    uint64_t v7 = 0LL;
    -[BNBannerSource postPresentable:options:userInfo:error:]( bannerSource,  "postPresentable:options:userInfo:error:",  v4,  0LL,  v5,  &v7);
  }

- (void)_scheduledSleepBannerQueue_dismissScheduledSleepCountdownBannerWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_scheduledSleepBannerQueue);
  bannerSource = self->_bannerSource;
  id v10 = 0LL;
  id v6 =  -[BNBannerSource revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:]( bannerSource,  "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:",  @"CountdownTimerBanner",  v4,  0LL,  0LL,  &v10);
  id v7 = v10;
  if (v7)
  {
    id v8 = sub_1000F7744();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to dismiss sleep timer countdown banner with error %@",  buf,  0xCu);
    }
  }
}

- (void)_reportScheduledSleepRequestFromClient:(id)a3 scheduledSleep:(id)a4
{
  id v5 = a3;
  [a4 duration];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10014C454;
  v8[3] = &unk_1003D94E0;
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  AnalyticsSendEventLazy(@"com.apple.appletv.sleeptimer.started", v8);
}

- (void)_reportCanceledScheduledSleepWithReason:(id)a3 scheduledSleep:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 duration];
  uint64_t v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 predictedEndDate]);

  [v9 timeIntervalSinceNow];
  uint64_t v11 = v10;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10014C5D0;
  v13[3] = &unk_1003D9508;
  id v14 = v5;
  uint64_t v15 = v8;
  uint64_t v16 = v11;
  id v12 = v5;
  AnalyticsSendEventLazy(@"com.apple.appletv.sleeptimer.canceled", v13);
}

- (id)_cancelReasonFromBundleID:(id)a3
{
  else {
    return 0LL;
  }
}

- (PBSystemUIServiceCurrentScheduledSleepPublishing)currentScheduledSleepPublisher
{
  return self->_currentScheduledSleepPublisher;
}

- (void)setCurrentScheduledSleepPublisher:(id)a3
{
}

- (PBSScheduledSleep)currentScheduledSleep
{
  return self->_currentScheduledSleep;
}

- (void)setCurrentScheduledSleep:(id)a3
{
}

- (NSTimer)currentScheduledSleepTimer
{
  return self->_currentScheduledSleepTimer;
}

- (void)setCurrentScheduledSleepTimer:(id)a3
{
}

- (NSTimer)currentCountdownTimer
{
  return self->_currentCountdownTimer;
}

- (void)setCurrentCountdownTimer:(id)a3
{
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (void)setBulletinService:(id)a3
{
}

- (PBSBulletin)sleepCancelledBulletin
{
  return self->_sleepCancelledBulletin;
}

- (void)setSleepCancelledBulletin:(id)a3
{
}

- (OS_dispatch_queue)scheduledSleepBannerQueue
{
  return self->_scheduledSleepBannerQueue;
}

- (BNBannerSource)bannerSource
{
  return self->_bannerSource;
}

- (void)setBannerSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end