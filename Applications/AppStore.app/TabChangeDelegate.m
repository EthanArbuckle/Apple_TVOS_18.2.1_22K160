@interface TabChangeDelegate
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (_TtC8AppStore17TabChangeDelegate)init;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
@end

@implementation TabChangeDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001A7924(v6, (uint64_t)v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001A8550(v6);
}

- (_TtC8AppStore17TabChangeDelegate)init
{
  result = (_TtC8AppStore17TabChangeDelegate *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.TabChangeDelegate",  26LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8AppStore17TabChangeDelegate_metricsPipeline;
  uint64_t v3 = type metadata accessor for MetricsPipeline(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end