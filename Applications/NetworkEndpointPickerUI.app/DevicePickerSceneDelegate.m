@interface DevicePickerSceneDelegate
- (UIWindow)window;
- (_TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate)init;
- (void)devicePickerDidCancelWithReason:(int64_t)a3;
- (void)didSucceedWithEndpointUUID:(id)a3 agentUUID:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sendClientDebugError:(int64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation DevicePickerSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100006BD8(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_hostViewController,  a2);
  if (Strong)
  {
    id v11 = (id)Strong;
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___DDUIHostViewController);
    uint64_t v7 = swift_dynamicCastObjCClass(v11, v6);
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = a3;
      id v10 = self;
      [v8 invalidate];
    }
  }

- (_TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window) = 0LL;
  id v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_newUserURLString);
  *id v3 = 0xD000000000000013LL;
  v3[1] = 0x8000000100009A40LL;
  id v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_signInUserURLString);
  *id v4 = 0xD000000000000020LL;
  v4[1] = 0x8000000100009A60LL;
  swift_unknownObjectWeakInit( (char *)self + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_hostViewController,  0LL);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DevicePickerSceneDelegate();
  return -[DevicePickerSceneDelegate init](&v6, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_window));
  swift_bridgeObjectRelease(*(void *)&self->window[OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_newUserURLString]);
  swift_bridgeObjectRelease(*(void *)&self->window[OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_signInUserURLString]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23NetworkEndpointPickerUI25DevicePickerSceneDelegate_hostViewController);
}

- (void)devicePickerDidCancelWithReason:(int64_t)a3
{
  id v4 = self;
  sub_100005F30(a3);
}

- (void)didSucceedWithEndpointUUID:(id)a3 agentUUID:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v13 = (char *)&v16 - v12;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  sub_100006088((uint64_t)v13, (uint64_t)v11);

  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v15(v13, v7);
}

- (void)sendClientDebugError:(int64_t)a3
{
  id v4 = self;
  sub_100006468(a3);
}

@end