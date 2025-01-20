@interface AssistantAssetDelegateInterface
+ (_TtC22localspeechrecognition31AssistantAssetDelegateInterface)sharedInstance;
- (NSDictionary)statusForLanguage;
- (_TtC22localspeechrecognition31AssistantAssetDelegateInterface)init;
- (void)assetStatus:(id)a3;
- (void)dealloc;
- (void)setStatusForLanguage:(id)a3;
@end

@implementation AssistantAssetDelegateInterface

+ (_TtC22localspeechrecognition31AssistantAssetDelegateInterface)sharedInstance
{
  return (_TtC22localspeechrecognition31AssistantAssetDelegateInterface *) sub_100025FC0( &qword_10005A290,  (id *)&qword_10005C908);
}

- (NSDictionary)statusForLanguage
{
  return (NSDictionary *)sub_100026030((uint64_t)self, (uint64_t)a2, sub_100025E1C);
}

- (void)setStatusForLanguage:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  v5 = self;
  sub_100025E88(v4);
}

- (_TtC22localspeechrecognition31AssistantAssetDelegateInterface)init
{
  return (_TtC22localspeechrecognition31AssistantAssetDelegateInterface *)sub_1000260F4( &OBJC_IVAR____TtC22localspeechrecognition31AssistantAssetDelegateInterface_assetManager,  &OBJC_IVAR____TtC22localspeechrecognition31AssistantAssetDelegateInterface_statusForLanguage,  type metadata accessor for AssistantAssetDelegateInterface,  3LL);
}

- (void)assetStatus:(id)a3
{
}

- (void)dealloc
{
  v2 = self;
  sub_100025EF0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition31AssistantAssetDelegateInterface_assetManager));
  sub_100028B04(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC22localspeechrecognition31AssistantAssetDelegateInterface_statusForLanguage));
}

@end