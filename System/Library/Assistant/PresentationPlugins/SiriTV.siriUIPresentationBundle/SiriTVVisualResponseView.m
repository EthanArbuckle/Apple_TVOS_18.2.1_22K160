@interface SiriTVVisualResponseView
- (NSArray)preferredFocusEnvironments;
- (_TtC6SiriTV24SiriTVVisualResponseView)initWithCoder:(id)a3;
- (_TtC6SiriTV24SiriTVVisualResponseView)initWithFrame:(CGRect)a3;
@end

@implementation SiriTVVisualResponseView

- (_TtC6SiriTV24SiriTVVisualResponseView)initWithFrame:(CGRect)a3
{
  return (_TtC6SiriTV24SiriTVVisualResponseView *)sub_BF44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6SiriTV24SiriTVVisualResponseView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_C070();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  uint64_t v3 = sub_C3F0();

  sub_9E24((uint64_t *)&unk_DFA00);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV24SiriTVVisualResponseView____lazy_storage___backdropBlurView));
}

@end