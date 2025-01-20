@interface SceneDelegate
- (_TtC8Podcasts13SceneDelegate)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100156154(v8, v10);
}

- (void)sceneDidBecomeActive:(id)a3
{
}

- (void)sceneWillResignActive:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7 = sub_100134284(0LL, &qword_1002B5E78, &OBJC_CLASS___UIOpenURLContext_ptr);
  uint64_t v8 = sub_100157370((unint64_t *)&unk_1002B5E80, &qword_1002B5E78, &OBJC_CLASS___UIOpenURLContext_ptr);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  id v10 = a3;
  v11 = self;
  sub_10015585C(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100156A80(v7);
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_100156CA0(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v10 = v9;
  id v11 = a3;
  id v13 = a5;
  v12 = self;
  sub_100156E64(v8, v10, (uint64_t)v13);

  swift_bridgeObjectRelease(v10);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_10015705C(v10, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (_TtC8Podcasts13SceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

@end