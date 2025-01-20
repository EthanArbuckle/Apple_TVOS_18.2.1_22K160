@interface NEIKEv2IPv6PCSCFAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv6PCSCFAttribute

+ (id)copyTypeDescription
{
  return @"IPv6 PCSCF";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 21LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 21LL;
}

- (unint64_t)valueType
{
  return 2LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedIPv6PCSCF_STD";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedIPv6PCSCF_STD";
  }
  return v4;
}

@end