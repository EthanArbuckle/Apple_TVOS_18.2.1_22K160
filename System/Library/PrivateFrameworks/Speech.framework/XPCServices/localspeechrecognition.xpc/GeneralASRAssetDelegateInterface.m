@interface GeneralASRAssetDelegateInterface
+ (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface)sharedInstance;
- (NSDictionary)statusForLanguage;
- (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface)init;
- (void)assetStatus:(id)a3;
- (void)dealloc;
- (void)setStatusForLanguage:(id)a3;
@end

@implementation GeneralASRAssetDelegateInterface

+ (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface)sharedInstance
{
  return (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface *) sub_100025FC0( &qword_10005A298,  (id *)&qword_10005C910);
}

- (NSDictionary)statusForLanguage
{
  return (NSDictionary *)sub_100026030((uint64_t)self, (uint64_t)a2, sub_10002607C);
}

- (void)setStatusForLanguage:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  v5 = self;
  sub_1000260E8(v4);
}

- (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface)init
{
  return (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface *)sub_1000260F4( &OBJC_IVAR____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface_assetManager,  &OBJC_IVAR____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface_statusForLanguage,  type metadata accessor for GeneralASRAssetDelegateInterface,  7LL);
}

- (void)assetStatus:(id)a3
{
}

- (void)dealloc
{
  v2 = self;
  sub_100026638();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface_assetManager));
  sub_100028B04(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface_statusForLanguage));
}

@end