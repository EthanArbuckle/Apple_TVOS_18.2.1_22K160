@interface JSDeviceObject
- (BOOL)supportsHEIF;
- (NSString)buildType;
- (NSString)guid;
- (NSString)language;
- (NSString)modelPartNumber;
- (NSString)productType;
- (NSString)serial;
- (_TtC16UtilityExtension14JSDeviceObject)init;
@end

@implementation JSDeviceObject

- (NSString)buildType
{
  return (NSString *)sub_100014A60(self, (uint64_t)a2, (void (*)(void))sub_1000175E4);
}

- (NSString)guid
{
  return (NSString *)sub_100014A60(self, (uint64_t)a2, (void (*)(void))sub_10001765C);
}

- (NSString)language
{
  return (NSString *)sub_100014A60(self, (uint64_t)a2, (void (*)(void))sub_100017674);
}

- (NSString)modelPartNumber
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE000000000000000LL);
  return (NSString *)v2;
}

- (NSString)productType
{
  return (NSString *)sub_100014A60(self, (uint64_t)a2, (void (*)(void))sub_1000176C0);
}

- (NSString)serial
{
  return (NSString *)sub_100014A60(self, (uint64_t)a2, (void (*)(void))sub_100017734);
}

- (BOOL)supportsHEIF
{
  return 1;
}

- (_TtC16UtilityExtension14JSDeviceObject)init
{
  return (_TtC16UtilityExtension14JSDeviceObject *)sub_10001777C();
}

@end