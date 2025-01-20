@interface JSScheduleDatabase
- (_TtC14amsengagementd18JSScheduleDatabase)init;
- (id)fetch:(id)a3;
- (id)fetchIdentifiersMatching:(id)a3;
- (id)fetchSchedules:(id)a3;
- (void)removeIdentifiers:(id)a3;
@end

@implementation JSScheduleDatabase

- (id)fetch:(id)a3
{
  v4 = self;
  sub_1000A81F0();
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }

  else
  {
    v7.super.isa = 0LL;
  }

  return v7.super.isa;
}

- (id)fetchSchedules:(id)a3
{
  v4 = self;
  sub_1000A84C4();

  swift_bridgeObjectRelease();
  sub_10000D33C(&qword_1001C8F18);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)fetchIdentifiersMatching:(id)a3
{
  v4 = self;
  sub_1000A873C();

  swift_bridgeObjectRelease();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)removeIdentifiers:(id)a3
{
  v4 = self;
  sub_1000A8974();

  swift_bridgeObjectRelease();
}

- (_TtC14amsengagementd18JSScheduleDatabase)init
{
}

- (void).cxx_destruct
{
}

@end