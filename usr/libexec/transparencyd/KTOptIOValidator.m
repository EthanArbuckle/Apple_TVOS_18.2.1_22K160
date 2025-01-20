@interface KTOptIOValidator
- (_TtC13transparencyd16KTOptIOValidator)init;
- (_TtC13transparencyd16KTOptIOValidator)initWithOptInRecords:(id)a3 uriToSMT:(id)a4;
- (id)evaluateCloudDataWithApplication:(id)a3 error:(id *)a4;
- (id)evaluateLogDataWithApplication:(id)a3 error:(id *)a4;
- (id)urisNeedOptInApplication:(id)a3 error:(id *)a4;
- (void)setIntendedStateWithState:(BOOL)a3;
@end

@implementation KTOptIOValidator

- (_TtC13transparencyd16KTOptIOValidator)initWithOptInRecords:(id)a3 uriToSMT:(id)a4
{
  unint64_t v7 = sub_1000E31B4();
  v8 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = sub_100072CC4(&qword_1002E1228);
  v10 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  v9,  &protocol witness table for String);
  v11 = (char *)self + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_intendedState;
  _BYTE *v11 = 2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_optInRecords) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_uriToSMT) = v10;
  swift_beginAccess(v11, v14, 1LL, 0LL);
  _BYTE *v11 = 2;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for KTOptIOValidator();
  return -[KTOptIOValidator init](&v13, "init");
}

- (void)setIntendedStateWithState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = *(void (**)(BOOL))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v5 = self;
  v4(v3);
}

- (id)evaluateLogDataWithApplication:(id)a3 error:(id *)a4
{
  return sub_1000DFA28( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, uint64_t))KTOptIOValidator.evaluateLogData(application:));
}

- (id)evaluateCloudDataWithApplication:(id)a3 error:(id *)a4
{
  return sub_1000DFA28( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, uint64_t))KTOptIOValidator.evaluateCloudData(application:));
}

- (id)urisNeedOptInApplication:(id)a3 error:(id *)a4
{
  uint64_t v6 = v5;
  unint64_t v7 = self;
  uint64_t v8 = KTOptIOValidator.urisNeedOptIn(application:)();
  swift_bridgeObjectRelease(v6);

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (_TtC13transparencyd16KTOptIOValidator)init
{
  result = (_TtC13transparencyd16KTOptIOValidator *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTOptIOValidator",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_optInRecords));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_uriToSMT));
}

@end