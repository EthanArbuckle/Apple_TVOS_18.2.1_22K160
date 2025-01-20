@interface NEIKEv2IPv4SubnetAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv4SubnetAttribute

+ (id)copyTypeDescription
{
  return @"IPv4 Subnet";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 13LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 13LL;
}

- (unint64_t)valueType
{
  return 3LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedIPv4Subnet";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedIPv4Subnet";
  }
  return v4;
}

@end