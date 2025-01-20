@interface BonjourAdvertiser
- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser)init;
- (void)publishPairingRequestIndicatedBySubscriber:(id)a3 withPairingMethod:(int64_t)a4 pairingAuthenticationGeneratedCompletionHandler:(id)a5;
@end

@implementation BonjourAdvertiser

- (void)publishPairingRequestIndicatedBySubscriber:(id)a3 withPairingMethod:(int64_t)a4 pairingAuthenticationGeneratedCompletionHandler:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
}

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser)init
{
  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser *)_swift_stdlib_reportUnimplementedInitializer( "CoreP2P.BonjourAdvertiser",  25LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_1000209AC( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service),  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service + 8],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service + 16]);
  sub_10002091C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo),  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo + 8],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo + 16],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo + 24],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo + 32],  *(void *)&self->txtInfo[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo + 6]);
  sub_1000225EC( (uint64_t)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_srvInfo,  &qword_100404DB0);
}

@end