@interface TapActionGestureRecognizer
- (_TtC8AppStore26TapActionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)execute;
@end

@implementation TapActionGestureRecognizer

- (void)execute
{
  v2 = self;
  sub_100110788();
}

- (_TtC8AppStore26TapActionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    uint64_t v5 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7, v5);
    swift_unknownObjectRelease(a3);
  }

  result = (_TtC8AppStore26TapActionGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.TapActionGestureRecognizer",  35LL,  "init(target:action:)",  20LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore26TapActionGestureRecognizer_action));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore26TapActionGestureRecognizer_objectGraph));
}

@end