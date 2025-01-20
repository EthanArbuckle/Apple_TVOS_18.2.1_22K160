@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (_TtC23AMSUIPaymentViewService11AppDelegate)init;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100003844((uint64_t)a3);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey();
    uint64_t v6 = v5;
    sub_100003EC4(&qword_1000111C0, (uint64_t)&unk_1000093B4);
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v6, (char *)&type metadata for Any + 8, v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  swift_bridgeObjectRelease(v8);
  return 1;
}

- (_TtC23AMSUIPaymentViewService11AppDelegate)init
{
  return (_TtC23AMSUIPaymentViewService11AppDelegate *)sub_1000038CC();
}

- (void).cxx_destruct
{
}

@end