@interface PlayAnnouncementSoundIntentHandler
- (_TtC23AnnounceIntentExtension34PlayAnnouncementSoundIntentHandler)init;
- (void)handlePlayAnnouncementSound:(INPlayAnnouncementSoundIntent *)a3 completion:(id)a4;
@end

@implementation PlayAnnouncementSoundIntentHandler

- (void)handlePlayAnnouncementSound:(INPlayAnnouncementSoundIntent *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003B38((uint64_t *)&unk_1000218C8);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_10001CE78, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_10001CEA0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100021B98;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_10001CEC8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100021940;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100015D3C((uint64_t)v9, (uint64_t)&unk_100021948, (uint64_t)v14);
  swift_release(v17);
}

- (_TtC23AnnounceIntentExtension34PlayAnnouncementSoundIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlayAnnouncementSoundIntentHandler();
  return -[PlayAnnouncementSoundIntentHandler init](&v3, "init");
}

@end