@interface KTFetchCloudStorageOperation
+ (id)lastCKFetchWithDeps:(id)a3;
- (BOOL)shouldRetry;
- (_TtC13transparencyd28KTFetchCloudStorageOperation)init;
- (_TtC13transparencyd28KTFetchCloudStorageOperation)initWithDeps:(id)a3 initialFetch:(BOOL)a4 userInteractive:(BOOL)a5 reason:(id)a6 context:(id)a7;
- (void)groupStart;
@end

@implementation KTFetchCloudStorageOperation

- (BOOL)shouldRetry
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0xD8);
  v3 = self;
  LOBYTE(v2) = v2();

  return v2 & 1;
}

+ (id)lastCKFetchWithDeps:(id)a3
{
  uint64_t v4 = sub_100072CC4((uint64_t *)&unk_1002DF740);
  __chkstk_darwin(v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = a3;
  id v8 = [v7 smDataStore];
  if (qword_1002E9588 != -1) {
    swift_once(&qword_1002E9588, sub_10007AE4C);
  }
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [v8 getSettingsDate:v9];

  swift_unknownObjectRelease(v8);
  if (v10)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v10);

    uint64_t v11 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v6, 0LL, 1LL, v11);
  }

  else
  {
    uint64_t v11 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v6, 1LL, 1LL, v11);
  }

  type metadata accessor for Date(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1LL, v11) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }

  return isa;
}

- (_TtC13transparencyd28KTFetchCloudStorageOperation)initWithDeps:(id)a3 initialFetch:(BOOL)a4 userInteractive:(BOOL)a5 reason:(id)a6 context:(id)a7
{
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v13 = v12;
  id v14 = a3;
  id v15 = a7;
  v16 = (_TtC13transparencyd28KTFetchCloudStorageOperation *)sub_10007D03C(v14, a4, a5, v11, v13, v15);

  return v16;
}

- (void)groupStart
{
  v2 = self;
  KTFetchCloudStorageOperation.groupStart()();
}

- (_TtC13transparencyd28KTFetchCloudStorageOperation)init
{
  result = (_TtC13transparencyd28KTFetchCloudStorageOperation *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTFetchCloudStorageOperation",  42LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_deps));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_fetchOperation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_previousServerChangeToken));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_serverChangeTokens));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_context));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_zoneHandler));
  swift_bridgeObjectRelease(*(id *)((char *)&self->super.super.super.super.super._private
                                  + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_reason));
  v3 = (char *)self + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_lastFetch;
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end