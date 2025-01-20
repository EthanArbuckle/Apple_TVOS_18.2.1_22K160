@interface PeoplePickerSceneDelegate
- (UIWindow)window;
- (_TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate)init;
- (void)devicePickerDidCancelWithReason:(int64_t)a3;
- (void)didSucceedWithEndpointUUID:(id)a3 agentUUID:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sendClientDebugError:(int64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation PeoplePickerSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100008CEC(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_peopleHostViewController,  a2);
  if (Strong)
  {
    id v11 = (id)Strong;
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___DDUIPeopleHostViewController);
    uint64_t v7 = swift_dynamicCastObjCClass(v11, v6);
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = a3;
      id v10 = self;
      [v8 invalidate];
    }
  }

- (_TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate)init
{
  uint64_t v2 = OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_log;
  uint64_t v3 = qword_100011560;
  v5 = self;
  if (v3 != -1) {
    swift_once(&qword_100011560, sub_100006E58);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL, v4);
  uint64_t v7 = sub_100008C94(v6, (uint64_t)qword_1000118F8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))((char *)v5 + v2, v7, v6);
  *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window) = 0LL;
  swift_unknownObjectWeakInit( (char *)v5 + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_peopleHostViewController,  0LL);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for PeoplePickerSceneDelegate(0LL);
  return -[PeoplePickerSceneDelegate init](&v9, "init");
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_log;
  uint64_t v4 = type metadata accessor for Logger(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_window));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23NetworkEndpointPickerUI25PeoplePickerSceneDelegate_peopleHostViewController);
}

- (void)devicePickerDidCancelWithReason:(int64_t)a3
{
  uint64_t v4 = self;
  sub_10000766C(a3);
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
  sub_1000077D4((uint64_t)v13);

  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v15(v13, v7);
}

- (void)sendClientDebugError:(int64_t)a3
{
  uint64_t v4 = self;
  sub_100007B34(a3);
}

@end