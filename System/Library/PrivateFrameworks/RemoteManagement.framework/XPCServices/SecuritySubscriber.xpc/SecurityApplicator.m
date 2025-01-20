@interface SecurityApplicator
+ (id)supportedConfigurationTypes;
- (_TtC18SecuritySubscriber18SecurityApplicator)init;
- (_TtC18SecuritySubscriber18SecurityApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
@end

@implementation SecurityApplicator

- (_TtC18SecuritySubscriber18SecurityApplicator)init
{
  id v3 = [objc_allocWithZone((Class)type metadata accessor for SecurityAdapter()) init];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SecurityApplicator();
  v4 = -[SecurityApplicator initWithAdapter:inPlaceUpdates:](&v6, "initWithAdapter:inPlaceUpdates:", v3, 1LL);

  return v4;
}

+ (id)supportedConfigurationTypes
{
  Swift::Int v2 = sub_100008A8C();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (_TtC18SecuritySubscriber18SecurityApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  result = (_TtC18SecuritySubscriber18SecurityApplicator *)_swift_stdlib_reportUnimplementedInitializer( "SecuritySubscriber.SecurityApplicator",  37LL,  "init(adapter:inPlaceUpdates:)",  29LL,  0LL);
  __break(1u);
  return result;
}

@end