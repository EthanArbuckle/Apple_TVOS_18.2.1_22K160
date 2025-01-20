@interface JSLocalizationObject
- (NSDictionary)strings;
- (_TtC34AppleMediaServicesUIDynamicService20JSLocalizationObject)init;
@end

@implementation JSLocalizationObject

- (NSDictionary)strings
{
  uint64_t v2 = sub_100018928();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (_TtC34AppleMediaServicesUIDynamicService20JSLocalizationObject)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSLocalizationObject_localizations));
}

@end