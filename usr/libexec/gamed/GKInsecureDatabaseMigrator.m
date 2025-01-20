@interface GKInsecureDatabaseMigrator
- (GKInsecureDatabaseMigrator)init;
- (GKInsecureDatabaseMigrator)initWithInsecureDatabaseURL:(id)a3 secureDatabaseURL:(id)a4 persistentStoreCoordinator:(id)a5 options:(id)a6 fileManager:(id)a7 bundleID:(id)a8;
- (void)migrate;
@end

@implementation GKInsecureDatabaseMigrator

- (GKInsecureDatabaseMigrator)initWithInsecureDatabaseURL:(id)a3 secureDatabaseURL:(id)a4 persistentStoreCoordinator:(id)a5 options:(id)a6 fileManager:(id)a7 bundleID:(id)a8
{
  uint64_t v14 = sub_100129274(&qword_1002B9D00);
  uint64_t v15 = *(void *)(*(void *)(v14 - 8) + 64LL);
  __chkstk_darwin(v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v17 = type metadata accessor for URL(0LL);
    uint64_t v18 = 0LL;
  }

  else
  {
    uint64_t v17 = type metadata accessor for URL(0LL);
    uint64_t v18 = 1LL;
  }

  uint64_t v19 = 1LL;
  uint64_t v20 = sub_1001291F8((uint64_t)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL), v18, 1LL, v17);
  __chkstk_darwin(v20);
  v21 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v19 = 0LL;
  }

  uint64_t v22 = type metadata accessor for URL(0LL);
  sub_1001291F8((uint64_t)v21, v19, 1LL, v22);
  uint64_t v23 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a6,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  sub_100162538((uint64_t)v16, (uint64_t)v21, (uint64_t)a5, v23, (uint64_t)a7, v24, v25);
  return result;
}

- (void)migrate
{
  v2 = self;
  InsecureDatabaseMigrator.migrate()();
}

- (GKInsecureDatabaseMigrator)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___GKInsecureDatabaseMigrator_insecureDatabaseURL;
  uint64_t v4 = sub_1001640F8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___GKInsecureDatabaseMigrator_secureDatabaseURL, v4);

  sub_100129678((Class *)((char *)&self->super.isa + OBJC_IVAR___GKInsecureDatabaseMigrator_persistentStoreCoordinator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKInsecureDatabaseMigrator_options), v6);
  swift_bridgeObjectRelease(*(void *)&self->fileManager[OBJC_IVAR___GKInsecureDatabaseMigrator_bundleID], v7);
}

@end