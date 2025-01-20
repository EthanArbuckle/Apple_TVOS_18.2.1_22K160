@interface GroupSessionUIManagerImplementation
- (_TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation)init;
- (void)bannerWithRequestIdentifier:(id)a3 didReceiveEvent:(unint64_t)a4;
- (void)beginObservingSession:(id)a3;
- (void)dealloc;
- (void)dismissDiscoveredSession:(id)a3;
- (void)dismissJoinRequest:(id)a3;
- (void)displayDiscoveredSession:(id)a3 dismissalHandler:(id)a4;
- (void)displayJoinRequest:(id)a3 handler:(id)a4;
- (void)handleDisplayMonitorChangeNotification:(id)a3;
- (void)nearbyGroupSessionDismissed:(id)a3;
- (void)openMusicForDiscoveredSession:(id)a3 foreground:(BOOL)a4 completion:(id)a5;
- (void)openMusicParticipantManagementWithCompletion:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation GroupSessionUIManagerImplementation

- (_TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation)init
{
  return (_TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation *)sub_1002A8C40();
}

- (void)dealloc
{
  v2 = self;
  sub_1002A920C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_notificationCenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation____lazy_storage___uiController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_bannerCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_queue));
  sub_1002B133C( *(void **)((char *)&self->super.isa + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_discoveredSessionContext),  *(void **)&self->notificationCenter[OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_discoveredSessionContext],  *(void *)&self->$__lazy_storage_$_uiController[OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_discoveredSessionContext],  *(void *)&self->bannerCenter[OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_discoveredSessionContext]);
  sub_100183478( (uint64_t)self + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_observedSession);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)beginObservingSession:(id)a3
{
  v5 = self;
  sub_1002A9468(a3);
  swift_unknownObjectRelease(a3);
}

- (void)handleDisplayMonitorChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002AF5B8();
}

- (void)displayDiscoveredSession:(id)a3 dismissalHandler:(id)a4
{
}

- (void)dismissDiscoveredSession:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  sub_1002AA2C8(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)displayJoinRequest:(id)a3 handler:(id)a4
{
}

- (void)dismissJoinRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1002ABB44(v4);
}

- (void)openMusicForDiscoveredSession:(id)a3 foreground:(BOOL)a4 completion:(id)a5
{
  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_1003AD910, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    v8 = sub_1001EFCC8;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = a3;
  v11 = self;
  sub_1002ABDA0((uint64_t)v10, a4, (uint64_t)v8, v9);
  sub_100162944((uint64_t)v8, v9);
}

- (void)openMusicParticipantManagementWithCompletion:(id)a3
{
  uint64_t v5 = sub_100156B68(&qword_1003FC438);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_1003AD8E8, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    v8 = sub_1001EF4F4;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = self;
  URL.init(string:)(0xD00000000000001DLL, 0x8000000100341A40LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1LL, v11) == 1)
  {
    __break(1u);
  }

  else
  {
    sub_1002AC114((uint64_t)v7, 1, (uint64_t)v8, v9);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
    sub_100162944((uint64_t)v8, v9);
  }

- (void)bannerWithRequestIdentifier:(id)a3 didReceiveEvent:(unint64_t)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;
  uint64_t v9 = self;
  sub_1002AD320(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)nearbyGroupSessionDismissed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1002AD84C(v4);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  unint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject(&unk_1003AD8C0, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  sub_1002AFBF0(v11, v9);

  swift_release(v9);
}

@end