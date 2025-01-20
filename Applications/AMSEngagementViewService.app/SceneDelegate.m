@interface SceneDelegate
- (UIWindow)window;
- (_TtC24AMSEngagementViewService13SceneDelegate)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000BC68((uint64_t)a3);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000BC7C((int)v8, (int)v11, v10);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7 = sub_100007230(0LL, &qword_10001A768, &OBJC_CLASS___UIOpenURLContext_ptr);
  sub_10000E298(&qword_10001A770, &qword_10001A768, &OBJC_CLASS___UIOpenURLContext_ptr);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  id v10 = a3;
  v11 = self;
  sub_10000BFD0((uint64_t)v11, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10000C3C8((uint64_t)v8, v7);
}

- (_TtC24AMSEngagementViewService13SceneDelegate)init
{
  return (_TtC24AMSEngagementViewService13SceneDelegate *)sub_10000E0D8();
}

- (void).cxx_destruct
{
}

@end