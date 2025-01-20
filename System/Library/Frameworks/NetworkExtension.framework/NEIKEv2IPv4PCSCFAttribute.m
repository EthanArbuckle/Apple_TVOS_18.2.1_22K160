@interface NEIKEv2IPv4PCSCFAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv4PCSCFAttribute

+ (id)copyTypeDescription
{
  return @"IPv4 PCSCF";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 20LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 20LL;
}

- (unint64_t)valueType
{
  return 1LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedIPv4PCSCF_STD";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedIPv4PCSCF_STD";
  }
  return v4;
}

@end