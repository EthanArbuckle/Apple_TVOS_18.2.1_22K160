@interface ReportTime
- (NSDate)lastReport;
- (_TtC13transparencyd10ReportTime)init;
- (double)timeBetweenReports;
- (void)setLastReport:(id)a3;
- (void)setTimeBetweenReports:(double)a3;
@end

@implementation ReportTime

- (NSDate)lastReport
{
  uint64_t v3 = sub_100072CC4((uint64_t *)&unk_1002DF740);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_lastReport;
  swift_beginAccess(v6, v12, 0LL, 0LL);
  sub_100085DFC((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1LL, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

- (void)setLastReport:(id)a3
{
  uint64_t v5 = sub_100072CC4((uint64_t *)&unk_1002DF740);
  __chkstk_darwin(v5);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = type metadata accessor for Date(0LL);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 0LL, 1LL, v8);
  }

  else
  {
    uint64_t v9 = type metadata accessor for Date(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v7, 1LL, 1LL, v9);
  }

  v10 = (char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_lastReport;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_lastReport, v13, 33LL, 0LL);
  v11 = self;
  sub_1000A99C4((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);
}

- (double)timeBetweenReports
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_timeBetweenReports);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_timeBetweenReports, v4, 0LL, 0LL);
  return *v2;
}

- (void)setTimeBetweenReports:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_timeBetweenReports);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_timeBetweenReports, v5, 1LL, 0LL);
  *uint64_t v4 = a3;
}

- (_TtC13transparencyd10ReportTime)init
{
  result = (_TtC13transparencyd10ReportTime *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.ReportTime",  24LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end