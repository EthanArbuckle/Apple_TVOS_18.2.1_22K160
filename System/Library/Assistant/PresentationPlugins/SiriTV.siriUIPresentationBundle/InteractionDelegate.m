@interface InteractionDelegate
- (_TtC6SiriTV19InteractionDelegate)init;
- (void)containsComponentWithAction;
- (void)emitInstrumentationEvent:(id)a3;
- (void)emitInstrumentationEvent:(id)a3 viewId:(id)a4;
- (void)informHostOfViewResize:(CGSize)a3;
- (void)navigateWithAceCommand:(id)a3;
- (void)navigateWithResponseData:(id)a3;
- (void)performAceCommand:(id)a3;
- (void)performShowResponse:(id)a3;
@end

@implementation InteractionDelegate

- (void)performAceCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_498F0(v4);
}

- (void)performShowResponse:(id)a3
{
}

- (void)navigateWithResponseData:(id)a3
{
}

- (void)navigateWithAceCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_4A188(v4);
}

- (void)informHostOfViewResize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_4A31C((uint64_t)v5, width, height);
}

- (void)containsComponentWithAction
{
  v2 = self;
  sub_4A4D0((uint64_t)v2);
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_4A5B0(v4);
}

- (void)emitInstrumentationEvent:(id)a3 viewId:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  v12 = self;
  sub_4A688(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC6SiriTV19InteractionDelegate)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6SiriTV19InteractionDelegate_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_ADC4((uint64_t)self + OBJC_IVAR____TtC6SiriTV19InteractionDelegate_coordinator);
}

@end