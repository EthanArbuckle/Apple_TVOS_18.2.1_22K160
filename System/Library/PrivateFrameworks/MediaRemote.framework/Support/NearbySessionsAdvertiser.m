@interface NearbySessionsAdvertiser
+ (id)createWithDelegate:(id)a3;
- (_TtC12mediaremoted24NearbySessionsAdvertiser)init;
@end

@implementation NearbySessionsAdvertiser

+ (id)createWithDelegate:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for NearbySessionsAdvertiserImplementation());
  uint64_t v5 = swift_unknownObjectRetain_n(a3, 2LL);
  id v7 = sub_100228540(v5, v6);
  swift_unknownObjectRelease(a3);
  return v7;
}

- (_TtC12mediaremoted24NearbySessionsAdvertiser)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NearbySessionsAdvertiser();
  return -[NearbySessionsAdvertiser init](&v3, "init");
}

@end