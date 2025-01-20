@interface PBSystemOverlayPresentationTransaction
- (BOOL)_canBeInterrupted;
- (PBSystemOverlayContentPresenting)viewController;
- (PBSystemOverlayPresentationRequest)request;
- (PBSystemOverlayPresentationTransaction)init;
- (PBSystemOverlayPresentationTransaction)initWithRequest:(id)a3 viewController:(id)a4 layoutLevel:(int64_t)a5 presentationDelegate:(id)a6;
- (PBSystemUIPresenting)presentationDelegate;
- (id)interruptionContext;
- (int64_t)layoutLevel;
- (void)_begin;
- (void)interruptWithContext:(id)a3;
@end

@implementation PBSystemOverlayPresentationTransaction

- (PBSystemOverlayPresentationTransaction)init
{
  return 0LL;
}

- (PBSystemOverlayPresentationTransaction)initWithRequest:(id)a3 viewController:(id)a4 layoutLevel:(int64_t)a5 presentationDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBSystemOverlayPresentationTransaction;
  v14 = -[PBSystemOverlayPresentationTransaction init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_layoutLevel = a5;
    objc_storeStrong((id *)&v14->_request, a3);
    objc_storeStrong((id *)&v15->_viewController, a4);
    objc_storeWeak((id *)&v15->_presentationDelegate, v13);
  }

  return v15;
}

- (BOOL)_canBeInterrupted
{
  return -[PBSystemOverlayContentPresenting isInterruptible](self->_viewController, "isInterruptible");
}

- (void)interruptWithContext:(id)a3
{
}

- (void)_begin
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBSystemOverlayPresentationTransaction;
  -[PBSystemOverlayPresentationTransaction _begin](&v12, "_begin");
  -[PBSystemOverlayPresentationTransaction addMilestone:](self, "addMilestone:", @"PresentationAnimationComplete");
  BOOL v3 = -[PBSystemOverlayPresentationRequest isAnimated](self->_request, "isAnimated");
  v4 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayContext);
  -[PBMutableSystemOverlayContext setLayoutLevel:](v4, "setLayoutLevel:", self->_layoutLevel);
  -[PBMutableSystemOverlayContext setSceneDeactivationReasons:]( v4,  "setSceneDeactivationReasons:",  -[PBSystemOverlayPresentationRequest sceneDeactivationReasons](self->_request, "sceneDeactivationReasons"));
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  viewController = self->_viewController;
  id v7 = -[PBMutableSystemOverlayContext copy](v4, "copy");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10012D338;
  v8[3] = &unk_1003D88F0;
  objc_copyWeak(&v9, &location);
  BOOL v10 = v3;
  [WeakRetained presentSystemUI:viewController withContext:v7 animated:v3 transitionBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (PBSystemOverlayPresentationRequest)request
{
  return self->_request;
}

- (PBSystemOverlayContentPresenting)viewController
{
  return self->_viewController;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (PBSystemUIPresenting)presentationDelegate
{
  return (PBSystemUIPresenting *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (id)interruptionContext
{
  return self->_interruptionContext;
}

- (void).cxx_destruct
{
}

@end