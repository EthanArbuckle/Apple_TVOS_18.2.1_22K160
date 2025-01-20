@interface IntentHandler
- (_TtC22SiriGeoIntentExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  IntentHandler.handler(for:)(v4, v10);

  uint64_t v6 = v11;
  v7 = __swift_project_boxed_opaque_existential_0(v10, v11);
  v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  __swift_destroy_boxed_opaque_existential_0(v10);
  return v8;
}

- (_TtC22SiriGeoIntentExtension13IntentHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC22SiriGeoIntentExtension13IntentHandler_logObject;
  type metadata accessor for OS_os_log();
  id v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)OS_os_log.init(subsystem:category:)( 0xD000000000000016LL,  0x80000001000078E0LL,  0xD000000000000016LL,  0x8000000100007670LL);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for IntentHandler();
  return -[IntentHandler init](&v6, "init");
}

- (void).cxx_destruct
{
}

@end