@interface NEIKEv2IPv6SubnetAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv6SubnetAttribute

+ (id)copyTypeDescription
{
  return @"IPv6 Subnet";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 15LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 15LL;
}

- (unint64_t)valueType
{
  return 4LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedIPv6Subnet";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedIPv6Subnet";
  }
  return v4;
}

@end