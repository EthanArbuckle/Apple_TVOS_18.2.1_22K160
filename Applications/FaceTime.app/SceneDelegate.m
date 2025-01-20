@interface SceneDelegate
- (UIWindow)window;
- (_TtC8FaceTime13SceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8FaceTime13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime13SceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10005388C(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000534E4(v4);
}

- (_TtC8FaceTime13SceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime13SceneDelegate_observerCancellables) = (Class)_swiftEmptyArrayStorage;
  uint64_t v2 = OBJC_IVAR____TtC8FaceTime13SceneDelegate_callManager;
  uint64_t v3 = qword_100112380;
  id v4 = self;
  if (v3 != -1) {
    swift_once(&qword_100112380, sub_100080AF0);
  }
  v5 = (void *)qword_10011A2F0;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_10011A2F0;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8FaceTime13SceneDelegate_window) = 0LL;
  id v6 = v5;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for SceneDelegate(v7, v8);
  return -[SceneDelegate init](&v10, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8FaceTime13SceneDelegate_observerCancellables));
}

@end