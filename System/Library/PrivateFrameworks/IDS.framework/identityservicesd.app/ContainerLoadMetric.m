@interface ContainerLoadMetric
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (_TtC17identityservicesdP33_534A9A00092BF767A56A700BAD85BE0F19ContainerLoadMetric)init;
@end

@implementation ContainerLoadMetric

- (NSDictionary)dictionaryRepresentation
{
  v2 = self;
  unint64_t v3 = sub_10050388C();

  sub_1003F5CB4(&qword_1009BB088);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (NSString)name
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC17identityservicesdP33_534A9A00092BF767A56A700BAD85BE0F19ContainerLoadMetric)init
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC17identityservicesdP33_534A9A00092BF767A56A700BAD85BE0F19ContainerLoadMetric_containerType) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContainerLoadMetric();
  return -[ContainerLoadMetric init](&v3, "init");
}

@end