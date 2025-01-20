@interface JSAccount
- (BOOL)hasFamilySharingEnabled;
- (BOOL)hasiCloudFamily;
- (BOOL)isHSA2;
- (NSDictionary)flags;
- (NSDictionary)privacyAcknowledgement;
- (NSString)altDsid;
- (NSString)credits;
- (NSString)dsid;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)lastName;
- (NSString)storefront;
- (NSString)username;
- (_TtC14amsengagementd9JSAccount)init;
@end

@implementation JSAccount

- (NSString)altDsid
{
  return (NSString *)sub_10007AA4C(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007AA34);
}

- (NSString)credits
{
  return (NSString *)sub_10007AA4C(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007AAAC);
}

- (NSString)dsid
{
  return (NSString *)sub_10007AA4C(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007AAC4);
}

- (NSString)firstName
{
  return (NSString *)sub_10007AA4C(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007AB4C);
}

- (NSDictionary)flags
{
  return (NSDictionary *)sub_10007ADDC(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007AB64);
}

- (NSString)fullName
{
  return (NSString *)sub_10007AA4C(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007AC04);
}

- (BOOL)hasFamilySharingEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_10007AC40();

  return v3 & 1;
}

- (BOOL)hasiCloudFamily
{
  v2 = self;
  unsigned __int8 v3 = sub_10007AC7C();

  return v3 & 1;
}

- (BOOL)isHSA2
{
  v2 = self;
  unsigned __int8 v3 = sub_10007AD90();

  return v3 & 1;
}

- (NSString)lastName
{
  return (NSString *)sub_10007AA4C(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007ADC4);
}

- (NSDictionary)privacyAcknowledgement
{
  return (NSDictionary *)sub_10007ADDC(self, (uint64_t)a2, sub_10007AE40);
}

- (NSString)storefront
{
  return (NSString *)sub_10007AA4C(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007AEC0);
}

- (NSString)username
{
  return (NSString *)sub_10007AA4C(self, (uint64_t)a2, (uint64_t (*)(void))sub_10007AED8);
}

- (_TtC14amsengagementd9JSAccount)init
{
}

- (void).cxx_destruct
{
}

@end