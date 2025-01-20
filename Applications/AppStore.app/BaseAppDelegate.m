@interface BaseAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (UIWindow)window;
- (_TtC8AppStore15BaseAppDelegate)init;
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
                                                             + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0LL);
    uint64_t v8 = v7;
    uint64_t v9 = sub_100004288( &qword_1002E1618,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100236970);
    id v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }

  id v10 = a3;
  v11 = self;
  char v13 = sub_100127044((uint64_t)v4, v12);

  swift_bridgeObjectRelease(v4);
  return v13 & 1;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100127D1C();
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10012805C();
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001282C4();
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  __n128 v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for OpenURLOptionsKey(0LL);
  uint64_t v14 = v13;
  uint64_t v15 = sub_100004288( &qword_1002E1628,  (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey,  (uint64_t)&unk_1002369B4);
  uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);
  id v17 = a3;
  v18 = self;
  LOBYTE(a3) = sub_100128400((uint64_t)v12, v16, v19);

  __n128 v20 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v20);
  return a3 & 1;
}

- (void)performDebugGesture:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_showDebugClosure);
  if (v3)
  {
    uint64_t v5 = *(void *)&self->window[OBJC_IVAR____TtC8AppStore15BaseAppDelegate_showDebugClosure];
    id v6 = a3;
    uint64_t v8 = self;
    uint64_t v7 = sub_100015CA0((uint64_t)v3, v5);
    v3(v7);
    sub_10000A450((uint64_t)v3, v5);
  }

- (_TtC8AppStore15BaseAppDelegate)init
{
  return (_TtC8AppStore15BaseAppDelegate *)sub_100126D48();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_pendingBootstrap));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_pendingOnboarding));
  sub_1000077E0((uint64_t)self + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_flowController, (uint64_t *)&unk_1002E5E90);
  sub_10000A450( *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_showDebugClosure),  *(void *)&self->window[OBJC_IVAR____TtC8AppStore15BaseAppDelegate_showDebugClosure]);
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore15BaseAppDelegate_objectGraph));
}

@end