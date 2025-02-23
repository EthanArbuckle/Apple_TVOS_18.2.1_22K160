@interface ExtensionOrchestrator
- (_TtC23SAExtensionOrchestrator21ExtensionOrchestrator)init;
- (void)ingest:(id)a3;
- (void)publish:(id)a3;
@end

@implementation ExtensionOrchestrator

- (void)ingest:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100004388, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10000266C((uint64_t)sub_1000031C0, v5);

  swift_release(v5);
}

- (void)publish:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100003018((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC23SAExtensionOrchestrator21ExtensionOrchestrator)init
{
  result = (_TtC23SAExtensionOrchestrator21ExtensionOrchestrator *)_swift_stdlib_reportUnimplementedInitializer( "SAExtensionOrchestrator.ExtensionOrchestrator",  45LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC23SAExtensionOrchestrator21ExtensionOrchestrator_orchestrator;
  uint64_t v3 = type metadata accessor for Orchestrator(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end