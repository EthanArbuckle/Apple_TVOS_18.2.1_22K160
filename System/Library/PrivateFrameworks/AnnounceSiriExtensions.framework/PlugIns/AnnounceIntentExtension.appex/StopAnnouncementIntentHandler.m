@interface StopAnnouncementIntentHandler
- (_TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler)init;
- (void)connectionInterrupted;
- (void)handleStopAnnouncement:(id)a3 completion:(id)a4;
@end

@implementation StopAnnouncementIntentHandler

- (void)handleStopAnnouncement:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10001C8B8, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100002BD8(v8, (uint64_t)sub_100003D8C, v7);

  swift_release(v7);
}

- (_TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession) = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StopAnnouncementIntentHandler();
  return -[StopAnnouncementIntentHandler init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession));
}

- (void)connectionInterrupted
{
  uint64_t v2 = OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession;
  objc_super v3 = *(void **)&a1[OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession];
  v4 = a1;
  if (v3)
  {
    [v3 setDelegate:0];
    id v5 = *(id *)&a1[v2];
  }

  else
  {
    id v5 = 0LL;
  }

  *(void *)&a1[v2] = 0LL;
}

@end