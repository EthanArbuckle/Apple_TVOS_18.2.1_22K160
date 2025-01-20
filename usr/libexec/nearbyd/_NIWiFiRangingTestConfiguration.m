@interface _NIWiFiRangingTestConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIDiscoveryToken)peerDiscoveryToken;
- (NSArray)monitoredRegions;
- (NSDictionary)parameters;
- (_NIWiFiRangingTestConfiguration)initWithCoder:(id)a3;
- (_NIWiFiRangingTestConfiguration)initWithDiscoveryToken:(id)a3 wifiRangingParameters:(id)a4 regions:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMonitoredRegions:(id)a3;
@end

@implementation _NIWiFiRangingTestConfiguration

- (_NIWiFiRangingTestConfiguration)initWithDiscoveryToken:(id)a3 wifiRangingParameters:(id)a4 regions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____NIWiFiRangingTestConfiguration;
  v12 = -[NIConfiguration initInternal](&v15, "initInternal");
  v13 = (_NIWiFiRangingTestConfiguration *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 4, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_monitoredRegions, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____NIWiFiRangingTestConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v13, "copyWithZone:");
  id v6 = -[NIDiscoveryToken copyWithZone:](self->_peerDiscoveryToken, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  if (self->_parameters)
  {
    v8 = -[NSDictionary initWithDictionary:copyItems:]( +[NSDictionary allocWithZone:](&OBJC_CLASS___NSDictionary, "allocWithZone:", a3),  "initWithDictionary:copyItems:",  self->_parameters,  1LL);
    id v9 = (void *)v5[5];
    v5[5] = v8;
  }

  if (self->_monitoredRegions)
  {
    id v10 = -[NSArray initWithArray:copyItems:]( +[NSArray allocWithZone:](&OBJC_CLASS___NSArray, "allocWithZone:", a3),  "initWithArray:copyItems:",  self->_monitoredRegions,  1LL);
    id v11 = (void *)v5[6];
    v5[6] = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NIWiFiRangingTestConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeObject:self->_peerDiscoveryToken forKey:@"peerDiscoveryToken"];
  [v4 encodeObject:self->_parameters forKey:@"parameters"];
  [v4 encodeObject:self->_monitoredRegions forKey:@"monitoredRegions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NIWiFiRangingTestConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString, v5), 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
  objc_super v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSData, v12),  0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v29[0] = objc_opt_class(&OBJC_CLASS___NSArray, v15);
  v29[1] = objc_opt_class(&OBJC_CLASS___NIRegionPredicate, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v18 forKey:@"monitoredRegions"]);

  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS____NIWiFiRangingTestConfiguration;
  v21 = -[NIConfiguration initWithCoder:](&v28, "initWithCoder:", v4);
  if (v21)
  {
    id v22 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIDiscoveryToken, v20),  @"peerDiscoveryToken");
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    peerDiscoveryToken = v21->_peerDiscoveryToken;
    v21->_peerDiscoveryToken = (NIDiscoveryToken *)v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue([v4 decodeDictionaryWithKeysOfClasses:v7 objectsOfClasses:v14 forKey:@"parameters"]);
    parameters = v21->_parameters;
    v21->_parameters = (NSDictionary *)v25;

    objc_storeStrong((id *)&v21->_monitoredRegions, v19);
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (_NIWiFiRangingTestConfiguration *)v4;
    uint64_t v8 = v7;
    if (v7 == self)
    {
      unsigned __int8 v15 = 1;
    }

    else
    {
      parameters = self->_parameters;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration parameters](v7, "parameters"));
      if (-[NSDictionary isEqual:](parameters, "isEqual:", v10))
      {
        peerDiscoveryToken = self->_peerDiscoveryToken;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration peerDiscoveryToken](v8, "peerDiscoveryToken"));
        if (-[NIDiscoveryToken isEqual:](peerDiscoveryToken, "isEqual:", v12))
        {
          monitoredRegions = self->_monitoredRegions;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration monitoredRegions](v8, "monitoredRegions"));
          unsigned __int8 v15 = -[NSArray isEqual:](monitoredRegions, "isEqual:", v14);
        }

        else
        {
          unsigned __int8 v15 = 0;
        }
      }

      else
      {
        unsigned __int8 v15 = 0;
      }
    }
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NIDiscoveryToken hash](self->_peerDiscoveryToken, "hash");
  return (unint64_t)-[NSDictionary hash](self->_parameters, "hash") ^ v3;
}

- (id)description
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration descriptionInternal](self, "descriptionInternal"));
  uint64_t v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  unint64_t v3 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", &stru_1007C41E0);
  peerDiscoveryToken = self->_peerDiscoveryToken;
  if (peerDiscoveryToken)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](peerDiscoveryToken, "descriptionInternal"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"Peer Token: %@", v5);
  }

  else
  {
    -[NSMutableString appendString:](v3, "appendString:", @"Peer Token: null");
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", WiFi Ranging Parameters: %@", self->_parameters);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", Regions: %@", self->_monitoredRegions);
  return v3;
}

- (NIDiscoveryToken)peerDiscoveryToken
{
  return self->_peerDiscoveryToken;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setMonitoredRegions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end