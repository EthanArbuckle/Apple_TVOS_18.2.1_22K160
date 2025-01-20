@interface LaunchWarningClientOperations
- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 error:(id *)a5;
- (_TtC3mis29LaunchWarningClientOperations)init;
- (id)checkForLaunchWarning:(id)a3 error:(id *)a4;
- (id)queryAppBundle:(id)a3 error:(id *)a4;
- (id)queryExecutableURL:(id)a3 error:(id *)a4;
@end

@implementation LaunchWarningClientOperations

- (id)queryExecutableURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_18406FE20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FDFC();
  v9 = self;
  sub_1840548B8();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (id)queryAppBundle:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_18406FE20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FDFC();
  v9 = self;
  v10 = sub_184054320((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

- (id)checkForLaunchWarning:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_18406FE20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FDFC();
  v9 = self;
  id v10 = sub_184054C4C();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  uint64_t v13 = (void *)sub_18406FE50();
  sub_18404D0F8((uint64_t)v10, v12);
  return v13;
}

- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_18406FE20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FDFC();
  unint64_t v11 = self;
  sub_184054F18(a3, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return 1;
}

- (_TtC3mis29LaunchWarningClientOperations)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LaunchWarningClientOperations();
  return -[LaunchWarningClientOperations init](&v3, sel_init);
}

@end