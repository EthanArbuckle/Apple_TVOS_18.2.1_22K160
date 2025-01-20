@interface Migration
- (NSArray)uuids;
- (NSDate)date;
- (_TtC8Podcasts9Migration)init;
@end

@implementation Migration

- (NSDate)date
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

- (NSArray)uuids
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts9Migration_uuids);
  swift_bridgeObjectRetain(v2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (_TtC8Podcasts9Migration)init
{
  result = (_TtC8Podcasts9Migration *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.Migration",  18LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts9Migration_date;
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts9Migration_uuids));
}

@end