@interface Server
- (_TtC18CompanionUIService6Server)init;
- (void)presentBanner:(CPSUIBannerRequest *)a3 reply:(id)a4;
- (void)revokeAllBannersWithReply:(id)a3;
- (void)revokeBannerWithIdentifier:(NSString *)a3 withReply:(id)a4;
@end

@implementation Server

- (void)presentBanner:(CPSUIBannerRequest *)a3 reply:(id)a4
{
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject(&unk_10000C928, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  v12 = (void *)swift_allocObject(&unk_10000C950, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100011AF8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject(&unk_10000C978, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100011B00;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  uint64_t v16 = sub_10000507C((uint64_t)v8, (uint64_t)&unk_100011B08, (uint64_t)v13);
  swift_release(v16);
}

- (void)revokeBannerWithIdentifier:(NSString *)a3 withReply:(id)a4
{
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject(&unk_10000C8B0, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  v12 = (void *)swift_allocObject(&unk_10000C8D8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100011AD8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject(&unk_10000C900, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100011AE0;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  uint64_t v16 = sub_10000507C((uint64_t)v8, (uint64_t)&unk_100011AE8, (uint64_t)v13);
  swift_release(v16);
}

- (void)revokeAllBannersWithReply:(id)a3
{
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject(&unk_10000C810, 32LL, 7LL);
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v6, 1LL, 1LL, v9);
  v10 = (void *)swift_allocObject(&unk_10000C838, 48LL, 7LL);
  v10[2] = 0LL;
  v10[3] = 0LL;
  v10[4] = &unk_100011A98;
  v10[5] = v8;
  uint64_t v11 = (void *)swift_allocObject(&unk_10000C860, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100011AA8;
  v11[5] = v10;
  v12 = self;
  uint64_t v13 = sub_10000507C((uint64_t)v6, (uint64_t)&unk_100011AB8, (uint64_t)v11);
  swift_release(v13);
}

- (_TtC18CompanionUIService6Server)init
{
  uint64_t v3 = OBJC_IVAR____TtC18CompanionUIService6Server_connectionManager;
  id v4 = objc_allocWithZone((Class)type metadata accessor for ConnectionManager());
  uint64_t v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 init];
  uint64_t v6 = OBJC_IVAR____TtC18CompanionUIService6Server_bannerController;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)[objc_allocWithZone((Class)type metadata accessor for BannerController()) init];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for Server();
  return -[Server init](&v8, "init");
}

- (void).cxx_destruct
{
}

@end