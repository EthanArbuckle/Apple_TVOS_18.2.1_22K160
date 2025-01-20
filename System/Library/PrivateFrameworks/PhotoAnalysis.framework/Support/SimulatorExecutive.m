@interface SimulatorExecutive
- (_TtC14photoanalysisd18SimulatorExecutive)init;
@end

@implementation SimulatorExecutive

- (_TtC14photoanalysisd18SimulatorExecutive)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SimulatorExecutive(0LL);
  return -[SimulatorExecutive init](&v4, "init");
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC14photoanalysisd18SimulatorExecutive_logger;
  uint64_t v3 = type metadata accessor for Logger(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end