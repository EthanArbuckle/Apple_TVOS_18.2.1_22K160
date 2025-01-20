@interface TSDgPTPUnicastUDPv4EtEPort
+ (id)diagnosticInfoForService:(id)a3;
- (NSNumber)destinationIPv4Address;
- (TSDgPTPUnicastUDPv4EtEPort)initWithService:(id)a3 pid:(int)a4;
- (id)_destinationAddressString;
- (id)_destinationIPv4Address;
- (id)_sourceAddressString;
- (id)propertiesForXPC;
- (int)portType;
@end

@implementation TSDgPTPUnicastUDPv4EtEPort

- (TSDgPTPUnicastUDPv4EtEPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastUDPv4EtEPort;
  v4 = -[TSDgPTPFDEtEPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(void *)&a4);
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPUnicastUDPv4EtEPort _destinationIPv4Address](v4, "_destinationIPv4Address"));
    destinationIPv4Address = v5->_destinationIPv4Address;
    v5->_destinationIPv4Address = (NSNumber *)v6;
  }

  return v5;
}

- (id)_sourceAddressString
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastUDPv4EtEPort;
  id v3 = -[TSDgPTPNetworkPort _sourceAddressString](&v10, "_sourceAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"SourceIPAddress"]);

  if (v6)
  {
    unsigned int v7 = [v6 unsignedIntValue];
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u.%u.%u.%u",  HIBYTE(v7),  BYTE2(v7),  BYTE1(v7),  v7));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationAddressString
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastUDPv4EtEPort;
  id v3 = -[TSDgPTPNetworkPort _destinationAddressString](&v10, "_destinationAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"DestinationIPAddress"]);

  if (v6)
  {
    unsigned int v7 = [v6 unsignedIntValue];
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u.%u.%u.%u",  HIBYTE(v7),  BYTE2(v7),  BYTE1(v7),  v7));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationIPv4Address
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"DestinationIPAddress"]);

  return v3;
}

- (int)portType
{
  return 6;
}

- (id)propertiesForXPC
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastUDPv4EtEPort;
  id v3 = -[TSDgPTPNetworkPort propertiesForXPC](&v10, "propertiesForXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"SourceIPAddress"]);
  [v4 setObject:v6 forKeyedSubscript:@"SourceIPAddress"];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iodPropertyForKey:@"DestinationIPAddress"]);
  [v4 setObject:v8 forKeyedSubscript:@"DestinationIPAddress"];

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v4 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___TSDgPTPUnicastUDPv4EtEPort;
  id v5 = objc_msgSendSuper2(&v16, "diagnosticInfoForService:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 6LL));
  [v6 setObject:v7 forKeyedSubscript:@"PortType"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 iodPropertyForKey:@"SourceIPAddress"]);
  objc_super v9 = v8;
  if (v8)
  {
    unsigned int v10 = [v8 unsignedIntValue];
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u.%u.%u.%u",  HIBYTE(v10),  BYTE2(v10),  BYTE1(v10),  v10));
    [v6 setObject:v11 forKeyedSubscript:@"SourceAddress"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 iodPropertyForKey:@"DestinationIPAddress"]);

  if (v12)
  {
    unsigned int v13 = [v12 unsignedIntValue];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u.%u.%u.%u",  HIBYTE(v13),  BYTE2(v13),  BYTE1(v13),  v13));
    [v6 setObject:v14 forKeyedSubscript:@"DestinationAddress"];
  }

  return v6;
}

- (NSNumber)destinationIPv4Address
{
  return self->_destinationIPv4Address;
}

- (void).cxx_destruct
{
}

@end