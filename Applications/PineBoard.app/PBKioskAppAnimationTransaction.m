@interface PBKioskAppAnimationTransaction
- ($2A030BD80B7F288DDA25BD4C9E9B0355)context;
- (BOOL)_canBeInterrupted;
- (BSTransaction)animateTransaction;
- (BSWatchdog)watchdog;
- (PBKioskAppAnimationTransaction)initWithSceneLayoutViewController:(id)a3 fromViewController:(id)a4 toViewController:(id)a5 shouldPlaySound:(BOOL)a6 isLaunchingFromKiosk:(BOOL)a7;
- (void)_begin;
- (void)_didComplete;
- (void)_prepareAnimationInTransaction:(id)a3 completion:(id)a4;
- (void)_willAddChildTransaction:(id)a3;
@end

@implementation PBKioskAppAnimationTransaction

- (PBKioskAppAnimationTransaction)initWithSceneLayoutViewController:(id)a3 fromViewController:(id)a4 toViewController:(id)a5 shouldPlaySound:(BOOL)a6 isLaunchingFromKiosk:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBKioskAppAnimationTransaction;
  v16 = -[PBKioskAppAnimationTransaction init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_context.sceneLayoutViewController, a3);
    objc_storeStrong((id *)&v17->_context.fromViewController, a4);
    objc_storeStrong((id *)&v17->_context.toViewController, a5);
    v17->_context.shouldPlaySound = a6;
    v17->_context.isLaunchingFromKiosk = a7;
  }

  return v17;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBKioskAppAnimationTransaction;
  -[PBKioskAppAnimationTransaction _begin](&v11, "_begin");
  if (self->_context.fromViewController != self->_context.toViewController)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PBWaitForDefaultKioskSceneTransaction);
    -[PBKioskAppAnimationTransaction addChildTransaction:](self, "addChildTransaction:", v3);
    objc_initWeak(&location, self);
    id v4 = objc_alloc(&OBJC_CLASS___TVSBlockTransaction);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001CF478;
    v7[3] = &unk_1003D22F0;
    objc_copyWeak(&v9, &location);
    v5 = v3;
    v8 = v5;
    id v6 = [v4 initWithBlock:v7 failsForChildTransaction:&stru_1003DBF30];
    -[PBKioskAppAnimationTransaction addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v6,  1LL);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (void)_willAddChildTransaction:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBKioskAppAnimationTransaction;
  id v4 = a3;
  -[PBKioskAppAnimationTransaction _willAddChildTransaction:](&v9, "_willAddChildTransaction:", v4);
  uint64_t v6 = objc_opt_self(&OBJC_CLASS____PBKioskAppAnimateTransaction, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v7);

  if ((isKindOfClass & 1) == 0) {
    -[BSWatchdog invalidate](self->_watchdog, "invalidate", v9.receiver, v9.super_class);
  }
}

- (void)_didComplete
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBKioskAppAnimationTransaction error](self, "error"));
  unint64_t v4 = (unint64_t)[v3 code];

  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v6 = [[PBSFailKioskAnimationAction alloc] initWithInfo:0 responder:0];
    defaultKioskScene = self->_context.defaultKioskScene;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
    -[FBScene sendActions:](defaultKioskScene, "sendActions:", v8);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBKioskAppAnimationTransaction;
  -[PBKioskAppAnimationTransaction _didComplete](&v9, "_didComplete");
}

- (void)_prepareAnimationInTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  uint64_t v8 = 16LL;
  if (!self->_context.isLaunchingFromKiosk) {
    uint64_t v8 = 8LL;
  }
  id v9 = *(id *)((char *)&self->_context.sceneLayoutViewController + v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sceneHandle]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 clientProcessBundleIdentifier]);

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v12 = objc_alloc(&OBJC_CLASS____PBKioskAppAnimateTransaction);
    *(void *)&double v13 = sub_1001CFAE0((uint64_t)v44, (uint64_t)&self->_context).n128_u64[0];
    if (!v12)
    {
      sub_1001CFB40(v44);
      objc_super v19 = 0LL;
      goto LABEL_18;
    }

    id v14 = -[_PBKioskAppAnimateTransaction initWithAnimationContext:](v12, "initWithAnimationContext:", v44, v13);
LABEL_14:
    objc_super v19 = v14;
LABEL_18:
    [v6 addChildTransaction:v19];

    v7[2](v7);
    goto LABEL_21;
  }

  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    id v16 = sub_100083CA8();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "The kiosk app is not ready to animate, reverting to default animation",  (uint8_t *)buf,  2u);
    }

    sub_1001CFAE0((uint64_t)v34, (uint64_t)&self->_context);
    v18 = sub_1001CFC40(v34);
    id v14 = (_PBKioskAppAnimateTransaction *)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_14;
  }

  objc_initWeak(buf, self);
  v33 = -[PBSAnimationWatchdogProvider initWithTimeout:]( objc_alloc(&OBJC_CLASS___PBSAnimationWatchdogProvider),  "initWithTimeout:",  2.0);
  v20 = objc_alloc(&OBJC_CLASS___BSWatchdog);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBKioskAppAnimationTransaction queue](self, "queue"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1001CFB7C;
  v39[3] = &unk_1003D1838;
  objc_copyWeak(&v42, buf);
  id v22 = v6;
  id v40 = v22;
  v23 = v7;
  id v41 = v23;
  v24 = -[BSWatchdog initWithProvider:queue:completion:](v20, "initWithProvider:queue:completion:", v33, v21, v39);
  watchdog = self->_watchdog;
  self->_watchdog = v24;

  -[BSWatchdog start](self->_watchdog, "start");
  if (self->_context.isLaunchingFromKiosk)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](self->_context.toViewController, "view"));
    [v26 setAlpha:0.0];

    BOOL v27 = !self->_context.isLaunchingFromKiosk;
  }

  else
  {
    BOOL v27 = 1LL;
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1001CFCA8;
  v35[3] = &unk_1003D9A60;
  objc_copyWeak(&v38, buf);
  id v36 = v22;
  v37 = v23;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[BSActionResponder responderWithHandler:]( &OBJC_CLASS___BSActionResponder,  "responderWithHandler:",  v35));
  v29 = &_dispatch_main_q;
  [v28 setQueue:&_dispatch_main_q];

  id v30 = [[PBSPrepareKioskApplicationAnimationAction alloc] initWithAnimationDirection:v27 applicationBundleIdentifier:v11 responder:v28];
  defaultKioskScene = self->_context.defaultKioskScene;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v30));
  -[FBScene sendActions:](defaultKioskScene, "sendActions:", v32);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v42);

  objc_destroyWeak(buf);
LABEL_21:
}

- ($2A030BD80B7F288DDA25BD4C9E9B0355)context
{
  return result;
}

- (BSTransaction)animateTransaction
{
  return self->_animateTransaction;
}

- (BSWatchdog)watchdog
{
  return self->_watchdog;
}

- (void).cxx_destruct
{
}

@end