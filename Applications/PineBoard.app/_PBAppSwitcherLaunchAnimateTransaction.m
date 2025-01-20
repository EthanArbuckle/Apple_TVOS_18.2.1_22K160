@interface _PBAppSwitcherLaunchAnimateTransaction
- ($D1BD78C04396328640866C86DE8AF7CF)context;
- (UIViewPropertyAnimator)propertyAnimator;
- (_PBAppSwitcherLaunchAnimateTransaction)initWithContext:(id *)a3;
- (void)_begin;
@end

@implementation _PBAppSwitcherLaunchAnimateTransaction

- (_PBAppSwitcherLaunchAnimateTransaction)initWithContext:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PBAppSwitcherLaunchAnimateTransaction;
  v4 = -[_PBAppSwitcherLaunchAnimateTransaction init](&v7, "init");
  v5 = v4;
  if (v4) {
    sub_100133880((id *)&v4->_context.sceneLayoutViewController, &a3->var0);
  }
  sub_100133728(&a3->var0);
  return v5;
}

- (void)_begin
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____PBAppSwitcherLaunchAnimateTransaction;
  -[_PBAppSwitcherLaunchAnimateTransaction _begin](&v15, "_begin");
  toViewController = self->_context.toViewController;
  if (self->_context.fromViewController != toViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](toViewController, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutViewController view](self->_context.sceneLayoutViewController, "view"));
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](self->_context.toViewController, "view"));
    [v6 setAutoresizingMask:18];

    objc_super v7 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.32,  0.14,  0.17,  1.0);
    v8 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v7,  0.2);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100133AD8;
    v12[3] = &unk_1003D0890;
    objc_copyWeak(&v13, &location);
    -[UIViewPropertyAnimator addAnimations:](v8, "addAnimations:", v12);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100133B2C;
    v10[3] = &unk_1003D8808;
    objc_copyWeak(&v11, &location);
    -[UIViewPropertyAnimator addCompletion:](v8, "addCompletion:", v10);
    -[_PBAppSwitcherLaunchAnimateTransaction addMilestone:]( self,  "addMilestone:",  @"PBAppSwitcherAppToAppAnimationChildMilestone");
    -[UIViewPropertyAnimator startAnimation](v8, "startAnimation");
    propertyAnimator = self->_propertyAnimator;
    self->_propertyAnimator = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

- ($D1BD78C04396328640866C86DE8AF7CF)context
{
  return ($D1BD78C04396328640866C86DE8AF7CF *)sub_1001336E4(retstr, (id *)&self->_context.sceneLayoutViewController);
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (void).cxx_destruct
{
}

@end