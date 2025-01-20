@interface NEIKEv2IPv6DHCPAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv6DHCPAttribute

+ (id)copyTypeDescription
{
  return @"IPv6 DHCP";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 12LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 12LL;
}

- (unint64_t)valueType
{
  return 2LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedIPv6DHCP";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedIPv6DHCP";
  }
  return v4;
}

@end