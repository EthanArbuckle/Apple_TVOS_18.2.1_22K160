@interface TSDgPTPUnicastUDPv6EtEPort
+ (id)diagnosticInfoForService:(id)a3;
- (NSData)destinationIPv6Address;
- (TSDgPTPUnicastUDPv6EtEPort)initWithService:(id)a3 pid:(int)a4;
- (id)_destinationAddressString;
- (id)_destinationIPv6Address;
- (id)_sourceAddressString;
- (id)propertiesForXPC;
- (int)portType;
@end

@implementation TSDgPTPUnicastUDPv6EtEPort

- (TSDgPTPUnicastUDPv6EtEPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastUDPv6EtEPort;
  v4 = -[TSDgPTPFDEtEPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(void *)&a4);
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPUnicastUDPv6EtEPort _destinationIPv6Address](v4, "_destinationIPv6Address"));
    destinationIPv6Address = v5->_destinationIPv6Address;
    v5->_destinationIPv6Address = (NSData *)v6;
  }

  return v5;
}

- (id)_sourceAddressString
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastUDPv6EtEPort;
  id v3 = -[TSDgPTPNetworkPort _sourceAddressString](&v10, "_sourceAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"SourceIPAddress"]);

  if (v6)
  {
    v7 = (unsigned __int8 *)[v6 bytes];
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x",  *v7,  v7[1],  v7[2],  v7[3],  v7[4],  v7[5],  v7[6],  v7[7],  v7[8],  v7[9],  v7[10],  v7[11],  v7[12],  v7[13],  v7[14],  v7[15]));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationAddressString
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastUDPv6EtEPort;
  id v3 = -[TSDgPTPNetworkPort _destinationAddressString](&v10, "_destinationAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"DestinationIPAddress"]);

  if (v6)
  {
    v7 = (unsigned __int8 *)[v6 bytes];
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x",  *v7,  v7[1],  v7[2],  v7[3],  v7[4],  v7[5],  v7[6],  v7[7],  v7[8],  v7[9],  v7[10],  v7[11],  v7[12],  v7[13],  v7[14],  v7[15]));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationIPv6Address
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"DestinationIPAddress"]);

  return v3;
}

- (int)portType
{
  return 7;
}

- (id)propertiesForXPC
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastUDPv6EtEPort;
  id v3 = -[TSDgPTPNetworkPort propertiesForXPC](&v10, "propertiesForXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"SourceIPAddress"]);
  [v4 setObject:v6 forKeyedSubscript:@"SourceIPAddress"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iodPropertyForKey:@"DestinationIPAddress"]);
  [v4 setObject:v8 forKeyedSubscript:@"DestinationIPAddress"];

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v4 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___TSDgPTPUnicastUDPv6EtEPort;
  id v5 = objc_msgSendSuper2(&v16, "diagnosticInfoForService:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 7LL));
  [v6 setObject:v7 forKeyedSubscript:@"PortType"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 iodPropertyForKey:@"SourceIPAddress"]);
  objc_super v9 = v8;
  if (v8)
  {
    objc_super v10 = (unsigned __int8 *)[v8 bytes];
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x",  *v10,  v10[1],  v10[2],  v10[3],  v10[4],  v10[5],  v10[6],  v10[7],  v10[8],  v10[9],  v10[10],  v10[11],  v10[12],  v10[13],  v10[14],  v10[15]));
    [v6 setObject:v11 forKeyedSubscript:@"SourceAddress"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 iodPropertyForKey:@"DestinationIPAddress"]);

  if (v12)
  {
    v13 = (unsigned __int8 *)[v12 bytes];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x",  *v13,  v13[1],  v13[2],  v13[3],  v13[4],  v13[5],  v13[6],  v13[7],  v13[8],  v13[9],  v13[10],  v13[11],  v13[12],  v13[13],  v13[14],  v13[15]));
    [v6 setObject:v14 forKeyedSubscript:@"DestinationAddress"];
  }

  return v6;
}

- (NSData)destinationIPv6Address
{
  return self->_destinationIPv6Address;
}

- (void).cxx_destruct
{
}

@end