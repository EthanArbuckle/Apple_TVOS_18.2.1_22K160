@interface CSDSpeechAssetManager
- (CSDSpeechAssetManager)init;
- (CSDSpeechAssetManager)initWithQueue:(id)a3;
- (void)handleCurrentLocaleDidChange;
@end

@implementation CSDSpeechAssetManager

- (CSDSpeechAssetManager)initWithQueue:(id)a3
{
  return (CSDSpeechAssetManager *)sub_1001F902C(a3);
}

- (void)handleCurrentLocaleDidChange
{
  v2 = self;
  sub_1001F963C();
}

- (CSDSpeechAssetManager)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CSDSpeechAssetManager_languageManager;
  uint64_t v4 = sub_1001FAE3C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDSpeechAssetManager____lazy_storage___downloadSpeechAssetPath),  *(void *)&self->hasSpeechAssets[OBJC_IVAR___CSDSpeechAssetManager____lazy_storage___downloadSpeechAssetPath]);
}

@end