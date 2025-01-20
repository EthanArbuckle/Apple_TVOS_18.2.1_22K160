@interface HomePodUIManager
- (_TtC12mediaremoted16HomePodUIManager)init;
- (void)beginObservingSession:(id)a3;
- (void)dismissJoinRequest:(id)a3;
- (void)displayDiscoveredSession:(id)a3 dismissalHandler:(id)a4;
- (void)displayJoinRequest:(id)a3 handler:(id)a4;
- (void)openMusicForDiscoveredSession:(id)a3 foreground:(BOOL)a4 completion:(id)a5;
- (void)openMusicParticipantManagementWithCompletion:(id)a3;
@end

@implementation HomePodUIManager

- (void)displayJoinRequest:(id)a3 handler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1003A7160, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1001F3DEC(v8, (void (*)(uint64_t))sub_1001F49B4);

  swift_release(v7);
}

- (void)dismissJoinRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001F4348((uint64_t)v4);
}

- (void)displayDiscoveredSession:(id)a3 dismissalHandler:(id)a4
{
  id v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void)openMusicForDiscoveredSession:(id)a3 foreground:(BOOL)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  if (v7)
  {
    id v8 = (void (**)(void, void))v7;
    type metadata accessor for MRGroupSessionError(0LL);
    uint64_t v10 = v9;
    uint64_t v16 = 9LL;
    id v11 = a3;
    v12 = self;
    _Block_copy(v8);
    uint64_t v13 = sub_100156FEC( &qword_1003F8630,  (uint64_t (*)(uint64_t))type metadata accessor for MRGroupSessionError,  (uint64_t)&unk_10034D5B0);
    sub_1001FC09C((uint64_t)&v16, 0xD00000000000001FLL, 0x800000010033C870LL, 0LL, v10, v13, (uint64_t)&v17);
    v14 = v17;
    v15 = (void *)_convertErrorToNSError(_:)(v17);
    ((void (**)(void, void *))v8)[2](v8, v15);

    _Block_release(v8);
    _Block_release(v8);
  }

- (void)openMusicParticipantManagementWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = (void (**)(void, void))v4;
    type metadata accessor for MRGroupSessionError(0LL);
    uint64_t v7 = v6;
    uint64_t v12 = 9LL;
    id v8 = self;
    _Block_copy(v5);
    uint64_t v9 = sub_100156FEC( &qword_1003F8630,  (uint64_t (*)(uint64_t))type metadata accessor for MRGroupSessionError,  (uint64_t)&unk_10034D5B0);
    sub_1001FC09C((uint64_t)&v12, 0xD00000000000001FLL, 0x800000010033C870LL, 0LL, v7, v9, (uint64_t)&v13);
    uint64_t v10 = v13;
    id v11 = (void *)_convertErrorToNSError(_:)(v13);
    ((void (**)(void, void *))v5)[2](v5, v11);

    _Block_release(v5);
    _Block_release(v5);
  }

- (void)beginObservingSession:(id)a3
{
  v5 = *(void (**)(id))((swift_isaMask & (uint64_t)self->super.isa) + 0x68);
  swift_unknownObjectRetain_n(a3, 2LL);
  uint64_t v6 = self;
  v5(a3);
  swift_unknownObjectRelease(a3);
}

- (_TtC12mediaremoted16HomePodUIManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12mediaremoted16HomePodUIManager_currentSession) = 0LL;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12mediaremoted16HomePodUIManager____lazy_storage___proxyAuthorizationSender) = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomePodUIManager();
  return -[HomePodUIManager init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12mediaremoted16HomePodUIManager_currentSession));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremoted16HomePodUIManager____lazy_storage___proxyAuthorizationSender));
}

@end