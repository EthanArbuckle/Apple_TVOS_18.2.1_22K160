@interface BaseAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (UIWindow)window;
- (_TtC6Arcade15BaseAppDelegate)init;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)performDebugGesture:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation BaseAppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0LL);
    uint64_t v8 = v7;
    uint64_t v9 = sub_100003B6C( &qword_1002E62D0,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100233450);
    id v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }

  id v10 = a3;
  v11 = self;
  char v12 = sub_10011BB38((uint64_t)v4);

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10011C810();
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10011CB50();
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10011CDB8();
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for OpenURLOptionsKey(0LL);
  uint64_t v14 = v13;
  uint64_t v15 = sub_100003B6C( &qword_1002DD758,  (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey,  (uint64_t)&unk_100233494);
  uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);
  id v17 = a3;
  v18 = self;
  LOBYTE(a3) = sub_10011CEF4((uint64_t)v12, v16, v19);

  __n128 v20 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v20);
  return a3 & 1;
}

- (void)performDebugGesture:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_showDebugClosure);
  if (v3)
  {
    uint64_t v5 = *(void *)&self->window[OBJC_IVAR____TtC6Arcade15BaseAppDelegate_showDebugClosure];
    id v6 = a3;
    uint64_t v8 = self;
    uint64_t v7 = sub_100017A40((uint64_t)v3, v5);
    v3(v7);
    sub_10000D3D8((uint64_t)v3, v5);
  }

- (_TtC6Arcade15BaseAppDelegate)init
{
  return (_TtC6Arcade15BaseAppDelegate *)sub_10011B79C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_pendingBootstrap));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_pendingOnboarding));
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_flowController, (uint64_t *)&unk_1002E1800);
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_showDebugClosure),  *(void *)&self->window[OBJC_IVAR____TtC6Arcade15BaseAppDelegate_showDebugClosure]);
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Arcade15BaseAppDelegate_objectGraph));
}

@end