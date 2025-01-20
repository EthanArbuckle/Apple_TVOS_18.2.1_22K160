@interface CrashEvent
- (BOOL)isBeta;
- (BOOL)isSystem;
- (NSDate)date;
- (NSString)appVersion;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)incidentID;
- (_TtC9appstored10CrashEvent)init;
@end

@implementation CrashEvent

- (NSString)appVersion
{
  return (NSString *)sub_10004D08C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9appstored10CrashEvent_appVersion);
}

- (NSString)bundleID
{
  uint64_t v2 = *(void *)&self->appVersion[OBJC_IVAR____TtC9appstored10CrashEvent_bundleID];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSString)bundleVersion
{
  return (NSString *)sub_10004D08C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9appstored10CrashEvent_bundleVersion);
}

- (NSDate)date
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

- (NSString)incidentID
{
  return (NSString *)sub_10004D08C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9appstored10CrashEvent_incidentID);
}

- (BOOL)isBeta
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9appstored10CrashEvent_isBeta);
}

- (BOOL)isSystem
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9appstored10CrashEvent_isSystem);
}

- (_TtC9appstored10CrashEvent)init
{
  result = (_TtC9appstored10CrashEvent *)_swift_stdlib_reportUnimplementedInitializer( "appstored.CrashEvent",  20LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC9appstored10CrashEvent_date;
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->appVersion[OBJC_IVAR____TtC9appstored10CrashEvent_incidentID]);
}

@end