@interface PBHeadphoneBannerManager
- (BNBannerSource)bannerSource;
- (OS_dispatch_queue)bannerQueue;
- (PBDistributedAssertion)suppressBulletinAssertion;
- (PBHeadphoneBannerManager)init;
- (void)_bannerQueue_postHeadphoneBannerWithRequest:(id)a3 completion:(id)a4;
- (void)presentHeadphoneBannerWithRequest:(id)a3 completion:(id)a4;
- (void)setBannerSource:(id)a3;
@end

@implementation PBHeadphoneBannerManager

- (PBHeadphoneBannerManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBHeadphoneBannerManager;
  v2 = -[PBHeadphoneBannerManager init](&v11, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:]( &OBJC_CLASS___BNBannerSource,  "bannerSourceForDestination:forRequesterIdentifier:",  0LL,  @"com.apple.PineBoard"));
    bannerSource = v2->_bannerSource;
    v2->_bannerSource = (BNBannerSource *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.PineBoard.HeadphoneBanner", 0LL);
    bannerQueue = v2->_bannerQueue;
    v2->_bannerQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBDistributedAssertion distributedAssertionForDomain:]( &OBJC_CLASS___PBDistributedAssertion,  "distributedAssertionForDomain:",  PBSAssertionDomainSuppressHeadphoneBulletin));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 requireFocusedProcess]);
    suppressBulletinAssertion = v2->_suppressBulletinAssertion;
    v2->_suppressBulletinAssertion = (PBDistributedAssertion *)v8;
  }

  return v2;
}

- (void)presentHeadphoneBannerWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  bannerQueue = (dispatch_queue_s *)self->_bannerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100133D50;
  block[3] = &unk_1003D2F08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(bannerQueue, block);
}

- (void)_bannerQueue_postHeadphoneBannerWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  bannerQueue = (dispatch_queue_s *)self->_bannerQueue;
  uint64_t v8 = (void (**)(id, void, PBHeadphoneBannerViewController *))a4;
  dispatch_assert_queue_V2(bannerQueue);
  if (-[PBDistributedAssertion isActive](self->_suppressBulletinAssertion, "isActive"))
  {
    uint64_t v9 = PineBoardServicesErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
    v16 = @"Headphone bulletin assertion active.";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    objc_super v11 = (PBHeadphoneBannerViewController *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  303LL,  v10));

    v8[2](v8, 0LL, v11);
  }

  else
  {
    objc_super v11 = -[PBHeadphoneBannerViewController initWithRequest:]( objc_alloc(&OBJC_CLASS___PBHeadphoneBannerViewController),  "initWithRequest:",  v6);
    v17[0] = TVSPBannerPresentableKeyBannerType;
    v17[1] = TVSPBannerPresentableKeyHighPriority;
    v18[0] = &off_1003FDBF0;
    v18[1] = &__kCFBooleanTrue;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
    bannerSource = self->_bannerSource;
    uint64_t v14 = 0LL;
    -[BNBannerSource postPresentable:options:userInfo:error:]( bannerSource,  "postPresentable:options:userInfo:error:",  v11,  0LL,  v12,  &v14);
    ((void (*)(void (**)(id, void, PBHeadphoneBannerViewController *), BOOL))v8[2])( v8,  v14 == 0);

    uint64_t v8 = (void (**)(id, void, PBHeadphoneBannerViewController *))v12;
  }
}

- (OS_dispatch_queue)bannerQueue
{
  return self->_bannerQueue;
}

- (BNBannerSource)bannerSource
{
  return self->_bannerSource;
}

- (void)setBannerSource:(id)a3
{
}

- (PBDistributedAssertion)suppressBulletinAssertion
{
  return self->_suppressBulletinAssertion;
}

- (void).cxx_destruct
{
}

@end