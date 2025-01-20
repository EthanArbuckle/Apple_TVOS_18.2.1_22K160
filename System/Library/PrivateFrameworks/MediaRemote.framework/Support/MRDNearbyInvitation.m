@interface MRDNearbyInvitation
+ (void)createWithNearbyGroup:(_TtC12mediaremoted14MRDNearbyGroup *)a3 displayName:(NSString *)a4 routeType:(unsigned __int8)a5 completion:(id)a6;
- (NSData)invitationData;
- (NSString)description;
- (NSString)identifier;
- (_TtC12mediaremoted19MRDNearbyInvitation)init;
- (void)markAsUsed;
@end

@implementation MRDNearbyInvitation

- (NSData)invitationData
{
  v2 = self;
  uint64_t v3 = dispatch thunk of NearbyInvitation.invitationData.getter();
  unint64_t v5 = v4;

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1001608B8(v3, v5);
  return (NSData *)isa;
}

- (NSString)identifier
{
  return (NSString *)sub_100185490( self,  (uint64_t)a2,  (uint64_t)&OBJC_IVAR____TtC12mediaremoted19MRDNearbyInvitation_nearbyInvitation,  (uint64_t (*)(void))&NearbyInvitation.id.getter);
}

+ (void)createWithNearbyGroup:(_TtC12mediaremoted14MRDNearbyGroup *)a3 displayName:(NSString *)a4 routeType:(unsigned __int8)a5 completion:(id)a6
{
  uint64_t v11 = sub_100156B68(&qword_1003F86B0);
  __chkstk_darwin(v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject(&unk_1003A4478, 56LL, 7LL);
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(_BYTE *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = a1;
  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v13, 1LL, 1LL, v16);
  v17 = (void *)swift_allocObject(&unk_1003A44A0, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_1003F8E18;
  v17[5] = v15;
  v18 = (void *)swift_allocObject(&unk_1003A44C8, 48LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = &unk_1003F8E20;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  uint64_t v21 = sub_10016F5BC((uint64_t)v13, (uint64_t)&unk_1003F8E28, (uint64_t)v18);
  swift_release(v21);
}

- (NSString)description
{
  uint64_t ObjectType = swift_getObjectType(self, a2);
  unint64_t v4 = self;
  v5._countAndFlagsBits = _typeName(_:qualified:)(ObjectType, 0LL);
  object = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object);
  v7._countAndFlagsBits = 0x3D6469203ALL;
  v7._object = (void *)0xE500000000000000LL;
  String.append(_:)(v7);
  v9._countAndFlagsBits = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v4->super.isa) + 0x60))(v8);
  v10 = v9._object;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v10);
  v11._countAndFlagsBits = 62LL;
  v11._object = (void *)0xE100000000000000LL;
  String.append(_:)(v11);

  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE100000000000000LL);
  return (NSString *)v12;
}

- (void)markAsUsed
{
  v2 = self;
  sub_1001859F4();
}

- (_TtC12mediaremoted19MRDNearbyInvitation)init
{
  result = (_TtC12mediaremoted19MRDNearbyInvitation *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.MRDNearbyInvitation",  32LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremoted19MRDNearbyInvitation_nearbyInvitation));
}

@end