@interface PeerValidationOperation
- (NSDictionary)result;
- (_TtC13transparencyd23PeerValidationOperation)init;
- (_TtC13transparencyd23PeerValidationOperation)initWithDeps:(id)a3 application:(id)a4 uris:(id)a5 logClient:(id)a6;
- (void)groupStart;
- (void)setResult:(id)a3;
@end

@implementation PeerValidationOperation

- (NSDictionary)result
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result, v6, 0LL, 0LL);
  uint64_t v3 = *v2;
  sub_10007D178(0LL, &qword_1002E1050, &OBJC_CLASS___KTVerifierResult_ptr);
  swift_bridgeObjectRetain(v3);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)setResult:(id)a3
{
  uint64_t v5 = sub_10007D178(0LL, &qword_1002E1050, &OBJC_CLASS___KTVerifierResult_ptr);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v5,  &protocol witness table for String);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result);
  swift_beginAccess(v7, v9, 1LL, 0LL);
  uint64_t v8 = *v7;
  uint64_t *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (_TtC13transparencyd23PeerValidationOperation)initWithDeps:(id)a3 application:(id)a4 uris:(id)a5 logClient:(id)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  id v13 = a3;
  swift_unknownObjectRetain(a6);
  v14 = (_TtC13transparencyd23PeerValidationOperation *)sub_1000AC8CC(v13, v9, v11, v12, (uint64_t)a6);

  swift_unknownObjectRelease(a6);
  return v14;
}

- (void)groupStart
{
  v2 = self;
  PeerValidationOperation.groupStart()();
}

- (_TtC13transparencyd23PeerValidationOperation)init
{
  result = (_TtC13transparencyd23PeerValidationOperation *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.PeerValidationOperation",  37LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_deps));
  swift_bridgeObjectRelease(*(id *)((char *)&self->super.super.super.super._private
                                  + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_application));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_uris));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_verifierInfo));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_verifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_completeOp));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_logClient));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_peerValidateQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result));
}

@end