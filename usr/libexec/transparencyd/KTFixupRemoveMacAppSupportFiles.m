@interface KTFixupRemoveMacAppSupportFiles
+ (NSString)fixupName;
+ (void)setFixupName:(id)a3;
- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)init;
- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)initWithDependencies:(id)a3;
- (id)doFixupOperation;
@end

@implementation KTFixupRemoveMacAppSupportFiles

+ (NSString)fixupName
{
  v2 = off_1002E2178;
  swift_bridgeObjectRetain(off_1002E2178);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

+ (void)setFixupName:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_beginAccess(&qword_1002E2170, v7, 1LL, 0LL);
  v6 = off_1002E2178;
  qword_1002E2170 = v3;
  off_1002E2178 = v5;
  swift_bridgeObjectRelease(v6);
}

- (id)doFixupOperation
{
  return 0LL;
}

- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)initWithDependencies:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd31KTFixupRemoveMacAppSupportFiles_deps) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for KTFixupRemoveMacAppSupportFiles();
  id v4 = a3;
  return -[KTFixupRemoveMacAppSupportFiles init](&v6, "init");
}

- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)init
{
  result = (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTFixupRemoveMacAppSupportFiles",  45LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end