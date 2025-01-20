@interface WiFiAvailabilityMatch
+ (id)matchWithNetwork:(id)a3 scannedNetwork:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAvailabilityMatch:(id)a3;
- (BOOL)isEqualToScannedNetwork:(id)a3;
- (BOOL)unwantedNetworkName;
- (NSDate)matchedAt;
- (NSString)SSID;
- (WiFiAvailabilityMatch)initWithNetwork:(id)a3 scannedNetwork:(id)a4;
- (WiFiCandidateNetwork)network;
- (WiFiScannedNetwork)scannedNetwork;
- (id)description;
- (int64_t)priority;
- (unint64_t)hash;
- (void)setMatchedAt:(id)a3;
- (void)setScannedNetwork:(id)a3;
- (void)setUnwantedNetworkName:(BOOL)a3;
@end

@implementation WiFiAvailabilityMatch

+ (id)matchWithNetwork:(id)a3 scannedNetwork:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setMatched:1];
  v7 = -[WiFiAvailabilityMatch initWithNetwork:scannedNetwork:]( objc_alloc(&OBJC_CLASS___WiFiAvailabilityMatch),  "initWithNetwork:scannedNetwork:",  v6,  v5);

  return v7;
}

- (WiFiAvailabilityMatch)initWithNetwork:(id)a3 scannedNetwork:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___WiFiAvailabilityMatch;
  v9 = -[WiFiAvailabilityMatch init](&v30, sel_init);
  v10 = v9;
  if (!v9)
  {
    matchedAt = 0LL;
    goto LABEL_19;
  }

  if (!v7)
  {
    NSLog(@"%s: missing candidate network", "-[WiFiAvailabilityMatch initWithNetwork:scannedNetwork:]");
    matchedAt = v10;
    v10 = 0LL;
    goto LABEL_19;
  }

  objc_storeStrong((id *)&v9->_network, a3);
  p_scannedNetwork = (id *)&v10->_scannedNetwork;
  objc_storeStrong((id *)&v10->_scannedNetwork, a4);
  uint64_t v12 = -[WiFiCandidateNetwork SSID](v10->_network, "SSID");
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[WiFiCandidateNetwork SSID](v10->_network, "SSID");
    uint64_t v15 = [v14 length];

    if (v15)
    {
      network = v10->_network;
LABEL_9:
      v21 = -[WiFiCandidateNetwork SSID](network, "SSID");
      uint64_t v22 = [v21 copy];
      SSID = v10->_SSID;
      v10->_SSID = (NSString *)v22;
LABEL_10:

      goto LABEL_12;
    }
  }

  uint64_t v17 = [*p_scannedNetwork SSID];
  if (v17)
  {
    v18 = (void *)v17;
    [*p_scannedNetwork SSID];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 length];

    if (v20)
    {
      network = v10->_scannedNetwork;
      goto LABEL_9;
    }
  }

  if (!v10->_SSID)
  {
    v21 = -[WiFiScannedNetwork scanProperties](v10->_scannedNetwork, "scanProperties");
    [v21 objectForKey:@"SSID_STR"];
    SSID = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [SSID copy];
    v29 = v10->_SSID;
    v10->_SSID = (NSString *)v28;

    goto LABEL_10;
  }

- (BOOL)isEqualToScannedNetwork:(id)a3
{
  if (!a3) {
    return 0;
  }
  [a3 SSID];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAvailabilityMatch network](self, "network");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 SSID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v4 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[WiFiAvailabilityMatch isEqualToAvailabilityMatch:](self, "isEqualToAvailabilityMatch:", v4);

  return v5;
}

- (BOOL)isEqualToAvailabilityMatch:(id)a3
{
  id v4 = a3;
  -[WiFiAvailabilityMatch SSID](self, "SSID");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 SSID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 isEqualToString:v6])
  {
    -[WiFiAvailabilityMatch network](self, "network");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 source];
    [v4 network];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = v8 == [v9 source];
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x189607940];
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiAvailabilityMatch network](self, "network");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", @"Source: %ld ", objc_msgSend(v7, "source"));

  -[WiFiAvailabilityMatch SSID](self, "SSID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"SSID: %@ ", v8];
  v9 = -[WiFiAvailabilityMatch scannedNetwork](self, "scannedNetwork");
  if (v9)
  {
    -[WiFiAvailabilityMatch scannedNetwork](self, "scannedNetwork");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", @"RSSI: %ld ", objc_msgSend(v10, "RSSI"));
  }

  else
  {
    objc_msgSend(v6, "appendFormat:", @"RSSI: %ld ", 0);
  }
  v11 = -[WiFiAvailabilityMatch matchedAt](self, "matchedAt");
  [v6 appendFormat:@"MatchedAt: %@ ", v11];

  if (-[WiFiAvailabilityMatch unwantedNetworkName](self, "unwantedNetworkName")) {
    [v6 appendString:@"unwantedNetworkName: 1"];
  }
  [v6 appendString:@">"];
  return v6;
}

- (int64_t)priority
{
  return self->_priority;
}

- (WiFiCandidateNetwork)network
{
  return self->_network;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (WiFiScannedNetwork)scannedNetwork
{
  return self->_scannedNetwork;
}

- (void)setScannedNetwork:(id)a3
{
}

- (NSDate)matchedAt
{
  return self->_matchedAt;
}

- (void)setMatchedAt:(id)a3
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