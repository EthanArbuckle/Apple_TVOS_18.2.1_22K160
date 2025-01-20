@interface ZoomTransitioningDelegate
- (_TtC8AppStore25ZoomTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
@end

@implementation ZoomTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  v9 = (objc_class *)type metadata accessor for ZoomAnimation();
  v10 = objc_allocWithZone(v9);
  v10[OBJC_IVAR____TtC8AppStore13ZoomAnimation_direction] = 0;
  v17.receiver = v10;
  v17.super_class = v9;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  v15 = -[ZoomTransitioningDelegate init](&v17, "init");

  return v15;
}

- (id)animationControllerForDismissedController:(id)a3
{
  v5 = (objc_class *)type metadata accessor for ZoomAnimation();
  v6 = objc_allocWithZone(v5);
  v6[OBJC_IVAR____TtC8AppStore13ZoomAnimation_direction] = 1;
  v11.receiver = v6;
  v11.super_class = v5;
  id v7 = a3;
  v8 = self;
  v9 = -[ZoomTransitioningDelegate init](&v11, "init");

  return v9;
}

- (_TtC8AppStore25ZoomTransitioningDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ZoomTransitioningDelegate();
  return -[ZoomTransitioningDelegate init](&v3, "init");
}

@end