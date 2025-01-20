@interface ReadAnnouncementIntentHandler
- (_TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler)init;
- (void)confirmReadAnnouncement:(INReadAnnouncementIntent *)a3 completion:(id)a4;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)handleReadAnnouncement:(INReadAnnouncementIntent *)a3 completion:(id)a4;
@end

@implementation ReadAnnouncementIntentHandler

- (void)dealloc
{
  v2 = self;
  sub_100008C10();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ReadAnnouncementIntentHandler(0LL);
  -[ReadAnnouncementIntentHandler dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession));
  sub_10000BCE0( (uint64_t)self + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier,  (uint64_t *)&unk_1000216E0);
  sub_10000BCE0( (uint64_t)self + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler____lazy_storage___logger,  (uint64_t *)&unk_100021AA0);
}

- (void)confirmReadAnnouncement:(INReadAnnouncementIntent *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003B38((uint64_t *)&unk_1000218C8);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_10001CBD8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_10001CC00, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100021958;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_10001CC28, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100021960;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100015D3C((uint64_t)v9, (uint64_t)&unk_100021968, (uint64_t)v14);
  swift_release(v17);
}

- (void)handleReadAnnouncement:(INReadAnnouncementIntent *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003B38((uint64_t *)&unk_1000218C8);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_10001CB60, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_10001CB88, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100021938;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_10001CBB0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100021940;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100015D3C((uint64_t)v9, (uint64_t)&unk_100021948, (uint64_t)v14);
  swift_release(v17);
}

- (_TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions) = 0LL;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce) = 0LL;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession) = 0LL;
  objc_super v3 = (char *)self + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(v3, 1LL, 1LL, v4);
  v5 = (char *)self + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler____lazy_storage___logger;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReadAnnouncementIntentHandler(0LL);
  return -[ReadAnnouncementIntentHandler init](&v8, "init");
}

- (void)connectionInterrupted
{
  v2 = self;
  sub_100008C10();
}

@end