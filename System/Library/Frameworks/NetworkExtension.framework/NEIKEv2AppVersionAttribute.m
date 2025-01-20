@interface NEIKEv2AppVersionAttribute
+ (id)copyTypeDescription;
- (BOOL)validForChildlessSA;
- (id)attributeName;
- (unint64_t)attributeType;
@end

@implementation NEIKEv2AppVersionAttribute

+ (id)copyTypeDescription
{
  return @"App Version";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 7LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 7LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedAppVersion";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedAppVersion";
  }
  return v4;
}

- (BOOL)validForChildlessSA
{
  return 1;
}

@end