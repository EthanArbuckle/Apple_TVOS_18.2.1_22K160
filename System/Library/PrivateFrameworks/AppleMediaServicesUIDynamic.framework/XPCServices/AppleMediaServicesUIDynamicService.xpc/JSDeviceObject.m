@interface JSDeviceObject
- (BOOL)supportsHEIF;
- (NSString)buildType;
- (NSString)guid;
- (NSString)language;
- (NSString)modelPartNumber;
- (NSString)productType;
- (NSString)serial;
- (_TtC34AppleMediaServicesUIDynamicService14JSDeviceObject)init;
@end

@implementation JSDeviceObject

- (NSString)buildType
{
  return (NSString *)sub_100013EA0(self, (uint64_t)a2, (void (*)(void))sub_100016A24);
}

- (NSString)guid
{
  return (NSString *)sub_100013EA0(self, (uint64_t)a2, (void (*)(void))sub_100016A9C);
}

- (NSString)language
{
  return (NSString *)sub_100013EA0(self, (uint64_t)a2, (void (*)(void))sub_100016AB4);
}

- (NSString)modelPartNumber
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE000000000000000LL);
  return (NSString *)v2;
}

- (NSString)productType
{
  return (NSString *)sub_100013EA0(self, (uint64_t)a2, (void (*)(void))sub_100016B00);
}

- (NSString)serial
{
  return (NSString *)sub_100013EA0(self, (uint64_t)a2, (void (*)(void))sub_100016B74);
}

- (BOOL)supportsHEIF
{
  return 1;
}

- (_TtC34AppleMediaServicesUIDynamicService14JSDeviceObject)init
{
  return (_TtC34AppleMediaServicesUIDynamicService14JSDeviceObject *)sub_100016BBC();
}

@end