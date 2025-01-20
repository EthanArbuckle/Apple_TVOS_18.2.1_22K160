@interface MRDNearbyGroup
+ (void)createWithCompletion:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)sessionSecret;
- (_TtC12mediaremoted14MRDNearbyGroup)init;
- (void)setSessionSecret:(id)a3;
@end

@implementation MRDNearbyGroup

- (NSString)identifier
{
  return (NSString *)sub_100185490( self,  (uint64_t)a2,  (uint64_t)&OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup_nearbyGroup,  (uint64_t (*)(void))&NearbyGroup.id.getter);
}

- (NSString)sessionSecret
{
  v2 = self;
  sub_100184C1C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setSessionSecret:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup____lazy_storage___sessionSecret);
  uint64_t v6 = *(void *)&self->nearbyGroup[OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup____lazy_storage___sessionSecret];
  uint64_t *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

+ (void)createWithCompletion:(id)a3
{
  uint64_t v5 = sub_100156B68(&qword_1003F86B0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1003A44F0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1003A4518, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1003F8E38;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1003A4540, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1003F8E40;
  v12[5] = v11;
  uint64_t v13 = sub_10016F5BC((uint64_t)v7, (uint64_t)&unk_1003F8E48, (uint64_t)v12);
  swift_release(v13);
}

- (NSString)description
{
  uint64_t ObjectType = swift_getObjectType(self, a2);
  uint64_t v4 = self;
  v5._countAndFlagsBits = _typeName(_:qualified:)(ObjectType, 0LL);
  object = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object);
  v7._countAndFlagsBits = 8250LL;
  v7._object = (void *)0xE200000000000000LL;
  String.append(_:)(v7);
  v9._countAndFlagsBits = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v4->super.isa) + 0x68))(v8);
  uint64_t v10 = v9._object;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v10);
  v11._countAndFlagsBits = 62LL;
  v11._object = (void *)0xE100000000000000LL;
  String.append(_:)(v11);

  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE100000000000000LL);
  return (NSString *)v12;
}

- (_TtC12mediaremoted14MRDNearbyGroup)init
{
  result = (_TtC12mediaremoted14MRDNearbyGroup *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.MRDNearbyGroup",  27LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup_autoApproveKey;
  uint64_t v4 = type metadata accessor for SymmetricKey(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->nearbyGroup[OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup____lazy_storage___sessionSecret]);
}

@end