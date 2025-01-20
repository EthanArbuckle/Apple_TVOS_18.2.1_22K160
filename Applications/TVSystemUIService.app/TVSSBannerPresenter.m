@interface TVSSBannerPresenter
- (BNConsidering)authority;
- (BNPosting)poster;
- (BSInvalidatable)stateCaptureHandle;
- (NSArray)allPresentables;
- (NSArray)fullyPresentedTopPresentables;
- (NSArray)presentedPresentables;
- (NSArray)topPresentables;
- (NSMutableArray)presentables;
- (NSMutableArray)transitioningStack;
- (NSMutableSet)dismissingPresentables;
- (NSMutableSet)presentingPresentables;
- (NSTimer)timeoutTimer;
- (TVSSBannerPresenter)init;
- (TVSSBannerPresenter)initWithAuthority:(id)a3;
- (TVSSBannerPresenterDelegate)delegate;
- (TVSSMenuModeStateContributingDelegate)contributorDelegate;
- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6;
- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 userInfo:(id)a5;
- (void)cancelTimeoutTimer;
- (void)dealloc;
- (void)menuModeBannerContextDidCompleteTransition:(id)a3;
- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5;
- (void)setContributorDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissingPresentables:(id)a3;
- (void)setPoster:(id)a3;
- (void)setPresentables:(id)a3;
- (void)setPresentingPresentables:(id)a3;
- (void)setStateCaptureHandle:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTransitioningStack:(id)a3;
- (void)updateMenuModeState:(id)a3;
@end

@implementation TVSSBannerPresenter

- (TVSSBannerPresenter)init
{
  SEL v23 = a2;
  v24 = 0LL;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVSSBannerPresenter;
  v24 = -[TVSSBannerPresenter init](&v22, "init");
  objc_storeStrong((id *)&v24, v24);
  if (v24)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    presentables = v24->_presentables;
    v24->_presentables = v2;

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    presentingPresentables = v24->_presentingPresentables;
    v24->_presentingPresentables = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    dismissingPresentables = v24->_dismissingPresentables;
    v24->_dismissingPresentables = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    transitioningStack = v24->_transitioningStack;
    v24->_transitioningStack = v8;

    objc_initWeak(&v21, v24);
    v14 = &_dispatch_main_q;
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_100119124;
    v19 = &unk_1001B6330;
    objc_copyWeak(&v20, &v21);
    v10 = (BSInvalidatable *)(id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle( v14,  @"TVSystemUIService - Banners - Presenter",  &v15);
    stateCaptureHandle = v24->_stateCaptureHandle;
    v24->_stateCaptureHandle = v10;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v21);
  }

  v13 = v24;
  objc_storeStrong((id *)&v24, 0LL);
  return v13;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  objc_storeStrong((id *)&v4->_stateCaptureHandle, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSBannerPresenter;
  -[TVSSBannerPresenter dealloc](&v2, "dealloc");
}

- (void)cancelTimeoutTimer
{
}

- (NSArray)allPresentables
{
  return (NSArray *)-[NSMutableArray copy](self->_presentables, "copy", a2, self);
}

- (NSArray)presentedPresentables
{
  v10[2] = self;
  v10[1] = (id)a2;
  presentables = self->_presentables;
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_100119674;
  v9 = &unk_1001BB690;
  v10[0] = self;
  id v4 = -[NSMutableArray bs_filter:](presentables, "bs_filter:");
  objc_storeStrong(v10, 0LL);
  return (NSArray *)v4;
}

- (NSArray)topPresentables
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSBannerPresenter presentedPresentables](self, "presentedPresentables");
  char v6 = 0;
  char v4 = 0;
  if ([location[0] count])
  {
    id v7 = [location[0] lastObject];
    char v6 = 1;
    id v10 = v7;
    v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL);
    char v4 = 1;
    objc_super v2 = v5;
  }

  else
  {
    objc_super v2 = &__NSArray0__struct;
  }

  v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return v9;
}

- (NSArray)fullyPresentedTopPresentables
{
  v12[2] = self;
  v12[1] = (id)a2;
  presentables = self->_presentables;
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_100119958;
  v11 = &unk_1001BB690;
  v12[0] = self;
  id v6 = -[NSMutableArray bs_filter:](presentables, "bs_filter:", &v7);
  if (v6) {
    id v2 = v6;
  }
  else {
    id v2 = &__NSArray0__struct;
  }
  id v4 = v2;

  objc_storeStrong(v12, 0LL);
  return (NSArray *)v4;
}

- (TVSSBannerPresenter)initWithAuthority:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = BannerPresenterLog();
  char v7 = 17;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
  {
    log = (os_log_s *)v8;
    os_log_type_t type = v7;
    sub_100010524(v6);
    _os_log_fault_impl((void *)&_mh_execute_header, log, type, "-initWithAuthority: is not implemented.", v6, 2u);
  }

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v10, 0LL);
  return 0LL;
}

- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v29[1] = (id)a4;
  v29[0] = 0LL;
  objc_storeStrong(v29, a5);
  id v28 = BannerPresenterLog();
  os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v28;
    os_log_type_t type = v27;
    id v16 = (id)BNEffectivePresentableDescription(location[0]);
    id v26 = v16;
    sub_10001AEB8((uint64_t)v33, (uint64_t)v26);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Asked to present presentable. {presentable=%{public}@}",  v33,  0xCu);

    objc_storeStrong(&v26, 0LL);
  }

  objc_storeStrong(&v28, 0LL);
  if (location[0]
    && (-[NSMutableSet containsObject:](v31->_presentingPresentables, "containsObject:", location[0]) & 1) == 0)
  {
    id v24 = BannerPresenterLog();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (os_log_s *)v24;
      os_log_type_t v12 = v23;
      id v13 = (id)BNEffectivePresentableDescription(location[0]);
      id v22 = v13;
      sub_100061BC8((uint64_t)v32, (uint64_t)v22, (uint64_t)v29[0]);
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "Presenting presentable. {presentable=%{public}@, userInfo=%@}",  v32,  0x16u);

      objc_storeStrong(&v22, 0LL);
    }

    objc_storeStrong(&v24, 0LL);
    sub_100119EA0((uint64_t)v31, location[0]);
    -[NSMutableSet addObject:](v31->_presentingPresentables, "addObject:", location[0]);
    -[NSMutableSet removeObject:](v31->_dismissingPresentables, "removeObject:", location[0]);
    id WeakRetained = objc_loadWeakRetained((id *)&v31->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "presenter:willPresentPresentable:") & 1) != 0)
    {
      int v9 = v31;
      id v10 = TVSSBannerPresentable(location[0]);
      objc_msgSend(WeakRetained, "presenter:willPresentPresentable:", v9);
    }

    id v20 = TVSSUIViewControllerBannerPresentable(location[0]);
    char v7 = objc_alloc(&OBJC_CLASS___TVSSMenuModeBannerContext);
    id v6 = v20;
    unsigned __int8 v5 = [v20 supportsDisplayingAsMenuItem];
    v19 = -[TVSSMenuModeBannerContext initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractiveMode:transitionObserver:dismissalReason:]( v7,  "initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractiveMo de:transitionObserver:dismissalReason:",  1LL,  v6,  1LL,  v5 & 1,  v31);
    -[NSMutableArray addObject:](v31->_transitioningStack, "addObject:", v19);
    id v8 = -[TVSSBannerPresenter contributorDelegate](v31, "contributorDelegate");
    -[TVSSMenuModeStateContributingDelegate stateContributorHasUpdate:](v8, "stateContributorHasUpdate:", v31);

    objc_storeStrong((id *)&v19, 0LL);
    objc_storeStrong(&v20, 0LL);
    objc_storeStrong(&WeakRetained, 0LL);
    int v25 = 0;
  }

  else
  {
    int v25 = 1;
  }

  objc_storeStrong(v29, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v14 = BannerPresenterLog();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v14;
    os_log_type_t type = v13;
    id v9 = (id)BNPresentableIdentificationDescription(location[0]);
    id v12 = v9;
    sub_10002F860((uint64_t)v19, (uint64_t)v12, (uint64_t)v16);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Asked to dismiss presentables. {identification=%{public}@, reason: '%{public}@'}",  v19,  0x16u);

    objc_storeStrong(&v12, 0LL);
  }

  objc_storeStrong(&v14, 0LL);
  id v6 = sub_10011A140((id *)&v18->super.isa, location[0], v16, 1, v15);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  BOOL v18 = a5;
  id v17 = 0LL;
  objc_storeStrong(&v17, a6);
  id v16 = BannerPresenterLog();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v16;
    os_log_type_t type = v15;
    id v10 = (id)BNPresentableIdentificationDescription(location[0]);
    id v14 = v10;
    sub_10011A59C((uint64_t)v22, (uint64_t)v14, (uint64_t)v19, v18);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Asked to dismiss presentables. {identification=%{public}@, reason='%{public}@', animated=%{BOOL}d}",  v22,  0x1Cu);

    objc_storeStrong(&v14, 0LL);
  }

  objc_storeStrong(&v16, 0LL);
  id v7 = sub_10011A140((id *)&v21->super.isa, location[0], v19, v18, v17);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)menuModeBannerContextDidCompleteTransition:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = BannerPresenterLog();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    sub_10001AEB8((uint64_t)v12, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Banner context did complete transition. {bannerContext=%{public}@}",  v12,  0xCu);
  }

  objc_storeStrong(&v9, 0LL);
  if ([location[0] bannerPresentationState] == (id)1)
  {
    p_isa = (id *)&v11->super.isa;
    id v8 = [location[0] transitioningBannerPresentable];
    sub_10011A810(p_isa, v8);
  }

  else if ([location[0] bannerPresentationState] == (id)3)
  {
    id v4 = (id *)&v11->super.isa;
    id v6 = [location[0] transitioningBannerPresentable];
    id v5 = [location[0] dismissalReason];
    sub_10011AAD8(v4, v6, v5);
  }

  -[NSMutableArray removeObject:](v11->_transitioningStack, "removeObject:", location[0]);
  SEL v3 = -[TVSSBannerPresenter contributorDelegate](v11, "contributorDelegate");
  -[TVSSMenuModeStateContributingDelegate stateContributorHasUpdate:](v3, "stateContributorHasUpdate:", v11);

  objc_storeStrong(location, 0LL);
}

- (void)updateMenuModeState:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  if (-[NSMutableArray count](v16->_transitioningStack, "count"))
  {
    SEL v3 = (TVSSMenuModeBannerContext *)-[NSMutableArray firstObject](v16->_transitioningStack, "firstObject");
    id v4 = v14;
    id v14 = v3;
  }

  else if (-[NSMutableArray count](v16->_presentables, "count"))
  {
    if (-[NSMutableArray count](v16->_presentables, "count")
      && !-[NSMutableSet count](v16->_presentingPresentables, "count")
      && !-[NSMutableSet count](v16->_dismissingPresentables, "count"))
    {
      v11 = -[TVSSBannerPresenter presentedPresentables](v16, "presentedPresentables");
      id v10 = -[NSArray firstObject](v11, "firstObject");
      id v13 = TVSSBannerPresentable(v10);

      id v12 = objc_alloc(&OBJC_CLASS___TVSSMenuModeBannerContext);
      id v7 = -[TVSSMenuModeBannerContext initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractiveMode:transitionObserver:dismissalReason:]( v12,  "initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractiveM ode:transitionObserver:dismissalReason:",  2,  0,  0,  (unint64_t)[v13 supportsDisplayingAsMenuItem] & 1,  0);
      id v8 = v14;
      id v14 = v7;

      objc_storeStrong(&v13, 0LL);
    }
  }

  else
  {
    id v5 = -[TVSSMenuModeBannerContext initWithBannerPresentationState:]( objc_alloc(&OBJC_CLASS___TVSSMenuModeBannerContext),  "initWithBannerPresentationState:",  0LL);
    id v6 = v14;
    id v14 = v5;
  }

  objc_msgSend(location[0], "setBannerContext:", v14, &v14);
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BNConsidering)authority
{
  return self->_authority;
}

- (BNPosting)poster
{
  return (BNPosting *)objc_loadWeakRetained((id *)&self->_poster);
}

- (void)setPoster:(id)a3
{
}

- (TVSSBannerPresenterDelegate)delegate
{
  return (TVSSBannerPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSSMenuModeStateContributingDelegate)contributorDelegate
{
  return (TVSSMenuModeStateContributingDelegate *)objc_loadWeakRetained((id *)&self->contributorDelegate);
}

- (void)setContributorDelegate:(id)a3
{
}

- (NSMutableArray)presentables
{
  return self->_presentables;
}

- (void)setPresentables:(id)a3
{
}

- (NSMutableSet)presentingPresentables
{
  return self->_presentingPresentables;
}

- (void)setPresentingPresentables:(id)a3
{
}

- (NSMutableSet)dismissingPresentables
{
  return self->_dismissingPresentables;
}

- (void)setDismissingPresentables:(id)a3
{
}

- (NSMutableArray)transitioningStack
{
  return self->_transitioningStack;
}

- (void)setTransitioningStack:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setStateCaptureHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end