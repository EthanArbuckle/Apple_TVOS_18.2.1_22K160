@interface IDSDSessionKeyValueDelivery
+ (id)createWithDelegate:(id)a3 session:(id)a4 metricsCollector:(id)a5 pushTokensForCapabilityProvider:(id)a6;
- (NSSet)objcMaterials;
- (_TtC17identityservicesd27IDSDSessionKeyValueDelivery)init;
- (id)getAllKeyValueDeliveryLocalMaterialSetForGroupID:(id)a3;
- (void)addDeliveryHandler:(id)a3 uuid:(id)a4;
- (void)addMaterialProviderToSession:(id)a3;
- (void)dealloc;
- (void)receiveDictionaryData:(id)a3 forType:(int)a4 fromParticipant:(unint64_t)a5;
- (void)removeDeliveryHandler:(id)a3;
- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4;
- (void)sendData:(NSData *)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(NSString *)a6 withCompletion:(id)a7;
- (void)test_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5;
@end

@implementation IDSDSessionKeyValueDelivery

- (void)dealloc
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_state);
  v3 = self;
  swift_retain(v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 48));
  sub_1004125B0((void *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 48));
  swift_release(v2);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for IDSDSessionKeyValueDelivery(0LL);
  -[IDSDSessionKeyValueDelivery dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->groupID[OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_groupID]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_metricsCollector));
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_participantProvider);
  sub_10040A648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_identityProvider));
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_pushTokensForCapabilityProvider),  v5);
  sub_10040A648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_cryptoHandler));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_state));
}

- (void)addDeliveryHandler:(id)a3 uuid:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL, a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = *(void (**)(id, char *))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  swift_unknownObjectRetain(a3, v14);
  v15 = self;
  v13(a3, v12);
  swift_unknownObjectRelease(a3, v16);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
}

- (void)removeDeliveryHandler:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v7, v8);
  __n128 v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = *(void (**)(char *))((swift_isaMask & (uint64_t)self->super.isa) + 0xC0);
  v12 = self;
  v11(v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
}

- (id)getAllKeyValueDeliveryLocalMaterialSetForGroupID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v6 = v5;
  __n128 v7 = self;
  __n128 v8 = (void *)sub_1004138E0(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (NSSet)objcMaterials
{
  uint64_t v2 = self;
  id v3 = IDSDSessionKeyValueDelivery.objcMaterials.getter();

  return (NSSet *)v3;
}

- (void)receiveDictionaryData:(id)a3 forType:(int)a4 fromParticipant:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Swift.AnyObject + 8,  &protocol witness table for String);
  uint64_t v9 = self;
  IDSDSessionKeyValueDelivery.receive(dictionaryData:forType:fromParticipant:)(v8, v6, a5);

  swift_bridgeObjectRelease(v8);
}

- (void)test_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  uint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))((swift_isaMask & (uint64_t)v13->super.isa)
                                                                               + 0x110))( v10,  v12,  v6,  a5);
  sub_100402A84(v10, v12);
}

- (void)sendData:(NSData *)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(NSString *)a6 withCompletion:(id)a7
{
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = _Block_copy(a7);
  uint64_t v18 = swift_allocObject(&unk_100905670, 56LL, 7LL);
  *(void *)(v18 + 16) = a3;
  *(_DWORD *)(v18 + 24) = a4;
  *(_DWORD *)(v18 + 28) = a5;
  *(void *)(v18 + 32) = a6;
  *(void *)(v18 + 40) = v17;
  *(void *)(v18 + 48) = self;
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v16, 1LL, 1LL, v19);
  v20 = (void *)swift_allocObject(&unk_100905698, 48LL, 7LL);
  v20[2] = 0LL;
  v20[3] = 0LL;
  v20[4] = &unk_1009B9710;
  v20[5] = v18;
  v21 = (void *)swift_allocObject(&unk_1009056C0, 48LL, 7LL);
  v21[2] = 0LL;
  v21[3] = 0LL;
  v21[4] = &unk_1009B9720;
  v21[5] = v20;
  v22 = a3;
  v23 = a6;
  v24 = self;
  uint64_t v25 = sub_100417998((uint64_t)v16, (uint64_t)&unk_1009B9730, (uint64_t)v21);
  swift_release(v25);
}

- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = *(os_unfair_lock_s **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_state);
  uint64_t v7 = (uint64_t)&v6[4];
  uint64_t v8 = v6 + 12;
  unint64_t v11 = self;
  os_unfair_lock_lock(v8);
  sub_10041732C(v7, (uint64_t *)&v12);
  os_unfair_lock_unlock(v8);
  id v9 = v12;
  if (v12)
  {
    [v12 requestKeyValueDeliveryDataForKey:v5 participantID:a4];

    swift_unknownObjectRelease(v9, v10);
  }

  else
  {
  }

+ (id)createWithDelegate:(id)a3 session:(id)a4 metricsCollector:(id)a5 pushTokensForCapabilityProvider:(id)a6
{
  uint64_t v10 = *(void *)((char *)a4
                  + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_groupID
                  + 8);
  uint64_t v25 = *(void *)((char *)a4 + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_groupID);
  unint64_t v11 = *(uint64_t (**)(__n128))((swift_isaMask & *(void *)a4) + 0x108LL);
  swift_unknownObjectRetain_n(a3, 2LL);
  id v12 = a5;
  __n128 v13 = (char *)a4;
  swift_unknownObjectRetain(a6, v14);
  __n128 v15 = swift_bridgeObjectRetain(v10);
  uint64_t v16 = v11(v15);
  uint64_t v18 = v17;
  uint64_t v19 = *(void **)&v13[OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_identityController];
  sub_100401ACC( (uint64_t)&v13[OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_cryptoHandler],  (uint64_t)v26);
  id v20 = objc_allocWithZone((Class)type metadata accessor for IDSDSessionKeyValueDelivery(0LL));
  id v21 = sub_10041C448((uint64_t)a3, v25, v10, v12, v16, v18, (uint64_t)v19, (uint64_t)a6, v26, v20);
  swift_unknownObjectRelease(a6, v22);

  swift_unknownObjectRelease_n(a3, 2LL);
  swift_unknownObjectRelease(v16, v23);
  return v21;
}

- (void)addMaterialProviderToSession:(id)a3
{
  uint64_t v4 = *(uint64_t (**)(_BYTE *))((*(void *)a3 & swift_isaMask) + 0x130LL);
  uint64_t v5 = self;
  id v6 = a3;
  uint64_t v7 = (void (*)(_BYTE *, void))v4(v15);
  id v9 = v8;
  uint64_t v10 = (void *)*v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v8);
  *id v9 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v10 = sub_100417B94(0LL, v10[2] + 1LL, 1, v10);
    *id v9 = v10;
  }

  unint64_t v13 = v10[2];
  unint64_t v12 = v10[3];
  if (v13 >= v12 >> 1)
  {
    uint64_t v10 = sub_100417B94((void *)(v12 > 1), v13 + 1, 1, v10);
    *id v9 = v10;
  }

  v10[2] = v13 + 1;
  uint64_t v14 = &v10[2 * v13];
  v14[4] = v5;
  v14[5] = &off_100905568;
  v7(v15, 0LL);
}

- (_TtC17identityservicesd27IDSDSessionKeyValueDelivery)init
{
  result = (_TtC17identityservicesd27IDSDSessionKeyValueDelivery *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSDSessionKeyValueDelivery",  45LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end