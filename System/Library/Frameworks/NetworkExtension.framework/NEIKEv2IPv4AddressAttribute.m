@interface NEIKEv2IPv4AddressAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv4AddressAttribute

+ (id)copyTypeDescription
{
  return @"IPv4 Address";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 1LL;
  }
  if (self->super._customType <= 1) {
    return 1LL;
  }
  return self->super._customType;
}

- (unint64_t)valueType
{
  return 1LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedIPv4Address";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedIPv4Address";
  }
  return v4;
}

@end