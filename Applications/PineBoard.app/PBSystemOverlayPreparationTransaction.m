@interface PBSystemOverlayPreparationTransaction
- (BOOL)_canBeInterrupted;
- (PBSystemOverlayPreparationTransaction)init;
- (PBSystemOverlayPreparationTransaction)initWithUIProvider:(id)a3;
- (PBSystemOverlayUIProvider)uiProvider;
- (UIViewController)viewController;
- (id)interruptionContext;
- (void)_begin;
- (void)_didComplete;
- (void)interruptWithContext:(id)a3;
@end

@implementation PBSystemOverlayPreparationTransaction

- (PBSystemOverlayPreparationTransaction)init
{
  return 0LL;
}

- (PBSystemOverlayPreparationTransaction)initWithUIProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBSystemOverlayPreparationTransaction;
  v6 = -[PBSystemOverlayPreparationTransaction init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uiProvider, a3);
  }

  return v7;
}

- (void)interruptWithContext:(id)a3
{
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBSystemOverlayPreparationTransaction;
  -[PBSystemOverlayPreparationTransaction _begin](&v13, "_begin");
  objc_initWeak(&location, self);
  v3 = objc_alloc(&OBJC_CLASS___BSWatchdog);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayPreparationTransaction queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000992D0;
  v10[3] = &unk_1003D1228;
  objc_copyWeak(&v11, &location);
  id v5 = -[BSWatchdog initWithTimeout:queue:completion:](v3, "initWithTimeout:queue:completion:", v4, v10, 5.0);
  watchdog = self->_watchdog;
  self->_watchdog = v5;

  -[BSWatchdog start](self->_watchdog, "start");
  -[PBSystemOverlayPreparationTransaction addMilestone:](self, "addMilestone:", @"fetchViewControllerMilestone");
  uiProvider = self->_uiProvider;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100099308;
  v8[3] = &unk_1003D4780;
  objc_copyWeak(&v9, &location);
  -[PBSystemOverlayUIProvider prepareUIForSystemOverlayPresentationWithCompletion:]( uiProvider,  "prepareUIForSystemOverlayPresentationWithCompletion:",  v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_didComplete
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSystemOverlayPreparationTransaction;
  -[PBSystemOverlayPreparationTransaction _didComplete](&v3, "_didComplete");
}

- (PBSystemOverlayUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (id)interruptionContext
{
  return self->_interruptionContext;
}

- (void).cxx_destruct
{
}

@end