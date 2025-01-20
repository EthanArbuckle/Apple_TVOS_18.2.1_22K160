@interface OverlayLayer
- (_TtC16AutomationModeUI12OverlayLayer)init;
- (_TtC16AutomationModeUI12OverlayLayer)initWithCoder:(id)a3;
- (_TtC16AutomationModeUI12OverlayLayer)initWithLayer:(id)a3;
- (void)dealloc;
- (void)layoutSublayers;
@end

@implementation OverlayLayer

- (_TtC16AutomationModeUI12OverlayLayer)init
{
  return (_TtC16AutomationModeUI12OverlayLayer *)sub_1000089B0();
}

- (_TtC16AutomationModeUI12OverlayLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000B840();
}

  ;
}

- (_TtC16AutomationModeUI12OverlayLayer)initWithLayer:(id)a3
{
  return (_TtC16AutomationModeUI12OverlayLayer *)sub_100008D00(v5);
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer);
  v4 = self;
  if (v3) {
    [v3 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OverlayLayer();
  -[OverlayLayer dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer));
}

- (void)layoutSublayers
{
  v2 = self;
  sub_100009E64();
}

@end