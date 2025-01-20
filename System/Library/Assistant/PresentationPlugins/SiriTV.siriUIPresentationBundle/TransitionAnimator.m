@interface TransitionAnimator
- (_TtC6SiriTV18TransitionAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TransitionAnimator

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  v5 = self;
  sub_97C78();
  swift_unknownObjectRelease(a3);
}

- (_TtC6SiriTV18TransitionAnimator)init
{
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6SiriTV18TransitionAnimator_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV18TransitionAnimator_timingParameters);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV18TransitionAnimator_opacityTimingParameters);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV18TransitionAnimator_shadowView);
  sub_3F84C((uint64_t)self + OBJC_IVAR____TtC6SiriTV18TransitionAnimator_animationContext, (uint64_t)v5);
  sub_99F24( v5,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_99F88);
}

@end