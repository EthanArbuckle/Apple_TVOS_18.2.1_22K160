@interface NSString
- (BOOL)isValidIPv4Address;
- (BOOL)isValidIPv4AddressWithSubnetMask:(id)a3;
- (BOOL)isValidIPv6Address;
- (BOOL)isValidSubnetMask;
@end

@implementation NSString

- (BOOL)isValidSubnetMask
{
  return inet_pton(2, -[NSString cStringUsingEncoding:](self, "cStringUsingEncoding:", 4LL), v3) == 1;
}

- (BOOL)isValidIPv4Address
{
  return inet_pton( 2, -[NSString cStringUsingEncoding:](self, "cStringUsingEncoding:", 4LL), &v4) == 1 && (v4 - 1) < 0xFFFFFFFE;
}

- (BOOL)isValidIPv4AddressWithSubnetMask:(id)a3
{
  id v4 = a3;
  if (-[NSString isValidIPv4Address](self, "isValidIPv4Address") && [v4 isValidSubnetMask])
  {
    if (-[NSString hasPrefix:](self, "hasPrefix:", @"169.254.")) {
      unsigned int v5 = [v4 isEqualToString:@"255.255.0.0"] ^ 1;
    }
    else {
      LOBYTE(v5) = 1;
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isValidIPv6Address
{
  if (inet_pton(30, -[NSString cStringUsingEncoding:](self, "cStringUsingEncoding:", 1LL), &v3) != 1
    || v3 == 254 && (v4 & 0xC0) == 0x80)
  {
    return 0;
  }

  BOOL result = 1;
  if (v3 == 255 && (v4 & 0xF0) != 0x30) {
    return (v4 & 0xF) != 2;
  }
  return result;
}

@end