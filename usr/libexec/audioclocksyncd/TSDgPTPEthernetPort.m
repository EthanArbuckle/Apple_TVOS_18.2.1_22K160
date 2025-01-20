@interface TSDgPTPEthernetPort
+ (id)diagnosticInfoForService:(id)a3;
- (TSDgPTPEthernetPort)initWithService:(id)a3 pid:(int)a4;
- (id)_destinationAddressString;
- (id)_sourceAddressString;
- (id)propertiesForXPC;
- (int)portType;
@end

@implementation TSDgPTPEthernetPort

- (TSDgPTPEthernetPort)initWithService:(id)a3 pid:(int)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TSDgPTPEthernetPort;
  return -[TSDgPTPFDPtPPort initWithService:pid:](&v5, "initWithService:pid:", a3, *(void *)&a4);
}

- (id)_sourceAddressString
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDgPTPEthernetPort;
  id v3 = -[TSDgPTPNetworkPort _sourceAddressString](&v10, "_sourceAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"SourceMACAddress"]);

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
  return @"01:80:c2:00:00:0e";
}

- (int)portType
{
  return 1;
}

- (id)propertiesForXPC
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TSDgPTPEthernetPort;
  id v3 = -[TSDgPTPNetworkPort propertiesForXPC](&v8, "propertiesForXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"SourceMACAddress"]);
  [v4 setObject:v6 forKeyedSubscript:@"SourceMACAddress"];

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___TSDgPTPEthernetPort;
  id v3 = a3;
  id v4 = objc_msgSendSuper2(&v11, "diagnosticInfoForService:", v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v5 setObject:v6 forKeyedSubscript:@"PortType"];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"SourceMACAddress"]);
  if (v7)
  {
    objc_super v8 = (unsigned __int8 *)[v7 bytes];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",  *v8,  v8[1],  v8[2],  v8[3],  v8[4],  v8[5],  v11.receiver,  v11.super_class));
    [v5 setObject:v9 forKeyedSubscript:@"SourceAddress"];
  }

  [v5 setObject:@"01:80:c2:00:00:0e" forKeyedSubscript:@"DestinationAddress"];

  return v5;
}

@end