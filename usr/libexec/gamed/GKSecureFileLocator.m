@interface GKSecureFileLocator
+ (NSString)globalContextID;
- (GKSecureFileLocator)init;
- (GKSecureFileLocator)initWithFileManager:(id)a3;
- (id)cacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5;
- (id)databaseDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5;
- (id)databaseFileWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5 name:(id)a6;
- (id)globalDatabaseFileWithBundleID:(id)a3 language:(id)a4 name:(id)a5;
- (void)removeCacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5;
- (void)removeCaches;
@end

@implementation GKSecureFileLocator

+ (NSString)globalContextID
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE600000000000000LL, v3);
  return (NSString *)v2;
}

- (GKSecureFileLocator)initWithFileManager:(id)a3
{
  id v3 = a3;
  return (GKSecureFileLocator *)sub_1001641B4();
}

- (id)cacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  return sub_100164760();
}

- (id)databaseDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  return sub_100164760();
}

- (id)databaseFileWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5 name:(id)a6
{
  uint64_t v11 = sub_100129274(&qword_1002B9D00);
  __chkstk_darwin(v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v17 = v16;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v19 = v18;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v21 = v20;
  v22 = self;
  sub_100164854();

  swift_bridgeObjectRelease(v15, v23);
  swift_bridgeObjectRelease(v17, v24);
  swift_bridgeObjectRelease(v19, v25);
  swift_bridgeObjectRelease(v21, v26);
  uint64_t v27 = type metadata accessor for URL(0LL);
  v29 = 0LL;
  if (sub_10012B4E8((uint64_t)v13, 1LL, v27) != 1)
  {
    URL._bridgeToObjectiveC()(v28);
    v29 = v30;
    (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8LL))(v13, v27);
  }

  return v29;
}

- (id)globalDatabaseFileWithBundleID:(id)a3 language:(id)a4 name:(id)a5
{
  uint64_t v9 = sub_100129274(&qword_1002B9D00);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v15 = v14;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v17 = v16;
  uint64_t v18 = self;
  sub_100164CE8();

  swift_bridgeObjectRelease(v13, v19);
  swift_bridgeObjectRelease(v15, v20);
  swift_bridgeObjectRelease(v17, v21);
  uint64_t v22 = type metadata accessor for URL(0LL);
  uint64_t v24 = 0LL;
  if (sub_10012B4E8((uint64_t)v11, 1LL, v22) != 1)
  {
    URL._bridgeToObjectiveC()(v23);
    uint64_t v24 = v25;
    (*(void (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8LL))(v11, v22);
  }

  return v24;
}

- (void)removeCacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  uint64_t v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v13 = v12;
  uint64_t v14 = self;
  sub_100164E44();

  swift_bridgeObjectRelease(v9, v15);
  swift_bridgeObjectRelease(v11, v16);
  swift_bridgeObjectRelease(v13, v17);
}

- (void)removeCaches
{
  NSString v2 = self;
  sub_100165198();
}

- (GKSecureFileLocator)init
{
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___GKSecureFileLocator_rootDirectory;
  uint64_t v4 = sub_1001640F8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___GKSecureFileLocator_parentCachesDirectory, v4);
}

@end