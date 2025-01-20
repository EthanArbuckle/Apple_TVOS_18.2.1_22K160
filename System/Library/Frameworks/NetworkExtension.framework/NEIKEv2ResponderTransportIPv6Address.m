@interface NEIKEv2ResponderTransportIPv6Address
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2ResponderTransportIPv6Address

+ (id)copyTypeDescription
{
  return @"IPv6 Responder Transport Address";
}

- (unint64_t)attributeType
{
  if (!self) {
    return 25959LL;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 25959LL;
}

- (unint64_t)valueType
{
  return 2LL;
}

- (id)attributeName
{
  if (!self) {
    return @"AssignedResponderTransportIPv6Address";
  }
  if (self->super._customType && objc_getProperty(self, a2, 8LL, 1)) {
    v4 = (__CFString *)objc_getProperty(self, v3, 8LL, 1);
  }
  else {
    v4 = @"AssignedResponderTransportIPv6Address";
  }
  return v4;
}

@end