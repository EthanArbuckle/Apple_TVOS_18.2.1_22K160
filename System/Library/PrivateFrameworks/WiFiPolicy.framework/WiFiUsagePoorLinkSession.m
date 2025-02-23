@interface WiFiUsagePoorLinkSession
+ (id)describeWiFiUsageMonitor_tdDecisionState:(id *)a3;
+ (id)describeWiFiUsageMonitor_tdExecState:(id)a3;
+ (id)describeWiFiUsageMonitor_tdFastTDState:(id)a3;
+ (id)sessionEndedBy:(int)a3;
+ (id)sessionStartedBy:(int)a3;
- ($72F98887023D296F816C717954FA291A)last_FastTdVotes;
- ($CA18CBBE7683B0106BED709705F86C47)last_SuppressState;
- ($F459DE10F772475887923C84DB189A08)last_DecisionState;
- (BOOL)driverDoesNotRecommendTd:(unint64_t)a3;
- (BOOL)expectsLQMUpdates;
- (BOOL)isBadRssi:(int64_t)a3;
- (BOOL)isGoodRssi:(int64_t)a3;
- (BOOL)isLastDecisionStateValid;
- (BOOL)isLastFastTdVotesValid;
- (BOOL)isLastSuppressStateValid;
- (BOOL)nextJoinIsSameSSID;
- (BOOL)nextJoinWhileDeferJoin;
- (BOOL)nextLinkUpIsSameBSSID;
- (BOOL)tdConfirmed;
- (BOOL)tdExecuted;
- (BOOL)tdRecommendAtJoin;
- (BOOL)tdRecommendAtNextLinkUp;
- (NSDate)lastTDEval_AlertedAt;
- (NSDate)lastTDEval_ConfirmedAt;
- (NSDate)lastTDEval_ExecutedAt;
- (NSString)lastTdEval_EndedBy;
- (NSString)lastTdEval_StartedBy;
- (NSString)nextJoinReason;
- (WiFiUsagePoorLinkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4 onQueue:(id)a5;
- (double)decision_ActiveProbe_Duration;
- (double)decision_AutoLeave_Duration;
- (double)decision_BeaconPER_Duration;
- (double)decision_FWTxPER_Duration;
- (double)decision_FastTD_Duration;
- (double)decision_GatewayARPFailure_Duration;
- (double)decision_SymptomsDNSError_Duration;
- (double)decision_TxPER_Duration;
- (double)lastTDEval_TDEvalDuration;
- (double)lastTDEval_waitOnRoamStatusDuration;
- (double)perCoreRSSI_Core0_Duration;
- (double)perCoreRSSI_Core1_Duration;
- (double)perCoreRSSI_NotUsed_Duration;
- (double)suppress_2dBGuard;
- (double)suppress_ActiveProbing;
- (double)suppress_FastCheapCellular_Duration;
- (double)suppress_GoodAfterRoam_Duration;
- (double)suppress_NoFgNetwApp_Duration;
- (double)suppress_Roam_Duration;
- (double)suppress_SymptomsAppPolicy_Duration;
- (double)suppress_SymptomsNODataStall_Duration;
- (double)suppress_TTR_Duration;
- (double)suppress_UserInput_Duration;
- (double)tdEvalDurationCumulative;
- (double)timeSinceJoinATStart;
- (double)timeToNextJoin;
- (double)vote_FastTD_BeaconPER_Duration;
- (double)vote_FastTD_FWTxPER_Duration;
- (double)vote_FastTD_Recommendation_Duration;
- (double)vote_FastTD_TXPER_Duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventDictionary:(BOOL)a3;
- (id)metricName;
- (int)sessionEndedBy;
- (int)sessionStartedBy;
- (int64_t)lastTDEval_rssiAtTD;
- (int64_t)rssiAtJoin;
- (int64_t)rssiAtNextLinkUp;
- (unint64_t)last_RSSIMode;
- (unint64_t)roamStatus_FailedFilteredOut_Count_BeforeTDWait;
- (unint64_t)roamStatus_FailedFilteredOut_Count_WhileTDWait;
- (unint64_t)roamStatus_FailedNotFound_Count_BeforeTDWait;
- (unint64_t)roamStatus_FailedNotFound_Count_WhileTDWait;
- (unint64_t)roamStatus_Failed_Count_BeforeTDWait;
- (unint64_t)roamStatus_Failed_Count_WhileTDWait;
- (unint64_t)roamStatus_Succeeded_Count_BeforeTDWait;
- (unint64_t)roamStatus_Succeeded_Count_WhileTDWait;
- (unint64_t)waitOnRoamStatusDurationCumulative;
- (void)faultEventDetected:(unint64_t)a3;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkQualityDidChange:(id)a3;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongStats:(id)a8;
- (void)sessionDidEnd:(int)a3;
- (void)sessionDidStart:(int)a3;
- (void)setDecision_ActiveProbe_Duration:(double)a3;
- (void)setDecision_AutoLeave_Duration:(double)a3;
- (void)setDecision_BeaconPER_Duration:(double)a3;
- (void)setDecision_FWTxPER_Duration:(double)a3;
- (void)setDecision_FastTD_Duration:(double)a3;
- (void)setDecision_GatewayARPFailure_Duration:(double)a3;
- (void)setDecision_SymptomsDNSError_Duration:(double)a3;
- (void)setDecision_TxPER_Duration:(double)a3;
- (void)setIsLastDecisionStateValid:(BOOL)a3;
- (void)setIsLastFastTdVotesValid:(BOOL)a3;
- (void)setIsLastSuppressStateValid:(BOOL)a3;
- (void)setLastTDEval_AlertedAt:(id)a3;
- (void)setLastTDEval_ConfirmedAt:(id)a3;
- (void)setLastTDEval_ExecutedAt:(id)a3;
- (void)setLastTDEval_TDEvalDuration:(double)a3;
- (void)setLastTDEval_rssiAtTD:(int64_t)a3;
- (void)setLastTDEval_waitOnRoamStatusDuration:(double)a3;
- (void)setLastTdEval_EndedBy:(id)a3;
- (void)setLastTdEval_StartedBy:(id)a3;
- (void)setLast_DecisionState:(id *)a3;
- (void)setLast_FastTdVotes:(id)a3;
- (void)setLast_RSSIMode:(unint64_t)a3;
- (void)setLast_SuppressState:(id)a3;
- (void)setNextJoinIsSameSSID:(BOOL)a3;
- (void)setNextJoinReason:(id)a3;
- (void)setNextJoinWhileDeferJoin:(BOOL)a3;
- (void)setNextLinkUpIsSameBSSID:(BOOL)a3;
- (void)setPerCoreRSSI_Core0_Duration:(double)a3;
- (void)setPerCoreRSSI_Core1_Duration:(double)a3;
- (void)setPerCoreRSSI_NotUsed_Duration:(double)a3;
- (void)setRoamStatus_FailedFilteredOut_Count_BeforeTDWait:(unint64_t)a3;
- (void)setRoamStatus_FailedFilteredOut_Count_WhileTDWait:(unint64_t)a3;
- (void)setRoamStatus_FailedNotFound_Count_BeforeTDWait:(unint64_t)a3;
- (void)setRoamStatus_FailedNotFound_Count_WhileTDWait:(unint64_t)a3;
- (void)setRoamStatus_Failed_Count_BeforeTDWait:(unint64_t)a3;
- (void)setRoamStatus_Failed_Count_WhileTDWait:(unint64_t)a3;
- (void)setRoamStatus_Succeeded_Count_BeforeTDWait:(unint64_t)a3;
- (void)setRoamStatus_Succeeded_Count_WhileTDWait:(unint64_t)a3;
- (void)setRssiAtJoin:(int64_t)a3;
- (void)setRssiAtNextLinkUp:(int64_t)a3;
- (void)setSessionEndedBy:(int)a3;
- (void)setSessionStartedBy:(int)a3;
- (void)setSuppress_2dBGuard:(double)a3;
- (void)setSuppress_ActiveProbing:(double)a3;
- (void)setSuppress_FastCheapCellular_Duration:(double)a3;
- (void)setSuppress_GoodAfterRoam_Duration:(double)a3;
- (void)setSuppress_NoFgNetwApp_Duration:(double)a3;
- (void)setSuppress_Roam_Duration:(double)a3;
- (void)setSuppress_SymptomsAppPolicy_Duration:(double)a3;
- (void)setSuppress_SymptomsNODataStall_Duration:(double)a3;
- (void)setSuppress_TTR_Duration:(double)a3;
- (void)setSuppress_UserInput_Duration:(double)a3;
- (void)setTdConfirmed:(BOOL)a3;
- (void)setTdEvalDurationCumulative:(double)a3;
- (void)setTdExecuted:(BOOL)a3;
- (void)setTdRecommendAtJoin:(BOOL)a3;
- (void)setTdRecommendAtNextLinkUp:(BOOL)a3;
- (void)setTimeSinceJoinATStart:(double)a3;
- (void)setTimeToNextJoin:(double)a3;
- (void)setVote_FastTD_BeaconPER_Duration:(double)a3;
- (void)setVote_FastTD_FWTxPER_Duration:(double)a3;
- (void)setVote_FastTD_Recommendation_Duration:(double)a3;
- (void)setVote_FastTD_TXPER_Duration:(double)a3;
- (void)setWaitOnRoamStatusDurationCumulative:(unint64_t)a3;
- (void)summarizeSession;
- (void)tdLogic_alertedBy:(int)a3;
- (void)tdLogic_badRssi:(int64_t)a3 goodRSSI:(int64_t)goodLinkRssi;
- (void)tdLogic_decisionState:(id *)a3;
- (void)tdLogic_deferJoin:(unint64_t)a3 perBSSID:(unint64_t)perBSSID_deferJoin;
- (void)tdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6;
- (void)tdLogic_execState:(id)a3;
- (void)tdLogic_fastTdState:(id)a3;
- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5;
@end

@implementation WiFiUsagePoorLinkSession

- (BOOL)expectsLQMUpdates
{
  return 1;
}

- (void)linkQualityDidChange:(id)a3
{
  id v4 = a3;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    if (!self->_waitingOnLinkUp && !self->_toBeClosedAfterLQM)
    {
      unint64_t v5 = [v4 perCoreRssiInUse];
      if (v5 <= 2)
      {
        v6 = off_18A16E180[v5];
      }

      v24.receiver = self;
      v24.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
      -[WiFiUsageSession linkQualityDidChange:](&v24, sel_linkQualityDidChange_, v4);
    }

    if (self->_toBeClosedAfterLQM)
    {
      NSLog(@"%s: BadLink session ended due to linkUp", "-[WiFiUsagePoorLinkSession linkQualityDidChange:]");
      -[WiFiUsagePoorLinkSession setRssiAtNextLinkUp:](self, "setRssiAtNextLinkUp:", [v4 rssi]);
      if ([v4 driverTDrecommended] != 0x7FFFFFFFFFFFFFFFLL) {
        -[WiFiUsagePoorLinkSession setTdRecommendAtNextLinkUp:]( self,  "setTdRecommendAtNextLinkUp:",  [v4 driverTDrecommended] != 0);
      }
      v7 = self;
      uint64_t v8 = 1LL;
LABEL_11:
      -[WiFiUsagePoorLinkSession sessionDidEnd:](v7, "sessionDidEnd:", v8);
      goto LABEL_38;
    }

    if (!self->_waitingOnLinkUp
      && -[WiFiUsagePoorLinkSession isGoodRssi:](self, "isGoodRssi:", [v4 rssi])
      && -[WiFiUsagePoorLinkSession driverDoesNotRecommendTd:]( self,  "driverDoesNotRecommendTd:",  [v4 driverTDrecommended]))
    {
      v9 = -[WiFiUsagePoorLinkSession lastTdEval_EndedBy](self, "lastTdEval_EndedBy");
      if (v9)
      {

LABEL_18:
        self->_toBeClosedAfterTdLogicEnd = 0;
        uint64_t v10 = [v4 rssi];
        int64_t goodLinkRssi = self->_goodLinkRssi;
        if (goodLinkRssi == 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = @"N/A";
        }

        else
        {
          [MEMORY[0x189607968] numberWithInteger:self->_goodLinkRssi];
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        if ([v4 driverTDrecommended] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = @"N/A";
        }

        else
        {
          uint64_t v14 = [v4 driverTDrecommended];
          v13 = @"YES";
          if (!v14) {
            v13 = @"NO";
          }
        }

        NSLog( @"%s: BadLink session ended due to rssi (%lddBm) crossing GoodLink Threshold (%@dBm) or tdRecommended(%@)",  "-[WiFiUsagePoorLinkSession linkQualityDidChange:]",  v10,  v12,  v13);
        if (goodLinkRssi != 0x7FFFFFFFFFFFFFFFLL) {

        }
        v7 = self;
        uint64_t v8 = 0LL;
        goto LABEL_11;
      }

      if (self->_toBeClosedAfterTdLogicEnd) {
        goto LABEL_18;
      }
      uint64_t v15 = [v4 rssi];
      int64_t v16 = self->_goodLinkRssi;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = @"N/A";
      }

      else
      {
        [MEMORY[0x189607968] numberWithInteger:self->_goodLinkRssi];
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      if ([v4 driverTDrecommended] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = @"N/A";
      }

      else
      {
        uint64_t v19 = [v4 driverTDrecommended];
        v18 = @"YES";
        if (!v19) {
          v18 = @"NO";
        }
      }

      NSLog( @"%s: BadLink session will end after receiving tdLogic_end from LQMManager due to rssi (%lddBm) crossing GoodLink Threshold (%@dBm) or tdRecommended(%@)",  "-[WiFiUsagePoorLinkSession linkQualityDidChange:]",  v15,  v17,  v18);
      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {

      }
      self->_toBeClosedAfterTdLogicEnd = 1;
    }
  }

- (BOOL)isGoodRssi:(int64_t)a3
{
  return self->_goodLinkRssi <= a3;
}

- (BOOL)isBadRssi:(int64_t)a3
{
  return self->_badLinkRssi >= a3;
}

- (BOOL)driverDoesNotRecommendTd:(unint64_t)a3
{
  BOOL lastTdRecommended = self->_lastTdRecommended;
  if (self->_lastTdRecommended || (BOOL result = 1, a3) && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = !lastTdRecommended;
    }
    return !v4;
  }

  return result;
}

- (void)faultEventDetected:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession faultEventDetected:](&v5, sel_faultEventDetected_);
  if (a3 == 1 && !-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    NSLog( @"%s: BadLink session started due to LowRssiDNSFailure",  "-[WiFiUsagePoorLinkSession faultEventDetected:]");
    -[WiFiUsagePoorLinkSession sessionDidStart:](self, "sessionDidStart:", 3LL);
  }

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a7;
  BOOL linkIsUp = self->_linkIsUp;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]( &v31,  sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_,  v10,  v9,  a5,  a6,  v12);
  if (!linkIsUp || v10)
  {
    BOOL v22 = linkIsUp || !self->_waitingOnLinkUp || !v10;
    if (v22 || !-[WiFiUsageSession isSessionActive](self, "isSessionActive")) {
      goto LABEL_32;
    }
    self->_waitingOnLinkUp = 0;
    [v12 connectedBss];
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 bssid];
    objc_super v24 = (void *)objc_claimAutoreleasedReturnValue();
    int v25 = [v24 isEqualToString:self->_bssidAtTD];

    if (!v25)
    {
LABEL_31:
      self->_toBeClosedAfterLQM = 1;
      NSLog( @"%s: BadLink session will end due to linkUp (waiting on LQM update)",  "-[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
      goto LABEL_32;
    }

    if (self->_lastLinkDownAt)
    {
      [MEMORY[0x189603F50] now];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 timeIntervalSinceDate:self->_lastLinkDownAt];
      double v28 = v27;

      -[WiFiUsagePoorLinkSession setNextLinkUpIsSameBSSID:](self, "setNextLinkUpIsSameBSSID:", 1LL);
      if (v28 != 9.22337204e18)
      {
        BOOL v29 = v28 < (double)self->_perBSSID_deferJoin;
LABEL_30:
        -[WiFiUsagePoorLinkSession setNextJoinWhileDeferJoin:](self, "setNextJoinWhileDeferJoin:", v29);
        goto LABEL_31;
      }
    }

    else
    {
      -[WiFiUsagePoorLinkSession setNextLinkUpIsSameBSSID:](self, "setNextLinkUpIsSameBSSID:", 1LL);
    }

    BOOL v29 = 0LL;
    goto LABEL_30;
  }

  self->_BOOL linkIsUp = 0;
  if (!self->_lastLinkDownAt)
  {
    [MEMORY[0x189603F50] now];
    uint64_t v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastLinkDownAt = self->_lastLinkDownAt;
    self->_lastLinkDownAt = v14;
  }

  BOOL v16 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
  if (a5 == 1000)
  {
    if (!v16 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:].cold.1((uint64_t)self);
    }
    self->_waitingOnLinkUp = 1;
    endSessionTimer = self->_endSessionTimer;
    unint64_t perSSID_deferJoin = self->_perSSID_deferJoin;
    if (perSSID_deferJoin <= self->_perBSSID_deferJoin) {
      unint64_t perSSID_deferJoin = self->_perBSSID_deferJoin;
    }
    dispatch_time_t v19 = dispatch_time(0LL, 1000000000 * perSSID_deferJoin + 30000000000LL);
    dispatch_source_set_timer((dispatch_source_t)endSessionTimer, v19, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_activate((dispatch_object_t)self->_endSessionTimer);
    unint64_t perBSSID_deferJoin = self->_perSSID_deferJoin;
    if (perBSSID_deferJoin <= self->_perBSSID_deferJoin) {
      unint64_t perBSSID_deferJoin = self->_perBSSID_deferJoin;
    }
    NSLog( @"%s: Link went down, waiting on linkUp for up to %ds",  "-[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]",  (perBSSID_deferJoin + 30));
  }

  else if (v16)
  {
    v30 = +[WiFiUsageSession disconnectReasonString:](&OBJC_CLASS___WiFiUsageSession, "disconnectReasonString:", a5);
    NSLog( @"%s: Link went down due to %@, ending session",  "-[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]",  v30);

    -[WiFiUsagePoorLinkSession sessionDidEnd:](self, "sessionDidEnd:", 3LL);
  }

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]( &v19,  sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_,  v12,  a4,  a5,  a6,  a7);
  if (v12)
  {
    if (-[WiFiUsageSession isSessionActive](self, "isSessionActive") && self->_tdExecuted)
    {
      if (self->_lastLinkDownAt)
      {
        [MEMORY[0x189603F50] now];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 timeIntervalSinceDate:self->_lastLinkDownAt];
        -[WiFiUsagePoorLinkSession setTimeToNextJoin:](self, "setTimeToNextJoin:");
      }

      +[WiFiUsageSession joinReasonString:](&OBJC_CLASS___WiFiUsageSession, "joinReasonString:", a4);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsagePoorLinkSession setNextJoinReason:](self, "setNextJoinReason:", v14);

      if ([v12 isEqualToString:self->_ssidAtTD])
      {
        -[WiFiUsagePoorLinkSession setNextJoinIsSameSSID:](self, "setNextJoinIsSameSSID:", 1LL);
        double timeToNextJoin = self->_timeToNextJoin;
        BOOL v16 = timeToNextJoin != 9.22337204e18 && timeToNextJoin < (double)self->_perSSID_deferJoin;
        -[WiFiUsagePoorLinkSession setNextJoinWhileDeferJoin:](self, "setNextJoinWhileDeferJoin:", v16);
      }
    }

    if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
    {
      self->_justJoined = 1;
      [MEMORY[0x189603F50] now];
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastJoinAt = self->_lastJoinAt;
      self->_lastJoinAt = v17;
    }
  }
}

- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongStats:(id)a8
{
  if (!a3)
  {
    if (self->_tdConfirmed)
    {
      switch(a5)
      {
        case 0uLL:
          BOOL v10 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_Succeeded_Count_WhileTDWait;
LABEL_19:
          ++*(Class *)((char *)&self->super.super.isa + *v10);
          goto LABEL_20;
        case 0xE0820403uLL:
          uint64_t v8 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_FailedNotFound_Count_WhileTDWait;
          break;
        case 0xE082044BuLL:
          uint64_t v8 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_FailedFilteredOut_Count_WhileTDWait;
          break;
        default:
LABEL_14:
          BOOL v10 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_Failed_Count_WhileTDWait;
          goto LABEL_19;
      }

      ++*(Class *)((char *)&self->super.super.isa + *v8);
      goto LABEL_14;
    }

    switch(a5)
    {
      case 0uLL:
        BOOL v10 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_Succeeded_Count_BeforeTDWait;
        goto LABEL_19;
      case 0xE0820403uLL:
        BOOL v9 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_FailedNotFound_Count_BeforeTDWait;
        break;
      case 0xE082044BuLL:
        BOOL v9 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_FailedFilteredOut_Count_BeforeTDWait;
        break;
      default:
LABEL_18:
        BOOL v10 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_Failed_Count_BeforeTDWait;
        goto LABEL_19;
    }

    ++*(Class *)((char *)&self->super.super.isa + *v9);
    goto LABEL_18;
  }

- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5
{
  if (!self->_waitingOnLinkUp && !self->_toBeClosedAfterLQM)
  {
    BOOL v6 = a5;
    BOOL v7 = a4;
    BOOL v8 = a3;
    [MEMORY[0x189603F50] now];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (!self->_alerted || self->_lastTdEval_EndedBy))
    {
      if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive")) {
        -[WiFiUsagePoorLinkSession sessionDidStart:](self, "sessionDidStart:", 4LL);
      }
      self->_alerted = 1;
      self->_tdConfirmed = 0;
      self->_tdExecuted = 0;
      lastTdEval_EndedBy = self->_lastTdEval_EndedBy;
      self->_lastTdEval_EndedBy = 0LL;

      -[WiFiUsagePoorLinkSession setLastTDEval_AlertedAt:](self, "setLastTDEval_AlertedAt:", v9);
    }

    if (v7 && !self->_tdConfirmed)
    {
      -[WiFiUsagePoorLinkSession setTdConfirmed:](self, "setTdConfirmed:", 1LL);
      -[WiFiUsagePoorLinkSession setLastTDEval_ConfirmedAt:](self, "setLastTDEval_ConfirmedAt:", v9);
    }

    objc_super v11 = &stru_18A170410;
    if (v6)
    {
      if (!self->_tdExecuted)
      {
        self->_tdExecuted = 1;
        -[WiFiUsagePoorLinkSession setLastTDEval_ExecutedAt:](self, "setLastTDEval_ExecutedAt:", v9);
        -[WiFiUsageSession networkDetails](self, "networkDetails");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 connectedBss];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 bssid];
        uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        bssidAtTD = self->_bssidAtTD;
        self->_bssidAtTD = v14;

        -[WiFiUsageSession networkDetails](self, "networkDetails");
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 networkName];
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        ssidAtTD = self->_ssidAtTD;
        self->_ssidAtTD = v17;
      }

      objc_super v11 = @"Executed";
    }

    objc_super v19 = @"Alerted";
    if (!v8) {
      objc_super v19 = &stru_18A170410;
    }
    uint64_t v20 = @"Confirmed";
    if (!v7) {
      uint64_t v20 = &stru_18A170410;
    }
    NSLog( @"%s - %@ %@ %@",  "-[WiFiUsagePoorLinkSession triggerDisconnectAlerted:confirmed:executed:]",  v19,  v20,  v11);
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
    -[WiFiUsageSession triggerDisconnectAlerted:confirmed:executed:]( &v21,  sel_triggerDisconnectAlerted_confirmed_executed_,  v8,  v7,  v6);
  }

- (void)tdLogic_alertedBy:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->_lastTdEval_StartedBy || self->_lastTdEval_EndedBy)
  {
    +[WiFiUsagePrivacyFilter getLabelForTDTrigger:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForTDTrigger:",  *(void *)&a3);
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsagePoorLinkSession setLastTdEval_StartedBy:](self, "setLastTdEval_StartedBy:", v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession tdLogic_alertedBy:](&v6, sel_tdLogic_alertedBy_, v3);
}

- (void)tdLogic_decisionState:(id *)a3
{
  if (!self->_waitingOnLinkUp && !self->_toBeClosedAfterLQM)
  {
    [MEMORY[0x189603F50] now];
    objc_super v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    objc_super v6 = v5;
    if (self->_lastDecisionAt)
    {
      -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:");
      if (self->_last_DecisionState.decision_TxPER) {
        double v8 = v7;
      }
      else {
        double v8 = 0.0;
      }
      self->_decision_TxPER_Duration = self->_decision_TxPER_Duration + v8;
      if (self->_last_DecisionState.decision_FWTxPER) {
        double v9 = v7;
      }
      else {
        double v9 = 0.0;
      }
      self->_decision_FWTxPER_Duration = self->_decision_FWTxPER_Duration + v9;
      if (self->_last_DecisionState.decision_BeaconPER) {
        double v10 = v7;
      }
      else {
        double v10 = 0.0;
      }
      self->_decision_BeaconPER_Duration = self->_decision_BeaconPER_Duration + v10;
      if (self->_last_DecisionState.decision_GatewayARPFailure) {
        double v11 = v7;
      }
      else {
        double v11 = 0.0;
      }
      self->_decision_GatewayARPFailure_Duration = self->_decision_GatewayARPFailure_Duration + v11;
      if (self->_last_DecisionState.decision_SymptomsDNSError) {
        double v12 = v7;
      }
      else {
        double v12 = 0.0;
      }
      self->_decision_SymptomsDNSError_Duration = self->_decision_SymptomsDNSError_Duration + v12;
      if (self->_last_DecisionState.decision_AutoLeave) {
        double v13 = v7;
      }
      else {
        double v13 = 0.0;
      }
      self->_decision_AutoLeave_Duration = self->_decision_AutoLeave_Duration + v13;
      if (self->_last_DecisionState.decision_ActiveProbe) {
        double v14 = v7;
      }
      else {
        double v14 = 0.0;
      }
      self->_decision_ActiveProbe_Duration = self->_decision_ActiveProbe_Duration + v14;
      if (!self->_last_DecisionState.decision_FastTD) {
        double v7 = 0.0;
      }
      self->_decision_FastTD_Duration = self->_decision_FastTD_Duration + v7;
    }

    lastDecisionAt = self->_lastDecisionAt;
    self->_lastDecisionAt = v6;

    __int128 v16 = *(_OWORD *)&a3->var13;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v16;
    -[WiFiUsagePoorLinkSession setLast_DecisionState:](self, "setLast_DecisionState:", v17);
    -[WiFiUsagePoorLinkSession setIsLastDecisionStateValid:](self, "setIsLastDecisionStateValid:", 1LL);
  }

- (void)tdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6
{
  uint64_t v9 = *(void *)&a3;
  +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "getLabelForTDTrigger:");
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "getLabelForTDTrigger:", v9);
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:a4];
  double v13 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:a5];
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s: TDEval ended upon %@ (evalTime:%@s, rssi:%@, roamTime:%.2fs)",  "-[WiFiUsagePoorLinkSession tdLogic_end:evalTime:rssi:roamTime:]",  v12,  v13,  v14,  *(void *)&a6);

  -[WiFiUsagePoorLinkSession setLastTdEval_EndedBy:](self, "setLastTdEval_EndedBy:", v11);
  -[WiFiUsagePoorLinkSession setLastTDEval_TDEvalDuration:](self, "setLastTDEval_TDEvalDuration:", a4);
  -[WiFiUsagePoorLinkSession setLastTDEval_rssiAtTD:](self, "setLastTDEval_rssiAtTD:", a5);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession tdLogic_end:evalTime:rssi:roamTime:](&v15, sel_tdLogic_end_evalTime_rssi_roamTime_, v9, a5, a4, a6);
  self->_lastTDEval_waitOnRoamStatusDuration = a6;
  self->_waitOnRoamStatusDurationCumulative = (unint64_t)((double)self->_waitOnRoamStatusDurationCumulative + a6);
  if (self->_toBeClosedAfterTdLogicEnd) {
    -[WiFiUsagePoorLinkSession sessionDidEnd:](self, "sessionDidEnd:", 0LL);
  }
}

- (void)tdLogic_execState:(id)a3
{
  uint64_t v3 = *(void *)&a3.var8;
  uint64_t v4 = *(void *)&a3.var0;
  [MEMORY[0x189603F50] now];
  objc_super v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  double v7 = v6;
  if (self->_lastSuppressAt)
  {
    -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:");
    if (self->_last_SuppressState.suppress_SymptomDataStallScoreGood) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    self->_suppress_SymptomsNODataStall_Duration = self->_suppress_SymptomsNODataStall_Duration + v9;
    if (self->_last_SuppressState.suppress_SymptomAppPolicyScore) {
      double v10 = v8;
    }
    else {
      double v10 = 0.0;
    }
    self->_suppress_SymptomsAppPolicy_Duration = self->_suppress_SymptomsAppPolicy_Duration + v10;
    if (self->_last_SuppressState.suppress_FastCheapCellular) {
      double v11 = v8;
    }
    else {
      double v11 = 0.0;
    }
    self->_suppress_FastCheapCellular_Duration = self->_suppress_FastCheapCellular_Duration + v11;
    if (self->_last_SuppressState.suppress_2dBGuard) {
      double v12 = v8;
    }
    else {
      double v12 = 0.0;
    }
    self->_suppress_2dBGuard = self->_suppress_2dBGuard + v12;
    if (self->_last_SuppressState.suppress_NoFGnetwApp) {
      double v13 = v8;
    }
    else {
      double v13 = 0.0;
    }
    self->_suppress_NoFgNetwApp_Duration = self->_suppress_NoFgNetwApp_Duration + v13;
    if (self->_last_SuppressState.suppress_TTR) {
      double v14 = v8;
    }
    else {
      double v14 = 0.0;
    }
    self->_suppress_TTR_Duration = self->_suppress_TTR_Duration + v14;
    if (self->_last_SuppressState.suppress_UserInput) {
      double v15 = v8;
    }
    else {
      double v15 = 0.0;
    }
    self->_suppress_UserInput_Duration = self->_suppress_UserInput_Duration + v15;
    if (self->_last_SuppressState.suppress_GoodAfterRoam) {
      double v16 = v8;
    }
    else {
      double v16 = 0.0;
    }
    self->_suppress_GoodAfterRoam_Duration = self->_suppress_GoodAfterRoam_Duration + v16;
    if (self->_last_SuppressState.defer_roaming) {
      double v17 = v8;
    }
    else {
      double v17 = 0.0;
    }
    self->_suppress_Roam_Duration = self->_suppress_Roam_Duration + v17;
    if (!self->_last_SuppressState.defer_activeProbing) {
      double v8 = 0.0;
    }
    self->_suppress_ActiveProbing = self->_suppress_ActiveProbing + v8;
  }

  lastSuppressAt = self->_lastSuppressAt;
  self->_lastSuppressAt = v7;

  -[WiFiUsagePoorLinkSession setLast_SuppressState:](self, "setLast_SuppressState:", v4, v3 & 0xFFFFFFFFFFLL);
  -[WiFiUsagePoorLinkSession setIsLastSuppressStateValid:](self, "setIsLastSuppressStateValid:", 1LL);
}

- (void)tdLogic_fastTdState:(id)a3
{
  uint64_t v3 = *(void *)&a3.var1;
  unint64_t var0 = a3.var0;
  [MEMORY[0x189603F50] now];
  objc_super v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  double v7 = v6;
  if (self->_lastFastTDVotesAt)
  {
    -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:");
    if (self->_last_FastTdVotes.fastTD_vote_recommendation) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    self->_vote_FastTD_Recommendation_Duration = self->_vote_FastTD_Recommendation_Duration + v9;
    if (self->_last_FastTdVotes.fastTD_vote_TxPER) {
      double v10 = v8;
    }
    else {
      double v10 = 0.0;
    }
    self->_vote_FastTD_TXPER_Duration = self->_vote_FastTD_TXPER_Duration + v10;
    if (self->_last_FastTdVotes.fastTD_vote_FWTxPER) {
      double v11 = v8;
    }
    else {
      double v11 = 0.0;
    }
    self->_vote_FastTD_FWTxPER_Duration = self->_vote_FastTD_FWTxPER_Duration + v11;
    if (!self->_last_FastTdVotes.fastTD_vote_BeaconPER) {
      double v8 = 0.0;
    }
    self->_vote_FastTD_BeaconPER_Duration = self->_vote_FastTD_BeaconPER_Duration + v8;
  }

  lastFastTDVotesAt = self->_lastFastTDVotesAt;
  self->_lastFastTDVotesAt = v7;

  -[WiFiUsagePoorLinkSession setLast_FastTdVotes:](self, "setLast_FastTdVotes:", var0, v3);
  -[WiFiUsagePoorLinkSession setIsLastFastTdVotesValid:](self, "setIsLastFastTdVotesValid:", 1LL);
}

- (void)summarizeSession
{
  lastTDEval_ExecutedAt = self->_lastTDEval_ExecutedAt;
  if (lastTDEval_ExecutedAt)
  {
    -[NSDate timeIntervalSinceDate:](lastTDEval_ExecutedAt, "timeIntervalSinceDate:", self->_lastDecisionAt);
    if (self->_last_DecisionState.decision_TxPER) {
      double v5 = v4;
    }
    else {
      double v5 = 0.0;
    }
    self->_decision_TxPER_Duration = self->_decision_TxPER_Duration + v5;
    if (self->_last_DecisionState.decision_FWTxPER) {
      double v6 = v4;
    }
    else {
      double v6 = 0.0;
    }
    self->_decision_FWTxPER_Duration = self->_decision_FWTxPER_Duration + v6;
    if (self->_last_DecisionState.decision_BeaconPER) {
      double v7 = v4;
    }
    else {
      double v7 = 0.0;
    }
    self->_decision_BeaconPER_Duration = self->_decision_BeaconPER_Duration + v7;
    if (self->_last_DecisionState.decision_GatewayARPFailure) {
      double v8 = v4;
    }
    else {
      double v8 = 0.0;
    }
    self->_decision_GatewayARPFailure_Duration = self->_decision_GatewayARPFailure_Duration + v8;
    if (self->_last_DecisionState.decision_SymptomsDNSError) {
      double v9 = v4;
    }
    else {
      double v9 = 0.0;
    }
    self->_decision_SymptomsDNSError_Duration = self->_decision_SymptomsDNSError_Duration + v9;
    if (self->_last_DecisionState.decision_AutoLeave) {
      double v10 = v4;
    }
    else {
      double v10 = 0.0;
    }
    self->_decision_AutoLeave_Duration = self->_decision_AutoLeave_Duration + v10;
    if (self->_last_DecisionState.decision_ActiveProbe) {
      double v11 = v4;
    }
    else {
      double v11 = 0.0;
    }
    self->_decision_ActiveProbe_Duration = self->_decision_ActiveProbe_Duration + v11;
    if (!self->_last_DecisionState.decision_FastTD) {
      double v4 = 0.0;
    }
    self->_decision_FastTD_Duration = self->_decision_FastTD_Duration + v4;
    -[NSDate timeIntervalSinceDate:](self->_lastTDEval_ExecutedAt, "timeIntervalSinceDate:", self->_lastFastTDVotesAt);
    if (self->_last_FastTdVotes.fastTD_vote_recommendation) {
      double v13 = v12;
    }
    else {
      double v13 = 0.0;
    }
    self->_vote_FastTD_Recommendation_Duration = self->_vote_FastTD_Recommendation_Duration + v13;
    if (self->_last_FastTdVotes.fastTD_vote_TxPER) {
      double v14 = v12;
    }
    else {
      double v14 = 0.0;
    }
    self->_vote_FastTD_TXPER_Duration = self->_vote_FastTD_TXPER_Duration + v14;
    if (self->_last_FastTdVotes.fastTD_vote_FWTxPER) {
      double v15 = v12;
    }
    else {
      double v15 = 0.0;
    }
    self->_vote_FastTD_FWTxPER_Duration = self->_vote_FastTD_FWTxPER_Duration + v15;
    if (!self->_last_FastTdVotes.fastTD_vote_BeaconPER) {
      double v12 = 0.0;
    }
    self->_vote_FastTD_BeaconPER_Duration = self->_vote_FastTD_BeaconPER_Duration + v12;
    -[NSDate timeIntervalSinceDate:](self->_lastTDEval_ExecutedAt, "timeIntervalSinceDate:", self->_lastSuppressAt);
    if (self->_last_SuppressState.suppress_SymptomDataStallScoreGood) {
      double v17 = v16;
    }
    else {
      double v17 = 0.0;
    }
    self->_suppress_SymptomsNODataStall_Duration = self->_suppress_SymptomsNODataStall_Duration + v17;
    if (self->_last_SuppressState.suppress_SymptomAppPolicyScore) {
      double v18 = v16;
    }
    else {
      double v18 = 0.0;
    }
    self->_suppress_SymptomsAppPolicy_Duration = self->_suppress_SymptomsAppPolicy_Duration + v18;
    if (self->_last_SuppressState.suppress_FastCheapCellular) {
      double v19 = v16;
    }
    else {
      double v19 = 0.0;
    }
    self->_suppress_FastCheapCellular_Duration = self->_suppress_FastCheapCellular_Duration + v19;
    if (self->_last_SuppressState.suppress_2dBGuard) {
      double v20 = v16;
    }
    else {
      double v20 = 0.0;
    }
    self->_suppress_2dBGuard = self->_suppress_2dBGuard + v20;
    if (self->_last_SuppressState.suppress_NoFGnetwApp) {
      double v21 = v16;
    }
    else {
      double v21 = 0.0;
    }
    self->_suppress_NoFgNetwApp_Duration = self->_suppress_NoFgNetwApp_Duration + v21;
    if (self->_last_SuppressState.suppress_TTR) {
      double v22 = v16;
    }
    else {
      double v22 = 0.0;
    }
    self->_suppress_TTR_Duration = self->_suppress_TTR_Duration + v22;
    if (self->_last_SuppressState.suppress_UserInput) {
      double v23 = v16;
    }
    else {
      double v23 = 0.0;
    }
    self->_suppress_UserInput_Duration = self->_suppress_UserInput_Duration + v23;
    if (self->_last_SuppressState.suppress_GoodAfterRoam) {
      double v24 = v16;
    }
    else {
      double v24 = 0.0;
    }
    self->_suppress_GoodAfterRoam_Duration = self->_suppress_GoodAfterRoam_Duration + v24;
    if (self->_last_SuppressState.defer_roaming) {
      double v25 = v16;
    }
    else {
      double v25 = 0.0;
    }
    self->_suppress_Roam_Duration = self->_suppress_Roam_Duration + v25;
    if (!self->_last_SuppressState.defer_activeProbing) {
      double v16 = 0.0;
    }
    self->_suppress_ActiveProbing = self->_suppress_ActiveProbing + v16;
  }

- (void)sessionDidEnd:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[WiFiUsagePoorLinkSession sessionEndedBy:](&OBJC_CLASS___WiFiUsagePoorLinkSession, "sessionEndedBy:");
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(@"%s (%@): %@", "-[WiFiUsagePoorLinkSession sessionDidEnd:]", self, v5);

  -[WiFiUsagePoorLinkSession setSessionEndedBy:](self, "setSessionEndedBy:", v3);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession sessionDidEnd](&v6, sel_sessionDidEnd);
}

- (void)sessionDidStart:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[WiFiUsagePoorLinkSession sessionStartedBy:](&OBJC_CLASS___WiFiUsagePoorLinkSession, "sessionStartedBy:");
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(@"%s: %@", "-[WiFiUsagePoorLinkSession sessionDidStart:]", v5);

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession sessionDidStart](&v13, sel_sessionDidStart);
  [MEMORY[0x189603F50] date];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsagePoorLinkSession setSessionStartedBy:](self, "setSessionStartedBy:", v3);
  if (self->_lastJoinAt)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:");
    -[WiFiUsagePoorLinkSession setTimeSinceJoinATStart:](self, "setTimeSinceJoinATStart:");
  }

  self->_unint64_t perSSID_deferJoin = 0x7FFFFFFFFFFFFFFFLL;
  self->_unint64_t perBSSID_deferJoin = 0x7FFFFFFFFFFFFFFFLL;
  self->_BOOL lastTdRecommended = 0;
  self->_alerted = 0;
  self->_tdExecuted = 0;
  self->_tdConfirmed = 0;
  self->_toBeClosedAfterLQM = 0;
  self->_toBeClosedAfterTdLogicEnd = 0;
  bssidAtTD = self->_bssidAtTD;
  self->_bssidAtTD = 0LL;

  ssidAtTD = self->_ssidAtTD;
  self->_ssidAtTD = 0LL;

  self->_waitingOnLinkUp = 0;
  lastDecisionAt = self->_lastDecisionAt;
  self->_lastDecisionAt = 0LL;

  lastFastTDVotesAt = self->_lastFastTDVotesAt;
  self->_lastFastTDVotesAt = 0LL;

  lastSuppressAt = self->_lastSuppressAt;
  self->_lastSuppressAt = 0LL;

  lastLinkDownAt = self->_lastLinkDownAt;
  self->_lastLinkDownAt = 0LL;

  *(_OWORD *)&self->_last_DecisionState.decision_TxPER = 0u;
  *(_OWORD *)&self->_last_DecisionState.appsUsingWiFi = 0u;
  *(void *)&self->_last_SuppressState.aggressiveTDEnabled = 0LL;
  *(void *)&self->_last_SuppressState.suppress_FastCheapCellular = 0LL;
  self->_last_FastTdVotes.fastTD_voteCount = 0LL;
  *(void *)&self->_last_FastTdVotes.fastTD_vote_recommendation = 0LL;
  self->_isLastDecisionStateValid = 0;
  self->_isLastSuppressStateValid = 0;
  self->_isLastFastTdVotesValid = 0;
  -[WiFiUsagePoorLinkSession setLast_RSSIMode:](self, "setLast_RSSIMode:", 0LL);
  -[WiFiUsagePoorLinkSession setLastTDEval_ConfirmedAt:](self, "setLastTDEval_ConfirmedAt:", 0LL);
  -[WiFiUsagePoorLinkSession setLastTDEval_ExecutedAt:](self, "setLastTDEval_ExecutedAt:", 0LL);
  -[WiFiUsagePoorLinkSession setLastTdEval_StartedBy:](self, "setLastTdEval_StartedBy:", 0LL);
  -[WiFiUsagePoorLinkSession setLastTdEval_EndedBy:](self, "setLastTdEval_EndedBy:", 0LL);
  -[WiFiUsagePoorLinkSession setLastTDEval_TDEvalDuration:](self, "setLastTDEval_TDEvalDuration:", 0.0);
  -[WiFiUsagePoorLinkSession setLastTDEval_rssiAtTD:](self, "setLastTDEval_rssiAtTD:", 0x7FFFFFFFFFFFFFFFLL);
  -[WiFiUsagePoorLinkSession setLastTDEval_waitOnRoamStatusDuration:]( self,  "setLastTDEval_waitOnRoamStatusDuration:",  9.22337204e18);
  -[WiFiUsagePoorLinkSession setTdEvalDurationCumulative:](self, "setTdEvalDurationCumulative:", 0.0);
  -[WiFiUsagePoorLinkSession setWaitOnRoamStatusDurationCumulative:]( self,  "setWaitOnRoamStatusDurationCumulative:",  0LL);
  -[WiFiUsagePoorLinkSession setNextJoinReason:](self, "setNextJoinReason:", 0LL);
  -[WiFiUsagePoorLinkSession setNextJoinIsSameSSID:](self, "setNextJoinIsSameSSID:", 0LL);
  -[WiFiUsagePoorLinkSession setNextJoinWhileDeferJoin:](self, "setNextJoinWhileDeferJoin:", 0LL);
  -[WiFiUsagePoorLinkSession setTimeToNextJoin:](self, "setTimeToNextJoin:", 9.22337204e18);
  -[WiFiUsagePoorLinkSession setNextLinkUpIsSameBSSID:](self, "setNextLinkUpIsSameBSSID:", 0LL);
  -[WiFiUsagePoorLinkSession setRssiAtNextLinkUp:](self, "setRssiAtNextLinkUp:", 0x7FFFFFFFFFFFFFFFLL);
  -[WiFiUsagePoorLinkSession setTdRecommendAtNextLinkUp:](self, "setTdRecommendAtNextLinkUp:", 0LL);
  [v6 timeIntervalSinceDate:self->_lastJoinAt];
  -[WiFiUsagePoorLinkSession setTimeSinceJoinATStart:](self, "setTimeSinceJoinATStart:");
  -[WiFiUsagePoorLinkSession setDecision_TxPER_Duration:](self, "setDecision_TxPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_FWTxPER_Duration:](self, "setDecision_FWTxPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_BeaconPER_Duration:](self, "setDecision_BeaconPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_GatewayARPFailure_Duration:]( self,  "setDecision_GatewayARPFailure_Duration:",  0.0);
  -[WiFiUsagePoorLinkSession setDecision_SymptomsDNSError_Duration:]( self,  "setDecision_SymptomsDNSError_Duration:",  0.0);
  -[WiFiUsagePoorLinkSession setDecision_AutoLeave_Duration:](self, "setDecision_AutoLeave_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_ActiveProbe_Duration:](self, "setDecision_ActiveProbe_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_FastTD_Duration:](self, "setDecision_FastTD_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setVote_FastTD_TXPER_Duration:](self, "setVote_FastTD_TXPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setVote_FastTD_BeaconPER_Duration:](self, "setVote_FastTD_BeaconPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setVote_FastTD_FWTxPER_Duration:](self, "setVote_FastTD_FWTxPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setVote_FastTD_Recommendation_Duration:]( self,  "setVote_FastTD_Recommendation_Duration:",  0.0);
  -[WiFiUsagePoorLinkSession setSuppress_SymptomsNODataStall_Duration:]( self,  "setSuppress_SymptomsNODataStall_Duration:",  0.0);
  -[WiFiUsagePoorLinkSession setSuppress_SymptomsAppPolicy_Duration:]( self,  "setSuppress_SymptomsAppPolicy_Duration:",  0.0);
  -[WiFiUsagePoorLinkSession setSuppress_FastCheapCellular_Duration:]( self,  "setSuppress_FastCheapCellular_Duration:",  0.0);
  -[WiFiUsagePoorLinkSession setSuppress_2dBGuard:](self, "setSuppress_2dBGuard:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_NoFgNetwApp_Duration:](self, "setSuppress_NoFgNetwApp_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_TTR_Duration:](self, "setSuppress_TTR_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_UserInput_Duration:](self, "setSuppress_UserInput_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_GoodAfterRoam_Duration:](self, "setSuppress_GoodAfterRoam_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_Roam_Duration:](self, "setSuppress_Roam_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_ActiveProbing:](self, "setSuppress_ActiveProbing:", 0.0);
  -[WiFiUsagePoorLinkSession setPerCoreRSSI_NotUsed_Duration:](self, "setPerCoreRSSI_NotUsed_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setPerCoreRSSI_Core0_Duration:](self, "setPerCoreRSSI_Core0_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setPerCoreRSSI_Core1_Duration:](self, "setPerCoreRSSI_Core1_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setRoamStatus_Succeeded_Count_WhileTDWait:]( self,  "setRoamStatus_Succeeded_Count_WhileTDWait:",  0LL);
  -[WiFiUsagePoorLinkSession setRoamStatus_Failed_Count_WhileTDWait:]( self,  "setRoamStatus_Failed_Count_WhileTDWait:",  0LL);
  -[WiFiUsagePoorLinkSession setRoamStatus_FailedFilteredOut_Count_WhileTDWait:]( self,  "setRoamStatus_FailedFilteredOut_Count_WhileTDWait:",  0LL);
  -[WiFiUsagePoorLinkSession setRoamStatus_FailedNotFound_Count_WhileTDWait:]( self,  "setRoamStatus_FailedNotFound_Count_WhileTDWait:",  0LL);
  -[WiFiUsagePoorLinkSession setRoamStatus_Succeeded_Count_BeforeTDWait:]( self,  "setRoamStatus_Succeeded_Count_BeforeTDWait:",  0LL);
  -[WiFiUsagePoorLinkSession setRoamStatus_Failed_Count_BeforeTDWait:]( self,  "setRoamStatus_Failed_Count_BeforeTDWait:",  0LL);
  -[WiFiUsagePoorLinkSession setRoamStatus_FailedFilteredOut_Count_BeforeTDWait:]( self,  "setRoamStatus_FailedFilteredOut_Count_BeforeTDWait:",  0LL);
  -[WiFiUsagePoorLinkSession setRoamStatus_FailedNotFound_Count_BeforeTDWait:]( self,  "setRoamStatus_FailedNotFound_Count_BeforeTDWait:",  0LL);
}

- (id)eventDictionary:(BOOL)a3
{
  double v4 = (void *)MEMORY[0x189603FC8];
  v216.receiver = self;
  v216.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession eventDictionary:](&v216, sel_eventDictionary_, a3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dictionaryWithDictionary:v5];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_badLinkRssi != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 forKeyedSubscript:@"BadLinkRssiThreshold"];
  }

  if (self->_goodLinkRssi != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v8 forKeyedSubscript:@"GoodLinkRssiThreshold"];
  }

  if (self->_perSSID_deferJoin != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:");
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v9 forKeyedSubscript:@"PerSsidDeferJoinSeconds"];
  }

  if (self->_perBSSID_deferJoin != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:");
    double v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v10 forKeyedSubscript:@"PerBssidDeferJoinSeconds"];
  }

  double v11 = (void *)MEMORY[0x189607968];
  -[WiFiUsagePoorLinkSession timeSinceJoinATStart](self, "timeSinceJoinATStart");
  *(float *)&double v12 = v12;
  [v11 numberWithFloat:v12];
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v13 forKeyedSubscript:@"timeSinceJoinAtSessionStart"];

  double v14 = (void *)MEMORY[0x189607968];
  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  *(float *)&double v15 = v15;
  [v14 numberWithFloat:v15];
  double v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v16 forKeyedSubscript:@"SessionDuration"];

  +[WiFiUsagePoorLinkSession sessionStartedBy:]( &OBJC_CLASS___WiFiUsagePoorLinkSession,  "sessionStartedBy:",  -[WiFiUsagePoorLinkSession sessionStartedBy](self, "sessionStartedBy"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v17 forKeyedSubscript:@"TD_SessionStartedBy"];

  +[WiFiUsagePoorLinkSession sessionEndedBy:]( &OBJC_CLASS___WiFiUsagePoorLinkSession,  "sessionEndedBy:",  -[WiFiUsagePoorLinkSession sessionEndedBy](self, "sessionEndedBy"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v18 forKeyedSubscript:@"TD_SessionEndedBy"];

  if (self->_alerted) {
    double v19 = @"YES";
  }
  else {
    double v19 = @"NO";
  }
  -[WiFiUsagePoorLinkSession lastTDEval_AlertedAt](self, "lastTDEval_AlertedAt");
  double v20 = (void *)objc_claimAutoreleasedReturnValue();
  lastJoinAt = self->_lastJoinAt;
  -[WiFiUsagePoorLinkSession lastTdEval_StartedBy](self, "lastTdEval_StartedBy");
  double v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsagePoorLinkSession lastTdEval_EndedBy](self, "lastTdEval_EndedBy");
  double v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s - alerted:%@ lastTDEval_AlertedAt:%@ lastJoin:%@ TDEvalStartedBy:%@ TDEvalEndedBy:%@",  "-[WiFiUsagePoorLinkSession eventDictionary:]",  v19,  v20,  lastJoinAt,  v22,  v23);

  if (self->_alerted)
  {
    double v24 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession lastTDEval_AlertedAt](self, "lastTDEval_AlertedAt");
    double v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 timeIntervalSinceDate:self->_lastJoinAt];
    [v24 numberWithInteger:(unint64_t)v26];
    double v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v27 forKeyedSubscript:@"TD_LastTDEval_TimeToAlert"];

    double v28 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession lastTDEval_TDEvalDuration](self, "lastTDEval_TDEvalDuration");
    [v28 numberWithInteger:(unint64_t)v29];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v30 forKeyedSubscript:@"TD_LastTDEval_EvalDuration"];

    -[WiFiUsagePoorLinkSession lastTdEval_StartedBy](self, "lastTdEval_StartedBy");
    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v31 forKeyedSubscript:@"TD_LastTDEval_StartedBy"];
    v32 = -[WiFiUsagePoorLinkSession lastTdEval_EndedBy](self, "lastTdEval_EndedBy");
    [v6 setObject:v32 forKeyedSubscript:@"TD_LastTDEval_EvalEndedBy"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[WiFiUsagePoorLinkSession tdConfirmed](self, "tdConfirmed"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v33 forKeyedSubscript:@"TD_LastTDEval_Confirmed"];

  if (self->_isLastDecisionStateValid)
  {
    v34 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v34 numberWithBool:v215];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v35 forKeyedSubscript:@"TD_Decision_TxPER"];

    v36 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v36 numberWithBool:v214];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v37 forKeyedSubscript:@"TD_Decision_FWTxPER"];

    v38 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v38 numberWithBool:v213];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v39 forKeyedSubscript:@"TD_Decision_BeaconPER"];

    v40 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v40 numberWithBool:v212];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v41 forKeyedSubscript:@"TD_Decision_GatewayARPFailure"];

    v42 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v42 numberWithBool:v211];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v43 forKeyedSubscript:@"TD_Decision_SymptomsDNSError"];

    v44 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v44 numberWithBool:v210];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v45 forKeyedSubscript:@"TD_Decision_AutoLeave"];

    v46 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v46 numberWithBool:v209];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v47 forKeyedSubscript:@"TD_Decision_ActiveProbe"];

    v48 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v48 numberWithBool:v208];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v49 forKeyedSubscript:@"TD_Decision_FastTD"];

    v50 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v50 numberWithInteger:v207];
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v51 forKeyedSubscript:@"TD_AutoLeaveRSSIthreshold"];

    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    v52 = +[WiFiUsagePrivacyFilter getLabelForTDMode:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "getLabelForTDMode:", v206);
    [v6 setObject:v52 forKeyedSubscript:@"TD_Mode"];

    v53 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v53 numberWithBool:v205];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v54 forKeyedSubscript:@"TD_EdgeBSS"];

    v55 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v55 numberWithBool:v204];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v56 forKeyedSubscript:@"TD_MotionDetected"];

    v57 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v57 numberWithBool:v203];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v58 forKeyedSubscript:@"TD_WalkoutDetected"];

    v59 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v59 numberWithBool:v202];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v60 forKeyedSubscript:@"TD_WaitForRoam"];

    v61 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v61 numberWithBool:v201];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v62 forKeyedSubscript:@"TD_AppsUsingWiFi"];

    v63 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    [v63 numberWithBool:v200];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v64 forKeyedSubscript:@"TD_monitorOnly"];
  }

  if (self->_isLastFastTdVotesValid)
  {
    v65 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    [v65 numberWithBool:v66 & 1];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v67 forKeyedSubscript:@"TD_VoteFastTD_LinkRecommendation"];

    v68 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    [v68 numberWithBool:(v69 >> 8) & 1];
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v70 forKeyedSubscript:@"TD_VoteFastTD_TXPER"];

    v71 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    [v71 numberWithBool:(v72 >> 24) & 1];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v73 forKeyedSubscript:@"TD_VoteFastTD_FWTXPER"];

    v74 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    [v74 numberWithBool:(v75 >> 16) & 1];
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v76 forKeyedSubscript:@"TD_VoteFastTD_BeaconPER"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v77 forKeyedSubscript:@"TD_VoteFastTD_VoteCount"];

    v78 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    [v78 numberWithBool:HIDWORD(v79) & 1];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v80 forKeyedSubscript:@"TD_StateFastTD_RTApp"];

    v81 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    [v81 numberWithBool:(v82 >> 40) & 1];
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v83 forKeyedSubscript:@"TD_StateFastTD_Cheap5G"];
  }

  if (self->_lastTDEval_ConfirmedAt)
  {
    v84 = (void *)MEMORY[0x189607968];
    v85 = -[WiFiUsagePoorLinkSession lastTDEval_ConfirmedAt](self, "lastTDEval_ConfirmedAt");
    v86 = -[WiFiUsagePoorLinkSession lastTDEval_AlertedAt](self, "lastTDEval_AlertedAt");
    [v85 timeIntervalSinceDate:v86];
    [v84 numberWithInteger:(unint64_t)v87];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v88 forKeyedSubscript:@"TD_LastTDEval_TimeToConfirm"];

    if (self->_isLastSuppressStateValid)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 24) & 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v89 forKeyedSubscript:@"TD_Suppress_SymptomsNODataStall"];

      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 32) & 1);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v90 forKeyedSubscript:@"TD_Suppress_SymptomsAppPolicy"];

      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 40) & 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v91 forKeyedSubscript:@"TD_Suppress_FastCheapCellular"];

      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 48) & 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v92 forKeyedSubscript:@"TD_Suppress_2dBGuard"];

      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 56) & 1);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v93 forKeyedSubscript:@"TD_Suppress_NoFGnetwApp"];

      v94 = (void *)MEMORY[0x189607968];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      [v94 numberWithBool:v95 & 1];
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v96 forKeyedSubscript:@"TD_Suppress_TTR"];

      v97 = (void *)MEMORY[0x189607968];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      [v97 numberWithBool:(v98 >> 8) & 1];
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v99 forKeyedSubscript:@"TD_Suppress_UserInput"];

      v100 = (void *)MEMORY[0x189607968];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      [v100 numberWithBool:(v101 >> 16) & 1];
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v102 forKeyedSubscript:@"TD_Suppress_GoodAfterRoam"];

      v103 = (void *)MEMORY[0x189607968];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      [v103 numberWithBool:(v104 >> 24) & 1];
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v105 forKeyedSubscript:@"TD_Suppress_ActiveProbing"];

      v106 = (void *)MEMORY[0x189607968];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      [v106 numberWithBool:HIDWORD(v107) & 1];
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v108 forKeyedSubscript:@"TD_Suppress_Roam"];

      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 16) & 1);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v109 forKeyedSubscript:@"TD_FastTDEvaluation"];

      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") & 1);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v110 forKeyedSubscript:@"TD_AggressiveTD"];

      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 8) & 1);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v111 forKeyedSubscript:@"TD_RNF_allowed"];
    }

    v199.receiver = self;
    v199.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
    v112 = -[WiFiUsageSession sessionEndTime](&v199, sel_sessionEndTime);
    [v112 timeIntervalSinceDate:self->_lastTDEval_ConfirmedAt];

    lastTDEval_ExecutedAt = self->_lastTDEval_ExecutedAt;
    if (lastTDEval_ExecutedAt) {
      -[NSDate timeIntervalSinceDate:](lastTDEval_ExecutedAt, "timeIntervalSinceDate:", self->_lastTDEval_ConfirmedAt);
    }
    -[WiFiUsagePoorLinkSession suppress_SymptomsNODataStall_Duration](self, "suppress_SymptomsNODataStall_Duration");
    v114 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v114 forKeyedSubscript:@"TD_Suppress_SymptomsNODataStall_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_SymptomsAppPolicy_Duration](self, "suppress_SymptomsAppPolicy_Duration");
    v115 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v115 forKeyedSubscript:@"TD_Suppress_SymptomsAppPolicy_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_FastCheapCellular_Duration](self, "suppress_FastCheapCellular_Duration");
    v116 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v116 forKeyedSubscript:@"TD_Suppress_FastCheapCellular_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_2dBGuard](self, "suppress_2dBGuard");
    v117 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v117 forKeyedSubscript:@"TD_Suppress_2dBGuard_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_NoFgNetwApp_Duration](self, "suppress_NoFgNetwApp_Duration");
    v118 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v118 forKeyedSubscript:@"TD_Suppress_NoFGnetwApp_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_TTR_Duration](self, "suppress_TTR_Duration");
    v119 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v119 forKeyedSubscript:@"TD_Suppress_TTR_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_UserInput_Duration](self, "suppress_UserInput_Duration");
    v120 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v120 forKeyedSubscript:@"TD_Suppress_UserInput_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_GoodAfterRoam_Duration](self, "suppress_GoodAfterRoam_Duration");
    v121 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v121 forKeyedSubscript:@"TD_Suppress_GoodAfterRoam_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_ActiveProbing](self, "suppress_ActiveProbing");
    v122 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v122 forKeyedSubscript:@"TD_Suppress_ActiveProbing_PercTimeToExecute"];

    -[WiFiUsagePoorLinkSession suppress_Roam_Duration](self, "suppress_Roam_Duration");
    v123 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
    [v6 setObject:v123 forKeyedSubscript:@"TD_Suppress_Roam_PercTimeToExecute"];
  }
  v124 = +[WiFiUsagePrivacyFilter getLabelForCoreRssiMode:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForCoreRssiMode:",  -[WiFiUsagePoorLinkSession last_RSSIMode](self, "last_RSSIMode"));
  [v6 setObject:v124 forKeyedSubscript:@"TD_perCoreRSSIinUse"];

  if (self->_lastTDEval_waitOnRoamStatusDuration != 9.22337204e18)
  {
    v125 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession lastTDEval_waitOnRoamStatusDuration](self, "lastTDEval_waitOnRoamStatusDuration");
    [v125 numberWithUnsignedInteger:(unint64_t)v126];
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v127 forKeyedSubscript:@"TD_LastTDEval_WaitOnRoamStatusDuration"];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[WiFiUsagePoorLinkSession waitOnRoamStatusDurationCumulative](self, "waitOnRoamStatusDurationCumulative"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v128 forKeyedSubscript:@"TD_WaitOnRoamStatus_CumulativeDuration"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[WiFiUsagePoorLinkSession tdExecuted](self, "tdExecuted"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v129 forKeyedSubscript:@"TD_LastTDEval_Executed"];

  if (self->_tdExecuted)
  {
    v130 = (void *)MEMORY[0x189607968];
    v131 = -[WiFiUsagePoorLinkSession lastTDEval_ExecutedAt](self, "lastTDEval_ExecutedAt");
    v132 = -[WiFiUsagePoorLinkSession lastTDEval_ConfirmedAt](self, "lastTDEval_ConfirmedAt");
    [v131 timeIntervalSinceDate:v132];
    [v130 numberWithInteger:vcvtpd_u64_f64(v133)];
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v134 forKeyedSubscript:@"TD_LastTDEval_TimeToExecute"];
  }

  v135 = self->_lastTDEval_ExecutedAt;
  if (v135) {
    -[NSDate timeIntervalSinceDate:](v135, "timeIntervalSinceDate:", self->_lastTDEval_AlertedAt);
  }
  -[WiFiUsagePoorLinkSession decision_TxPER_Duration](self, "decision_TxPER_Duration");
  uint64_t v136 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v137 = (void *)v136;
  if (v136) {
    v138 = (void *)v136;
  }
  else {
    v138 = &unk_18A1B43B0;
  }
  [v6 setObject:v138 forKeyedSubscript:@"TD_Decision_TxPER_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession decision_FWTxPER_Duration](self, "decision_FWTxPER_Duration");
  uint64_t v139 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v140 = (void *)v139;
  if (v139) {
    v141 = (void *)v139;
  }
  else {
    v141 = &unk_18A1B43B0;
  }
  [v6 setObject:v141 forKeyedSubscript:@"TD_Decision_FWTxPER_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession decision_BeaconPER_Duration](self, "decision_BeaconPER_Duration");
  uint64_t v142 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v143 = (void *)v142;
  if (v142) {
    v144 = (void *)v142;
  }
  else {
    v144 = &unk_18A1B43B0;
  }
  [v6 setObject:v144 forKeyedSubscript:@"TD_Decision_BeaconPER_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession decision_GatewayARPFailure_Duration](self, "decision_GatewayARPFailure_Duration");
  uint64_t v145 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v146 = (void *)v145;
  if (v145) {
    v147 = (void *)v145;
  }
  else {
    v147 = &unk_18A1B43B0;
  }
  [v6 setObject:v147 forKeyedSubscript:@"TD_Decision_GatewayARPFailure_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession decision_SymptomsDNSError_Duration](self, "decision_SymptomsDNSError_Duration");
  uint64_t v148 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v149 = (void *)v148;
  if (v148) {
    v150 = (void *)v148;
  }
  else {
    v150 = &unk_18A1B43B0;
  }
  [v6 setObject:v150 forKeyedSubscript:@"TD_Decision_SymptomsDNSError_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession decision_AutoLeave_Duration](self, "decision_AutoLeave_Duration");
  uint64_t v151 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v152 = (void *)v151;
  if (v151) {
    v153 = (void *)v151;
  }
  else {
    v153 = &unk_18A1B43B0;
  }
  [v6 setObject:v153 forKeyedSubscript:@"TD_Decision_AutoLeave_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession decision_ActiveProbe_Duration](self, "decision_ActiveProbe_Duration");
  uint64_t v154 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v155 = (void *)v154;
  if (v154) {
    v156 = (void *)v154;
  }
  else {
    v156 = &unk_18A1B43B0;
  }
  [v6 setObject:v156 forKeyedSubscript:@"TD_Decision_ActiveProbe_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession decision_FastTD_Duration](self, "decision_FastTD_Duration");
  uint64_t v157 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v158 = (void *)v157;
  if (v157) {
    v159 = (void *)v157;
  }
  else {
    v159 = &unk_18A1B43B0;
  }
  [v6 setObject:v159 forKeyedSubscript:@"TD_Decision_FastTD_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession vote_FastTD_Recommendation_Duration](self, "vote_FastTD_Recommendation_Duration");
  uint64_t v160 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v161 = (void *)v160;
  if (v160) {
    v162 = (void *)v160;
  }
  else {
    v162 = &unk_18A1B43B0;
  }
  [v6 setObject:v162 forKeyedSubscript:@"TD_VoteFastTD_LinkRecommendation_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession vote_FastTD_TXPER_Duration](self, "vote_FastTD_TXPER_Duration");
  uint64_t v163 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v164 = (void *)v163;
  if (v163) {
    v165 = (void *)v163;
  }
  else {
    v165 = &unk_18A1B43B0;
  }
  [v6 setObject:v165 forKeyedSubscript:@"TD_VoteFastTD_TXPER_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession vote_FastTD_FWTxPER_Duration](self, "vote_FastTD_FWTxPER_Duration");
  uint64_t v166 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v167 = (void *)v166;
  if (v166) {
    v168 = (void *)v166;
  }
  else {
    v168 = &unk_18A1B43B0;
  }
  [v6 setObject:v168 forKeyedSubscript:@"TD_VoteFastTD_FWTXPER_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession vote_FastTD_BeaconPER_Duration](self, "vote_FastTD_BeaconPER_Duration");
  uint64_t v169 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v170 = (void *)v169;
  if (v169) {
    v171 = (void *)v169;
  }
  else {
    v171 = &unk_18A1B43B0;
  }
  [v6 setObject:v171 forKeyedSubscript:@"TD_VoteFastTD_BeaconPER_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession perCoreRSSI_Core0_Duration](self, "perCoreRSSI_Core0_Duration");
  uint64_t v172 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v173 = (void *)v172;
  if (v172) {
    v174 = (void *)v172;
  }
  else {
    v174 = &unk_18A1B43B0;
  }
  [v6 setObject:v174 forKeyedSubscript:@"TD_perCoreRSSICore0_PercTDEvalDuration"];

  -[WiFiUsagePoorLinkSession perCoreRSSI_Core1_Duration](self, "perCoreRSSI_Core1_Duration");
  uint64_t v175 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:");
  v176 = (void *)v175;
  if (v175) {
    v177 = (void *)v175;
  }
  else {
    v177 = &unk_18A1B43B0;
  }
  [v6 setObject:v177 forKeyedSubscript:@"TD_perCoreRSSICore1_PercTDEvalDuration"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[WiFiUsagePoorLinkSession rssiAtJoin](self, "rssiAtJoin"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v178 forKeyedSubscript:@"TD_rssiAtJoin"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsagePoorLinkSession tdRecommendAtNextLinkUp](self, "tdRecommendAtNextLinkUp"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v179 forKeyedSubscript:@"TD_TDRecommendAtJoin"];

  if (self->_tdExecuted && self->_lastTDEval_rssiAtTD != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession lastTDEval_rssiAtTD](self, "lastTDEval_rssiAtTD"));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v180 forKeyedSubscript:@"TD_rssiAtLastTD"];
  }

  if (self->_nextJoinReason)
  {
    v181 = (void *)MEMORY[0x189607968];
    -[WiFiUsagePoorLinkSession timeToNextJoin](self, "timeToNextJoin");
    *(float *)&double v182 = v182;
    [v181 numberWithFloat:v182];
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v183 forKeyedSubscript:@"TD_timeToNextJoin"];
    v184 = -[WiFiUsagePoorLinkSession nextJoinReason](self, "nextJoinReason");
    [v6 setObject:v184 forKeyedSubscript:@"TD_nextJoinReason"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsagePoorLinkSession nextJoinIsSameSSID](self, "nextJoinIsSameSSID"));
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v185 forKeyedSubscript:@"TD_nextLinkUpWasSameSSID"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsagePoorLinkSession nextLinkUpIsSameBSSID](self, "nextLinkUpIsSameBSSID"));
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v186 forKeyedSubscript:@"TD_nextLinkUpWasSameBSSID"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsagePoorLinkSession nextJoinWhileDeferJoin](self, "nextJoinWhileDeferJoin"));
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v187 forKeyedSubscript:@"TD_nextJoinWhileDeferJoin"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession rssiAtNextLinkUp](self, "rssiAtNextLinkUp"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v188 forKeyedSubscript:@"TD_RSSIatNextLinkUp"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsagePoorLinkSession tdRecommendAtNextLinkUp](self, "tdRecommendAtNextLinkUp"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v189 forKeyedSubscript:@"TD_TDRecommendAtNextLinkUp"];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession roamStatus_Succeeded_Count_WhileTDWait](self, "roamStatus_Succeeded_Count_WhileTDWait"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v190 forKeyedSubscript:@"TD_roamStatus_Succeeded_Count_WhileTDWait"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession roamStatus_Failed_Count_WhileTDWait](self, "roamStatus_Failed_Count_WhileTDWait"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v191 forKeyedSubscript:@"TD_roamStatus_Failed_Count_WhileTDWait"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession roamStatus_FailedFilteredOut_Count_WhileTDWait]( self,  "roamStatus_FailedFilteredOut_Count_WhileTDWait"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v192 forKeyedSubscript:@"TD_roamStatus_FailedFilteredOut_Count_WhileTDWait"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession roamStatus_FailedNotFound_Count_WhileTDWait]( self,  "roamStatus_FailedNotFound_Count_WhileTDWait"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v193 forKeyedSubscript:@"TD_roamStatus_FailedNotFound_Count_WhileTDWait"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession roamStatus_Succeeded_Count_BeforeTDWait](self, "roamStatus_Succeeded_Count_BeforeTDWait"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v194 forKeyedSubscript:@"TD_roamStatus_Succeeded_Count_BeforeTDWait"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession roamStatus_Failed_Count_BeforeTDWait](self, "roamStatus_Failed_Count_BeforeTDWait"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v195 forKeyedSubscript:@"TD_roamStatus_Failed_Count_BeforeTDWait"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession roamStatus_FailedFilteredOut_Count_BeforeTDWait]( self,  "roamStatus_FailedFilteredOut_Count_BeforeTDWait"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v196 forKeyedSubscript:@"TD_roamStatus_FailedFilteredOut_Count_BeforeTDWait"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[WiFiUsagePoorLinkSession roamStatus_FailedNotFound_Count_BeforeTDWait]( self,  "roamStatus_FailedNotFound_Count_BeforeTDWait"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v197 forKeyedSubscript:@"TD_roamStatus_FailedNotFound_Count_BeforeTDWait"];

  return v6;
}

- (WiFiUsagePoorLinkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4 onQueue:(id)a5
{
  double v8 = (NSString *)a3;
  double v9 = (dispatch_queue_s *)a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  double v10 = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v28,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  9LL,  v8,  a4);
  double v11 = -[WiFiUsageSessionCAConfig initWithSampling:minInterval:]( objc_alloc(&OBJC_CLASS___WiFiUsageSessionCAConfig),  "initWithSampling:minInterval:",  2LL,  86400.0);
  -[WiFiUsageSession setCa_config:](v10, "setCa_config:", v11);

  dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v9);
  endSessionTimer = v10->_endSessionTimer;
  v10->_endSessionTimer = (OS_dispatch_source *)v12;

  queue = v10->_queue;
  v10->_queue = (OS_dispatch_queue *)v9;
  double v15 = v9;

  interface = v10->_interface;
  v10->_interface = v8;
  double v17 = v8;

  v10->_badLinkRssi = 0x7FFFFFFFFFFFFFFFLL;
  v10->_int64_t goodLinkRssi = 0x7FFFFFFFFFFFFFFFLL;
  v10->_unint64_t perSSID_deferJoin = 0x7FFFFFFFFFFFFFFFLL;
  v10->_unint64_t perBSSID_deferJoin = 0x7FFFFFFFFFFFFFFFLL;
  v10->_BOOL linkIsUp = 0;
  lastJoinAt = v10->_lastJoinAt;
  v10->_lastJoinAt = 0LL;

  v10->_justJoined = 0;
  v10->_alerted = 0;
  v10->_tdExecuted = 0;
  v10->_toBeClosedAfterLQM = 0;
  v10->_waitingOnLinkUp = 0;
  bssidAtTD = v10->_bssidAtTD;
  v10->_bssidAtTD = 0LL;

  ssidAtTD = v10->_ssidAtTD;
  v10->_ssidAtTD = 0LL;

  objc_initWeak(&location, v10);
  double v21 = (dispatch_source_s *)v10->_endSessionTimer;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __74__WiFiUsagePoorLinkSession_initWithInterfaceName_andCapabilities_onQueue___block_invoke;
  handler[3] = &unk_18A16E160;
  objc_copyWeak(&v26, &location);
  double v22 = v10;
  double v25 = v22;
  dispatch_source_set_event_handler(v21, handler);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  return v22;
}

void __74__WiFiUsagePoorLinkSession_initWithInterfaceName_andCapabilities_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_BYTE *)(*(void *)(a1 + 32) + 12020LL))
  {
    id v3 = WeakRetained;
    [WeakRetained sessionDidEnd:2];
    id WeakRetained = v3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  double v4 = -[WiFiUsageSession copyWithZone:](&v8, sel_copyWithZone_, a3);
  *((void *)v4 + 1494) = self->_badLinkRssi;
  *((void *)v4 + 1495) = self->_goodLinkRssi;
  *((void *)v4 + 1496) = self->_perSSID_deferJoin;
  *((void *)v4 + 1497) = self->_perBSSID_deferJoin;
  *((_DWORD *)v4 + 3019) = self->_sessionStartedBy;
  *((_DWORD *)v4 + 3020) = self->_sessionEndedBy;
  v4[11984] = self->_linkIsUp;
  objc_storeStrong((id *)v4 + 1499, self->_lastJoinAt);
  v4[12000] = self->_justJoined;
  objc_storeStrong((id *)v4 + 1501, self->_lastLinkDownAt);
  v4[12016] = self->_lastTdRecommended;
  v4[12017] = self->_alerted;
  v4[12064] = self->_tdExecuted;
  v4[12018] = self->_toBeClosedAfterLQM;
  v4[12019] = self->_toBeClosedAfterTdLogicEnd;
  v4[12020] = self->_waitingOnLinkUp;
  objc_storeStrong((id *)v4 + 1503, self->_bssidAtTD);
  objc_storeStrong((id *)v4 + 1504, self->_ssidAtTD);
  objc_storeStrong((id *)v4 + 1505, self->_lastDecisionAt);
  objc_storeStrong((id *)v4 + 1506, self->_lastFastTDVotesAt);
  objc_storeStrong((id *)v4 + 1507, self->_lastSuppressAt);
  v4[12066] = self->_tdConfirmed;
  v4[12067] = self->_isLastDecisionStateValid;
  v4[12068] = self->_isLastSuppressStateValid;
  v4[12069] = self->_isLastFastTdVotesValid;
  __int128 v5 = *(_OWORD *)&self->_last_DecisionState.appsUsingWiFi;
  *((_OWORD *)v4 + 782) = *(_OWORD *)&self->_last_DecisionState.decision_TxPER;
  *((_OWORD *)v4 + 783) = v5;
  uint64_t v6 = *(void *)&self->_last_SuppressState.suppress_FastCheapCellular;
  *((void *)v4 + 1560) = *(void *)&self->_last_SuppressState.aggressiveTDEnabled;
  *(void *)(v4 + 12485) = v6;
  *((_OWORD *)v4 + 781) = self->_last_FastTdVotes;
  *((void *)v4 + 1511) = self->_last_RSSIMode;
  objc_storeStrong((id *)v4 + 1512, self->_lastTdEval_StartedBy);
  objc_storeStrong((id *)v4 + 1513, self->_lastTdEval_EndedBy);
  objc_storeStrong((id *)v4 + 1514, self->_lastTDEval_AlertedAt);
  objc_storeStrong((id *)v4 + 1515, self->_lastTDEval_ConfirmedAt);
  objc_storeStrong((id *)v4 + 1516, self->_lastTDEval_ExecutedAt);
  *((void *)v4 + 1517) = *(void *)&self->_lastTDEval_TDEvalDuration;
  *((void *)v4 + 1518) = self->_lastTDEval_rssiAtTD;
  *((void *)v4 + 1519) = *(void *)&self->_lastTDEval_waitOnRoamStatusDuration;
  *((void *)v4 + 1520) = *(void *)&self->_tdEvalDurationCumulative;
  *((void *)v4 + 1521) = self->_waitOnRoamStatusDurationCumulative;
  objc_storeStrong((id *)v4 + 1522, self->_nextJoinReason);
  v4[12070] = self->_nextJoinIsSameSSID;
  v4[12065] = self->_nextJoinWhileDeferJoin;
  *((void *)v4 + 1523) = *(void *)&self->_timeToNextJoin;
  v4[12071] = self->_nextLinkUpIsSameBSSID;
  *((void *)v4 + 1524) = self->_rssiAtNextLinkUp;
  v4[12072] = self->_tdRecommendAtNextLinkUp;
  *((void *)v4 + 1525) = self->_rssiAtJoin;
  v4[12073] = self->_tdRecommendAtJoin;
  *((void *)v4 + 1526) = *(void *)&self->_timeSinceJoinATStart;
  *((_DWORD *)v4 + 3019) = self->_sessionStartedBy;
  *((_DWORD *)v4 + 3020) = self->_sessionEndedBy;
  *((void *)v4 + 1527) = *(void *)&self->_decision_TxPER_Duration;
  *((void *)v4 + 1528) = *(void *)&self->_decision_FWTxPER_Duration;
  *((void *)v4 + 1529) = *(void *)&self->_decision_BeaconPER_Duration;
  *((void *)v4 + 1530) = *(void *)&self->_decision_GatewayARPFailure_Duration;
  *((void *)v4 + 1531) = *(void *)&self->_decision_SymptomsDNSError_Duration;
  *((void *)v4 + 1532) = *(void *)&self->_decision_AutoLeave_Duration;
  *((void *)v4 + 1533) = *(void *)&self->_decision_ActiveProbe_Duration;
  *((void *)v4 + 1534) = *(void *)&self->_decision_FastTD_Duration;
  *((void *)v4 + 1535) = *(void *)&self->_vote_FastTD_Recommendation_Duration;
  *((void *)v4 + 1536) = *(void *)&self->_vote_FastTD_TXPER_Duration;
  *((void *)v4 + 1537) = *(void *)&self->_vote_FastTD_FWTxPER_Duration;
  *((void *)v4 + 1538) = *(void *)&self->_vote_FastTD_BeaconPER_Duration;
  *((void *)v4 + 1539) = *(void *)&self->_suppress_SymptomsNODataStall_Duration;
  *((void *)v4 + 1540) = *(void *)&self->_suppress_SymptomsAppPolicy_Duration;
  *((void *)v4 + 1541) = *(void *)&self->_suppress_FastCheapCellular_Duration;
  *((void *)v4 + 1542) = *(void *)&self->_suppress_2dBGuard;
  *((void *)v4 + 1543) = *(void *)&self->_suppress_NoFgNetwApp_Duration;
  *((void *)v4 + 1544) = *(void *)&self->_suppress_TTR_Duration;
  *((void *)v4 + 1545) = *(void *)&self->_suppress_UserInput_Duration;
  *((void *)v4 + 1546) = *(void *)&self->_suppress_GoodAfterRoam_Duration;
  *((void *)v4 + 1547) = *(void *)&self->_suppress_Roam_Duration;
  *((void *)v4 + 1548) = *(void *)&self->_suppress_ActiveProbing;
  *((void *)v4 + 1549) = *(void *)&self->_perCoreRSSI_NotUsed_Duration;
  *((void *)v4 + 1550) = *(void *)&self->_perCoreRSSI_Core0_Duration;
  *((void *)v4 + 1551) = *(void *)&self->_perCoreRSSI_Core1_Duration;
  *((void *)v4 + 1552) = self->_roamStatus_Succeeded_Count_WhileTDWait;
  *((void *)v4 + 1553) = self->_roamStatus_Failed_Count_WhileTDWait;
  *((void *)v4 + 1554) = self->_roamStatus_FailedFilteredOut_Count_WhileTDWait;
  *((void *)v4 + 1555) = self->_roamStatus_FailedNotFound_Count_WhileTDWait;
  *((void *)v4 + 1556) = self->_roamStatus_Succeeded_Count_BeforeTDWait;
  *((void *)v4 + 1557) = self->_roamStatus_Failed_Count_BeforeTDWait;
  *((void *)v4 + 1558) = self->_roamStatus_FailedFilteredOut_Count_BeforeTDWait;
  *((void *)v4 + 1559) = self->_roamStatus_FailedNotFound_Count_BeforeTDWait;
  return v4;
}

- (void)tdLogic_badRssi:(int64_t)a3 goodRSSI:(int64_t)goodLinkRssi
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession tdLogic_badRssi:goodRSSI:](&v10, sel_tdLogic_badRssi_goodRSSI_);
  self->_int64_t badLinkRssi = a3;
  self->_int64_t goodLinkRssi = goodLinkRssi;
  int64_t badLinkRssi = self->_badLinkRssi;
  if (badLinkRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v8 = @"N/A";
  }

  else
  {
    [MEMORY[0x189607968] numberWithInteger:self->_badLinkRssi];
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int64_t goodLinkRssi = self->_goodLinkRssi;
  }

  if (goodLinkRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog( @"%s - badRssiThreshold:%@ goodRSSIThreshold:%@",  "-[WiFiUsagePoorLinkSession tdLogic_badRssi:goodRSSI:]",  v8,  @"N/A");
  }

  else
  {
    [MEMORY[0x189607968] numberWithInteger:goodLinkRssi];
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s - badRssiThreshold:%@ goodRSSIThreshold:%@",  "-[WiFiUsagePoorLinkSession tdLogic_badRssi:goodRSSI:]",  v8,  v9);
  }

  if (badLinkRssi != 0x7FFFFFFFFFFFFFFFLL) {
}
  }

- (void)tdLogic_deferJoin:(unint64_t)a3 perBSSID:(unint64_t)perBSSID_deferJoin
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession tdLogic_deferJoin:perBSSID:](&v10, sel_tdLogic_deferJoin_perBSSID_);
  self->_unint64_t perSSID_deferJoin = a3;
  self->_unint64_t perBSSID_deferJoin = perBSSID_deferJoin;
  unint64_t perSSID_deferJoin = self->_perSSID_deferJoin;
  if (perSSID_deferJoin == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v8 = @"N/A";
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_perSSID_deferJoin];
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    unint64_t perBSSID_deferJoin = self->_perBSSID_deferJoin;
  }

  if (perBSSID_deferJoin == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog( @"%s - deferPerSSID:%@ deferPerBSSID:%@",  "-[WiFiUsagePoorLinkSession tdLogic_deferJoin:perBSSID:]",  v8,  @"N/A");
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:perBSSID_deferJoin];
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s - deferPerSSID:%@ deferPerBSSID:%@",  "-[WiFiUsagePoorLinkSession tdLogic_deferJoin:perBSSID:]",  v8,  v9);
  }

  if (perSSID_deferJoin != 0x7FFFFFFFFFFFFFFFLL) {
}
  }

- (id)metricName
{
  return @"com.apple.wifi.badlinksession";
}

+ (id)sessionStartedBy:(int)a3
{
  else {
    return off_18A16E198[a3 - 1];
  }
}

+ (id)sessionEndedBy:(int)a3
{
  else {
    return off_18A16E1B8[a3];
  }
}

+ (id)describeWiFiUsageMonitor_tdDecisionState:(id *)a3
{
  double v4 = (void *)NSString;
  +[WiFiUsagePrivacyFilter getLabelForTDMode:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForTDMode:",  a3->var8);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = &stru_18A170410;
  if (a3->var0) {
    double v7 = @"decision_TxPER & ";
  }
  else {
    double v7 = &stru_18A170410;
  }
  if (a3->var1) {
    objc_super v8 = @"decision_BeaconPER & ";
  }
  else {
    objc_super v8 = &stru_18A170410;
  }
  if (a3->var2) {
    double v9 = @"decision_FWTxPER & ";
  }
  else {
    double v9 = &stru_18A170410;
  }
  objc_super v10 = @"decision_GatewayARPFailure & ";
  if (!a3->var3) {
    objc_super v10 = &stru_18A170410;
  }
  if (a3->var4) {
    double v11 = @"decision_SymptomsDNSError & ";
  }
  else {
    double v11 = &stru_18A170410;
  }
  if (a3->var5) {
    dispatch_source_t v12 = @"decision_AutoLeave & ";
  }
  else {
    dispatch_source_t v12 = &stru_18A170410;
  }
  if (a3->var6) {
    objc_super v13 = @"decision_ActiveProbe & ";
  }
  else {
    objc_super v13 = &stru_18A170410;
  }
  if (a3->var7) {
    double v14 = @"decision_FastTD & ";
  }
  else {
    double v14 = &stru_18A170410;
  }
  if (a3->var9) {
    double v15 = @"motionbasedAggressiveTDEnabled & ";
  }
  else {
    double v15 = &stru_18A170410;
  }
  double v16 = @"walkoutDetected & ";
  if (!a3->var10) {
    double v16 = &stru_18A170410;
  }
  if (a3->var11) {
    double v17 = @"waitForRoam & ";
  }
  else {
    double v17 = &stru_18A170410;
  }
  if (a3->var12) {
    double v18 = @"edgeBSS & ";
  }
  else {
    double v18 = &stru_18A170410;
  }
  if (a3->var13) {
    double v19 = @"appsUsingWiFi & ";
  }
  else {
    double v19 = &stru_18A170410;
  }
  if (a3->var14) {
    uint64_t v6 = @"monitorMode & ";
  }
  [v4 stringWithFormat:@"tdMode:%@ & %@%@%@%@%@%@%@%@%@%@%@%@%@%@autoLeaveRSSIthreshold:%ld", v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v6, a3->var15];
  double v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)describeWiFiUsageMonitor_tdFastTDState:(id)a3
{
  id v3 = @"YES";
  if ((*(void *)&a3.var1 & 0x100000000LL) != 0) {
    double v4 = @"YES";
  }
  else {
    double v4 = @"NO";
  }
  if ((*(void *)&a3.var1 & 0x10000000000LL) == 0) {
    id v3 = @"NO";
  }
  __int128 v5 = @"Recommend & ";
  uint64_t v6 = &stru_18A170410;
  if (!a3.var1) {
    __int128 v5 = &stru_18A170410;
  }
  double v7 = @"TxPER & ";
  if ((*(_WORD *)&a3.var1 & 0x100) == 0) {
    double v7 = &stru_18A170410;
  }
  objc_super v8 = @"BeaconPER & ";
  if ((*(void *)&a3.var1 & 0x10000LL) == 0) {
    objc_super v8 = &stru_18A170410;
  }
  if ((*(_DWORD *)&a3.var1 & 0x1000000) != 0) {
    uint64_t v6 = @"FWTxPER & ";
  }
  return (id)[NSString stringWithFormat:@"fastTD (RTApp:%@ Cheap5G:%@) votes:%lu %@%@%@%@", v4, v3, a3.var0, v5, v7, v8, v6];
}

+ (id)describeWiFiUsageMonitor_tdExecState:(id)a3
{
  id v3 = @"aggressiveTDEnabled & ";
  double v4 = &stru_18A170410;
  if (!a3.var0) {
    id v3 = &stru_18A170410;
  }
  __int128 v5 = @"rnfAllowed & ";
  if ((*(_WORD *)&a3.var0 & 0x100) == 0) {
    __int128 v5 = &stru_18A170410;
  }
  uint64_t v6 = @"fastTD & ";
  if ((*(void *)&a3.var0 & 0x10000LL) == 0) {
    uint64_t v6 = &stru_18A170410;
  }
  double v7 = @"suppress_SymptomDataStallScoreGood & ";
  if ((*(_DWORD *)&a3.var0 & 0x1000000) == 0) {
    double v7 = &stru_18A170410;
  }
  objc_super v8 = @"suppress_SymptomAppPolicyScore & ";
  if ((*(void *)&a3.var0 & 0x100000000LL) == 0) {
    objc_super v8 = &stru_18A170410;
  }
  double v9 = @"suppress_FastCheapCellular & ";
  if ((*(void *)&a3.var0 & 0x10000000000LL) == 0) {
    double v9 = &stru_18A170410;
  }
  objc_super v10 = @"suppress_2dBGuard & ";
  if ((*(void *)&a3.var0 & 0x1000000000000LL) == 0) {
    objc_super v10 = &stru_18A170410;
  }
  double v11 = @"suppress_NoFGnetwApp & ";
  if ((*(void *)&a3.var0 & 0x100000000000000LL) == 0) {
    double v11 = &stru_18A170410;
  }
  dispatch_source_t v12 = @"suppress_TTR & ";
  if (!a3.var8) {
    dispatch_source_t v12 = &stru_18A170410;
  }
  objc_super v13 = @"suppress_UserInput & ";
  if ((*(_WORD *)&a3.var8 & 0x100) == 0) {
    objc_super v13 = &stru_18A170410;
  }
  *(void *)&a3.unint64_t var0 = @"suppress_GoodAfterRoam & ";
  if ((*(void *)&a3.var8 & 0x10000LL) == 0) {
    *(void *)&a3.unint64_t var0 = &stru_18A170410;
  }
  double v14 = @"defer_activeProbing & ";
  if ((*(_DWORD *)&a3.var8 & 0x1000000) == 0) {
    double v14 = &stru_18A170410;
  }
  if ((*(void *)&a3.var8 & 0x100000000LL) != 0) {
    double v4 = @"defer_roaming & ";
  }
  return (id)[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@", v3, v5, v6, v7, v8, v9, v10, v11, v12, v13, *(void *)&a3.var0, v14, v4];
}

- (int)sessionStartedBy
{
  return self->_sessionStartedBy;
}

- (void)setSessionStartedBy:(int)a3
{
  self->_sessionStartedBy = a3;
}

- (BOOL)tdExecuted
{
  return self->_tdExecuted;
}

- (void)setTdExecuted:(BOOL)a3
{
  self->_tdExecuted = a3;
}

- (BOOL)nextJoinWhileDeferJoin
{
  return self->_nextJoinWhileDeferJoin;
}

- (void)setNextJoinWhileDeferJoin:(BOOL)a3
{
  self->_nextJoinWhileDeferJoin = a3;
}

- (BOOL)tdConfirmed
{
  return self->_tdConfirmed;
}

- (void)setTdConfirmed:(BOOL)a3
{
  self->_tdConfirmed = a3;
}

- (BOOL)isLastDecisionStateValid
{
  return self->_isLastDecisionStateValid;
}

- (void)setIsLastDecisionStateValid:(BOOL)a3
{
  self->_isLastDecisionStateValid = a3;
}

- (BOOL)isLastSuppressStateValid
{
  return self->_isLastSuppressStateValid;
}

- (void)setIsLastSuppressStateValid:(BOOL)a3
{
  self->_isLastSuppressStateValid = a3;
}

- (BOOL)isLastFastTdVotesValid
{
  return self->_isLastFastTdVotesValid;
}

- (void)setIsLastFastTdVotesValid:(BOOL)a3
{
  self->_isLastFastTdVotesValid = a3;
}

- ($F459DE10F772475887923C84DB189A08)last_DecisionState
{
  __int128 v3 = *(_OWORD *)&self[391].var13;
  *(_OWORD *)&retstr->unint64_t var0 = *(_OWORD *)&self[391].var0;
  *(_OWORD *)&retstr->var13 = v3;
  return self;
}

- (void)setLast_DecisionState:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var13;
  *(_OWORD *)&self->_last_DecisionState.decision_TxPER = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_last_DecisionState.appsUsingWiFi = v3;
}

- ($CA18CBBE7683B0106BED709705F86C47)last_SuppressState
{
  p_last_SuppressState = &self->_last_SuppressState;
  uint64_t v3 = *(void *)&self->_last_SuppressState.aggressiveTDEnabled;
  unint64_t v4 = *(unsigned int *)&p_last_SuppressState->suppress_TTR | ((unint64_t)p_last_SuppressState->defer_roaming << 32);
  result.var8 = v4;
  result.var9 = BYTE1(v4);
  result.var10 = BYTE2(v4);
  result.var11 = BYTE3(v4);
  result.var12 = BYTE4(v4);
  result.unint64_t var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  result.var6 = BYTE6(v3);
  result.var7 = HIBYTE(v3);
  return result;
}

- (void)setLast_SuppressState:(id)a3
{
  self->_last_SuppressState = ($06B5CD52C6C1251F2085B2FC3F10BF25)a3;
}

- ($72F98887023D296F816C717954FA291A)last_FastTdVotes
{
  p_last_FastTdVotes = &self->_last_FastTdVotes;
  unint64_t fastTD_voteCount = self->_last_FastTdVotes.fastTD_voteCount;
  uint64_t v4 = *(void *)&p_last_FastTdVotes->fastTD_vote_recommendation;
  result.var1 = v4;
  result.var2 = BYTE1(v4);
  result.var3 = BYTE2(v4);
  result.var4 = BYTE3(v4);
  result.var5 = BYTE4(v4);
  result.var6 = BYTE5(v4);
  result.unint64_t var0 = fastTD_voteCount;
  return result;
}

- (void)setLast_FastTdVotes:(id)a3
{
  self->_last_FastTdVotes = ($82273F0F3EEBC739DF43245EDC9A2399)a3;
}

- (unint64_t)last_RSSIMode
{
  return self->_last_RSSIMode;
}

- (void)setLast_RSSIMode:(unint64_t)a3
{
  self->_last_RSSIMode = a3;
}

- (NSString)lastTdEval_StartedBy
{
  return self->_lastTdEval_StartedBy;
}

- (void)setLastTdEval_StartedBy:(id)a3
{
}

- (NSString)lastTdEval_EndedBy
{
  return self->_lastTdEval_EndedBy;
}

- (void)setLastTdEval_EndedBy:(id)a3
{
}

- (NSDate)lastTDEval_AlertedAt
{
  return self->_lastTDEval_AlertedAt;
}

- (void)setLastTDEval_AlertedAt:(id)a3
{
}

- (NSDate)lastTDEval_ConfirmedAt
{
  return self->_lastTDEval_ConfirmedAt;
}

- (void)setLastTDEval_ConfirmedAt:(id)a3
{
}

- (NSDate)lastTDEval_ExecutedAt
{
  return self->_lastTDEval_ExecutedAt;
}

- (void)setLastTDEval_ExecutedAt:(id)a3
{
}

- (double)lastTDEval_TDEvalDuration
{
  return self->_lastTDEval_TDEvalDuration;
}

- (void)setLastTDEval_TDEvalDuration:(double)a3
{
  self->_lastTDEval_TDEvalDuration = a3;
}

- (int64_t)lastTDEval_rssiAtTD
{
  return self->_lastTDEval_rssiAtTD;
}

- (void)setLastTDEval_rssiAtTD:(int64_t)a3
{
  self->_lastTDEval_rssiAtTD = a3;
}

- (double)lastTDEval_waitOnRoamStatusDuration
{
  return self->_lastTDEval_waitOnRoamStatusDuration;
}

- (void)setLastTDEval_waitOnRoamStatusDuration:(double)a3
{
  self->_lastTDEval_waitOnRoamStatusDuration = a3;
}

- (double)tdEvalDurationCumulative
{
  return self->_tdEvalDurationCumulative;
}

- (void)setTdEvalDurationCumulative:(double)a3
{
  self->_tdEvalDurationCumulative = a3;
}

- (unint64_t)waitOnRoamStatusDurationCumulative
{
  return self->_waitOnRoamStatusDurationCumulative;
}

- (void)setWaitOnRoamStatusDurationCumulative:(unint64_t)a3
{
  self->_waitOnRoamStatusDurationCumulative = a3;
}

- (NSString)nextJoinReason
{
  return self->_nextJoinReason;
}

- (void)setNextJoinReason:(id)a3
{
}

- (BOOL)nextJoinIsSameSSID
{
  return self->_nextJoinIsSameSSID;
}

- (void)setNextJoinIsSameSSID:(BOOL)a3
{
  self->_nextJoinIsSameSSID = a3;
}

- (double)timeToNextJoin
{
  return self->_timeToNextJoin;
}

- (void)setTimeToNextJoin:(double)a3
{
  self->_double timeToNextJoin = a3;
}

- (BOOL)nextLinkUpIsSameBSSID
{
  return self->_nextLinkUpIsSameBSSID;
}

- (void)setNextLinkUpIsSameBSSID:(BOOL)a3
{
  self->_nextLinkUpIsSameBSSID = a3;
}

- (int64_t)rssiAtNextLinkUp
{
  return self->_rssiAtNextLinkUp;
}

- (void)setRssiAtNextLinkUp:(int64_t)a3
{
  self->_rssiAtNextLinkUp = a3;
}

- (BOOL)tdRecommendAtNextLinkUp
{
  return self->_tdRecommendAtNextLinkUp;
}

- (void)setTdRecommendAtNextLinkUp:(BOOL)a3
{
  self->_tdRecommendAtNextLinkUp = a3;
}

- (int64_t)rssiAtJoin
{
  return self->_rssiAtJoin;
}

- (void)setRssiAtJoin:(int64_t)a3
{
  self->_rssiAtJoin = a3;
}

- (BOOL)tdRecommendAtJoin
{
  return self->_tdRecommendAtJoin;
}

- (void)setTdRecommendAtJoin:(BOOL)a3
{
  self->_tdRecommendAtJoin = a3;
}

- (double)timeSinceJoinATStart
{
  return self->_timeSinceJoinATStart;
}

- (void)setTimeSinceJoinATStart:(double)a3
{
  self->_timeSinceJoinATStart = a3;
}

- (int)sessionEndedBy
{
  return self->_sessionEndedBy;
}

- (void)setSessionEndedBy:(int)a3
{
  self->_sessionEndedBy = a3;
}

- (double)decision_TxPER_Duration
{
  return self->_decision_TxPER_Duration;
}

- (void)setDecision_TxPER_Duration:(double)a3
{
  self->_decision_TxPER_Duration = a3;
}

- (double)decision_FWTxPER_Duration
{
  return self->_decision_FWTxPER_Duration;
}

- (void)setDecision_FWTxPER_Duration:(double)a3
{
  self->_decision_FWTxPER_Duration = a3;
}

- (double)decision_BeaconPER_Duration
{
  return self->_decision_BeaconPER_Duration;
}

- (void)setDecision_BeaconPER_Duration:(double)a3
{
  self->_decision_BeaconPER_Duration = a3;
}

- (double)decision_GatewayARPFailure_Duration
{
  return self->_decision_GatewayARPFailure_Duration;
}

- (void)setDecision_GatewayARPFailure_Duration:(double)a3
{
  self->_decision_GatewayARPFailure_Duration = a3;
}

- (double)decision_SymptomsDNSError_Duration
{
  return self->_decision_SymptomsDNSError_Duration;
}

- (void)setDecision_SymptomsDNSError_Duration:(double)a3
{
  self->_decision_SymptomsDNSError_Duration = a3;
}

- (double)decision_AutoLeave_Duration
{
  return self->_decision_AutoLeave_Duration;
}

- (void)setDecision_AutoLeave_Duration:(double)a3
{
  self->_decision_AutoLeave_Duration = a3;
}

- (double)decision_ActiveProbe_Duration
{
  return self->_decision_ActiveProbe_Duration;
}

- (void)setDecision_ActiveProbe_Duration:(double)a3
{
  self->_decision_ActiveProbe_Duration = a3;
}

- (double)decision_FastTD_Duration
{
  return self->_decision_FastTD_Duration;
}

- (void)setDecision_FastTD_Duration:(double)a3
{
  self->_decision_FastTD_Duration = a3;
}

- (double)vote_FastTD_Recommendation_Duration
{
  return self->_vote_FastTD_Recommendation_Duration;
}

- (void)setVote_FastTD_Recommendation_Duration:(double)a3
{
  self->_vote_FastTD_Recommendation_Duration = a3;
}

- (double)vote_FastTD_TXPER_Duration
{
  return self->_vote_FastTD_TXPER_Duration;
}

- (void)setVote_FastTD_TXPER_Duration:(double)a3
{
  self->_vote_FastTD_TXPER_Duration = a3;
}

- (double)vote_FastTD_FWTxPER_Duration
{
  return self->_vote_FastTD_FWTxPER_Duration;
}

- (void)setVote_FastTD_FWTxPER_Duration:(double)a3
{
  self->_vote_FastTD_FWTxPER_Duration = a3;
}

- (double)vote_FastTD_BeaconPER_Duration
{
  return self->_vote_FastTD_BeaconPER_Duration;
}

- (void)setVote_FastTD_BeaconPER_Duration:(double)a3
{
  self->_vote_FastTD_BeaconPER_Duration = a3;
}

- (double)suppress_SymptomsNODataStall_Duration
{
  return self->_suppress_SymptomsNODataStall_Duration;
}

- (void)setSuppress_SymptomsNODataStall_Duration:(double)a3
{
  self->_suppress_SymptomsNODataStall_Duration = a3;
}

- (double)suppress_SymptomsAppPolicy_Duration
{
  return self->_suppress_SymptomsAppPolicy_Duration;
}

- (void)setSuppress_SymptomsAppPolicy_Duration:(double)a3
{
  self->_suppress_SymptomsAppPolicy_Duration = a3;
}

- (double)suppress_FastCheapCellular_Duration
{
  return self->_suppress_FastCheapCellular_Duration;
}

- (void)setSuppress_FastCheapCellular_Duration:(double)a3
{
  self->_suppress_FastCheapCellular_Duration = a3;
}

- (double)suppress_2dBGuard
{
  return self->_suppress_2dBGuard;
}

- (void)setSuppress_2dBGuard:(double)a3
{
  self->_suppress_2dBGuard = a3;
}

- (double)suppress_NoFgNetwApp_Duration
{
  return self->_suppress_NoFgNetwApp_Duration;
}

- (void)setSuppress_NoFgNetwApp_Duration:(double)a3
{
  self->_suppress_NoFgNetwApp_Duration = a3;
}

- (double)suppress_TTR_Duration
{
  return self->_suppress_TTR_Duration;
}

- (void)setSuppress_TTR_Duration:(double)a3
{
  self->_suppress_TTR_Duration = a3;
}

- (double)suppress_UserInput_Duration
{
  return self->_suppress_UserInput_Duration;
}

- (void)setSuppress_UserInput_Duration:(double)a3
{
  self->_suppress_UserInput_Duration = a3;
}

- (double)suppress_GoodAfterRoam_Duration
{
  return self->_suppress_GoodAfterRoam_Duration;
}

- (void)setSuppress_GoodAfterRoam_Duration:(double)a3
{
  self->_suppress_GoodAfterRoam_Duration = a3;
}

- (double)suppress_Roam_Duration
{
  return self->_suppress_Roam_Duration;
}

- (void)setSuppress_Roam_Duration:(double)a3
{
  self->_suppress_Roam_Duration = a3;
}

- (double)suppress_ActiveProbing
{
  return self->_suppress_ActiveProbing;
}

- (void)setSuppress_ActiveProbing:(double)a3
{
  self->_suppress_ActiveProbing = a3;
}

- (double)perCoreRSSI_NotUsed_Duration
{
  return self->_perCoreRSSI_NotUsed_Duration;
}

- (void)setPerCoreRSSI_NotUsed_Duration:(double)a3
{
  self->_perCoreRSSI_NotUsed_Duration = a3;
}

- (double)perCoreRSSI_Core0_Duration
{
  return self->_perCoreRSSI_Core0_Duration;
}

- (void)setPerCoreRSSI_Core0_Duration:(double)a3
{
  self->_perCoreRSSI_Core0_Duration = a3;
}

- (double)perCoreRSSI_Core1_Duration
{
  return self->_perCoreRSSI_Core1_Duration;
}

- (void)setPerCoreRSSI_Core1_Duration:(double)a3
{
  self->_perCoreRSSI_Core1_Duration = a3;
}

- (unint64_t)roamStatus_Succeeded_Count_WhileTDWait
{
  return self->_roamStatus_Succeeded_Count_WhileTDWait;
}

- (void)setRoamStatus_Succeeded_Count_WhileTDWait:(unint64_t)a3
{
  self->_roamStatus_Succeeded_Count_WhileTDWait = a3;
}

- (unint64_t)roamStatus_Failed_Count_WhileTDWait
{
  return self->_roamStatus_Failed_Count_WhileTDWait;
}

- (void)setRoamStatus_Failed_Count_WhileTDWait:(unint64_t)a3
{
  self->_roamStatus_Failed_Count_WhileTDWait = a3;
}

- (unint64_t)roamStatus_FailedFilteredOut_Count_WhileTDWait
{
  return self->_roamStatus_FailedFilteredOut_Count_WhileTDWait;
}

- (void)setRoamStatus_FailedFilteredOut_Count_WhileTDWait:(unint64_t)a3
{
  self->_roamStatus_FailedFilteredOut_Count_WhileTDWait = a3;
}

- (unint64_t)roamStatus_FailedNotFound_Count_WhileTDWait
{
  return self->_roamStatus_FailedNotFound_Count_WhileTDWait;
}

- (void)setRoamStatus_FailedNotFound_Count_WhileTDWait:(unint64_t)a3
{
  self->_roamStatus_FailedNotFound_Count_WhileTDWait = a3;
}

- (unint64_t)roamStatus_Succeeded_Count_BeforeTDWait
{
  return self->_roamStatus_Succeeded_Count_BeforeTDWait;
}

- (void)setRoamStatus_Succeeded_Count_BeforeTDWait:(unint64_t)a3
{
  self->_roamStatus_Succeeded_Count_BeforeTDWait = a3;
}

- (unint64_t)roamStatus_Failed_Count_BeforeTDWait
{
  return self->_roamStatus_Failed_Count_BeforeTDWait;
}

- (void)setRoamStatus_Failed_Count_BeforeTDWait:(unint64_t)a3
{
  self->_roamStatus_Failed_Count_BeforeTDWait = a3;
}

- (unint64_t)roamStatus_FailedFilteredOut_Count_BeforeTDWait
{
  return self->_roamStatus_FailedFilteredOut_Count_BeforeTDWait;
}

- (void)setRoamStatus_FailedFilteredOut_Count_BeforeTDWait:(unint64_t)a3
{
  self->_roamStatus_FailedFilteredOut_Count_BeforeTDWait = a3;
}

- (unint64_t)roamStatus_FailedNotFound_Count_BeforeTDWait
{
  return self->_roamStatus_FailedNotFound_Count_BeforeTDWait;
}

- (void)setRoamStatus_FailedNotFound_Count_BeforeTDWait:(unint64_t)a3
{
  self->_roamStatus_FailedNotFound_Count_BeforeTDWait = a3;
}

- (void).cxx_destruct
{
}

- (void)linkStateDidChange:(uint64_t)a1 isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:.cold.1( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = +[WiFiUsageSession disconnectReasonString:](&OBJC_CLASS___WiFiUsageSession, "disconnectReasonString:", 1000LL);
  int v3 = 136315650;
  uint64_t v4 = "-[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  objc_super v8 = v2;
  _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s on %@ - Unexpected ifDown due to %@ while session is inactive",  (uint8_t *)&v3,  0x20u);
}

@end