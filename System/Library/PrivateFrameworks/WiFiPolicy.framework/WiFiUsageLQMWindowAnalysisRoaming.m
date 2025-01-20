@interface WiFiUsageLQMWindowAnalysisRoaming
+ (BOOL)isColocatedRoam:(id)a3;
+ (BOOL)isWNMRoam:(id)a3;
+ (id)bssSupportWithFlags:(id)a3;
- ($6E47B81FEB72AA1B248A20B58E3F028F)roamConfigCriteria;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamConfigChannels;
- (BOOL)firstRoamAfterRoamRecommLifted;
- (BOOL)isColocatedRoam;
- (BOOL)isWNMScoreRoam;
- (NSString)roamBssSupports;
- (NSString)roamingReason;
- (NSString)roamingStatus;
- (WiFiUsageLQMWindowAnalysisRoaming)initWithRollingWindow:(id)a3 WithRoamingState:(BOOL)a4 andReasonString:(id)a5 andStatus:(unint64_t)a6 asString:(id)a7 andLatency:(unint64_t)a8 andRoamData:(id)a9 andCurrentBSSSession:(id)a10 andContext:(context)a11 andPingPongStats:(id)a12 andTimestamp:(id)a13 onQueue:(id)a14;
- (WiFiUsageSessionPingPongStats)pingPongStats;
- (double)roamSuppressionWaitForRoamEnd;
- (double)roamSuppressionWaitForRoamStart;
- (id)addDimensionsTo:(id)a3;
- (int64_t)latency;
- (int64_t)originRssi;
- (int64_t)roamConfigTriggerRssi;
- (int64_t)scanDuration;
- (int64_t)targetRssi;
- (unint64_t)roamFullBandScanCount;
- (unint64_t)roamPartialBandScanCount;
- (unint64_t)roamPktsPendingAqm;
- (unint64_t)roamPktsPendingTxSubQ;
- (unint64_t)roamScannedChannelCount;
- (unint64_t)roamSuppressionEnabledPerc;
- (void)setFirstRoamAfterRoamRecommLifted:(BOOL)a3;
- (void)setIsColocatedRoam:(BOOL)a3;
- (void)setIsWNMScoreRoam:(BOOL)a3;
- (void)setLatency:(int64_t)a3;
- (void)setOriginRssi:(int64_t)a3;
- (void)setPingPongStats:(id)a3;
- (void)setRoamBssSupports:(id)a3;
- (void)setRoamConfigChannels:(id *)a3;
- (void)setRoamConfigCriteria:(id *)a3;
- (void)setRoamConfigTriggerRssi:(int64_t)a3;
- (void)setRoamFullBandScanCount:(unint64_t)a3;
- (void)setRoamPartialBandScanCount:(unint64_t)a3;
- (void)setRoamPktsPendingAqm:(unint64_t)a3;
- (void)setRoamPktsPendingTxSubQ:(unint64_t)a3;
- (void)setRoamScannedChannelCount:(unint64_t)a3;
- (void)setRoamSuppressionEnabledPerc:(unint64_t)a3;
- (void)setRoamSuppressionWaitForRoamEnd:(double)a3;
- (void)setRoamSuppressionWaitForRoamStart:(double)a3;
- (void)setRoamingReason:(id)a3;
- (void)setRoamingStatus:(id)a3;
- (void)setScanDuration:(int64_t)a3;
- (void)setTargetRssi:(int64_t)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisRoaming

- (WiFiUsageLQMWindowAnalysisRoaming)initWithRollingWindow:(id)a3 WithRoamingState:(BOOL)a4 andReasonString:(id)a5 andStatus:(unint64_t)a6 asString:(id)a7 andLatency:(unint64_t)a8 andRoamData:(id)a9 andCurrentBSSSession:(id)a10 andContext:(context)a11 andPingPongStats:(id)a12 andTimestamp:(id)a13 onQueue:(id)a14
{
  __int16 v56 = a6;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  id v21 = a12;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisRoaming;
  v22 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]( &v60,  sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_,  a3,  @"Roaming",  *(void *)&a11.var0 & 0xFFFFFFLL,  a13,  a14);
  v23 = v22;
  if (v22)
  {
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamingReason:](v22, "setRoamingReason:", v17);
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamingStatus:](v23, "setRoamingStatus:", v18);
    -[WiFiUsageLQMWindowAnalysisRoaming setLatency:](v23, "setLatency:", a8);
    uint64_t v24 = [v19 objectForKey:@"ROAMEDEVENT_FLAGS"];
    id v25 = v18;
    if ((v56 & 0x1FF) != 0)
    {
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamBssSupports:](v23, "setRoamBssSupports:", 0LL);
      -[WiFiUsageLQMWindowAnalysisRoaming setIsWNMScoreRoam:](v23, "setIsWNMScoreRoam:", 0LL);
      BOOL v26 = 0LL;
    }

    else
    {
      +[WiFiUsageLQMWindowAnalysisRoaming bssSupportWithFlags:]( &OBJC_CLASS___WiFiUsageLQMWindowAnalysisRoaming,  "bssSupportWithFlags:",  v24);
      id v27 = v19;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamBssSupports:](v23, "setRoamBssSupports:", v28);

      id v19 = v27;
      -[WiFiUsageLQMWindowAnalysisRoaming setIsWNMScoreRoam:]( v23,  "setIsWNMScoreRoam:",  +[WiFiUsageLQMWindowAnalysisRoaming isWNMRoam:]( &OBJC_CLASS___WiFiUsageLQMWindowAnalysisRoaming,  "isWNMRoam:",  v24));
      BOOL v26 = +[WiFiUsageLQMWindowAnalysisRoaming isColocatedRoam:]( &OBJC_CLASS___WiFiUsageLQMWindowAnalysisRoaming,  "isColocatedRoam:",  v24);
    }

    -[WiFiUsageLQMWindowAnalysisRoaming setIsColocatedRoam:](v23, "setIsColocatedRoam:", v26);
    if (v20)
    {
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigTriggerRssi:]( v23,  "setRoamConfigTriggerRssi:",  [v20 roamConfigTriggerRssi]);
      [v20 roamConfigChannels];
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigChannels:](v23, "setRoamConfigChannels:", v59);
      [v20 roamConfigCriteria];
    }

    else
    {
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigTriggerRssi:]( v23,  "setRoamConfigTriggerRssi:",  0x7FFFFFFFFFFFFFFFLL);
      memset(v59, 0, sizeof(v59));
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigChannels:](v23, "setRoamConfigChannels:", v59);
      memset(v58, 0, sizeof(v58));
    }

    -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigCriteria:](v23, "setRoamConfigCriteria:", v58);
    [v19 objectForKey:@"ROAMEDEVENT_ORIGIN_RSSI"];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v29;
    if (v29) {
      uint64_t v30 = [v29 integerValue];
    }
    else {
      uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setOriginRssi:](v23, "setOriginRssi:", v30);
    [v19 objectForKey:@"ROAMEDEVENT_TARGET_RSSI"];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v31;
    if (v31) {
      uint64_t v32 = [v31 integerValue];
    }
    else {
      uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v55 = v17;
    -[WiFiUsageLQMWindowAnalysisRoaming setTargetRssi:](v23, "setTargetRssi:", v32);
    id v53 = v21;
    -[WiFiUsageLQMWindowAnalysisRoaming setPingPongStats:](v23, "setPingPongStats:", v21);
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionEnabledPerc:]( v23,  "setRoamSuppressionEnabledPerc:",  [v20 inRoamSuppressionEnabledDurationPerc]);
    -[WiFiUsageLQMWindowAnalysisRoaming setFirstRoamAfterRoamRecommLifted:]( v23,  "setFirstRoamAfterRoamRecommLifted:",  [v20 roamsAfterSupprLifted] == 1);
    if (v23->_firstRoamAfterRoamRecommLifted)
    {
      [v20 lastRoamSuppressionWaitForRoamStart];
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionWaitForRoamStart:]( v23,  "setRoamSuppressionWaitForRoamStart:");
      [v20 lastRoamSuppressionWaitForRoamEnd];
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionWaitForRoamEnd:](v23, "setRoamSuppressionWaitForRoamEnd:");
    }

    [v19 objectForKey:@"ROAM_SCAN_SUMMARY"];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v19;
    [v19 objectForKey:@"ROAMEDEVENT_CHANNELS_SCANNED_COUNT"];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 objectForKey:@"ROAM_SCAN_DURATION"];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 objectForKey:@"ROAM_NUM_FULL_BAND_SCANS"];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 objectForKey:@"ROAM_NUM_PARTIAL_SCANS"];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34) {
      uint64_t v38 = [v34 unsignedIntegerValue];
    }
    else {
      uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamScannedChannelCount:](v23, "setRoamScannedChannelCount:", v38);
    if (v35) {
      uint64_t v39 = [v35 unsignedIntegerValue];
    }
    else {
      uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setScanDuration:](v23, "setScanDuration:", v39);
    if (v36) {
      uint64_t v40 = [v36 unsignedIntegerValue];
    }
    else {
      uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamFullBandScanCount:](v23, "setRoamFullBandScanCount:", v40);
    v52 = v25;
    v49 = (void *)v24;
    if (v37) {
      uint64_t v41 = [v37 unsignedIntegerValue];
    }
    else {
      uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamPartialBandScanCount:](v23, "setRoamPartialBandScanCount:", v41);
    [v57 objectForKey:@"ROAM_PKT_LOSS_INFO"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 objectForKey:@"ROAM_PKTS_PENDING_AQM"];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 objectForKey:@"ROAM_PKTS_PENDING_TXSUBQ"];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43) {
      uint64_t v45 = [v43 unsignedIntegerValue];
    }
    else {
      uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamPktsPendingAqm:](v23, "setRoamPktsPendingAqm:", v45);
    if (v44) {
      uint64_t v46 = [v44 unsignedIntegerValue];
    }
    else {
      uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamPktsPendingTxSubQ:](v23, "setRoamPktsPendingTxSubQ:", v46);
    v47 = v23;

    id v17 = v55;
    id v19 = v57;
    id v18 = v52;
    id v21 = v53;
  }

  return v23;
}

+ (BOOL)isColocatedRoam:(id)a3
{
  if (a3) {
    return ((unint64_t)[a3 unsignedIntegerValue] >> 7) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)isWNMRoam:(id)a3
{
  if (a3) {
    return ((unint64_t)[a3 unsignedIntegerValue] >> 6) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (id)bssSupportWithFlags:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_opt_new();
  if (!v3) {
    goto LABEL_9;
  }
  char v5 = [v3 unsignedIntegerValue];
  char v6 = v5;
  if ((v5 & 1) != 0)
  {
    [v4 appendString:@"NR&"];
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }

  else if ((v5 & 2) == 0)
  {
    goto LABEL_4;
  }

  [v4 appendString:@"FT&"];
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }

- (id)addDimensionsTo:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisRoaming;
  id v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v64, sel_addDimensionsTo_, v4);
  [v4 setObject:self->_roamingReason forKeyedSubscript:@"roamingReason"];
  [v4 setObject:self->_roamingStatus forKeyedSubscript:@"roamingStatus"];
  [MEMORY[0x189607968] numberWithBool:self->_isWNMScoreRoam];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"roamIsWNMScoreRoam"];

  [MEMORY[0x189607968] numberWithBool:self->_isColocatedRoam];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"roamIsColocatedRoam"];

  [v4 setObject:self->_roamBssSupports forKeyedSubscript:@"roamTargetBssSupports"];
  v8 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"roamConfigTriggerRssi",  self);
  [v4 setObject:v8 forKeyedSubscript:@"roamConfigTriggerRssi"];

  __int128 v9 = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  v63[0] = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  v63[1] = v9;
  v10 = +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForIntegerByBand:",  v63);
  [v4 setObject:v10 forKeyedSubscript:@"roamConfigChannelsByBand"];

  [MEMORY[0x189607968] numberWithBool:self->_roamConfigCriteria.isAllowed];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKeyedSubscript:@"roamConfigIsARAllowed"];

  [MEMORY[0x189607968] numberWithBool:self->_roamConfigCriteria.forceApply];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKeyedSubscript:@"roamConfigIsARForceApplied"];

  [MEMORY[0x189607968] numberWithBool:self->_roamConfigCriteria.deviceSupport];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKeyedSubscript:@"roamConfigDeviceSupportsAR"];

  [MEMORY[0x189607968] numberWithBool:self->_roamConfigCriteria.isEAP];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v14 forKeyedSubscript:@"roamConfigIsEAP"];

  [MEMORY[0x189607968] numberWithInteger:self->_roamConfigCriteria.environment];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v15 forKeyedSubscript:@"roamConfigEnv"];

  [MEMORY[0x189607968] numberWithInteger:self->_roamConfigCriteria.networkOfInterestType];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v16 forKeyedSubscript:@"roamConfigNetworkType"];

  [MEMORY[0x189607968] numberWithInteger:self->_roamConfigCriteria.LOIType];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v17 forKeyedSubscript:@"roamConfigARLOIType"];

  int64_t originRssi = self->_originRssi;
  if (originRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamOriginRssi"];
  }

  else
  {
    +[WiFiUsageLQMTransformations getBinRssi:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinRssi:As:",  originRssi,  0LL);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v19 forKeyedSubscript:@"roamOriginRssi"];
  }

  int64_t targetRssi = self->_targetRssi;
  if (targetRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamTargetRssi"];
  }

  else
  {
    +[WiFiUsageLQMTransformations getBinRssi:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinRssi:As:",  targetRssi,  0LL);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v21 forKeyedSubscript:@"roamTargetRssi"];
  }

  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisRoaming;
  v22 = -[WiFiUsageLQMWindowAnalysis windowBeforeTrigger](&v62, sel_windowBeforeTrigger);
  [v22 samples];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 lastObject];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"driverRoamRecommended",  v24);
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v25 forKeyedSubscript:@"roamingRecommended"];

  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisRoaming;
  -[WiFiUsageLQMWindowAnalysis windowBeforeTrigger](&v61, sel_windowBeforeTrigger);
  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 samples];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 lastObject];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"driverTDrecommended",  v28);
  [v4 setObject:v29 forKeyedSubscript:@"tdRecommended"];

  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisRoaming;
  -[WiFiUsageLQMWindowAnalysis windowBeforeTrigger](&v60, sel_windowBeforeTrigger);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 samples];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 lastObject];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"chanQualScore",  v32);
  [v4 setObject:v33 forKeyedSubscript:@"last_chanQualScore_before"];
  v34 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"txLatencyScore",  v32);
  [v4 setObject:v34 forKeyedSubscript:@"last_txLatencyScore_before"];
  v35 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"rxLatencyScore",  v32);
  [v4 setObject:v35 forKeyedSubscript:@"last_rxLatencyScore_before"];
  v36 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"txLossScore",  v32);
  [v4 setObject:v36 forKeyedSubscript:@"last_txLossScore_before"];
  v37 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"rxLossScore",  v32);
  [v4 setObject:v37 forKeyedSubscript:@"last_rxLossScore_before"];

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"txLatencyP95",  v32);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = v38;
  if (v38)
  {
    +[WiFiUsageLQMSample binLabelfromFieldName:value:]( WiFiUsageLQMUserSample,  "binLabelfromFieldName:value:",  @"txLatencyP95",  [v38 unsignedIntegerValue]);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v40 forKeyedSubscript:@"last_txLatencyP95_before"];
  }

  else
  {
    [v4 setObject:0 forKeyedSubscript:@"last_txLatencyP95_before"];
  }

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"pingPongNth",  self->_pingPongStats);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v41 forKeyedSubscript:@"roamPingPongNth"];
  v42 = +[WiFiUsageLQMTransformations getLabelPingPongStats:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getLabelPingPongStats:",  self->_pingPongStats);
  [v4 setObject:v42 forKeyedSubscript:@"roamPingPongSequence"];
  v43 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  self->_roamSuppressionEnabledPerc,  0LL);
  [v4 setObject:v43 forKeyedSubscript:@"roamSuppressedEnabledPerc"];

  if (self->_firstRoamAfterRoamRecommLifted)
  {
    v44 = +[WiFiUsageLQMTransformations getBinForRoamingLatency:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinForRoamingLatency:As:",  (unint64_t)(self->_roamSuppressionWaitForRoamStart * 1000.0),  0LL);
    [v4 setObject:v44 forKeyedSubscript:@"roamSuppressionWaitForRoamStart"];

    +[WiFiUsageLQMTransformations getBinForRoamingLatency:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinForRoamingLatency:As:",  (unint64_t)(self->_roamSuppressionWaitForRoamEnd * 1000.0),  0LL);
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v45 forKeyedSubscript:@"roamSuppressionWaitForRoamEnd"];
  }

  int64_t latency = self->_latency;
  if (latency == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamingLatencyms"];
  }

  else
  {
    v47 = +[WiFiUsageLQMTransformations getBinForRoamingLatency:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinForRoamingLatency:As:",  latency,  0LL);
    [v4 setObject:v47 forKeyedSubscript:@"roamingLatencyms"];
  }

  int64_t scanDuration = self->_scanDuration;
  if (scanDuration == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamScanDuration"];
  }

  else
  {
    v49 = +[WiFiUsageLQMTransformations getBinForRoamingLatency:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinForRoamingLatency:As:",  scanDuration,  0LL);
    [v4 setObject:v49 forKeyedSubscript:@"roamScanDuration"];
  }
  v50 = +[WiFiUsageLQMTransformations getBinScannedChannels:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinScannedChannels:As:",  self->_roamScannedChannelCount,  0LL);
  [v4 setObject:v50 forKeyedSubscript:@"roamScannedChannelCountAsString"];
  v51 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"roamFullBandScanCount",  self);
  [v51 description];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v52 forKeyedSubscript:@"roamFullBandScanCount"];

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"roamPartialBandScanCount",  self);
  id v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 description];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v54 forKeyedSubscript:@"roamPartialBandScanCount"];

  unint64_t roamPktsPendingAqm = self->_roamPktsPendingAqm;
  if (roamPktsPendingAqm == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamPktsPendingAqm"];
  }

  else
  {
    +[WiFiUsageLQMTransformations getBinFrames:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinFrames:As:",  roamPktsPendingAqm,  0LL);
    __int16 v56 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v56 forKeyedSubscript:@"roamPktsPendingAqm"];
  }

  unint64_t roamPktsPendingTxSubQ = self->_roamPktsPendingTxSubQ;
  if (roamPktsPendingTxSubQ == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamPktsPendingTxSubQ"];
  }

  else
  {
    v58 = +[WiFiUsageLQMTransformations getBinFrames:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinFrames:As:",  roamPktsPendingTxSubQ,  0LL);
    [v4 setObject:v58 forKeyedSubscript:@"roamPktsPendingTxSubQ"];
  }

  return v4;
}

- (NSString)roamingReason
{
  return self->_roamingReason;
}

- (void)setRoamingReason:(id)a3
{
}

- (NSString)roamingStatus
{
  return self->_roamingStatus;
}

- (void)setRoamingStatus:(id)a3
{
}

- (int64_t)latency
{
  return self->_latency;
}

- (void)setLatency:(int64_t)a3
{
  self->_int64_t latency = a3;
}

- (BOOL)isWNMScoreRoam
{
  return self->_isWNMScoreRoam;
}

- (void)setIsWNMScoreRoam:(BOOL)a3
{
  self->_isWNMScoreRoam = a3;
}

- (BOOL)isColocatedRoam
{
  return self->_isColocatedRoam;
}

- (void)setIsColocatedRoam:(BOOL)a3
{
  self->_isColocatedRoam = a3;
}

- (NSString)roamBssSupports
{
  return self->_roamBssSupports;
}

- (void)setRoamBssSupports:(id)a3
{
}

- (int64_t)roamConfigTriggerRssi
{
  return self->_roamConfigTriggerRssi;
}

- (void)setRoamConfigTriggerRssi:(int64_t)a3
{
  self->_roamConfigTriggerRssi = a3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamConfigChannels
{
  __int128 v3 = *(_OWORD *)self[9].var1;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[9].var0[1];
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamConfigChannels:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamConfigChannels.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = v3;
}

- ($6E47B81FEB72AA1B248A20B58E3F028F)roamConfigCriteria
{
  __int128 v3 = *(_OWORD *)&self[10].var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[10].var4;
  *(_OWORD *)&retstr->var5 = v3;
  return self;
}

- (void)setRoamConfigCriteria:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = v3;
}

- (int64_t)originRssi
{
  return self->_originRssi;
}

- (void)setOriginRssi:(int64_t)a3
{
  self->_int64_t originRssi = a3;
}

- (int64_t)targetRssi
{
  return self->_targetRssi;
}

- (void)setTargetRssi:(int64_t)a3
{
  self->_int64_t targetRssi = a3;
}

- (WiFiUsageSessionPingPongStats)pingPongStats
{
  return self->_pingPongStats;
}

- (void)setPingPongStats:(id)a3
{
}

- (unint64_t)roamSuppressionEnabledPerc
{
  return self->_roamSuppressionEnabledPerc;
}

- (void)setRoamSuppressionEnabledPerc:(unint64_t)a3
{
  self->_roamSuppressionEnabledPerc = a3;
}

- (BOOL)firstRoamAfterRoamRecommLifted
{
  return self->_firstRoamAfterRoamRecommLifted;
}

- (void)setFirstRoamAfterRoamRecommLifted:(BOOL)a3
{
  self->_firstRoamAfterRoamRecommLifted = a3;
}

- (double)roamSuppressionWaitForRoamStart
{
  return self->_roamSuppressionWaitForRoamStart;
}

- (void)setRoamSuppressionWaitForRoamStart:(double)a3
{
  self->_roamSuppressionWaitForRoamStart = a3;
}

- (double)roamSuppressionWaitForRoamEnd
{
  return self->_roamSuppressionWaitForRoamEnd;
}

- (void)setRoamSuppressionWaitForRoamEnd:(double)a3
{
  self->_roamSuppressionWaitForRoamEnd = a3;
}

- (int64_t)scanDuration
{
  return self->_scanDuration;
}

- (void)setScanDuration:(int64_t)a3
{
  self->_int64_t scanDuration = a3;
}

- (unint64_t)roamScannedChannelCount
{
  return self->_roamScannedChannelCount;
}

- (void)setRoamScannedChannelCount:(unint64_t)a3
{
  self->_roamScannedChannelCount = a3;
}

- (unint64_t)roamFullBandScanCount
{
  return self->_roamFullBandScanCount;
}

- (void)setRoamFullBandScanCount:(unint64_t)a3
{
  self->_roamFullBandScanCount = a3;
}

- (unint64_t)roamPartialBandScanCount
{
  return self->_roamPartialBandScanCount;
}

- (void)setRoamPartialBandScanCount:(unint64_t)a3
{
  self->_roamPartialBandScanCount = a3;
}

- (unint64_t)roamPktsPendingAqm
{
  return self->_roamPktsPendingAqm;
}

- (void)setRoamPktsPendingAqm:(unint64_t)a3
{
  self->_unint64_t roamPktsPendingAqm = a3;
}

- (unint64_t)roamPktsPendingTxSubQ
{
  return self->_roamPktsPendingTxSubQ;
}

- (void)setRoamPktsPendingTxSubQ:(unint64_t)a3
{
  self->_unint64_t roamPktsPendingTxSubQ = a3;
}

- (void).cxx_destruct
{
}

@end