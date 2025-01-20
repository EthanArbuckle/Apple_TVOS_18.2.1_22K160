@interface STSDiagnosticExtension
- (_TtC13STSDiagnostic22STSDiagnosticExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation STSDiagnosticExtension

- (id)attachmentList
{
  v2 = self;
  uint64_t v3 = sub_100002F84();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    v4.super.isa = 0LL;
  }

  return v4.super.isa;
}

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v4 = 0LL;
  }
  v5 = self;
  uint64_t v6 = sub_100006B90();

  swift_bridgeObjectRelease(v4);
  if (v6)
  {
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }

  else
  {
    v7.super.isa = 0LL;
  }

  return v7.super.isa;
}

- (_TtC13STSDiagnostic22STSDiagnosticExtension)init
{
  v2 = self;
  Logger.init(subsystem:category:)( 0xD000000000000012LL,  0x80000001000077B0LL,  0x74736F6E67616944LL,  0xEA00000000006369LL);
  uint64_t v3 = &v2->logPath[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath];
  *(void *)uint64_t v3 = 0xD000000000000030LL;
  *((void *)v3 + 1) = 0x80000001000077D0LL;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for STSDiagnosticExtension(0LL);
  return -[STSDiagnosticExtension init](&v5, "init");
}

- (void).cxx_destruct
{
  uint64_t v3 = &self->logPath[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logger];
  uint64_t v4 = type metadata accessor for Logger(0LL, a2);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->logPath[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath
                                                    + 8]);
}

@end