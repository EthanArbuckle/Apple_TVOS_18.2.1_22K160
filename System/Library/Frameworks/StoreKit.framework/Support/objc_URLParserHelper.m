@interface objc_URLParserHelper
+ (id)urlTypeFor:(id)a3 bag:(id)a4 error:(id *)a5;
- (_TtC9storekitd20objc_URLParserHelper)init;
@end

@implementation objc_URLParserHelper

+ (id)urlTypeFor:(id)a3 bag:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_10007B1FC((uint64_t *)&unk_10032A1C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v10 = type metadata accessor for URL(0LL);
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v10 = type metadata accessor for URL(0LL);
    uint64_t v11 = 1LL;
  }

  sub_10007D0AC((uint64_t)v9, v11, 1LL, v10);
  swift_unknownObjectRetain(a4);
  Class v12 = sub_1000D77F4((uint64_t)v9, (uint64_t)a4);
  sub_1000B3FC4((uint64_t)v9);
  swift_unknownObjectRelease(a4);
  return v12;
}

- (_TtC9storekitd20objc_URLParserHelper)init
{
  return (_TtC9storekitd20objc_URLParserHelper *)sub_1000D7AC8();
}

@end