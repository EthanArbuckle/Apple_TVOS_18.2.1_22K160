@interface ModelLocation
- (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation)init;
- (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation)initWithTempFolderGuid:(id)a3 fileName:(id)a4;
@end

@implementation ModelLocation

- (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation)initWithTempFolderGuid:(id)a3 fileName:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL, a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))( (char *)self + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_tempFolderGuid,  v10,  v7);
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_fileName);
  uint64_t *v14 = v11;
  v14[1] = v13;
  v15 = (objc_class *)type metadata accessor for ModelLocation(0LL);
  v18.receiver = self;
  v18.super_class = v15;
  v16 = -[ModelLocation init](&v18, "init");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation)init
{
  result = (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_dt_DTMLModelRunnerService.ModelLocation",  49LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_tempFolderGuid;
  uint64_t v4 = type metadata accessor for UUID(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease( *(void *)&self->fileName[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_fileName],  v5);
}

@end