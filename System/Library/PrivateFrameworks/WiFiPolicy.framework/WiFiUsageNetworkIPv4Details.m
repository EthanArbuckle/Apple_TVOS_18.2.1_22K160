@interface WiFiUsageNetworkIPv4Details
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)ipv4Address;
- (NSString)ipv4DefGwAddress;
- (NSString)ipv4RouterAddress;
- (NSString)ipv4RouterMacAddress;
- (NSString)ipv4Subnet;
- (WiFiUsageNetworkIPv4Details)initWithDictionary:(id)a3;
- (id)description;
- (void)setIpv4Address:(id)a3;
- (void)setIpv4DefGwAddress:(id)a3;
- (void)setIpv4RouterAddress:(id)a3;
- (void)setIpv4RouterMacAddress:(id)a3;
- (void)setIpv4Subnet:(id)a3;
- (void)setIsValid:(BOOL)a3;
@end

@implementation WiFiUsageNetworkIPv4Details

- (WiFiUsageNetworkIPv4Details)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkIPv4Details;
  v5 = -[WiFiUsageNetworkIPv4Details init](&v16, sel_init);
  if (v5)
  {
    [v4 objectForKey:*MEMORY[0x18960C6C0]];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
    {
      [v6 objectAtIndex:0];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageNetworkIPv4Details setIpv4Address:](v5, "setIpv4Address:", v7);

      uint64_t v8 = 1LL;
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    -[WiFiUsageNetworkIPv4Details setIsValid:](v5, "setIsValid:", v8);
    [v4 objectForKey:*MEMORY[0x18960C720]];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 count])
    {
      [v9 objectAtIndex:0];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageNetworkIPv4Details setIpv4Subnet:](v5, "setIpv4Subnet:", v10);
    }

    [v4 objectForKey:*MEMORY[0x18960C6B0]];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      -[WiFiUsageNetworkIPv4Details setIpv4RouterAddress:](v5, "setIpv4RouterAddress:", v11);
    }
    [v4 objectForKey:*MEMORY[0x18960C718]];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      -[WiFiUsageNetworkIPv4Details setIpv4DefGwAddress:](v5, "setIpv4DefGwAddress:", v12);
    }
    [v4 objectForKey:*MEMORY[0x18960C6A8]];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      -[WiFiUsageNetworkIPv4Details setIpv4RouterMacAddress:](v5, "setIpv4RouterMacAddress:", v13);
    }
    v14 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = -[WiFiUsageNetworkIPv4Details isValid](self, "isValid");
  v6 = -[WiFiUsageNetworkIPv4Details ipv4Address](self, "ipv4Address");
  [v4 ipv4Address];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v6 isEqualToString:v7];

  if (!v8) {
    goto LABEL_8;
  }
  v9 = -[WiFiUsageNetworkIPv4Details ipv4RouterAddress](self, "ipv4RouterAddress");
  [v4 ipv4RouterAddress];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = [v9 isEqualToString:v10];

  if (!v11) {
    goto LABEL_8;
  }
  v12 = -[WiFiUsageNetworkIPv4Details ipv4RouterMacAddress](self, "ipv4RouterMacAddress");
  [v4 ipv4RouterMacAddress];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v12 isEqualToString:v13];

  if (!v14) {
    goto LABEL_8;
  }
  v15 = -[WiFiUsageNetworkIPv4Details ipv4DefGwAddress](self, "ipv4DefGwAddress");
  [v4 ipv4DefGwAddress];
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
  int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    v18 = -[WiFiUsageNetworkIPv4Details ipv4Subnet](self, "ipv4Subnet");
    [v4 ipv4Subnet];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = [v18 isEqualToString:v19];
  }

  else
  {
LABEL_8:
    char v20 = 0;
  }

  return v20;
}

- (id)description
{
  if (self->_isValid)
  {
    [NSString stringWithFormat:@"address:%@, router:%@(%@) defaultGW:%@, subnet:%@", self->_ipv4Address, self->_ipv4RouterAddress, self->_ipv4RouterMacAddress, self->_ipv4DefGwAddress, self->_ipv4Subnet];
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

- (NSString)ipv4Address
{
  return self->_ipv4Address;
}

- (void)setIpv4Address:(id)a3
{
}

- (NSString)ipv4RouterAddress
{
  return self->_ipv4RouterAddress;
}

- (void)setIpv4RouterAddress:(id)a3
{
}

- (NSString)ipv4RouterMacAddress
{
  return self->_ipv4RouterMacAddress;
}

- (void)setIpv4RouterMacAddress:(id)a3
{
}

- (NSString)ipv4DefGwAddress
{
  return self->_ipv4DefGwAddress;
}

- (void)setIpv4DefGwAddress:(id)a3
{
}

- (NSString)ipv4Subnet
{
  return self->_ipv4Subnet;
}

- (void)setIpv4Subnet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end