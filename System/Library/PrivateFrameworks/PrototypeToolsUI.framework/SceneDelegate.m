@interface SceneDelegate
- (_TtC10prototyped13SceneDelegate)init;
- (void)didDrag:(id)a3;
- (void)didPinch:(id)a3;
- (void)didSelectDone;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v9 = type metadata accessor for MainActor(0LL);
  uint64_t v10 = static MainActor.shared.getter(v9);
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  uint64_t v13 = v12;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 20LL, v11, v13);
  }
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  _s10prototyped13SceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0I7SessionCSo0I17ConnectionOptionsCtF_0(v14);
  swift_release(v10);
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)didSelectDone
{
  uint64_t v3 = type metadata accessor for MainActor(0LL);
  uint64_t v4 = static MainActor.shared.getter(v3);
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  uint64_t v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 64LL, v5, v7);
  }
  v8 = self;
  sub_10000827C();
  swift_release(v4);
}

- (void)didDrag:(id)a3
{
}

- (void)didPinch:(id)a3
{
}

- (_TtC10prototyped13SceneDelegate)init
{
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 19LL, v4, v6);
  }
  uint64_t v7 = (_TtC10prototyped13SceneDelegate *)SceneDelegate.init()();
  swift_release(v3);
  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___rootModuleController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___panGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___pinchGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___settingsViewController));
}

@end