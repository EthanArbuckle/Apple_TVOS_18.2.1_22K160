@interface JSDevice
- (BOOL)isBundle;
- (NSString)os;
- (NSString)osVersion;
- (NSString)productType;
- (_TtC14amsengagementd8JSDevice)init;
@end

@implementation JSDevice

- (BOOL)isBundle
{
  v2 = self;
  unsigned __int8 v3 = sub_10008F120();

  return v3 & 1;
}

- (NSString)productType
{
  return (NSString *)sub_100085B84(self, (uint64_t)a2, (void (*)(void))sub_10008F154);
}

- (NSString)os
{
  return (NSString *)sub_100085B84(self, (uint64_t)a2, (void (*)(void))sub_10008F16C);
}

- (NSString)osVersion
{
  return (NSString *)sub_100085B84(self, (uint64_t)a2, (void (*)(void))sub_10008F184);
}

- (_TtC14amsengagementd8JSDevice)init
{
  return (_TtC14amsengagementd8JSDevice *)sub_10008F1EC();
}

@end