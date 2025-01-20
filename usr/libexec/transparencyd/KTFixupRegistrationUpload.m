@interface KTFixupRegistrationUpload
+ (NSString)fixupName;
+ (void)setFixupName:(id)a3;
- (_TtC13transparencyd25KTFixupRegistrationUpload)init;
- (_TtC13transparencyd25KTFixupRegistrationUpload)initWithDependencies:(id)a3;
- (id)doFixupOperation;
@end

@implementation KTFixupRegistrationUpload

+ (NSString)fixupName
{
  v2 = off_1002E1388;
  swift_bridgeObjectRetain(off_1002E1388);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

+ (void)setFixupName:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_beginAccess(&qword_1002E1380, v7, 1LL, 0LL);
  v6 = off_1002E1388;
  qword_1002E1380 = v3;
  off_1002E1388 = v5;
  swift_bridgeObjectRelease(v6);
}

- (id)doFixupOperation
{
  v2 = self;
  id v3 = sub_1000B84F8();

  return v3;
}

- (_TtC13transparencyd25KTFixupRegistrationUpload)initWithDependencies:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd25KTFixupRegistrationUpload_deps) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for KTFixupRegistrationUpload();
  id v4 = a3;
  return -[KTFixupRegistrationUpload init](&v6, "init");
}

- (_TtC13transparencyd25KTFixupRegistrationUpload)init
{
  result = (_TtC13transparencyd25KTFixupRegistrationUpload *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTFixupRegistrationUpload",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end