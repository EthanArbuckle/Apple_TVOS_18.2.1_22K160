@interface WiFiUsageRangingSession
- (WiFiUsageRangingSession)init;
- (id)metricName;
- (id)sessionSummary:(BOOL)a3;
- (void)addRangingRttSampleWithRssi:(int64_t)a3 rtt:(int64_t)a4 snr:(unint64_t)a5 flags:(unint64_t)a6 channel:(unint64_t)a7 coreId:(unint64_t)a8 bitErrorRate:(unint64_t)a9 phyError:(unint64_t)a10 andPeerSnr:(unint64_t)a11 andPeerCoreId:(unint64_t)a12 andPeerBitErrorRate:(unint64_t)a13 andPeerPhyError:(unint64_t)a14;
- (void)rangingCompletedWithValidCount:(unint64_t)a3 resultStatus:(int64_t)a4 resultFlags:(unint64_t)a5;
- (void)rangingLinkUp;
- (void)rangingSessionRequestedWithSelfPreferredChannel:(unint64_t)a3 selfMainChannel:(unint64_t)a4 selfChannelFlags:(unint64_t)a5 peerPreferredChannel:(unint64_t)a6 peerMainChannel:(unint64_t)a7 peerChannelFlags:(unint64_t)a8 requester:(id)a9;
- (void)rangingStartedWithNumMeasurements:(unint64_t)a3;
@end

@implementation WiFiUsageRangingSession

- (WiFiUsageRangingSession)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiUsageRangingSession;
  v2 = -[WiFiUsageRangingSession init](&v9, sel_init);
  sessionStartTimestamp = v2->_sessionStartTimestamp;
  v2->_sessionStartTimestamp = 0LL;

  sessionLinkUpTimestamp = v2->_sessionLinkUpTimestamp;
  v2->_sessionLinkUpTimestamp = 0LL;

  peerDiscoveryTimestamp = v2->_peerDiscoveryTimestamp;
  v2->_peerDiscoveryTimestamp = 0LL;

  rangingStartedTimestamp = v2->_rangingStartedTimestamp;
  v2->_rangingStartedTimestamp = 0LL;

  rangingCompletionTimestamp = v2->_rangingCompletionTimestamp;
  v2->_rangingCompletionTimestamp = 0LL;

  return v2;
}

- (void)rangingSessionRequestedWithSelfPreferredChannel:(unint64_t)a3 selfMainChannel:(unint64_t)a4 selfChannelFlags:(unint64_t)a5 peerPreferredChannel:(unint64_t)a6 peerMainChannel:(unint64_t)a7 peerChannelFlags:(unint64_t)a8 requester:(id)a9
{
  v16 = (void *)MEMORY[0x189603F50];
  id v17 = a9;
  [v16 date];
  v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
  sessionStartTimestamp = self->_sessionStartTimestamp;
  self->_sessionStartTimestamp = v18;

  self->_selfPreferredChannel = a3;
  self->_selfMainChannel = a4;
  self->_selfChannelFlags = a5;
  self->_peerPreferredChannel = a6;
  self->_peerMainChannel = a7;
  self->_peerChannelFlags = a8;
  v20 = (NSString *)[v17 copy];

  requester = self->_requester;
  self->_requester = v20;

  sessionLinkUpTimestamp = self->_sessionLinkUpTimestamp;
  self->_sessionLinkUpTimestamp = 0LL;

  peerDiscoveryTimestamp = self->_peerDiscoveryTimestamp;
  self->_peerDiscoveryTimestamp = 0LL;

  rangingStartedTimestamp = self->_rangingStartedTimestamp;
  self->_rangingStartedTimestamp = 0LL;

  rangingCompletionTimestamp = self->_rangingCompletionTimestamp;
  self->_rangingCompletionTimestamp = 0LL;

  *(_OWORD *)&self->_measurementStatus = 0u;
  *(_OWORD *)&self->_linkUpLatency = 0u;
  *(_OWORD *)&self->_numRequestedMeasurements = 0u;
  -[NSMutableArray removeAllObjects](self->_rttSamples, "removeAllObjects");
}

- (void)rangingLinkUp
{
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  sessionLinkUpTimestamp = self->_sessionLinkUpTimestamp;
  self->_sessionLinkUpTimestamp = v3;
}

- (void)rangingStartedWithNumMeasurements:(unint64_t)a3
{
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (!self->_sessionLinkUpTimestamp) {
    objc_storeStrong((id *)&self->_sessionLinkUpTimestamp, v5);
  }
  if (!self->_peerDiscoveryTimestamp) {
    objc_storeStrong((id *)&self->_peerDiscoveryTimestamp, v5);
  }
  rangingStartedTimestamp = self->_rangingStartedTimestamp;
  self->_rangingStartedTimestamp = v5;
  v7 = v5;

  self->_numRequestedMeasurements = a3;
  -[NSMutableArray removeAllObjects](self->_rttSamples, "removeAllObjects");

  self->_numValidMeasurements = 0LL;
  self->_measurementStatus = 0LL;
  self->_measurementFlags = 0LL;
}

- (void)rangingCompletedWithValidCount:(unint64_t)a3 resultStatus:(int64_t)a4 resultFlags:(unint64_t)a5
{
  objc_super v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  rangingCompletionTimestamp = self->_rangingCompletionTimestamp;
  self->_rangingCompletionTimestamp = v9;

  self->_numValidMeasurements = a3;
  self->_measurementStatus = a4;
  self->_measurementFlags = a5;
  if (self->_sessionStartTimestamp)
  {
    peerDiscoveryTimestamp = self->_peerDiscoveryTimestamp;
    if (peerDiscoveryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](peerDiscoveryTimestamp, "timeIntervalSinceDate:");
      self->_linkUpLatency = v12;
    }
  }

  if (self->_rangingStartedTimestamp)
  {
    v13 = self->_rangingCompletionTimestamp;
    if (v13)
    {
      -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:");
      self->_rangingLatency = v14;
    }
  }

- (void)addRangingRttSampleWithRssi:(int64_t)a3 rtt:(int64_t)a4 snr:(unint64_t)a5 flags:(unint64_t)a6 channel:(unint64_t)a7 coreId:(unint64_t)a8 bitErrorRate:(unint64_t)a9 phyError:(unint64_t)a10 andPeerSnr:(unint64_t)a11 andPeerCoreId:(unint64_t)a12 andPeerBitErrorRate:(unint64_t)a13 andPeerPhyError:(unint64_t)a14
{
  v24 = objc_alloc_init(&OBJC_CLASS___WiFiUsageRangingRttSample);
  -[WiFiUsageRangingRttSample setRssi:](v24, "setRssi:", a3);
  -[WiFiUsageRangingRttSample setRtt:](v24, "setRtt:", a4);
  -[WiFiUsageRangingRttSample setFlags:](v24, "setFlags:", a6);
  -[WiFiUsageRangingRttSample setChannel:](v24, "setChannel:", a7);
  -[WiFiUsageRangingRttSample setSelfSnr:](v24, "setSelfSnr:", a5);
  -[WiFiUsageRangingRttSample setSelfCoreId:](v24, "setSelfCoreId:", a8);
  -[WiFiUsageRangingRttSample setSelfBitErrorRate:](v24, "setSelfBitErrorRate:", a9);
  -[WiFiUsageRangingRttSample setSelfPhyError:](v24, "setSelfPhyError:", a10);
  -[WiFiUsageRangingRttSample setPeerSnr:](v24, "setPeerSnr:", a11);
  -[WiFiUsageRangingRttSample setPeerCoreId:](v24, "setPeerCoreId:", a12);
  -[WiFiUsageRangingRttSample setPeerBitErrorRate:](v24, "setPeerBitErrorRate:", a13);
  -[WiFiUsageRangingRttSample setPeerPhyError:](v24, "setPeerPhyError:", a14);
  rttSamples = self->_rttSamples;
  if (!rttSamples)
  {
    [MEMORY[0x189603FA8] array];
    v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v23 = self->_rttSamples;
    self->_rttSamples = v22;

    rttSamples = self->_rttSamples;
  }

  -[NSMutableArray addObject:](rttSamples, "addObject:", v24, a12);
}

- (id)metricName
{
  return @"com.apple.wifi.rangingsession";
}

- (id)sessionSummary:(BOOL)a3
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x189603FC8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:@"Ranging" forKeyedSubscript:@"SessionName"];
  [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)(self->_linkUpLatency * 1000.0)];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:@"LinkLatency"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)(self->_rangingLatency * 1000.0)];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"RangingLatency"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_numRequestedMeasurements];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"RequestedMeasurements"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_numValidMeasurements];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKeyedSubscript:@"ValidMeasurements"];

  [MEMORY[0x189607968] numberWithInteger:self->_measurementStatus];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKeyedSubscript:@"MeasurementStatus"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_measurementFlags];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v10 forKeyedSubscript:@"MeasurementFlags"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_selfMainChannel];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKeyedSubscript:@"SelfMainChannel"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_selfPreferredChannel];
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKeyedSubscript:@"SelfPreferredChannel"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_selfChannelFlags];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKeyedSubscript:@"SelfChannelFlags"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_peerMainChannel];
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v14 forKeyedSubscript:@"PeerMainChannel"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_peerPreferredChannel];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v15 forKeyedSubscript:@"PeerPreferredChannel"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_peerChannelFlags];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v16 forKeyedSubscript:@"PeerChannelFlags"];

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  obj = self->_rttSamples;
  uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v53,  16LL);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 1LL;
    uint64_t v48 = *(void *)v50;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v50 != v48) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v49 + 1) + 8 * v20);
        objc_msgSend(NSString, "stringWithFormat:", @"SampleRSSI%d", v19 + v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v21, "rssi"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v23 forKeyedSubscript:v22];

        objc_msgSend(NSString, "stringWithFormat:", @"SampleRTT%d", v19 + v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v21, "rtt"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v25 forKeyedSubscript:v24];

        objc_msgSend(NSString, "stringWithFormat:", @"SampleFlags%d", v19 + v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v21, "flags"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v27 forKeyedSubscript:v26];

        objc_msgSend(NSString, "stringWithFormat:", @"SampleChannel%d", v19 + v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v21, "channel"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v29 forKeyedSubscript:v28];

        objc_msgSend(NSString, "stringWithFormat:", @"SampleSelfSNR%d", v19 + v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v21, "selfSnr"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v31 forKeyedSubscript:v30];

        objc_msgSend(NSString, "stringWithFormat:", @"SampleSelfCoreID%d", v19 + v20);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v21, "selfCoreId"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v33 forKeyedSubscript:v32];

        objc_msgSend(NSString, "stringWithFormat:", @"SampleSelfBER%d", v19 + v20);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v21, "selfBitErrorRate"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v35 forKeyedSubscript:v34];

        objc_msgSend(NSString, "stringWithFormat:", @"SampleSelfPHYError%d", v19 + v20);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v21, "selfPhyError"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v37 forKeyedSubscript:v36];

        objc_msgSend(NSString, "stringWithFormat:", @"SamplePeerSNR%d", v19 + v20);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v21, "peerSnr"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v39 forKeyedSubscript:v38];

        objc_msgSend(NSString, "stringWithFormat:", @"SamplePeerCoreID%d", v19 + v20);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v21, "peerCoreId"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v41 forKeyedSubscript:v40];

        objc_msgSend(NSString, "stringWithFormat:", @"SamplePeerBER%d", v19 + v20);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v21, "peerBitErrorRate"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v43 forKeyedSubscript:v42];

        objc_msgSend(NSString, "stringWithFormat:", @"SamplePeerPHYError%d", v19 + v20);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v21, "peerPhyError"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v45 forKeyedSubscript:v44];

        ++v20;
      }

      while (v18 != v20);
      uint64_t v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v53,  16LL);
      uint64_t v19 = (v19 + v20);
    }

    while (v18);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end