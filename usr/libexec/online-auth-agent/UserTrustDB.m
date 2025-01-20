@interface UserTrustDB
- (BOOL)setupSchema;
- (_TtC17online_auth_agent11UserTrustDB)init;
- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3;
- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4;
- (void)setupPermissions;
@end

@implementation UserTrustDB

- (BOOL)setupSchema
{
  v2 = self;
  unsigned __int8 v3 = sub_1000102B0();

  return v3 & 1;
}

- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  v12 = (objc_class *)type metadata accessor for UserTrustDB();
  v15.receiver = self;
  v15.super_class = v12;
  v13 = -[SQLDB initWithDatabaseURL:](&v15, "initWithDatabaseURL:", v11);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for UserTrustDB();
  v17.receiver = self;
  v17.super_class = v14;
  objc_super v15 = -[SQLDB initWithDatabaseURL:asReadOnly:](&v17, "initWithDatabaseURL:asReadOnly:", v13, v4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (void)setupPermissions
{
  v2 = self;
  sub_1000249F8();
}

- (_TtC17online_auth_agent11UserTrustDB)init
{
  result = (_TtC17online_auth_agent11UserTrustDB *)_swift_stdlib_reportUnimplementedInitializer( "online_auth_agent.UserTrustDB",  29LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end