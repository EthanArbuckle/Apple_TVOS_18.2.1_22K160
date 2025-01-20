@interface TVSSMenuModeBannerContext
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAnimateTransition;
- (BOOL)supportsInteractiveMode;
- (NSString)dismissalReason;
- (TVSSBannerPresentable)transitioningBannerPresentable;
- (TVSSMenuModeBannerContext)init;
- (TVSSMenuModeBannerContext)initWithBannerPresentationState:(int64_t)a3;
- (TVSSMenuModeBannerContext)initWithBannerPresentationState:(int64_t)a3 transitioningBannerPresentable:(id)a4 shouldAnimateTransition:(BOOL)a5 supportsInteractiveMode:(BOOL)a6 transitionObserver:(id)a7 dismissalReason:(id)a8;
- (TVSSMenuModeBannerContextTransitionObserver)transitionObserver;
- (id)debugDescription;
- (id)description;
- (int64_t)bannerPresentationState;
- (unint64_t)hash;
@end

@implementation TVSSMenuModeBannerContext

- (TVSSMenuModeBannerContext)init
{
  v4 = 0LL;
  v4 = -[TVSSMenuModeBannerContext initWithBannerPresentationState:](self, "initWithBannerPresentationState:", 0LL);
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (TVSSMenuModeBannerContext)initWithBannerPresentationState:(int64_t)a3
{
  v5 = 0LL;
  v5 = -[TVSSMenuModeBannerContext initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractiveMode:transitionObserver:dismissalReason:]( self,  "initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractiveMode: transitionObserver:dismissalReason:",  a3,  0LL,  0LL,  a3 == 0,  0LL);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  return v4;
}

- (TVSSMenuModeBannerContext)initWithBannerPresentationState:(int64_t)a3 transitioningBannerPresentable:(id)a4 shouldAnimateTransition:(BOOL)a5 supportsInteractiveMode:(BOOL)a6 transitionObserver:(id)a7 dismissalReason:(id)a8
{
  v33 = self;
  SEL v32 = a2;
  int64_t v31 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  BOOL v29 = a5;
  BOOL v28 = a6;
  id v27 = 0LL;
  objc_storeStrong(&v27, a7);
  id v26 = 0LL;
  objc_storeStrong(&v26, a8);
  v8 = v33;
  v33 = 0LL;
  v25.receiver = v8;
  v25.super_class = (Class)&OBJC_CLASS___TVSSMenuModeBannerContext;
  v33 = -[TVSSMenuModeBannerContext init](&v25, "init");
  objc_storeStrong((id *)&v33, v33);
  if (v33)
  {
    char v24 = 1;
    BOOL v15 = 1;
    if (v31 != 1) {
      BOOL v15 = v31 == 3;
    }
    BOOL v23 = v15;
    if (v15 && (!location || !v27))
    {
      char v24 = 0;
      os_log_t oslog = (os_log_t)MenuModeContributorLog();
      os_log_type_t type = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        log = oslog;
        os_log_type_t v13 = type;
        id v14 = TVSSMenuModeBannerPresentationStateDescription(v31);
        id v20 = v14;
        sub_1000F0588((uint64_t)v34, (uint64_t)v20, (uint64_t)location, (uint64_t)v27);
        _os_log_fault_impl( (void *)&_mh_execute_header,  log,  v13,  "Invalid banner context, transitioning presentation state requires a transitioning banner and observer. {presen tationState=%{public}@, banner=%p, transitionObserver=%p}",  v34,  0x20u);

        objc_storeStrong(&v20, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      int64_t v31 = 0LL;
      BOOL v23 = 0;
    }

    v33->_bannerPresentationState = v31;
    objc_storeStrong((id *)&v33->_transitioningBannerPresentable, location);
    BOOL v11 = 0;
    if (v29) {
      BOOL v11 = v23;
    }
    v33->_shouldAnimateTransition = v11;
    v33->_supportsInteractiveMode = v28;
    objc_storeWeak((id *)&v33->_transitionObserver, v27);
    objc_storeStrong((id *)&v33->_dismissalReason, v26);
  }

  v10 = v33;
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  return v10;
}

- (id)description
{
  return sub_1000F0618((uint64_t)self);
}

- (id)debugDescription
{
  return sub_1000F06B8((uint64_t)self, 0LL);
}

- (BOOL)isEqual:(id)a3
{
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSMenuModeBannerContext);
  id v52 = sub_1000F0BB8(v11, v3);
  id v53 = v52;
  v51 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  location[0],  objc_opt_class(v55));
  os_log_type_t v13 = v51;
  int64_t bannerPresentationState = v55->_bannerPresentationState;
  v45[1] = _NSConcreteStackBlock;
  int v46 = -1073741824;
  int v47 = 0;
  v48 = sub_1000F0C78;
  v49 = &unk_1001B7550;
  id v50 = v53;
  id v4 = -[BSEqualsBuilder appendInteger:counterpart:](v13, "appendInteger:counterpart:", bannerPresentationState);
  BOOL v15 = v51;
  transitioningBannerPresentable = v55->_transitioningBannerPresentable;
  v40[1] = _NSConcreteStackBlock;
  int v41 = -1073741824;
  int v42 = 0;
  v43 = sub_1000F0C9C;
  v44 = &unk_1001B60F8;
  v45[0] = v53;
  id v5 = -[BSEqualsBuilder appendObject:counterpart:](v15, "appendObject:counterpart:", transitioningBannerPresentable);
  v17 = v51;
  BOOL shouldAnimateTransition = v55->_shouldAnimateTransition;
  v35[1] = _NSConcreteStackBlock;
  int v36 = -1073741824;
  int v37 = 0;
  v38 = sub_1000F0CC0;
  v39 = &unk_1001B7A30;
  v40[0] = v53;
  id v6 = -[BSEqualsBuilder appendBool:counterpart:](v17, "appendBool:counterpart:", shouldAnimateTransition);
  v19 = v51;
  BOOL supportsInteractiveMode = v55->_supportsInteractiveMode;
  v30[1] = _NSConcreteStackBlock;
  int v31 = -1073741824;
  int v32 = 0;
  v33 = sub_1000F0CE8;
  v34 = &unk_1001B7A30;
  v35[0] = v53;
  id v7 = -[BSEqualsBuilder appendBool:counterpart:](v19, "appendBool:counterpart:", supportsInteractiveMode);
  id v20 = v51;
  id WeakRetained = objc_loadWeakRetained((id *)&v55->_transitionObserver);
  v25[1] = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  BOOL v28 = sub_1000F0D10;
  BOOL v29 = &unk_1001B60F8;
  v30[0] = v53;
  id v8 = -[BSEqualsBuilder appendObject:counterpart:](v20, "appendObject:counterpart:", WeakRetained);

  BOOL v23 = v51;
  dismissalReason = v55->_dismissalReason;
  v25[0] = v53;
  id v9 = -[BSEqualsBuilder appendObject:counterpart:](v23, "appendObject:counterpart:", dismissalReason);
  unsigned __int8 v24 = -[BSEqualsBuilder isEqual](v51, "isEqual");
  objc_storeStrong(v25, 0LL);
  objc_storeStrong(v30, 0LL);
  objc_storeStrong(v35, 0LL);
  objc_storeStrong(v40, 0LL);
  objc_storeStrong(v45, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong((id *)&v51, 0LL);
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(location, 0LL);
  return v24 & 1;
}

- (unint64_t)hash
{
  os_log_type_t v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(&OBJC_CLASS___BSHashBuilder);
  id v2 = [v12[0] appendInteger:v13->_bannerPresentationState];
  id v3 = [v12[0] appendObject:v13->_transitioningBannerPresentable];
  id v4 = [v12[0] appendBool:v13->_shouldAnimateTransition];
  id v5 = [v12[0] appendBool:v13->_supportsInteractiveMode];
  id v9 = v12[0];
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_transitionObserver);
  id v6 = objc_msgSend(v9, "appendObject:");

  id v7 = [v12[0] appendObject:v13->_dismissalReason];
  id v11 = [v12[0] hash];
  objc_storeStrong(v12, 0LL);
  return (unint64_t)v11;
}

- (int64_t)bannerPresentationState
{
  return self->_bannerPresentationState;
}

- (BOOL)shouldAnimateTransition
{
  return self->_shouldAnimateTransition;
}

- (BOOL)supportsInteractiveMode
{
  return self->_supportsInteractiveMode;
}

- (TVSSBannerPresentable)transitioningBannerPresentable
{
  return self->_transitioningBannerPresentable;
}

- (TVSSMenuModeBannerContextTransitionObserver)transitionObserver
{
  return (TVSSMenuModeBannerContextTransitionObserver *)objc_loadWeakRetained((id *)&self->_transitionObserver);
}

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (void).cxx_destruct
{
}

@end