@interface GenerativeModelsAvailable
+ (BOOL)retrieveGenerativeModelsAvailable;
- (_TtC14analyticsagent25GenerativeModelsAvailable)init;
@end

@implementation GenerativeModelsAvailable

+ (BOOL)retrieveGenerativeModelsAvailable
{
  uint64_t v2 = _s14analyticsagent25GenerativeModelsAvailableC08retrievebcD10AndReasonsSS_So13OS_xpc_object_ptyFZ_0();
  uint64_t v4 = v3;
  swift_unknownObjectRelease(v5);
  if (v2 == 0x6C62616C69617661LL && v4 == 0xE900000000000065LL)
  {
    swift_bridgeObjectRelease(0xE900000000000065LL);
    char v6 = 1;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, 0x6C62616C69617661LL, 0xE900000000000065LL, 0LL);
    swift_bridgeObjectRelease(v4);
  }

  return v6 & 1;
}

- (_TtC14analyticsagent25GenerativeModelsAvailable)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeModelsAvailable();
  return -[GenerativeModelsAvailable init](&v3, "init");
}

@end