@interface WiFiUsageNetworkIPv6Details
- (BOOL)isValid;
- (NSArray)ipv6Addresses;
- (WiFiUsageNetworkIPv6Details)initWithDictionary:(id)a3;
- (id)description;
- (void)setIpv6Addresses:(id)a3;
- (void)setIsValid:(BOOL)a3;
@end

@implementation WiFiUsageNetworkIPv6Details

- (WiFiUsageNetworkIPv6Details)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkIPv6Details;
  v5 = -[WiFiUsageNetworkIPv6Details init](&v10, sel_init);
  if (v5)
  {
    [v4 objectForKey:*MEMORY[0x18960C730]];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
    {
      -[WiFiUsageNetworkIPv6Details setIpv6Addresses:](v5, "setIpv6Addresses:", v6);
      uint64_t v7 = 1LL;
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    -[WiFiUsageNetworkIPv6Details setIsValid:](v5, "setIsValid:", v7);
    v8 = v5;
  }

  return v5;
}

- (id)description
{
  if (self->_isValid)
  {
    [NSString stringWithFormat:@"addresses:%@", self->_ipv6Addresses];
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v2 = @"N/A";
  }

  return v2;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end