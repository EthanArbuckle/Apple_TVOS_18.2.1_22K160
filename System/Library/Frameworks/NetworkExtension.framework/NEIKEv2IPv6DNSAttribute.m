@interface NEIKEv2IPv6DNSAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv6DNSAttribute

+ (id)copyTypeDescription
{
  return @"IPv6 DNS";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 10LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 10LL;
}

- (unint64_t)valueType
{
  return 2LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedIPv6DNS";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedIPv6DNS";
  }
  return v4;
}

@end