@interface LaunchWarningDB
- (BOOL)setupSchema;
- (_TtC17online_auth_agent15LaunchWarningDB)init;
- (_TtC17online_auth_agent15LaunchWarningDB)initWithDatabaseURL:(id)a3;
- (_TtC17online_auth_agent15LaunchWarningDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4;
- (void)setupPermissions;
@end

@implementation LaunchWarningDB

- (_TtC17online_auth_agent15LaunchWarningDB)initWithDatabaseURL:(id)a3
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  v12 = (objc_class *)type metadata accessor for LaunchWarningDB();
  v15.receiver = self;
  v15.super_class = v12;
  v13 = -[SQLDB initWithDatabaseURL:](&v15, "initWithDatabaseURL:", v11);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (_TtC17online_auth_agent15LaunchWarningDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for LaunchWarningDB();
  v17.receiver = self;
  v17.super_class = v14;
  objc_super v15 = -[SQLDB initWithDatabaseURL:asReadOnly:](&v17, "initWithDatabaseURL:asReadOnly:", v13, v4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (BOOL)setupSchema
{
  v2 = self;
  unsigned __int8 v3 = sub_100014B5C();

  return v3 & 1;
}

- (void)setupPermissions
{
  uint64_t v3 = type metadata accessor for URL(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = self;
  uint64_t v8 = -[SQLDB dbURL](v7, "dbURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v8);

  uint64_t v9 = URL.path.getter();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v12 = String.utf8CString.getter(v9, v11);
  swift_bridgeObjectRelease(v11);
  sub_1000066DC((const char *)(v12 + 32));

  swift_release(v12);
}

- (_TtC17online_auth_agent15LaunchWarningDB)init
{
  result = (_TtC17online_auth_agent15LaunchWarningDB *)_swift_stdlib_reportUnimplementedInitializer( "online_auth_agent.LaunchWarningDB",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end