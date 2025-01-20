@interface BonjourResolver
- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver)init;
- (void)datapathConfirmedForPeerDataAddress:(id)a3 serviceSpecificInfo:(id)a4;
- (void)datapathFailedToStartWithError:(int64_t)a3;
- (void)datapathPairingRequestStartedWithPairingMethod:(int64_t)a3 pairingAuthenticationInputCompletionHandler:(id)a4;
- (void)datapathTerminatedWithReason:(int64_t)a3;
- (void)datapathUpdatedServiceSpecificInfo:(id)a3;
@end

@implementation BonjourResolver

- (void)datapathFailedToStartWithError:(int64_t)a3
{
  v3 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler);
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler);
  if (v4)
  {
    uint64_t v5 = v3[1];
    v6 = self;
    uint64_t v7 = sub_10002254C((uint64_t)v4, v5);
    v4(v7);
    sub_100021018((uint64_t)v4, v5);
    uint64_t v8 = *v3;
  }

  else
  {
    v9 = self;
    uint64_t v8 = 0LL;
  }

  uint64_t v10 = v3[1];
  uint64_t *v3 = 0LL;
  v3[1] = 0LL;
  sub_100021018(v8, v10);
}

- (void)datapathConfirmedForPeerDataAddress:(id)a3 serviceSpecificInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10001AA18((uint64_t)v6, a4);
}

- (void)datapathUpdatedServiceSpecificInfo:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10001B178(a3);
}

- (void)datapathPairingRequestStartedWithPairingMethod:(int64_t)a3 pairingAuthenticationInputCompletionHandler:(id)a4
{
  v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void)datapathTerminatedWithReason:(int64_t)a3
{
  v3 = self;
  sub_100021B40();
}

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver)init
{
  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *)_swift_stdlib_reportUnimplementedInitializer( "CoreP2P.BonjourResolver",  23LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  uint64_t v5 = *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_service];
  swift_bridgeObjectRelease(*(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_service
                                                    + 16]);
  swift_bridgeObjectRelease(v5);
  sub_1000225EC( (uint64_t)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_srv,  &qword_100404DB0);
  sub_1000217B0( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa),  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 8],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 16],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 24],  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 32],  *(void *)&self->aaaa[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 6],  *(void *)&self->aaaa[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 14]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_delegate));
  sub_100021018( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler),  *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler]);
}

@end