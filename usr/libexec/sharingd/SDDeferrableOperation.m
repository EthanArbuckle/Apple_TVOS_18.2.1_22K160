@interface SDDeferrableOperation
- (BOOL)returnHasActiveTimer;
- (SDDeferrableOperation)init;
- (SDDeferrableOperation)initWithIdentifier:(id)a3 queue:(id)a4 operation:(id)a5;
- (id)returnPreventUntilDate;
- (void)addReason:(id)a3;
- (void)pushPreventionDateForReason:(id)a3 newDate:(id)a4;
- (void)removeReason:(id)a3;
- (void)scheduleOperation;
@end

@implementation SDDeferrableOperation

- (SDDeferrableOperation)initWithIdentifier:(id)a3 queue:(id)a4 operation:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject(&unk_1005D8E10, 24LL, 7LL);
  *(void *)(v11 + 16) = v7;
  id v12 = a4;
  v13 = (SDDeferrableOperation *)sub_1002C0ABC(v8, v10, v12, (uint64_t)sub_1002C0AB4, v11);

  swift_release(v11);
  return v13;
}

- (void)addReason:(id)a3
{
}

- (void)removeReason:(id)a3
{
}

- (void)pushPreventionDateForReason:(id)a3 newDate:(id)a4
{
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  sub_1002BC4E4(v11, v13, (uint64_t)v10);

  __n128 v15 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v15);
}

- (void)scheduleOperation
{
  v2 = self;
  sub_1002BD31C();
}

- (id)returnPreventUntilDate
{
  uint64_t v3 = sub_100183098(&qword_1006457E8);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v6 = (char *)self + OBJC_IVAR___SDDeferrableOperation_preventUntilDate;
  swift_beginAccess(v6, v12, 0LL, 0LL);
  sub_1001915A4((uint64_t)v6, (uint64_t)v5, &qword_1006457E8);
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1LL, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return isa;
}

- (BOOL)returnHasActiveTimer
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDDeferrableOperation_mainTimer) != 0LL;
}

- (SDDeferrableOperation)init
{
  result = (SDDeferrableOperation *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDDeferrableOperation",  38LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  *(void *)&double v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR___SDDeferrableOperation_timedReasons)).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa + OBJC_IVAR___SDDeferrableOperation_reasons), v3);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___SDDeferrableOperation_mainTimer));
}

@end