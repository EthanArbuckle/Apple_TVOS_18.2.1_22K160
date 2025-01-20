@interface NRSCDInterfaceConfig
- (id)description;
@end

@implementation NRSCDInterfaceConfig

- (id)description
{
  v3 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"NRSCDInterfaceConfig[");
  interfaceName = self->_interfaceName;
  uint64_t interfaceIndex = self->_interfaceIndex;
  v6 = self->_ipv4Addresses;
  if (!-[NSMutableArray count](v6, "count"))
  {
    id v7 = -[NSMutableArray count](self->_ipv6Addresses, "count");

    if (v7) {
      goto LABEL_6;
    }
LABEL_7:
    v8 = "!";
    goto LABEL_8;
  }

LABEL_6:
  v8 = "";
LABEL_8:
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@(%u), %savailable, v4:[%@], v6:[%@]",  interfaceName,  interfaceIndex,  v8,  self->_ipv4Addresses,  self->_ipv6Addresses);
  -[NSMutableString appendString:](v3, "appendString:", @"]");
  return v3;
}

- (void).cxx_destruct
{
}

@end