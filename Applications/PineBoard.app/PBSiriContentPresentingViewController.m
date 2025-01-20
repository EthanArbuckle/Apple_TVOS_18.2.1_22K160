@interface PBSiriContentPresentingViewController
- (BOOL)acceptsEventFocus;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (PBSiriContentPresentingViewController)initWithSiriViewController:(id)a3;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (SiriPresentationPineBoardMainScreenViewController)assistantViewController;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
@end

@implementation PBSiriContentPresentingViewController

- (PBSiriContentPresentingViewController)initWithSiriViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBSiriContentPresentingViewController;
  v6 = -[PBSiriContentPresentingViewController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assistantViewController, a3);
  }

  return v7;
}

- (BOOL)expectsEventForwarding
{
  return 1;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  id v8 = -[PBSiriContentPresentingViewController view](self, "view");
  -[SiriPresentationPineBoardMainScreenViewController beginAppearanceTransition:animated:]( self->_assistantViewController,  "beginAppearanceTransition:animated:",  1LL,  v5);
  -[PBSiriContentPresentingViewController addChildViewController:]( self,  "addChildViewController:",  self->_assistantViewController);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriPresentationPineBoardMainScreenViewController view](self->_assistantViewController, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriContentPresentingViewController view](self, "view"));
  [v10 bounds];
  objc_msgSend(v9, "setFrame:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriContentPresentingViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SiriPresentationPineBoardMainScreenViewController view](self->_assistantViewController, "view"));
  [v11 addSubview:v12];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100070534;
  v21[3] = &unk_1003D0070;
  v21[4] = self;
  id v22 = v7;
  id v13 = v7;
  v14 = objc_retainBlock(v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[BSUIAnimationFactory factoryWithDuration:]( &OBJC_CLASS___BSUIAnimationFactory,  "factoryWithDuration:",  0.3));
  v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  assistantViewController = self->_assistantViewController;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007058C;
  v19[3] = &unk_1003CFEE0;
  v20 = v16;
  v18 = v16;
  -[SiriPresentationPineBoardMainScreenViewController animatedAppearanceWithFactory:completion:]( assistantViewController,  "animatedAppearanceWithFactory:completion:",  v15,  v19);
  dispatch_group_notify(v18, &_dispatch_main_q, v14);
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  id v8 = -[PBSiriContentPresentingViewController view](self, "view");
  -[PBSiriContentPresentingViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 0LL);
  -[SiriPresentationPineBoardMainScreenViewController beginAppearanceTransition:animated:]( self->_assistantViewController,  "beginAppearanceTransition:animated:",  0LL,  v5);
  -[SiriPresentationPineBoardMainScreenViewController willMoveToParentViewController:]( self->_assistantViewController,  "willMoveToParentViewController:",  0LL);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100070710;
  v17[3] = &unk_1003D0070;
  v17[4] = self;
  id v18 = v7;
  id v9 = v7;
  v10 = objc_retainBlock(v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[BSUIAnimationFactory factoryWithDuration:]( &OBJC_CLASS___BSUIAnimationFactory,  "factoryWithDuration:",  0.3));
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  assistantViewController = self->_assistantViewController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100070780;
  v15[3] = &unk_1003CFEE0;
  v16 = v12;
  v14 = v12;
  -[SiriPresentationPineBoardMainScreenViewController animatedDisappearanceWithFactory:completion:]( assistantViewController,  "animatedDisappearanceWithFactory:completion:",  v11,  v15);
  dispatch_group_notify(v14, &_dispatch_main_q, v10);
}

- (PBSystemOverlayContentDelegate)contentDelegate
{
  return (PBSystemOverlayContentDelegate *)objc_loadWeakRetained((id *)&self->_contentDelegate);
}

- (void)setContentDelegate:(id)a3
{
}

- (BOOL)acceptsEventFocus
{
  return self->_acceptsEventFocus;
}

- (void)setAcceptsEventFocus:(BOOL)a3
{
  self->_acceptsEventFocus = a3;
}

- (SiriPresentationPineBoardMainScreenViewController)assistantViewController
{
  return self->_assistantViewController;
}

- (void).cxx_destruct
{
}

@end