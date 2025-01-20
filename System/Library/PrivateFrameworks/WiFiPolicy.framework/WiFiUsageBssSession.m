@interface WiFiUsageBssSession
- ($6E47B81FEB72AA1B248A20B58E3F028F)roamConfigCriteria;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamConfigChannels;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsLrgstCurrentToBestRssiByBand;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsLrgstCurrentToNextBestRssiByBand;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsSmllstCurrentToBestRssiByBand;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsSmllstCurrentToNextBestRssiByBand;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSIByBand;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSICountByBand;
- (BOOL)cellularFallbackEnabled;
- (BOOL)cellularOutrankingEnabled;
- (BOOL)isCompatibilityModeEnabled;
- (BOOL)isCompatibilityModeEnabledAtStart;
- (BOOL)isRoamSuppressionEnabled;
- (BOOL)roamInMotion;
- (BOOL)submitAnalytics;
- (BOOL)supportsAdaptiveFastTransition;
- (BOOL)supportsAdaptiveRoaming;
- (BOOL)supportsBssTransitionManagement;
- (BOOL)supportsFastTransition;
- (BOOL)supportsFastlane;
- (BOOL)supportsNeighborReport;
- (BOOL)supportsNetworkAssurance;
- (NSDate)a2dpActiveTime;
- (NSDate)awdlActiveTime;
- (NSDate)callStartedTime;
- (NSDate)hidPresentTime;
- (NSDate)inMotionStartedTime;
- (NSDate)inVehicleEntryTime;
- (NSDate)joinedTimestamp;
- (NSDate)lastCellularFallbackStateChangedTime;
- (NSDate)lastCellularOutrankingStateChangedTime;
- (NSDate)lastCompatibilityModeChangedTime;
- (NSDate)lastLqmUpdateTimestamp;
- (NSDate)lastPoorCoverageEntryTimestamp;
- (NSDate)lastRoamSuppressionToggled;
- (NSDate)roamingActiveTime;
- (NSDate)scanningActiveTime;
- (NSDate)scoActiveTime;
- (NSMutableDictionary)roamNeighborsByBand;
- (NSMutableDictionary)sessionInfo;
- (NSString)bssEnvironment;
- (NSString)interfaceName;
- (WiFiUsageBssDetails)originBssDetails;
- (WiFiUsageBssDetails)targetBssDetails;
- (WiFiUsageBssSession)initWithInterfaceName:(id)a3 bssEnvironment:(id)a4 andBssDetails:(id)a5 andNetworkDetails:(id)a6;
- (WiFiUsageNetworkDetails)networkDetails;
- (double)inA2dpDuration;
- (double)inAwdlDuration;
- (double)inCallDuration;
- (double)inCellularFallbackDuration;
- (double)inCellularOutrankingDuration;
- (double)inCompatibilityModeEnabledDuration;
- (double)inHidPresentDuration;
- (double)inMotionDuration;
- (double)inPoorCoverageDuration;
- (double)inRoamDuration;
- (double)inRoamSuppressionEnabledDuration;
- (double)inScanDuration;
- (double)inScoDuration;
- (double)inVehicleDuration;
- (double)lastRoamSuppressionWaitForRoamEnd;
- (double)lastRoamSuppressionWaitForRoamStart;
- (double)maxRoamLatency;
- (double)minRoamLatency;
- (double)poorCoverageAndA2dpDuration;
- (double)poorCoverageAndAwdlDuration;
- (double)poorCoverageAndScanDuration;
- (double)poorCoverageAndScoDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (int)currentBand;
- (int)newBand;
- (int64_t)lastLinkRssi;
- (int64_t)lastRoamScanRssi;
- (int64_t)linkRssi40to50;
- (int64_t)linkRssi50to60;
- (int64_t)linkRssi60to65;
- (int64_t)linkRssi65to70;
- (int64_t)linkRssi70to75;
- (int64_t)linkRssi75to80;
- (int64_t)linkRssi80to85;
- (int64_t)linkRssi85to90;
- (int64_t)linkRssiGt40;
- (int64_t)linkRssiLt90;
- (int64_t)newRssi;
- (int64_t)roamConfigTriggerRssi;
- (unint64_t)bssTransitionAcceptedCount;
- (unint64_t)bssTransitionRejectedCount;
- (unint64_t)bssTransitionRequestCount;
- (unint64_t)cellularFallbackStateChangedCount;
- (unint64_t)cellularOutrankingStateChangedCount;
- (unint64_t)compatibilityModeChangeCount;
- (unint64_t)currentChannel;
- (unint64_t)currentRSSIStrongestCount;
- (unint64_t)fullScanCount;
- (unint64_t)highRssiRoamScanCount;
- (unint64_t)inA2dpEventCount;
- (unint64_t)inAwdlEventCount;
- (unint64_t)inCallEventCount;
- (unint64_t)inHidPresentCount;
- (unint64_t)inMotionEventCount;
- (unint64_t)inRoamEventCount;
- (unint64_t)inRoamSuppressionEnabledCount;
- (unint64_t)inRoamSuppressionEnabledDurationPerc;
- (unint64_t)inScanEventCount;
- (unint64_t)inScoEventCount;
- (unint64_t)inVehicleEventCount;
- (unint64_t)indoorScanCount;
- (unint64_t)locationScanCount;
- (unint64_t)lowRssiRoamScanCount;
- (unint64_t)maxCandidatesCount;
- (unint64_t)minCandidatesCount;
- (unint64_t)newChannel;
- (unint64_t)partialScanCount;
- (unint64_t)roamIsWNMScoreUsedCount;
- (unint64_t)roamPingPongNth;
- (unint64_t)roamReasonBeaconLostCount;
- (unint64_t)roamReasonBetterCandidateCount;
- (unint64_t)roamReasonBetterConditionCount;
- (unint64_t)roamReasonDeauthDisassocCount;
- (unint64_t)roamReasonHostTriggeredCount;
- (unint64_t)roamReasonInitialAssociationCount;
- (unint64_t)roamReasonLowRssiCount;
- (unint64_t)roamReasonMiscCount;
- (unint64_t)roamReasonReassocRequestedCount;
- (unint64_t)roamReasonSteeredByApCount;
- (unint64_t)roamReasonSteeredByBtmCount;
- (unint64_t)roamReasonSteeredByCsaCount;
- (unint64_t)roamStatusFailedCount;
- (unint64_t)roamStatusNoCandidateCount;
- (unint64_t)roamStatusNoQualifiedCandidateCount;
- (unint64_t)roamStatusSucceededCount;
- (unint64_t)roamsAfterSupprLifted;
- (unint64_t)triggerDisconnectAlertedCount;
- (unint64_t)triggerDisconnectConfirmedCount;
- (unint64_t)triggerDisconnectExecutedCount;
- (unint64_t)unexpectedBeaconLostRoamScanCount;
- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4;
- (void)bluetoothStateDidChange:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6;
- (void)bssDidChange:(id)a3 withDetails:(id)a4;
- (void)callStateDidChange:(BOOL)a3;
- (void)cellularFallbackStateDidChange:(BOOL)a3;
- (void)cellularOutrankingStateDidChange:(BOOL)a3;
- (void)faultEventDetected:(unint64_t)a3;
- (void)linkQualityDidChange:(id)a3;
- (void)motionStateDidChange:(BOOL)a3 andVehicularState:(BOOL)a4;
- (void)receivedBssTransitionRequestWithCandidateListIncluded:(BOOL)a3 isAbridged:(BOOL)a4 disassociationImminent:(BOOL)a5 bssTerminationIncluded:(BOOL)a6 essDisassociationImminent:(BOOL)a7;
- (void)reset;
- (void)roamCandidatesStatsDidUpdate:(id *)a3;
- (void)roamingARConfigurationDidChange:(id *)a3;
- (void)roamingConfigurationDidChange:(int64_t)a3 withChannelList:(id)a4;
- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongNth:(BOOL)a8;
- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6;
- (void)sentBssTransitionResponseWithStatus:(int64_t)a3 terminationDelayRequested:(BOOL)a4;
- (void)setA2dpActiveTime:(id)a3;
- (void)setAwdlActiveTime:(id)a3;
- (void)setBssEnvironment:(id)a3;
- (void)setBssTransitionAcceptedCount:(unint64_t)a3;
- (void)setBssTransitionRejectedCount:(unint64_t)a3;
- (void)setBssTransitionRequestCount:(unint64_t)a3;
- (void)setCallStartedTime:(id)a3;
- (void)setCellularFallbackEnabled:(BOOL)a3;
- (void)setCellularFallbackStateChangedCount:(unint64_t)a3;
- (void)setCellularOutrankingEnabled:(BOOL)a3;
- (void)setCellularOutrankingStateChangedCount:(unint64_t)a3;
- (void)setCompatibilityModeChangeCount:(unint64_t)a3;
- (void)setCurrentBand:(int)a3;
- (void)setCurrentChannel:(unint64_t)a3;
- (void)setCurrentRSSIStrongestCount:(unint64_t)a3;
- (void)setFullScanCount:(unint64_t)a3;
- (void)setHidPresentTime:(id)a3;
- (void)setHighRssiRoamScanCount:(unint64_t)a3;
- (void)setInA2dpDuration:(double)a3;
- (void)setInA2dpEventCount:(unint64_t)a3;
- (void)setInAwdlDuration:(double)a3;
- (void)setInAwdlEventCount:(unint64_t)a3;
- (void)setInCallDuration:(double)a3;
- (void)setInCallEventCount:(unint64_t)a3;
- (void)setInCellularFallbackDuration:(double)a3;
- (void)setInCellularOutrankingDuration:(double)a3;
- (void)setInCompatibilityModeEnabledDuration:(double)a3;
- (void)setInHidPresentCount:(unint64_t)a3;
- (void)setInHidPresentDuration:(double)a3;
- (void)setInMotionDuration:(double)a3;
- (void)setInMotionEventCount:(unint64_t)a3;
- (void)setInMotionStartedTime:(id)a3;
- (void)setInPoorCoverageDuration:(double)a3;
- (void)setInRoamDuration:(double)a3;
- (void)setInRoamEventCount:(unint64_t)a3;
- (void)setInRoamSuppressionEnabledCount:(unint64_t)a3;
- (void)setInRoamSuppressionEnabledDuration:(double)a3;
- (void)setInScanDuration:(double)a3;
- (void)setInScanEventCount:(unint64_t)a3;
- (void)setInScoDuration:(double)a3;
- (void)setInScoEventCount:(unint64_t)a3;
- (void)setInVehicleDuration:(double)a3;
- (void)setInVehicleEntryTime:(id)a3;
- (void)setInVehicleEventCount:(unint64_t)a3;
- (void)setIndoorScanCount:(unint64_t)a3;
- (void)setInterfaceName:(id)a3;
- (void)setIsCompatibilityModeEnabled:(BOOL)a3;
- (void)setIsCompatibilityModeEnabledAtStart:(BOOL)a3;
- (void)setIsRoamSuppressionEnabled:(BOOL)a3;
- (void)setJoinRssi:(int64_t)a3;
- (void)setJoinedTimestamp:(id)a3;
- (void)setLastCellularFallbackStateChangedTime:(id)a3;
- (void)setLastCellularOutrankingStateChangedTime:(id)a3;
- (void)setLastCompatibilityModeChangedTime:(id)a3;
- (void)setLastLinkRssi:(int64_t)a3;
- (void)setLastLqmUpdateTimestamp:(id)a3;
- (void)setLastPoorCoverageEntryTimestamp:(id)a3;
- (void)setLastRoamScanRssi:(int64_t)a3;
- (void)setLastRoamSuppressionToggled:(id)a3;
- (void)setLastRoamSuppressionWaitForRoamEnd:(double)a3;
- (void)setLastRoamSuppressionWaitForRoamStart:(double)a3;
- (void)setLinkRssi40to50:(int64_t)a3;
- (void)setLinkRssi50to60:(int64_t)a3;
- (void)setLinkRssi60to65:(int64_t)a3;
- (void)setLinkRssi65to70:(int64_t)a3;
- (void)setLinkRssi70to75:(int64_t)a3;
- (void)setLinkRssi75to80:(int64_t)a3;
- (void)setLinkRssi80to85:(int64_t)a3;
- (void)setLinkRssi85to90:(int64_t)a3;
- (void)setLinkRssiGt40:(int64_t)a3;
- (void)setLinkRssiLt90:(int64_t)a3;
- (void)setLocationScanCount:(unint64_t)a3;
- (void)setLowRssiRoamScanCount:(unint64_t)a3;
- (void)setMaxCandidatesCount:(unint64_t)a3;
- (void)setMaxRoamLatency:(double)a3;
- (void)setMinCandidatesCount:(unint64_t)a3;
- (void)setMinRoamLatency:(double)a3;
- (void)setNetworkDetails:(id)a3;
- (void)setNewBand:(int)a3;
- (void)setNewChannel:(unint64_t)a3;
- (void)setNewRssi:(int64_t)a3;
- (void)setOriginBssDetails:(id)a3;
- (void)setPartialScanCount:(unint64_t)a3;
- (void)setPoorCoverageAndA2dpDuration:(double)a3;
- (void)setPoorCoverageAndAwdlDuration:(double)a3;
- (void)setPoorCoverageAndScanDuration:(double)a3;
- (void)setPoorCoverageAndScoDuration:(double)a3;
- (void)setRoamConfigChannels:(id *)a3;
- (void)setRoamConfigCriteria:(id *)a3;
- (void)setRoamConfigTriggerRssi:(int64_t)a3;
- (void)setRoamInMotion:(BOOL)a3;
- (void)setRoamIsWNMScoreUsedCount:(unint64_t)a3;
- (void)setRoamNeighborsByBand:(id)a3;
- (void)setRoamNeighsLrgstCurrentToBestRssiByBand:(id *)a3;
- (void)setRoamNeighsLrgstCurrentToNextBestRssiByBand:(id *)a3;
- (void)setRoamNeighsSmllstCurrentToBestRssiByBand:(id *)a3;
- (void)setRoamNeighsSmllstCurrentToNextBestRssiByBand:(id *)a3;
- (void)setRoamPingPongNth:(unint64_t)a3;
- (void)setRoamReasonBeaconLostCount:(unint64_t)a3;
- (void)setRoamReasonBetterCandidateCount:(unint64_t)a3;
- (void)setRoamReasonBetterConditionCount:(unint64_t)a3;
- (void)setRoamReasonDeauthDisassocCount:(unint64_t)a3;
- (void)setRoamReasonHostTriggeredCount:(unint64_t)a3;
- (void)setRoamReasonInitialAssociationCount:(unint64_t)a3;
- (void)setRoamReasonLowRssiCount:(unint64_t)a3;
- (void)setRoamReasonMiscCount:(unint64_t)a3;
- (void)setRoamReasonReassocRequestedCount:(unint64_t)a3;
- (void)setRoamReasonSteeredByApCount:(unint64_t)a3;
- (void)setRoamReasonSteeredByBtmCount:(unint64_t)a3;
- (void)setRoamReasonSteeredByCsaCount:(unint64_t)a3;
- (void)setRoamStatusFailedCount:(unint64_t)a3;
- (void)setRoamStatusNoCandidateCount:(unint64_t)a3;
- (void)setRoamStatusNoQualifiedCandidateCount:(unint64_t)a3;
- (void)setRoamStatusSucceededCount:(unint64_t)a3;
- (void)setRoamingActiveTime:(id)a3;
- (void)setRoamsAfterSupprLifted:(unint64_t)a3;
- (void)setScanningActiveTime:(id)a3;
- (void)setScoActiveTime:(id)a3;
- (void)setSessionInfo:(id)a3;
- (void)setStrongestRSSIByBand:(id *)a3;
- (void)setStrongestRSSICountByBand:(id *)a3;
- (void)setSupportsAdaptiveFastTransition:(BOOL)a3;
- (void)setSupportsAdaptiveRoaming:(BOOL)a3;
- (void)setSupportsBssTransitionManagement:(BOOL)a3;
- (void)setSupportsFastTransition:(BOOL)a3;
- (void)setSupportsFastlane:(BOOL)a3;
- (void)setSupportsNeighborReport:(BOOL)a3;
- (void)setSupportsNetworkAssurance:(BOOL)a3;
- (void)setTargetBssDetails:(id)a3;
- (void)setTriggerDisconnectAlertedCount:(unint64_t)a3;
- (void)setTriggerDisconnectConfirmedCount:(unint64_t)a3;
- (void)setTriggerDisconnectExecutedCount:(unint64_t)a3;
- (void)setUnexpectedBeaconLostRoamScanCount:(unint64_t)a3;
- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5;
- (void)updateActivityDurations:(id)a3;
- (void)updateRssi:(int64_t)a3 timeSinceLastUpdate:(double)a4;
- (void)updateRssiDiffStats:(id *)a3 For:(id)a4;
- (void)updateWithCompatibilityMode:(unsigned __int8)a3;
- (void)updateWithRoamingSuppression:(unsigned __int8)a3;
@end

@implementation WiFiUsageBssSession

- (WiFiUsageBssSession)initWithInterfaceName:(id)a3 bssEnvironment:(id)a4 andBssDetails:(id)a5 andNetworkDetails:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    [MEMORY[0x189603F50] date];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___WiFiUsageBssSession;
    v15 = -[WiFiUsageBssSession init](&v19, sel_init);
    -[WiFiUsageBssSession setInterfaceName:](v15, "setInterfaceName:", v10);
    v16 = (void *)objc_opt_new();
    -[WiFiUsageBssSession setRoamNeighborsByBand:](v15, "setRoamNeighborsByBand:", v16);

    -[WiFiUsageBssSession reset](v15, "reset");
    -[WiFiUsageBssSession setBssEnvironment:](v15, "setBssEnvironment:", v11);
    -[WiFiUsageBssSession setOriginBssDetails:](v15, "setOriginBssDetails:", v12);
    -[WiFiUsageBssSession setTargetBssDetails:](v15, "setTargetBssDetails:", 0LL);
    -[WiFiUsageBssSession setNetworkDetails:](v15, "setNetworkDetails:", v13);
    -[WiFiUsageBssSession setJoinRssi:](v15, "setJoinRssi:", [v12 rssi]);
    -[WiFiUsageBssSession setCurrentBand:](v15, "setCurrentBand:", [v12 band]);
    -[WiFiUsageBssSession setCurrentChannel:](v15, "setCurrentChannel:", [v12 channel]);
    -[WiFiUsageBssSession setLastLinkRssi:](v15, "setLastLinkRssi:", [v12 rssi]);
    -[WiFiUsageBssSession setJoinedTimestamp:](v15, "setJoinedTimestamp:", v14);
    self = v15;

    v17 = self;
  }

  else
  {
    NSLog( @"%s - Cannot init Session (invalid interfaceName: %@)",  "-[WiFiUsageBssSession initWithInterfaceName:bssEnvironment:andBssDetails:andNetworkDetails:]",  0LL);
    v17 = 0LL;
  }

  return v17;
}

- (void)reset
{
  *(_OWORD *)&self->_faultReasonCount[30] = 0u;
  *(_OWORD *)&self->_faultReasonCount[28] = 0u;
  *(_OWORD *)&self->_faultReasonCount[26] = 0u;
  *(_OWORD *)&self->_faultReasonCount[24] = 0u;
  *(_OWORD *)&self->_faultReasonCount[22] = 0u;
  *(_OWORD *)&self->_faultReasonCount[20] = 0u;
  *(_OWORD *)&self->_faultReasonCount[18] = 0u;
  *(_OWORD *)&self->_faultReasonCount[16] = 0u;
  *(_OWORD *)&self->_faultReasonCount[14] = 0u;
  *(_OWORD *)&self->_faultReasonCount[12] = 0u;
  *(_OWORD *)&self->_faultReasonCount[10] = 0u;
  *(_OWORD *)&self->_faultReasonCount[8] = 0u;
  *(_OWORD *)&self->_faultReasonCount[6] = 0u;
  *(_OWORD *)&self->_faultReasonCount[4] = 0u;
  *(_OWORD *)&self->_faultReasonCount[2] = 0u;
  *(_OWORD *)self->_faultReasonCount = 0u;
  *(_OWORD *)&self->_faultReasonCount[32] = 0u;
  -[WiFiUsageBssSession setJoinedTimestamp:](self, "setJoinedTimestamp:", 0LL);
  -[WiFiUsageBssSession setLastLqmUpdateTimestamp:](self, "setLastLqmUpdateTimestamp:", 0LL);
  -[WiFiUsageBssSession setLastPoorCoverageEntryTimestamp:](self, "setLastPoorCoverageEntryTimestamp:", 0LL);
  -[WiFiUsageBssSession setOriginBssDetails:](self, "setOriginBssDetails:", 0LL);
  -[WiFiUsageBssSession setTargetBssDetails:](self, "setTargetBssDetails:", 0LL);
  -[WiFiUsageBssSession setCellularFallbackEnabled:](self, "setCellularFallbackEnabled:", 0LL);
  -[WiFiUsageBssSession setCellularOutrankingEnabled:](self, "setCellularOutrankingEnabled:", 0LL);
  -[WiFiUsageBssSession setBssEnvironment:](self, "setBssEnvironment:", 0LL);
  -[WiFiUsageBssSession setSupportsFastlane:](self, "setSupportsFastlane:", 0LL);
  -[WiFiUsageBssSession setSupportsFastTransition:](self, "setSupportsFastTransition:", 0LL);
  -[WiFiUsageBssSession setSupportsNeighborReport:](self, "setSupportsNeighborReport:", 0LL);
  -[WiFiUsageBssSession setSupportsBssTransitionManagement:](self, "setSupportsBssTransitionManagement:", 0LL);
  -[WiFiUsageBssSession setSupportsAdaptiveFastTransition:](self, "setSupportsAdaptiveFastTransition:", 0LL);
  -[WiFiUsageBssSession setSupportsAdaptiveRoaming:](self, "setSupportsAdaptiveRoaming:", 0LL);
  -[WiFiUsageBssSession setSupportsNetworkAssurance:](self, "setSupportsNetworkAssurance:", 0LL);
  -[WiFiUsageBssSession setRoamConfigTriggerRssi:](self, "setRoamConfigTriggerRssi:", -75LL);
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamConfigChannels.valueByBand = 0u;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = 0u;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = 0u;
  -[WiFiUsageBssSession setJoinRssi:](self, "setJoinRssi:", 0LL);
  -[WiFiUsageBssSession setNewRssi:](self, "setNewRssi:", 0LL);
  -[WiFiUsageBssSession setLastLinkRssi:](self, "setLastLinkRssi:", 0LL);
  -[WiFiUsageBssSession setLastRoamScanRssi:](self, "setLastRoamScanRssi:", 0LL);
  -[WiFiUsageBssSession setCurrentBand:](self, "setCurrentBand:", 3LL);
  -[WiFiUsageBssSession setNewBand:](self, "setNewBand:", 3LL);
  -[WiFiUsageBssSession setCurrentChannel:](self, "setCurrentChannel:", 0LL);
  -[WiFiUsageBssSession setNewChannel:](self, "setNewChannel:", 0LL);
  -[WiFiUsageBssSession setLinkRssiGt40:](self, "setLinkRssiGt40:", 0LL);
  -[WiFiUsageBssSession setLinkRssi40to50:](self, "setLinkRssi40to50:", 0LL);
  -[WiFiUsageBssSession setLinkRssi50to60:](self, "setLinkRssi50to60:", 0LL);
  -[WiFiUsageBssSession setLinkRssi60to65:](self, "setLinkRssi60to65:", 0LL);
  -[WiFiUsageBssSession setLinkRssi65to70:](self, "setLinkRssi65to70:", 0LL);
  -[WiFiUsageBssSession setLinkRssi70to75:](self, "setLinkRssi70to75:", 0LL);
  -[WiFiUsageBssSession setLinkRssi75to80:](self, "setLinkRssi75to80:", 0LL);
  -[WiFiUsageBssSession setLinkRssi80to85:](self, "setLinkRssi80to85:", 0LL);
  -[WiFiUsageBssSession setLinkRssi85to90:](self, "setLinkRssi85to90:", 0LL);
  -[WiFiUsageBssSession setLinkRssiLt90:](self, "setLinkRssiLt90:", 0LL);
  -[WiFiUsageBssSession setRoamReasonInitialAssociationCount:](self, "setRoamReasonInitialAssociationCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonLowRssiCount:](self, "setRoamReasonLowRssiCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonDeauthDisassocCount:](self, "setRoamReasonDeauthDisassocCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonBeaconLostCount:](self, "setRoamReasonBeaconLostCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonSteeredByApCount:](self, "setRoamReasonSteeredByApCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonSteeredByBtmCount:](self, "setRoamReasonSteeredByBtmCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonSteeredByCsaCount:](self, "setRoamReasonSteeredByCsaCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonReassocRequestedCount:](self, "setRoamReasonReassocRequestedCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonHostTriggeredCount:](self, "setRoamReasonHostTriggeredCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonBetterCandidateCount:](self, "setRoamReasonBetterCandidateCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonBetterConditionCount:](self, "setRoamReasonBetterConditionCount:", 0LL);
  -[WiFiUsageBssSession setRoamReasonMiscCount:](self, "setRoamReasonMiscCount:", 0LL);
  -[WiFiUsageBssSession setRoamStatusSucceededCount:](self, "setRoamStatusSucceededCount:", 0LL);
  -[WiFiUsageBssSession setRoamStatusFailedCount:](self, "setRoamStatusFailedCount:", 0LL);
  -[WiFiUsageBssSession setRoamStatusNoCandidateCount:](self, "setRoamStatusNoCandidateCount:", 0LL);
  -[WiFiUsageBssSession setRoamStatusNoQualifiedCandidateCount:](self, "setRoamStatusNoQualifiedCandidateCount:", 0LL);
  -[WiFiUsageBssSession setRoamIsWNMScoreUsedCount:](self, "setRoamIsWNMScoreUsedCount:", 0LL);
  -[WiFiUsageBssSession setRoamPingPongNth:](self, "setRoamPingPongNth:", 0LL);
  -[WiFiUsageBssSession setIsRoamSuppressionEnabled:](self, "setIsRoamSuppressionEnabled:", 0LL);
  -[WiFiUsageBssSession setRoamsAfterSupprLifted:](self, "setRoamsAfterSupprLifted:", 0LL);
  -[WiFiUsageBssSession setLastRoamSuppressionToggled:](self, "setLastRoamSuppressionToggled:", 0LL);
  -[WiFiUsageBssSession setInRoamSuppressionEnabledCount:](self, "setInRoamSuppressionEnabledCount:", 0LL);
  -[WiFiUsageBssSession setInRoamSuppressionEnabledDuration:](self, "setInRoamSuppressionEnabledDuration:", 0.0);
  -[WiFiUsageBssSession setLastRoamSuppressionWaitForRoamStart:](self, "setLastRoamSuppressionWaitForRoamStart:", 0.0);
  -[WiFiUsageBssSession setLastRoamSuppressionWaitForRoamEnd:](self, "setLastRoamSuppressionWaitForRoamEnd:", 0.0);
  -[WiFiUsageBssSession setBssTransitionRequestCount:](self, "setBssTransitionRequestCount:", 0LL);
  -[WiFiUsageBssSession setBssTransitionAcceptedCount:](self, "setBssTransitionAcceptedCount:", 0LL);
  -[WiFiUsageBssSession setBssTransitionRejectedCount:](self, "setBssTransitionRejectedCount:", 0LL);
  -[WiFiUsageBssSession setMinCandidatesCount:](self, "setMinCandidatesCount:", 0LL);
  -[WiFiUsageBssSession setMaxCandidatesCount:](self, "setMaxCandidatesCount:", 0LL);
  -[WiFiUsageBssSession setCurrentRSSIStrongestCount:](self, "setCurrentRSSIStrongestCount:", 0LL);
  -[NSMutableDictionary removeAllObjects](self->_roamNeighborsByBand, "removeAllObjects");
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = 0u;
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = 0u;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand[2] = 0u;
  -[WiFiUsageBssSession setHighRssiRoamScanCount:](self, "setHighRssiRoamScanCount:", 0LL);
  -[WiFiUsageBssSession setLowRssiRoamScanCount:](self, "setLowRssiRoamScanCount:", 0LL);
  -[WiFiUsageBssSession setUnexpectedBeaconLostRoamScanCount:](self, "setUnexpectedBeaconLostRoamScanCount:", 0LL);
  -[WiFiUsageBssSession setPoorCoverageAndA2dpDuration:](self, "setPoorCoverageAndA2dpDuration:", 0.0);
  -[WiFiUsageBssSession setPoorCoverageAndScoDuration:](self, "setPoorCoverageAndScoDuration:", 0.0);
  -[WiFiUsageBssSession setPoorCoverageAndAwdlDuration:](self, "setPoorCoverageAndAwdlDuration:", 0.0);
  -[WiFiUsageBssSession setPoorCoverageAndScanDuration:](self, "setPoorCoverageAndScanDuration:", 0.0);
  -[WiFiUsageBssSession setMinRoamLatency:](self, "setMinRoamLatency:", 0.0);
  -[WiFiUsageBssSession setMaxRoamLatency:](self, "setMaxRoamLatency:", 0.0);
  -[WiFiUsageBssSession setPartialScanCount:](self, "setPartialScanCount:", 0LL);
  -[WiFiUsageBssSession setFullScanCount:](self, "setFullScanCount:", 0LL);
  -[WiFiUsageBssSession setCallStartedTime:](self, "setCallStartedTime:", 0LL);
  -[WiFiUsageBssSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", 0LL);
  -[WiFiUsageBssSession setInMotionStartedTime:](self, "setInMotionStartedTime:", 0LL);
  -[WiFiUsageBssSession setA2dpActiveTime:](self, "setA2dpActiveTime:", 0LL);
  -[WiFiUsageBssSession setScoActiveTime:](self, "setScoActiveTime:", 0LL);
  -[WiFiUsageBssSession setHidPresentTime:](self, "setHidPresentTime:", 0LL);
  -[WiFiUsageBssSession setAwdlActiveTime:](self, "setAwdlActiveTime:", 0LL);
  -[WiFiUsageBssSession setRoamingActiveTime:](self, "setRoamingActiveTime:", 0LL);
  -[WiFiUsageBssSession setScanningActiveTime:](self, "setScanningActiveTime:", 0LL);
  -[WiFiUsageBssSession setLastCellularFallbackStateChangedTime:](self, "setLastCellularFallbackStateChangedTime:", 0LL);
  -[WiFiUsageBssSession setLastCellularOutrankingStateChangedTime:]( self,  "setLastCellularOutrankingStateChangedTime:",  0LL);
  -[WiFiUsageBssSession setInCallDuration:](self, "setInCallDuration:", 0.0);
  -[WiFiUsageBssSession setInVehicleDuration:](self, "setInVehicleDuration:", 0.0);
  -[WiFiUsageBssSession setInMotionDuration:](self, "setInMotionDuration:", 0.0);
  -[WiFiUsageBssSession setInA2dpDuration:](self, "setInA2dpDuration:", 0.0);
  -[WiFiUsageBssSession setInScoDuration:](self, "setInScoDuration:", 0.0);
  -[WiFiUsageBssSession setInHidPresentDuration:](self, "setInHidPresentDuration:", 0.0);
  -[WiFiUsageBssSession setInAwdlDuration:](self, "setInAwdlDuration:", 0.0);
  -[WiFiUsageBssSession setInRoamDuration:](self, "setInRoamDuration:", 0.0);
  -[WiFiUsageBssSession setInScanDuration:](self, "setInScanDuration:", 0.0);
  -[WiFiUsageBssSession setInCellularFallbackDuration:](self, "setInCellularFallbackDuration:", 0.0);
  -[WiFiUsageBssSession setInCellularOutrankingDuration:](self, "setInCellularOutrankingDuration:", 0.0);
  -[WiFiUsageBssSession setInPoorCoverageDuration:](self, "setInPoorCoverageDuration:", 0.0);
  -[WiFiUsageBssSession setInCallEventCount:](self, "setInCallEventCount:", 0LL);
  -[WiFiUsageBssSession setInVehicleEventCount:](self, "setInVehicleEventCount:", 0LL);
  -[WiFiUsageBssSession setInMotionEventCount:](self, "setInMotionEventCount:", 0LL);
  -[WiFiUsageBssSession setInA2dpEventCount:](self, "setInA2dpEventCount:", 0LL);
  -[WiFiUsageBssSession setInScoEventCount:](self, "setInScoEventCount:", 0LL);
  -[WiFiUsageBssSession setInHidPresentCount:](self, "setInHidPresentCount:", 0LL);
  -[WiFiUsageBssSession setInAwdlEventCount:](self, "setInAwdlEventCount:", 0LL);
  -[WiFiUsageBssSession setInRoamEventCount:](self, "setInRoamEventCount:", 0LL);
  -[WiFiUsageBssSession setInScanEventCount:](self, "setInScanEventCount:", 0LL);
  -[WiFiUsageBssSession setCellularFallbackStateChangedCount:](self, "setCellularFallbackStateChangedCount:", 0LL);
  -[WiFiUsageBssSession setCellularOutrankingStateChangedCount:](self, "setCellularOutrankingStateChangedCount:", 0LL);
  -[WiFiUsageBssSession setLocationScanCount:](self, "setLocationScanCount:", 0LL);
  -[WiFiUsageBssSession setIndoorScanCount:](self, "setIndoorScanCount:", 0LL);
  -[WiFiUsageBssSession setTriggerDisconnectAlertedCount:](self, "setTriggerDisconnectAlertedCount:", 0LL);
  -[WiFiUsageBssSession setTriggerDisconnectConfirmedCount:](self, "setTriggerDisconnectConfirmedCount:", 0LL);
  -[WiFiUsageBssSession setTriggerDisconnectExecutedCount:](self, "setTriggerDisconnectExecutedCount:", 0LL);
  [MEMORY[0x189603F50] now];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", v3);
}

- (void)setJoinRssi:(int64_t)a3
{
  self->_joinRssi = a3;
  self->_leftRssi = a3;
  self->_maxLinkRssi = a3;
  self->_minLinkRssi = a3;
  self->_avgLinkRssi = a3;
}

- (void)bssDidChange:(id)a3 withDetails:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [MEMORY[0x189603F50] date];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t lastLinkRssi = self->_lastLinkRssi;
  if (lastLinkRssi >= self->_lastRoamScanRssi) {
    int64_t lastLinkRssi = self->_lastRoamScanRssi;
  }
  self->_leftRssi = lastLinkRssi;
  if (v6
    && (-[WiFiUsageBssSession setNewBand:](self, "setNewBand:", [v6 band]),
        -[WiFiUsageBssSession setNewChannel:](self, "setNewChannel:", [v6 channel]),
        -[WiFiUsageBssSession setNewRssi:](self, "setNewRssi:", [v6 rssi]),
        -[WiFiUsageBssSession setTargetBssDetails:](self, "setTargetBssDetails:", v6),
        self->_roamingActiveTime))
  {
    NSLog( @"%s: in roaming state, skipping BSS session end",  "-[WiFiUsageBssSession bssDidChange:withDetails:]");
  }

  else
  {
    if (self->_originBssDetails)
    {
      NSLog(@"%s: BSS session ended", "-[WiFiUsageBssSession bssDidChange:withDetails:]");
      -[WiFiUsageBssSession updateActivityDurations:](self, "updateActivityDurations:", v7);
      -[WiFiUsageBssSession submitAnalytics](self, "submitAnalytics");
      -[WiFiUsageBssSession reset](self, "reset");
    }

    if (v6)
    {
      -[WiFiUsageBssSession setOriginBssDetails:](self, "setOriginBssDetails:", v6);
      -[WiFiUsageBssSession setTargetBssDetails:](self, "setTargetBssDetails:", 0LL);
      -[WiFiUsageBssSession setJoinRssi:](self, "setJoinRssi:", [v6 rssi]);
      -[WiFiUsageBssSession setCurrentBand:](self, "setCurrentBand:", [v6 band]);
      -[WiFiUsageBssSession setCurrentChannel:](self, "setCurrentChannel:", [v6 channel]);
      -[WiFiUsageBssSession setLastLinkRssi:](self, "setLastLinkRssi:", [v6 rssi]);
      -[WiFiUsageBssSession setJoinedTimestamp:](self, "setJoinedTimestamp:", v7);
      -[WiFiUsageBssSession setBssEnvironment:](self, "setBssEnvironment:", v9);
    }
  }
}

- (void)updateActivityDurations:(id)a3
{
  id v4 = a3;
  lastLqmUpdateTimestamp = self->_lastLqmUpdateTimestamp;
  id v36 = v4;
  if (!lastLqmUpdateTimestamp) {
    lastLqmUpdateTimestamp = self->_joinedTimestamp;
  }
  [v4 timeIntervalSinceDate:lastLqmUpdateTimestamp];
  -[WiFiUsageBssSession updateRssi:timeSinceLastUpdate:](self, "updateRssi:timeSinceLastUpdate:", self->_lastLinkRssi);
  lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
  if (lastPoorCoverageEntryTimestamp)
  {
    if (self->_a2dpActiveTime)
    {
      -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
      uint64_t v7 = 116LL;
      if (v8 > 0.0) {
        uint64_t v7 = 52LL;
      }
      [v36 timeIntervalSinceDate:(&self->super.isa)[v7]];
      self->_poorCoverageAndA2dpDuration = v9 + self->_poorCoverageAndA2dpDuration;
    }

    if (self->_scoActiveTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
      uint64_t v10 = 117LL;
      if (v11 > 0.0) {
        uint64_t v10 = 52LL;
      }
      [v36 timeIntervalSinceDate:(&self->super.isa)[v10]];
      self->_poorCoverageAndScoDuration = v12 + self->_poorCoverageAndScoDuration;
    }

    if (self->_awdlActiveTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
      uint64_t v13 = 119LL;
      if (v14 > 0.0) {
        uint64_t v13 = 52LL;
      }
      [v36 timeIntervalSinceDate:(&self->super.isa)[v13]];
      self->_poorCoverageAndAwdlDuration = v15 + self->_poorCoverageAndAwdlDuration;
    }

    v16 = v36;
    if (self->_scanningActiveTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
      uint64_t v17 = 121LL;
      if (v18 > 0.0) {
        uint64_t v17 = 52LL;
      }
      [v36 timeIntervalSinceDate:(&self->super.isa)[v17]];
      v16 = v36;
      self->_poorCoverageAndScanDuration = v19 + self->_poorCoverageAndScanDuration;
    }

    [v16 timeIntervalSinceDate:self->_lastPoorCoverageEntryTimestamp];
    self->_inPoorCoverageDuration = v20 + self->_inPoorCoverageDuration;
    -[WiFiUsageBssSession setLastPoorCoverageEntryTimestamp:](self, "setLastPoorCoverageEntryTimestamp:", 0LL);
  }

  if (self->_inMotionStartedTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inMotionDuration = v21 + self->_inMotionDuration;
    -[WiFiUsageBssSession setInMotionStartedTime:](self, "setInMotionStartedTime:", 0LL);
  }

  v22 = v36;
  if (self->_inVehicleEntryTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inVehicleDuration = v23 + self->_inVehicleDuration;
    -[WiFiUsageBssSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", 0LL);
    v22 = v36;
  }

  if (self->_callStartedTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inCallDuration = v24 + self->_inCallDuration;
    -[WiFiUsageBssSession setCallStartedTime:](self, "setCallStartedTime:", 0LL);
    v22 = v36;
  }

  if (self->_a2dpActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v25 + self->_inA2dpDuration;
    -[WiFiUsageBssSession setA2dpActiveTime:](self, "setA2dpActiveTime:", 0LL);
    v22 = v36;
  }

  if (self->_scoActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inScoDuration = v26 + self->_inScoDuration;
    -[WiFiUsageBssSession setScoActiveTime:](self, "setScoActiveTime:", 0LL);
    v22 = v36;
  }

  if (self->_hidPresentTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v27 + self->_inHidPresentDuration;
    -[WiFiUsageBssSession setHidPresentTime:](self, "setHidPresentTime:", 0LL);
    v22 = v36;
  }

  if (self->_awdlActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v28 + self->_inAwdlDuration;
    -[WiFiUsageBssSession setAwdlActiveTime:](self, "setAwdlActiveTime:", 0LL);
    v22 = v36;
  }

  if (self->_roamingActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inRoamDuration = v29 + self->_inRoamDuration;
    -[WiFiUsageBssSession setRoamingActiveTime:](self, "setRoamingActiveTime:", 0LL);
    v22 = v36;
  }

  if (self->_lastRoamSuppressionToggled && self->_isRoamSuppressionEnabled)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inRoamSuppressionEnabledDuration = v30 + self->_inRoamSuppressionEnabledDuration;
    lastRoamSuppressionToggled = self->_lastRoamSuppressionToggled;
    self->_lastRoamSuppressionToggled = 0LL;

    v22 = v36;
  }

  if (self->_scanningActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inScanDuration = v32 + self->_inScanDuration;
    -[WiFiUsageBssSession setScanningActiveTime:](self, "setScanningActiveTime:", 0LL);
    v22 = v36;
  }

  if (self->_lastCellularFallbackStateChangedTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inCellularFallbackDuration = v33 + self->_inCellularFallbackDuration;
    -[WiFiUsageBssSession setLastCellularFallbackStateChangedTime:]( self,  "setLastCellularFallbackStateChangedTime:",  0LL);
    v22 = v36;
  }

  if (self->_lastCellularOutrankingStateChangedTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inCellularOutrankingDuration = v34 + self->_inCellularOutrankingDuration;
    -[WiFiUsageBssSession setLastCellularOutrankingStateChangedTime:]( self,  "setLastCellularOutrankingStateChangedTime:",  0LL);
    v22 = v36;
  }

  if (self->_isCompatibilityModeEnabled)
  {
    [v36 timeIntervalSinceDate:self->_lastCompatibilityModeChangedTime];
    self->_inCompatibilityModeEnabledDuration = v35 + self->_inCompatibilityModeEnabledDuration;
    -[WiFiUsageBssSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", 0LL);
    v22 = v36;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithInterfaceName:self->_interfaceName bssEnvironment:self->_bssEnvironment andBssDetails:self->_originBssDetails andNetworkDetails:self->_networkDetails];
  uint64_t v5 = -[NSMutableDictionary mutableCopy](self->_sessionInfo, "mutableCopy");
  id v6 = *(void **)(v4 + 344);
  *(void *)(v4 + 344) = v5;

  uint64_t v7 = -[NSDate copy](self->_joinedTimestamp, "copy");
  double v8 = *(void **)(v4 + 400);
  *(void *)(v4 + 400) = v7;

  uint64_t v9 = -[NSDate copy](self->_lastLqmUpdateTimestamp, "copy");
  uint64_t v10 = *(void **)(v4 + 408);
  *(void *)(v4 + 408) = v9;

  uint64_t v11 = -[NSDate copy](self->_lastPoorCoverageEntryTimestamp, "copy");
  double v12 = *(void **)(v4 + 416);
  *(void *)(v4 + 416) = v11;

  uint64_t v13 = -[NSDate copy](self->_lastCellularFallbackStateChangedTime, "copy");
  double v14 = *(void **)(v4 + 424);
  *(void *)(v4 + 424) = v13;

  uint64_t v15 = -[NSDate copy](self->_lastCellularOutrankingStateChangedTime, "copy");
  v16 = *(void **)(v4 + 432);
  *(void *)(v4 + 432) = v15;

  uint64_t v17 = -[WiFiUsageBssDetails copy](self->_targetBssDetails, "copy");
  double v18 = *(void **)(v4 + 448);
  *(void *)(v4 + 448) = v17;

  *(_BYTE *)(v4 + 320) = self->_cellularFallbackEnabled;
  *(_BYTE *)(v4 + 321) = self->_cellularOutrankingEnabled;
  *(_BYTE *)(v4 + 322) = self->_supportsNeighborReport;
  *(_BYTE *)(v4 + 323) = self->_supportsFastTransition;
  *(_BYTE *)(v4 + 324) = self->_supportsBssTransitionManagement;
  *(_BYTE *)(v4 + 325) = self->_supportsAdaptiveFastTransition;
  *(_BYTE *)(v4 + 326) = self->_supportsFastlane;
  *(_BYTE *)(v4 + 327) = self->_supportsNetworkAssurance;
  *(_BYTE *)(v4 + 328) = self->_supportsAdaptiveRoaming;
  *(void *)(v4 + 352) = self->_roamConfigTriggerRssi;
  __int128 v19 = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  *(_OWORD *)(v4 + 1232) = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  *(_OWORD *)(v4 + 1216) = v19;
  __int128 v20 = *(_OWORD *)&self->_roamConfigCriteria.isAllowed;
  *(_OWORD *)(v4 + 1264) = *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType;
  *(_OWORD *)(v4 + 1248) = v20;
  *(void *)(v4 + 472) = self->_newRssi;
  *(void *)(v4 + 480) = self->_lastLinkRssi;
  *(void *)(v4 + 488) = self->_lastRoamScanRssi;
  *(_DWORD *)(v4 + 336) = self->_currentBand;
  *(_DWORD *)(v4 + 340) = self->_newBand;
  *(void *)(v4 + 496) = self->_currentChannel;
  *(void *)(v4 + 504) = self->_newChannel;
  *(void *)(v4 + 512) = self->_linkRssiGt40;
  *(void *)(v4 + 520) = self->_linkRssi40to50;
  *(void *)(v4 + 528) = self->_linkRssi50to60;
  *(void *)(v4 + 536) = self->_linkRssi60to65;
  *(void *)(v4 + 544) = self->_linkRssi65to70;
  *(void *)(v4 + 552) = self->_linkRssi70to75;
  *(void *)(v4 + 560) = self->_linkRssi75to80;
  *(void *)(v4 + 568) = self->_linkRssi80to85;
  *(void *)(v4 + 576) = self->_linkRssi85to90;
  *(void *)(v4 + 584) = self->_linkRssiLt90;
  *(void *)(v4 + 592) = self->_roamReasonInitialAssociationCount;
  *(void *)(v4 + 600) = self->_roamReasonLowRssiCount;
  *(void *)(v4 + 608) = self->_roamReasonDeauthDisassocCount;
  *(void *)(v4 + 616) = self->_roamReasonBeaconLostCount;
  *(void *)(v4 + 624) = self->_roamReasonSteeredByApCount;
  *(void *)(v4 + 632) = self->_roamReasonSteeredByBtmCount;
  *(void *)(v4 + 640) = self->_roamReasonSteeredByCsaCount;
  *(void *)(v4 + 648) = self->_roamReasonReassocRequestedCount;
  *(void *)(v4 + 656) = self->_roamReasonHostTriggeredCount;
  *(void *)(v4 + 664) = self->_roamReasonBetterCandidateCount;
  *(void *)(v4 + 672) = self->_roamReasonBetterConditionCount;
  *(void *)(v4 + 680) = self->_roamReasonMiscCount;
  *(void *)(v4 + 688) = self->_roamStatusSucceededCount;
  *(void *)(v4 + 696) = self->_roamStatusFailedCount;
  *(void *)(v4 + 704) = self->_roamStatusNoCandidateCount;
  *(void *)(v4 + 712) = self->_roamStatusNoCandidateCount;
  *(void *)(v4 + 728) = self->_roamPingPongNth;
  *(_BYTE *)(v4 + 331) = self->_roamInMotion;
  *(void *)(v4 + 760) = self->_bssTransitionRequestCount;
  *(void *)(v4 + 768) = self->_bssTransitionAcceptedCount;
  *(void *)(v4 + 776) = self->_bssTransitionRejectedCount;
  *(void *)(v4 + 784) = self->_minCandidatesCount;
  *(void *)(v4 + 792) = self->_maxCandidatesCount;
  *(void *)(v4 + 800) = self->_currentRSSIStrongestCount;
  uint64_t v21 = -[NSMutableDictionary copy](self->_roamNeighborsByBand, "copy");
  v22 = *(void **)(v4 + 808);
  *(void *)(v4 + 808) = v21;

  __int128 v23 = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  *(_OWORD *)(v4 + 1296) = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1280) = v23;
  __int128 v24 = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  *(_OWORD *)(v4 + 1328) = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1312) = v24;
  __int128 v25 = *(_OWORD *)self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand;
  *(_OWORD *)(v4 + 1360) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1344) = v25;
  __int128 v26 = *(_OWORD *)self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand;
  *(_OWORD *)(v4 + 1392) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1376) = v26;
  __int128 v27 = *(_OWORD *)self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand;
  *(_OWORD *)(v4 + 1424) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1408) = v27;
  __int128 v28 = *(_OWORD *)self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand;
  *(_OWORD *)(v4 + 1456) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1440) = v28;
  *(void *)(v4 + 816) = self->_highRssiRoamScanCount;
  *(void *)(v4 + 824) = self->_lowRssiRoamScanCount;
  *(void *)(v4 + 832) = self->_unexpectedBeaconLostRoamScanCount;
  *(double *)(v4 + 840) = self->_poorCoverageAndA2dpDuration;
  *(double *)(v4 + 848) = self->_poorCoverageAndScoDuration;
  *(double *)(v4 + 856) = self->_poorCoverageAndAwdlDuration;
  *(double *)(v4 + 864) = self->_poorCoverageAndScanDuration;
  *(double *)(v4 + 872) = self->_minRoamLatency;
  *(double *)(v4 + 880) = self->_maxRoamLatency;
  *(void *)(v4 + 888) = self->_partialScanCount;
  *(void *)(v4 + 896) = self->_fullScanCount;
  uint64_t v29 = -[NSDate copy](self->_callStartedTime, "copy");
  double v30 = *(void **)(v4 + 904);
  *(void *)(v4 + 904) = v29;

  uint64_t v31 = -[NSDate copy](self->_inVehicleEntryTime, "copy");
  double v32 = *(void **)(v4 + 912);
  *(void *)(v4 + 912) = v31;

  uint64_t v33 = -[NSDate copy](self->_inMotionStartedTime, "copy");
  double v34 = *(void **)(v4 + 920);
  *(void *)(v4 + 920) = v33;

  uint64_t v35 = -[NSDate copy](self->_a2dpActiveTime, "copy");
  id v36 = *(void **)(v4 + 928);
  *(void *)(v4 + 928) = v35;

  uint64_t v37 = -[NSDate copy](self->_scoActiveTime, "copy");
  v38 = *(void **)(v4 + 936);
  *(void *)(v4 + 936) = v37;

  uint64_t v39 = -[NSDate copy](self->_hidPresentTime, "copy");
  v40 = *(void **)(v4 + 944);
  *(void *)(v4 + 944) = v39;

  uint64_t v41 = -[NSDate copy](self->_awdlActiveTime, "copy");
  v42 = *(void **)(v4 + 952);
  *(void *)(v4 + 952) = v41;

  uint64_t v43 = -[NSDate copy](self->_roamingActiveTime, "copy");
  v44 = *(void **)(v4 + 960);
  *(void *)(v4 + 960) = v43;

  uint64_t v45 = -[NSDate copy](self->_scanningActiveTime, "copy");
  v46 = *(void **)(v4 + 968);
  *(void *)(v4 + 968) = v45;

  *(double *)(v4 + 976) = self->_inCallDuration;
  *(double *)(v4 + 984) = self->_inVehicleDuration;
  *(double *)(v4 + 992) = self->_inMotionDuration;
  *(double *)(v4 + 1000) = self->_inA2dpDuration;
  *(double *)(v4 + 1008) = self->_inScoDuration;
  *(double *)(v4 + 1016) = self->_inHidPresentDuration;
  *(double *)(v4 + 1024) = self->_inAwdlDuration;
  *(double *)(v4 + 1032) = self->_inRoamDuration;
  *(double *)(v4 + 1040) = self->_inScanDuration;
  *(double *)(v4 + 1048) = self->_inCellularFallbackDuration;
  *(double *)(v4 + 1056) = self->_inCellularOutrankingDuration;
  *(double *)(v4 + 1064) = self->_inPoorCoverageDuration;
  *(void *)(v4 + 1080) = self->_inCallEventCount;
  *(void *)(v4 + 1088) = self->_inVehicleEventCount;
  *(void *)(v4 + 1096) = self->_inMotionEventCount;
  *(void *)(v4 + 1104) = self->_inA2dpEventCount;
  *(void *)(v4 + 1112) = self->_inScoEventCount;
  *(void *)(v4 + 1120) = self->_inHidPresentCount;
  *(void *)(v4 + 1128) = self->_inAwdlEventCount;
  *(void *)(v4 + 1136) = self->_inRoamEventCount;
  *(void *)(v4 + 1144) = self->_inScanEventCount;
  *(void *)(v4 + 1152) = self->_cellularFallbackStateChangedCount;
  *(void *)(v4 + 1160) = self->_cellularOutrankingStateChangedCount;
  *(void *)(v4 + 1168) = self->_locationScanCount;
  *(void *)(v4 + 1176) = self->_indoorScanCount;
  *(void *)(v4 + 1192) = self->_triggerDisconnectAlertedCount;
  *(void *)(v4 + 1200) = self->_triggerDisconnectConfirmedCount;
  *(void *)(v4 + 1208) = self->_triggerDisconnectExecutedCount;
  *(_BYTE *)(v4 + 330) = self->_isCompatibilityModeEnabled;
  *(void *)(v4 + 1184) = self->_compatibilityModeChangeCount;
  objc_storeStrong((id *)(v4 + 440), self->_lastCompatibilityModeChangedTime);
  *(double *)(v4 + 1072) = self->_inCompatibilityModeEnabledDuration;
  return (id)v4;
}

- (BOOL)submitAnalytics
{
  uint64_t v203 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession joinedTimestamp](self, "joinedTimestamp");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v3;
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  [MEMORY[0x189603FC8] dictionary];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:@"BSS" forKeyedSubscript:@"SessionName"];
  +[WiFiUsagePrivacyFilter numberWithDuration:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "numberWithDuration:", v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v8 forKeyedSubscript:@"SessionDuration"];

  [MEMORY[0x189607968] numberWithBool:self->_supportsNeighborReport];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v9 forKeyedSubscript:@"SupportsNeighborReport"];

  [MEMORY[0x189607968] numberWithBool:self->_supportsFastTransition];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v10 forKeyedSubscript:@"SupportsFastTransition"];

  [MEMORY[0x189607968] numberWithBool:self->_supportsBssTransitionManagement];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v11 forKeyedSubscript:@"SupportsBssTransitionManagement"];

  [MEMORY[0x189607968] numberWithBool:self->_supportsAdaptiveFastTransition];
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v12 forKeyedSubscript:@"SupportsAdaptiveFastTransition"];

  [MEMORY[0x189607968] numberWithBool:self->_supportsFastlane];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v13 forKeyedSubscript:@"SupportsFastlane"];

  [MEMORY[0x189607968] numberWithBool:self->_supportsNetworkAssurance];
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v14 forKeyedSubscript:@"SupportsNetworkAssurance"];

  [MEMORY[0x189607968] numberWithBool:self->_supportsAdaptiveRoaming];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v15 forKeyedSubscript:@"SupportsAdaptiveRoaming"];

  [v7 setObject:self->_bssEnvironment forKeyedSubscript:@"NetworkBssEnvironment"];
  [v7 setObject:self->_bssEnvironment forKeyedSubscript:@"NetworkBssEnvironmentString"];
  v16 = (void *)MEMORY[0x189607968];
  BOOL v17 = -[WiFiUsageNetworkDetails hasEnterpriseSecurity](self->_networkDetails, "hasEnterpriseSecurity")
     || -[WiFiUsageNetworkDetails isWidelyDeployed](self->_networkDetails, "isWidelyDeployed");
  [v16 numberWithBool:v17];
  double v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v18 forKeyedSubscript:@"NetworkIsEnterprise"];

  __int128 v19 = (void *)MEMORY[0x189607968];
  BOOL v20 = -[WiFiUsageNetworkDetails isWidelyDeployed](self->_networkDetails, "isWidelyDeployed")
     || -[WiFiUsageNetworkDetails isPublic](self->_networkDetails, "isPublic");
  [v19 numberWithBool:v20];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v21 forKeyedSubscript:@"NetworkIsPublic"];

  [MEMORY[0x189607968] numberWithInteger:self->_roamConfigTriggerRssi];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v22 forKeyedSubscript:@"RoamConfigTriggerRssi"];

  __int128 v23 = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  __int128 v200 = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  __int128 v201 = v23;
  +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForIntegerByBand:",  &v200);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v24 forKeyedSubscript:@"RoamConfigChannelCountByBand"];

  __int128 v25 = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  __int128 v200 = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  __int128 v201 = v25;
  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  +[WiFiUsagePrivacyFilter getSumAllBands:](WiFiUsagePrivacyFilter, "getSumAllBands:", &v200));
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v26 forKeyedSubscript:@"RoamConfigChannelCountTotal"];

  [MEMORY[0x189607968] numberWithBool:self->_roamConfigCriteria.forceApply];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v27 forKeyedSubscript:@"RoamConfigARIsForceApplied"];

  [MEMORY[0x189607968] numberWithBool:self->_roamConfigCriteria.deviceSupport];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v28 forKeyedSubscript:@"RoamConfigARdeviceSupport"];

  [MEMORY[0x189607968] numberWithBool:self->_roamConfigCriteria.isEAP];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v29 forKeyedSubscript:@"RoamConfigARIsEAP"];

  [MEMORY[0x189607968] numberWithInteger:self->_roamConfigCriteria.environment];
  double v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v30 forKeyedSubscript:@"RoamConfigAREnv"];

  [MEMORY[0x189607968] numberWithInteger:self->_roamConfigCriteria.networkOfInterestType];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v31 forKeyedSubscript:@"RoamConfigARNetworkType"];

  [MEMORY[0x189607968] numberWithInteger:self->_roamConfigCriteria.LOIType];
  double v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v32 forKeyedSubscript:@"RoamConfigARLOIType"];

  +[WiFiUsagePrivacyFilter getLabelForNeighborsByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForNeighborsByBand:",  self->_roamNeighborsByBand);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v33 forKeyedSubscript:@"RoamNeighborsCountByBand"];

  +[WiFiUsagePrivacyFilter getSumArrayCountAllBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getSumArrayCountAllBand:",  self->_roamNeighborsByBand);
  double v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v34 forKeyedSubscript:@"RoamNeighborsCountTotal"];

  +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_minCandidatesCount);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v35 forKeyedSubscript:@"RoamCandidatesCountMin"];

  +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_maxCandidatesCount);
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v36 forKeyedSubscript:@"RoamCandidatesCountMax"];

  unint64_t roamReasonLowRssiCount = self->_roamReasonLowRssiCount;
  if (roamReasonLowRssiCount)
  {
    v38 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  100 * self->_currentRSSIStrongestCount / roamReasonLowRssiCount,  0LL);
    [v7 setObject:v38 forKeyedSubscript:@"RoamCandidatesLowRssiCurrentBSSIsBestPerc"];
  }

  else
  {
    [v7 setObject:0 forKeyedSubscript:@"RoamCandidatesLowRssiCurrentBSSIsBestPerc"];
  }

  __int128 v39 = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  __int128 v200 = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  __int128 v201 = v39;
  v40 = +[WiFiUsagePrivacyFilter getLabelForPercIntegerByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForPercIntegerByBand:",  &v200);
  [v7 setObject:v40 forKeyedSubscript:@"RoamCandidatesStrongestRssiByBandPerc"];

  __int128 v41 = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  __int128 v200 = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  __int128 v201 = v41;
  v42 = +[WiFiUsagePrivacyFilter getLabelForRssiByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiByBand:",  &v200);
  [v7 setObject:v42 forKeyedSubscript:@"RoamCandidatesStrongestRssiByBand"];

  __int128 v43 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand[2];
  __int128 v200 = *(_OWORD *)self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand;
  __int128 v201 = v43;
  v44 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBand:",  &v200);
  [v7 setObject:v44 forKeyedSubscript:@"RoamCandidatesSmallestDiffCurrentToNextBestRSSIByBand"];

  __int128 v45 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand[2];
  __int128 v200 = *(_OWORD *)self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand;
  __int128 v201 = v45;
  v46 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBand:",  &v200);
  [v7 setObject:v46 forKeyedSubscript:@"RoamCandidatesLargestDiffCurrentToNextBestRSSIByBand"];

  __int128 v47 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand[2];
  __int128 v200 = *(_OWORD *)self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand;
  __int128 v201 = v47;
  v48 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBand:",  &v200);
  [v7 setObject:v48 forKeyedSubscript:@"RoamCandidatesSmallestDiffCurrentToBestRSSIByBand"];

  __int128 v49 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand[2];
  __int128 v200 = *(_OWORD *)self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand;
  __int128 v201 = v49;
  v50 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBand:",  &v200);
  [v7 setObject:v50 forKeyedSubscript:@"RoamCandidatesLargestDiffCurrentToBestRSSIByBand"];
  v51 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonInitialAssociationCount);
  [v7 setObject:v51 forKeyedSubscript:@"RoamReasonInitialAssociationCount"];
  v52 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonLowRssiCount);
  [v7 setObject:v52 forKeyedSubscript:@"RoamReasonLowRssiCount"];
  v53 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonDeauthDisassocCount);
  [v7 setObject:v53 forKeyedSubscript:@"RoamReasonDeauthDisassocCount"];
  v54 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonBeaconLostCount);
  [v7 setObject:v54 forKeyedSubscript:@"RoamReasonBeaconLostCount"];
  v55 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonSteeredByApCount);
  [v7 setObject:v55 forKeyedSubscript:@"RoamReasonSteeredByApCount"];
  v56 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonSteeredByBtmCount);
  [v7 setObject:v56 forKeyedSubscript:@"RoamReasonSteeredByBtmCount"];
  v57 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonSteeredByCsaCount);
  [v7 setObject:v57 forKeyedSubscript:@"RoamReasonSteeredByCsaCount"];
  v58 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonReassocRequestedCount);
  [v7 setObject:v58 forKeyedSubscript:@"RoamReasonReassocRequestedCount"];
  v59 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonHostTriggeredCount);
  [v7 setObject:v59 forKeyedSubscript:@"RoamReasonHostTriggeredCount"];
  v60 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonBetterCandidateCount);
  [v7 setObject:v60 forKeyedSubscript:@"RoamReasonBetterCandidateCount"];
  v61 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonBetterConditionCount);
  [v7 setObject:v61 forKeyedSubscript:@"RoamReasonBetterConditionCount"];
  v62 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonMiscCount);
  [v7 setObject:v62 forKeyedSubscript:@"RoamReasonMiscCount"];
  v63 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusSucceededCount);
  [v7 setObject:v63 forKeyedSubscript:@"RoamStatusSucceededCount"];
  v64 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusFailedCount);
  [v7 setObject:v64 forKeyedSubscript:@"RoamStatusFailedCount"];
  v65 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusNoCandidateCount);
  [v7 setObject:v65 forKeyedSubscript:@"RoamStatusNoCandidateCount"];
  v66 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusNoQualifiedCandidateCount);
  [v7 setObject:v66 forKeyedSubscript:@"RoamStatusNoQualifiedCandidateCount"];
  v67 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamIsWNMScoreUsedCount);
  [v7 setObject:v67 forKeyedSubscript:@"RoamWNMScoreUsedCount"];
  v68 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamPingPongNth);
  [v7 setObject:v68 forKeyedSubscript:@"RoamPingPongNth"];

  [MEMORY[0x189607968] numberWithBool:self->_roamInMotion];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v69 forKeyedSubscript:@"RoamInMotion"];
  v70 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_bssTransitionRequestCount);
  [v7 setObject:v70 forKeyedSubscript:@"RoamBssTransitionRequestCount"];
  v71 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_bssTransitionAcceptedCount);
  [v7 setObject:v71 forKeyedSubscript:@"RoamBssTransitionAcceptedCount"];
  v72 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_bssTransitionRejectedCount);
  [v7 setObject:v72 forKeyedSubscript:@"RoamBssTransitionRejectedCount"];
  v73 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_highRssiRoamScanCount);
  [v7 setObject:v73 forKeyedSubscript:@"RoamScanCountHighRssi"];
  v74 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_lowRssiRoamScanCount);
  [v7 setObject:v74 forKeyedSubscript:@"RoamScanCountLowRssi"];
  v75 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_unexpectedBeaconLostRoamScanCount);
  [v7 setObject:v75 forKeyedSubscript:@"RoamScanCountUnexpectedBeaconLost"];
  v76 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inRoamSuppressionEnabledCount);
  [v7 setObject:v76 forKeyedSubscript:@"WiFiInRoamSuppressedCount"];
  v77 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inRoamSuppressionEnabledDuration,  v6);
  [v7 setObject:v77 forKeyedSubscript:@"WiFiInRoamSuppressedDuration"];

  double lastRoamSuppressionWaitForRoamStart = self->_lastRoamSuppressionWaitForRoamStart;
  *(float *)&double lastRoamSuppressionWaitForRoamStart = lastRoamSuppressionWaitForRoamStart;
  [MEMORY[0x189607968] numberWithFloat:lastRoamSuppressionWaitForRoamStart];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v79 forKeyedSubscript:@"WiFiInRoamSuppressedWaitForRoamStart"];

  double lastRoamSuppressionWaitForRoamEnd = self->_lastRoamSuppressionWaitForRoamEnd;
  *(float *)&double lastRoamSuppressionWaitForRoamEnd = lastRoamSuppressionWaitForRoamEnd;
  [MEMORY[0x189607968] numberWithFloat:lastRoamSuppressionWaitForRoamEnd];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v81 forKeyedSubscript:@"WiFiInRoamSuppressedWaitForRoamEnd"];
  v82 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inCallEventCount);
  [v7 setObject:v82 forKeyedSubscript:@"SystemInCallCount"];
  v83 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inCallDuration,  v6);
  [v7 setObject:v83 forKeyedSubscript:@"SystemInCallDuration"];
  v84 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inVehicleEventCount);
  [v7 setObject:v84 forKeyedSubscript:@"SystemInVehicleCount"];
  v85 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inVehicleDuration,  v6);
  [v7 setObject:v85 forKeyedSubscript:@"SystemInVehicleDuration"];
  v86 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inMotionEventCount);
  [v7 setObject:v86 forKeyedSubscript:@"SystemInMotionCount"];
  v87 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inMotionDuration,  v6);
  [v7 setObject:v87 forKeyedSubscript:@"SystemInMotionDuration"];
  v88 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_triggerDisconnectAlertedCount);
  [v7 setObject:v88 forKeyedSubscript:@"TriggerDisconnectAlertedCount"];
  v89 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_triggerDisconnectConfirmedCount);
  [v7 setObject:v89 forKeyedSubscript:@"TriggerDisconnectConfirmedCount"];
  v90 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_triggerDisconnectExecutedCount);
  [v7 setObject:v90 forKeyedSubscript:@"TriggerDisconnectExecutedCount"];
  v91 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inA2dpEventCount);
  [v7 setObject:v91 forKeyedSubscript:@"BluetoothInA2dpCount"];
  v92 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inA2dpDuration,  v6);
  [v7 setObject:v92 forKeyedSubscript:@"BluetoothInA2dpDuration"];
  v93 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inScoEventCount);
  [v7 setObject:v93 forKeyedSubscript:@"BluetoothInScoCount"];
  v94 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inScoDuration,  v6);
  [v7 setObject:v94 forKeyedSubscript:@"BluetoothInScoDuration"];
  v95 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inHidPresentCount);
  [v7 setObject:v95 forKeyedSubscript:@"BluetoothInHidCount"];
  v96 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inHidPresentDuration,  v6);
  [v7 setObject:v96 forKeyedSubscript:@"BluetoothInHidDuration"];
  v97 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inAwdlEventCount);
  [v7 setObject:v97 forKeyedSubscript:@"WiFiInAwdlCount"];
  v98 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inAwdlDuration,  v6);
  [v7 setObject:v98 forKeyedSubscript:@"WiFiInAwdlDuration"];
  v99 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inRoamEventCount);
  [v7 setObject:v99 forKeyedSubscript:@"WiFiInRoamCount"];
  v100 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inRoamDuration,  v6);
  [v7 setObject:v100 forKeyedSubscript:@"WiFiInRoamDuration"];
  v101 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inScanEventCount);
  [v7 setObject:v101 forKeyedSubscript:@"WiFiInScanCount"];
  v102 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_locationScanCount);
  [v7 setObject:v102 forKeyedSubscript:@"WiFiInLocationScanCount"];
  v103 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_indoorScanCount);
  [v7 setObject:v103 forKeyedSubscript:@"WiFiInIndoorScanCount"];
  v104 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inScanDuration,  v6);
  [v7 setObject:v104 forKeyedSubscript:@"WiFiInScanDuration"];
  v105 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inCellularFallbackDuration,  v6);
  [v7 setObject:v105 forKeyedSubscript:@"WiFiInCellularFallbackDuration"];
  v106 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_cellularFallbackStateChangedCount);
  [v7 setObject:v106 forKeyedSubscript:@"WiFiCellularFallbackStateChangedCount"];
  v107 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inCellularOutrankingDuration,  v6);
  [v7 setObject:v107 forKeyedSubscript:@"WiFiInCellularOutrankingDuration"];
  v108 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_cellularOutrankingStateChangedCount);
  [v7 setObject:v108 forKeyedSubscript:@"WiFiCellularOutrankingStateChangedCount"];
  v109 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inPoorCoverageDuration,  v6);
  [v7 setObject:v109 forKeyedSubscript:@"PoorCoverageDuration"];
  v110 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_poorCoverageAndA2dpDuration,  v6);
  [v7 setObject:v110 forKeyedSubscript:@"PoorCoverageAndA2dpDuration"];
  v111 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_poorCoverageAndScoDuration,  v6);
  [v7 setObject:v111 forKeyedSubscript:@"PoorCoverageAndScoDuration"];
  v112 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_poorCoverageAndAwdlDuration,  v6);
  [v7 setObject:v112 forKeyedSubscript:@"PoorCoverageAndAwdlDuration"];
  v113 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_poorCoverageAndScanDuration,  v6);
  [v7 setObject:v113 forKeyedSubscript:@"PoorCoverageAndScanDuration"];
  v114 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[1]);
  [v7 setObject:v114 forKeyedSubscript:@"FaultReasonDnsFailureCount"];
  v115 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[2]);
  [v7 setObject:v115 forKeyedSubscript:@"FaultReasonArpFailureCount"];
  v116 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[4]);
  [v7 setObject:v116 forKeyedSubscript:@"FaultReasonShortFlowCount"];
  v117 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[5]);
  [v7 setObject:v117 forKeyedSubscript:@"FaultReasonRTTFailureCount"];
  v118 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[3]);
  [v7 setObject:v118 forKeyedSubscript:@"FaultReasonSymptomDataStallCount"];
  v119 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[6]);
  [v7 setObject:v119 forKeyedSubscript:@"FaultReasonL2DatapathStallCount"];
  v120 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[10]);
  [v7 setObject:v120 forKeyedSubscript:@"FaultReasonSlowWiFi"];
  v121 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[19]);
  [v7 setObject:v121 forKeyedSubscript:@"FaultReasonSlowWiFiDUT"];
  v122 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[13]);
  [v7 setObject:v122 forKeyedSubscript:@"FaultReasonDhcpFailure"];
  v123 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[14]);
  [v7 setObject:v123 forKeyedSubscript:@"FaultReasonLinkTestLocalCheckFailure"];
  v124 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[15]);
  [v7 setObject:v124 forKeyedSubscript:@"FaultReasonLinkTestInternetCheckFailure"];
  v125 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[16]);
  [v7 setObject:v125 forKeyedSubscript:@"FaultReasonLinkTestDNSCheckFailure"];
  v126 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[20]);
  [v7 setObject:v126 forKeyedSubscript:@"FaultReasonUserOverridesCellularOutranking"];
  v127 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[25]);
  [v7 setObject:v127 forKeyedSubscript:@"FaultReasonSiriTimedOut"];
  v128 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[26]);
  [v7 setObject:v128 forKeyedSubscript:@"FaultReasonApsdTimedOut"];
  v129 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[27]);
  [v7 setObject:v129 forKeyedSubscript:@"FaultReasonBrokenBackhaulLinkFailed"];

  [MEMORY[0x189607968] numberWithInteger:self->_joinRssi];
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v130 forKeyedSubscript:@"RssiAtJoin"];

  [MEMORY[0x189607968] numberWithInteger:self->_leftRssi];
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v131 forKeyedSubscript:@"RssiAtLeave"];

  [MEMORY[0x189607968] numberWithInteger:self->_newRssi];
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v132 forKeyedSubscript:@"RssiAfterRoam"];

  [MEMORY[0x189607968] numberWithInteger:self->_lastLinkRssi];
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v133 forKeyedSubscript:@"RssiLastLink"];

  [MEMORY[0x189607968] numberWithInteger:self->_lastRoamScanRssi];
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v134 forKeyedSubscript:@"RssiLastRoamScan"];

  [MEMORY[0x189607968] numberWithInteger:self->_maxLinkRssi];
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v135 forKeyedSubscript:@"RssiMax"];

  [MEMORY[0x189607968] numberWithInteger:self->_minLinkRssi];
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v136 forKeyedSubscript:@"RssiMin"];

  [MEMORY[0x189607968] numberWithInteger:self->_avgLinkRssi];
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v137 forKeyedSubscript:@"RssiAvg"];
  v138 = +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  self->_currentBand);
  [v7 setObject:v138 forKeyedSubscript:@"BandAtJoin"];
  v139 = +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  self->_newBand);
  [v7 setObject:v139 forKeyedSubscript:@"BandAfterRoam"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_currentChannel];
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v140 forKeyedSubscript:@"ChannelAtJoin"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_newChannel];
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v141 forKeyedSubscript:@"ChannelAfterRoam"];

  if (+[WiFiUsagePrivacyFilter isInternalInstall](&OBJC_CLASS___WiFiUsagePrivacyFilter, "isInternalInstall")
    && -[WiFiUsageNetworkDetails isInternal](self->_networkDetails, "isInternal"))
  {
    v142 = -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
    [v7 setObject:v142 forKeyedSubscript:@"NetworkName"];
    v143 = -[WiFiUsageBssDetails bssid](self->_originBssDetails, "bssid");
    [v7 setObject:v143 forKeyedSubscript:@"RoamBssidOrigin"];
    v144 = -[WiFiUsageBssDetails bssid](self->_originBssDetails, "bssid");
    v145 = +[WiFiUsageAccessPointProfile apNameForBSSID:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "apNameForBSSID:", v144);
    [v7 setObject:v145 forKeyedSubscript:@"RoamOriginAPName"];
    v146 = -[WiFiUsageAppleWiFiNameBlocks initWithAPName:]( objc_alloc(&OBJC_CLASS___WiFiUsageAppleWiFiNameBlocks),  "initWithAPName:",  v145);
    v147 = v146;
    if (v146)
    {
      v148 = -[WiFiUsageAppleWiFiNameBlocks building](v146, "building");
      [v7 setObject:v148 forKeyedSubscript:@"RoamOriginAPNamePortionA"];
      v149 = -[WiFiUsageAppleWiFiNameBlocks section](v147, "section");
      [v7 setObject:v149 forKeyedSubscript:@"RoamOriginAPNamePortionB"];
      v150 = -[WiFiUsageAppleWiFiNameBlocks floor](v147, "floor");
      [v7 setObject:v150 forKeyedSubscript:@"RoamOriginAPNamePortionC"];
      v151 = -[WiFiUsageAppleWiFiNameBlocks pod](v147, "pod");
      [v7 setObject:v151 forKeyedSubscript:@"RoamOriginAPNamePortionD"];
      v152 = -[WiFiUsageAppleWiFiNameBlocks other](v147, "other");
      [v7 setObject:v152 forKeyedSubscript:@"RoamOriginAPNamePortionE"];
    }
    v153 = -[WiFiUsageBssDetails bssid](self->_targetBssDetails, "bssid");
    [v7 setObject:v153 forKeyedSubscript:@"RoamBssidTarget"];
    v154 = -[WiFiUsageBssDetails bssid](self->_targetBssDetails, "bssid");
    v155 = +[WiFiUsageAccessPointProfile apNameForBSSID:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "apNameForBSSID:", v154);
    [v7 setObject:v155 forKeyedSubscript:@"RoamTargetAPName"];
    v156 = -[WiFiUsageAppleWiFiNameBlocks initWithAPName:]( objc_alloc(&OBJC_CLASS___WiFiUsageAppleWiFiNameBlocks),  "initWithAPName:",  v155);

    if (v156)
    {
      v157 = -[WiFiUsageAppleWiFiNameBlocks building](v156, "building");
      [v7 setObject:v157 forKeyedSubscript:@"RoamTargetAPNamePortionA"];
      v158 = -[WiFiUsageAppleWiFiNameBlocks section](v156, "section");
      [v7 setObject:v158 forKeyedSubscript:@"RoamTargetAPNamePortionB"];
      v159 = -[WiFiUsageAppleWiFiNameBlocks floor](v156, "floor");
      [v7 setObject:v159 forKeyedSubscript:@"RoamTargetAPNamePortionC"];
      v160 = -[WiFiUsageAppleWiFiNameBlocks pod](v156, "pod");
      [v7 setObject:v160 forKeyedSubscript:@"RoamTargetAPNamePortionD"];
      v161 = -[WiFiUsageAppleWiFiNameBlocks other](v156, "other");
      [v7 setObject:v161 forKeyedSubscript:@"RoamTargetAPNamePortionE"];
    }
  }

  if (self->_linkRssiGt40 < 0)
  {
    int64_t linkRssiGt40 = 0LL;
  }

  else
  {
    [v7 setObject:@"Gt40" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssiGt40;
  }

  if (self->_linkRssi40to50 >= linkRssiGt40)
  {
    [v7 setObject:@"40to50" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssi40to50;
  }

  if (self->_linkRssi50to60 >= linkRssiGt40)
  {
    [v7 setObject:@"50to60" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssi50to60;
  }

  if (self->_linkRssi60to65 >= linkRssiGt40)
  {
    [v7 setObject:@"60to65" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssi60to65;
  }

  if (self->_linkRssi65to70 >= linkRssiGt40)
  {
    [v7 setObject:@"65to70" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssi65to70;
  }

  if (self->_linkRssi70to75 >= linkRssiGt40)
  {
    [v7 setObject:@"70to75" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssi70to75;
  }

  if (self->_linkRssi75to80 >= linkRssiGt40)
  {
    [v7 setObject:@"75to80" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssi75to80;
  }

  if (self->_linkRssi80to85 >= linkRssiGt40)
  {
    [v7 setObject:@"80to85" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssi80to85;
  }

  if (self->_linkRssi85to90 >= linkRssiGt40)
  {
    [v7 setObject:@"85to90" forKeyedSubscript:@"RssiMode"];
    int64_t linkRssiGt40 = self->_linkRssi85to90;
  }

  if (self->_linkRssiLt90 >= linkRssiGt40) {
    [v7 setObject:@"Lt90" forKeyedSubscript:@"RssiMode"];
  }
  [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)self->_minRoamLatency];
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v163 forKeyedSubscript:@"RoamLatencyMin"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)self->_maxRoamLatency];
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v164 forKeyedSubscript:@"RoamLatencyMax"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_partialScanCount];
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v165 forKeyedSubscript:@"PartialScanCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_fullScanCount];
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v166 forKeyedSubscript:@"FullScanCount"];

  [MEMORY[0x189607968] numberWithBool:self->_isCompatibilityModeEnabledAtStart];
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v167 forKeyedSubscript:@"WiFiCompatibilityModeEnabledAtStart"];

  [MEMORY[0x189607968] numberWithBool:self->_isCompatibilityModeEnabled];
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v168 forKeyedSubscript:@"WiFiCompatibilityModeEnabledAtEnd"];

  [MEMORY[0x189607968] numberWithInteger:self->_compatibilityModeChangeCount];
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v169 forKeyedSubscript:@"WiFiCompatibilityModeChangeCount"];
  v170 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inCompatibilityModeEnabledDuration,  v6);
  [v7 setObject:v170 forKeyedSubscript:@"WiFiCompatibilityModeChangeDuration"];
  v171 = -[WiFiUsageBssSession originBssDetails](self, "originBssDetails");
  [v171 eventDictionary:1];
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addEntriesFromDictionary:v172];

  context = (void *)MEMORY[0x1895BA820]();
  v173 = (void *)MEMORY[0x189607940];
  v195 = self;
  v174 = (objc_class *)objc_opt_class();
  NSStringFromClass(v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  [v173 stringWithFormat:@"%@:: ", v175];
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  v177 = v7;
  [v7 allKeys];
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  [v178 sortedArrayUsingSelector:sel_compare_];
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v198 = 0u;
  __int128 v199 = 0u;
  __int128 v196 = 0u;
  __int128 v197 = 0u;
  id v180 = v179;
  uint64_t v181 = [v180 countByEnumeratingWithState:&v196 objects:v202 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v197;
    do
    {
      for (uint64_t i = 0LL; i != v182; ++i)
      {
        if (*(void *)v197 != v183) {
          objc_enumerationMutation(v180);
        }
        uint64_t v185 = *(void *)(*((void *)&v196 + 1) + 8 * i);
        [v177 objectForKey:v185];
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        [v176 appendFormat:@"%@=%@; ", v185, v186, context];

        if ((unint64_t)[v176 length] >= 0xB5)
        {
          NSLog(@"%@", v176);
          v187 = (void *)NSString;
          v188 = (objc_class *)objc_opt_class();
          NSStringFromClass(v188);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          [v187 stringWithFormat:@"%@:: ", v189];
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          [v176 setString:v190];
        }
      }

      uint64_t v182 = [v180 countByEnumeratingWithState:&v196 objects:v202 count:16];
    }

    while (v182);
  }

  NSLog(@"%@", v176);
  NSLog( @"%s:Total BSS session fields: %d",  "-[WiFiUsageBssSession submitAnalytics]",  [v180 count]);

  objc_autoreleasePoolPop(context);
  id v191 = v177;
  AnalyticsSendEventLazy();

  -[WiFiUsageBssSession setSessionInfo:](v195, "setSessionInfo:", v191);
  return 1;
}

id __38__WiFiUsageBssSession_submitAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)motionStateDidChange:(BOOL)a3 andVehicularState:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [MEMORY[0x189603F50] date];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v7;
  if (v5)
  {
    -[WiFiUsageBssSession setInMotionStartedTime:](self, "setInMotionStartedTime:", v7);
    ++self->_inMotionEventCount;
  }

  else if (self->_inMotionStartedTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    self->_inMotionDuration = v8 + self->_inMotionDuration;
    -[WiFiUsageBssSession setInMotionStartedTime:](self, "setInMotionStartedTime:", 0LL);
  }

  if (v4)
  {
    -[WiFiUsageBssSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", v11);
    uint64_t v9 = v11;
    ++self->_inVehicleEventCount;
  }

  else
  {
    uint64_t v9 = v11;
    if (self->_inVehicleEntryTime)
    {
      objc_msgSend(v11, "timeIntervalSinceDate:");
      self->_inVehicleDuration = v10 + self->_inVehicleDuration;
      -[WiFiUsageBssSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", 0LL);
      uint64_t v9 = v11;
    }
  }
}

- (void)callStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v3)
  {
    double v8 = v5;
    -[WiFiUsageBssSession setCallStartedTime:](self, "setCallStartedTime:", v5);
    double v6 = v8;
    ++self->_inCallEventCount;
  }

  else if (self->_callStartedTime)
  {
    uint64_t v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_inCallDuration = v7 + self->_inCallDuration;
    -[WiFiUsageBssSession setCallStartedTime:](self, "setCallStartedTime:", 0LL);
    double v6 = v9;
  }
}

- (void)updateRssi:(int64_t)a3 timeSinceLastUpdate:(double)a4
{
  uint64_t v7 = [MEMORY[0x189603F50] date];
  double v8 = (void *)v7;
  if (a3)
  {
    v40 = (void *)v7;
    -[WiFiUsageBssSession setLastLinkRssi:](self, "setLastLinkRssi:", a3);
    if (a3 <= -41)
    {
      if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFCDLL)
      {
        uint64_t v9 = 528LL;
        uint64_t v10 = 536LL;
        uint64_t v11 = 544LL;
        uint64_t v12 = 552LL;
        uint64_t v13 = 560LL;
        uint64_t v14 = 568LL;
        uint64_t v15 = 584LL;
      }

      else
      {
        uint64_t v9 = 520LL;
      }
    }

    else
    {
      uint64_t v9 = 512LL;
    }

    double v8 = v40;
    *(Class *)((char *)&self->super.isa + v9) = (Class)(uint64_t)((double)*(uint64_t *)((char *)&self->super.isa + v9) + a4);
    maxLinkRssuint64_t i = self->_maxLinkRssi;
    minLinkRssuint64_t i = self->_minLinkRssi;
    if (minLinkRssi >= a3) {
      int64_t v18 = a3;
    }
    else {
      int64_t v18 = self->_minLinkRssi;
    }
    if (minLinkRssi) {
      int64_t v19 = v18;
    }
    else {
      int64_t v19 = a3;
    }
    if (maxLinkRssi <= a3) {
      int64_t v20 = a3;
    }
    else {
      int64_t v20 = self->_maxLinkRssi;
    }
    if (maxLinkRssi) {
      int64_t v21 = v20;
    }
    else {
      int64_t v21 = a3;
    }
    self->_maxLinkRssuint64_t i = v21;
    self->_minLinkRssuint64_t i = v19;
    avgLinkRssuint64_t i = self->_avgLinkRssi;
    if (avgLinkRssi) {
      uint64_t v23 = (uint64_t)((double)(avgLinkRssi + a3) * 0.5);
    }
    else {
      uint64_t v23 = a3;
    }
    self->_avgLinkRssuint64_t i = v23;
    lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
    if (self->_roamConfigTriggerRssi <= a3)
    {
      if (lastPoorCoverageEntryTimestamp)
      {
        if (self->_a2dpActiveTime)
        {
          -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
          uint64_t v26 = 116LL;
          if (v27 > 0.0) {
            uint64_t v26 = 52LL;
          }
          [v40 timeIntervalSinceDate:(&self->super.isa)[v26]];
          self->_poorCoverageAndA2dpDuration = v28 + self->_poorCoverageAndA2dpDuration;
        }

        if (self->_scoActiveTime)
        {
          -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
          uint64_t v29 = 117LL;
          if (v30 > 0.0) {
            uint64_t v29 = 52LL;
          }
          [v40 timeIntervalSinceDate:(&self->super.isa)[v29]];
          self->_poorCoverageAndScoDuration = v31 + self->_poorCoverageAndScoDuration;
        }

        if (self->_awdlActiveTime)
        {
          -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
          uint64_t v32 = 119LL;
          if (v33 > 0.0) {
            uint64_t v32 = 52LL;
          }
          [v40 timeIntervalSinceDate:(&self->super.isa)[v32]];
          self->_poorCoverageAndAwdlDuration = v34 + self->_poorCoverageAndAwdlDuration;
        }

        uint64_t v35 = v40;
        if (self->_scanningActiveTime)
        {
          -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
          uint64_t v36 = 121LL;
          if (v37 > 0.0) {
            uint64_t v36 = 52LL;
          }
          [v40 timeIntervalSinceDate:(&self->super.isa)[v36]];
          uint64_t v35 = v40;
          self->_poorCoverageAndScanDuration = v38 + self->_poorCoverageAndScanDuration;
        }

        [v35 timeIntervalSinceDate:self->_lastPoorCoverageEntryTimestamp];
        __int128 v25 = 0LL;
        self->_inPoorCoverageDuration = v39 + self->_inPoorCoverageDuration;
        goto LABEL_56;
      }
    }

    else
    {
      __int128 v25 = v40;
      if (!lastPoorCoverageEntryTimestamp)
      {
LABEL_56:
        -[WiFiUsageBssSession setLastPoorCoverageEntryTimestamp:](self, "setLastPoorCoverageEntryTimestamp:", v25);
        double v8 = v40;
      }
    }
  }
}

- (void)linkQualityDidChange:(id)a3
{
  id v9 = a3;
  [MEMORY[0x189603F50] date];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = v4;
  lastLqmUpdateTimestamp = self->_lastLqmUpdateTimestamp;
  if (!lastLqmUpdateTimestamp) {
    lastLqmUpdateTimestamp = self->_joinedTimestamp;
  }
  [v4 timeIntervalSinceDate:lastLqmUpdateTimestamp];
  double v8 = v7;
  if (!self->_lastLqmUpdateTimestamp || v7 >= 1.0)
  {
    -[WiFiUsageBssSession setLastLqmUpdateTimestamp:](self, "setLastLqmUpdateTimestamp:", v5);
    -[WiFiUsageBssSession updateRssi:timeSinceLastUpdate:]( self,  "updateRssi:timeSinceLastUpdate:",  [v9 rssi],  v8);
  }
}

- (void)bluetoothStateDidChange:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  objc_msgSend(MEMORY[0x189603F50], "date", a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v21 = v10;
  if (v7)
  {
    -[WiFiUsageBssSession setA2dpActiveTime:](self, "setA2dpActiveTime:", v10);
    ++self->_inA2dpEventCount;
  }

  else if (self->_a2dpActiveTime)
  {
    objc_msgSend(v10, "timeIntervalSinceDate:");
    self->_double inA2dpDuration = v11 + self->_inA2dpDuration;
    lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
    if (lastPoorCoverageEntryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:", self->_a2dpActiveTime);
      if (v13 <= 0.0) {
        double inA2dpDuration = self->_inA2dpDuration;
      }
      else {
        [v21 timeIntervalSinceDate:self->_lastPoorCoverageEntryTimestamp];
      }
      self->_poorCoverageAndA2dpDuration = inA2dpDuration + self->_poorCoverageAndA2dpDuration;
    }

    -[WiFiUsageBssSession setA2dpActiveTime:](self, "setA2dpActiveTime:", 0LL);
  }

  if (v6)
  {
    -[WiFiUsageBssSession setScoActiveTime:](self, "setScoActiveTime:", v21);
    uint64_t v15 = v21;
    ++self->_inScoEventCount;
  }

  else
  {
    uint64_t v15 = v21;
    if (self->_scoActiveTime)
    {
      objc_msgSend(v21, "timeIntervalSinceDate:");
      self->_double inScoDuration = v16 + self->_inScoDuration;
      BOOL v17 = self->_lastPoorCoverageEntryTimestamp;
      if (v17)
      {
        -[NSDate timeIntervalSinceDate:](v17, "timeIntervalSinceDate:", self->_scoActiveTime);
        if (v18 <= 0.0) {
          double inScoDuration = self->_inScoDuration;
        }
        else {
          [v21 timeIntervalSinceDate:self->_lastPoorCoverageEntryTimestamp];
        }
        self->_poorCoverageAndScoDuration = inScoDuration + self->_poorCoverageAndScoDuration;
      }

      -[WiFiUsageBssSession setScoActiveTime:](self, "setScoActiveTime:", 0LL);
      uint64_t v15 = v21;
    }
  }

  if (a4)
  {
    -[WiFiUsageBssSession setHidPresentTime:](self, "setHidPresentTime:", v15);
    uint64_t v15 = v21;
    ++self->_inHidPresentCount;
  }

  else if (self->_hidPresentTime)
  {
    objc_msgSend(v15, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v20 + self->_inHidPresentDuration;
    -[WiFiUsageBssSession setHidPresentTime:](self, "setHidPresentTime:", 0LL);
    uint64_t v15 = v21;
  }
}

- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4
{
  BOOL v4 = a3;
  objc_msgSend(MEMORY[0x189603F50], "date", a3, a4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6;
  if (v4)
  {
    uint64_t v12 = v6;
    -[WiFiUsageBssSession setAwdlActiveTime:](self, "setAwdlActiveTime:", v6);
    BOOL v7 = v12;
    ++self->_inAwdlEventCount;
  }

  else if (self->_awdlActiveTime)
  {
    double v13 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    self->_double inAwdlDuration = v8 + self->_inAwdlDuration;
    lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
    if (lastPoorCoverageEntryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:", self->_awdlActiveTime);
      if (v10 <= 0.0) {
        double inAwdlDuration = self->_inAwdlDuration;
      }
      else {
        [v13 timeIntervalSinceDate:self->_lastPoorCoverageEntryTimestamp];
      }
      self->_poorCoverageAndAwdlDuration = inAwdlDuration + self->_poorCoverageAndAwdlDuration;
    }

    -[WiFiUsageBssSession setAwdlActiveTime:](self, "setAwdlActiveTime:", 0LL);
    BOOL v7 = v13;
  }
}

- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongNth:(BOOL)a8
{
  BOOL v8 = a8;
  int v10 = a5;
  int v11 = a4;
  BOOL v12 = a3;
  id v43 = a7;
  [MEMORY[0x189603F50] date];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  if (v12)
  {
    -[WiFiUsageBssSession setRoamingActiveTime:](self, "setRoamingActiveTime:", v14);
    ++self->_inRoamEventCount;
    if (self->_lastRoamSuppressionToggled && !self->_isRoamSuppressionEnabled && !self->_roamsAfterSupprLifted)
    {
      objc_msgSend(v15, "timeIntervalSinceDate:");
      self->_double lastRoamSuppressionWaitForRoamStart = v16;
      NSLog( @"%s - lastRoamSuppressionWaitForRoamStart:%fs",  "-[WiFiUsageBssSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:]",  *(void *)&v16);
    }

    int64_t lastLinkRssi = self->_lastLinkRssi;
    self->_lastRoamScanRssuint64_t i = lastLinkRssi;
    if (lastLinkRssi > self->_roamConfigTriggerRssi)
    {
      ++self->_highRssiRoamScanCount;
      switch(v11)
      {
        case -528348160:
          goto LABEL_42;
        case -528348159:
          goto LABEL_43;
        case -528348158:
        case -528348157:
          goto LABEL_41;
        case -528348156:
          ++self->_unexpectedBeaconLostRoamScanCount;
          goto LABEL_50;
        case -528348154:
          goto LABEL_45;
        case -528348152:
          goto LABEL_46;
        case -528348151:
        case -528348150:
        case -528348148:
        case -528348145:
          goto LABEL_31;
        case -528348149:
          goto LABEL_47;
        case -528348146:
          goto LABEL_48;
        case -528348141:
          goto LABEL_51;
        case -528348139:
          goto LABEL_49;
        default:
          goto LABEL_44;
      }
    }

    ++self->_lowRssiRoamScanCount;
    switch(v11)
    {
      case -528348160:
LABEL_42:
        ++self->_roamReasonInitialAssociationCount;
        break;
      case -528348159:
LABEL_43:
        ++self->_roamReasonLowRssiCount;
        break;
      case -528348158:
      case -528348157:
LABEL_41:
        ++self->_roamReasonDeauthDisassocCount;
        break;
      case -528348156:
LABEL_50:
        ++self->_roamReasonBeaconLostCount;
        break;
      case -528348154:
LABEL_45:
        ++self->_roamReasonSteeredByApCount;
        break;
      case -528348152:
LABEL_46:
        ++self->_roamReasonBetterCandidateCount;
        break;
      case -528348151:
      case -528348150:
      case -528348148:
      case -528348145:
LABEL_31:
        ++self->_roamReasonBetterConditionCount;
        break;
      case -528348149:
LABEL_47:
        ++self->_roamReasonSteeredByBtmCount;
        break;
      case -528348146:
LABEL_48:
        ++self->_roamReasonSteeredByCsaCount;
        break;
      case -528348141:
LABEL_51:
        ++self->_roamReasonReassocRequestedCount;
        break;
      case -528348139:
LABEL_49:
        ++self->_roamReasonHostTriggeredCount;
        break;
      default:
LABEL_44:
        ++self->_roamReasonMiscCount;
        break;
    }
  }

  else if (self->_roamingActiveTime)
  {
    if (!a6)
    {
      objc_msgSend(v14, "timeIntervalSinceDate:");
      a6 = (unint64_t)(v18 * 1000.0);
    }

    double minRoamLatency = self->_minRoamLatency;
    self->_double minRoamLatency = minRoamLatency;
    double maxRoamLatency = self->_maxRoamLatency;
    self->_double maxRoamLatency = maxRoamLatency;
    [v43 objectForKey:@"ROAM_SCAN_SUMMARY"];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v24 = v23;
    if (v23
      && ([v23 objectForKeyedSubscript:@"ROAM_NUM_FULL_BAND_SCANS"],
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v25,
          v25))
    {
      [v24 objectForKeyedSubscript:@"ROAM_NUM_FULL_BAND_SCANS"];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v26 integerValue];

      if (v27 >= 1) {
        ++self->_fullScanCount;
      }
      [v24 objectForKeyedSubscript:@"ROAM_NUM_PARTIAL_SCANS"];
      double v28 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [v28 integerValue];

      if (v29 >= 1) {
        ++self->_partialScanCount;
      }
    }

    else
    {
      [v43 objectForKey:@"ROAMEDEVENT_CHANNELS_SCANNED_COUNT"];
      double v30 = (void *)objc_claimAutoreleasedReturnValue();
      double v31 = v30;
      if (v30)
      {
        unint64_t v32 = [v30 unsignedIntegerValue];
        uint64_t v33 = 111LL;
        if (v32 > 0xD) {
          uint64_t v33 = 112LL;
        }
        ++(&self->super.isa)[v33];
      }
    }

    [v15 timeIntervalSinceDate:self->_roamingActiveTime];
    self->_inRoamDuration = v34 + self->_inRoamDuration;
    -[WiFiUsageBssSession setRoamingActiveTime:](self, "setRoamingActiveTime:", 0LL);
    if (self->_lastRoamSuppressionToggled && !self->_isRoamSuppressionEnabled)
    {
      unint64_t roamsAfterSupprLifted = self->_roamsAfterSupprLifted;
      unint64_t v36 = roamsAfterSupprLifted + 1;
      self->_unint64_t roamsAfterSupprLifted = roamsAfterSupprLifted + 1;
      if (roamsAfterSupprLifted)
      {
        double lastRoamSuppressionWaitForRoamEnd = self->_lastRoamSuppressionWaitForRoamEnd;
      }

      else
      {
        objc_msgSend(v15, "timeIntervalSinceDate:");
        self->_double lastRoamSuppressionWaitForRoamEnd = lastRoamSuppressionWaitForRoamEnd;
        unint64_t v36 = self->_roamsAfterSupprLifted;
      }

      NSLog( @"%s - roamsAfterSupprLifted:%lu lastRoamSuppressionWaitForRoamEnd :%fs",  "-[WiFiUsageBssSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:]",  v36,  *(void *)&lastRoamSuppressionWaitForRoamEnd);
    }

    if (v10 == -528350205)
    {
      ++self->_roamStatusNoCandidateCount;
    }

    else if (v10 == -528350133)
    {
      ++self->_roamStatusNoQualifiedCandidateCount;
    }

    else if (v10)
    {
      ++self->_roamStatusFailedCount;
    }

    else
    {
      ++self->_roamStatusSucceededCount;
      self->_roamPingPongNth = v8;
      self->_roamInMotion = self->_inMotionStartedTime != 0LL;
    }

    [v43 objectForKey:@"ROAMEDEVENT_FLAGS"];
    double v38 = (void *)objc_claimAutoreleasedReturnValue();
    double v39 = v38;
    if (v38) {
      self->_roamIsWNMScoreUsedCount += ((unint64_t)[v38 unsignedIntegerValue] >> 6) & 1;
    }
    if (self->_targetBssDetails)
    {
      NSLog( @"%s: BSS session ended",  "-[WiFiUsageBssSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:]");
      -[WiFiUsageBssSession updateActivityDurations:](self, "updateActivityDurations:", v15);
      -[WiFiUsageBssSession submitAnalytics](self, "submitAnalytics");
      -[WiFiUsageBssSession reset](self, "reset");
      -[WiFiUsageBssSession setOriginBssDetails:](self, "setOriginBssDetails:", self->_targetBssDetails);
      -[WiFiUsageBssSession setJoinRssi:]( self,  "setJoinRssi:",  -[WiFiUsageBssDetails rssi](self->_targetBssDetails, "rssi"));
      -[WiFiUsageBssSession setCurrentBand:]( self,  "setCurrentBand:",  -[WiFiUsageBssDetails band](self->_targetBssDetails, "band"));
      -[WiFiUsageBssSession setCurrentChannel:]( self,  "setCurrentChannel:",  -[WiFiUsageBssDetails channel](self->_targetBssDetails, "channel"));
      -[WiFiUsageBssSession setLastLinkRssi:]( self,  "setLastLinkRssi:",  -[WiFiUsageBssDetails rssi](self->_targetBssDetails, "rssi"));
      -[WiFiUsageBssSession setTargetBssDetails:](self, "setTargetBssDetails:", 0LL);
      -[WiFiUsageBssSession setJoinedTimestamp:](self, "setJoinedTimestamp:", v15);
    }
  }

  [v43 objectForKey:@"ROAMEDEVENT_FLAGS"];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v41 = v40;
  if (!v40) {
    goto LABEL_74;
  }
  char v42 = [v40 unsignedIntegerValue];
  if ((v42 & 1) != 0)
  {
    self->_supportsNeighborReport = 1;
    if ((v42 & 2) == 0)
    {
LABEL_69:
      if ((v42 & 4) == 0) {
        goto LABEL_70;
      }
      goto LABEL_77;
    }
  }

  else if ((v42 & 2) == 0)
  {
    goto LABEL_69;
  }

  self->_supportsFastTransition = 1;
  if ((v42 & 4) == 0)
  {
LABEL_70:
    if ((v42 & 8) == 0) {
      goto LABEL_71;
    }
    goto LABEL_78;
  }

- (void)roamingARConfigurationDidChange:(id *)a3
{
  self->_supportsAdaptiveRoaming = a3->var0;
  __int128 v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = v3;
}

- (void)roamingConfigurationDidChange:(int64_t)a3 withChannelList:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  self->_roamConfigTriggerRssuint64_t i = a3;
  *(_OWORD *)self->_roamConfigChannels.valueByBand = 0u;
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  [a4 allObjects];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKey:@"IO80211ChannelFlags"];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = +[WiFiUsagePrivacyFilter bandFromFlags:]( WiFiUsagePrivacyFilter,  "bandFromFlags:",  [v9 integerValue]);

        ++self->_roamConfigChannels.valueByBand[v10];
        self->_roamConfigChannels.valid[v10] = 1;
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }
}

- (void)updateRssiDiffStats:(id *)a3 For:(id)a4
{
  id v6 = a4;
  int64_t var3 = a3->var3;
  int64_t var0 = a3->var0;
  [NSString stringWithFormat:@"roamNeighsSmllst%@RssiByBand", v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession valueForKey:](self, "valueForKey:", v9);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = v10;
  if (v10)
  {
    [v10 integerByBandValue];
  }

  else
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
  }

  int64_t v12 = var3 - var0;

  uint64_t var5 = a3->var5;
  if (!*((_BYTE *)&v29 + var5 + 8) || v12 < *((void *)&v28 + var5))
  {
    *((void *)&v28 + var5) = v12;
    *((_BYTE *)&v29 + var5 + 8) = 1;
    __int128 v26 = v28;
    __int128 v27 = v29;
    [MEMORY[0x189607B18] valuewithIntegerByBand:&v26];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageBssSession setValue:forKey:](self, "setValue:forKey:", v14, v9);
  }

  [NSString stringWithFormat:@"roamNeighsLrgst%@RssiByBand", v6];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiUsageBssSession valueForKey:](self, "valueForKey:", v15);
  double v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v16;
  if (v16)
  {
    [v16 integerByBandValue];
  }

  else
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
  }

  uint64_t v18 = a3->var5;
  if (!*((_BYTE *)&v27 + v18 + 8) || v12 > *((void *)&v26 + v18))
  {
    *((void *)&v26 + v18) = v12;
    *((_BYTE *)&v27 + v18 + 8) = 1;
    __int128 v24 = v26;
    __int128 v25 = v27;
    [MEMORY[0x189607B18] valuewithIntegerByBand:&v24];
    int64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageBssSession setValue:forKey:](self, "setValue:forKey:", v19, v15);

    uint64_t v18 = a3->var5;
  }

  int64_t v20 = a3->var3;
  +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", v18);
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v24 = v28;
  __int128 v25 = v29;
  v22 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBand:",  &v24);
  __int128 v24 = v26;
  __int128 v25 = v27;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBand:",  &v24);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s - strongestRssiExcludingCurrent:%lddBm currentToBestRSSIdiff:%lddB strongestRSSIbandExcludingCurrent:%@Ghz -->\n smallestDiff:%@ largestDiff:%@",  "-[WiFiUsageBssSession updateRssiDiffStats:For:]",  v20,  v12,  v21,  v22,  v23);
}

- (void)roamCandidatesStatsDidUpdate:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  [a3->var7 allKeys];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_roamNeighborsByBand, "objectForKey:", v9);
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          int v10 = (void *)objc_opt_new();
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_roamNeighborsByBand,  "setObject:forKeyedSubscript:",  v10,  v9);
        }

        [a3->var7 objectForKeyedSubscript:v9];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 allObjects];
        int64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 addObjectsFromArray:v12];
      }

      uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v6);
  }

  unint64_t minCandidatesCount = self->_minCandidatesCount;
  if (minCandidatesCount >= a3->var6) {
    unint64_t var6 = a3->var6;
  }
  else {
    unint64_t var6 = self->_minCandidatesCount;
  }
  if (minCandidatesCount) {
    unint64_t v15 = var6;
  }
  else {
    unint64_t v15 = a3->var6;
  }
  self->_unint64_t minCandidatesCount = v15;
  unint64_t maxCandidatesCount = self->_maxCandidatesCount;
  if (maxCandidatesCount <= a3->var6) {
    unint64_t v17 = a3->var6;
  }
  else {
    unint64_t v17 = self->_maxCandidatesCount;
  }
  if (maxCandidatesCount) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = a3->var6;
  }
  self->_unint64_t maxCandidatesCount = v18;
  NSLog( @"%s - stats.candidatesCount:%lu --> _minCandidatesCount:%lu _maxCandidatesCount:%lu",  "-[WiFiUsageBssSession roamCandidatesStatsDidUpdate:]",  a3->var6,  v15,  v18);
  unint64_t currentRSSIStrongestCount = self->_currentRSSIStrongestCount;
  if (a3->var2 == a3->var0) {
    self->_unint64_t currentRSSIStrongestCount = ++currentRSSIStrongestCount;
  }
  uint64_t var4 = a3->var4;
  int64_t v21 = &(&self->super.isa)[var4];
  v21[160] = (Class)((char *)v21[160] + 1);
  v22 = (char *)self + var4;
  v22[1304] = 1;
  v21[164] = (Class)a3->var2;
  v22[1336] = 1;
  NSLog( @"%s - stats.strongestRSSI:%lddBm stats.currentBssRSSI:%lddBm --> _currentRSSIStrongestCount:%lu",  "-[WiFiUsageBssSession roamCandidatesStatsDidUpdate:]",  a3->var2,  a3->var0,  currentRSSIStrongestCount);
  int64_t var0 = a3->var0;
  if (a3->var0 >= -94)
  {
    int64_t var3 = a3->var3;
    if (var3 >= -94)
    {
      if (var3 >= var0) {
        __int128 v25 = &v28;
      }
      else {
        __int128 v25 = &v29;
      }
      if (var3 >= var0) {
        __int128 v26 = @"CurrentToBest";
      }
      else {
        __int128 v26 = @"CurrentToNextBest";
      }
      __int128 v27 = *(_OWORD *)&a3->var2;
      *(_OWORD *)__int128 v25 = *(_OWORD *)&a3->var0;
      *((_OWORD *)v25 + 1) = v27;
      *((_OWORD *)v25 + 2) = *(_OWORD *)&a3->var4;
      *((void *)v25 + 6) = a3->var7;
      *((void *)v25 + 7) = a3->var8;
      v25[64] = a3->var9;
      -[WiFiUsageBssSession updateRssiDiffStats:For:](self, "updateRssiDiffStats:For:", v25, v26);
    }
  }
}

- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6
{
  BOOL v7 = a3;
  objc_msgSend(MEMORY[0x189603F50], "date", a3, a4, a5, a6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = v9;
  if (!v7)
  {
    if (!self->_scanningActiveTime) {
      goto LABEL_14;
    }
    unint64_t v15 = v9;
    objc_msgSend(v9, "timeIntervalSinceDate:");
    self->_double inScanDuration = v11 + self->_inScanDuration;
    lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
    if (lastPoorCoverageEntryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:]( lastPoorCoverageEntryTimestamp,  "timeIntervalSinceDate:",  self->_scanningActiveTime);
      if (v13 <= 0.0) {
        double inScanDuration = self->_inScanDuration;
      }
      else {
        [v15 timeIntervalSinceDate:self->_lastPoorCoverageEntryTimestamp];
      }
      self->_poorCoverageAndScanDuration = inScanDuration + self->_poorCoverageAndScanDuration;
    }

    -[WiFiUsageBssSession setScanningActiveTime:](self, "setScanningActiveTime:", 0LL);
LABEL_13:
    int v10 = v15;
    goto LABEL_14;
  }

  unint64_t v15 = v9;
  -[WiFiUsageBssSession setScanningActiveTime:](self, "setScanningActiveTime:", v9);
  ++self->_inScanEventCount;
  if (a4 == 17)
  {
    ++self->_indoorScanCount;
    goto LABEL_13;
  }

  int v10 = v15;
  if (a4 == 16) {
    ++self->_locationScanCount;
  }
LABEL_14:
}

- (void)cellularFallbackStateDidChange:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cellularFallbackEnabled = a3;
  if (a3)
  {
    ++self->_cellularFallbackStateChangedCount;
    id v8 = v5;
    uint64_t v6 = v5;
LABEL_5:
    -[WiFiUsageBssSession setLastCellularFallbackStateChangedTime:]( self,  "setLastCellularFallbackStateChangedTime:",  v6);
    uint64_t v5 = v8;
    goto LABEL_6;
  }

  if (self->_lastCellularFallbackStateChangedTime)
  {
    id v8 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    uint64_t v6 = 0LL;
    self->_inCellularFallbackDuration = v7 + self->_inCellularFallbackDuration;
    goto LABEL_5;
  }

- (void)cellularOutrankingStateDidChange:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cellularOutrankingEnabled = a3;
  if (a3)
  {
    ++self->_cellularOutrankingStateChangedCount;
    id v8 = v5;
    uint64_t v6 = v5;
LABEL_5:
    -[WiFiUsageBssSession setLastCellularOutrankingStateChangedTime:]( self,  "setLastCellularOutrankingStateChangedTime:",  v6);
    uint64_t v5 = v8;
    goto LABEL_6;
  }

  if (self->_lastCellularOutrankingStateChangedTime)
  {
    id v8 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    uint64_t v6 = 0LL;
    self->_inCellularOutrankingDuration = v7 + self->_inCellularOutrankingDuration;
    goto LABEL_5;
  }

- (void)faultEventDetected:(unint64_t)a3
{
  if (a3 - 1 <= 0x20) {
    ++self->_faultReasonCount[a3];
  }
}

- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5
{
  if (a3)
  {
    ++self->_triggerDisconnectAlertedCount;
    if (!a4)
    {
LABEL_3:
      if (!a5) {
        return;
      }
LABEL_7:
      ++self->_triggerDisconnectExecutedCount;
      return;
    }
  }

  else if (!a4)
  {
    goto LABEL_3;
  }

  ++self->_triggerDisconnectConfirmedCount;
  if (a5) {
    goto LABEL_7;
  }
}

- (void)receivedBssTransitionRequestWithCandidateListIncluded:(BOOL)a3 isAbridged:(BOOL)a4 disassociationImminent:(BOOL)a5 bssTerminationIncluded:(BOOL)a6 essDisassociationImminent:(BOOL)a7
{
}

- (void)sentBssTransitionResponseWithStatus:(int64_t)a3 terminationDelayRequested:(BOOL)a4
{
  uint64_t v4 = 97LL;
  if (!a3) {
    uint64_t v4 = 96LL;
  }
  ++(&self->super.isa)[v4];
}

- (void)updateWithRoamingSuppression:(unsigned __int8)a3
{
  int v3 = a3;
  [MEMORY[0x189603F50] now];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!self->_isRoamSuppressionEnabled)
    {
LABEL_6:
      id obja = v5;
      ++self->_inRoamSuppressionEnabledCount;
      objc_storeStrong((id *)&self->_lastRoamSuppressionToggled, v5);
      self->_unint64_t roamsAfterSupprLifted = 0LL;
      self->_double lastRoamSuppressionWaitForRoamStart = 0.0;
      self->_double lastRoamSuppressionWaitForRoamEnd = 0.0;
      NSLog( @"%s - RoamSuppression is started: reset _roamsAfterSupprLifted,_lastRoamSuppressionWaitForRoamStart/End. increme nting _inRoamSuppressionEnabledCount:%lu",  "-[WiFiUsageBssSession updateWithRoamingSuppression:]",  self->_inRoamSuppressionEnabledCount);
      uint64_t v5 = obja;
    }
  }

  else if (self->_isRoamSuppressionEnabled)
  {
    id obj = v5;
    [v5 timeIntervalSinceDate:self->_lastRoamSuppressionToggled];
    double v7 = v6 + self->_inRoamSuppressionEnabledDuration;
    self->_inRoamSuppressionEnabledDuration = v7;
    NSLog( @"%s - RoamSuppression is lifted: incrementing inRoamSuppressionEnabled:%fs",  "-[WiFiUsageBssSession updateWithRoamingSuppression:]",  *(void *)&v7);
    uint64_t v5 = obj;
    if (self->_isRoamSuppressionEnabled) {
      goto LABEL_6;
    }
  }

  self->_isRoamSuppressionEnabled = v3 != 0;
}

- (unint64_t)inRoamSuppressionEnabledDurationPerc
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  double inRoamSuppressionEnabledDuration = self->_inRoamSuppressionEnabledDuration;
  if (self->_lastRoamSuppressionToggled && self->_isRoamSuppressionEnabled)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    double inRoamSuppressionEnabledDuration = inRoamSuppressionEnabledDuration + v6;
  }

  [MEMORY[0x189603F50] now];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession joinedTimestamp](self, "joinedTimestamp");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 timeIntervalSinceDate:v8];
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  inRoamSuppressionEnabledDuration,  v9);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = [v10 unsignedIntegerValue];

  return v11;
}

- (void)updateWithCompatibilityMode:(unsigned __int8)a3
{
  int v3 = a3;
  int isCompatibilityModeEnabled = self->_isCompatibilityModeEnabled;
  if (!a3 && self->_isCompatibilityModeEnabled)
  {
    -[NSDate timeIntervalSinceNow](self->_lastCompatibilityModeChangedTime, "timeIntervalSinceNow");
    self->_inCompatibilityModeEnabledDuration = self->_inCompatibilityModeEnabledDuration - v6;
    int isCompatibilityModeEnabled = self->_isCompatibilityModeEnabled;
  }

  if (isCompatibilityModeEnabled != v3)
  {
    -[WiFiUsageBssSession setIsCompatibilityModeEnabled:](self, "setIsCompatibilityModeEnabled:", v3 != 0);
    ++self->_compatibilityModeChangeCount;
    [MEMORY[0x189603F50] now];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageBssSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", v7);
  }

- (NSMutableDictionary)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
}

- (int64_t)roamConfigTriggerRssi
{
  return self->_roamConfigTriggerRssi;
}

- (void)setRoamConfigTriggerRssi:(int64_t)a3
{
  self->_roamConfigTriggerRssuint64_t i = a3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamConfigChannels
{
  __int128 v3 = *(_OWORD *)&self[38].var0[2];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[38].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamConfigChannels:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamConfigChannels.valueByBand = v3;
}

- ($6E47B81FEB72AA1B248A20B58E3F028F)roamConfigCriteria
{
  __int128 v3 = *(_OWORD *)&self[39].var5;
  *(_OWORD *)&retstr->int64_t var0 = *(_OWORD *)&self[39].var0;
  *(_OWORD *)&retstr->uint64_t var5 = v3;
  return self;
}

- (void)setRoamConfigCriteria:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = v3;
}

- (WiFiUsageBssDetails)originBssDetails
{
  return self->_originBssDetails;
}

- (void)setOriginBssDetails:(id)a3
{
}

- (unint64_t)roamsAfterSupprLifted
{
  return self->_roamsAfterSupprLifted;
}

- (void)setRoamsAfterSupprLifted:(unint64_t)a3
{
  self->_unint64_t roamsAfterSupprLifted = a3;
}

- (double)lastRoamSuppressionWaitForRoamStart
{
  return self->_lastRoamSuppressionWaitForRoamStart;
}

- (void)setLastRoamSuppressionWaitForRoamStart:(double)a3
{
  self->_double lastRoamSuppressionWaitForRoamStart = a3;
}

- (double)lastRoamSuppressionWaitForRoamEnd
{
  return self->_lastRoamSuppressionWaitForRoamEnd;
}

- (void)setLastRoamSuppressionWaitForRoamEnd:(double)a3
{
  self->_double lastRoamSuppressionWaitForRoamEnd = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSDate)joinedTimestamp
{
  return self->_joinedTimestamp;
}

- (void)setJoinedTimestamp:(id)a3
{
}

- (NSDate)lastLqmUpdateTimestamp
{
  return self->_lastLqmUpdateTimestamp;
}

- (void)setLastLqmUpdateTimestamp:(id)a3
{
}

- (NSDate)lastPoorCoverageEntryTimestamp
{
  return self->_lastPoorCoverageEntryTimestamp;
}

- (void)setLastPoorCoverageEntryTimestamp:(id)a3
{
}

- (NSDate)lastCellularFallbackStateChangedTime
{
  return self->_lastCellularFallbackStateChangedTime;
}

- (void)setLastCellularFallbackStateChangedTime:(id)a3
{
}

- (NSDate)lastCellularOutrankingStateChangedTime
{
  return self->_lastCellularOutrankingStateChangedTime;
}

- (void)setLastCellularOutrankingStateChangedTime:(id)a3
{
}

- (NSDate)lastCompatibilityModeChangedTime
{
  return self->_lastCompatibilityModeChangedTime;
}

- (void)setLastCompatibilityModeChangedTime:(id)a3
{
}

- (WiFiUsageBssDetails)targetBssDetails
{
  return self->_targetBssDetails;
}

- (void)setTargetBssDetails:(id)a3
{
}

- (WiFiUsageNetworkDetails)networkDetails
{
  return self->_networkDetails;
}

- (void)setNetworkDetails:(id)a3
{
}

- (NSString)bssEnvironment
{
  return self->_bssEnvironment;
}

- (void)setBssEnvironment:(id)a3
{
}

- (BOOL)cellularFallbackEnabled
{
  return self->_cellularFallbackEnabled;
}

- (void)setCellularFallbackEnabled:(BOOL)a3
{
  self->_cellularFallbackEnabled = a3;
}

- (BOOL)cellularOutrankingEnabled
{
  return self->_cellularOutrankingEnabled;
}

- (void)setCellularOutrankingEnabled:(BOOL)a3
{
  self->_cellularOutrankingEnabled = a3;
}

- (BOOL)supportsNeighborReport
{
  return self->_supportsNeighborReport;
}

- (void)setSupportsNeighborReport:(BOOL)a3
{
  self->_supportsNeighborReport = a3;
}

- (BOOL)supportsFastTransition
{
  return self->_supportsFastTransition;
}

- (void)setSupportsFastTransition:(BOOL)a3
{
  self->_supportsFastTransition = a3;
}

- (BOOL)supportsBssTransitionManagement
{
  return self->_supportsBssTransitionManagement;
}

- (void)setSupportsBssTransitionManagement:(BOOL)a3
{
  self->_supportsBssTransitionManagement = a3;
}

- (BOOL)supportsAdaptiveFastTransition
{
  return self->_supportsAdaptiveFastTransition;
}

- (void)setSupportsAdaptiveFastTransition:(BOOL)a3
{
  self->_supportsAdaptiveFastTransition = a3;
}

- (BOOL)supportsFastlane
{
  return self->_supportsFastlane;
}

- (void)setSupportsFastlane:(BOOL)a3
{
  self->_supportsFastlane = a3;
}

- (BOOL)supportsNetworkAssurance
{
  return self->_supportsNetworkAssurance;
}

- (void)setSupportsNetworkAssurance:(BOOL)a3
{
  self->_supportsNetworkAssurance = a3;
}

- (BOOL)supportsAdaptiveRoaming
{
  return self->_supportsAdaptiveRoaming;
}

- (void)setSupportsAdaptiveRoaming:(BOOL)a3
{
  self->_supportsAdaptiveRoaming = a3;
}

- (BOOL)isCompatibilityModeEnabledAtStart
{
  return self->_isCompatibilityModeEnabledAtStart;
}

- (void)setIsCompatibilityModeEnabledAtStart:(BOOL)a3
{
  self->_isCompatibilityModeEnabledAtStart = a3;
}

- (BOOL)isCompatibilityModeEnabled
{
  return self->_isCompatibilityModeEnabled;
}

- (void)setIsCompatibilityModeEnabled:(BOOL)a3
{
  self->_int isCompatibilityModeEnabled = a3;
}

- (int64_t)newRssi
{
  return self->_newRssi;
}

- (void)setNewRssi:(int64_t)a3
{
  self->_newRssuint64_t i = a3;
}

- (int64_t)lastLinkRssi
{
  return self->_lastLinkRssi;
}

- (void)setLastLinkRssi:(int64_t)a3
{
  self->_int64_t lastLinkRssi = a3;
}

- (int64_t)lastRoamScanRssi
{
  return self->_lastRoamScanRssi;
}

- (void)setLastRoamScanRssi:(int64_t)a3
{
  self->_lastRoamScanRssuint64_t i = a3;
}

- (int)currentBand
{
  return self->_currentBand;
}

- (void)setCurrentBand:(int)a3
{
  self->_currentBand = a3;
}

- (int)newBand
{
  return self->_newBand;
}

- (void)setNewBand:(int)a3
{
  self->_newBand = a3;
}

- (unint64_t)currentChannel
{
  return self->_currentChannel;
}

- (void)setCurrentChannel:(unint64_t)a3
{
  self->_currentChannel = a3;
}

- (unint64_t)newChannel
{
  return self->_newChannel;
}

- (void)setNewChannel:(unint64_t)a3
{
  self->_newChannel = a3;
}

- (int64_t)linkRssiGt40
{
  return self->_linkRssiGt40;
}

- (void)setLinkRssiGt40:(int64_t)a3
{
  self->_int64_t linkRssiGt40 = a3;
}

- (int64_t)linkRssi40to50
{
  return self->_linkRssi40to50;
}

- (void)setLinkRssi40to50:(int64_t)a3
{
  self->_linkRssi40to50 = a3;
}

- (int64_t)linkRssi50to60
{
  return self->_linkRssi50to60;
}

- (void)setLinkRssi50to60:(int64_t)a3
{
  self->_linkRssi50to60 = a3;
}

- (int64_t)linkRssi60to65
{
  return self->_linkRssi60to65;
}

- (void)setLinkRssi60to65:(int64_t)a3
{
  self->_linkRssi60to65 = a3;
}

- (int64_t)linkRssi65to70
{
  return self->_linkRssi65to70;
}

- (void)setLinkRssi65to70:(int64_t)a3
{
  self->_linkRssi65to70 = a3;
}

- (int64_t)linkRssi70to75
{
  return self->_linkRssi70to75;
}

- (void)setLinkRssi70to75:(int64_t)a3
{
  self->_linkRssi70to75 = a3;
}

- (int64_t)linkRssi75to80
{
  return self->_linkRssi75to80;
}

- (void)setLinkRssi75to80:(int64_t)a3
{
  self->_linkRssi75to80 = a3;
}

- (int64_t)linkRssi80to85
{
  return self->_linkRssi80to85;
}

- (void)setLinkRssi80to85:(int64_t)a3
{
  self->_linkRssi80to85 = a3;
}

- (int64_t)linkRssi85to90
{
  return self->_linkRssi85to90;
}

- (void)setLinkRssi85to90:(int64_t)a3
{
  self->_linkRssi85to90 = a3;
}

- (int64_t)linkRssiLt90
{
  return self->_linkRssiLt90;
}

- (void)setLinkRssiLt90:(int64_t)a3
{
  self->_linkRssiLt90 = a3;
}

- (unint64_t)roamReasonInitialAssociationCount
{
  return self->_roamReasonInitialAssociationCount;
}

- (void)setRoamReasonInitialAssociationCount:(unint64_t)a3
{
  self->_roamReasonInitialAssociationCount = a3;
}

- (unint64_t)roamReasonLowRssiCount
{
  return self->_roamReasonLowRssiCount;
}

- (void)setRoamReasonLowRssiCount:(unint64_t)a3
{
  self->_unint64_t roamReasonLowRssiCount = a3;
}

- (unint64_t)roamReasonDeauthDisassocCount
{
  return self->_roamReasonDeauthDisassocCount;
}

- (void)setRoamReasonDeauthDisassocCount:(unint64_t)a3
{
  self->_roamReasonDeauthDisassocCount = a3;
}

- (unint64_t)roamReasonBeaconLostCount
{
  return self->_roamReasonBeaconLostCount;
}

- (void)setRoamReasonBeaconLostCount:(unint64_t)a3
{
  self->_roamReasonBeaconLostCount = a3;
}

- (unint64_t)roamReasonSteeredByApCount
{
  return self->_roamReasonSteeredByApCount;
}

- (void)setRoamReasonSteeredByApCount:(unint64_t)a3
{
  self->_roamReasonSteeredByApCount = a3;
}

- (unint64_t)roamReasonSteeredByBtmCount
{
  return self->_roamReasonSteeredByBtmCount;
}

- (void)setRoamReasonSteeredByBtmCount:(unint64_t)a3
{
  self->_roamReasonSteeredByBtmCount = a3;
}

- (unint64_t)roamReasonSteeredByCsaCount
{
  return self->_roamReasonSteeredByCsaCount;
}

- (void)setRoamReasonSteeredByCsaCount:(unint64_t)a3
{
  self->_roamReasonSteeredByCsaCount = a3;
}

- (unint64_t)roamReasonReassocRequestedCount
{
  return self->_roamReasonReassocRequestedCount;
}

- (void)setRoamReasonReassocRequestedCount:(unint64_t)a3
{
  self->_roamReasonReassocRequestedCount = a3;
}

- (unint64_t)roamReasonHostTriggeredCount
{
  return self->_roamReasonHostTriggeredCount;
}

- (void)setRoamReasonHostTriggeredCount:(unint64_t)a3
{
  self->_roamReasonHostTriggeredCount = a3;
}

- (unint64_t)roamReasonBetterCandidateCount
{
  return self->_roamReasonBetterCandidateCount;
}

- (void)setRoamReasonBetterCandidateCount:(unint64_t)a3
{
  self->_roamReasonBetterCandidateCount = a3;
}

- (unint64_t)roamReasonBetterConditionCount
{
  return self->_roamReasonBetterConditionCount;
}

- (void)setRoamReasonBetterConditionCount:(unint64_t)a3
{
  self->_roamReasonBetterConditionCount = a3;
}

- (unint64_t)roamReasonMiscCount
{
  return self->_roamReasonMiscCount;
}

- (void)setRoamReasonMiscCount:(unint64_t)a3
{
  self->_roamReasonMiscCount = a3;
}

- (unint64_t)roamStatusSucceededCount
{
  return self->_roamStatusSucceededCount;
}

- (void)setRoamStatusSucceededCount:(unint64_t)a3
{
  self->_roamStatusSucceededCount = a3;
}

- (unint64_t)roamStatusFailedCount
{
  return self->_roamStatusFailedCount;
}

- (void)setRoamStatusFailedCount:(unint64_t)a3
{
  self->_roamStatusFailedCount = a3;
}

- (unint64_t)roamStatusNoCandidateCount
{
  return self->_roamStatusNoCandidateCount;
}

- (void)setRoamStatusNoCandidateCount:(unint64_t)a3
{
  self->_roamStatusNoCandidateCount = a3;
}

- (unint64_t)roamStatusNoQualifiedCandidateCount
{
  return self->_roamStatusNoQualifiedCandidateCount;
}

- (void)setRoamStatusNoQualifiedCandidateCount:(unint64_t)a3
{
  self->_roamStatusNoQualifiedCandidateCount = a3;
}

- (unint64_t)roamIsWNMScoreUsedCount
{
  return self->_roamIsWNMScoreUsedCount;
}

- (void)setRoamIsWNMScoreUsedCount:(unint64_t)a3
{
  self->_roamIsWNMScoreUsedCount = a3;
}

- (unint64_t)roamPingPongNth
{
  return self->_roamPingPongNth;
}

- (void)setRoamPingPongNth:(unint64_t)a3
{
  self->_roamPingPongNth = a3;
}

- (BOOL)roamInMotion
{
  return self->_roamInMotion;
}

- (void)setRoamInMotion:(BOOL)a3
{
  self->_roamInMotion = a3;
}

- (BOOL)isRoamSuppressionEnabled
{
  return self->_isRoamSuppressionEnabled;
}

- (void)setIsRoamSuppressionEnabled:(BOOL)a3
{
  self->_isRoamSuppressionEnabled = a3;
}

- (NSDate)lastRoamSuppressionToggled
{
  return self->_lastRoamSuppressionToggled;
}

- (void)setLastRoamSuppressionToggled:(id)a3
{
}

- (unint64_t)inRoamSuppressionEnabledCount
{
  return self->_inRoamSuppressionEnabledCount;
}

- (void)setInRoamSuppressionEnabledCount:(unint64_t)a3
{
  self->_inRoamSuppressionEnabledCount = a3;
}

- (double)inRoamSuppressionEnabledDuration
{
  return self->_inRoamSuppressionEnabledDuration;
}

- (void)setInRoamSuppressionEnabledDuration:(double)a3
{
  self->_double inRoamSuppressionEnabledDuration = a3;
}

- (unint64_t)bssTransitionRequestCount
{
  return self->_bssTransitionRequestCount;
}

- (void)setBssTransitionRequestCount:(unint64_t)a3
{
  self->_bssTransitionRequestCount = a3;
}

- (unint64_t)bssTransitionAcceptedCount
{
  return self->_bssTransitionAcceptedCount;
}

- (void)setBssTransitionAcceptedCount:(unint64_t)a3
{
  self->_bssTransitionAcceptedCount = a3;
}

- (unint64_t)bssTransitionRejectedCount
{
  return self->_bssTransitionRejectedCount;
}

- (void)setBssTransitionRejectedCount:(unint64_t)a3
{
  self->_bssTransitionRejectedCount = a3;
}

- (unint64_t)minCandidatesCount
{
  return self->_minCandidatesCount;
}

- (void)setMinCandidatesCount:(unint64_t)a3
{
  self->_unint64_t minCandidatesCount = a3;
}

- (unint64_t)maxCandidatesCount
{
  return self->_maxCandidatesCount;
}

- (void)setMaxCandidatesCount:(unint64_t)a3
{
  self->_unint64_t maxCandidatesCount = a3;
}

- (unint64_t)currentRSSIStrongestCount
{
  return self->_currentRSSIStrongestCount;
}

- (void)setCurrentRSSIStrongestCount:(unint64_t)a3
{
  self->_unint64_t currentRSSIStrongestCount = a3;
}

- (NSMutableDictionary)roamNeighborsByBand
{
  return self->_roamNeighborsByBand;
}

- (void)setRoamNeighborsByBand:(id)a3
{
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSICountByBand
{
  __int128 v3 = *(_OWORD *)&self[40].var0[2];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[40].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSICountByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSIByBand
{
  __int128 v3 = *(_OWORD *)&self[41].var0[2];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[41].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSIByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsSmllstCurrentToBestRssiByBand
{
  __int128 v3 = *(_OWORD *)&self[42].var0[2];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[42].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToBestRssiByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsLrgstCurrentToBestRssiByBand
{
  __int128 v3 = *(_OWORD *)&self[43].var0[2];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[43].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToBestRssiByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsSmllstCurrentToNextBestRssiByBand
{
  __int128 v3 = *(_OWORD *)&self[44].var0[2];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[44].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToNextBestRssiByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsLrgstCurrentToNextBestRssiByBand
{
  __int128 v3 = *(_OWORD *)&self[45].var0[2];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[45].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToNextBestRssiByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand = v3;
}

- (unint64_t)highRssiRoamScanCount
{
  return self->_highRssiRoamScanCount;
}

- (void)setHighRssiRoamScanCount:(unint64_t)a3
{
  self->_highRssiRoamScanCount = a3;
}

- (unint64_t)lowRssiRoamScanCount
{
  return self->_lowRssiRoamScanCount;
}

- (void)setLowRssiRoamScanCount:(unint64_t)a3
{
  self->_lowRssiRoamScanCount = a3;
}

- (unint64_t)unexpectedBeaconLostRoamScanCount
{
  return self->_unexpectedBeaconLostRoamScanCount;
}

- (void)setUnexpectedBeaconLostRoamScanCount:(unint64_t)a3
{
  self->_unexpectedBeaconLostRoamScanCount = a3;
}

- (double)poorCoverageAndA2dpDuration
{
  return self->_poorCoverageAndA2dpDuration;
}

- (void)setPoorCoverageAndA2dpDuration:(double)a3
{
  self->_poorCoverageAndA2dpDuration = a3;
}

- (double)poorCoverageAndScoDuration
{
  return self->_poorCoverageAndScoDuration;
}

- (void)setPoorCoverageAndScoDuration:(double)a3
{
  self->_poorCoverageAndScoDuration = a3;
}

- (double)poorCoverageAndAwdlDuration
{
  return self->_poorCoverageAndAwdlDuration;
}

- (void)setPoorCoverageAndAwdlDuration:(double)a3
{
  self->_poorCoverageAndAwdlDuration = a3;
}

- (double)poorCoverageAndScanDuration
{
  return self->_poorCoverageAndScanDuration;
}

- (void)setPoorCoverageAndScanDuration:(double)a3
{
  self->_poorCoverageAndScanDuration = a3;
}

- (double)minRoamLatency
{
  return self->_minRoamLatency;
}

- (void)setMinRoamLatency:(double)a3
{
  self->_double minRoamLatency = a3;
}

- (double)maxRoamLatency
{
  return self->_maxRoamLatency;
}

- (void)setMaxRoamLatency:(double)a3
{
  self->_double maxRoamLatency = a3;
}

- (unint64_t)partialScanCount
{
  return self->_partialScanCount;
}

- (void)setPartialScanCount:(unint64_t)a3
{
  self->_partialScanCount = a3;
}

- (unint64_t)fullScanCount
{
  return self->_fullScanCount;
}

- (void)setFullScanCount:(unint64_t)a3
{
  self->_fullScanCount = a3;
}

- (NSDate)callStartedTime
{
  return self->_callStartedTime;
}

- (void)setCallStartedTime:(id)a3
{
}

- (NSDate)inVehicleEntryTime
{
  return self->_inVehicleEntryTime;
}

- (void)setInVehicleEntryTime:(id)a3
{
}

- (NSDate)inMotionStartedTime
{
  return self->_inMotionStartedTime;
}

- (void)setInMotionStartedTime:(id)a3
{
}

- (NSDate)a2dpActiveTime
{
  return self->_a2dpActiveTime;
}

- (void)setA2dpActiveTime:(id)a3
{
}

- (NSDate)scoActiveTime
{
  return self->_scoActiveTime;
}

- (void)setScoActiveTime:(id)a3
{
}

- (NSDate)hidPresentTime
{
  return self->_hidPresentTime;
}

- (void)setHidPresentTime:(id)a3
{
}

- (NSDate)awdlActiveTime
{
  return self->_awdlActiveTime;
}

- (void)setAwdlActiveTime:(id)a3
{
}

- (NSDate)roamingActiveTime
{
  return self->_roamingActiveTime;
}

- (void)setRoamingActiveTime:(id)a3
{
}

- (NSDate)scanningActiveTime
{
  return self->_scanningActiveTime;
}

- (void)setScanningActiveTime:(id)a3
{
}

- (double)inCallDuration
{
  return self->_inCallDuration;
}

- (void)setInCallDuration:(double)a3
{
  self->_inCallDuration = a3;
}

- (double)inVehicleDuration
{
  return self->_inVehicleDuration;
}

- (void)setInVehicleDuration:(double)a3
{
  self->_inVehicleDuration = a3;
}

- (double)inMotionDuration
{
  return self->_inMotionDuration;
}

- (void)setInMotionDuration:(double)a3
{
  self->_inMotionDuration = a3;
}

- (double)inA2dpDuration
{
  return self->_inA2dpDuration;
}

- (void)setInA2dpDuration:(double)a3
{
  self->_double inA2dpDuration = a3;
}

- (double)inScoDuration
{
  return self->_inScoDuration;
}

- (void)setInScoDuration:(double)a3
{
  self->_double inScoDuration = a3;
}

- (double)inHidPresentDuration
{
  return self->_inHidPresentDuration;
}

- (void)setInHidPresentDuration:(double)a3
{
  self->_inHidPresentDuration = a3;
}

- (double)inAwdlDuration
{
  return self->_inAwdlDuration;
}

- (void)setInAwdlDuration:(double)a3
{
  self->_double inAwdlDuration = a3;
}

- (double)inRoamDuration
{
  return self->_inRoamDuration;
}

- (void)setInRoamDuration:(double)a3
{
  self->_inRoamDuration = a3;
}

- (double)inScanDuration
{
  return self->_inScanDuration;
}

- (void)setInScanDuration:(double)a3
{
  self->_double inScanDuration = a3;
}

- (double)inCellularFallbackDuration
{
  return self->_inCellularFallbackDuration;
}

- (void)setInCellularFallbackDuration:(double)a3
{
  self->_inCellularFallbackDuration = a3;
}

- (double)inCellularOutrankingDuration
{
  return self->_inCellularOutrankingDuration;
}

- (void)setInCellularOutrankingDuration:(double)a3
{
  self->_inCellularOutrankingDuration = a3;
}

- (double)inPoorCoverageDuration
{
  return self->_inPoorCoverageDuration;
}

- (void)setInPoorCoverageDuration:(double)a3
{
  self->_inPoorCoverageDuration = a3;
}

- (double)inCompatibilityModeEnabledDuration
{
  return self->_inCompatibilityModeEnabledDuration;
}

- (void)setInCompatibilityModeEnabledDuration:(double)a3
{
  self->_inCompatibilityModeEnabledDuration = a3;
}

- (unint64_t)inCallEventCount
{
  return self->_inCallEventCount;
}

- (void)setInCallEventCount:(unint64_t)a3
{
  self->_inCallEventCount = a3;
}

- (unint64_t)inVehicleEventCount
{
  return self->_inVehicleEventCount;
}

- (void)setInVehicleEventCount:(unint64_t)a3
{
  self->_inVehicleEventCount = a3;
}

- (unint64_t)inMotionEventCount
{
  return self->_inMotionEventCount;
}

- (void)setInMotionEventCount:(unint64_t)a3
{
  self->_inMotionEventCount = a3;
}

- (unint64_t)inA2dpEventCount
{
  return self->_inA2dpEventCount;
}

- (void)setInA2dpEventCount:(unint64_t)a3
{
  self->_inA2dpEventCount = a3;
}

- (unint64_t)inScoEventCount
{
  return self->_inScoEventCount;
}

- (void)setInScoEventCount:(unint64_t)a3
{
  self->_inScoEventCount = a3;
}

- (unint64_t)inHidPresentCount
{
  return self->_inHidPresentCount;
}

- (void)setInHidPresentCount:(unint64_t)a3
{
  self->_inHidPresentCount = a3;
}

- (unint64_t)inAwdlEventCount
{
  return self->_inAwdlEventCount;
}

- (void)setInAwdlEventCount:(unint64_t)a3
{
  self->_inAwdlEventCount = a3;
}

- (unint64_t)inRoamEventCount
{
  return self->_inRoamEventCount;
}

- (void)setInRoamEventCount:(unint64_t)a3
{
  self->_inRoamEventCount = a3;
}

- (unint64_t)inScanEventCount
{
  return self->_inScanEventCount;
}

- (void)setInScanEventCount:(unint64_t)a3
{
  self->_inScanEventCount = a3;
}

- (unint64_t)cellularFallbackStateChangedCount
{
  return self->_cellularFallbackStateChangedCount;
}

- (void)setCellularFallbackStateChangedCount:(unint64_t)a3
{
  self->_cellularFallbackStateChangedCount = a3;
}

- (unint64_t)cellularOutrankingStateChangedCount
{
  return self->_cellularOutrankingStateChangedCount;
}

- (void)setCellularOutrankingStateChangedCount:(unint64_t)a3
{
  self->_cellularOutrankingStateChangedCount = a3;
}

- (unint64_t)locationScanCount
{
  return self->_locationScanCount;
}

- (void)setLocationScanCount:(unint64_t)a3
{
  self->_locationScanCount = a3;
}

- (unint64_t)indoorScanCount
{
  return self->_indoorScanCount;
}

- (void)setIndoorScanCount:(unint64_t)a3
{
  self->_indoorScanCount = a3;
}

- (unint64_t)compatibilityModeChangeCount
{
  return self->_compatibilityModeChangeCount;
}

- (void)setCompatibilityModeChangeCount:(unint64_t)a3
{
  self->_compatibilityModeChangeCount = a3;
}

- (unint64_t)triggerDisconnectAlertedCount
{
  return self->_triggerDisconnectAlertedCount;
}

- (void)setTriggerDisconnectAlertedCount:(unint64_t)a3
{
  self->_triggerDisconnectAlertedCount = a3;
}

- (unint64_t)triggerDisconnectConfirmedCount
{
  return self->_triggerDisconnectConfirmedCount;
}

- (void)setTriggerDisconnectConfirmedCount:(unint64_t)a3
{
  self->_triggerDisconnectConfirmedCount = a3;
}

- (unint64_t)triggerDisconnectExecutedCount
{
  return self->_triggerDisconnectExecutedCount;
}

- (void)setTriggerDisconnectExecutedCount:(unint64_t)a3
{
  self->_triggerDisconnectExecutedCount = a3;
}

- (void).cxx_destruct
{
}

@end