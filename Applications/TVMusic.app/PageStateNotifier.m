@interface PageStateNotifier
+ (_TtC7TVMusic17PageStateNotifier)shared;
- (_TtC7TVMusic17PageStateNotifier)init;
- (void)onPageLoadedForTab:(id)a3 handler:(id)a4;
@end

@implementation PageStateNotifier

+ (_TtC7TVMusic17PageStateNotifier)shared
{
  return (_TtC7TVMusic17PageStateNotifier *)sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B7228,  (id *)&qword_1002C5EF0,  (uint64_t)sub_100191690);
}

- (void)onPageLoadedForTab:(id)a3 handler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_1001949F4(v7, v9, (uint64_t)v10, (void (**)(void, __n128))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (_TtC7TVMusic17PageStateNotifier)init
{
  uint64_t v3 = OBJC_IVAR____TtC7TVMusic17PageStateNotifier_pageLoadHandlers;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100187774( (uint64_t)_swiftEmptyArrayStorage,  (uint64_t *)&unk_1002BB2D0,  sub_10013CF3C);
  uint64_t v5 = OBJC_IVAR____TtC7TVMusic17PageStateNotifier_pageStates;
  *(Class *)((char *)&v4->super.isa + v5) = (Class)sub_10018787C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v6 = OBJC_IVAR____TtC7TVMusic17PageStateNotifier_intentToTabMap;
  *(Class *)((char *)&v4->super.isa + v6) = (Class)sub_100187974((uint64_t)_swiftEmptyArrayStorage);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for PageStateNotifier();
  return -[PageStateNotifier init](&v8, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7TVMusic17PageStateNotifier_pageLoadHandlers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic17PageStateNotifier_pageStates));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7TVMusic17PageStateNotifier_intentToTabMap));
}

@end