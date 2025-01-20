@interface NEIKEv2SupportedAttribute
+ (id)copyTypeDescription;
- (BOOL)validForChildlessSA;
- (id)attributeName;
- (unint64_t)attributeType;
@end

@implementation NEIKEv2SupportedAttribute

+ (id)copyTypeDescription
{
  return @"Supported Attributes";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 14LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 14LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedSupportedAttribute";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedSupportedAttribute";
  }
  return v4;
}

- (BOOL)validForChildlessSA
{
  return 1;
}

@end