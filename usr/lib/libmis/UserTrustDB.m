@interface UserTrustDB
- (BOOL)setupSchema;
- (_TtC3mis11UserTrustDB)init;
- (_TtC3mis11UserTrustDB)initWithDatabaseURL:(id)a3;
- (_TtC3mis11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4;
- (void)setupPermissions;
@end

@implementation UserTrustDB

- (_TtC3mis11UserTrustDB)initWithDatabaseURL:(id)a3
{
  uint64_t v4 = sub_18406FE20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FDFC();
  v8 = (void *)sub_18406FDE4();
  v9 = (objc_class *)type metadata accessor for UserTrustDB();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[SQLDB initWithDatabaseURL:](&v12, sel_initWithDatabaseURL_, v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (_TtC3mis11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_18406FE20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858]();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FDFC();
  v10 = (void *)sub_18406FDE4();
  v11 = (objc_class *)type metadata accessor for UserTrustDB();
  v14.receiver = self;
  v14.super_class = v11;
  objc_super v12 = -[SQLDB initWithDatabaseURL:asReadOnly:](&v14, sel_initWithDatabaseURL_asReadOnly_, v10, v4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)setupPermissions
{
  v2 = self;
  sub_18404CE80();
}

- (_TtC3mis11UserTrustDB)init
{
  result = (_TtC3mis11UserTrustDB *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)setupSchema
{
  v2 = self;
  unsigned __int8 v3 = sub_184052A6C();

  return v3 & 1;
}

@end