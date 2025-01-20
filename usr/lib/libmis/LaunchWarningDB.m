@interface LaunchWarningDB
- (BOOL)setupSchema;
- (_TtC3mis15LaunchWarningDB)init;
- (_TtC3mis15LaunchWarningDB)initWithDatabaseURL:(id)a3;
- (_TtC3mis15LaunchWarningDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4;
- (void)setupPermissions;
@end

@implementation LaunchWarningDB

- (_TtC3mis15LaunchWarningDB)initWithDatabaseURL:(id)a3
{
  uint64_t v4 = sub_18406FE20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FDFC();
  v8 = (void *)sub_18406FDE4();
  v9 = (objc_class *)type metadata accessor for LaunchWarningDB();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[SQLDB initWithDatabaseURL:](&v12, sel_initWithDatabaseURL_, v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (_TtC3mis15LaunchWarningDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_18406FE20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858]();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FDFC();
  v10 = (void *)sub_18406FDE4();
  v11 = (objc_class *)type metadata accessor for LaunchWarningDB();
  v14.receiver = self;
  v14.super_class = v11;
  objc_super v12 = -[SQLDB initWithDatabaseURL:asReadOnly:](&v14, sel_initWithDatabaseURL_asReadOnly_, v10, v4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)setupSchema
{
  v2 = self;
  unsigned __int8 v3 = sub_1840507F0();

  return v3 & 1;
}

- (void)setupPermissions
{
  uint64_t v3 = sub_18406FE20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = self;
  uint64_t v8 = -[SQLDB dbURL](v7, sel_dbURL);
  sub_18406FDFC();

  sub_18406FE08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v9 = sub_18406FF34();
  swift_bridgeObjectRelease();
  sub_18406F7D0((const char *)(v9 + 32));

  swift_release();
}

- (_TtC3mis15LaunchWarningDB)init
{
  result = (_TtC3mis15LaunchWarningDB *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end