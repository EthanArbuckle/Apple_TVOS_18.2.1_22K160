@interface TVMLongPressGestureRecognizer
- (_TtC7TVMusic29TVMLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TVMLongPressGestureRecognizer

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_10016ABD4();
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_10016ACE4();
}

- (_TtC7TVMusic29TVMLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v7, 0, sizeof(v7));
  }

  return (_TtC7TVMusic29TVMLongPressGestureRecognizer *)sub_10016A9E4((uint64_t)v7, (uint64_t)a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusic29TVMLongPressGestureRecognizer_timer));
}

@end