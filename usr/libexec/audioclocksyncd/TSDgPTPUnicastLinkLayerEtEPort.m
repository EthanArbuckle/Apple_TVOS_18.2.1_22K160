@interface TSDgPTPUnicastLinkLayerEtEPort
+ (id)diagnosticInfoForService:(id)a3;
- (NSData)destinationMACAddress;
- (TSDgPTPUnicastLinkLayerEtEPort)initWithService:(id)a3 pid:(int)a4;
- (id)_destinationAddressString;
- (id)_destinationMACAddress;
- (id)_sourceAddressString;
- (id)propertiesForXPC;
- (int)portType;
@end

@implementation TSDgPTPUnicastLinkLayerEtEPort

- (TSDgPTPUnicastLinkLayerEtEPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastLinkLayerEtEPort;
  v4 = -[TSDgPTPFDEtEPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(void *)&a4);
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPUnicastLinkLayerEtEPort _destinationMACAddress](v4, "_destinationMACAddress"));
    destinationMACAddress = v5->_destinationMACAddress;
    v5->_destinationMACAddress = (NSData *)v6;
  }

  return v5;
}

- (id)_sourceAddressString
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastLinkLayerEtEPort;
  id v3 = -[TSDgPTPNetworkPort _sourceAddressString](&v10, "_sourceAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"SourceMACAddress"]);

  if (v6)
  {
    v7 = (unsigned __int8 *)[v6 bytes];
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",  *v7,  v7[1],  v7[2],  v7[3],  v7[4],  v7[5]));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationAddressString
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastLinkLayerEtEPort;
  id v3 = -[TSDgPTPNetworkPort _destinationAddressString](&v10, "_destinationAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"DestinationMACAddress"]);

  if (v6)
  {
    v7 = (unsigned __int8 *)[v6 bytes];
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",  *v7,  v7[1],  v7[2],  v7[3],  v7[4],  v7[5]));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_destinationMACAddress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"DestinationMACAddress"]);

  return v3;
}

- (int)portType
{
  return 5;
}

- (id)propertiesForXPC
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPUnicastLinkLayerEtEPort;
  id v3 = -[TSDgPTPNetworkPort propertiesForXPC](&v10, "propertiesForXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"SourceMACAddress"]);
  [v4 setObject:v6 forKeyedSubscript:@"SourceMACAddress"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iodPropertyForKey:@"DestinationMACAddress"]);
  [v4 setObject:v8 forKeyedSubscript:@"DestinationMACAddress"];

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v4 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___TSDgPTPUnicastLinkLayerEtEPort;
  id v5 = objc_msgSendSuper2(&v16, "diagnosticInfoForService:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 5LL));
  [v6 setObject:v7 forKeyedSubscript:@"PortType"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 iodPropertyForKey:@"SourceMACAddress"]);
  objc_super v9 = v8;
  if (v8)
  {
    objc_super v10 = (unsigned __int8 *)[v8 bytes];
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",  *v10,  v10[1],  v10[2],  v10[3],  v10[4],  v10[5]));
    [v6 setObject:v11 forKeyedSubscript:@"SourceAddress"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 iodPropertyForKey:@"DestinationMACAddress"]);

  if (v12)
  {
    v13 = (unsigned __int8 *)[v12 bytes];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",  *v13,  v13[1],  v13[2],  v13[3],  v13[4],  v13[5]));
    [v6 setObject:v14 forKeyedSubscript:@"DestinationAddress"];
  }

  return v6;
}

- (NSData)destinationMACAddress
{
  return self->_destinationMACAddress;
}

- (void).cxx_destruct
{
}

@end