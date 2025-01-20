@interface LSRAssets
- (_TtC22localspeechrecognition9LSRAssets)init;
- (void)getContextualNamedEntitySourcesForApplication:(id)a3 taskName:(id)a4 reply:(id)a5;
- (void)getContextualRankedContactSourcesForApplication:(id)a3 taskName:(id)a4 reply:(id)a5;
- (void)getGeoLMRegionIDForLatitude:(double)a3 longitude:(double)a4 reply:(id)a5;
- (void)getModelPropertiesWithReply:(id)a3;
@end

@implementation LSRAssets

- (void)getModelPropertiesWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100011478((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (void)getContextualNamedEntitySourcesForApplication:(id)a3 taskName:(id)a4 reply:(id)a5
{
}

- (void)getContextualRankedContactSourcesForApplication:(id)a3 taskName:(id)a4 reply:(id)a5
{
}

- (void)getGeoLMRegionIDForLatitude:(double)a3 longitude:(double)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = self;
  sub_1000125FC((uint64_t)v9, (void (**)(void, NSString))v8, a3, a4);
  _Block_release(v8);
}

- (_TtC22localspeechrecognition9LSRAssets)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_locale;
  type metadata accessor for Locale(0LL);
  sub_10001420C();
  v4(v3);
  sub_10001416C(OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language);
  sub_10001416C(OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_clientID);
  sub_1000140A8((uint64_t)self + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelOverridePath, &qword_10005C230);
  v5 = (char *)self + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_configurationFile;
  uint64_t v6 = type metadata accessor for URL(0LL);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelRoot, v6);
  sub_10001416C(OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelVersion);
  sub_10001416C(OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelTaskNames));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelSamplingRates));
  sub_1000136CC(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData));
  sub_1000136CC(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper));
}

@end