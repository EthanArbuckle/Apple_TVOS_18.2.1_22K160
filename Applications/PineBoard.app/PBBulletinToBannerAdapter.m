@interface PBBulletinToBannerAdapter
- (BNBannerSource)bannerSource;
- (BOOL)isForwardableBulletin:(id)a3;
- (BOOL)isPresentableBulletin:(id)a3;
- (NSMutableDictionary)bulletinsByIdentifier;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (PBBulletinToBannerAdapter)init;
- (PBBulletinToBannerAdapterDelegate)delegate;
- (void)dealloc;
- (void)dismissBulletin:(id)a3;
- (void)forwardBulletin:(id)a3;
- (void)forwardBulletin:(id)a3 responseHandler:(id)a4;
- (void)handleForwardedBulletinObservingAction:(id)a3;
- (void)invalidate;
- (void)presentBannerFromBulletin:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateBannerWithNewBulletin:(id)a3 replacingBulletin:(id)a4 completionHandler:(id)a5;
@end

@implementation PBBulletinToBannerAdapter

- (PBBulletinToBannerAdapter)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBBulletinToBannerAdapter;
  v2 = -[PBBulletinToBannerAdapter init](&v12, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.PineBoard.%p",  v2));
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:]( &OBJC_CLASS___BNBannerSource,  "bannerSourceForDestination:forRequesterIdentifier:",  0LL,  v3));
    bannerSource = v2->_bannerSource;
    v2->_bannerSource = (BNBannerSource *)v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    bulletinsByIdentifier = v2->_bulletinsByIdentifier;
    v2->_bulletinsByIdentifier = v6;

    id v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.PineBoard.BannerAdapter.%p", v2));
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 cStringUsingEncoding:4], 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v2->_callbackQueue, &_dispatch_main_q);
  }

  return v2;
}

- (void)dealloc
{
  id v3 = sub_1000F78AC();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10027FD30(v4);
  }

  -[BNBannerSource invalidate](self->_bannerSource, "invalidate");
  bannerSource = self->_bannerSource;
  self->_bannerSource = 0LL;

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBBulletinToBannerAdapter;
  -[PBBulletinToBannerAdapter dealloc](&v6, "dealloc");
}

- (BOOL)isPresentableBulletin:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 viewControllerClassName]);
  unsigned __int8 v4 = [v3 isEqualToString:PBSSystemBulletinViewControllerClassName];

  return v4;
}

- (void)presentBannerFromBulletin:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000F78AC();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Converting bulletin '%@' to banner", buf, 0xCu);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000F8514;
  v9[3] = &unk_1003CFEB8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(workQueue, v9);
}

- (void)updateBannerWithNewBulletin:(id)a3 replacingBulletin:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F87F0;
  v15[3] = &unk_1003D32D8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)dismissBulletin:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F8AD4;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)invalidate
{
  id v3 = sub_1000F78AC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating Bulletin Adapter", buf, 2u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8D18;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)isForwardableBulletin:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 viewControllerClassName]);
  unsigned __int8 v4 = [v3 isEqual:PBSVideoSystemBulletinViewControllerClassName];

  return v4;
}

- (void)forwardBulletin:(id)a3
{
}

- (void)forwardBulletin:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8EFC;
  block[3] = &unk_1003D2F08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)handleForwardedBulletinObservingAction:(id)a3
{
  id v4 = a3;
  callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F93C8;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(@"TVSPBanner");
  if (!v4)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002804EC();
    }
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FB1E0LL);
  }

  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSPBannerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002804EC();
    }
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FB244LL);
  }

  id v6 = v4;
  id v7 = sub_1000F78AC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 requestIdentifier]);
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Banner '%@' Did Appear", buf, 0xCu);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FB24C;
  block[3] = &unk_1003CFEB8;
  block[4] = self;
  id v15 = v6;
  id v11 = v6;
  dispatch_async(workQueue, block);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  Class v9 = NSClassFromString(@"TVSPBanner");
  if (!v8)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028059C();
    }
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FB4FCLL);
  }

  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSPBannerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028059C();
    }
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FB560LL);
  }

  id v10 = sub_1000F78AC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 requestIdentifier]);
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Banner '%@' did disappear with reason: '%@'",  buf,  0x16u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FB568;
  block[3] = &unk_1003D09B8;
  block[4] = self;
  id v19 = v8;
  id v20 = v7;
  id v14 = v7;
  id v15 = v8;
  dispatch_async(workQueue, block);
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  Class v9 = NSClassFromString(@"TVSPBanner");
  if (!v8)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028064C();
    }
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FB848LL);
  }

  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSPBannerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028064C();
    }
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FB8ACLL);
  }

  id v10 = v8;
  id v11 = sub_1000F78AC();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "presentableWillNotAppearAsBanner %@, reason: '%@'",  buf,  0x16u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FB8B4;
  block[3] = &unk_1003D09B8;
  block[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v14 = v10;
  id v15 = v7;
  dispatch_async(workQueue, block);
}

- (PBBulletinToBannerAdapterDelegate)delegate
{
  return (PBBulletinToBannerAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (BNBannerSource)bannerSource
{
  return self->_bannerSource;
}

- (NSMutableDictionary)bulletinsByIdentifier
{
  return self->_bulletinsByIdentifier;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

  ;
}

@end