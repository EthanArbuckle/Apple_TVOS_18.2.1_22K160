@interface FullScreenVideoTransitionManager
- (_TtC6Arcade32FullScreenVideoTransitionManager)init;
- (double)transitionDuration:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)animateTransition:(id)a3;
@end

@implementation FullScreenVideoTransitionManager

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return (id)sub_1000B4EA4((uint64_t)a3, (uint64_t)a4);
}

- (id)animationControllerForDismissedController:(id)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC6Arcade32FullScreenVideoTransitionManager_transitionDirection) = 0;
  return self;
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  v5 = self;
  sub_1000B3E4C((uint64_t)a3);
  swift_unknownObjectRelease(a3);
}

- (_TtC6Arcade32FullScreenVideoTransitionManager)init
{
  result = (_TtC6Arcade32FullScreenVideoTransitionManager *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.FullScreenVideoTransitionManager",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC6Arcade32FullScreenVideoTransitionManager_activeTransitionContext));
  sub_100015B48((uint64_t)self + OBJC_IVAR____TtC6Arcade32FullScreenVideoTransitionManager_delegate);
}

@end