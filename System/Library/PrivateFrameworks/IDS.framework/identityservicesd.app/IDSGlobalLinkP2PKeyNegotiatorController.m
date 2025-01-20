@interface IDSGlobalLinkP2PKeyNegotiatorController
- (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController)init;
- (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController)initWithIdentityProvider:(id)a3 groupMetadataProvider:(id)a4;
- (void)dealloc;
- (void)negotiatorForGroup:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation IDSGlobalLinkP2PKeyNegotiatorController

- (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController)initWithIdentityProvider:(id)a3 groupMetadataProvider:(id)a4
{
  return (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController *)sub_100481F68(a3, (uint64_t)a4);
}

- (void)dealloc
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_lock));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_continuationsForPreKeys));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_negotiators));
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_metadataProvider),  v5);
  sub_100482178( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_stopListening),  *(void *)&self->lock[OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_stopListening]);
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_identityProvider),  v6);
}

- (void)negotiatorForGroup:(NSString *)a3 completionHandler:(id)a4
{
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject(&unk_100906DD0, 40LL, 7LL);
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 1LL, 1LL, v13);
  v14 = (void *)swift_allocObject(&unk_100906DF8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1009BB598;
  v14[5] = v12;
  v15 = (void *)swift_allocObject(&unk_100906E20, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_1009BB5A8;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  uint64_t v18 = sub_100417998((uint64_t)v10, (uint64_t)&unk_1009BB5B8, (uint64_t)v15);
  swift_release(v18);
}

- (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController)init
{
  result = (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGlobalLinkP2PKeyNe gotiatorController",  57LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end