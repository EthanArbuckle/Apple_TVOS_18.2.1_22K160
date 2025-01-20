@interface TestFlightExtensionSyncActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored31TestFlightExtensionSyncActivity)init;
- (_TtC9appstored31TestFlightExtensionSyncActivity)initWithTestFlightServiceHost:(id)a3;
- (int64_t)deadline;
- (unint64_t)syncGracePeriodMinutes;
- (unint64_t)syncIntervalMinutes;
- (void)run;
- (void)setSyncGracePeriodMinutes:(unint64_t)a3;
- (void)setSyncIntervalMinutes:(unint64_t)a3;
@end

@implementation TestFlightExtensionSyncActivity

- (unint64_t)syncIntervalMinutes
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_syncIntervalMinutes);
}

- (void)setSyncIntervalMinutes:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_syncIntervalMinutes) = (Class)a3;
}

- (unint64_t)syncGracePeriodMinutes
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_syncGracePeriodMinutes);
}

- (void)setSyncGracePeriodMinutes:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_syncGracePeriodMinutes) = (Class)a3;
}

- (_TtC9appstored31TestFlightExtensionSyncActivity)initWithTestFlightServiceHost:(id)a3
{
  id v3 = a3;
  v5 = (_TtC9appstored31TestFlightExtensionSyncActivity *)sub_1000503E8(v3, v4);

  return v5;
}

- (int64_t)deadline
{
  return 0LL;
}

- (NSString)descriptiveName
{
  uint64_t v2 = *(void *)&self->syncIntervalMinutes[OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_descriptiveName];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)isEnabled
{
  return sub_100305A74(*(uint64_t *)((char *)&self->super.super.isa
                                  + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_serviceHost)) == 1;
}

- (void)run
{
  uint64_t v2 = self;
  sub_10004FE64();
}

- (_TtC9appstored31TestFlightExtensionSyncActivity)init
{
  result = (_TtC9appstored31TestFlightExtensionSyncActivity *)_swift_stdlib_reportUnimplementedInitializer( "appstored.TestFlightExtensionSyncActivity",  41LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_serviceHost));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_dispatchQueue));
  swift_bridgeObjectRelease(*(void *)&self->syncIntervalMinutes[OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_descriptiveName]);
}

@end