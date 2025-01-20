@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC24AMSEngagementViewService11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey();
    uint64_t v6 = v5;
    sub_100003968( &qword_100019FE0,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_10000F4A4);
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v6, (char *)&type metadata for Any + 8, v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  swift_bridgeObjectRelease(v8);
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000320C((int)v11, v9);
  v13 = v12;

  return v13;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  unint64_t v5 = sub_1000034DC();
  sub_100003968( &qword_100019FD8,  (uint64_t (*)(uint64_t))sub_1000034DC,  (uint64_t)&protocol conformance descriptor for NSObject);
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v5, v6);
  swift_bridgeObjectRelease(v7);
}

- (_TtC24AMSEngagementViewService11AppDelegate)init
{
  return (_TtC24AMSEngagementViewService11AppDelegate *)sub_100003338();
}

@end