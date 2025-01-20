@interface PPSBundleService
- (_TtC34PosterPlatformSupportBundleService16PPSBundleService)init;
- (void)hostConfigurationForBundleAtURL:(NSURL *)a3 forRole:(NSString *)a4 completion:(id)a5;
@end

@implementation PPSBundleService

- (void)hostConfigurationForBundleAtURL:(NSURL *)a3 forRole:(NSString *)a4 completion:(id)a5
{
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject(&unk_100008390, 48LL, 7LL);
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 1LL, 1LL, v13);
  v14 = (void *)swift_allocObject(&unk_1000083B8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10000CB40;
  v14[5] = v12;
  v15 = (void *)swift_allocObject(&unk_1000083E0, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_10000CB50;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  uint64_t v19 = sub_1000051D8((uint64_t)v10, (uint64_t)&unk_10000CB60, (uint64_t)v15);
  swift_release(v19);
}

- (_TtC34PosterPlatformSupportBundleService16PPSBundleService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PPSBundleService();
  return -[PPSBundleService init](&v3, "init");
}

@end