@interface TapActionGestureRecognizer
- (_TtC6Arcade26TapActionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)execute;
@end

@implementation TapActionGestureRecognizer

- (void)execute
{
  v2 = self;
  sub_10010AF68();
}

- (_TtC6Arcade26TapActionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    uint64_t v5 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7, v5);
    swift_unknownObjectRelease(a3);
  }

  result = (_TtC6Arcade26TapActionGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.TapActionGestureRecognizer",  33LL,  "init(target:action:)",  20LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade26TapActionGestureRecognizer_action));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade26TapActionGestureRecognizer_objectGraph));
}

@end