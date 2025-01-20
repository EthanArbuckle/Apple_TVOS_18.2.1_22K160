@interface NEIKEv2DNSDomainAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
@end

@implementation NEIKEv2DNSDomainAttribute

+ (id)copyTypeDescription
{
  return @"DNS Domain";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 25LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 25LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedDNSDomain";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedDNSDomain";
  }
  return v4;
}

@end