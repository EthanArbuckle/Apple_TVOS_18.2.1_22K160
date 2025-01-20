@interface GCSProfileUsageStats
- (BOOL)isActive;
- (NSSet)controllerIdentifiers;
- (NSSet)gameIdentifiers;
- (NSString)description;
- (_TtC24GameControllerTVSettings20GCSProfileUsageStats)init;
- (int64_t)controllersCount;
- (int64_t)gamesCount;
- (void)setControllerIdentifiers:(id)a3;
- (void)setGameIdentifiers:(id)a3;
@end

@implementation GCSProfileUsageStats

- (NSString)description
{
  v2 = self;
  sub_1CD60();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSSet)controllerIdentifiers
{
  return (NSSet *)sub_1CF38( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_controllerIdentifiers);
}

- (void)setControllerIdentifiers:(id)a3
{
}

- (NSSet)gameIdentifiers
{
  return (NSSet *)sub_1CF38( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_gameIdentifiers);
}

- (void)setGameIdentifiers:(id)a3
{
}

- (int64_t)controllersCount
{
  v2 = *(uint64_t (**)(void))((char *)&stru_20.nsects + (swift_isaMask & (uint64_t)self->super.isa));
  uint64_t v3 = self;
  uint64_t v4 = v2();
  int64_t v5 = *(void *)(v4 + 16);

  swift_bridgeObjectRelease(v4);
  return v5;
}

- (int64_t)gamesCount
{
  v2 = *(uint64_t (**)(void))&stru_68.segname[swift_isaMask & (uint64_t)self->super.isa];
  uint64_t v3 = self;
  uint64_t v4 = v2();
  int64_t v5 = *(void *)(v4 + 16);

  swift_bridgeObjectRelease(v4);
  return v5;
}

- (BOOL)isActive
{
  v2 = *(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & (uint64_t)self->super.isa));
  uint64_t v3 = self;
  if (v2() < 1)
  {
    uint64_t v5 = (*(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & (uint64_t)v3->super.isa)))();

    return v5 > 0;
  }

  else
  {

    return 1;
  }

- (_TtC24GameControllerTVSettings20GCSProfileUsageStats)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_controllerIdentifiers) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_gameIdentifiers) = (Class)&_swiftEmptySetSingleton;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GCSProfileUsageStats();
  return -[GCSProfileUsageStats init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_controllerIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_gameIdentifiers));
}

@end