@interface JSClientObject
- (BOOL)anonymousMetrics;
- (BOOL)isBinCompat;
- (BOOL)isCatalyst;
- (NSDictionary)metricsOverlay;
- (NSString)identifier;
- (NSString)mediaIdentifier;
- (NSString)version;
- (_TtC34AppleMediaServicesUIDynamicService14JSClientObject)init;
@end

@implementation JSClientObject

- (BOOL)anonymousMetrics
{
  return sub_100013D78() & 1;
}

- (NSString)identifier
{
  return (NSString *)sub_100013EA0(self, (uint64_t)a2, (void (*)(void))sub_100013D94);
}

- (BOOL)isBinCompat
{
  return 0;
}

- (BOOL)isCatalyst
{
  return 0;
}

- (NSString)mediaIdentifier
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (NSDictionary)metricsOverlay
{
  uint64_t v2 = sub_100013E80();
  if (v2)
  {
    uint64_t v3 = v2;
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    v4.super.isa = 0LL;
  }

  return (NSDictionary *)v4.super.isa;
}

- (NSString)version
{
  return (NSString *)sub_100013EA0(self, (uint64_t)a2, (void (*)(void))sub_100013EF8);
}

- (_TtC34AppleMediaServicesUIDynamicService14JSClientObject)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_clientInfo));
  swift_bridgeObjectRelease(*(void *)&self->clientInfo[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_mediaClient]);
  swift_bridgeObjectRelease(*(void *)&self->clientInfo[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_metricsContext]);
}

@end