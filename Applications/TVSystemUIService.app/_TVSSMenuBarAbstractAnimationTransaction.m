@interface _TVSSMenuBarAbstractAnimationTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)animated;
- (BOOL)isBannerTransaction;
- (TVSSMenuBarAnimationContext)animationContext;
- (_TVSSMenuBarAbstractAnimationTransaction)initWithAnimationContext:(id)a3 animated:(BOOL)a4;
- (void)_didBegin;
- (void)_didComplete;
- (void)_didInterruptWithReason:(id)a3;
- (void)_didSatisfyMilestone:(id)a3;
- (void)_willBegin;
- (void)_willFailWithReason:(id)a3;
@end

@implementation _TVSSMenuBarAbstractAnimationTransaction

- (_TVSSMenuBarAbstractAnimationTransaction)initWithAnimationContext:(id)a3 animated:(BOOL)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v10 = a4;
  v4 = v12;
  v12 = 0LL;
  v9.receiver = v4;
  v9.super_class = (Class)&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction;
  v8 = -[_TVSSMenuBarAbstractAnimationTransaction init](&v9, "init");
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v12->_animationContext, location[0]);
    v12->_animated = v10;
  }

  v6 = v12;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v6;
}

- (BOOL)isBannerTransaction
{
  v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](self, "animationContext");
  id v4 = -[TVSSMenuBarAnimationContext menuMode](v3, "menuMode");

  v5 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](self, "animationContext");
  id v6 = -[TVSSMenuBarAnimationContext previousMenuMode](v5, "previousMenuMode");

  BOOL v7 = 1;
  if (v4 != (id)1) {
    return v6 == (id)1;
  }
  return v7;
}

- (void)_willBegin
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willBegin](&v9, "_willBegin");
  os_log_t oslog = (os_log_t)MenuBarAnimationLog();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    os_log_type_t v4 = type;
    v2 = (objc_class *)objc_opt_class(v11);
    v5 = NSStringFromClass(v2);
    id v6 = v5;
    sub_1000304AC((uint64_t)v12, (uint64_t)v6, (uint64_t)v11);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  v4,  "Transaction will begin. {transaction=%{public}@-%p}",  v12,  0x16u);

    objc_storeStrong((id *)&v6, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
}

- (void)_didBegin
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _didBegin](&v9, "_didBegin");
  os_log_t oslog = (os_log_t)MenuBarAnimationLog();
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    log = oslog;
    os_log_type_t v4 = type;
    v2 = (objc_class *)objc_opt_class(v11);
    v5 = NSStringFromClass(v2);
    id v6 = v5;
    sub_1000304AC((uint64_t)v12, (uint64_t)v6, (uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, log, v4, "Transaction did begin. {transaction=%{public}@-%p}", v12, 0x16u);

    objc_storeStrong((id *)&v6, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
}

- (void)_didSatisfyMilestone:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _didSatisfyMilestone:](&v10, "_didSatisfyMilestone:", location[0]);
  os_log_t oslog = (os_log_t)MenuBarAnimationLog();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    os_log_type_t v5 = type;
    v3 = (objc_class *)objc_opt_class(v12);
    id v6 = NSStringFromClass(v3);
    BOOL v7 = v6;
    sub_100030798((uint64_t)v13, (uint64_t)v7, (uint64_t)v12, (uint64_t)location[0]);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  v5,  "Transaction did satisfy milestone. {transaction=%{public}@-%p, milestone=%{public}@}",  v13,  0x20u);

    objc_storeStrong((id *)&v7, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_didInterruptWithReason:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _didInterruptWithReason:](&v10, "_didInterruptWithReason:", location[0]);
  os_log_t oslog = (os_log_t)MenuBarAnimationLog();
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    log = oslog;
    os_log_type_t v5 = type;
    v3 = (objc_class *)objc_opt_class(v12);
    id v6 = NSStringFromClass(v3);
    BOOL v7 = v6;
    sub_100030798((uint64_t)v13, (uint64_t)v7, (uint64_t)v12, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  v5,  "Transaction did interrupt. {transaction=%{public}@-%p, reason=%{public}@}",  v13,  0x20u);

    objc_storeStrong((id *)&v7, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v10, "_willFailWithReason:", location[0]);
  os_log_t oslog = (os_log_t)MenuBarAnimationLog();
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v5 = type;
    v3 = (objc_class *)objc_opt_class(v12);
    id v6 = NSStringFromClass(v3);
    BOOL v7 = v6;
    sub_100030798((uint64_t)v13, (uint64_t)v7, (uint64_t)v12, (uint64_t)location[0]);
    _os_log_error_impl( (void *)&_mh_execute_header,  log,  v5,  "Transaction will fail. {transaction=%{public}@-%p, reason=%{public}@}",  v13,  0x20u);

    objc_storeStrong((id *)&v7, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didComplete
{
  v32 = self;
  SEL v31 = a2;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _didComplete](&v30, "_didComplete");
  char v29 = -[_TVSSMenuBarAbstractAnimationTransaction _isRootTransaction](v32, "_isRootTransaction") & 1;
  char v28 = -[_TVSSMenuBarAbstractAnimationTransaction isBannerTransaction](v32, "isBannerTransaction");
  id v27 = MenuBarAnimationLog();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v27;
    os_log_type_t type = v26;
    v2 = (objc_class *)objc_opt_class(v32);
    v15 = NSStringFromClass(v2);
    v25 = v15;
    sub_100030F04((uint64_t)v35, (uint64_t)v25, (uint64_t)v32, v29 & 1, v28 & 1);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Transaction did complete. {transaction=%{public}@-%p, isRootTransaction=%{BOOL}d, isBannerTransaction=%{BOOL}d}",  v35,  0x22u);

    objc_storeStrong((id *)&v25, 0LL);
  }

  objc_storeStrong(&v27, 0LL);
  if ((v29 & 1) != 0)
  {
    v12 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v32, "animationContext");
    id v24 = -[TVSSMenuBarAnimationContext currentBannerContext](v12, "currentBannerContext");

    id v23 = [v24 transitionObserver];
    if (v24) {
      id v11 = [v24 bannerPresentationState];
    }
    else {
      id v11 = 0LL;
    }
    id v22 = v11;
    if ((v28 & 1) != 0 || !v22)
    {
      if ((v28 & 1) != 0 && v23)
      {
        os_log_t v18 = (os_log_t)MenuBarAnimationLog();
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          os_log_type_t v5 = v18;
          os_log_type_t v6 = v17;
          os_log_type_t v4 = (objc_class *)objc_opt_class(v32);
          BOOL v7 = NSStringFromClass(v4);
          v16 = v7;
          sub_100030798((uint64_t)v33, (uint64_t)v16, (uint64_t)v32, (uint64_t)v24);
          _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "Completing banner context transition. {transaction=%{public}@-%p, bannerContext=%{public}@}",  v33,  0x20u);

          objc_storeStrong((id *)&v16, 0LL);
        }

        objc_storeStrong((id *)&v18, 0LL);
        [v23 menuModeBannerContextDidCompleteTransition:v24];
      }
    }

    else
    {
      os_log_t oslog = (os_log_t)MenuBarAnimationLog();
      os_log_type_t v20 = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        v8 = oslog;
        os_log_type_t v9 = v20;
        v3 = (objc_class *)objc_opt_class(v32);
        objc_super v10 = NSStringFromClass(v3);
        v19 = v10;
        sub_100030F80((uint64_t)v34, (uint64_t)v19, (uint64_t)v32, (uint64_t)v23, (uint64_t)v24);
        _os_log_fault_impl( (void *)&_mh_execute_header,  v8,  v9,  "Non-banner transaction has a banner context. {transaction=%{public}@-%p, bannerTransitionObserver=%p, bannerCo ntext=%{public}@}",  v34,  0x2Au);

        objc_storeStrong((id *)&v19, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    objc_storeStrong(&v23, 0LL);
    objc_storeStrong(&v24, 0LL);
  }

- (TVSSMenuBarAnimationContext)animationContext
{
  return self->_animationContext;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void).cxx_destruct
{
}

@end