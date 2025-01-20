@interface ZoomAnimation
- (_TtC8AppStore13ZoomAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation ZoomAnimation

- (double)transitionDuration:(id)a3
{
  return 0.35;
}

- (void)animateTransition:(id)a3
{
  v5 = self;
  sub_1000EEF18(a3);
  swift_unknownObjectRelease(a3);
}

- (_TtC8AppStore13ZoomAnimation)init
{
  result = (_TtC8AppStore13ZoomAnimation *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.ZoomAnimation",  22LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end