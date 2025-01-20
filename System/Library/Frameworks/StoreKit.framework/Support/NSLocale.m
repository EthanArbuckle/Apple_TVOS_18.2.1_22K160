@interface NSLocale
+ (id)sk_localeWithBagLanguageCode:(id)a3 currencyCode:(id)a4;
@end

@implementation NSLocale

+ (id)sk_localeWithBagLanguageCode:(id)a3 currencyCode:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v10 = v9;
  Class v11 = sub_1000CB9F4(v5, v7, v8, v9);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v10);
  return v11;
}

@end