@interface DewConfiguration
- (_TtC13transparencyd16DewConfiguration)init;
- (_TtC13transparencyd16DewConfiguration)initWithSettings:(id)a3;
@end

@implementation DewConfiguration

- (_TtC13transparencyd16DewConfiguration)initWithSettings:(id)a3
{
  uint64_t ObjectType = swift_getObjectType(self);
  uint64_t v6 = type metadata accessor for DewGlobalOverrides();
  uint64_t v7 = swift_allocObject(v6, 32LL, 7LL);
  swift_unknownObjectRetain(a3);
  *(void *)(v7 + 16) = sub_100080310((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(v7 + 24) = 0LL;
  v8 = (_TtC13transparencyd16DewConfiguration *)(*(uint64_t (**)(uint64_t, id))(ObjectType + 104))(v7, a3);
  swift_deallocPartialClassInstance( self,  ObjectType,  *(unsigned int *)((swift_isaMask & (uint64_t)self->super.isa) + 0x30),  *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.isa) + 0x34));
  return v8;
}

- (_TtC13transparencyd16DewConfiguration)init
{
  result = (_TtC13transparencyd16DewConfiguration *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.DewConfiguration",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd16DewConfiguration_settings));
  v3 = (char *)self + OBJC_IVAR____TtC13transparencyd16DewConfiguration_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end