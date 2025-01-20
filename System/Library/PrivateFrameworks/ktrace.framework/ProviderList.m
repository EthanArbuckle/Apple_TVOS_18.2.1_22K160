@interface ProviderList
- (BOOL)containsWithName:(id)a3;
- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4;
- (_TtC6ktrace12ProviderList)init;
- (_TtC6ktrace12ProviderList)initWithMachine:(ktrace_machine *)a3;
- (void)configurePostprocessingWithSession:(void *)a3;
- (void)configureWithSession:(void *)a3;
- (void)didEndTracingWithFile:(void *)a3;
- (void)didStartTracingWithFile:(void *)a3;
- (void)postprocessingCompleteWithFile:(void *)a3;
- (void)willEndTracingWithFile:(void *)a3;
- (void)willFinishWithCatalog:(void *)a3 file:(void *)a4;
- (void)willStartTracingWithFile:(void *)a3;
@end

@implementation ProviderList

- (_TtC6ktrace12ProviderList)initWithMachine:(ktrace_machine *)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6ktrace12ProviderList_providers) = (Class)MEMORY[0x18961AFE8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6ktrace12ProviderList_machine) = (Class)a3;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[ProviderList init](&v7, sel_init);
}

- (BOOL)containsWithName:(id)a3
{
  uint64_t v4 = sub_186C5AD2C();
  uint64_t v6 = v5;
  objc_super v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6ktrace12ProviderList_providers);
  swift_beginAccess();
  LOBYTE(v7) = sub_186BFA398(*v7, v4, v6);
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4
{
  uint64_t v5 = self;
  ProviderList.shouldStartTracing(configuration:)((uint64_t)a3);

  return 1;
}

- (void)configureWithSession:(void *)a3
{
  uint64_t v4 = self;
  ProviderList.configure(session:)((Swift::OpaquePointer)a3);
}

- (void)willStartTracingWithFile:(void *)a3
{
  uint64_t v4 = self;
  ProviderList.willStartTracing(file:)((uint64_t)a3);
}

- (void)didStartTracingWithFile:(void *)a3
{
  uint64_t v4 = self;
  ProviderList.didStartTracing(file:)((uint64_t)a3);
}

- (void)willEndTracingWithFile:(void *)a3
{
  uint64_t v4 = self;
  ProviderList.willEndTracing(file:)((uint64_t)a3);
}

- (void)didEndTracingWithFile:(void *)a3
{
  uint64_t v4 = self;
  ProviderList.didEndTracing(file:)((uint64_t)a3);
}

- (void)configurePostprocessingWithSession:(void *)a3
{
  uint64_t v4 = self;
  ProviderList.configurePostprocessing(session:)((Swift::OpaquePointer)a3);
}

- (void)postprocessingCompleteWithFile:(void *)a3
{
  uint64_t v4 = self;
  ProviderList.postprocessingComplete(file:)((Swift::OpaquePointer)a3);
}

- (void)willFinishWithCatalog:(void *)a3 file:(void *)a4
{
  uint64_t v6 = self;
  ProviderList.willFinish(catalog:file:)((uint64_t)a3, (uint64_t)a4);
}

- (_TtC6ktrace12ProviderList)init
{
  result = (_TtC6ktrace12ProviderList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end