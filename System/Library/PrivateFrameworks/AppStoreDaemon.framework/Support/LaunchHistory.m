@interface LaunchHistory
+ (_TtC9appstored13LaunchHistory)shared;
- (_TtC9appstored13LaunchHistory)init;
- (id)getBiomeLaunchesWithLogKey:(id)a3 dateInterval:(id)a4 latestLaunchOnly:(BOOL)a5;
- (id)getLaunchesWithLogKey:(id)a3 dateInterval:(id)a4;
- (id)syncIfNeededWithLogKey:(id)a3;
- (id)syncLaunchesWithLogKey:(id)a3;
- (void)clearLaunchHistoryWithBundleIDs:(id)a3;
@end

@implementation LaunchHistory

+ (_TtC9appstored13LaunchHistory)shared
{
  if (qword_100458050 != -1) {
    swift_once(&qword_100458050, sub_100030308);
  }
  return (_TtC9appstored13LaunchHistory *)(id)qword_1004628D8;
}

- (void)clearLaunchHistoryWithBundleIDs:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = self;
  sub_100030374(v4, v6);

  swift_bridgeObjectRelease(v4);
}

- (id)getLaunchesWithLogKey:(id)a3 dateInterval:(id)a4
{
  uint64_t v5 = type metadata accessor for DateInterval(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v10 = sub_100036370((uint64_t)v8, v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10001517C(0LL, &qword_100459E10, off_1003D9DE8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

- (id)syncIfNeededWithLogKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v7 = (void *)sub_10003117C(v4, v6);

  return v7;
}

- (id)syncLaunchesWithLogKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v7 = (void *)sub_100031A18(v4, v6);

  return v7;
}

- (id)getBiomeLaunchesWithLogKey:(id)a3 dateInterval:(id)a4 latestLaunchOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = type metadata accessor for DateInterval(0LL, a2);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v13 = a3;
  v14 = self;
  sub_1000331AC(v13, v12, v5);
  uint64_t v16 = v15;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_10001517C(0LL, &qword_100459E10, off_1003D9DE8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  return isa;
}

- (_TtC9appstored13LaunchHistory)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored13LaunchHistory_twentyEightDays) = (Class)0x4142750000000000LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored13LaunchHistory_fiveMinutes) = (Class)0x4072C00000000000LL;
  uint64_t v3 = OBJC_IVAR____TtC9appstored13LaunchHistory_lockedThing;
  uint64_t v4 = sub_1000079A0(&qword_1004591E8);
  uint64_t v5 = swift_allocObject(v4, 28LL, 7LL);
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = 0LL;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LaunchHistory();
  return -[LaunchHistory init](&v7, "init");
}

- (void).cxx_destruct
{
}

@end