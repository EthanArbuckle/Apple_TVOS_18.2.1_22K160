@interface NearbySessionsListener
+ (id)createForHomePodWithDelegate:(id)a3;
+ (id)createWithDelegate:(id)a3;
- (_TtC12mediaremoted22NearbySessionsListener)init;
@end

@implementation NearbySessionsListener

+ (id)createWithDelegate:(id)a3
{
  uint64_t v4 = sub_100156B68((uint64_t *)&unk_1003F84A0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  swift_unknownObjectRetain(a3);
  uint64_t v5 = NearbyInvitationScanner.init(provider:)(1LL);
  id v6 = objc_allocWithZone((Class)type metadata accessor for NearbySessionsListenerImplementation());
  swift_unknownObjectRetain(a3);
  id v7 = sub_100165418(v5, 0LL, (uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v7;
}

+ (id)createForHomePodWithDelegate:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for NearbyInvitationParameters(0LL, a2));
  swift_unknownObjectRetain(a3);
  uint64_t v5 = (void *)NearbyInvitationParameters.init(serviceName:browserType:route:)( 0x73655370756F7247LL,  0xEC0000006E6F6973LL,  2LL,  2LL);
  uint64_t v6 = sub_100156B68((uint64_t *)&unk_1003F84A0);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  id v7 = v5;
  uint64_t v8 = NearbyInvitationScanner.init(provider:configuration:)(1LL, v5);
  id v9 = objc_allocWithZone((Class)type metadata accessor for NearbySessionsListenerImplementation());
  swift_unknownObjectRetain(a3);
  id v10 = sub_100165418(v8, 1LL, (uint64_t)a3);
  swift_unknownObjectRelease(a3);

  return v10;
}

- (_TtC12mediaremoted22NearbySessionsListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NearbySessionsListener();
  return -[NearbySessionsListener init](&v3, "init");
}

@end