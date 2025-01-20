@interface SidebarTransition
- (_TtC8FaceTime17SidebarTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation SidebarTransition

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  v5 = self;
  sub_1000B8410(a3);
  swift_unknownObjectRelease(a3);
}

- (_TtC8FaceTime17SidebarTransition)init
{
  result = (_TtC8FaceTime17SidebarTransition *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SidebarTransition",  26LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end