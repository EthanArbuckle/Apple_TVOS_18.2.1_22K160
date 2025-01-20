@interface PBSystemOverlayDismissalTransaction
- (BOOL)_canBeInterrupted;
- (PBSystemOverlayContentPresenting)viewController;
- (PBSystemOverlayDismissalRequest)request;
- (PBSystemOverlayDismissalTransaction)init;
- (PBSystemOverlayDismissalTransaction)initWithPresentationDelegate:(id)a3 layoutLevel:(int64_t)a4;
- (PBSystemOverlayDismissalTransaction)initWithRequest:(id)a3 viewController:(id)a4 layoutLevel:(int64_t)a5 deactivationReasons:(unint64_t)a6 presentationDelegate:(id)a7;
- (PBSystemUIPresenting)presentationDelegate;
- (int64_t)layoutLevel;
- (unint64_t)sceneDeactivationReasons;
- (void)_begin;
@end

@implementation PBSystemOverlayDismissalTransaction

- (PBSystemOverlayDismissalTransaction)init
{
  return 0LL;
}

- (PBSystemOverlayDismissalTransaction)initWithRequest:(id)a3 viewController:(id)a4 layoutLevel:(int64_t)a5 deactivationReasons:(unint64_t)a6 presentationDelegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBSystemOverlayDismissalTransaction;
  v16 = -[PBSystemOverlayDismissalTransaction init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_request, a3);
    objc_storeStrong((id *)&v17->_viewController, a4);
    v17->_layoutLevel = a5;
    v17->_sceneDeactivationReasons = a6;
    objc_storeWeak((id *)&v17->_presentationDelegate, v15);
  }

  return v17;
}

- (PBSystemOverlayDismissalTransaction)initWithPresentationDelegate:(id)a3 layoutLevel:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBSystemOverlayDismissalTransaction;
  v7 = -[PBSystemOverlayDismissalTransaction init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_presentationDelegate, v6);
    v8->_layoutLevel = a4;
  }

  return v8;
}

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (void)_begin
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBSystemOverlayDismissalTransaction;
  -[PBSystemOverlayDismissalTransaction _begin](&v10, "_begin");
  -[PBSystemOverlayDismissalTransaction addMilestone:](self, "addMilestone:", @"DismissalAnimationComplete");
  BOOL v3 = -[PBSystemOverlayDismissalRequest isAnimated](self->_request, "isAnimated");
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  int64_t layoutLevel = self->_layoutLevel;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002013E0;
  v6[3] = &unk_1003D88F0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = v3;
  [WeakRetained dismissSystemUIAtLevel:layoutLevel animated:v3 transitionBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (PBSystemOverlayDismissalRequest)request
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

- (unint64_t)sceneDeactivationReasons
{
  return self->_sceneDeactivationReasons;
}

- (PBSystemUIPresenting)presentationDelegate
{
  return (PBSystemUIPresenting *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void).cxx_destruct
{
}

@end