@interface WiFi3BarsNetwork
+ (BOOL)supportsSecureCoding;
- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3;
- (BOOL)matched;
- (BOOL)unwantedNetworkName;
- (NSSet)accessPoints;
- (NSSet)attributes;
- (NSString)SSID;
- (NSString)description;
- (NSString)password;
- (NSString)uniqueIdentifier;
- (TBNetwork)network;
- (TBScore)popularityScore;
- (TBScore)qualityScore;
- (WiFi3BarsNetwork)initWithCoder:(id)a3;
- (WiFi3BarsNetwork)initWithNetwork:(id)a3;
- (int64_t)source;
- (unint64_t)type;
- (unint64_t)venueGroup;
- (unsigned)venueType;
- (void)encodeWithCoder:(id)a3;
- (void)setMatched:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setSSID:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUnwantedNetworkName:(BOOL)a3;
@end

@implementation WiFi3BarsNetwork

- (WiFi3BarsNetwork)initWithNetwork:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___WiFi3BarsNetwork;
  v6 = -[WiFi3BarsNetwork init](&v28, sel_init);
  p_network = (id *)&v6->_network;
  objc_storeStrong((id *)&v6->_network, a3);
  uint64_t v8 = [v5 remoteIdentifier];
  uniqueIdentifier = v6->_uniqueIdentifier;
  v6->_uniqueIdentifier = (NSString *)v8;

  [MEMORY[0x189603FE0] set];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_type = [v5 type];
  v6->_venueGroup = [v5 venueGroup];
  v6->_venueType = [v5 venueType];
  v11 = -[TBNetwork popularityScore](v6->_network, "popularityScore");
  if (v11)
  {
    uint64_t v12 = -[TBNetwork popularityScore](v6->_network, "popularityScore");
  }

  else
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    objc_msgSend(v5, "accessPoints", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0LL;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) popularityScore];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 += [v19 score];
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v15);
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    uint64_t v12 = +[TBPopularityScore popularityScoreWithValue:](&OBJC_CLASS___TBPopularityScore, "popularityScoreWithValue:", v16);
  }

  popularityScore = v6->_popularityScore;
  v6->_popularityScore = (TBScore *)v12;

  if ([v10 count])
  {
    uint64_t v21 = [MEMORY[0x189604010] setWithSet:v10];
    attributes = v6->_attributes;
    v6->_attributes = (NSSet *)v21;
  }

  return v6;
}

- (NSSet)accessPoints
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 accessPoints];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (int64_t)source
{
  return 2LL;
}

- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[WiFi3BarsNetwork network](self, "network");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 accessPointCount];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1895BA820]();
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v28 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      __int128 v26 = self;
      __int128 v27 = v7;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          -[WiFi3BarsNetwork network](self, "network");
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 accessPoints];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0LL; j != v17; ++j)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                [*(id *)(*((void *)&v29 + 1) + 8 * j) BSSID];
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                char v21 = [v13 isEqualToString:v20];

                if ((v21 & 1) != 0)
                {

                  BOOL v22 = 1;
                  v7 = v27;
                  goto LABEL_20;
                }
              }

              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v25;
          self = v26;
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
        BOOL v22 = 0;
        v7 = v27;
      }

      while (v10);
    }

    else
    {
      BOOL v22 = 0;
    }

- (NSString)description
{
  v3 = (void *)MEMORY[0x189607940];
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WiFi3BarsNetwork SSID](self, "SSID");
  [v6 appendFormat:@"SSID: %@ ", v7];

  -[WiFi3BarsNetwork network](self, "network");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", @"APS: %lu ", objc_msgSend(v8, "accessPointCount"));

  -[WiFi3BarsNetwork password](self, "password");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = @"YES";
  if (!v9) {
    uint64_t v10 = @"NO";
  }
  [v6 appendFormat:@"Password: %@ ", v10];

  -[WiFi3BarsNetwork uniqueIdentifier](self, "uniqueIdentifier");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"Identifier: %@ ", v11];

  -[WiFi3BarsNetwork popularityScore](self, "popularityScore");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", @"Score: %lu", objc_msgSend(v12, "score"));

  [v6 appendString:@">"];
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  password = self->password;
  id v5 = a3;
  [v5 encodeObject:password forKey:@"password"];
  [v5 encodeObject:self->_attributes forKey:@"_attributes"];
  [v5 encodeObject:self->_qualityScore forKey:@"_qualityScore"];
  [v5 encodeObject:self->_popularityScore forKey:@"_popularityScore"];
  [v5 encodeBool:self->matched forKey:@"matched"];
  [v5 encodeInteger:self->_type forKey:@"_type"];
  [v5 encodeInteger:self->_venueGroup forKey:@"_venueGroup"];
  [v5 encodeInt32:self->_venueType forKey:@"_venueType"];
  [v5 encodeObject:self->_uniqueIdentifier forKey:@"_uniqueIdentifier"];
  [v5 encodeObject:self->_SSID forKey:@"_SSID"];
  [v5 encodeBool:self->_unwantedNetworkName forKey:@"_unwantedNetworkName"];
}

- (WiFi3BarsNetwork)initWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___WiFi3BarsNetwork;
  id v3 = a3;
  id v4 = -[WiFi3BarsNetwork init](&v24, sel_init);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
  password = v4->password;
  v4->password = (NSString *)v5;

  v7 = (void *)MEMORY[0x189604010];
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0, v24.receiver, v24.super_class);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v3 decodeObjectOfClasses:v9 forKey:@"_attributes"];
  attributes = v4->_attributes;
  v4->_attributes = (NSSet *)v10;

  uint64_t v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_qualityScore"];
  qualityScore = v4->_qualityScore;
  v4->_qualityScore = (TBScore *)v12;

  uint64_t v14 = (void *)MEMORY[0x189604010];
  uint64_t v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v3 decodeObjectOfClasses:v16 forKey:@"_popularityScore"];
  popularityScore = v4->_popularityScore;
  v4->_popularityScore = (TBScore *)v17;

  v4->matched = [v3 decodeBoolForKey:@"matched"];
  v4->_type = (int)[v3 decodeIntForKey:@"_type"];
  v4->_venueGroup = (int)[v3 decodeIntForKey:@"_venueGroup"];
  v4->_venueType = [v3 decodeInt32ForKey:@"_venueType"];
  uint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueIdentifier"];
  uniqueIdentifier = v4->_uniqueIdentifier;
  v4->_uniqueIdentifier = (NSString *)v19;

  uint64_t v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_SSID"];
  SSID = v4->_SSID;
  v4->_SSID = (NSString *)v21;

  LOBYTE(v16) = [v3 decodeBoolForKey:@"_unwantedNetworkName"];
  v4->_unwantedNetworkName = (char)v16;
  return v4;
}

- (NSString)password
{
  return self->password;
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (TBScore)qualityScore
{
  return self->_qualityScore;
}

- (TBScore)popularityScore
{
  return self->_popularityScore;
}

- (BOOL)matched
{
  return self->matched;
}

- (void)setMatched:(BOOL)a3
{
  self->matched = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)venueGroup
{
  return self->_venueGroup;
}

- (unsigned)venueType
{
  return self->_venueType;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (TBNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (BOOL)unwantedNetworkName
{
  return self->_unwantedNetworkName;
}

- (void)setUnwantedNetworkName:(BOOL)a3
{
  self->_unwantedNetworkName = a3;
}

- (void).cxx_destruct
{
}

@end