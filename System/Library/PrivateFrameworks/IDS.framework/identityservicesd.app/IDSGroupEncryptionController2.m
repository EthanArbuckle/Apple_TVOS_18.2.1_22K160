@interface IDSGroupEncryptionController2
- (IDSPushToken)pushToken;
- (IDSRealTimeEncryptionIdentity)objcIdentity;
- (IDSRealTimeEncryptionIdentity)objcPreviousIdentity;
- (IDSRealTimeEncryptionIdentity)objcPreviousPublicIdentity;
- (IDSRealTimeEncryptionIdentity)objcPublicIdentity;
- (NSData)previousPublicIdentityData;
- (NSData)publicIdentityData;
- (NSDictionary)publicKeys;
- (_TtC17identityservicesd29IDSGroupEncryptionController2)init;
- (_TtC17identityservicesd29IDSGroupEncryptionController2)initWithDelegate:(id)a3 config:(id)a4 sessionProvider:(id)a5 identityController:(id)a6 pushHandler:(id)a7;
- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)identityController;
- (_TtP17identityservicesd19IDSDSessionProvider_)sessionProvider;
- (_TtP17identityservicesd27IDSGroupPushHandlerProtocol_)pushHandler;
- (__SecKey)fullIdentityKey;
- (__SecKey)previousFullIdentityKey;
- (__SecKey)previousPublicIdentityKey;
- (__SecKey)publicIdentityKey;
- (id)groupForID:(id)a3;
- (id)objcPublicIdentityForPushToken:(id)a3;
- (int64_t)publicIdentityWrapMode;
- (void)cleanUpGroupForID:(id)a3 after:(double)a4;
- (void)receivePublicIdentity:(id)a3;
- (void)receivePublicKey:(id)a3 forPushToken:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9;
@end

@implementation IDSGroupEncryptionController2

- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)identityController
{
  return (_TtC17identityservicesd36IDSGroupEncryptionIdentityController *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController);
}

- (_TtP17identityservicesd19IDSDSessionProvider_)sessionProvider
{
  return (_TtP17identityservicesd19IDSDSessionProvider_ *)(id)swift_unknownObjectRetain( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_sessionProvider),  a2);
}

- (_TtP17identityservicesd27IDSGroupPushHandlerProtocol_)pushHandler
{
  return (_TtP17identityservicesd27IDSGroupPushHandlerProtocol_ *)(id)swift_unknownObjectRetain( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_pushHandler),  a2);
}

- (IDSPushToken)pushToken
{
  v2 = self;
  id v3 = sub_100496890();

  return (IDSPushToken *)v3;
}

- (int64_t)publicIdentityWrapMode
{
  v2 = self;
  int64_t v3 = sub_100496A00();

  return v3;
}

- (__SecKey)fullIdentityKey
{
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = *(void (**)(void))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController))
                        + 0x130LL);
  v8 = self;
  v7();
  uint64_t v9 = type metadata accessor for IDSGroupEncryptionFullIdentity(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48LL))(v6, 1LL, v9) == 1)
  {
    sub_10040A274((uint64_t)v6, &qword_1009B95A0);
    id v10 = 0LL;
  }

  else
  {
    id v10 = *(id *)&v6[*(int *)(v9 + 20)];
    sub_1003F6050((uint64_t)v6, type metadata accessor for IDSGroupEncryptionFullIdentity);
  }

  return (__SecKey *)v10;
}

- (__SecKey)publicIdentityKey
{
  v2 = self;
  id v3 = sub_100496D5C();

  return (__SecKey *)v3;
}

- (NSData)publicIdentityData
{
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1003F5CB4(&qword_1009B95A0);
  __chkstk_darwin(v7, v8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = *(void (**)(void))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                        + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController))
                         + 0x130LL);
  uint64_t v12 = self;
  v11();
  uint64_t v13 = type metadata accessor for IDSGroupEncryptionFullIdentity(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48LL))(v10, 1LL, v13) == 1)
  {
    sub_10040A274((uint64_t)v10, &qword_1009B95A0);

    return (NSData *)0LL;
  }

  else
  {
    sub_1003F5FC8((uint64_t)v10, (uint64_t)v6, type metadata accessor for IDSGroupEncryptionPublicIdentity);
    sub_1003F6050((uint64_t)v10, type metadata accessor for IDSGroupEncryptionFullIdentity);
    CFDataRef v15 = sub_1004D3220();
    unint64_t v17 = v16;
    sub_1003F6050((uint64_t)v6, type metadata accessor for IDSGroupEncryptionPublicIdentity);

    if (v17 >> 60 == 15)
    {
      return (NSData *)0LL;
    }

    else
    {
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_10040AD00((uint64_t)v15, v17);
      return (NSData *)isa;
    }
  }

- (__SecKey)previousFullIdentityKey
{
  v2 = self;
  id v3 = sub_1004971B0();

  return (__SecKey *)v3;
}

- (__SecKey)previousPublicIdentityKey
{
  v2 = self;
  id v3 = sub_100497320();

  return (__SecKey *)v3;
}

- (NSData)previousPublicIdentityData
{
  v2 = self;
  CFDataRef v3 = sub_100497534();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10040AD00((uint64_t)v3, v5);
  }

  return (NSData *)isa;
}

- (NSDictionary)publicKeys
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_publicIdentitiesLock);
  CFDataRef v3 = self;
  swift_retain(v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_100497804((uint64_t *)(v2 + 16), &v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  uint64_t v4 = v7;

  swift_release(v2);
  sub_10041D3C4(0LL, (unint64_t *)&qword_1009BBE30, &OBJC_CLASS___IDSPushToken_ptr);
  sub_100496170();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSDictionary *)isa;
}

- (_TtC17identityservicesd29IDSGroupEncryptionController2)initWithDelegate:(id)a3 config:(id)a4 sessionProvider:(id)a5 identityController:(id)a6 pushHandler:(id)a7
{
  id v12 = a4;
  swift_unknownObjectRetain(a5, v13);
  id v14 = a6;
  swift_unknownObjectRetain(a7, v15);
  unint64_t v16 = (_TtC17identityservicesd29IDSGroupEncryptionController2 *)sub_10049D2B0( (uint64_t)a3,  v12,  (uint64_t)a5,  v14,  (uint64_t)a7);
  swift_unknownObjectRelease(a3, v17);

  swift_unknownObjectRelease(a5, v18);
  swift_unknownObjectRelease(a7, v19);
  return v16;
}

- (id)groupForID:(id)a3
{
  uint64_t v5 = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_groupsLock);
  uint64_t v7 = self;
  swift_retain(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 32));
  sub_10049E2D8((void *)(v6 + 16), &v10);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 32));
  __n128 v8 = v10;

  swift_bridgeObjectRelease(v5);
  swift_release(v6);
  return v8;
}

- (void)receivePublicIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004984D8(v4);
}

- (void)receivePublicKey:(id)a3 forPushToken:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9
{
  uint64_t v35 = a9;
  uint64_t v16 = type metadata accessor for Date(0LL);
  uint64_t v36 = *(void *)(v16 - 8);
  uint64_t v37 = v16;
  __chkstk_darwin(v17, v18);
  v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v21 = a3;
  id v34 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a8;
  v26 = self;
  uint64_t v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v29 = v28;

  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  uint64_t v32 = v31;

  static Date._unconditionallyBridgeFromObjectiveC(_:)(v25);
  v33 = v34;
  sub_10049D9BC(v27, v29, v34, v22, v30, v32, (uint64_t)v20, v35);
  swift_bridgeObjectRelease(v32);
  sub_100402A84(v27, v29);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v20, v37);
}

- (id)objcPublicIdentityForPushToken:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_publicIdentitiesLock);
  id v5 = a3;
  uint64_t v6 = self;
  swift_retain(v4);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 24));
  sub_10049E2D0((uint64_t *)(v4 + 16), &v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 24));
  uint64_t v7 = v9;

  swift_release(v4);
  return v7;
}

- (void)cleanUpGroupForID:(id)a3 after:(double)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;
  uint64_t v9 = self;
  sub_1004999E4(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
}

- (IDSRealTimeEncryptionIdentity)objcPublicIdentity
{
  uint64_t v2 = self;
  id v3 = sub_10049A004();

  return (IDSRealTimeEncryptionIdentity *)v3;
}

- (IDSRealTimeEncryptionIdentity)objcPreviousPublicIdentity
{
  uint64_t v2 = self;
  id v3 = sub_10049A174();

  return (IDSRealTimeEncryptionIdentity *)v3;
}

- (IDSRealTimeEncryptionIdentity)objcIdentity
{
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v7 = *(void (**)(void))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController))
                        + 0x130LL);
  unint64_t v8 = self;
  v7();
  uint64_t v9 = type metadata accessor for IDSGroupEncryptionFullIdentity(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48LL))(v6, 1LL, v9) == 1)
  {
    sub_10040A274((uint64_t)v6, &qword_1009B95A0);
    id v10 = 0LL;
  }

  else
  {
    id v10 = sub_1004D3778();
    sub_1003F6050((uint64_t)v6, type metadata accessor for IDSGroupEncryptionFullIdentity);
  }

  return (IDSRealTimeEncryptionIdentity *)v10;
}

- (IDSRealTimeEncryptionIdentity)objcPreviousIdentity
{
  uint64_t v2 = self;
  id v3 = sub_10049A510();

  return (IDSRealTimeEncryptionIdentity *)v3;
}

- (_TtC17identityservicesd29IDSGroupEncryptionController2)init
{
  result = (_TtC17identityservicesd29IDSGroupEncryptionController2 *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupEncryptionController2",  47LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_groupsLock));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_publicIdentitiesLock));
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_config));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController));
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_sessionProvider),  v5);
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_pushHandler),  v6);
  sub_10040A648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_cryptoHandler));
}

@end