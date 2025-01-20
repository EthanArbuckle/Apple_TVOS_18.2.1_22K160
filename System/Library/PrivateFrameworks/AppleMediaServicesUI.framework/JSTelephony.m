@interface JSTelephony
- (BOOL)hasTelephonyCapability;
- (BOOL)hasTelephonyEntitlement;
- (NSString)countryCode;
- (NSString)networkCode;
- (NSString)phoneNumber;
- (NSString)providerName;
- (NSString)radioTechnology;
- (NSString)radioType;
- (NSString)simStatus;
- (_TtC14amsengagementd11JSTelephony)init;
@end

@implementation JSTelephony

- (NSString)countryCode
{
  return (NSString *)0LL;
}

- (NSString)networkCode
{
  return (NSString *)0LL;
}

- (NSString)phoneNumber
{
  return (NSString *)0LL;
}

- (NSString)providerName
{
  return (NSString *)0LL;
}

- (NSString)radioTechnology
{
  return (NSString *)0LL;
}

- (NSString)radioType
{
  return (NSString *)0LL;
}

- (_TtC14amsengagementd11JSTelephony)init
{
  return (_TtC14amsengagementd11JSTelephony *)sub_1000B0B60();
}

- (NSString)simStatus
{
  v2 = self;
  sub_1000B1628();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)hasTelephonyCapability
{
  v2 = self;
  char v3 = sub_1000B16C8();

  return v3 & 1;
}

- (BOOL)hasTelephonyEntitlement
{
  v2 = self;
  char v3 = sub_1000B1728();

  return v3 & 1;
}

- (void).cxx_destruct
{
}

@end