@interface NEIKEv2IPv4DNSAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv4DNSAttribute

+ (id)copyTypeDescription
{
  return @"IPv4 DNS";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 3LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 3LL;
}

- (unint64_t)valueType
{
  return 1LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedIPv4DNS";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedIPv4DNS";
  }
  return v4;
}

@end