@interface LaunchSyncResult
- (NSDateInterval)dateInterval;
- (NSError)error;
- (_TtC9appstored16LaunchSyncResult)init;
- (int64_t)updateCount;
@end

@implementation LaunchSyncResult

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)DateInterval._bridgeToObjectiveC()().super.isa;
}

- (int64_t)updateCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored16LaunchSyncResult_updateCount);
}

- (NSError)error
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored16LaunchSyncResult_error);
  if (v2)
  {
    swift_errorRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored16LaunchSyncResult_error), a2);
    v3 = (void *)_convertErrorToNSError(_:)(v2);
    swift_errorRelease(v2);
  }

  else
  {
    v3 = 0LL;
  }

  return (NSError *)v3;
}

- (_TtC9appstored16LaunchSyncResult)init
{
  result = (_TtC9appstored16LaunchSyncResult *)_swift_stdlib_reportUnimplementedInitializer( "appstored.LaunchSyncResult",  26LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9appstored16LaunchSyncResult_dateInterval;
  uint64_t v4 = type metadata accessor for DateInterval(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_errorRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored16LaunchSyncResult_error));
}

@end