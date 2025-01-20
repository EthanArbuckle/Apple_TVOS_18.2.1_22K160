@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC8FaceTime11AppDelegate)init;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0LL);
    uint64_t v8 = v7;
    unint64_t v9 = sub_100053154();
    id v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }

  id v10 = a3;
  v11 = self;
  char v12 = sub_100052E18();

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (_TtC8FaceTime11AppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate((uint64_t)self, (uint64_t)a2);
  return -[AppDelegate init](&v3, "init");
}

@end