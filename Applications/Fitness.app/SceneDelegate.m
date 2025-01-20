@interface SceneDelegate
- (UIWindow)window;
- (_TtC7Fitness13SceneDelegate)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7Fitness13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Fitness13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Fitness13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Fitness13SceneDelegate)init
{
  return result;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100004654(v8, v9, v10);
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7 = sub_100005794(0LL, &qword_10000D2E8, &OBJC_CLASS___UIOpenURLContext_ptr);
  unint64_t v8 = sub_100005378();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  id v10 = a3;
  v11 = self;
  sub_1000053D0(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  uint64_t v7 = sub_100003F84(&qword_10000D2E0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *(void *)&self->coordinator[OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator];
  uint64_t ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.super.isa
                                            + OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator));
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  SceneCoordinating.continueUserActivity(_:)(v14, ObjectType, v11);
  v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))Promise.operation.getter(v7);
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject(&unk_100008508, 32LL, 7LL);
  *(void *)(v19 + 16) = 0LL;
  *(void *)(v19 + 24) = 0LL;
  v16(sub_100005374, v19);
  swift_release(v18);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidBecomeActive:(id)a3
{
}

- (void)sceneWillResignActive:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void).cxx_destruct
{
}

@end