@interface SendAnnouncementIntentHandler
- (_TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler)init;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)handleSendAnnouncement:(INSendAnnouncementIntent *)a3 completion:(id)a4;
- (void)resolveAnnouncementForSendAnnouncement:(INSendAnnouncementIntent *)a3 withCompletion:(id)a4;
- (void)resolveRecipientsForSendAnnouncement:(INSendAnnouncementIntent *)a3 withCompletion:(id)a4;
@end

@implementation SendAnnouncementIntentHandler

- (_TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce) = 0LL;
  v3 = (char *)self + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler____lazy_storage___logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(v3, 1LL, 1LL, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SendAnnouncementIntentHandler(0LL);
  return -[SendAnnouncementIntentHandler init](&v6, "init");
}

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce;
  uint64_t v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce);
  v5 = self;
  if (v4)
  {
    [v4 setDelegate:0];
    objc_super v6 = *(Class *)((char *)&self->super.super.isa + v3);
  }

  else
  {
    objc_super v6 = 0LL;
  }

  *(Class *)((char *)&self->super.super.isa + v3) = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SendAnnouncementIntentHandler(0LL);
  -[SendAnnouncementIntentHandler dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce));
  sub_10000BCE0( (uint64_t)self + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler____lazy_storage___logger,  (uint64_t *)&unk_100021AA0);
}

- (void)resolveAnnouncementForSendAnnouncement:(INSendAnnouncementIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7 = sub_100003B38((uint64_t *)&unk_1000218C8);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_10001CE00, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_10001CE28, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100021AE8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_10001CE50, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100021AF0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100015D3C((uint64_t)v9, (uint64_t)&unk_100021AF8, (uint64_t)v14);
  swift_release(v17);
}

- (void)resolveRecipientsForSendAnnouncement:(INSendAnnouncementIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7 = sub_100003B38((uint64_t *)&unk_1000218C8);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_10001CD88, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_10001CDB0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100021AC8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_10001CDD8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100021AD0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100015D3C((uint64_t)v9, (uint64_t)&unk_100021AD8, (uint64_t)v14);
  swift_release(v17);
}

- (void)handleSendAnnouncement:(INSendAnnouncementIntent *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003B38((uint64_t *)&unk_1000218C8);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_10001CD10, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_10001CD38, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100021AB8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_10001CD60, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100021940;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100015D3C((uint64_t)v9, (uint64_t)&unk_100021948, (uint64_t)v14);
  swift_release(v17);
}

- (void)connectionInterrupted
{
  uint64_t v2 = OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce;
  uint64_t v3 = *(void **)&a1[OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce];
  uint64_t v4 = a1;
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