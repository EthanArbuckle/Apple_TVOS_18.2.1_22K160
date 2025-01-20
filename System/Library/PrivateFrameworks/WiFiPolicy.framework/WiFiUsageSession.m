@interface WiFiUsageSession
+ (id)disconnectReasonString:(unint64_t)a3;
+ (id)joinReasonString:(unint64_t)a3;
- ($06992ED503081CE345EDB9EEA121564E)bandUsageDuration;
- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToBestRssiByBandTransition;
- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToNextBestRssiByBandTransition;
- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToBestRssiByBandTransition;
- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToNextBestRssiByBandTransition;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSIByBand;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSICountByBand;
- (BOOL)airplaneModeEnabled;
- (BOOL)anyUsbDeviceConnected;
- (BOOL)canSubmitToCA;
- (BOOL)cellularFallbackEnabled;
- (BOOL)cellularOutrankingEnabled;
- (BOOL)controlCenterEnabled;
- (BOOL)hasDifferentIpv4DetailsThanPrevSession;
- (BOOL)hasDifferentIpv6DetailsThanPrevSession;
- (BOOL)inCoexRealTime;
- (BOOL)inCoexRealTimeAtLastJoin;
- (BOOL)inCoexRealTimeAtSessionStart;
- (BOOL)incrementCountWithPrefix:(id)a3 name:(id)a4;
- (BOOL)infraIsPartOfSplitSSID;
- (BOOL)isA2DPActive;
- (BOOL)isAssociated;
- (BOOL)isAssociatedAtSessionStart;
- (BOOL)isAutoHotspot;
- (BOOL)isBiAoSActive;
- (BOOL)isCompatibilityModeEnabled;
- (BOOL)isCompatibilityModeEnabledAtStart;
- (BOOL)isDisplayOn;
- (BOOL)isDriverAvailable;
- (BOOL)isInHomeScreen;
- (BOOL)isInTDEval;
- (BOOL)isInstantHotspot;
- (BOOL)isRoamSuppressionEnabled;
- (BOOL)isSCOActive;
- (BOOL)isSessionActive;
- (BOOL)isUniAoSActive;
- (BOOL)isUnlocked;
- (BOOL)lastInterfacePrimaryState;
- (BOOL)lastJoinWhileDeferForTD;
- (BOOL)lastRoamScanContainsRoamCandidateCount;
- (BOOL)lastRoamScanFoundSSIDTransitionPotentialCandidate;
- (BOOL)lastRoamScanFoundSSIDTransitionTarget;
- (BOOL)linkRecoveryDisabled;
- (BOOL)poweredOn;
- (BOOL)privacyRestrictionDisabled;
- (BOOL)savedInCoexRealTimeAtLastJoin;
- (BOOL)useSavedJoinStats;
- (BOOL)xctest;
- (NSDate)a2dpActiveTime;
- (NSDate)awdlActiveTime;
- (NSDate)batterySaverStateEntryTime;
- (NSDate)callStartedTime;
- (NSDate)chargingStartedTime;
- (NSDate)companionConnectionTime;
- (NSDate)hidPresentTime;
- (NSDate)inMotionStartedTime;
- (NSDate)inVehicleEntryTime;
- (NSDate)inWalkingEntryTime;
- (NSDate)lastAWDLSequenceUpdate;
- (NSDate)lastBssChangedTime;
- (NSDate)lastCellularFallbackStateChangedTime;
- (NSDate)lastCellularOutrankingStateChangedTime;
- (NSDate)lastChipResetTime;
- (NSDate)lastCoexRealTimeOff;
- (NSDate)lastCoexRealTimeOn;
- (NSDate)lastCompatibilityModeChangedTime;
- (NSDate)lastControlCenterStateChangedTime;
- (NSDate)lastDriverAvailableTime;
- (NSDate)lastDriverTerminationTime;
- (NSDate)lastJoinTime;
- (NSDate)lastLinkStateChangedTime;
- (NSDate)lastNetwork6eDisableModeChangedTime;
- (NSDate)lastPowerBudgetChangedTime;
- (NSDate)lastPowerStateChangedTime;
- (NSDate)lastRoamSuppressionToggled;
- (NSDate)lastSystemSleepTime;
- (NSDate)lastSystemWakeTime;
- (NSDate)lastUnexpectedLinkDownTime;
- (NSDate)lastUsbStatusChange;
- (NSDate)linkRecoveryDisabledTime;
- (NSDate)lowPowerStateEntryTime;
- (NSDate)lpasStateEntryTime;
- (NSDate)mediaStartedTime;
- (NSDate)processInitTime;
- (NSDate)roamingActiveTime;
- (NSDate)savedLastJoinTime;
- (NSDate)scanningActiveTime;
- (NSDate)scoActiveTime;
- (NSDate)sessionEndTime;
- (NSDate)sessionInitTime;
- (NSDate)sessionStartTime;
- (NSDate)softApActiveTime;
- (NSDate)wowStateEntryTime;
- (NSMutableArray)prevNetworkNames;
- (NSMutableDictionary)roamCandidatesPerBandWhenSuccessful;
- (NSMutableDictionary)roamCandidatesPerBandWhenUnSuccessful;
- (NSMutableDictionary)roamNeighborsByBand;
- (NSMutableSet)activeApplications;
- (NSNumber)responsivenessScore;
- (NSString)btAudioBand;
- (NSString)cellularDataStatus;
- (NSString)interfaceName;
- (NSString)lastDriverUnavailableReason;
- (NSString)lastSSIDdisable6eModeAtStart;
- (NSString)lastSmartCoverState;
- (NSString)networkDisable6eModeAtStart;
- (NSString)secondaryInterfaceName;
- (OS_dispatch_queue)completionQueue;
- (WiFiUsageBssSession)currentBssSession;
- (WiFiUsageInterfaceCapabilities)capabilities;
- (WiFiUsageInterfaceStats)ifStatsAtStart;
- (WiFiUsageInterfaceStats)secondaryIfStatsAtStart;
- (WiFiUsageNetworkDetails)networkDetails;
- (WiFiUsageNetworkDetails)networkDetailsAtEnd;
- (WiFiUsageNetworkIPv4Details)ipV4Details;
- (WiFiUsageNetworkIPv4Details)ipV4DetailsPrevSession;
- (WiFiUsageNetworkIPv6Details)ipV6Details;
- (WiFiUsageNetworkIPv6Details)ipV6DetailsPrevSession;
- (WiFiUsageSession)initWithSessionType:(unint64_t)a3 andInterfaceName:(id)a4 andCapabilities:(id)a5;
- (WiFiUsageSessionCAConfig)ca_config;
- (WiFiUsageSessionLQM)lqm;
- (double)associatedDuration;
- (double)associatedSleepDuration;
- (double)chargingDuration;
- (double)companionConnectedDuration;
- (double)driverAvailabilityLatencyFromChipReset;
- (double)driverAvailabilityLatencyFromTermination;
- (double)driverAvailabilityLifespan;
- (double)driverProcessLifespan;
- (double)inA2dpDuration;
- (double)inAWDL_BestInfraScoreDuration;
- (double)inAWDL_BestP2PScore;
- (double)inAWDL_BestP2PScoreDuration;
- (double)inAWDL_WorstInfraScoreDuration;
- (double)inAWDL_WorstP2PScore;
- (double)inAWDL_WorstP2PScoreDuration;
- (double)inAWDL_lastP2PScore;
- (double)inAwdlDuration;
- (double)inBatterySaverStateDuration;
- (double)inCallDuration;
- (double)inCellularFallbackDuration;
- (double)inCellularOutrankingDuration;
- (double)inCompatibilityModeEnabledDuration;
- (double)inControlCenterAutoJoinDisabledDuration;
- (double)inHidPresentDuration;
- (double)inLowPowerStateDuration;
- (double)inLpasStateDuration;
- (double)inMotionDuration;
- (double)inNetwork6eModeOffDuration;
- (double)inPoorLinkSessionDuration;
- (double)inRoamDuration;
- (double)inRoamSuppressionEnabled;
- (double)inRoamSuppressionWaitForRoamEnd;
- (double)inRoamSuppressionWaitForRoamStart;
- (double)inScanDuration;
- (double)inScoDuration;
- (double)inSoftApDuration;
- (double)inVehicleDuration;
- (double)inWalkingDuration;
- (double)inWowStateDuration;
- (double)joinInterfaceRankingLatencyFromDriverAvailability;
- (double)joinIpConfigurationLatencyFromDriverAvailability;
- (double)joinLinkUpLatencyFromDriverAvailability;
- (double)joinLinkUpLatencyFromSessionStart;
- (double)joinScanLatencyFromDriverAvailability;
- (double)joinStartedLatencyFromDriverAvailability;
- (double)lastSSIDIn6eModeOffDuration;
- (double)linkRecoveryDisabledDuration;
- (double)longestUnassociatedDuration;
- (double)mediaPlaybackDuration;
- (double)powerBudget10Duration;
- (double)powerBudget20Duration;
- (double)powerBudget30Duration;
- (double)powerBudget40Duration;
- (double)powerBudget50Duration;
- (double)powerBudget60Duration;
- (double)powerBudget70Duration;
- (double)powerBudget80Duration;
- (double)powerBudget90Duration;
- (double)powerBudgetMaxDuration;
- (double)powerBudgetMinDuration;
- (double)poweredOnDuration;
- (double)savedTimeSincePrevJoin;
- (double)sessionDuration;
- (double)sessionTimeSinceLastSession;
- (double)sleepPowerStatsAssociatedDuration;
- (double)sleepPowerStatsRoamingDuration;
- (double)sleepPowerStatsTotalDuration;
- (double)sleepPowerStatsUnassociatedDuration;
- (double)systemAwakeDuration;
- (double)tdEvalCumulativeDuration;
- (double)thermalIndex10Duration;
- (double)thermalIndex20Duration;
- (double)thermalIndex30Duration;
- (double)thermalIndex40Duration;
- (double)thermalIndex50Duration;
- (double)thermalIndex60Duration;
- (double)thermalIndex70Duration;
- (double)thermalIndex80Duration;
- (double)thermalIndex90Duration;
- (double)thermalIndexMaxDuration;
- (double)thermalIndexMinDuration;
- (double)timeSincePrevJoin;
- (double)usbInsertedDuration;
- (id)completionContext;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countWithPrefix:(id)a3 name:(id)a4;
- (id)describeCAConfig;
- (id)description;
- (id)eventDictionary:(BOOL)a3;
- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4;
- (id)lastBssSessionInfo;
- (id)metricName;
- (id)redactedDescription;
- (id)sessionName;
- (id)sessionSummary:(BOOL)a3;
- (int)bandAtSessionStart;
- (int)currentBand;
- (int)maxPhyMode;
- (int64_t)averageCca;
- (int64_t)averageRssi;
- (int64_t)averageSnr;
- (int64_t)lastDisconnectReason;
- (int64_t)lastDisconnectSubreason;
- (int64_t)lastJoinFailure;
- (int64_t)lastPowerBudget;
- (int64_t)lastRssi;
- (int64_t)lastThermalIndex;
- (int64_t)previousDisconnectReason;
- (int64_t)rssiAtSessionStart;
- (int64_t)savedLastJoinFailure;
- (int64_t)savedPreviousDisconnectReason;
- (unint64_t)airplaneModeStateChangedCount;
- (unint64_t)applicationStateChangedCount;
- (unint64_t)batterySaverStateChangedCount;
- (unint64_t)bssDropLowMemoryCount;
- (unint64_t)cellularFallbackStateChangedCount;
- (unint64_t)cellularOutrankingStateChangedCount;
- (unint64_t)chargingEventCount;
- (unint64_t)companionConnectionStateChangedCount;
- (unint64_t)compatibilityModeChangeCount;
- (unint64_t)consecutiveJoinFailureCount;
- (unint64_t)controlCenterStateChangedCount;
- (unint64_t)controlCenterToggleEventCount;
- (unint64_t)countRoamScan;
- (unint64_t)countRoamScanThatFoundSSIDTransitionPotentialCandidate;
- (unint64_t)countRoamScanThatFoundSSIDTransitionTarget;
- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScan;
- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet;
- (unint64_t)countSSIDTransitionTargetInLastRoamScan;
- (unint64_t)currentBssMsgInSleepCount;
- (unint64_t)currentBssMsgInWakeCount;
- (unint64_t)currentRSSIStrongestCount;
- (unint64_t)current_subsequentTdAfterJoinAfterTDCount;
- (unint64_t)displayStateChangedCount;
- (unint64_t)driverUnavailabilityCount;
- (unint64_t)epnoScanTriggersCount;
- (unint64_t)faultReasonCount:(unint64_t)a3;
- (unint64_t)forwardedBssInSleepCount;
- (unint64_t)forwardedBssInwakeCount;
- (unint64_t)hostScanTriggersCount;
- (unint64_t)inA2dpEventCount;
- (unint64_t)inAWDL_BestInfraScore;
- (unint64_t)inAWDL_WorstInfraScore;
- (unint64_t)inAWDL_lastInfraScore;
- (unint64_t)inAwdlEventCount;
- (unint64_t)inCallEventCount;
- (unint64_t)inHidPresentCount;
- (unint64_t)inMotionEventCount;
- (unint64_t)inPoorLinkSessionCount;
- (unint64_t)inRoamEventCount;
- (unint64_t)inRoamSuppressionEnabledCount;
- (unint64_t)inScanEventCount;
- (unint64_t)inScoEventCount;
- (unint64_t)inSoftApEventCount;
- (unint64_t)inVehicleEventCount;
- (unint64_t)inWalkingEventCount;
- (unint64_t)joinStateChangedCount;
- (unint64_t)lastJoinReason;
- (unint64_t)lastRoamScanUniqueBandsCount;
- (unint64_t)lastRoamScanUniqueChannelsCount;
- (unint64_t)lastSSIDdisabled6eModeChangeCount;
- (unint64_t)linkRecoveryDisabledCount;
- (unint64_t)linkStateChangedCount;
- (unint64_t)lockStateChangedCount;
- (unint64_t)lowPowerStateChangedCount;
- (unint64_t)lpasStateChangedCount;
- (unint64_t)maxCandidatesCount;
- (unint64_t)max_subsequentTdAfterJoinAfterTDCount;
- (unint64_t)mediaPlaybackEventCount;
- (unint64_t)minCandidatesCount;
- (unint64_t)min_subsequentTdAfterJoinAfterTDCount;
- (unint64_t)neighborBssCount;
- (unint64_t)netInterfaceRxBytes;
- (unint64_t)netInterfaceTxBytes;
- (unint64_t)network6eDisabledModeChangeCount;
- (unint64_t)networkChangedCount;
- (unint64_t)otherBssCount;
- (unint64_t)pnoScanTriggersCount;
- (unint64_t)powerStateChangedCount;
- (unint64_t)powerToggleEventCount;
- (unint64_t)prevJoinReason;
- (unint64_t)primaryInterfaceStateChangeCount;
- (unint64_t)rangingEventCount;
- (unint64_t)rapidLinkTransitionCount;
- (unint64_t)roamIsWNMScoreUsedCount;
- (unint64_t)roamPingPongAboveThresholdCount;
- (unint64_t)roamPingPongAboveThresholdCountLowRssiOnly;
- (unint64_t)roamPingPongLowRssiAndReassocOnly;
- (unint64_t)roamPingPongReassocOnly;
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
- (unint64_t)roamScanTriggersCount;
- (unint64_t)roamStatusFailedCount;
- (unint64_t)roamStatusFailedNoScan;
- (unint64_t)roamStatusNoCandidateCount;
- (unint64_t)roamStatusNoQualifiedCandidateCount;
- (unint64_t)roamStatusSucceededCount;
- (unint64_t)roamsAfterSupprLifted;
- (unint64_t)savedJoinStateChangedCount;
- (unint64_t)savedLastJoinReason;
- (unint64_t)savedPrevJoinReason;
- (unint64_t)scanDataMsgInSleepCount;
- (unint64_t)scanDataMsgInWakeCount;
- (unint64_t)secondaryInterfaceRxBytes;
- (unint64_t)secondaryInterfaceTxBytes;
- (unint64_t)sessionPid;
- (unint64_t)smartCoverStateChangedCount;
- (unint64_t)spmiMsgDropMaxFilterCount;
- (unint64_t)spmiMsgDropRssiFilterCount;
- (unint64_t)spmiMsgDropSpmiFailCount;
- (unint64_t)spmiMsgInAwakeCount;
- (unint64_t)spmiMsgInSleepCount;
- (unint64_t)systemWakeStateChangedCount;
- (unint64_t)systemWokenByWiFiCount;
- (unint64_t)tdAfterJoinAfterTDCount;
- (unint64_t)tdEvalEndedCount;
- (unint64_t)tdEvalStartedByActiveProbingCount;
- (unint64_t)tdEvalStartedByBadRSSICount;
- (unint64_t)tdEvalStartedByCheckReassocCount;
- (unint64_t)tdEvalStartedByFGNetwAppChangeCount;
- (unint64_t)tdEvalStartedBySymptomsARPFailureCount;
- (unint64_t)tdEvalStartedBySymptomsDNSFailCount;
- (unint64_t)tdEvalStartedBySymptomsDNSStallCount;
- (unint64_t)tdEvalStartedBySymptomsDataStallCount;
- (unint64_t)tdEvalStartedBySymptomsRTTFailCount;
- (unint64_t)tdEvalStartedBySymptomsShortFlowCount;
- (unint64_t)tdEvalStartedByUserNotificationCount;
- (unint64_t)tdEvalStartedCount;
- (unint64_t)tdSessionStartedByBadRSSICount;
- (unint64_t)tdSessionStartedBySymptomDNSFailureCount;
- (unint64_t)tdSessionStartedByTDRecommendedCount;
- (unint64_t)totalRxFrames;
- (unint64_t)totalTxFrames;
- (unint64_t)triggerDisconnectAlertedCount;
- (unint64_t)triggerDisconnectConfirmedCount;
- (unint64_t)triggerDisconnectExecutedCount;
- (unint64_t)type;
- (unint64_t)usbDeviceEventCount;
- (unint64_t)wowStateChangedCount;
- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4;
- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4;
- (void)bluetoothStateDidChange:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6 inUniAoS:(BOOL)a7 inBiAoS:(BOOL)a8 btAudioBand:(BOOL)a9;
- (void)callStateDidChange:(BOOL)a3;
- (void)cellularDataStatusDidChange:(id)a3 inAirplaneMode:(BOOL)a4;
- (void)cellularFallbackStateDidChange:(BOOL)a3;
- (void)cellularOutrankingStateDidChange:(BOOL)a3;
- (void)chargingStateDidChange:(BOOL)a3;
- (void)companionStateDidChange:(BOOL)a3;
- (void)controlCenterStateDidChange:(BOOL)a3 withKnownLocation:(BOOL)a4;
- (void)displayStateDidChange:(BOOL)a3;
- (void)enableXCTestNotifications;
- (void)faultEventDetected:(unint64_t)a3;
- (void)interfaceRankingDidChange:(BOOL)a3;
- (void)ipConfigurationDidChangeWithMethod:(BOOL)a3 dhcpLeaseDuration:(double)a4 hasRoutableIpV4:(BOOL)a5 hasRoutableIpV6:(BOOL)a6;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkQualityDidChange:(id)a3;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)lockStateDidChange:(BOOL)a3;
- (void)mediaStateDidChange:(BOOL)a3;
- (void)motionStateDidChange:(id)a3;
- (void)poorLinkSessionStats:(id)a3;
- (void)powerBudgetDidChange:(int64_t)a3 andThermalIndex:(int64_t)a4;
- (void)powerStateDidChange:(BOOL)a3;
- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11;
- (void)processIPv4Changes:(id)a3;
- (void)processIPv6Changes:(id)a3;
- (void)rangingCompleted;
- (void)receivedBssTransitionRequestWithCandidateListIncluded:(BOOL)a3 isAbridged:(BOOL)a4 disassociationImminent:(BOOL)a5 bssTerminationIncluded:(BOOL)a6 essDisassociationImminent:(BOOL)a7;
- (void)recordCAsubmission;
- (void)roamCacheDidUpdate:(id)a3;
- (void)roamCandidatesStatsDidUpdate:(id *)a3;
- (void)roamingARConfigurationDidChange:(id *)a3;
- (void)roamingConfigurationDidChange:(int64_t)a3 withChannelList:(id)a4;
- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongStats:(id)a8;
- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6;
- (void)sentBssTransitionResponseWithStatus:(int64_t)a3 terminationDelayRequested:(BOOL)a4;
- (void)sessionDidEnd;
- (void)sessionDidStart;
- (void)setA2dpActiveTime:(id)a3;
- (void)setActiveApplications:(id)a3;
- (void)setAirplaneModeEnabled:(BOOL)a3;
- (void)setAirplaneModeStateChangedCount:(unint64_t)a3;
- (void)setAnyUsbDeviceConnected:(BOOL)a3;
- (void)setApplicationStateChangedCount:(unint64_t)a3;
- (void)setAssociatedDuration:(double)a3;
- (void)setAssociatedSleepDuration:(double)a3;
- (void)setAwdlActiveTime:(id)a3;
- (void)setAwdlSequence:(id)a3 infraScore:(unint64_t)a4 p2pScore:(double)a5;
- (void)setBandAtSessionStart:(int)a3;
- (void)setBandUsageDuration:(id *)a3;
- (void)setBatterySaverStateChangedCount:(unint64_t)a3;
- (void)setBatterySaverStateEntryTime:(id)a3;
- (void)setBssDropLowMemoryCount:(unint64_t)a3;
- (void)setBtAudioBand:(id)a3;
- (void)setCa_config:(id)a3;
- (void)setCallStartedTime:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCellularDataStatus:(id)a3;
- (void)setCellularFallbackEnabled:(BOOL)a3;
- (void)setCellularFallbackStateChangedCount:(unint64_t)a3;
- (void)setCellularOutrankingEnabled:(BOOL)a3;
- (void)setCellularOutrankingStateChangedCount:(unint64_t)a3;
- (void)setChargingDuration:(double)a3;
- (void)setChargingEventCount:(unint64_t)a3;
- (void)setChargingStartedTime:(id)a3;
- (void)setCompanionConnectedDuration:(double)a3;
- (void)setCompanionConnectionStateChangedCount:(unint64_t)a3;
- (void)setCompanionConnectionTime:(id)a3;
- (void)setCompatibilityModeChangeCount:(unint64_t)a3;
- (void)setCompletionContext:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandler:(id)a3 withContext:(id)a4 onQueue:(id)a5;
- (void)setCompletionQueue:(id)a3;
- (void)setConsecutiveJoinFailureCount:(unint64_t)a3;
- (void)setControlCenterEnabled:(BOOL)a3;
- (void)setControlCenterStateChangedCount:(unint64_t)a3;
- (void)setControlCenterToggleEventCount:(unint64_t)a3;
- (void)setCountRoamScan:(unint64_t)a3;
- (void)setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:(unint64_t)a3;
- (void)setCountRoamScanThatFoundSSIDTransitionTarget:(unint64_t)a3;
- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScan:(unint64_t)a3;
- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:(unint64_t)a3;
- (void)setCountSSIDTransitionTargetInLastRoamScan:(unint64_t)a3;
- (void)setCurrentBand:(int)a3;
- (void)setCurrentBssMsgInSleepCount:(unint64_t)a3;
- (void)setCurrentBssMsgInWakeCount:(unint64_t)a3;
- (void)setCurrentBssSession:(id)a3;
- (void)setCurrentRSSIStrongestCount:(unint64_t)a3;
- (void)setCurrent_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3;
- (void)setDisplayStateChangedCount:(unint64_t)a3;
- (void)setDriverAvailabilityLatencyFromChipReset:(double)a3;
- (void)setDriverAvailabilityLatencyFromTermination:(double)a3;
- (void)setDriverAvailabilityLifespan:(double)a3;
- (void)setDriverProcessLifespan:(double)a3;
- (void)setDriverUnavailabilityCount:(unint64_t)a3;
- (void)setEpnoScanTriggersCount:(unint64_t)a3;
- (void)setForwardedBssInSleepCount:(unint64_t)a3;
- (void)setForwardedBssInwakeCount:(unint64_t)a3;
- (void)setHasDifferentIpv4DetailsThanPrevSession:(BOOL)a3;
- (void)setHasDifferentIpv6DetailsThanPrevSession:(BOOL)a3;
- (void)setHidPresentTime:(id)a3;
- (void)setHostScanTriggersCount:(unint64_t)a3;
- (void)setIfStatsAtStart:(id)a3;
- (void)setInA2dpDuration:(double)a3;
- (void)setInA2dpEventCount:(unint64_t)a3;
- (void)setInAWDL_BestInfraScore:(unint64_t)a3;
- (void)setInAWDL_BestInfraScoreDuration:(double)a3;
- (void)setInAWDL_BestP2PScore:(double)a3;
- (void)setInAWDL_BestP2PScoreDuration:(double)a3;
- (void)setInAWDL_WorstInfraScore:(unint64_t)a3;
- (void)setInAWDL_WorstInfraScoreDuration:(double)a3;
- (void)setInAWDL_WorstP2PScore:(double)a3;
- (void)setInAWDL_WorstP2PScoreDuration:(double)a3;
- (void)setInAWDL_lastInfraScore:(unint64_t)a3;
- (void)setInAWDL_lastP2PScore:(double)a3;
- (void)setInAwdlDuration:(double)a3;
- (void)setInAwdlEventCount:(unint64_t)a3;
- (void)setInBatterySaverStateDuration:(double)a3;
- (void)setInCallDuration:(double)a3;
- (void)setInCallEventCount:(unint64_t)a3;
- (void)setInCellularFallbackDuration:(double)a3;
- (void)setInCellularOutrankingDuration:(double)a3;
- (void)setInCoexRealTime:(BOOL)a3;
- (void)setInCoexRealTimeAtLastJoin:(BOOL)a3;
- (void)setInCoexRealTimeAtSessionStart:(BOOL)a3;
- (void)setInCompatibilityModeEnabledDuration:(double)a3;
- (void)setInControlCenterAutoJoinDisabledDuration:(double)a3;
- (void)setInHidPresentCount:(unint64_t)a3;
- (void)setInHidPresentDuration:(double)a3;
- (void)setInLowPowerStateDuration:(double)a3;
- (void)setInLpasStateDuration:(double)a3;
- (void)setInMotionDuration:(double)a3;
- (void)setInMotionEventCount:(unint64_t)a3;
- (void)setInMotionStartedTime:(id)a3;
- (void)setInNetwork6eModeOffDuration:(double)a3;
- (void)setInPoorLinkSessionCount:(unint64_t)a3;
- (void)setInPoorLinkSessionDuration:(double)a3;
- (void)setInRoamDuration:(double)a3;
- (void)setInRoamEventCount:(unint64_t)a3;
- (void)setInRoamSuppressionEnabled:(double)a3;
- (void)setInRoamSuppressionEnabledCount:(unint64_t)a3;
- (void)setInRoamSuppressionWaitForRoamEnd:(double)a3;
- (void)setInRoamSuppressionWaitForRoamStart:(double)a3;
- (void)setInScanDuration:(double)a3;
- (void)setInScanEventCount:(unint64_t)a3;
- (void)setInScoDuration:(double)a3;
- (void)setInScoEventCount:(unint64_t)a3;
- (void)setInSoftApDuration:(double)a3;
- (void)setInSoftApEventCount:(unint64_t)a3;
- (void)setInVehicleDuration:(double)a3;
- (void)setInVehicleEntryTime:(id)a3;
- (void)setInVehicleEventCount:(unint64_t)a3;
- (void)setInWalkingDuration:(double)a3;
- (void)setInWalkingEntryTime:(id)a3;
- (void)setInWalkingEventCount:(unint64_t)a3;
- (void)setInWowStateDuration:(double)a3;
- (void)setInterfaceName:(id)a3;
- (void)setIpV4Details:(id)a3;
- (void)setIpV4DetailsPrevSession:(id)a3;
- (void)setIpV6Details:(id)a3;
- (void)setIpV6DetailsPrevSession:(id)a3;
- (void)setIsA2DPActive:(BOOL)a3;
- (void)setIsAssociatedAtSessionStart:(BOOL)a3;
- (void)setIsAutoHotspot:(BOOL)a3;
- (void)setIsBiAoSActive:(BOOL)a3;
- (void)setIsCompatibilityModeEnabled:(BOOL)a3;
- (void)setIsCompatibilityModeEnabledAtStart:(BOOL)a3;
- (void)setIsDisplayOn:(BOOL)a3;
- (void)setIsDriverAvailable:(BOOL)a3;
- (void)setIsInHomeScreen:(BOOL)a3;
- (void)setIsInTDEval:(BOOL)a3;
- (void)setIsInstantHotspot:(BOOL)a3;
- (void)setIsRoamSuppressionEnabled:(BOOL)a3;
- (void)setIsSCOActive:(BOOL)a3;
- (void)setIsSessionActive:(BOOL)a3;
- (void)setIsUniAoSActive:(BOOL)a3;
- (void)setIsUnlocked:(BOOL)a3;
- (void)setJoinInterfaceRankingLatencyFromDriverAvailability:(double)a3;
- (void)setJoinIpConfigurationLatencyFromDriverAvailability:(double)a3;
- (void)setJoinLinkUpLatencyFromDriverAvailability:(double)a3;
- (void)setJoinLinkUpLatencyFromSessionStart:(double)a3;
- (void)setJoinScanLatencyFromDriverAvailability:(double)a3;
- (void)setJoinStartedLatencyFromDriverAvailability:(double)a3;
- (void)setJoinStateChangedCount:(unint64_t)a3;
- (void)setLastAWDLSequenceUpdate:(id)a3;
- (void)setLastBssChangedTime:(id)a3;
- (void)setLastCellularFallbackStateChangedTime:(id)a3;
- (void)setLastCellularOutrankingStateChangedTime:(id)a3;
- (void)setLastChipResetTime:(id)a3;
- (void)setLastCoexRealTimeOff:(id)a3;
- (void)setLastCoexRealTimeOn:(id)a3;
- (void)setLastCompatibilityModeChangedTime:(id)a3;
- (void)setLastControlCenterStateChangedTime:(id)a3;
- (void)setLastDisconnectReason:(int64_t)a3;
- (void)setLastDisconnectSubreason:(int64_t)a3;
- (void)setLastDriverAvailableTime:(id)a3;
- (void)setLastDriverTerminationTime:(id)a3;
- (void)setLastDriverUnavailableReason:(id)a3;
- (void)setLastInterfacePrimaryState:(BOOL)a3;
- (void)setLastJoinFailure:(int64_t)a3;
- (void)setLastJoinReason:(unint64_t)a3;
- (void)setLastJoinTime:(id)a3;
- (void)setLastJoinWhileDeferForTD:(BOOL)a3;
- (void)setLastLinkStateChangedTime:(id)a3;
- (void)setLastNetwork6eDisableModeChangedTime:(id)a3;
- (void)setLastPowerBudget:(int64_t)a3;
- (void)setLastPowerBudgetChangedTime:(id)a3;
- (void)setLastPowerStateChangedTime:(id)a3;
- (void)setLastRoamScanContainsRoamCandidateCount:(BOOL)a3;
- (void)setLastRoamScanFoundSSIDTransitionPotentialCandidate:(BOOL)a3;
- (void)setLastRoamScanFoundSSIDTransitionTarget:(BOOL)a3;
- (void)setLastRoamScanUniqueBandsCount:(unint64_t)a3;
- (void)setLastRoamScanUniqueChannelsCount:(unint64_t)a3;
- (void)setLastRoamSuppressionToggled:(id)a3;
- (void)setLastSSIDIn6eModeOffDuration:(double)a3;
- (void)setLastSSIDdisable6eModeAtStart:(id)a3;
- (void)setLastSSIDdisabled6eModeChangeCount:(unint64_t)a3;
- (void)setLastSmartCoverState:(id)a3;
- (void)setLastSystemSleepTime:(id)a3;
- (void)setLastSystemWakeTime:(id)a3;
- (void)setLastThermalIndex:(int64_t)a3;
- (void)setLastUnexpectedLinkDownTime:(id)a3;
- (void)setLastUsbStatusChange:(id)a3;
- (void)setLinkRecoveryDisabled:(BOOL)a3;
- (void)setLinkRecoveryDisabledCount:(unint64_t)a3;
- (void)setLinkRecoveryDisabledDuration:(double)a3;
- (void)setLinkRecoveryDisabledTime:(id)a3;
- (void)setLinkStateChangedCount:(unint64_t)a3;
- (void)setLockStateChangedCount:(unint64_t)a3;
- (void)setLongestUnassociatedDuration:(double)a3;
- (void)setLowPowerStateChangedCount:(unint64_t)a3;
- (void)setLowPowerStateEntryTime:(id)a3;
- (void)setLpasStateChangedCount:(unint64_t)a3;
- (void)setLpasStateEntryTime:(id)a3;
- (void)setLqm:(id)a3;
- (void)setMaxCandidatesCount:(unint64_t)a3;
- (void)setMaxPhyMode:(int)a3;
- (void)setMax_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3;
- (void)setMediaPlaybackDuration:(double)a3;
- (void)setMediaPlaybackEventCount:(unint64_t)a3;
- (void)setMediaStartedTime:(id)a3;
- (void)setMinCandidatesCount:(unint64_t)a3;
- (void)setMin_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3;
- (void)setNeighborBssCount:(unint64_t)a3;
- (void)setNetInterfaceRxBytes:(unint64_t)a3;
- (void)setNetInterfaceTxBytes:(unint64_t)a3;
- (void)setNetwork6eDisabledModeChangeCount:(unint64_t)a3;
- (void)setNetworkChangedCount:(unint64_t)a3;
- (void)setNetworkDetails:(id)a3;
- (void)setNetworkDetailsAtEnd:(id)a3;
- (void)setNetworkDisable6eModeAtStart:(id)a3;
- (void)setOtherBssCount:(unint64_t)a3;
- (void)setPnoScanTriggersCount:(unint64_t)a3;
- (void)setPowerBudget10Duration:(double)a3;
- (void)setPowerBudget20Duration:(double)a3;
- (void)setPowerBudget30Duration:(double)a3;
- (void)setPowerBudget40Duration:(double)a3;
- (void)setPowerBudget50Duration:(double)a3;
- (void)setPowerBudget60Duration:(double)a3;
- (void)setPowerBudget70Duration:(double)a3;
- (void)setPowerBudget80Duration:(double)a3;
- (void)setPowerBudget90Duration:(double)a3;
- (void)setPowerBudgetMaxDuration:(double)a3;
- (void)setPowerBudgetMinDuration:(double)a3;
- (void)setPowerStateChangedCount:(unint64_t)a3;
- (void)setPowerToggleEventCount:(unint64_t)a3;
- (void)setPoweredOn:(BOOL)a3;
- (void)setPoweredOnDuration:(double)a3;
- (void)setPrevJoinReason:(unint64_t)a3;
- (void)setPrevNetworkNames:(id)a3;
- (void)setPreviousDisconnectReason:(int64_t)a3;
- (void)setPrimaryInterfaceStateChangeCount:(unint64_t)a3;
- (void)setPrivacyRestrictionDisabled:(BOOL)a3;
- (void)setProcessInitTime:(id)a3;
- (void)setRangingEventCount:(unint64_t)a3;
- (void)setRapidLinkTransitionCount:(unint64_t)a3;
- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5;
- (void)setResponsivenessScore:(id)a3;
- (void)setRoamCandidatesPerBandWhenSuccessful:(id)a3;
- (void)setRoamCandidatesPerBandWhenUnSuccessful:(id)a3;
- (void)setRoamIsWNMScoreUsedCount:(unint64_t)a3;
- (void)setRoamNeighborsByBand:(id)a3;
- (void)setRoamNeighsLrgstCurrentToBestRssiByBandTransition:(id *)a3;
- (void)setRoamNeighsLrgstCurrentToNextBestRssiByBandTransition:(id *)a3;
- (void)setRoamNeighsSmllstCurrentToBestRssiByBandTransition:(id *)a3;
- (void)setRoamNeighsSmllstCurrentToNextBestRssiByBandTransition:(id *)a3;
- (void)setRoamPingPongAboveThresholdCount:(unint64_t)a3;
- (void)setRoamPingPongAboveThresholdCountLowRssiOnly:(unint64_t)a3;
- (void)setRoamPingPongLowRssiAndReassocOnly:(unint64_t)a3;
- (void)setRoamPingPongReassocOnly:(unint64_t)a3;
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
- (void)setRoamScanTriggersCount:(unint64_t)a3;
- (void)setRoamStatusFailedCount:(unint64_t)a3;
- (void)setRoamStatusFailedNoScan:(unint64_t)a3;
- (void)setRoamStatusNoCandidateCount:(unint64_t)a3;
- (void)setRoamStatusNoQualifiedCandidateCount:(unint64_t)a3;
- (void)setRoamStatusSucceededCount:(unint64_t)a3;
- (void)setRoamingActiveTime:(id)a3;
- (void)setRoamsAfterSupprLifted:(unint64_t)a3;
- (void)setRssiAtSessionStart:(int64_t)a3;
- (void)setSSIDTransitionCandidates:(id)a3 SSIDTransitionPotentialCandidates:(id)a4 potentialCandidatesMinusCandidates:(id)a5 roamCandidates:(unint64_t)a6 uniqueChannels:(unint64_t)a7 uniqueBands:(unint64_t)a8;
- (void)setSavedInCoexRealTimeAtLastJoin:(BOOL)a3;
- (void)setSavedJoinStateChangedCount:(unint64_t)a3;
- (void)setSavedLastJoinFailure:(int64_t)a3;
- (void)setSavedLastJoinReason:(unint64_t)a3;
- (void)setSavedLastJoinTime:(id)a3;
- (void)setSavedPrevJoinReason:(unint64_t)a3;
- (void)setSavedPreviousDisconnectReason:(int64_t)a3;
- (void)setSavedTimeSincePrevJoin:(double)a3;
- (void)setScanDataMsgInSleepCount:(unint64_t)a3;
- (void)setScanDataMsgInWakeCount:(unint64_t)a3;
- (void)setScanningActiveTime:(id)a3;
- (void)setScoActiveTime:(id)a3;
- (void)setSecondaryIfStatsAtStart:(id)a3;
- (void)setSecondaryInterfaceName:(id)a3;
- (void)setSecondaryInterfaceRxBytes:(unint64_t)a3;
- (void)setSecondaryInterfaceTxBytes:(unint64_t)a3;
- (void)setSessionDuration:(double)a3;
- (void)setSessionEndTime:(id)a3;
- (void)setSessionInitTime:(id)a3;
- (void)setSessionPid:(unint64_t)a3;
- (void)setSessionStartTime:(id)a3;
- (void)setSessionTimeSinceLastSession:(double)a3;
- (void)setSleepPowerStatsAssociatedDuration:(double)a3;
- (void)setSleepPowerStatsRoamingDuration:(double)a3;
- (void)setSleepPowerStatsTotalDuration:(double)a3;
- (void)setSleepPowerStatsUnassociatedDuration:(double)a3;
- (void)setSmartCoverStateChangedCount:(unint64_t)a3;
- (void)setSoftApActiveTime:(id)a3;
- (void)setSpmiMsgDropMaxFilterCount:(unint64_t)a3;
- (void)setSpmiMsgDropRssiFilterCount:(unint64_t)a3;
- (void)setSpmiMsgDropSpmiFailCount:(unint64_t)a3;
- (void)setSpmiMsgInAwakeCount:(unint64_t)a3;
- (void)setSpmiMsgInSleepCount:(unint64_t)a3;
- (void)setStrongestRSSIByBand:(id *)a3;
- (void)setStrongestRSSICountByBand:(id *)a3;
- (void)setSystemAwakeDuration:(double)a3;
- (void)setSystemWakeStateChangedCount:(unint64_t)a3;
- (void)setSystemWokenByWiFiCount:(unint64_t)a3;
- (void)setTdAfterJoinAfterTDCount:(unint64_t)a3;
- (void)setTdEvalCumulativeDuration:(double)a3;
- (void)setTdEvalEndedCount:(unint64_t)a3;
- (void)setTdEvalStartedByActiveProbingCount:(unint64_t)a3;
- (void)setTdEvalStartedByBadRSSICount:(unint64_t)a3;
- (void)setTdEvalStartedByCheckReassocCount:(unint64_t)a3;
- (void)setTdEvalStartedByFGNetwAppChangeCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsARPFailureCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsDNSFailCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsDNSStallCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsDataStallCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsRTTFailCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsShortFlowCount:(unint64_t)a3;
- (void)setTdEvalStartedByUserNotificationCount:(unint64_t)a3;
- (void)setTdEvalStartedCount:(unint64_t)a3;
- (void)setTdSessionStartedByBadRSSICount:(unint64_t)a3;
- (void)setTdSessionStartedBySymptomDNSFailureCount:(unint64_t)a3;
- (void)setTdSessionStartedByTDRecommendedCount:(unint64_t)a3;
- (void)setThermalIndex10Duration:(double)a3;
- (void)setThermalIndex20Duration:(double)a3;
- (void)setThermalIndex30Duration:(double)a3;
- (void)setThermalIndex40Duration:(double)a3;
- (void)setThermalIndex50Duration:(double)a3;
- (void)setThermalIndex60Duration:(double)a3;
- (void)setThermalIndex70Duration:(double)a3;
- (void)setThermalIndex80Duration:(double)a3;
- (void)setThermalIndex90Duration:(double)a3;
- (void)setThermalIndexMaxDuration:(double)a3;
- (void)setThermalIndexMinDuration:(double)a3;
- (void)setTimeSincePrevJoin:(double)a3;
- (void)setTriggerDisconnectAlertedCount:(unint64_t)a3;
- (void)setTriggerDisconnectConfirmedCount:(unint64_t)a3;
- (void)setTriggerDisconnectExecutedCount:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUsbDeviceEventCount:(unint64_t)a3;
- (void)setUsbInsertedDuration:(double)a3;
- (void)setWowStateChangedCount:(unint64_t)a3;
- (void)setWowStateEntryTime:(id)a3;
- (void)setXctest:(BOOL)a3;
- (void)smartCoverStateDidChange:(id)a3;
- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14;
- (void)summarizeAndReset6eModeStats:(id)a3;
- (void)summarizeBandUsage;
- (void)summarizeSession;
- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4;
- (void)tallyAssociatedDuration:(id)a3;
- (void)tallyInfraScoreDuration:(unint64_t)a3 until:(id)a4;
- (void)tallyP2PScoreDuration:(double)a3 until:(id)a4;
- (void)tdLogic_alertedBy:(int)a3;
- (void)tdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6;
- (void)trackEventLatencies;
- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5;
- (void)update6eModeStats:(id)a3;
- (void)updateApProfile:(id)a3;
- (void)updateAssociatedNetworkDetails:(id)a3;
- (void)updateBandUsageFor:(int)a3 With:(id)a4;
- (void)updateLinkRecoveryDisabled:(BOOL)a3;
- (void)updateRssiDiffStats:(id *)a3 For:(id)a4;
- (void)updateScanForwardStats:(id)a3;
- (void)updateSleepPowerStats:(double)a3 unassociatedDuration:(double)a4 associatedDuration:(double)a5 roamingDuration:(double)a6;
- (void)updateUsbInsertedDuration:(id)a3;
- (void)updateUsbStatus:(BOOL)a3 currentDevices:(id)a4;
- (void)updateWithCompatibilityMode:(unsigned __int8)a3;
- (void)updateWithRoamingSuppression:(unsigned __int8)a3;
- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6;
@end

@implementation WiFiUsageSession

- (WiFiUsageSession)initWithSessionType:(unint64_t)a3 andInterfaceName:(id)a4 andCapabilities:(id)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  [MEMORY[0x189603F50] date];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___WiFiUsageSession;
    v11 = -[WiFiUsageSession init](&v21, sel_init);
    [v11 setSessionInitTime:v10];
    [v11 setSessionPid:getpid()];
    [v11 setType:a3];
    [v11 setInterfaceName:v8];
    [v11 setCapabilities:v9];
    [v11 setSessionTimeSinceLastSession:-1.0];
    [v11 setIsSessionActive:0];
    [v11 setLastSystemWakeTime:v10];
    [v11 setLastPowerBudget:-1];
    [v11 setLastThermalIndex:-1];
    [v11 setLastJoinReason:-1];
    [v11 setPrevJoinReason:-1];
    [v11 setSavedLastJoinReason:-1];
    [v11 setLastJoinFailure:-1];
    [v11 setSavedLastJoinFailure:-1];
    [v11 setLastDisconnectReason:-1];
    [v11 setPreviousDisconnectReason:-1];
    [v11 setSavedPreviousDisconnectReason:-1];
    [v11 setLastDisconnectSubreason:-1];
    [v11 setSmartCoverStateChangedCount:0];
    [v11 setNetworkDetailsAtEnd:0];
    [v11 setCurrentBssSession:0];
    [v11 setResponsivenessScore:0];
    *((void *)v11 + 27) = 0LL;
    *(_OWORD *)(v11 + 200) = 0u;
    *(_OWORD *)(v11 + 184) = 0u;
    *(_OWORD *)(v11 + 168) = 0u;
    *(_OWORD *)(v11 + 152) = 0u;
    *(_OWORD *)(v11 + 136) = 0u;
    *(_OWORD *)(v11 + 120) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 8) = 0u;
    *((_OWORD *)v11 + 14) = 0u;
    *((_OWORD *)v11 + 15) = 0u;
    *((_OWORD *)v11 + 16) = 0u;
    *((_OWORD *)v11 + 17) = 0u;
    *((_OWORD *)v11 + 18) = 0u;
    *((_OWORD *)v11 + 19) = 0u;
    *((_OWORD *)v11 + 20) = 0u;
    *((_OWORD *)v11 + 21) = 0u;
    *((_OWORD *)v11 + 22) = 0u;
    *((_OWORD *)v11 + 23) = 0u;
    *((_OWORD *)v11 + 24) = 0u;
    *((_OWORD *)v11 + 25) = 0u;
    *((_OWORD *)v11 + 26) = 0u;
    *((_OWORD *)v11 + 27) = 0u;
    *((_OWORD *)v11 + 28) = 0u;
    *((_OWORD *)v11 + 29) = 0u;
    *((void *)v11 + 76) = 0LL;
    *((_OWORD *)v11 + 36) = 0u;
    *((_OWORD *)v11 + 37) = 0u;
    *((_OWORD *)v11 + 34) = 0u;
    *((_OWORD *)v11 + 35) = 0u;
    *((_OWORD *)v11 + 32) = 0u;
    *((_OWORD *)v11 + 33) = 0u;
    *((_OWORD *)v11 + 30) = 0u;
    *((_OWORD *)v11 + 31) = 0u;
    v12 = (void *)*((void *)v11 + 1126);
    if (v12)
    {
      [v12 removeAllObjects];
    }

    else
    {
      id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
      v15 = (void *)*((void *)v11 + 1126);
      *((void *)v11 + 1126) = v14;
    }

    [v11 setLastDriverUnavailableReason:0];
    [v11 setLastDriverTerminationTime:0];
    [v11 setLastChipResetTime:0];
    [v11 setDriverProcessLifespan:0.0];
    [v11 setDriverAvailabilityLifespan:0.0];
    [v11 setIsDriverAvailable:1];
    [v11 setDriverUnavailabilityCount:0];
    [v11 setLastDriverAvailableTime:v10];
    [v11 trackEventLatencies];
    v16 = (void *)objc_opt_new();
    [v11 setRoamNeighborsByBand:v16];

    v17 = (void *)objc_opt_new();
    [v11 setRoamCandidatesPerBandWhenSuccessful:v17];

    v18 = (void *)objc_opt_new();
    [v11 setRoamCandidatesPerBandWhenUnSuccessful:v18];

    v19 = (void *)objc_opt_new();
    [v11 setPrevNetworkNames:v19];

    [v11 setLastCoexRealTimeOn:0];
    [v11 setLastCoexRealTimeOff:0];
    [v11 setConsecutiveJoinFailureCount:0];
    v11[9019] = 0;
    self = v11;
    v13 = self;
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]";
      __int16 v24 = 2112;
      uint64_t v25 = 0LL;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Cannot create Session (invalid interfaceName: %@)",  buf,  0x16u);
    }

    v13 = 0LL;
  }

  return v13;
}

- (void)trackEventLatencies
{
}

- (void)setCompletionHandler:(id)a3 withContext:(id)a4 onQueue:(id)a5
{
  id v9 = a5;
  id v8 = a4;
  -[WiFiUsageSession setCompletionHandler:](self, "setCompletionHandler:", a3);
  -[WiFiUsageSession setCompletionContext:](self, "setCompletionContext:", v8);

  -[WiFiUsageSession setCompletionQueue:](self, "setCompletionQueue:", v9);
}

- (void)setLastDisconnectReason:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastDisconnectReason = a3;
  if (v5)
  {
    v13 = v5;
    [NSString stringWithFormat:@"WiFiDisconnectReason%@", v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_disconnectReasonMap, "objectForKeyedSubscript:", v6);
    disconnectReasonMap = self->_disconnectReasonMap;
    if (v7)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](disconnectReasonMap, "objectForKeyedSubscript:", v6);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 integerValue];

      v11 = self->_disconnectReasonMap;
      [MEMORY[0x189607968] numberWithInteger:v10 + 1];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v6);
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:](disconnectReasonMap, "setObject:forKey:", &unk_18A1B43C8, v6);
    }

    v5 = v13;
  }
}

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [MEMORY[0x189603F50] date];
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v5)
  {
    ++self->_systemWakeStateChangedCount;
    if (v4) {
      ++self->_systemWokenByWiFiCount;
    }
    -[WiFiUsageSession setLastSystemWakeTime:](self, "setLastSystemWakeTime:", v7);
    lastSystemSleepTime = self->_lastSystemSleepTime;
    if (lastSystemSleepTime)
    {
      if (self->_lastLinkStateChangedTime)
      {
        -[NSDate timeIntervalSinceDate:](v11, "timeIntervalSinceDate:");
        lastSystemSleepTime = 0LL;
        self->_associatedSleepDuration = v9 + self->_associatedSleepDuration;
      }

      else
      {
        lastSystemSleepTime = 0LL;
      }
    }
  }

  else
  {
    lastSystemSleepTime = v7;
    if (self->_lastSystemWakeTime)
    {
      -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", self->_lastSystemWakeTime);
      self->_systemAwakeDuration = v10 + self->_systemAwakeDuration;
      -[WiFiUsageSession setLastSystemWakeTime:](self, "setLastSystemWakeTime:", v11);
      lastSystemSleepTime = v11;
    }
  }

  -[WiFiUsageSession setLastSystemSleepTime:](self, "setLastSystemSleepTime:", lastSystemSleepTime);
}

- (void)lockStateDidChange:(BOOL)a3
{
  if (a3) {
    ++self->_lockStateChangedCount;
  }
  self->_isUnlocked = !a3;
}

- (void)displayStateDidChange:(BOOL)a3
{
  if (a3) {
    ++self->_displayStateChangedCount;
  }
  self->_isDisplayOn = a3;
}

- (void)motionStateDidChange:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x189603F50];
  id v5 = a3;
  [v4 date];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isEqualToString:@"Stationary"];
  uint64_t v7 = [v5 containsString:@"Driving"];
  int v8 = [v5 isEqualToString:@"Walking"];

  if ((v6 & 1) != 0)
  {
    if (self->_inMotionStartedTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      self->_inMotionDuration = v9 + self->_inMotionDuration;
      -[WiFiUsageSession setInMotionStartedTime:](self, "setInMotionStartedTime:", 0LL);
    }

    if ((_DWORD)v7) {
      goto LABEL_5;
    }
  }

  else
  {
    -[WiFiUsageSession setInMotionStartedTime:](self, "setInMotionStartedTime:", v12);
    ++self->_inMotionEventCount;
    if ((_DWORD)v7)
    {
LABEL_5:
      -[WiFiUsageSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", v12);
      ++self->_inVehicleEventCount;
      goto LABEL_9;
    }
  }

  if (self->_inVehicleEntryTime)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:");
    self->_inVehicleDuration = v10 + self->_inVehicleDuration;
    -[WiFiUsageSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", 0LL);
  }

- (void)callStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v5;
  if (v3)
  {
    -[WiFiUsageSession setCallStartedTime:](self, "setCallStartedTime:", v5);
    ++self->_inCallEventCount;
  }

  else if (self->_callStartedTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_inCallDuration = v6 + self->_inCallDuration;
    -[WiFiUsageSession setCallStartedTime:](self, "setCallStartedTime:", 0LL);
  }

  -[WiFiUsageBssSession callStateDidChange:](self->_currentBssSession, "callStateDidChange:", v3);
}

- (void)smartCoverStateDidChange:(id)a3
{
}

- (void)mediaStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v3)
  {
    int v8 = v5;
    -[WiFiUsageSession setMediaStartedTime:](self, "setMediaStartedTime:", v5);
    double v6 = v8;
    ++self->_mediaPlaybackEventCount;
  }

  else if (self->_mediaStartedTime)
  {
    double v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_mediaPlaybackDuration = v7 + self->_mediaPlaybackDuration;
    -[WiFiUsageSession setMediaStartedTime:](self, "setMediaStartedTime:", 0LL);
    double v6 = v9;
  }
}

- (void)chargingStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v3)
  {
    int v8 = v5;
    -[WiFiUsageSession setChargingStartedTime:](self, "setChargingStartedTime:", v5);
    double v6 = v8;
    ++self->_chargingEventCount;
  }

  else if (self->_chargingStartedTime)
  {
    double v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_chargingDuration = v7 + self->_chargingDuration;
    -[WiFiUsageSession setChargingStartedTime:](self, "setChargingStartedTime:", 0LL);
    double v6 = v9;
  }
}

- (void)companionStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v3)
  {
    int v8 = v5;
    -[WiFiUsageSession setCompanionConnectionTime:](self, "setCompanionConnectionTime:", v5);
    double v6 = v8;
    ++self->_companionConnectionStateChangedCount;
  }

  else if (self->_companionConnectionTime)
  {
    double v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_companionConnectedDuration = v7 + self->_companionConnectedDuration;
    -[WiFiUsageSession setCompanionConnectionTime:](self, "setCompanionConnectionTime:", 0LL);
    double v6 = v9;
  }
}

- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  [MEMORY[0x189603F50] date];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  wowStateEntryTime = self->_wowStateEntryTime;
  if (v9)
  {
    if (!wowStateEntryTime)
    {
      -[WiFiUsageSession setWowStateEntryTime:](self, "setWowStateEntryTime:", v19);
      ++self->_wowStateChangedCount;
    }
  }

  else if (wowStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inWowStateDuration = v12 + self->_inWowStateDuration;
    -[WiFiUsageSession setWowStateEntryTime:](self, "setWowStateEntryTime:", 0LL);
  }

  lpasStateEntryTime = self->_lpasStateEntryTime;
  if (v8)
  {
    if (!lpasStateEntryTime)
    {
      -[WiFiUsageSession setLpasStateEntryTime:](self, "setLpasStateEntryTime:", v19);
      ++self->_lpasStateChangedCount;
    }
  }

  else if (lpasStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inLpasStateDuration = v14 + self->_inLpasStateDuration;
    -[WiFiUsageSession setLpasStateEntryTime:](self, "setLpasStateEntryTime:", 0LL);
  }

  lowPowerStateEntryTime = self->_lowPowerStateEntryTime;
  if (v7)
  {
    if (!lowPowerStateEntryTime)
    {
      -[WiFiUsageSession setLowPowerStateEntryTime:](self, "setLowPowerStateEntryTime:", v19);
      ++self->_lowPowerStateChangedCount;
    }
  }

  else if (lowPowerStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inLowPowerStateDuration = v16 + self->_inLowPowerStateDuration;
    -[WiFiUsageSession setLowPowerStateEntryTime:](self, "setLowPowerStateEntryTime:", 0LL);
  }

  batterySaverStateEntryTime = self->_batterySaverStateEntryTime;
  if (v6)
  {
    if (!batterySaverStateEntryTime)
    {
      -[WiFiUsageSession setBatterySaverStateEntryTime:](self, "setBatterySaverStateEntryTime:", v19);
      ++self->_batterySaverStateChangedCount;
    }
  }

  else if (batterySaverStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inBatterySaverStateDuration = v18 + self->_inBatterySaverStateDuration;
    -[WiFiUsageSession setBatterySaverStateEntryTime:](self, "setBatterySaverStateEntryTime:", 0LL);
  }
}

- (void)updateSleepPowerStats:(double)a3 unassociatedDuration:(double)a4 associatedDuration:(double)a5 roamingDuration:(double)a6
{
  self->_sleepPowerStatsTotalDuration = self->_sleepPowerStatsTotalDuration + a3;
  self->_sleepPowerStatsUnassociatedDuration = self->_sleepPowerStatsUnassociatedDuration + a4;
  self->_sleepPowerStatsAssociatedDuration = self->_sleepPowerStatsAssociatedDuration + a5;
  self->_sleepPowerStatsRoamingDuration = self->_sleepPowerStatsRoamingDuration + a6;
}

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  p_xctest = &self->_xctest;
  id v16 = a3;
  id v7 = a4;
  if (v16 && (char v8 = [v16 isEqualToString:@"com.apple.PineBoard"], v9 = v16, (v8 & 1) == 0))
  {
    ++self->_applicationStateChangedCount;
    activeApplications = self->_activeApplications;
    if (!activeApplications)
    {
      double v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
      v13 = self->_activeApplications;
      self->_activeApplications = v12;

      id v9 = v16;
      activeApplications = self->_activeApplications;
    }

    -[NSMutableSet addObject:](activeApplications, "addObject:", v9);
    char v10 = 0;
  }

  else
  {
    -[WiFiUsageSession setActiveApplications:](self, "setActiveApplications:", 0LL);
    char v10 = 1;
  }

  p_xctest[3] = v10;
  if (*p_xctest)
  {
    [MEMORY[0x189607958] defaultCenter];
    double v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607950] notificationWithName:@"applicationStateDidChange" object:0];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 postNotification:v15];
  }
}

- (void)updateBandUsageFor:(int)a3 With:(id)a4
{
  id v6 = a4;
  if (a3 <= 2)
  {
    lastBssChangedTime = self->_lastBssChangedTime;
    if (lastBssChangedTime)
    {
      id v16 = v6;
      -[NSDate timeIntervalSinceDate:](lastBssChangedTime, "timeIntervalSinceDate:", self->_sessionStartTime);
      uint64_t v8 = 1157LL;
      if (v9 > 0.0) {
        uint64_t v8 = 1182LL;
      }
      Class v10 = (&self->super.isa)[v8];
      p_bandUsageDuration = &self->_bandUsageDuration;
      valid = self->_bandUsageDuration.valid;
      uint64_t v13 = a3;
      if (!valid[a3]) {
        p_bandUsageDuration->valueByBand[a3] = 0.0;
      }
      double v14 = v10;
      [v16 timeIntervalSinceDate:v14];
      p_bandUsageDuration->valueByBand[v13] = v15 + p_bandUsageDuration->valueByBand[v13];
      valid[v13] = 1;

      id v6 = v16;
    }
  }
}

- (BOOL)useSavedJoinStats
{
  return 0;
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v20 = a7;
  [MEMORY[0x189603F50] date];
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (-[WiFiUsageSession useSavedJoinStats](self, "useSavedJoinStats"))
    {
      unint64_t lastJoinReason = self->_lastJoinReason;
      if (lastJoinReason != -1LL)
      {
        __int128 v14 = *(_OWORD *)&self->_joinReasonCount[10];
        *(_OWORD *)&self->_savedJoinReasonCount[8] = *(_OWORD *)&self->_joinReasonCount[8];
        *(_OWORD *)&self->_savedJoinReasonCount[10] = v14;
        *(_OWORD *)&self->_savedJoinReasonCount[12] = *(_OWORD *)&self->_joinReasonCount[12];
        self->_savedJoinReasonCount[14] = self->_joinReasonCount[14];
        __int128 v15 = *(_OWORD *)&self->_joinReasonCount[2];
        *(_OWORD *)self->_savedJoinReasonCount = *(_OWORD *)self->_joinReasonCount;
        *(_OWORD *)&self->_savedJoinReasonCount[2] = v15;
        __int128 v16 = *(_OWORD *)&self->_joinReasonCount[6];
        *(_OWORD *)&self->_savedJoinReasonCount[4] = *(_OWORD *)&self->_joinReasonCount[4];
        *(_OWORD *)&self->_savedJoinReasonCount[6] = v16;
        self->_savedJoinStateChangedCount = self->_joinStateChangedCount;
        self->_savedPrevJoinReason = self->_prevJoinReason;
        self->_savedTimeSincePrevJoin = self->_timeSincePrevJoin;
        self->_savedInCoexRealTimeAtLastJoin = self->_inCoexRealTimeAtLastJoin;
        self->_savedLastJoinReason = lastJoinReason;
        self->_savedPreviousDisconnectReason = self->_previousDisconnectReason;
        self->_savedLastJoinFailure = self->_lastJoinFailure;
      }
    }

    if (!self->_lastJoinFailure) {
      -[WiFiUsageSession setConsecutiveJoinFailureCount:](self, "setConsecutiveJoinFailureCount:", 0LL);
    }
    ++self->_joinStateChangedCount;
    ++self->_joinReasonCount[a4];
    -[WiFiUsageSession setPrevJoinReason:](self, "setPrevJoinReason:", self->_lastJoinReason);
    [v12 timeIntervalSinceDate:self->_lastJoinTime];
    -[WiFiUsageSession setTimeSincePrevJoin:](self, "setTimeSincePrevJoin:");
    -[WiFiUsageSession setLastJoinTime:](self, "setLastJoinTime:", v12);
    -[WiFiUsageSession setInCoexRealTimeAtLastJoin:](self, "setInCoexRealTimeAtLastJoin:", self->_inCoexRealTime);
    -[WiFiUsageSession setLastJoinReason:](self, "setLastJoinReason:", a4);
    -[WiFiUsageSession setPreviousDisconnectReason:](self, "setPreviousDisconnectReason:", self->_lastDisconnectReason);
    -[WiFiUsageSession setLastDisconnectReason:](self, "setLastDisconnectReason:", 0LL);
    -[WiFiUsageSession setLastDisconnectSubreason:](self, "setLastDisconnectSubreason:", 0LL);
    -[WiFiUsageSession setLastJoinFailure:](self, "setLastJoinFailure:", 0LL);
    if (self->_joinStartedLatencyFromDriverAvailability == 0.0 && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinStartedLatencyFromDriverAvailability:]( self,  "setJoinStartedLatencyFromDriverAvailability:");
    }
  }

  else
  {
    -[WiFiUsageSession setPreviousDisconnectReason:](self, "setPreviousDisconnectReason:", self->_lastDisconnectReason);
    -[WiFiUsageSession setLastDisconnectReason:](self, "setLastDisconnectReason:", a5);
    -[WiFiUsageSession setLastJoinFailure:](self, "setLastJoinFailure:", a6);
    if (-[WiFiUsageSession useSavedJoinStats](self, "useSavedJoinStats") && self->_lastJoinReason != -1LL)
    {
      self->_savedPreviousDisconnectReason = self->_previousDisconnectReason;
      self->_savedLastJoinFailure = self->_lastJoinFailure;
    }

    if (a6) {
      ++self->_consecutiveJoinFailureCount;
    }
  }

  if (self->_rssiAtSessionStart == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v20 connectedBss];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v17 rssi] == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_19:

      goto LABEL_20;
    }

    [v20 connectedBss];
    double v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 rssi];

    if (v19)
    {
      [v20 connectedBss];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self->_rssiAtSessionStart = [v17 rssi];
      goto LABEL_19;
    }
  }

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v53 = a4;
  BOOL v55 = a3;
  uint64_t v77 = *MEMORY[0x1895F89C0];
  id v8 = a7;
  [MEMORY[0x189603F50] date];
  double v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession originBssDetails](self->_currentBssSession, "originBssDetails");
  Class v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 bssid];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 connectedBss];
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 bssid];

  -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v54 = [v14 band];

  [v8 connectedBss];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentBand = [v15 band];

  -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 channel];

  [v8 connectedBss];
  double v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 channel];

  [v8 connectedBss];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageAccessPointProfile profileForBSSID:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "profileForBSSID:", v13);
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setApProfile:v21];

  v22 = v11;
  v56 = (void *)v13;
  BOOL v23 = 1;
  p_isAssociated = &self->_isAssociated;
  uint64_t v25 = v9;
  if (v55)
  {
    if (!*p_isAssociated)
    {
      [v9 timeIntervalSinceDate:self->_sessionStartTime];
      -[WiFiUsageSession setJoinLinkUpLatencyFromSessionStart:](self, "setJoinLinkUpLatencyFromSessionStart:");
    }

    BOOL *p_isAssociated = 1;
    networkDetails = self->_networkDetails;
    if (networkDetails
      && (-[WiFiUsageNetworkDetails networkName](networkDetails, "networkName"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          [v8 networkName],
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          char v29 = [v27 isEqualToString:v28],
          v28,
          v27,
          (v29 & 1) == 0))
    {
      ++self->_networkChangedCount;
      if (-[NSMutableArray count](self->_prevNetworkNames, "count")
        && (unint64_t)-[NSMutableArray count](self->_prevNetworkNames, "count") >= 2)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_prevNetworkNames, "removeObjectAtIndex:", 0LL);
      }
      v40 = -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
      if (!v40) {
        goto LABEL_38;
      }
      prevNetworkNames = self->_prevNetworkNames;
      v34 = -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
      -[NSMutableArray addObject:](prevNetworkNames, "addObject:", v34);
    }

    else
    {
      if (v22 && (!v23 || !self->_lastBssChangedTime || !self->_networkDetails)) {
        goto LABEL_38;
      }
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        v30 = -[WiFiUsageSession sessionName](self, "sessionName");
        v31 = +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", v54);
        v32 = +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  self->_currentBand);
        *(_DWORD *)buf = 136317442;
        v58 = "-[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
        __int16 v59 = 2112;
        v60 = v30;
        __int16 v61 = 2160;
        uint64_t v62 = 1752392040LL;
        __int16 v63 = 2112;
        v64 = v22;
        __int16 v65 = 1024;
        int v66 = v17;
        __int16 v67 = 2112;
        v68 = v31;
        __int16 v69 = 2160;
        uint64_t v70 = 1752392040LL;
        __int16 v71 = 2112;
        v72 = v56;
        __int16 v73 = 1024;
        int v74 = v19;
        __int16 v75 = 2112;
        v76 = v32;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: %@: roamed from BSSID %{mask.hash}@ on channel %d(%@Ghz) to BSSID %{mask.hash}@ on channel %d(%@Ghz)",  buf,  0x5Eu);
      }

      if (-[WiFiUsageSession isSessionActive](self, "isSessionActive") && self->_lastBssChangedTime) {
        -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", v54, v25);
      }
      -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", v25);
      currentBssSession = self->_currentBssSession;
      [v8 bssEnvironment];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 connectedBss];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageBssSession bssDidChange:withDetails:](currentBssSession, "bssDidChange:withDetails:", v34, v35);
    }

LABEL_38:
    if (v8 && !self->_currentBssSession && self->_type == 4)
    {
      v42 = objc_alloc(&OBJC_CLASS___WiFiUsageBssSession);
      interfaceName = self->_interfaceName;
      [v8 bssEnvironment];
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 connectedBss];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[WiFiUsageBssSession initWithInterfaceName:bssEnvironment:andBssDetails:andNetworkDetails:]( v42,  "initWithInterfaceName:bssEnvironment:andBssDetails:andNetworkDetails:",  interfaceName,  v44,  v45,  v8);
      -[WiFiUsageSession setCurrentBssSession:](self, "setCurrentBssSession:", v46);
    }

    ++self->_linkStateChangedCount;
    if (self->_lastLinkStateChangedTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      if (v47 > self->_longestUnassociatedDuration) {
        self->_longestUnassociatedDuration = v47;
      }
    }

    if (self->_lastUnexpectedLinkDownTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      if (v48 < 20.0) {
        ++self->_rapidLinkTransitionCount;
      }
    }

    -[WiFiUsageSession setLastUnexpectedLinkDownTime:](self, "setLastUnexpectedLinkDownTime:", 0LL);
    if (!self->_lastLinkStateChangedTime) {
      -[WiFiUsageSession setLastLinkStateChangedTime:](self, "setLastLinkStateChangedTime:", v25);
    }
    if (!self->_lastBssChangedTime) {
      -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", v25);
    }
    if (self->_joinLinkUpLatencyFromDriverAvailability == 0.0 && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinLinkUpLatencyFromDriverAvailability:]( self,  "setJoinLinkUpLatencyFromDriverAvailability:");
    }

    [v8 connectedBss];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v50 = +[WiFiUsageLQMTransformations maxPhyModeFrom:]( WiFiUsageLQMTransformations,  "maxPhyModeFrom:",  [v49 phyMode]);

    if (v50 > self->_maxPhyMode) {
      self->_maxPhyMode = v50;
    }
    goto LABEL_57;
  }

  BOOL *p_isAssociated = 0;
  if (!-[WiFiUsageSession lastDisconnectReason](self, "lastDisconnectReason"))
  {
    -[WiFiUsageSession setLastDisconnectReason:](self, "setLastDisconnectReason:", a5);
    -[WiFiUsageSession setLastDisconnectSubreason:](self, "setLastDisconnectSubreason:", a6);
  }

  if (v53) {
    v36 = v9;
  }
  else {
    v36 = 0LL;
  }
  -[WiFiUsageSession setLastUnexpectedLinkDownTime:](self, "setLastUnexpectedLinkDownTime:", v36);
  -[WiFiUsageSession tallyAssociatedDuration:](self, "tallyAssociatedDuration:", v9);
  if (self->_lastBssChangedTime)
  {
    v37 = self->_networkDetails;
    if (v37)
    {
      v38 = -[WiFiUsageNetworkDetails connectedBss](v37, "connectedBss");
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", [v38 band], v9);
    }

    -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", 0LL);
  }

  v39 = self->_currentBssSession;
  if (v39) {
    -[WiFiUsageBssSession bssDidChange:withDetails:](v39, "bssDidChange:withDetails:", 0LL, 0LL);
  }
  if (self->_lastAWDLSequenceUpdate)
  {
    -[WiFiUsageSession tallyInfraScoreDuration:until:](self, "tallyInfraScoreDuration:until:", 0LL, v9);
    -[WiFiUsageSession tallyP2PScoreDuration:until:]( self,  "tallyP2PScoreDuration:until:",  v9,  self->_inAWDL_lastP2PScore);
    objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, v9);
  }

- (void)linkQualityDidChange:(id)a3
{
  id v8 = a3;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    lqm = self->_lqm;
    if (lqm)
    {
      -[WiFiUsageSessionLQM updateLinkQuality:forSession:](lqm, "updateLinkQuality:forSession:", v8, self->_type);
    }

    else
    {
      id v5 = -[WiFiUsageSessionLQM initWithLQMSample:forInterface:]( objc_alloc(&OBJC_CLASS___WiFiUsageSessionLQM),  "initWithLQMSample:forInterface:",  v8,  self->_interfaceName);
      id v6 = self->_lqm;
      self->_lqm = v5;
    }

    if (self->_rssiAtSessionStart == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v7 = 1LL;
    }
    else {
      int64_t v7 = [v8 rssi];
    }
    self->_rssiAtSessionStart = v7;
    -[WiFiUsageBssSession linkQualityDidChange:](self->_currentBssSession, "linkQualityDidChange:", v8);
  }
}

- (void)updateApProfile:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (self->_networkDetails)
  {
    [v4 bssid];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 bssid];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
      double v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 apProfile];
      Class v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setApProfile:v10];

      goto LABEL_6;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      -[WiFiUsageSession sessionName](self, "sessionName");
      double v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 136315394;
      double v12 = "-[WiFiUsageSession updateApProfile:]";
      __int16 v13 = 2112;
      __int128 v14 = v9;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - mismatched BSSID between beaconData and connectedBss - not updating session %@",  (uint8_t *)&v11,  0x16u);
LABEL_6:
    }
  }
}

- (void)powerBudgetDidChange:(int64_t)a3 andThermalIndex:(int64_t)a4
{
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t lastPowerBudget = self->_lastPowerBudget;
  id v14 = v7;
  if (lastPowerBudget <= 99)
  {
    if (lastPowerBudget <= 89)
    {
      if (lastPowerBudget <= 79)
      {
        if (lastPowerBudget <= 69)
        {
          if (lastPowerBudget <= 59)
          {
            if (lastPowerBudget <= 49)
            {
              if (lastPowerBudget <= 39)
              {
                if (lastPowerBudget <= 29)
                {
                  if (lastPowerBudget <= 19)
                  {
                    if (lastPowerBudget <= 9)
                    {
                      if (lastPowerBudget < 0) {
                        goto LABEL_24;
                      }
                      uint64_t v9 = 1264LL;
                    }

                    else
                    {
                      uint64_t v9 = 1263LL;
                    }
                  }

                  else
                  {
                    uint64_t v9 = 1262LL;
                  }
                }

                else
                {
                  uint64_t v9 = 1261LL;
                }
              }

              else
              {
                uint64_t v9 = 1260LL;
              }
            }

            else
            {
              uint64_t v9 = 1259LL;
            }
          }

          else
          {
            uint64_t v9 = 1258LL;
          }
        }

        else
        {
          uint64_t v9 = 1257LL;
        }
      }

      else
      {
        uint64_t v9 = 1256LL;
      }
    }

    else
    {
      uint64_t v9 = 1255LL;
    }
  }

  else
  {
    uint64_t v9 = 1254LL;
  }

  [v7 timeIntervalSinceDate:self->_lastPowerBudgetChangedTime];
  int64_t v7 = v14;
  *(double *)&(&self->super.isa)[v9] = v10 + *(double *)&(&self->super.isa)[v9];
LABEL_24:
  int64_t lastThermalIndex = self->_lastThermalIndex;
  if (lastThermalIndex > 99)
  {
    uint64_t v12 = 1265LL;
LABEL_46:
    [v7 timeIntervalSinceDate:self->_lastPowerBudgetChangedTime];
    *(double *)&(&self->super.isa)[v12] = v13 + *(double *)&(&self->super.isa)[v12];
    goto LABEL_47;
  }

  if (lastThermalIndex > 89)
  {
    uint64_t v12 = 1266LL;
    goto LABEL_46;
  }

  if (lastThermalIndex > 79)
  {
    uint64_t v12 = 1267LL;
    goto LABEL_46;
  }

  if (lastThermalIndex > 69)
  {
    uint64_t v12 = 1268LL;
    goto LABEL_46;
  }

  if (lastThermalIndex > 59)
  {
    uint64_t v12 = 1269LL;
    goto LABEL_46;
  }

  if (lastThermalIndex > 49)
  {
    uint64_t v12 = 1270LL;
    goto LABEL_46;
  }

  if (lastThermalIndex > 39)
  {
    uint64_t v12 = 1271LL;
    goto LABEL_46;
  }

  if (lastThermalIndex > 29)
  {
    uint64_t v12 = 1272LL;
    goto LABEL_46;
  }

  if (lastThermalIndex > 19)
  {
    uint64_t v12 = 1273LL;
    goto LABEL_46;
  }

  if (lastThermalIndex > 9)
  {
    uint64_t v12 = 1274LL;
    goto LABEL_46;
  }

  if ((lastThermalIndex & 0x8000000000000000LL) == 0)
  {
    uint64_t v12 = 1275LL;
    int64_t v7 = v14;
    goto LABEL_46;
  }

- (void)bluetoothStateDidChange:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6 inUniAoS:(BOOL)a7 inBiAoS:(BOOL)a8 btAudioBand:(BOOL)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v14 = a3;
  [MEMORY[0x189603F50] date];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = v16;
  if (v12)
  {
    -[WiFiUsageSession setA2dpActiveTime:](self, "setA2dpActiveTime:", v16);
    ++self->_inA2dpEventCount;
  }

  else if (self->_a2dpActiveTime)
  {
    objc_msgSend(v16, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v17 + self->_inA2dpDuration;
    -[WiFiUsageSession setA2dpActiveTime:](self, "setA2dpActiveTime:", 0LL);
  }

  if (v11)
  {
    -[WiFiUsageSession setScoActiveTime:](self, "setScoActiveTime:", v21);
    ++self->_inScoEventCount;
  }

  else if (self->_scoActiveTime)
  {
    objc_msgSend(v21, "timeIntervalSinceDate:");
    self->_inScoDuration = v18 + self->_inScoDuration;
    -[WiFiUsageSession setScoActiveTime:](self, "setScoActiveTime:", 0LL);
  }

  if (a4)
  {
    -[WiFiUsageSession setHidPresentTime:](self, "setHidPresentTime:", v21);
    ++self->_inHidPresentCount;
  }

  else if (self->_hidPresentTime)
  {
    objc_msgSend(v21, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v19 + self->_inHidPresentDuration;
    -[WiFiUsageSession setHidPresentTime:](self, "setHidPresentTime:", 0LL);
  }

  self->_isA2DPActive = v12;
  self->_isSCOActive = v11;
  self->_isUniAoSActive = a7;
  self->_isBiAoSActive = a8;
  if (a9) {
    id v20 = @"5";
  }
  else {
    id v20 = @"2.4";
  }
  objc_storeStrong((id *)&self->_btAudioBand, v20);
  -[WiFiUsageBssSession bluetoothStateDidChange:connectedDeviceCount:inA2dp:inSco:]( self->_currentBssSession,  "bluetoothStateDidChange:connectedDeviceCount:inA2dp:inSco:",  v14,  a4,  v12,  v11);
}

- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4
{
  BOOL v5 = a3;
  [MEMORY[0x189603F50] date];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  if (v5)
  {
    -[WiFiUsageSession setAwdlActiveTime:](self, "setAwdlActiveTime:", v7);
    ++self->_inAwdlEventCount;
  }

  else if (self->_awdlActiveTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v8 + self->_inAwdlDuration;
    -[WiFiUsageSession setAwdlActiveTime:](self, "setAwdlActiveTime:", 0LL);
  }

  -[WiFiUsageBssSession awdlStateDidChange:inMode:](self->_currentBssSession, "awdlStateDidChange:inMode:", v5, a4);
}

- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14
{
  BOOL v14 = a3;
  objc_msgSend(MEMORY[0x189603F50], "date", a3, a4, a5, a6, a7, a8, a12, a14);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  double v17 = v16;
  if (v14)
  {
    double v19 = v16;
    -[WiFiUsageSession setSoftApActiveTime:](self, "setSoftApActiveTime:", v16);
    double v17 = v19;
    ++self->_inSoftApEventCount;
  }

  else if (self->_softApActiveTime)
  {
    id v20 = v16;
    objc_msgSend(v16, "timeIntervalSinceDate:");
    self->_inSoftApDuration = v18 + self->_inSoftApDuration;
    -[WiFiUsageSession setSoftApActiveTime:](self, "setSoftApActiveTime:", 0LL);
    double v17 = v20;
  }
}

- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongStats:(id)a8
{
  BOOL v11 = a3;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v13 = a7;
  id v14 = a8;
  [MEMORY[0x189603F50] date];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = v15;
  if (v11)
  {
    -[WiFiUsageSession setRoamingActiveTime:](self, "setRoamingActiveTime:", v15);
    ++self->_inRoamEventCount;
    if (self->_lastRoamSuppressionToggled)
    {
      if (!self->_isRoamSuppressionEnabled && !self->_roamsAfterSupprLifted)
      {
        objc_msgSend(v16, "timeIntervalSinceDate:");
        self->_double inRoamSuppressionWaitForRoamStart = v17 + self->_inRoamSuppressionWaitForRoamStart;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          double inRoamSuppressionWaitForRoamStart = self->_inRoamSuppressionWaitForRoamStart;
          int v27 = 136315394;
          v28 = "-[WiFiUsageSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:]";
          __int16 v29 = 2048;
          double v30 = inRoamSuppressionWaitForRoamStart;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - incremented inRoamSuppressionWaitForRoamStart:%fs",  (uint8_t *)&v27,  0x16u);
        }
      }
    }

    switch(a4)
    {
      case 0xE0820C00uLL:
        ++self->_roamReasonInitialAssociationCount;
        break;
      case 0xE0820C01uLL:
        ++self->_roamReasonLowRssiCount;
        break;
      case 0xE0820C02uLL:
      case 0xE0820C03uLL:
        ++self->_roamReasonDeauthDisassocCount;
        break;
      case 0xE0820C04uLL:
        ++self->_roamReasonBeaconLostCount;
        break;
      case 0xE0820C06uLL:
        ++self->_roamReasonSteeredByApCount;
        break;
      case 0xE0820C08uLL:
        ++self->_roamReasonBetterCandidateCount;
        break;
      case 0xE0820C09uLL:
      case 0xE0820C0AuLL:
      case 0xE0820C0CuLL:
      case 0xE0820C0FuLL:
        ++self->_roamReasonBetterConditionCount;
        break;
      case 0xE0820C0BuLL:
        ++self->_roamReasonSteeredByBtmCount;
        break;
      case 0xE0820C0EuLL:
        ++self->_roamReasonSteeredByCsaCount;
        break;
      case 0xE0820C13uLL:
        ++self->_roamReasonReassocRequestedCount;
        break;
      case 0xE0820C15uLL:
        ++self->_roamReasonHostTriggeredCount;
        break;
      default:
        ++self->_roamReasonMiscCount;
        break;
    }

    goto LABEL_25;
  }

  if (!self->_roamingActiveTime) {
    goto LABEL_25;
  }
  objc_msgSend(v15, "timeIntervalSinceDate:");
  self->_inRoamDuration = v19 + self->_inRoamDuration;
  -[WiFiUsageSession setRoamingActiveTime:](self, "setRoamingActiveTime:", 0LL);
  if (self->_lastRoamSuppressionToggled)
  {
    if (!self->_isRoamSuppressionEnabled && !self->_roamsAfterSupprLifted)
    {
      self->_unint64_t roamsAfterSupprLifted = 1LL;
      objc_msgSend(v16, "timeIntervalSinceDate:");
      self->_double inRoamSuppressionWaitForRoamEnd = v20 + self->_inRoamSuppressionWaitForRoamEnd;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t roamsAfterSupprLifted = self->_roamsAfterSupprLifted;
        double inRoamSuppressionWaitForRoamEnd = self->_inRoamSuppressionWaitForRoamEnd;
        int v27 = 136315650;
        v28 = "-[WiFiUsageSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:]";
        __int16 v29 = 2048;
        double v30 = *(double *)&roamsAfterSupprLifted;
        __int16 v31 = 2048;
        double v32 = inRoamSuppressionWaitForRoamEnd;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - roamsAfterSupprLifted:%lu. incremented inRoamSuppressionWaitForRoamEnd :%fs",  (uint8_t *)&v27,  0x20u);
      }
    }
  }

  if (a5 - 3766617153u > 0xA) {
    goto LABEL_19;
  }
  if (((1LL << (a5 - 65)) & 0x1CF) != 0)
  {
LABEL_21:
    uint64_t v23 = 1LL;
    uint64_t v24 = 1237LL;
    goto LABEL_22;
  }

  if (a5 != 3766617163)
  {
LABEL_19:
    if (a5 - 3766617091u <= 0xC)
    {
      if (a5 == 3766617091)
      {
        uint64_t v23 = 1LL;
        uint64_t v24 = 1235LL;
        goto LABEL_22;
      }
    }

    if (a5)
    {
      uint64_t v23 = 1LL;
      uint64_t v24 = 1234LL;
    }

    else
    {
      ++self->_roamStatusSucceededCount;
      if (!self->_inMotionStartedTime)
      {
        if ((unint64_t)[v14 pingPongNth] >= 3)
        {
          ++self->_roamPingPongAboveThresholdCount;
          self->_roamPingPongAboveThresholdCountLowRssiOnly += [v14 pingPongSequenceIsLowRssiOnly];
        }

        self->_roamPingPongLowRssiAndReassocOnly += [v14 pingPongSequenceIsReassocOrLowRSSIOnly];
      }

      uint64_t v23 = [v14 pingPongSequenceIsReassocOnly];
      uint64_t v24 = 1242LL;
    }

    goto LABEL_22;
  }

  uint64_t v23 = 1LL;
  uint64_t v24 = 1236LL;
LABEL_22:
  (&self->super.isa)[v24] = (Class)((char *)(&self->super.isa)[v24] + v23);
  [v13 objectForKey:@"ROAMEDEVENT_FLAGS"];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = v25;
  if (v25) {
    self->_roamIsWNMScoreUsedCount += ((unint64_t)[v25 unsignedIntegerValue] >> 6) & 1;
  }

LABEL_25:
}

- (void)roamingARConfigurationDidChange:(id *)a3
{
  currentBssSession = self->_currentBssSession;
  __int128 v4 = *(_OWORD *)&a3->var5;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  -[WiFiUsageBssSession roamingARConfigurationDidChange:](currentBssSession, "roamingARConfigurationDidChange:", v5);
}

- (void)roamingConfigurationDidChange:(int64_t)a3 withChannelList:(id)a4
{
}

- (void)updateRssiDiffStats:(id *)a3 For:(id)a4
{
  id v6 = a4;
  int64_t var3 = a3->var3;
  int64_t var0 = a3->var0;
  [NSString stringWithFormat:@"roamNeighsSmllst%@RssiByBandTransition", v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession valueForKey:](self, "valueForKey:", v9);
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = v10;
  if (v10)
  {
    [v10 integerByBandTransitionValue];
  }

  else
  {
    uint64_t v41 = 0LL;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v36 = 0u;
  }

  int64_t v12 = var3 - var0;

  uint64_t var1 = a3->var1;
  uint64_t var5 = a3->var5;
  uint64_t v15 = (char *)&v36 + 3 * var1 + var5;
  int v17 = v15[72];
  __int128 v16 = v15 + 72;
  if (!v17 || v12 < *((void *)&v36 + 3 * var1 + var5))
  {
    *((void *)&v36 + 3 * var1 + var5) = v12;
    _BYTE *v16 = 1;
    __int128 v32 = v38;
    __int128 v33 = v39;
    __int128 v34 = v40;
    uint64_t v35 = v41;
    __int128 v30 = v36;
    __int128 v31 = v37;
    [MEMORY[0x189607B18] valuewithIntegerByBandTransition:&v30];
    double v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession setValue:forKey:](self, "setValue:forKey:", v18, v9);
  }

  [NSString stringWithFormat:@"roamNeighsLrgst%@RssiByBandTransition", v6];
  double v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiUsageSession valueForKey:](self, "valueForKey:", v19);
  double v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = v20;
  if (v20)
  {
    [v20 integerByBandTransitionValue];
  }

  else
  {
    uint64_t v35 = 0LL;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v30 = 0u;
  }

  uint64_t v22 = a3->var1;
  uint64_t v23 = a3->var5;
  uint64_t v24 = (char *)&v30 + 3 * v22 + v23;
  int v26 = v24[72];
  uint64_t v25 = v24 + 72;
  if (!v26 || v12 > *((void *)&v30 + 3 * v22 + v23))
  {
    *((void *)&v30 + 3 * v22 + v23) = v12;
    *uint64_t v25 = 1;
    v28[2] = v32;
    v28[3] = v33;
    v28[4] = v34;
    uint64_t v29 = v35;
    v28[0] = v30;
    v28[1] = v31;
    [MEMORY[0x189607B18] valuewithIntegerByBandTransition:v28];
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession setValue:forKey:](self, "setValue:forKey:", v27, v19);
  }
}

- (void)roamCandidatesStatsDidUpdate:(id *)a3
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  [a3->var7 allKeys];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v57;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_roamNeighborsByBand, "objectForKey:", v9);
        double v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          double v10 = (void *)objc_opt_new();
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_roamNeighborsByBand,  "setObject:forKeyedSubscript:",  v10,  v9);
        }

        [a3->var7 objectForKeyedSubscript:v9];
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 allObjects];
        int64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 addObjectsFromArray:v12];
      }

      uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
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
  if (a3->var2 == a3->var0) {
    ++self->_currentRSSIStrongestCount;
  }
  uint64_t var4 = a3->var4;
  double v20 = &(&self->super.isa)[var4];
  v20[1439] = (Class)((char *)v20[1439] + 1);
  id v21 = (char *)self + var4;
  v21[11536] = 1;
  v20[1443] = (Class)a3->var2;
  v21[11568] = 1;
  int64_t var0 = a3->var0;
  if (a3->var0 >= -94)
  {
    int64_t var3 = a3->var3;
    if (var3 >= -94)
    {
      if (var3 <= var0) {
        uint64_t v24 = &v55;
      }
      else {
        uint64_t v24 = &v54;
      }
      if (var3 <= var0) {
        uint64_t v25 = @"CurrentToNextBest";
      }
      else {
        uint64_t v25 = @"CurrentToBest";
      }
      __int128 v26 = *(_OWORD *)&a3->var2;
      *(_OWORD *)uint64_t v24 = *(_OWORD *)&a3->var0;
      *((_OWORD *)v24 + 1) = v26;
      *((_OWORD *)v24 + 2) = *(_OWORD *)&a3->var4;
      *((void *)v24 + 6) = a3->var7;
      *((void *)v24 + 7) = a3->var8;
      v24[64] = a3->var9;
      -[WiFiUsageSession updateRssiDiffStats:For:](self, "updateRssiDiffStats:For:", v24, v25);
    }
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  [a3->var7 allKeys];
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v49;
    do
    {
      for (uint64_t j = 0LL; j != v28; ++j)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(v27);
        }
        __int128 v31 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        unint64_t v32 = [v31 unsignedIntegerValue];
        if (v32 <= 3)
        {
          [a3->var7 objectForKeyedSubscript:v31];
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
          *((void *)&v52 + v32) = [v33 count];

          *((_BYTE *)&v53 + v32 + 8) = 1;
        }
      }

      uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }

    while (v28);
  }

  v47[0] = v52;
  v47[1] = v53;
  +[IntegerByBandObj integerByBandWith:withCap:](&OBJC_CLASS___IntegerByBandObj, "integerByBandWith:withCap:", v47, 1LL);
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = 1252LL;
  if (!a3->var9) {
    uint64_t v35 = 1253LL;
  }
  __int128 v36 = (&self->super.isa)[v35];
  -[objc_class objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v34);
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    __int128 v37 = (void *)objc_opt_new();
    -[objc_class setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v37, v34);
  }

  [v37 increment];
  currentBssSession = self->_currentBssSession;
  __int128 v39 = *(_OWORD *)&a3->var2;
  v43[0] = *(_OWORD *)&a3->var0;
  v43[1] = v39;
  v43[2] = *(_OWORD *)&a3->var4;
  id v40 = a3->var7;
  id v44 = v40;
  id v41 = a3->var8;
  id v45 = v41;
  BOOL var9 = a3->var9;
  if (currentBssSession)
  {
    -[WiFiUsageBssSession roamCandidatesStatsDidUpdate:](currentBssSession, "roamCandidatesStatsDidUpdate:", v43);
  }

  else
  {
    v42 = v41;
  }
}

- (void)roamCacheDidUpdate:(id)a3
{
}

- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6
{
  BOOL v8 = a3;
  id v14 = a5;
  id v10 = a6;
  [MEMORY[0x189603F50] date];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v12 = v11;
  if (v8)
  {
    -[WiFiUsageSession setScanningActiveTime:](self, "setScanningActiveTime:", v11);
    ++self->_inScanEventCount;
    if (a4 - 1 <= 0x19) {
      ++self->_perClientScanCount[a4];
    }
    if ((a4 - 1 < 7 || a4 - 20 <= 1)
      && self->_joinScanLatencyFromDriverAvailability == 0.0
      && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinScanLatencyFromDriverAvailability:](self, "setJoinScanLatencyFromDriverAvailability:");
    }
  }

  else if (self->_scanningActiveTime)
  {
    objc_msgSend(v11, "timeIntervalSinceDate:");
    self->_inScanDuration = v13 + self->_inScanDuration;
    -[WiFiUsageSession setScanningActiveTime:](self, "setScanningActiveTime:", 0LL);
  }

  -[WiFiUsageBssSession scanningStateDidChange:client:neighborBSS:otherBSS:]( self->_currentBssSession,  "scanningStateDidChange:client:neighborBSS:otherBSS:",  v8,  a4,  v14,  v10);
}

- (void)powerStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_poweredOn = v3;
  ++self->_powerStateChangedCount;
  lastPowerStateChangedTime = self->_lastPowerStateChangedTime;
  id v10 = v5;
  if (v3)
  {
    [v5 timeIntervalSinceDate:lastPowerStateChangedTime];
    id v7 = v10;
    if (v8 < 5.0) {
      ++self->_powerToggleEventCount;
    }
  }

  else
  {
    id v7 = v5;
    if (lastPowerStateChangedTime)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      id v7 = v10;
      self->_poweredOnDuration = v9 + self->_poweredOnDuration;
    }
  }

  -[WiFiUsageSession setLastPowerStateChangedTime:](self, "setLastPowerStateChangedTime:", v7);
}

- (void)controlCenterStateDidChange:(BOOL)a3 withKnownLocation:(BOOL)a4
{
  BOOL v4 = a3;
  objc_msgSend(MEMORY[0x189603F50], "date", a3, a4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  self->_controlCenterEnabled = v4;
  ++self->_controlCenterStateChangedCount;
  id v10 = v6;
  if (v4)
  {
    [v6 timeIntervalSinceDate:self->_lastControlCenterStateChangedTime];
    if (v8 < 5.0) {
      ++self->_controlCenterToggleEventCount;
    }
    id v7 = v10;
    if (self->_lastControlCenterStateChangedTime)
    {
      objc_msgSend(v10, "timeIntervalSinceDate:");
      id v7 = v10;
      self->_inControlCenterAutoJoinDisabledDuration = v9 + self->_inControlCenterAutoJoinDisabledDuration;
    }
  }

  -[WiFiUsageSession setLastControlCenterStateChangedTime:](self, "setLastControlCenterStateChangedTime:", v7);
}

- (void)cellularDataStatusDidChange:(id)a3 inAirplaneMode:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_airplaneModeEnabled != a4) {
    ++self->_airplaneModeStateChangedCount;
  }
  id v6 = a3;
  -[WiFiUsageSession setAirplaneModeEnabled:](self, "setAirplaneModeEnabled:", v4);
  -[WiFiUsageSession setCellularDataStatus:](self, "setCellularDataStatus:", v6);
}

- (void)cellularFallbackStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  self->_cellularFallbackEnabled = v3;
  ++self->_cellularFallbackStateChangedCount;
  id v8 = v5;
  if (!v3 && self->_lastCellularFallbackStateChangedTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    id v6 = v8;
    self->_inCellularFallbackDuration = v7 + self->_inCellularFallbackDuration;
  }

  -[WiFiUsageSession setLastCellularFallbackStateChangedTime:](self, "setLastCellularFallbackStateChangedTime:", v6);
  -[WiFiUsageBssSession cellularFallbackStateDidChange:]( self->_currentBssSession,  "cellularFallbackStateDidChange:",  v3);
}

- (void)cellularOutrankingStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  self->_cellularOutrankingEnabled = v3;
  id v8 = v5;
  if (!v3)
  {
    ++self->_cellularOutrankingStateChangedCount;
    if (self->_lastCellularOutrankingStateChangedTime)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      id v6 = v8;
      self->_inCellularOutrankingDuration = v7 + self->_inCellularOutrankingDuration;
    }
  }

  -[WiFiUsageSession setLastCellularOutrankingStateChangedTime:](self, "setLastCellularOutrankingStateChangedTime:", v6);
  -[WiFiUsageBssSession cellularOutrankingStateDidChange:]( self->_currentBssSession,  "cellularOutrankingStateDidChange:",  v3);
}

- (void)faultEventDetected:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 - 1 <= 0x20) {
    ++self->_faultReasonCount[a3];
  }
  if (a3 == 7)
  {
LABEL_6:
    -[WiFiUsageSession setLastChipResetTime:](self, "setLastChipResetTime:", v5);
    if (self->_driverAvailabilityLifespan == 0.0)
    {
      [v5 timeIntervalSinceDate:self->_lastDriverAvailableTime];
      -[WiFiUsageSession setDriverAvailabilityLifespan:](self, "setDriverAvailabilityLifespan:");
    }

    goto LABEL_10;
  }

  if (a3 != 24)
  {
    if (a3 != 21) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }

  -[WiFiUsageSession setLastDriverTerminationTime:](self, "setLastDriverTerminationTime:", v5);
  if (self->_driverProcessLifespan == 0.0)
  {
    [v5 timeIntervalSinceDate:self->_lastDriverAvailableTime];
    -[WiFiUsageSession setDriverProcessLifespan:](self, "setDriverProcessLifespan:");
  }

- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5
{
  if (!a3)
  {
    if (!a4) {
      goto LABEL_3;
    }
LABEL_7:
    ++self->_triggerDisconnectConfirmedCount;
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  ++self->_triggerDisconnectAlertedCount;
  if (a4) {
    goto LABEL_7;
  }
LABEL_3:
  if (a5) {
LABEL_4:
  }
    ++self->_triggerDisconnectExecutedCount;
LABEL_5:
  -[WiFiUsageBssSession triggerDisconnectAlerted:confirmed:executed:]( self->_currentBssSession,  "triggerDisconnectAlerted:confirmed:executed:");
}

- (void)tdLogic_alertedBy:(int)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!self->_isInTDEval)
  {
    ++self->_tdEvalStartedCount;
    +[WiFiUsagePrivacyFilter getLabelForTDTrigger:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForTDTrigger:",  *(void *)&a3);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[WiFiUsageSession incrementCountWithPrefix:name:]( self,  "incrementCountWithPrefix:name:",  @"tdEvalStartedBy",  v4)
      && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      id v6 = "-[WiFiUsageSession tdLogic_alertedBy:]";
      __int16 v7 = 2112;
      id v8 = v4;
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - tdEval started by %@ but no counter for this trigger in %@",  (uint8_t *)&v5,  0x20u);
    }

    -[WiFiUsageSession setIsInTDEval:](self, "setIsInTDEval:", 1LL);
  }

- (void)tdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6
{
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:a4];
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:a5];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s: TDEval ended upon %@ (evalTime:%@s, rssi:%@)",  "-[WiFiUsageSession tdLogic_end:evalTime:rssi:roamTime:]",  v11,  v9,  v10);

  -[WiFiUsageSession setIsInTDEval:](self, "setIsInTDEval:", 0LL);
  ++self->_tdEvalEndedCount;
  self->_tdEvalCumulativeDuration = self->_tdEvalCumulativeDuration + a4;
}

- (BOOL)incrementCountWithPrefix:(id)a3 name:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = &stru_18A170410;
    if (v6) {
      id v8 = v6;
    }
    [NSString stringWithFormat:@"%@%@Count", v8, v7];
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession valueForKey:](self, "valueForKey:", v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v11 = [v10 unsignedIntegerValue];
      [MEMORY[0x189607968] numberWithUnsignedInteger:v11 + 1];
      int64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession setValue:forKey:](self, "setValue:forKey:", v12, v9);
    }

    BOOL v13 = 1;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)countWithPrefix:(id)a3 name:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = &stru_18A170410;
    if (v6) {
      id v8 = v6;
    }
    [NSString stringWithFormat:@"%@%@Count", v8, v7];
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession valueForKey:](self, "valueForKey:", v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (void)poorLinkSessionStats:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    ++self->_inPoorLinkSessionCount;
    [v5 sessionDuration];
    self->_inPoorLinkSessionDuration = v6 + self->_inPoorLinkSessionDuration;
    if (self->_lastJoinWhileDeferForTD && [v5 tdExecuted])
    {
      ++self->_tdAfterJoinAfterTDCount;
      unint64_t v7 = self->_current_subsequentTdAfterJoinAfterTDCount + 1;
      self->_unint64_t current_subsequentTdAfterJoinAfterTDCount = v7;
      if (self->_max_subsequentTdAfterJoinAfterTDCount < v7) {
        self->_max_subsequentTdAfterJoinAfterTDCount = v7;
      }
    }

    else
    {
      unint64_t current_subsequentTdAfterJoinAfterTDCount = self->_current_subsequentTdAfterJoinAfterTDCount;
      if (current_subsequentTdAfterJoinAfterTDCount)
      {
        if (self->_min_subsequentTdAfterJoinAfterTDCount > current_subsequentTdAfterJoinAfterTDCount) {
          self->_min_subsequentTdAfterJoinAfterTDCount = current_subsequentTdAfterJoinAfterTDCount;
        }
        self->_unint64_t current_subsequentTdAfterJoinAfterTDCount = 0LL;
      }
    }

    +[WiFiUsagePoorLinkSession sessionStartedBy:]( WiFiUsagePoorLinkSession,  "sessionStartedBy:",  [v5 sessionStartedBy]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = -[WiFiUsageSession incrementCountWithPrefix:name:]( self,  "incrementCountWithPrefix:name:",  @"tdSessionStartedBy",  v9);

    if (!v10 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      +[WiFiUsagePoorLinkSession sessionStartedBy:]( WiFiUsagePoorLinkSession,  "sessionStartedBy:",  [v5 sessionStartedBy]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 136315906;
      BOOL v13 = "-[WiFiUsageSession poorLinkSessionStats:]";
      __int16 v14 = 2112;
      unint64_t v15 = v11;
      __int16 v16 = 1024;
      int v17 = [v5 sessionStartedBy];
      __int16 v18 = 2112;
      double v19 = self;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - tdSession started by %@ (%u) but no counter for this trigger in %@",  (uint8_t *)&v12,  0x26u);
    }

    self->_lastJoinWhileDeferForTD = [v5 nextJoinWhileDeferJoin];
  }
}

- (void)rangingCompleted
{
}

- (void)sessionDidStart
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive")
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "-[WiFiUsageSession sessionDidStart]";
    __int16 v15 = 2112;
    __int16 v16 = self;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s on %@ -- Warning! active session is being RE-started",  (uint8_t *)&v13,  0x16u);
  }

  [MEMORY[0x189603F50] date];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setSessionDuration:](self, "setSessionDuration:", 0.0);
  -[WiFiUsageSession setSystemAwakeDuration:](self, "setSystemAwakeDuration:", 0.0);
  -[WiFiUsageSession setMediaPlaybackDuration:](self, "setMediaPlaybackDuration:", 0.0);
  -[WiFiUsageSession setChargingDuration:](self, "setChargingDuration:", 0.0);
  -[WiFiUsageSession setInCallDuration:](self, "setInCallDuration:", 0.0);
  -[WiFiUsageSession setInVehicleDuration:](self, "setInVehicleDuration:", 0.0);
  -[WiFiUsageSession setInMotionDuration:](self, "setInMotionDuration:", 0.0);
  -[WiFiUsageSession setInA2dpDuration:](self, "setInA2dpDuration:", 0.0);
  -[WiFiUsageSession setInScoDuration:](self, "setInScoDuration:", 0.0);
  -[WiFiUsageSession setInHidPresentDuration:](self, "setInHidPresentDuration:", 0.0);
  -[WiFiUsageSession setInAwdlDuration:](self, "setInAwdlDuration:", 0.0);
  -[WiFiUsageSession setInRoamDuration:](self, "setInRoamDuration:", 0.0);
  -[WiFiUsageSession setInScanDuration:](self, "setInScanDuration:", 0.0);
  -[WiFiUsageSession setPoweredOnDuration:](self, "setPoweredOnDuration:", 0.0);
  -[WiFiUsageSession setAssociatedDuration:](self, "setAssociatedDuration:", 0.0);
  -[WiFiUsageSession setAssociatedSleepDuration:](self, "setAssociatedSleepDuration:", 0.0);
  -[WiFiUsageSession setInCellularFallbackDuration:](self, "setInCellularFallbackDuration:", 0.0);
  -[WiFiUsageSession setInCellularOutrankingDuration:](self, "setInCellularOutrankingDuration:", 0.0);
  -[WiFiUsageSession setInSoftApDuration:](self, "setInSoftApDuration:", 0.0);
  *(_OWORD *)self->_bandUsageDuration.valueByBand = 0u;
  *(_OWORD *)&self->_bandUsageDuration.valueByBand[2] = 0u;
  -[WiFiUsageSession setInControlCenterAutoJoinDisabledDuration:]( self,  "setInControlCenterAutoJoinDisabledDuration:",  0.0);
  -[WiFiUsageSession setCompanionConnectedDuration:](self, "setCompanionConnectedDuration:", 0.0);
  -[WiFiUsageSession setInWowStateDuration:](self, "setInWowStateDuration:", 0.0);
  -[WiFiUsageSession setInLpasStateDuration:](self, "setInLpasStateDuration:", 0.0);
  -[WiFiUsageSession setInLowPowerStateDuration:](self, "setInLowPowerStateDuration:", 0.0);
  -[WiFiUsageSession setInBatterySaverStateDuration:](self, "setInBatterySaverStateDuration:", 0.0);
  -[WiFiUsageSession setLinkRecoveryDisabledDuration:](self, "setLinkRecoveryDisabledDuration:", 0.0);
  -[WiFiUsageSession setSleepPowerStatsTotalDuration:](self, "setSleepPowerStatsTotalDuration:", 0.0);
  -[WiFiUsageSession setSleepPowerStatsUnassociatedDuration:](self, "setSleepPowerStatsUnassociatedDuration:", 0.0);
  -[WiFiUsageSession setSleepPowerStatsAssociatedDuration:](self, "setSleepPowerStatsAssociatedDuration:", 0.0);
  -[WiFiUsageSession setSleepPowerStatsRoamingDuration:](self, "setSleepPowerStatsRoamingDuration:", 0.0);
  -[WiFiUsageSession setMediaPlaybackEventCount:](self, "setMediaPlaybackEventCount:", 0LL);
  -[WiFiUsageSession setChargingEventCount:](self, "setChargingEventCount:", 0LL);
  -[WiFiUsageSession setInCallEventCount:](self, "setInCallEventCount:", 0LL);
  -[WiFiUsageSession setInVehicleEventCount:](self, "setInVehicleEventCount:", 0LL);
  -[WiFiUsageSession setInMotionEventCount:](self, "setInMotionEventCount:", 0LL);
  -[WiFiUsageSession setInA2dpEventCount:](self, "setInA2dpEventCount:", 0LL);
  -[WiFiUsageSession setInScoEventCount:](self, "setInScoEventCount:", 0LL);
  -[WiFiUsageSession setInHidPresentCount:](self, "setInHidPresentCount:", 0LL);
  -[WiFiUsageSession setInAwdlEventCount:](self, "setInAwdlEventCount:", 0LL);
  -[WiFiUsageSession setInRoamEventCount:](self, "setInRoamEventCount:", 0LL);
  -[WiFiUsageSession setInScanEventCount:](self, "setInScanEventCount:", 0LL);
  -[WiFiUsageSession setRangingEventCount:](self, "setRangingEventCount:", 0LL);
  -[WiFiUsageSession setCompanionConnectionStateChangedCount:](self, "setCompanionConnectionStateChangedCount:", 0LL);
  -[WiFiUsageSession setLinkRecoveryDisabledCount:](self, "setLinkRecoveryDisabledCount:", 0LL);
  -[WiFiUsageSession setWowStateChangedCount:](self, "setWowStateChangedCount:", 0LL);
  -[WiFiUsageSession setLpasStateChangedCount:](self, "setLpasStateChangedCount:", 0LL);
  -[WiFiUsageSession setLowPowerStateChangedCount:](self, "setLowPowerStateChangedCount:", 0LL);
  -[WiFiUsageSession setBatterySaverStateChangedCount:](self, "setBatterySaverStateChangedCount:", 0LL);
  -[WiFiUsageSession setSystemWakeStateChangedCount:](self, "setSystemWakeStateChangedCount:", 0LL);
  -[WiFiUsageSession setSystemWokenByWiFiCount:](self, "setSystemWokenByWiFiCount:", 0LL);
  -[WiFiUsageSession setLockStateChangedCount:](self, "setLockStateChangedCount:", 0LL);
  -[WiFiUsageSession setDisplayStateChangedCount:](self, "setDisplayStateChangedCount:", 0LL);
  -[WiFiUsageSession setJoinStateChangedCount:](self, "setJoinStateChangedCount:", 0LL);
  -[WiFiUsageSession setNetworkChangedCount:](self, "setNetworkChangedCount:", 0LL);
  -[WiFiUsageSession setLinkStateChangedCount:](self, "setLinkStateChangedCount:", 0LL);
  -[WiFiUsageSession setRapidLinkTransitionCount:](self, "setRapidLinkTransitionCount:", 0LL);
  -[WiFiUsageSession setPrimaryInterfaceStateChangeCount:](self, "setPrimaryInterfaceStateChangeCount:", 0LL);
  -[WiFiUsageSession setApplicationStateChangedCount:](self, "setApplicationStateChangedCount:", 0LL);
  -[WiFiUsageSession setPowerStateChangedCount:](self, "setPowerStateChangedCount:", 0LL);
  -[WiFiUsageSession setPowerToggleEventCount:](self, "setPowerToggleEventCount:", 0LL);
  -[WiFiUsageSession setControlCenterStateChangedCount:](self, "setControlCenterStateChangedCount:", 0LL);
  -[WiFiUsageSession setControlCenterToggleEventCount:](self, "setControlCenterToggleEventCount:", 0LL);
  -[WiFiUsageSession setCellularFallbackStateChangedCount:](self, "setCellularFallbackStateChangedCount:", 0LL);
  -[WiFiUsageSession setCellularOutrankingStateChangedCount:](self, "setCellularOutrankingStateChangedCount:", 0LL);
  -[WiFiUsageSession setSmartCoverStateChangedCount:](self, "setSmartCoverStateChangedCount:", 0LL);
  -[WiFiUsageSession setNeighborBssCount:](self, "setNeighborBssCount:", 0LL);
  -[WiFiUsageSession setOtherBssCount:](self, "setOtherBssCount:", 0LL);
  +[WiFiUsageInterfaceStats statsForInterfaceName:]( &OBJC_CLASS___WiFiUsageInterfaceStats,  "statsForInterfaceName:",  self->_interfaceName);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setIfStatsAtStart:](self, "setIfStatsAtStart:", v4);

  +[WiFiUsageInterfaceStats statsForInterfaceName:]( &OBJC_CLASS___WiFiUsageInterfaceStats,  "statsForInterfaceName:",  self->_secondaryInterfaceName);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setSecondaryIfStatsAtStart:](self, "setSecondaryIfStatsAtStart:", v5);

  -[WiFiUsageSession setActiveApplications:](self, "setActiveApplications:", 0LL);
  -[WiFiUsageSession setTriggerDisconnectAlertedCount:](self, "setTriggerDisconnectAlertedCount:", 0LL);
  -[WiFiUsageSession setTriggerDisconnectConfirmedCount:](self, "setTriggerDisconnectConfirmedCount:", 0LL);
  -[WiFiUsageSession setTriggerDisconnectExecutedCount:](self, "setTriggerDisconnectExecutedCount:", 0LL);
  -[WiFiUsageSession setIsInTDEval:](self, "setIsInTDEval:", 0LL);
  self->_perClientScanCount[26] = 0LL;
  *(_OWORD *)&self->_perClientScanCount[24] = 0u;
  *(_OWORD *)&self->_perClientScanCount[22] = 0u;
  *(_OWORD *)&self->_perClientScanCount[20] = 0u;
  *(_OWORD *)&self->_perClientScanCount[18] = 0u;
  *(_OWORD *)&self->_perClientScanCount[16] = 0u;
  *(_OWORD *)&self->_perClientScanCount[14] = 0u;
  *(_OWORD *)&self->_perClientScanCount[12] = 0u;
  *(_OWORD *)&self->_perClientScanCount[10] = 0u;
  *(_OWORD *)&self->_perClientScanCount[8] = 0u;
  *(_OWORD *)&self->_perClientScanCount[6] = 0u;
  *(_OWORD *)&self->_perClientScanCount[4] = 0u;
  *(_OWORD *)&self->_perClientScanCount[2] = 0u;
  *(_OWORD *)self->_perClientScanCount = 0u;
  *(_OWORD *)self->_faultReasonCount = 0u;
  *(_OWORD *)&self->_faultReasonCount[2] = 0u;
  *(_OWORD *)&self->_faultReasonCount[4] = 0u;
  *(_OWORD *)&self->_faultReasonCount[6] = 0u;
  *(_OWORD *)&self->_faultReasonCount[8] = 0u;
  *(_OWORD *)&self->_faultReasonCount[10] = 0u;
  *(_OWORD *)&self->_faultReasonCount[12] = 0u;
  *(_OWORD *)&self->_faultReasonCount[14] = 0u;
  *(_OWORD *)&self->_faultReasonCount[16] = 0u;
  *(_OWORD *)&self->_faultReasonCount[18] = 0u;
  *(_OWORD *)&self->_faultReasonCount[20] = 0u;
  *(_OWORD *)&self->_faultReasonCount[22] = 0u;
  *(_OWORD *)&self->_faultReasonCount[24] = 0u;
  *(_OWORD *)&self->_faultReasonCount[26] = 0u;
  *(_OWORD *)&self->_faultReasonCount[28] = 0u;
  *(_OWORD *)&self->_faultReasonCount[30] = 0u;
  self->_joinReasonCount[14] = 0LL;
  *(_OWORD *)&self->_joinReasonCount[10] = 0u;
  *(_OWORD *)&self->_joinReasonCount[12] = 0u;
  *(_OWORD *)&self->_joinReasonCount[6] = 0u;
  *(_OWORD *)&self->_joinReasonCount[8] = 0u;
  *(_OWORD *)&self->_joinReasonCount[2] = 0u;
  *(_OWORD *)&self->_joinReasonCount[4] = 0u;
  *(_OWORD *)&self->_faultReasonCount[32] = 0u;
  *(_OWORD *)self->_joinReasonCount = 0u;
  disconnectReasonMap = self->_disconnectReasonMap;
  if (disconnectReasonMap)
  {
    -[NSMutableDictionary removeAllObjects](disconnectReasonMap, "removeAllObjects");
  }

  else
  {
    unint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v8 = self->_disconnectReasonMap;
    self->_disconnectReasonMap = v7;
  }

  -[WiFiUsageSession setIsSessionActive:](self, "setIsSessionActive:", 1LL);
  -[WiFiUsageSession setLastPowerBudgetChangedTime:](self, "setLastPowerBudgetChangedTime:", v3);
  -[WiFiUsageSession setPowerBudgetMaxDuration:](self, "setPowerBudgetMaxDuration:", 0.0);
  -[WiFiUsageSession setPowerBudget90Duration:](self, "setPowerBudget90Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget80Duration:](self, "setPowerBudget80Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget70Duration:](self, "setPowerBudget70Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget60Duration:](self, "setPowerBudget60Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget50Duration:](self, "setPowerBudget50Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget40Duration:](self, "setPowerBudget40Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget30Duration:](self, "setPowerBudget30Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget20Duration:](self, "setPowerBudget20Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget10Duration:](self, "setPowerBudget10Duration:", 0.0);
  -[WiFiUsageSession setPowerBudgetMinDuration:](self, "setPowerBudgetMinDuration:", 0.0);
  -[WiFiUsageSession setThermalIndexMaxDuration:](self, "setThermalIndexMaxDuration:", 0.0);
  -[WiFiUsageSession setThermalIndex90Duration:](self, "setThermalIndex90Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex80Duration:](self, "setThermalIndex80Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex70Duration:](self, "setThermalIndex70Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex60Duration:](self, "setThermalIndex60Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex50Duration:](self, "setThermalIndex50Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex40Duration:](self, "setThermalIndex40Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex30Duration:](self, "setThermalIndex30Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex20Duration:](self, "setThermalIndex20Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex10Duration:](self, "setThermalIndex10Duration:", 0.0);
  -[WiFiUsageSession setThermalIndexMinDuration:](self, "setThermalIndexMinDuration:", 0.0);
  -[WiFiUsageSession setRoamReasonInitialAssociationCount:](self, "setRoamReasonInitialAssociationCount:", 0LL);
  -[WiFiUsageSession setRoamReasonLowRssiCount:](self, "setRoamReasonLowRssiCount:", 0LL);
  -[WiFiUsageSession setRoamReasonDeauthDisassocCount:](self, "setRoamReasonDeauthDisassocCount:", 0LL);
  -[WiFiUsageSession setRoamReasonBeaconLostCount:](self, "setRoamReasonBeaconLostCount:", 0LL);
  -[WiFiUsageSession setRoamReasonSteeredByApCount:](self, "setRoamReasonSteeredByApCount:", 0LL);
  -[WiFiUsageSession setRoamReasonSteeredByBtmCount:](self, "setRoamReasonSteeredByBtmCount:", 0LL);
  -[WiFiUsageSession setRoamReasonSteeredByCsaCount:](self, "setRoamReasonSteeredByCsaCount:", 0LL);
  -[WiFiUsageSession setRoamReasonReassocRequestedCount:](self, "setRoamReasonReassocRequestedCount:", 0LL);
  -[WiFiUsageSession setRoamReasonHostTriggeredCount:](self, "setRoamReasonHostTriggeredCount:", 0LL);
  -[WiFiUsageSession setRoamReasonBetterCandidateCount:](self, "setRoamReasonBetterCandidateCount:", 0LL);
  -[WiFiUsageSession setRoamReasonBetterConditionCount:](self, "setRoamReasonBetterConditionCount:", 0LL);
  -[WiFiUsageSession setRoamReasonMiscCount:](self, "setRoamReasonMiscCount:", 0LL);
  -[WiFiUsageSession setRoamStatusSucceededCount:](self, "setRoamStatusSucceededCount:", 0LL);
  -[WiFiUsageSession setRoamStatusFailedCount:](self, "setRoamStatusFailedCount:", 0LL);
  -[WiFiUsageSession setRoamStatusNoCandidateCount:](self, "setRoamStatusNoCandidateCount:", 0LL);
  -[WiFiUsageSession setRoamStatusNoQualifiedCandidateCount:](self, "setRoamStatusNoQualifiedCandidateCount:", 0LL);
  -[WiFiUsageSession setRoamStatusFailedNoScan:](self, "setRoamStatusFailedNoScan:", 0LL);
  -[WiFiUsageSession setRoamIsWNMScoreUsedCount:](self, "setRoamIsWNMScoreUsedCount:", 0LL);
  -[WiFiUsageSession setRoamPingPongAboveThresholdCount:](self, "setRoamPingPongAboveThresholdCount:", 0LL);
  -[WiFiUsageSession setRoamPingPongAboveThresholdCount:](self, "setRoamPingPongAboveThresholdCount:", 0LL);
  -[WiFiUsageSession setRoamPingPongAboveThresholdCountLowRssiOnly:]( self,  "setRoamPingPongAboveThresholdCountLowRssiOnly:",  0LL);
  -[WiFiUsageSession setRoamPingPongLowRssiAndReassocOnly:](self, "setRoamPingPongLowRssiAndReassocOnly:", 0LL);
  -[WiFiUsageSession setRoamPingPongReassocOnly:](self, "setRoamPingPongReassocOnly:", 0LL);
  -[WiFiUsageSession setRoamsAfterSupprLifted:](self, "setRoamsAfterSupprLifted:", 0LL);
  -[WiFiUsageSession setIsRoamSuppressionEnabled:](self, "setIsRoamSuppressionEnabled:", 0LL);
  -[WiFiUsageSession setLastRoamSuppressionToggled:](self, "setLastRoamSuppressionToggled:", 0LL);
  -[WiFiUsageSession setInRoamSuppressionEnabled:](self, "setInRoamSuppressionEnabled:", 0.0);
  -[WiFiUsageSession setInRoamSuppressionEnabledCount:](self, "setInRoamSuppressionEnabledCount:", 0LL);
  -[WiFiUsageSession setInRoamSuppressionWaitForRoamStart:](self, "setInRoamSuppressionWaitForRoamStart:", 0.0);
  -[WiFiUsageSession setInRoamSuppressionWaitForRoamEnd:](self, "setInRoamSuppressionWaitForRoamEnd:", 0.0);
  -[WiFiUsageSession setMinCandidatesCount:](self, "setMinCandidatesCount:", 0LL);
  -[WiFiUsageSession setMaxCandidatesCount:](self, "setMaxCandidatesCount:", 0LL);
  -[WiFiUsageSession setCurrentRSSIStrongestCount:](self, "setCurrentRSSIStrongestCount:", 0LL);
  -[NSMutableDictionary removeAllObjects](self->_roamNeighborsByBand, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_roamCandidatesPerBandWhenSuccessful, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_roamCandidatesPerBandWhenUnSuccessful, "removeAllObjects");
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = 0u;
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = 0u;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(void *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2] = 0LL;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(void *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2] = 0LL;
  *(void *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2] = 0LL;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(void *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2] = 0LL;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = 0u;
  if (self->_sessionEndTime)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    -[WiFiUsageSession setSessionTimeSinceLastSession:](self, "setSessionTimeSinceLastSession:");
  }

  lqm = self->_lqm;
  if (lqm) {
    -[WiFiUsageSessionLQM reset](lqm, "reset");
  }
  -[WiFiUsageSession setSessionStartTime:](self, "setSessionStartTime:", v3);
  -[WiFiUsageSession setSessionEndTime:](self, "setSessionEndTime:", 0LL);
  -[WiFiUsageSession setDriverUnavailabilityCount:](self, "setDriverUnavailabilityCount:", 0LL);
  -[WiFiUsageSession trackEventLatencies](self, "trackEventLatencies");
  -[WiFiUsageSession setIsCompatibilityModeEnabledAtStart:]( self,  "setIsCompatibilityModeEnabledAtStart:",  self->_isCompatibilityModeEnabled);
  -[WiFiUsageSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", v3);
  -[WiFiUsageSession setCompatibilityModeChangeCount:](self, "setCompatibilityModeChangeCount:", 0LL);
  -[WiFiUsageSession setInCompatibilityModeEnabledDuration:](self, "setInCompatibilityModeEnabledDuration:", 0.0);
  -[WiFiUsageSession setNetworkDetailsAtEnd:](self, "setNetworkDetailsAtEnd:", 0LL);
  -[WiFiUsageSession setIpV4DetailsPrevSession:](self, "setIpV4DetailsPrevSession:", self->_ipV4Details);
  -[WiFiUsageSession setIpV4Details:](self, "setIpV4Details:", 0LL);
  -[WiFiUsageSession setIpV6DetailsPrevSession:](self, "setIpV6DetailsPrevSession:", self->_ipV6Details);
  -[WiFiUsageSession setIpV6Details:](self, "setIpV6Details:", 0LL);
  -[WiFiUsageSession setBandAtSessionStart:](self, "setBandAtSessionStart:", self->_currentBand);
  -[WiFiUsageSession setIsAssociatedAtSessionStart:](self, "setIsAssociatedAtSessionStart:", self->_isAssociated);
  -[WiFiUsageSession setInCoexRealTimeAtSessionStart:](self, "setInCoexRealTimeAtSessionStart:", self->_inCoexRealTime);
  -[WiFiUsageSession setRssiAtSessionStart:](self, "setRssiAtSessionStart:", 0x7FFFFFFFFFFFFFFFLL);
  -[WiFiUsageSession setCountRoamScan:](self, "setCountRoamScan:", 0LL);
  -[WiFiUsageSession setLastRoamScanFoundSSIDTransitionTarget:](self, "setLastRoamScanFoundSSIDTransitionTarget:", 0LL);
  -[WiFiUsageSession setCountSSIDTransitionTargetInLastRoamScan:]( self,  "setCountSSIDTransitionTargetInLastRoamScan:",  0LL);
  -[WiFiUsageSession setCountRoamScanThatFoundSSIDTransitionTarget:]( self,  "setCountRoamScanThatFoundSSIDTransitionTarget:",  0LL);
  -[WiFiUsageSession setLastRoamScanFoundSSIDTransitionPotentialCandidate:]( self,  "setLastRoamScanFoundSSIDTransitionPotentialCandidate:",  0LL);
  -[WiFiUsageSession setCountSSIDTransitionPotentialCandidatesInLastRoamScan:]( self,  "setCountSSIDTransitionPotentialCandidatesInLastRoamScan:",  0LL);
  -[WiFiUsageSession setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:]( self,  "setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:",  0LL);
  -[WiFiUsageSession setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:]( self,  "setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:",  0LL);
  -[WiFiUsageSession setLastRoamScanContainsRoamCandidateCount:]( self,  "setLastRoamScanContainsRoamCandidateCount:",  0LL);
  -[WiFiUsageSession setLastRoamScanUniqueChannelsCount:](self, "setLastRoamScanUniqueChannelsCount:", 0LL);
  -[WiFiUsageSession setLastRoamScanUniqueBandsCount:](self, "setLastRoamScanUniqueBandsCount:", 0LL);
  -[WiFiUsageSession setLastSSIDdisable6eModeAtStart:](self, "setLastSSIDdisable6eModeAtStart:", 0LL);
  -[WiFiUsageSession setLastSSIDdisabled6eModeChangeCount:](self, "setLastSSIDdisabled6eModeChangeCount:", 0LL);
  -[WiFiUsageSession setLastSSIDIn6eModeOffDuration:](self, "setLastSSIDIn6eModeOffDuration:", 0.0);
  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setNetworkDisable6eModeAtStart:](self, "setNetworkDisable6eModeAtStart:", v10);

  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11) {
    int v12 = v3;
  }
  else {
    int v12 = 0LL;
  }
  -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", v12);

  -[WiFiUsageSession setInNetwork6eModeOffDuration:](self, "setInNetwork6eModeOffDuration:", 0.0);
  -[WiFiUsageSession setNetwork6eDisabledModeChangeCount:](self, "setNetwork6eDisabledModeChangeCount:", 0LL);
  -[WiFiUsageSession setInPoorLinkSessionCount:](self, "setInPoorLinkSessionCount:", 0LL);
  -[WiFiUsageSession setInPoorLinkSessionDuration:](self, "setInPoorLinkSessionDuration:", 0.0);
  -[WiFiUsageSession setTdAfterJoinAfterTDCount:](self, "setTdAfterJoinAfterTDCount:", 0LL);
  -[WiFiUsageSession setCurrent_subsequentTdAfterJoinAfterTDCount:]( self,  "setCurrent_subsequentTdAfterJoinAfterTDCount:",  0LL);
  -[WiFiUsageSession setMin_subsequentTdAfterJoinAfterTDCount:]( self,  "setMin_subsequentTdAfterJoinAfterTDCount:",  0x7FFFFFFFFFFFFFFFLL);
  -[WiFiUsageSession setMax_subsequentTdAfterJoinAfterTDCount:](self, "setMax_subsequentTdAfterJoinAfterTDCount:", 0LL);
  -[WiFiUsageSession setTdSessionStartedByBadRSSICount:](self, "setTdSessionStartedByBadRSSICount:", 0LL);
  -[WiFiUsageSession setTdSessionStartedByTDRecommendedCount:](self, "setTdSessionStartedByTDRecommendedCount:", 0LL);
  -[WiFiUsageSession setTdSessionStartedBySymptomDNSFailureCount:]( self,  "setTdSessionStartedBySymptomDNSFailureCount:",  0LL);
  -[WiFiUsageSession setTdEvalEndedCount:](self, "setTdEvalEndedCount:", 0LL);
  -[WiFiUsageSession setTdEvalCumulativeDuration:](self, "setTdEvalCumulativeDuration:", 0.0);
  -[WiFiUsageSession setTdEvalStartedCount:](self, "setTdEvalStartedCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedByBadRSSICount:](self, "setTdEvalStartedByBadRSSICount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedBySymptomsARPFailureCount:]( self,  "setTdEvalStartedBySymptomsARPFailureCount:",  0LL);
  -[WiFiUsageSession setTdEvalStartedBySymptomsDNSFailCount:](self, "setTdEvalStartedBySymptomsDNSFailCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedBySymptomsShortFlowCount:](self, "setTdEvalStartedBySymptomsShortFlowCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedBySymptomsDataStallCount:](self, "setTdEvalStartedBySymptomsDataStallCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedBySymptomsDNSStallCount:](self, "setTdEvalStartedBySymptomsDNSStallCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedBySymptomsDNSFailCount:](self, "setTdEvalStartedBySymptomsDNSFailCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedByActiveProbingCount:](self, "setTdEvalStartedByActiveProbingCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedByFGNetwAppChangeCount:](self, "setTdEvalStartedByFGNetwAppChangeCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedByUserNotificationCount:](self, "setTdEvalStartedByUserNotificationCount:", 0LL);
  -[WiFiUsageSession setTdEvalStartedByCheckReassocCount:](self, "setTdEvalStartedByCheckReassocCount:", 0LL);
  -[WiFiUsageSession setLastUsbStatusChange:](self, "setLastUsbStatusChange:", 0LL);
  -[WiFiUsageSession setUsbDeviceEventCount:](self, "setUsbDeviceEventCount:", 0LL);
  -[WiFiUsageSession setUsbInsertedDuration:](self, "setUsbInsertedDuration:", 0.0);
  -[WiFiUsageSession setLastAWDLSequenceUpdate:](self, "setLastAWDLSequenceUpdate:", 0LL);
  -[WiFiUsageSession setInAWDL_BestInfraScoreDuration:](self, "setInAWDL_BestInfraScoreDuration:", 0.0);
  -[WiFiUsageSession setInAWDL_BestP2PScoreDuration:](self, "setInAWDL_BestP2PScoreDuration:", 0.0);
  -[WiFiUsageSession setInAWDL_WorstInfraScoreDuration:](self, "setInAWDL_WorstInfraScoreDuration:", 0.0);
  -[WiFiUsageSession setInAWDL_WorstP2PScoreDuration:](self, "setInAWDL_WorstP2PScoreDuration:", 0.0);
  -[WiFiUsageSession setJoinLinkUpLatencyFromSessionStart:](self, "setJoinLinkUpLatencyFromSessionStart:", 0.0);
  -[WiFiUsageSession setLongestUnassociatedDuration:](self, "setLongestUnassociatedDuration:", 0.0);
  -[WiFiUsageSession setAirplaneModeStateChangedCount:](self, "setAirplaneModeStateChangedCount:", 0LL);
  -[WiFiUsageSession setMaxPhyMode:](self, "setMaxPhyMode:", 0LL);
}

- (void)summarizeSession
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  BOOL v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (self->_sessionStartTime)
  {
    sessionEndTime = self->_sessionEndTime;
    if (!sessionEndTime) {
      sessionEndTime = v3;
    }
    -[NSDate timeIntervalSinceDate:](sessionEndTime, "timeIntervalSinceDate:");
    self->_double sessionDuration = v5;
  }

  if (self->_mediaStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_mediaPlaybackDuration = v6 + self->_mediaPlaybackDuration;
  }

  if (self->_chargingStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_chargingDuration = v7 + self->_chargingDuration;
  }

  if (self->_companionConnectionTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_companionConnectedDuration = v8 + self->_companionConnectedDuration;
  }

  if (self->_wowStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inWowStateDuration = v9 + self->_inWowStateDuration;
  }

  if (self->_lpasStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inLpasStateDuration = v10 + self->_inLpasStateDuration;
  }

  if (self->_lowPowerStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inLowPowerStateDuration = v11 + self->_inLowPowerStateDuration;
  }

  if (self->_batterySaverStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inBatterySaverStateDuration = v12 + self->_inBatterySaverStateDuration;
  }

  if (self->_callStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inCallDuration = v13 + self->_inCallDuration;
  }

  if (self->_inVehicleEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inVehicleDuration = v14 + self->_inVehicleDuration;
  }

  if (self->_inMotionStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inMotionDuration = v15 + self->_inMotionDuration;
  }

  if (self->_a2dpActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v16 + self->_inA2dpDuration;
  }

  if (self->_scoActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inScoDuration = v17 + self->_inScoDuration;
  }

  if (self->_hidPresentTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v18 + self->_inHidPresentDuration;
  }

  if (self->_awdlActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v19 + self->_inAwdlDuration;
  }

  if (self->_roamingActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inRoamDuration = v20 + self->_inRoamDuration;
  }

  if (self->_lastRoamSuppressionToggled && self->_isRoamSuppressionEnabled)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inRoamSuppressionEnabled = v21 + self->_inRoamSuppressionEnabled;
  }

  if (self->_scanningActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inScanDuration = v22 + self->_inScanDuration;
  }

  if (self->_softApActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inSoftApDuration = v23 + self->_inSoftApDuration;
  }

  if (self->_lastSystemWakeTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_systemAwakeDuration = v24 + self->_systemAwakeDuration;
    -[WiFiUsageSession setLastSystemWakeTime:](self, "setLastSystemWakeTime:", v3);
  }

  if (self->_poweredOn)
  {
    if (self->_lastPowerStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_poweredOnDuration = v25 + self->_poweredOnDuration;
    }

    -[WiFiUsageSession setLastPowerStateChangedTime:](self, "setLastPowerStateChangedTime:", v3);
  }

  if (self->_linkRecoveryDisabledTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_linkRecoveryDisabledDuration = v26 + self->_linkRecoveryDisabledDuration;
  }

  -[WiFiUsageSession tallyAssociatedDuration:](self, "tallyAssociatedDuration:", v3);
  if (self->_lastBssChangedTime)
  {
    networkDetails = self->_networkDetails;
    if (networkDetails)
    {
      -[WiFiUsageNetworkDetails connectedBss](networkDetails, "connectedBss");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", [v28 band], v3);
    }

    -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", v3);
  }

  if (self->_cellularFallbackEnabled)
  {
    if (self->_lastCellularFallbackStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inCellularFallbackDuration = v29 + self->_inCellularFallbackDuration;
    }

    -[WiFiUsageSession setLastCellularFallbackStateChangedTime:](self, "setLastCellularFallbackStateChangedTime:", v3);
  }

  if (self->_cellularOutrankingEnabled)
  {
    if (self->_lastCellularOutrankingStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inCellularOutrankingDuration = v30 + self->_inCellularOutrankingDuration;
    }

    -[WiFiUsageSession setLastCellularOutrankingStateChangedTime:]( self,  "setLastCellularOutrankingStateChangedTime:",  v3);
  }

  if (!self->_controlCenterEnabled)
  {
    if (self->_lastControlCenterStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inControlCenterAutoJoinDisabledDuration = v31 + self->_inControlCenterAutoJoinDisabledDuration;
    }

    -[WiFiUsageSession setLastControlCenterStateChangedTime:](self, "setLastControlCenterStateChangedTime:", v3);
  }

  +[WiFiUsageInterfaceStats statsForInterfaceName:]( &OBJC_CLASS___WiFiUsageInterfaceStats,  "statsForInterfaceName:",  self->_interfaceName);
  unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageInterfaceStats statsForInterfaceName:]( &OBJC_CLASS___WiFiUsageInterfaceStats,  "statsForInterfaceName:",  self->_secondaryInterfaceName);
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setNetInterfaceTxBytes:]( self,  "setNetInterfaceTxBytes:",  [v32 txBytes] - -[WiFiUsageInterfaceStats txBytes](self->_ifStatsAtStart, "txBytes"));
  -[WiFiUsageSession setNetInterfaceRxBytes:]( self,  "setNetInterfaceRxBytes:",  [v32 rxBytes] - -[WiFiUsageInterfaceStats rxBytes](self->_ifStatsAtStart, "rxBytes"));
  -[WiFiUsageSession setSecondaryInterfaceTxBytes:]( self,  "setSecondaryInterfaceTxBytes:",  [v33 txBytes] - -[WiFiUsageInterfaceStats txBytes](self->_secondaryIfStatsAtStart, "txBytes"));
  -[WiFiUsageSession setSecondaryInterfaceRxBytes:]( self,  "setSecondaryInterfaceRxBytes:",  [v33 rxBytes] - -[WiFiUsageInterfaceStats rxBytes](self->_secondaryIfStatsAtStart, "rxBytes"));
  if (-[NSDate isEqualToDate:](self->_lastPowerBudgetChangedTime, "isEqualToDate:", self->_sessionStartTime)) {
    -[WiFiUsageSession powerBudgetDidChange:andThermalIndex:]( self,  "powerBudgetDidChange:andThermalIndex:",  self->_lastPowerBudget,  self->_lastThermalIndex);
  }
  if (self->_isCompatibilityModeEnabled)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:", self->_lastCompatibilityModeChangedTime);
    self->_inCompatibilityModeEnabledDuration = v34 + self->_inCompatibilityModeEnabledDuration;
    uint64_t v35 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v36 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t compatibilityModeChangeCount = self->_compatibilityModeChangeCount;
      int v53 = 136315394;
      char v54 = "-[WiFiUsageSession summarizeSession]";
      __int16 v55 = 2048;
      __int128 v56 = (WiFiUsageSession *)compatibilityModeChangeCount;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - _compatibilityModeChangeCount:%lu",  (uint8_t *)&v53,  0x16u);
    }
  }

  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v38 isEqualToString:@"off"])
  {
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;

    if (lastNetwork6eDisableModeChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:", self->_lastNetwork6eDisableModeChangedTime);
      self->_double inNetwork6eModeOffDuration = v40 + self->_inNetwork6eModeOffDuration;
    }
  }

  else
  {
  }

  id v41 = (os_log_s *)MEMORY[0x1895F8DA0];
  id v42 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    double inNetwork6eModeOffDuration = self->_inNetwork6eModeOffDuration;
    id v44 = self->_lastNetwork6eDisableModeChangedTime;
    double sessionDuration = self->_sessionDuration;
    int v53 = 136316162;
    char v54 = "-[WiFiUsageSession summarizeSession]";
    __int16 v55 = 2112;
    __int128 v56 = self;
    __int16 v57 = 2048;
    double v58 = inNetwork6eModeOffDuration;
    __int16 v59 = 2112;
    v60 = v44;
    __int16 v61 = 2048;
    double v62 = sessionDuration;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s on %@ - _inNetwork6eModeOffDuration:%fs (lastNetwork6eDisableModedChangedTime:%@ sessionDuration:%fs)",  (uint8_t *)&v53,  0x34u);
  }

  if (-[WiFiUsageSession useSavedJoinStats](self, "useSavedJoinStats") && self->_savedLastJoinReason != -1LL)
  {
    -[WiFiUsageSession setJoinStateChangedCount:](self, "setJoinStateChangedCount:", self->_savedJoinStateChangedCount);
    -[WiFiUsageSession setLastJoinReason:](self, "setLastJoinReason:", self->_savedLastJoinReason);
    -[WiFiUsageSession setLastJoinFailure:](self, "setLastJoinFailure:", self->_savedLastJoinFailure);
    -[WiFiUsageSession setPreviousDisconnectReason:]( self,  "setPreviousDisconnectReason:",  self->_savedPreviousDisconnectReason);
    -[WiFiUsageSession setInCoexRealTimeAtLastJoin:]( self,  "setInCoexRealTimeAtLastJoin:",  self->_savedInCoexRealTimeAtLastJoin);
    -[WiFiUsageSession setPrevJoinReason:](self, "setPrevJoinReason:", self->_savedPrevJoinReason);
    -[WiFiUsageSession setTimeSincePrevJoin:](self, "setTimeSincePrevJoin:", self->_savedTimeSincePrevJoin);
    __int128 v46 = *(_OWORD *)&self->_savedJoinReasonCount[10];
    *(_OWORD *)&self->_joinReasonCount[8] = *(_OWORD *)&self->_savedJoinReasonCount[8];
    *(_OWORD *)&self->_joinReasonCount[10] = v46;
    *(_OWORD *)&self->_joinReasonCount[12] = *(_OWORD *)&self->_savedJoinReasonCount[12];
    self->_joinReasonCount[14] = self->_savedJoinReasonCount[14];
    __int128 v47 = *(_OWORD *)&self->_savedJoinReasonCount[2];
    *(_OWORD *)self->_joinReasonCount = *(_OWORD *)self->_savedJoinReasonCount;
    *(_OWORD *)&self->_joinReasonCount[2] = v47;
    __int128 v48 = *(_OWORD *)&self->_savedJoinReasonCount[6];
    *(_OWORD *)&self->_joinReasonCount[4] = *(_OWORD *)&self->_savedJoinReasonCount[4];
    *(_OWORD *)&self->_joinReasonCount[6] = v48;
    __int128 v49 = v41;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      [(id)objc_opt_class() joinReasonString:self->_lastJoinReason];
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      [(id)objc_opt_class() joinReasonString:self->_savedLastJoinReason];
      __int128 v51 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
      int v53 = 136315906;
      char v54 = "-[WiFiUsageSession summarizeSession]";
      __int16 v55 = 2112;
      __int128 v56 = self;
      __int16 v57 = 2112;
      double v58 = *(double *)&v50;
      __int16 v59 = 2112;
      v60 = v51;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s on %@ _lastJoinReason:%@ _savedLastJoinReason:%@",  (uint8_t *)&v53,  0x2Au);
    }
  }

  if (self->_anyUsbDeviceConnected) {
    -[WiFiUsageSession updateUsbInsertedDuration:](self, "updateUsbInsertedDuration:", self->_sessionEndTime);
  }
  if (self->_lastAWDLSequenceUpdate)
  {
    -[WiFiUsageSession tallyInfraScoreDuration:until:]( self,  "tallyInfraScoreDuration:until:",  self->_inAWDL_lastInfraScore,  v3);
    -[WiFiUsageSession tallyP2PScoreDuration:until:]( self,  "tallyP2PScoreDuration:until:",  v3,  self->_inAWDL_lastP2PScore);
    objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, v3);
  }

  if (self->_lastLinkStateChangedTime)
  {
    if (!self->_isAssociated)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      if (v52 > self->_longestUnassociatedDuration) {
        self->_longestUnassociatedDuration = v52;
      }
    }
  }
}

- (void)summarizeBandUsage
{
  BOOL v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  double v8 = v3;
  if (self->_sessionStartTime)
  {
    sessionEndTime = self->_sessionEndTime;
    if (!sessionEndTime) {
      sessionEndTime = v3;
    }
    -[NSDate timeIntervalSinceDate:](sessionEndTime, "timeIntervalSinceDate:");
    self->_double sessionDuration = v5;
    BOOL v3 = v8;
  }

  if (self->_lastBssChangedTime)
  {
    networkDetails = self->_networkDetails;
    if (networkDetails)
    {
      -[WiFiUsageNetworkDetails connectedBss](networkDetails, "connectedBss");
      double v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", [v7 band], v8);

      BOOL v3 = v8;
    }

    -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", v3);
    BOOL v3 = v8;
  }
}

- (void)sessionDidEnd
{
  if (self->_isSessionActive)
  {
    -[WiFiUsageSession setIsSessionActive:](self, "setIsSessionActive:", 0LL);
    [MEMORY[0x189603F50] date];
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession setSessionEndTime:](self, "setSessionEndTime:", v3);

    if (self->_sessionStartTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
      self->_double sessionDuration = v4;
    }

    if (self->_completionHandler)
    {
      if (self->_completionQueue)
      {
        double v5 = (void *)-[WiFiUsageSession copy](self, "copy");
        [v5 summarizeBandUsage];
        double v6 = (dispatch_queue_s *)v5[1434];
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __33__WiFiUsageSession_sessionDidEnd__block_invoke;
        block[3] = &unk_18A16C770;
        id v9 = v5;
        double v7 = v5;
        dispatch_async(v6, block);
      }
    }
  }

uint64_t __33__WiFiUsageSession_sessionDidEnd__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 11456LL) + 16LL))();
}

- (id)sessionName
{
  unint64_t type = self->_type;
  if (type > 0xA) {
    return @"Unknown";
  }
  else {
    return off_18A16E468[type];
  }
}

+ (id)joinReasonString:(unint64_t)a3
{
  if (a3 + 1 < 0x10) {
    return off_18A16E4C0[a3 + 1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Unknown=%u", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)disconnectReasonString:(unint64_t)a3
{
  switch(a3)
  {
    case 0x3E8uLL:
      BOOL v3 = @"TriggerDisconnect";
LABEL_3:
      id result = v3;
      break;
    case 0x3E9uLL:
      id result = @"Application";
      break;
    case 0x3EAuLL:
      id result = @"TemporarilyDisabled";
      break;
    case 0x3EBuLL:
      id result = @"PreferenceChanged";
      break;
    case 0x3ECuLL:
      id result = @"DecryptFailure";
      break;
    case 0x3EDuLL:
      id result = @"NotPrimary";
      break;
    case 0x3EEuLL:
      id result = @"Thermal";
      break;
    case 0x3EFuLL:
      id result = @"InternetSharing";
      break;
    case 0x3F0uLL:
      id result = @"Settings";
      break;
    case 0x3F1uLL:
      id result = @"Misc";
      break;
    case 0x3F2uLL:
      id result = @"EapRestart";
      break;
    case 0x3F3uLL:
      id result = @"ControlCenter";
      break;
    case 0x3F4uLL:
      id result = @"EapFailure";
      break;
    case 0x3F5uLL:
      id result = @"Transition";
      break;
    case 0x3F6uLL:
      id result = @"AutoUnlock";
      break;
    case 0x3F7uLL:
      id result = @"Captive";
      break;
    case 0x3F8uLL:
      id result = @"UserNotification";
      break;
    case 0x3F9uLL:
      id result = @"BssSteering";
      break;
    case 0x3FAuLL:
      id result = @"HotspotAssociation";
      break;
    case 0x3FBuLL:
      id result = @"HotspotTransition";
      break;
    case 0x3FCuLL:
      id result = @"BssChanged";
      break;
    case 0x3FDuLL:
      id result = @"CarPlayDisabled";
      break;
    case 0x3FEuLL:
      id result = @"BatterySaverMode";
      break;
    case 0x3FFuLL:
      id result = @"AirPlay";
      break;
    case 0x400uLL:
      id result = @"6EEnabled";
      break;
    case 0x401uLL:
      id result = @"6EDisabled";
      break;
    case 0x402uLL:
      id result = @"ColocatedUserJoin";
      break;
    case 0x403uLL:
      id result = @"InfraRelayDisconnect";
      break;
    case 0x404uLL:
      id result = @"P2PRealTimeInitiated";
      break;
    case 0x405uLL:
      id result = @"SleepOnCaptive";
      break;
    case 0x406uLL:
      id result = @"ShortLease";
      break;
    case 0x407uLL:
      id result = @"AutoJoinDisabled";
      break;
    case 0x408uLL:
      id result = @"SleepDenylisted";
      break;
    case 0x409uLL:
      id result = @"UnspecifiedClientDisconnect";
      break;
    default:
      BOOL v3 = @"Uninitialized";
      switch(a3)
      {
        case 0xFFFFFFFFFFFFFFFFLL:
          goto LABEL_3;
        case 0uLL:
          id result = @"None";
          break;
        case 1uLL:
          id result = @"Deauth";
          break;
        case 2uLL:
          id result = @"BeaconLoss";
          break;
        case 3uLL:
          id result = @"Internal";
          break;
        case 4uLL:
          id result = @"SystemSleep";
          break;
        case 5uLL:
          id result = @"PoweredOff";
          break;
        case 6uLL:
          id result = @"JoinFailure";
          break;
        case 7uLL:
          id result = @"ColocatedNetworkTransition";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown=%u", a3);
          BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
      }

      break;
  }

  return result;
}

- (id)eventDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  p_isSessionActive = &self->_isSessionActive;
  [MEMORY[0x189603FC8] dictionary];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession sessionName](self, "sessionName");
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v7 forKeyedSubscript:@"SessionName"];

  +[WiFiUsagePrivacyFilter numberWithDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDuration:",  self->_sessionDuration);
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v8 forKeyedSubscript:@"SessionDuration"];

  +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  self->_sessionDuration);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v9 forKeyedSubscript:@"SessionDurationAsString"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_sessionPid];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v10 forKeyedSubscript:@"SessionPid"];

  +[WiFiUsagePrivacyFilter numberWithDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDuration:",  self->_sessionTimeSinceLastSession);
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v11 forKeyedSubscript:@"SessionTimeSinceLastSession"];

  [v6 setObject:self->_interfaceName forKeyedSubscript:@"SessionInterfaceName"];
  +[WiFiUsagePrivacyFilter timeSinceBootInSeconds](&OBJC_CLASS___WiFiUsagePrivacyFilter, "timeSinceBootInSeconds");
  +[WiFiUsagePrivacyFilter numberWithDuration:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "numberWithDuration:");
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v12 forKeyedSubscript:@"SessionDeviceUptime"];

  if (v3)
  {
    if (-[WiFiUsageSession type](self, "type") != 5) {
      goto LABEL_10;
    }
  }

  else
  {
    if (*p_isSessionActive) {
      double v13 = @"Y";
    }
    else {
      double v13 = @"N";
    }
    [v6 setObject:v13 forKeyedSubscript:@"SessionIsActive"];
    [v6 setObject:self->_secondaryInterfaceName forKeyedSubscript:@"SessionSecondaryInterfaceName"];
    +[WiFiUsagePrivacyFilter localTimestamp:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "localTimestamp:",  self->_sessionStartTime);
    double v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v14 forKeyedSubscript:@"SessionStartTimestamp"];
  }

  -[WiFiUsageSession activeApplications](self, "activeApplications");
  double v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 count];

  if (v16)
  {
    -[WiFiUsageSession activeApplications](self, "activeApplications");
    double v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 allObjects];
    double v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 lastObject];
    double v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v19 forKeyedSubscript:@"ApplicationBundleId"];
  }

- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  [MEMORY[0x189603FC8] dictionary];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  double sessionDuration = self->_sessionDuration;
  __int128 v9 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  v28[0] = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  v28[1] = v9;
  +[WiFiUsagePrivacyFilter getPercForFloatByBand:Over:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getPercForFloatByBand:Over:",  v28,  sessionDuration);
  -[WiFiUsageSession sessionName](self, "sessionName");
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v10 forKeyedSubscript:@"SessionName"];

  +[WiFiUsagePrivacyFilter numberWithDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDuration:",  self->_sessionDuration);
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v11 forKeyedSubscript:@"SessionDuration"];

  +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  self->_sessionDuration);
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v12 forKeyedSubscript:@"SessionDurationAsString"];

  [MEMORY[0x189607968] numberWithBool:v4];
  double v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v13 forKeyedSubscript:@"firstEvent"];

  +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", v5);
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v14 forKeyedSubscript:@"band"];

  -[WiFiUsageSession bandUsageDuration](self, "bandUsageDuration");
  uint64_t v15 = v5;
  if (*((_BYTE *)&v27[5] + v5 + 8))
  {
    -[WiFiUsageSession bandUsageDuration](self, "bandUsageDuration");
    double v16 = *((double *)&v27[2] + v5);
  }

  else
  {
    double v16 = 0.0;
  }

  +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  v16);
  double v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v17 forKeyedSubscript:@"durationOnBand"];

  if (*((_BYTE *)&v28[3] + v15 + 8)) {
    uint64_t v18 = *((void *)&v28[2] + v15);
  }
  else {
    uint64_t v18 = 0LL;
  }
  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  v18,  0LL);
  double v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v19 forKeyedSubscript:@"durationOnBandPerc"];

  double associatedDuration = self->_associatedDuration;
  __int128 v21 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  v27[0] = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  v27[1] = v21;
  +[WiFiUsagePrivacyFilter getPercForFloatByBand:Over:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getPercForFloatByBand:Over:",  v27,  associatedDuration);
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_associatedDuration,  self->_sessionDuration);
  double v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v22 forKeyedSubscript:@"WiFiAssociatedDuration"];

  +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  self->_associatedDuration);
  double v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v23 forKeyedSubscript:@"WiFiAssociatedDurationAsString"];

  if (*((_BYTE *)&v28[1] + v15 + 8)) {
    uint64_t v24 = *((void *)v28 + v15);
  }
  else {
    uint64_t v24 = 0LL;
  }
  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  v24,  0LL);
  double v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v25 forKeyedSubscript:@"durationOnBandPercOfAssoc"];

  return v7;
}

- (id)sessionSummary:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = (void *)-[WiFiUsageSession copy](self, "copy");
  [v4 summarizeSession];
  [v4 eventDictionary:v3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)totalRxFrames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 totalRxFrames];

  return v3;
}

- (unint64_t)totalTxFrames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 totalTxFrames];

  return v3;
}

- (int64_t)averageCca
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 avgTotalCca];

  return v3;
}

- (int64_t)averageRssi
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 avgRssi];

  return v3;
}

- (int64_t)averageSnr
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 avgSnr];

  return v3;
}

- (id)lastBssSessionInfo
{
  return -[WiFiUsageBssSession sessionInfo](self->_currentBssSession, "sessionInfo");
}

- (int64_t)lastRssi
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 lastRssi];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_isSessionActive = &self->_isSessionActive;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithSessionType:self->_type andInterfaceName:self->_interfaceName andCapabilities:self->_capabilities];
  [(id)v5 setCompletionQueue:self->_completionQueue];
  [(id)v5 setCompletionContext:self->_completionContext];
  [(id)v5 setCompletionHandler:self->_completionHandler];
  objc_storeStrong((id *)(v5 + 9152), self->_ca_config);
  [(id)v5 setSessionStartTime:self->_sessionStartTime];
  [(id)v5 setSessionEndTime:self->_sessionEndTime];
  uint64_t v6 = -[WiFiUsageBssSession copy](self->_currentBssSession, "copy");
  double v7 = *(void **)(v5 + 9104);
  *(void *)(v5 + 9104) = v6;

  *(_BYTE *)(v5 + 9020) = p_isSessionActive[4];
  *(_BYTE *)(v5 + 9021) = p_isSessionActive[5];
  *(_BYTE *)(v5 + 9022) = p_isSessionActive[6];
  *(_BYTE *)(v5 + 9023) = p_isSessionActive[7];
  *(void *)(v5 + 9136) = self->_driverUnavailabilityCount;
  *(void *)(v5 + 10776) = self->_lastThermalIndex;
  *(void *)(v5 + 10768) = self->_lastPowerBudget;
  uint64_t v8 = -[NSMutableSet copy](self->_activeApplications, "copy");
  __int128 v9 = *(void **)(v5 + 10760);
  *(void *)(v5 + 10760) = v8;

  uint64_t v10 = -[WiFiUsageSessionLQM copy](self->_lqm, "copy");
  double v11 = *(void **)(v5 + 10752);
  *(void *)(v5 + 10752) = v10;

  *(void *)(v5 + 10608) = self->_triggerDisconnectAlertedCount;
  *(void *)(v5 + 10616) = self->_triggerDisconnectConfirmedCount;
  *(void *)(v5 + 10624) = self->_triggerDisconnectExecutedCount;
  *(void *)(v5 + 10576) = self->_netInterfaceTxBytes;
  *(void *)(v5 + 10584) = self->_netInterfaceRxBytes;
  *(void *)(v5 + 10592) = self->_secondaryInterfaceTxBytes;
  *(void *)(v5 + 10600) = self->_secondaryInterfaceRxBytes;
  uint64_t v12 = -[WiFiUsageInterfaceStats copy](self->_ifStatsAtStart, "copy");
  double v13 = *(void **)(v5 + 10560);
  *(void *)(v5 + 10560) = v12;

  uint64_t v14 = -[WiFiUsageInterfaceStats copy](self->_secondaryIfStatsAtStart, "copy");
  uint64_t v15 = *(void **)(v5 + 10568);
  *(void *)(v5 + 10568) = v14;

  *(void *)(v5 + 10544) = self->_neighborBssCount;
  *(void *)(v5 + 10552) = self->_otherBssCount;
  *(void *)(v5 + 10368) = self->_systemWakeStateChangedCount;
  *(void *)(v5 + 10376) = self->_systemWokenByWiFiCount;
  *(void *)(v5 + 10384) = self->_lockStateChangedCount;
  *(void *)(v5 + 10392) = self->_displayStateChangedCount;
  *(void *)(v5 + 10400) = self->_networkChangedCount;
  *(void *)(v5 + 10408) = self->_joinStateChangedCount;
  *(void *)(v5 + 10424) = self->_linkStateChangedCount;
  *(void *)(v5 + 10432) = self->_applicationStateChangedCount;
  *(void *)(v5 + 10440) = self->_powerStateChangedCount;
  *(void *)(v5 + 10448) = self->_powerToggleEventCount;
  *(void *)(v5 + 10504) = self->_rapidLinkTransitionCount;
  *(void *)(v5 + 10512) = self->_primaryInterfaceStateChangeCount;
  *(void *)(v5 + 10480) = self->_controlCenterToggleEventCount;
  *(void *)(v5 + 10472) = self->_controlCenterStateChangedCount;
  *(void *)(v5 + 10488) = self->_cellularFallbackStateChangedCount;
  *(void *)(v5 + 10496) = self->_cellularOutrankingStateChangedCount;
  *(void *)(v5 + 10208) = self->_mediaPlaybackEventCount;
  *(void *)(v5 + 10216) = self->_chargingEventCount;
  *(void *)(v5 + 10224) = self->_inCallEventCount;
  *(void *)(v5 + 10240) = self->_inVehicleEventCount;
  *(void *)(v5 + 10248) = self->_inMotionEventCount;
  *(void *)(v5 + 10256) = self->_inA2dpEventCount;
  *(void *)(v5 + 10264) = self->_inScoEventCount;
  *(void *)(v5 + 10272) = self->_inHidPresentCount;
  *(void *)(v5 + 10280) = self->_inAwdlEventCount;
  *(void *)(v5 + 10288) = self->_inRoamEventCount;
  *(void *)(v5 + 10296) = self->_inScanEventCount;
  *(void *)(v5 + 10304) = self->_inSoftApEventCount;
  *(void *)(v5 + 10312) = self->_rangingEventCount;
  *(void *)(v5 + 10320) = self->_companionConnectionStateChangedCount;
  *(void *)(v5 + 10456) = self->_smartCoverStateChangedCount;
  uint64_t v16 = -[NSString copy](self->_lastSmartCoverState, "copy");
  double v17 = *(void **)(v5 + 10464);
  *(void *)(v5 + 10464) = v16;

  *(void *)(v5 + 10528) = self->_consecutiveJoinFailureCount;
  *(void *)(v5 + 10328) = self->_linkRecoveryDisabledCount;
  *(_BYTE *)(v5 + 9040) = p_isSessionActive[24];
  *(_BYTE *)(v5 + 9041) = p_isSessionActive[25];
  *(_BYTE *)(v5 + 9042) = p_isSessionActive[26];
  *(_BYTE *)(v5 + 9043) = p_isSessionActive[27];
  objc_storeStrong((id *)(v5 + 10928), self->_btAudioBand);
  *(void *)(v5 + 10336) = self->_wowStateChangedCount;
  *(void *)(v5 + 10344) = self->_lpasStateChangedCount;
  *(void *)(v5 + 10352) = self->_lowPowerStateChangedCount;
  *(void *)(v5 + 10360) = self->_batterySaverStateChangedCount;
  *(double *)(v5 + 10120) = self->_thermalIndexMaxDuration;
  *(double *)(v5 + 10128) = self->_thermalIndex90Duration;
  *(double *)(v5 + 10136) = self->_thermalIndex80Duration;
  *(double *)(v5 + 10144) = self->_thermalIndex70Duration;
  *(double *)(v5 + 10152) = self->_thermalIndex60Duration;
  *(double *)(v5 + 10160) = self->_thermalIndex50Duration;
  *(double *)(v5 + 10168) = self->_thermalIndex40Duration;
  *(double *)(v5 + 10176) = self->_thermalIndex30Duration;
  *(double *)(v5 + 10184) = self->_thermalIndex20Duration;
  *(double *)(v5 + 10192) = self->_thermalIndex10Duration;
  *(double *)(v5 + 10200) = self->_thermalIndexMinDuration;
  *(double *)(v5 + 10032) = self->_powerBudgetMaxDuration;
  *(double *)(v5 + 10040) = self->_powerBudget90Duration;
  *(double *)(v5 + 10048) = self->_powerBudget80Duration;
  *(double *)(v5 + 10056) = self->_powerBudget70Duration;
  *(double *)(v5 + 10064) = self->_powerBudget60Duration;
  *(double *)(v5 + 10072) = self->_powerBudget50Duration;
  *(double *)(v5 + 10080) = self->_powerBudget40Duration;
  *(double *)(v5 + 10088) = self->_powerBudget30Duration;
  *(double *)(v5 + 10096) = self->_powerBudget20Duration;
  *(double *)(v5 + 10104) = self->_powerBudget10Duration;
  *(double *)(v5 + 10112) = self->_powerBudgetMinDuration;
  *(void *)(v5 + 9768) = self->_roamReasonInitialAssociationCount;
  *(void *)(v5 + 9776) = self->_roamReasonLowRssiCount;
  *(void *)(v5 + 9784) = self->_roamReasonDeauthDisassocCount;
  *(void *)(v5 + 9792) = self->_roamReasonBeaconLostCount;
  *(void *)(v5 + 9800) = self->_roamReasonSteeredByApCount;
  *(void *)(v5 + 9808) = self->_roamReasonSteeredByBtmCount;
  *(void *)(v5 + 9816) = self->_roamReasonSteeredByCsaCount;
  *(void *)(v5 + 9824) = self->_roamReasonReassocRequestedCount;
  *(void *)(v5 + 9832) = self->_roamReasonHostTriggeredCount;
  *(void *)(v5 + 9840) = self->_roamReasonBetterCandidateCount;
  *(void *)(v5 + 9848) = self->_roamReasonBetterConditionCount;
  *(void *)(v5 + 9856) = self->_roamReasonMiscCount;
  *(void *)(v5 + 9864) = self->_roamStatusSucceededCount;
  *(void *)(v5 + 9872) = self->_roamStatusFailedCount;
  *(void *)(v5 + 9880) = self->_roamStatusNoCandidateCount;
  *(void *)(v5 + 9888) = self->_roamStatusNoQualifiedCandidateCount;
  *(void *)(v5 + 9896) = self->_roamStatusFailedNoScan;
  *(void *)(v5 + 9904) = self->_roamIsWNMScoreUsedCount;
  *(void *)(v5 + 9912) = self->_roamPingPongAboveThresholdCount;
  *(void *)(v5 + 9920) = self->_roamPingPongAboveThresholdCountLowRssiOnly;
  *(void *)(v5 + 9928) = self->_roamPingPongLowRssiAndReassocOnly;
  *(void *)(v5 + 9936) = self->_roamPingPongReassocOnly;
  *(_BYTE *)(v5 + 9033) = p_isSessionActive[17];
  uint64_t v18 = -[NSDate copy](self->_lastRoamSuppressionToggled, "copy");
  double v19 = *(void **)(v5 + 9944);
  *(void *)(v5 + 9944) = v18;

  *(double *)(v5 + 9960) = self->_inRoamSuppressionEnabled;
  *(double *)(v5 + 9968) = self->_inRoamSuppressionWaitForRoamStart;
  *(double *)(v5 + 9976) = self->_inRoamSuppressionWaitForRoamEnd;
  *(void *)(v5 + 9984) = self->_minCandidatesCount;
  *(void *)(v5 + 9992) = self->_maxCandidatesCount;
  *(void *)(v5 + 10000) = self->_currentRSSIStrongestCount;
  uint64_t v20 = -[NSMutableDictionary copy](self->_roamNeighborsByBand, "copy");
  __int128 v21 = *(void **)(v5 + 10008);
  *(void *)(v5 + 10008) = v20;

  __int128 v22 = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  *(_OWORD *)(v5 + 11512) = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  *(_OWORD *)(v5 + 11528) = v22;
  __int128 v23 = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  *(_OWORD *)(v5 + 11544) = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  *(_OWORD *)(v5 + 11560) = v23;
  __int128 v25 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  __int128 v24 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  __int128 v26 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  *(void *)(v5 + 11656) = *(void *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11624) = v25;
  *(_OWORD *)(v5 + 11640) = v24;
  *(_OWORD *)(v5 + 11608) = v26;
  __int128 v27 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11576) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11592) = v27;
  __int128 v28 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  __int128 v29 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  uint64_t v30 = *(void *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11696) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  *(void *)(v5 + 11744) = v30;
  *(_OWORD *)(v5 + 11728) = v29;
  *(_OWORD *)(v5 + 11712) = v28;
  __int128 v31 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11680) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11664) = v31;
  __int128 v32 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11752) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11768) = v32;
  __int128 v33 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  __int128 v34 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  __int128 v35 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  *(void *)(v5 + 11832) = *(void *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11800) = v34;
  *(_OWORD *)(v5 + 11816) = v35;
  *(_OWORD *)(v5 + 11784) = v33;
  __int128 v36 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11856) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11840) = v36;
  __int128 v37 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  __int128 v38 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  __int128 v39 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  *(void *)(v5 + 11920) = *(void *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11904) = v39;
  *(_OWORD *)(v5 + 11888) = v38;
  *(_OWORD *)(v5 + 11872) = v37;
  uint64_t v40 = -[NSMutableDictionary copy](self->_roamCandidatesPerBandWhenSuccessful, "copy");
  id v41 = *(void **)(v5 + 10016);
  *(void *)(v5 + 10016) = v40;

  uint64_t v42 = -[NSMutableDictionary copy](self->_roamCandidatesPerBandWhenUnSuccessful, "copy");
  v43 = *(void **)(v5 + 10024);
  *(void *)(v5 + 10024) = v42;

  *(double *)(v5 + 9080) = self->_sessionDuration;
  *(double *)(v5 + 9520) = self->_systemAwakeDuration;
  *(double *)(v5 + 9528) = self->_mediaPlaybackDuration;
  *(double *)(v5 + 9536) = self->_chargingDuration;
  *(double *)(v5 + 9552) = self->_inCallDuration;
  *(double *)(v5 + 9568) = self->_inVehicleDuration;
  *(double *)(v5 + 9576) = self->_inMotionDuration;
  *(double *)(v5 + 9584) = self->_inA2dpDuration;
  *(double *)(v5 + 9592) = self->_inScoDuration;
  *(double *)(v5 + 9600) = self->_inHidPresentDuration;
  *(double *)(v5 + 9608) = self->_inAwdlDuration;
  *(double *)(v5 + 9616) = self->_inRoamDuration;
  *(double *)(v5 + 9624) = self->_inScanDuration;
  *(double *)(v5 + 9632) = self->_inSoftApDuration;
  *(double *)(v5 + 9640) = self->_poweredOnDuration;
  *(double *)(v5 + 9648) = self->_associatedDuration;
  *(_BYTE *)(v5 + 9018) = p_isSessionActive[2];
  *(double *)(v5 + 9656) = self->_associatedSleepDuration;
  *(double *)(v5 + 9664) = self->_inCellularFallbackDuration;
  *(double *)(v5 + 9672) = self->_inCellularOutrankingDuration;
  __int128 v44 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  *(_OWORD *)(v5 + 11480) = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  *(_OWORD *)(v5 + 11496) = v44;
  *(double *)(v5 + 9680) = self->_inControlCenterAutoJoinDisabledDuration;
  *(double *)(v5 + 9544) = self->_companionConnectedDuration;
  *(double *)(v5 + 9696) = self->_linkRecoveryDisabledDuration;
  *(double *)(v5 + 10744) = self->_longestUnassociatedDuration;
  *(double *)(v5 + 9704) = self->_inWowStateDuration;
  *(double *)(v5 + 9712) = self->_inLpasStateDuration;
  *(double *)(v5 + 9720) = self->_inLowPowerStateDuration;
  *(double *)(v5 + 9728) = self->_inBatterySaverStateDuration;
  *(double *)(v5 + 9736) = self->_sleepPowerStatsTotalDuration;
  *(double *)(v5 + 9744) = self->_sleepPowerStatsUnassociatedDuration;
  *(double *)(v5 + 9752) = self->_sleepPowerStatsAssociatedDuration;
  *(double *)(v5 + 9760) = self->_sleepPowerStatsRoamingDuration;
  uint64_t v45 = -[NSDate copy](self->_sessionInitTime, "copy");
  __int128 v46 = *(void **)(v5 + 9248);
  *(void *)(v5 + 9248) = v45;

  uint64_t v47 = -[NSDate copy](self->_sessionStartTime, "copy");
  __int128 v48 = *(void **)(v5 + 9256);
  *(void *)(v5 + 9256) = v47;

  uint64_t v49 = -[NSDate copy](self->_sessionEndTime, "copy");
  id v50 = *(void **)(v5 + 9264);
  *(void *)(v5 + 9264) = v49;

  uint64_t v51 = -[NSDate copy](self->_mediaStartedTime, "copy");
  double v52 = *(void **)(v5 + 9272);
  *(void *)(v5 + 9272) = v51;

  uint64_t v53 = -[NSDate copy](self->_chargingStartedTime, "copy");
  char v54 = *(void **)(v5 + 9280);
  *(void *)(v5 + 9280) = v53;

  uint64_t v55 = -[NSDate copy](self->_companionConnectionTime, "copy");
  __int128 v56 = *(void **)(v5 + 9288);
  *(void *)(v5 + 9288) = v55;

  uint64_t v57 = -[NSDate copy](self->_callStartedTime, "copy");
  double v58 = *(void **)(v5 + 9296);
  *(void *)(v5 + 9296) = v57;

  uint64_t v59 = -[NSDate copy](self->_inVehicleEntryTime, "copy");
  v60 = *(void **)(v5 + 9312);
  *(void *)(v5 + 9312) = v59;

  uint64_t v61 = -[NSDate copy](self->_inMotionStartedTime, "copy");
  double v62 = *(void **)(v5 + 9320);
  *(void *)(v5 + 9320) = v61;

  uint64_t v63 = -[NSDate copy](self->_a2dpActiveTime, "copy");
  v64 = *(void **)(v5 + 9328);
  *(void *)(v5 + 9328) = v63;

  uint64_t v65 = -[NSDate copy](self->_scoActiveTime, "copy");
  int v66 = *(void **)(v5 + 9336);
  *(void *)(v5 + 9336) = v65;

  uint64_t v67 = -[NSDate copy](self->_hidPresentTime, "copy");
  v68 = *(void **)(v5 + 9344);
  *(void *)(v5 + 9344) = v67;

  uint64_t v69 = -[NSDate copy](self->_awdlActiveTime, "copy");
  uint64_t v70 = *(void **)(v5 + 9352);
  *(void *)(v5 + 9352) = v69;

  uint64_t v71 = -[NSDate copy](self->_roamingActiveTime, "copy");
  v72 = *(void **)(v5 + 9360);
  *(void *)(v5 + 9360) = v71;

  uint64_t v73 = -[NSDate copy](self->_scanningActiveTime, "copy");
  int v74 = *(void **)(v5 + 9368);
  *(void *)(v5 + 9368) = v73;

  uint64_t v75 = -[NSDate copy](self->_softApActiveTime, "copy");
  v76 = *(void **)(v5 + 9376);
  *(void *)(v5 + 9376) = v75;

  uint64_t v77 = -[NSDate copy](self->_lastPowerStateChangedTime, "copy");
  v78 = *(void **)(v5 + 9384);
  *(void *)(v5 + 9384) = v77;

  uint64_t v79 = -[NSDate copy](self->_lastCellularFallbackStateChangedTime, "copy");
  v80 = *(void **)(v5 + 9400);
  *(void *)(v5 + 9400) = v79;

  uint64_t v81 = -[NSDate copy](self->_lastCellularOutrankingStateChangedTime, "copy");
  v82 = *(void **)(v5 + 9408);
  *(void *)(v5 + 9408) = v81;

  uint64_t v83 = -[NSDate copy](self->_lastControlCenterStateChangedTime, "copy");
  v84 = *(void **)(v5 + 9392);
  *(void *)(v5 + 9392) = v83;

  uint64_t v85 = -[NSDate copy](self->_lastSystemWakeTime, "copy");
  v86 = *(void **)(v5 + 9416);
  *(void *)(v5 + 9416) = v85;

  uint64_t v87 = -[NSDate copy](self->_lastSystemSleepTime, "copy");
  v88 = *(void **)(v5 + 9424);
  *(void *)(v5 + 9424) = v87;

  uint64_t v89 = -[NSDate copy](self->_lastUnexpectedLinkDownTime, "copy");
  v90 = *(void **)(v5 + 9432);
  *(void *)(v5 + 9432) = v89;

  uint64_t v91 = -[NSDate copy](self->_lastLinkStateChangedTime, "copy");
  v92 = *(void **)(v5 + 9440);
  *(void *)(v5 + 9440) = v91;

  uint64_t v93 = -[NSDate copy](self->_lastPowerBudgetChangedTime, "copy");
  v94 = *(void **)(v5 + 9448);
  *(void *)(v5 + 9448) = v93;

  uint64_t v95 = -[NSDate copy](self->_lastBssChangedTime, "copy");
  v96 = *(void **)(v5 + 9456);
  *(void *)(v5 + 9456) = v95;

  uint64_t v97 = -[NSDate copy](self->_linkRecoveryDisabledTime, "copy");
  v98 = *(void **)(v5 + 9472);
  *(void *)(v5 + 9472) = v97;

  *(_BYTE *)(v5 + 9030) = p_isSessionActive[14];
  uint64_t v99 = -[NSDate copy](self->_wowStateEntryTime, "copy");
  v100 = *(void **)(v5 + 9480);
  *(void *)(v5 + 9480) = v99;

  uint64_t v101 = -[NSDate copy](self->_lpasStateEntryTime, "copy");
  v102 = *(void **)(v5 + 9488);
  *(void *)(v5 + 9488) = v101;

  uint64_t v103 = -[NSDate copy](self->_lowPowerStateEntryTime, "copy");
  v104 = *(void **)(v5 + 9496);
  *(void *)(v5 + 9496) = v103;

  uint64_t v105 = -[NSDate copy](self->_batterySaverStateEntryTime, "copy");
  v106 = *(void **)(v5 + 9504);
  *(void *)(v5 + 9504) = v105;

  *(void *)(v5 + 9184) = self->_lastJoinReason;
  *(void *)(v5 + 9192) = self->_lastJoinFailure;
  *(void *)(v5 + 9200) = self->_lastDisconnectReason;
  *(void *)(v5 + 9208) = self->_lastDisconnectSubreason;
  *(void *)(v5 + 9216) = self->_previousDisconnectReason;
  *(void *)(v5 + 10416) = self->_savedJoinStateChangedCount;
  *(void *)(v5 + 9224) = self->_savedLastJoinReason;
  *(void *)(v5 + 9232) = self->_savedLastJoinFailure;
  *(void *)(v5 + 9240) = self->_savedPreviousDisconnectReason;
  *(_BYTE *)(v5 + 9032) = p_isSessionActive[16];
  uint64_t v107 = -[NSString copy](self->_secondaryInterfaceName, "copy");
  v108 = *(void **)(v5 + 9144);
  *(void *)(v5 + 9144) = v107;

  *(_BYTE *)(v5 + 9016) = *p_isSessionActive;
  *(_BYTE *)(v5 + 9024) = p_isSessionActive[8];
  *(_BYTE *)(v5 + 9025) = p_isSessionActive[9];
  *(_BYTE *)(v5 + 9026) = p_isSessionActive[10];
  *(_BYTE *)(v5 + 9027) = p_isSessionActive[11];
  *(void *)(v5 + 9168) = self->_sessionPid;
  uint64_t v109 = -[NSDate copy](self->_processInitTime, "copy");
  v110 = *(void **)(v5 + 9120);
  *(void *)(v5 + 9120) = v109;

  uint64_t v111 = -[NSString copy](self->_cellularDataStatus, "copy");
  v112 = *(void **)(v5 + 9160);
  *(void *)(v5 + 9160) = v111;

  *(_BYTE *)(v5 + 9031) = p_isSessionActive[15];
  *(void *)(v5 + 10536) = self->_airplaneModeStateChangedCount;
  uint64_t v113 = -[NSString copy](self->_lastDriverUnavailableReason, "copy");
  v114 = *(void **)(v5 + 10656);
  *(void *)(v5 + 10656) = v113;

  uint64_t v115 = -[NSDate copy](self->_lastDriverTerminationTime, "copy");
  v116 = *(void **)(v5 + 10632);
  *(void *)(v5 + 10632) = v115;

  uint64_t v117 = -[NSDate copy](self->_lastChipResetTime, "copy");
  v118 = *(void **)(v5 + 10640);
  *(void *)(v5 + 10640) = v117;

  uint64_t v119 = -[NSDate copy](self->_lastDriverAvailableTime, "copy");
  v120 = *(void **)(v5 + 10648);
  *(void *)(v5 + 10648) = v119;

  *(double *)(v5 + 10664) = self->_driverProcessLifespan;
  *(double *)(v5 + 10672) = self->_driverAvailabilityLifespan;
  *(double *)(v5 + 10688) = self->_driverAvailabilityLatencyFromTermination;
  *(double *)(v5 + 10696) = self->_joinScanLatencyFromDriverAvailability;
  *(double *)(v5 + 10704) = self->_joinStartedLatencyFromDriverAvailability;
  *(double *)(v5 + 10712) = self->_joinLinkUpLatencyFromDriverAvailability;
  *(double *)(v5 + 10720) = self->_joinIpConfigurationLatencyFromDriverAvailability;
  *(double *)(v5 + 10728) = self->_joinInterfaceRankingLatencyFromDriverAvailability;
  *(double *)(v5 + 10736) = self->_joinLinkUpLatencyFromSessionStart;
  __int128 v121 = *(_OWORD *)self->_perClientScanCount;
  *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_perClientScanCount[2];
  *(_OWORD *)(v5 + 8) = v121;
  __int128 v122 = *(_OWORD *)&self->_perClientScanCount[4];
  __int128 v123 = *(_OWORD *)&self->_perClientScanCount[6];
  __int128 v124 = *(_OWORD *)&self->_perClientScanCount[8];
  *(_OWORD *)(v5 + 88) = *(_OWORD *)&self->_perClientScanCount[10];
  *(_OWORD *)(v5 + 72) = v124;
  *(_OWORD *)(v5 + 56) = v123;
  *(_OWORD *)(v5 + 40) = v122;
  __int128 v125 = *(_OWORD *)&self->_perClientScanCount[12];
  __int128 v126 = *(_OWORD *)&self->_perClientScanCount[14];
  __int128 v127 = *(_OWORD *)&self->_perClientScanCount[16];
  *(_OWORD *)(v5 + 152) = *(_OWORD *)&self->_perClientScanCount[18];
  *(_OWORD *)(v5 + 136) = v127;
  *(_OWORD *)(v5 + 120) = v126;
  *(_OWORD *)(v5 + 104) = v125;
  __int128 v128 = *(_OWORD *)&self->_perClientScanCount[20];
  __int128 v129 = *(_OWORD *)&self->_perClientScanCount[22];
  __int128 v130 = *(_OWORD *)&self->_perClientScanCount[24];
  *(void *)(v5 + 216) = self->_perClientScanCount[26];
  *(_OWORD *)(v5 + 200) = v130;
  *(_OWORD *)(v5 + 184) = v129;
  *(_OWORD *)(v5 + 168) = v128;
  memcpy((void *)(v5 + 224), self->_faultReasonCount, 0x110uLL);
  __int128 v131 = *(_OWORD *)&self->_joinReasonCount[6];
  __int128 v133 = *(_OWORD *)self->_joinReasonCount;
  __int128 v132 = *(_OWORD *)&self->_joinReasonCount[2];
  *(_OWORD *)(v5 + 528) = *(_OWORD *)&self->_joinReasonCount[4];
  *(_OWORD *)(v5 + 544) = v131;
  *(_OWORD *)(v5 + 496) = v133;
  *(_OWORD *)(v5 + 512) = v132;
  __int128 v135 = *(_OWORD *)&self->_joinReasonCount[10];
  __int128 v134 = *(_OWORD *)&self->_joinReasonCount[12];
  __int128 v136 = *(_OWORD *)&self->_joinReasonCount[8];
  *(void *)(v5 + 608) = self->_joinReasonCount[14];
  *(_OWORD *)(v5 + 576) = v135;
  *(_OWORD *)(v5 + 592) = v134;
  *(_OWORD *)(v5 + 560) = v136;
  uint64_t v137 = -[NSMutableDictionary mutableCopy](self->_disconnectReasonMap, "mutableCopy");
  v138 = *(void **)(v5 + 9008);
  *(void *)(v5 + 9008) = v137;

  *(_BYTE *)(v5 + 9028) = p_isSessionActive[12];
  *(_BYTE *)(v5 + 9029) = p_isSessionActive[13];
  *(void *)(v5 + 10520) = self->_compatibilityModeChangeCount;
  objc_storeStrong((id *)(v5 + 9464), self->_lastCompatibilityModeChangedTime);
  *(double *)(v5 + 9688) = self->_inCompatibilityModeEnabledDuration;
  *(_DWORD *)(v5 + 9060) = self->_bandAtSessionStart;
  *(_BYTE *)(v5 + 9034) = p_isSessionActive[18];
  *(void *)(v5 + 10784) = self->_rssiAtSessionStart;
  *(double *)(v5 + 9512) = self->_sessionTimeSinceLastSession;
  networkDetailsAtEnd = self->_networkDetailsAtEnd;
  v140 = networkDetailsAtEnd;
  if (!networkDetailsAtEnd) {
    v140 = (WiFiUsageNetworkDetails *)-[WiFiUsageNetworkDetails copy](self->_networkDetails, "copy");
  }
  objc_storeStrong((id *)(v5 + 9096), v140);
  if (!networkDetailsAtEnd) {

  }
  uint64_t v141 = 1352LL;
  if (!self->_networkDetailsAtEnd) {
    uint64_t v141 = 1351LL;
  }
  objc_storeStrong((id *)(v5 + 10808), (&self->super.isa)[v141]);
  if (self->_networkDetailsAtEnd) {
    lastNetwork6eDisableModeChangedTime = 0LL;
  }
  else {
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;
  }
  objc_storeStrong((id *)(v5 + 10824), lastNetwork6eDisableModeChangedTime);
  uint64_t v143 = 1355LL;
  if (!self->_networkDetailsAtEnd) {
    uint64_t v143 = 1354LL;
  }
  *(void *)(v5 + 10832) = (&self->super.isa)[v143];
  uint64_t v144 = 1350LL;
  if (!self->_networkDetailsAtEnd) {
    uint64_t v144 = 1349LL;
  }
  *(void *)(v5 + 10792) = (&self->super.isa)[v144];
  objc_storeStrong((id *)(v5 + 10864), self->_ipV4DetailsPrevSession);
  *(_BYTE *)(v5 + 9035) = p_isSessionActive[19];
  objc_storeStrong((id *)(v5 + 10872), self->_ipV6DetailsPrevSession);
  *(_BYTE *)(v5 + 9036) = p_isSessionActive[20];
  *(_BYTE *)(v5 + 9037) = p_isSessionActive[21];
  uint64_t v145 = -[NSMutableArray copy](self->_prevNetworkNames, "copy");
  v146 = *(void **)(v5 + 10896);
  *(void *)(v5 + 10896) = v145;

  *(_BYTE *)(v5 + 9039) = p_isSessionActive[23];
  *(_BYTE *)(v5 + 9038) = p_isSessionActive[22];
  *(void *)(v5 + 10904) = self->_prevJoinReason;
  *(double *)(v5 + 10920) = self->_timeSincePrevJoin;
  objc_storeStrong((id *)(v5 + 10880), self->_lastCoexRealTimeOn);
  objc_storeStrong((id *)(v5 + 10888), self->_lastCoexRealTimeOff);
  *(_BYTE *)(v5 + 9047) = p_isSessionActive[31];
  *(void *)(v5 + 11000) = self->_savedPrevJoinReason;
  *(double *)(v5 + 11016) = self->_savedTimeSincePrevJoin;
  *(void *)(v5 + 10936) = self->_countRoamScan;
  *(_BYTE *)(v5 + 9044) = p_isSessionActive[28];
  *(void *)(v5 + 10944) = self->_countSSIDTransitionTargetInLastRoamScan;
  *(void *)(v5 + 10952) = self->_countRoamScanThatFoundSSIDTransitionTarget;
  *(_BYTE *)(v5 + 9045) = p_isSessionActive[29];
  *(void *)(v5 + 10960) = self->_countSSIDTransitionPotentialCandidatesInLastRoamScan;
  *(void *)(v5 + 10968) = self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet;
  *(_BYTE *)(v5 + 9046) = p_isSessionActive[30];
  *(void *)(v5 + 10984) = self->_lastRoamScanUniqueChannelsCount;
  *(void *)(v5 + 10992) = self->_lastRoamScanUniqueBandsCount;
  *(void *)(v5 + 10976) = self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
  *(void *)(v5 + 11024) = self->_inPoorLinkSessionCount;
  *(double *)(v5 + 11032) = self->_inPoorLinkSessionDuration;
  *(void *)(v5 + 11040) = self->_tdAfterJoinAfterTDCount;
  *(void *)(v5 + 11056) = self->_min_subsequentTdAfterJoinAfterTDCount;
  *(void *)(v5 + 11064) = self->_max_subsequentTdAfterJoinAfterTDCount;
  *(void *)(v5 + 11072) = self->_tdSessionStartedByBadRSSICount;
  *(void *)(v5 + 11080) = self->_tdSessionStartedByTDRecommendedCount;
  *(void *)(v5 + 11088) = self->_tdSessionStartedBySymptomDNSFailureCount;
  *(void *)(v5 + 11096) = self->_tdEvalEndedCount;
  *(double *)(v5 + 11104) = self->_tdEvalCumulativeDuration;
  *(void *)(v5 + 11112) = self->_tdEvalStartedCount;
  *(void *)(v5 + 11120) = self->_tdEvalStartedByBadRSSICount;
  *(void *)(v5 + 11128) = self->_tdEvalStartedBySymptomsARPFailureCount;
  *(void *)(v5 + 11136) = self->_tdEvalStartedBySymptomsDNSFailCount;
  *(void *)(v5 + 11144) = self->_tdEvalStartedBySymptomsShortFlowCount;
  *(void *)(v5 + 11160) = self->_tdEvalStartedBySymptomsDataStallCount;
  *(void *)(v5 + 11168) = self->_tdEvalStartedBySymptomsDNSStallCount;
  *(void *)(v5 + 11136) = self->_tdEvalStartedBySymptomsDNSFailCount;
  *(void *)(v5 + 11176) = self->_tdEvalStartedByActiveProbingCount;
  *(void *)(v5 + 11184) = self->_tdEvalStartedByFGNetwAppChangeCount;
  *(void *)(v5 + 11192) = self->_tdEvalStartedByUserNotificationCount;
  *(void *)(v5 + 11200) = self->_tdEvalStartedByCheckReassocCount;
  objc_storeStrong((id *)(v5 + 11216), self->_lastUsbStatusChange);
  *(_BYTE *)(v5 + 9050) = p_isSessionActive[34];
  *(void *)(v5 + 11208) = self->_usbDeviceEventCount;
  *(double *)(v5 + 11224) = self->_usbInsertedDuration;
  objc_storeStrong((id *)(v5 + 11232), self->_lastAWDLSequenceUpdate);
  *(void *)(v5 + 11240) = self->_inAWDL_BestInfraScore;
  *(void *)(v5 + 11248) = self->_inAWDL_WorstInfraScore;
  *(double *)(v5 + 11256) = self->_inAWDL_BestP2PScore;
  *(double *)(v5 + 11264) = self->_inAWDL_WorstP2PScore;
  *(void *)(v5 + 11272) = self->_inAWDL_lastInfraScore;
  *(double *)(v5 + 11280) = self->_inAWDL_lastP2PScore;
  *(double *)(v5 + 11288) = self->_inAWDL_BestInfraScoreDuration;
  *(double *)(v5 + 11296) = self->_inAWDL_BestP2PScoreDuration;
  *(double *)(v5 + 11304) = self->_inAWDL_WorstInfraScoreDuration;
  *(double *)(v5 + 11312) = self->_inAWDL_WorstP2PScoreDuration;
  *(void *)(v5 + 11320) = self->_forwardedBssInwakeCount;
  *(void *)(v5 + 11328) = self->_forwardedBssInSleepCount;
  *(void *)(v5 + 11336) = self->_hostScanTriggersCount;
  *(void *)(v5 + 11344) = self->_roamScanTriggersCount;
  *(void *)(v5 + 11352) = self->_pnoScanTriggersCount;
  *(void *)(v5 + 11360) = self->_epnoScanTriggersCount;
  *(void *)(v5 + 11368) = self->_currentBssMsgInWakeCount;
  *(void *)(v5 + 11376) = self->_currentBssMsgInSleepCount;
  *(void *)(v5 + 11384) = self->_scanDataMsgInWakeCount;
  *(void *)(v5 + 11392) = self->_scanDataMsgInSleepCount;
  *(void *)(v5 + 11400) = self->_spmiMsgInAwakeCount;
  *(void *)(v5 + 11408) = self->_spmiMsgInSleepCount;
  *(void *)(v5 + 11416) = self->_spmiMsgDropRssiFilterCount;
  *(void *)(v5 + 11424) = self->_spmiMsgDropMaxFilterCount;
  *(void *)(v5 + 11432) = self->_spmiMsgDropSpmiFailCount;
  *(void *)(v5 + 11440) = self->_bssDropLowMemoryCount;
  *(_DWORD *)(v5 + 9064) = self->_maxPhyMode;
  *(_BYTE *)(v5 + 9051) = p_isSessionActive[35];
  *(_BYTE *)(v5 + 9052) = p_isSessionActive[36];
  return (id)v5;
}

- (unint64_t)faultReasonCount:(unint64_t)a3
{
  if (a3 - 1 > 0x20) {
    return 0LL;
  }
  else {
    return self->_faultReasonCount[a3];
  }
}

- (id)metricName
{
  return 0LL;
}

- (void)enableXCTestNotifications
{
  self->_xctest = 1;
}

- (void)receivedBssTransitionRequestWithCandidateListIncluded:(BOOL)a3 isAbridged:(BOOL)a4 disassociationImminent:(BOOL)a5 bssTerminationIncluded:(BOOL)a6 essDisassociationImminent:(BOOL)a7
{
}

- (void)sentBssTransitionResponseWithStatus:(int64_t)a3 terminationDelayRequested:(BOOL)a4
{
}

- (void)processIPv4Changes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  id v9 = v4;
  if (v4 && self->_ipV4DetailsPrevSession)
  {
    int v6 = [v4 isValid];
    uint64_t v5 = v9;
    if (v6)
    {
      BOOL v7 = -[WiFiUsageNetworkIPv4Details isEqual:](self->_ipV4DetailsPrevSession, "isEqual:", v9);
      uint64_t v5 = v9;
      self->_hasDifferentIpv4DetailsThanPrevSession = !v7;
    }
  }

  else if (!v4)
  {
    goto LABEL_8;
  }

  int v8 = [v5 isValid];
  uint64_t v5 = v9;
  if (v8)
  {
    -[WiFiUsageSession setIpV4Details:](self, "setIpV4Details:", v9);
    uint64_t v5 = v9;
  }

- (void)processIPv6Changes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  id v9 = v4;
  if (v4 && self->_ipV6DetailsPrevSession)
  {
    int v6 = [v4 isValid];
    uint64_t v5 = v9;
    if (v6)
    {
      char v7 = -[WiFiUsageNetworkIPv6Details isEqual:](self->_ipV6DetailsPrevSession, "isEqual:", v9);
      uint64_t v5 = v9;
      self->_hasDifferentIpv6DetailsThanPrevSession = v7 ^ 1;
    }
  }

  else if (!v4)
  {
    goto LABEL_8;
  }

  int v8 = [v5 isValid];
  uint64_t v5 = v9;
  if (v8)
  {
    -[WiFiUsageSession setIpV6Details:](self, "setIpV6Details:", v9);
    uint64_t v5 = v9;
  }

- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5
{
  BOOL v5 = a3;
  id v14 = a5;
  p_BOOL inCoexRealTime = &self->_inCoexRealTime;
  BOOL inCoexRealTime = self->_inCoexRealTime;
  if (!self->_inCoexRealTime && v5)
  {
    [MEMORY[0x189603F50] now];
    uint64_t v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastCoexRealTimeOn = self->_lastCoexRealTimeOn;
    self->_lastCoexRealTimeOn = v10;

    BOOL inCoexRealTime = *p_inCoexRealTime;
  }

  if (inCoexRealTime && !v5)
  {
    [MEMORY[0x189603F50] now];
    uint64_t v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastCoexRealTimeOff = self->_lastCoexRealTimeOff;
    self->_lastCoexRealTimeOff = v12;
  }

  BOOL *p_inCoexRealTime = v5;
}

- (void)setAwdlSequence:(id)a3 infraScore:(unint64_t)a4 p2pScore:(double)a5
{
  int v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (self->_isAssociated) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = 0LL;
  }
  -[WiFiUsageSession tallyInfraScoreDuration:until:](self, "tallyInfraScoreDuration:until:", v9, v8);
  -[WiFiUsageSession tallyP2PScoreDuration:until:](self, "tallyP2PScoreDuration:until:", v8, a5);
  lastAWDLSequenceUpdate = self->_lastAWDLSequenceUpdate;
  self->_lastAWDLSequenceUpdate = v8;
}

- (void)updateLinkRecoveryDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = v5;
  if (v3)
  {
    if (!self->_linkRecoveryDisabled)
    {
      int v8 = v5;
      -[WiFiUsageSession setLinkRecoveryDisabledTime:](self, "setLinkRecoveryDisabledTime:", v5);
      int v6 = v8;
      ++self->_linkRecoveryDisabledCount;
    }
  }

  else if (self->_linkRecoveryDisabledTime)
  {
    unint64_t v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_linkRecoveryDisabledDuration = v7 + self->_linkRecoveryDisabledDuration;
    -[WiFiUsageSession setLinkRecoveryDisabledTime:](self, "setLinkRecoveryDisabledTime:", 0LL);
    int v6 = v9;
  }

  self->_linkRecoveryDisabled = v3;
}

- (BOOL)infraIsPartOfSplitSSID
{
  return -[WiFiUsageSession bandAtSessionStart](self, "bandAtSessionStart") == 2
      && -[WiFiUsageNetworkDetails isStandalone6E](self->_networkDetails, "isStandalone6E");
}

- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11
{
  id v16 = a11;
  [MEMORY[0x189603F50] date];
  double v13 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = -[WiFiUsageSession isDriverAvailable](self, "isDriverAvailable");
  if (a4)
  {
    if (!v14)
    {
      -[WiFiUsageSession setLastDriverAvailableTime:](self, "setLastDriverAvailableTime:", v13);
      if (self->_lastChipResetTime && self->_driverAvailabilityLatencyFromChipReset == 0.0)
      {
        objc_msgSend(v13, "timeIntervalSinceDate:");
        -[WiFiUsageSession setDriverAvailabilityLatencyFromChipReset:]( self,  "setDriverAvailabilityLatencyFromChipReset:");
      }

      if (self->_lastDriverTerminationTime && self->_driverAvailabilityLatencyFromTermination == 0.0)
      {
        objc_msgSend(v13, "timeIntervalSinceDate:");
        -[WiFiUsageSession setDriverAvailabilityLatencyFromTermination:]( self,  "setDriverAvailabilityLatencyFromTermination:");
      }
    }
  }

  else if (v14)
  {
    unint64_t driverUnavailabilityCount = self->_driverUnavailabilityCount;
    if (!driverUnavailabilityCount)
    {
      -[WiFiUsageSession trackEventLatencies](self, "trackEventLatencies");
      unint64_t driverUnavailabilityCount = self->_driverUnavailabilityCount;
    }

    self->_unint64_t driverUnavailabilityCount = driverUnavailabilityCount + 1;
  }

  if (v16 && !self->_lastDriverUnavailableReason && [v16 length]) {
    -[WiFiUsageSession setLastDriverUnavailableReason:](self, "setLastDriverUnavailableReason:", v16);
  }
  -[WiFiUsageSession setIsDriverAvailable:](self, "setIsDriverAvailable:", a4 != 0);
}

- (void)ipConfigurationDidChangeWithMethod:(BOOL)a3 dhcpLeaseDuration:(double)a4 hasRoutableIpV4:(BOOL)a5 hasRoutableIpV6:(BOOL)a6
{
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_joinIpConfigurationLatencyFromDriverAvailability == 0.0
    && self->_lastDriverAvailableTime
    && (a5 || a6 || self->_lastInterfacePrimaryState))
  {
    id v10 = v9;
    objc_msgSend(v9, "timeIntervalSinceDate:");
    -[WiFiUsageSession setJoinIpConfigurationLatencyFromDriverAvailability:]( self,  "setJoinIpConfigurationLatencyFromDriverAvailability:");
    unint64_t v9 = v10;
  }
}

- (void)interfaceRankingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_joinInterfaceRankingLatencyFromDriverAvailability == 0.0)
  {
    if (self->_lastDriverAvailableTime) {
      BOOL v5 = !v3;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      objc_msgSend(v6, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinInterfaceRankingLatencyFromDriverAvailability:]( self,  "setJoinInterfaceRankingLatencyFromDriverAvailability:");
    }
  }

  -[WiFiUsageSession setLastInterfacePrimaryState:](self, "setLastInterfacePrimaryState:", v3);
}

- (void)updateWithRoamingSuppression:(unsigned __int8)a3
{
  int v3 = a3;
  [MEMORY[0x189603F50] now];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!self->_isRoamSuppressionEnabled)
    {
      ++self->_inRoamSuppressionEnabledCount;
      p_lastRoamSuppressionToggled = &self->_lastRoamSuppressionToggled;
LABEL_6:
      id obja = v5;
      objc_storeStrong((id *)p_lastRoamSuppressionToggled, v5);
      BOOL v5 = obja;
    }
  }

  else if (self->_isRoamSuppressionEnabled)
  {
    self->_unint64_t roamsAfterSupprLifted = 0LL;
    p_lastRoamSuppressionToggled = &self->_lastRoamSuppressionToggled;
    obuint64_t j = v5;
    [v5 timeIntervalSinceDate:self->_lastRoamSuppressionToggled];
    BOOL v5 = obj;
    self->_inRoamSuppressionEnabled = v7 + self->_inRoamSuppressionEnabled;
    goto LABEL_6;
  }

  self->_isRoamSuppressionEnabled = v3 != 0;
}

- (void)updateWithCompatibilityMode:(unsigned __int8)a3
{
  int v3 = a3;
  p_int isCompatibilityModeEnabled = &self->_isCompatibilityModeEnabled;
  int isCompatibilityModeEnabled = self->_isCompatibilityModeEnabled;
  if (!a3 && self->_isCompatibilityModeEnabled)
  {
    -[NSDate timeIntervalSinceNow](self->_lastCompatibilityModeChangedTime, "timeIntervalSinceNow");
    self->_inCompatibilityModeEnabledDuration = self->_inCompatibilityModeEnabledDuration - v7;
    int isCompatibilityModeEnabled = *p_isCompatibilityModeEnabled;
  }

  if (isCompatibilityModeEnabled != v3)
  {
    -[WiFiUsageSession setIsCompatibilityModeEnabled:](self, "setIsCompatibilityModeEnabled:", v3 != 0);
    ++self->_compatibilityModeChangeCount;
    [MEMORY[0x189603F50] now];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", v8);
  }

- (void)updateAssociatedNetworkDetails:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v18 = v4;
    [MEMORY[0x189603F50] now];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_networkDetails)
    {
      [v18 networkName];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
      double v7 = (void *)objc_claimAutoreleasedReturnValue();
      int v8 = [v6 isEqualToString:v7];

      [v18 disable6eMode];
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8) {
        -[WiFiUsageSession update6eModeStats:](self, "update6eModeStats:", v9);
      }
      else {
        -[WiFiUsageSession summarizeAndReset6eModeStats:](self, "summarizeAndReset6eModeStats:", v9);
      }
    }

    else
    {
      [v18 disable6eMode];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession setNetworkDisable6eModeAtStart:](self, "setNetworkDisable6eModeAtStart:", v10);

      [v18 disable6eMode];
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9) {
        double v11 = v5;
      }
      else {
        double v11 = 0LL;
      }
      -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", v11);
    }

    if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive") || !self->_networkDetails) {
      goto LABEL_17;
    }
    [v18 networkName];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 isEqualToString:v13])
    {
      -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = [v14 band];
      [v18 connectedBss];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = [v16 band];

      if (v15 == v17)
      {
LABEL_17:
        -[WiFiUsageSession setNetworkDetails:](self, "setNetworkDetails:", v18);

        id v4 = v18;
        goto LABEL_18;
      }

      -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", [v12 band], v5);
    }

    else
    {
    }

    goto LABEL_17;
  }

- (void)update6eModeStats:(id)a3
{
  id v14 = a3;
  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 isEqualToString:v14];

  if ((v5 & 1) == 0)
  {
    -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = [v6 isEqualToString:@"off"];

    if (v7)
    {
      [MEMORY[0x189603F50] now];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v9 = v8;
      if (self->_lastNetwork6eDisableModeChangedTime)
      {
        objc_msgSend(v8, "timeIntervalSinceDate:");
        self->_double inNetwork6eModeOffDuration = v10 + self->_inNetwork6eModeOffDuration;
      }
    }

    -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
    double v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      ++self->_network6eDisabledModeChangeCount;
      [MEMORY[0x189603F50] now];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", v12);
    }

    else
    {
      -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:]( self,  "setLastNetwork6eDisableModeChangedTime:",  self->_sessionStartTime);
    }
  }

  -[WiFiUsageSession networkDisable6eModeAtStart](self, "networkDisable6eModeAtStart");
  double v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13) {
    -[WiFiUsageSession setNetworkDisable6eModeAtStart:](self, "setNetworkDisable6eModeAtStart:", v14);
  }
}

- (void)summarizeAndReset6eModeStats:(id)a3
{
  id v4 = (void *)MEMORY[0x189603F50];
  id v5 = a3;
  [v4 now];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqualToString:@"off"])
  {
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;

    if (lastNetwork6eDisableModeChangedTime)
    {
      [v10 timeIntervalSinceDate:self->_lastNetwork6eDisableModeChangedTime];
      self->_double inNetwork6eModeOffDuration = v8 + self->_inNetwork6eModeOffDuration;
    }
  }

  else
  {
  }

  -[WiFiUsageSession setLastSSIDdisable6eModeAtStart:]( self,  "setLastSSIDdisable6eModeAtStart:",  self->_networkDisable6eModeAtStart);
  -[WiFiUsageSession setLastSSIDdisabled6eModeChangeCount:]( self,  "setLastSSIDdisabled6eModeChangeCount:",  self->_network6eDisabledModeChangeCount);
  -[WiFiUsageSession setLastSSIDIn6eModeOffDuration:]( self,  "setLastSSIDIn6eModeOffDuration:",  self->_inNetwork6eModeOffDuration);
  -[WiFiUsageSession setNetworkDisable6eModeAtStart:](self, "setNetworkDisable6eModeAtStart:", v5);

  if (v5) {
    id v9 = v10;
  }
  else {
    id v9 = 0LL;
  }
  -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", v9);
}

- (void)setSSIDTransitionCandidates:(id)a3 SSIDTransitionPotentialCandidates:(id)a4 potentialCandidatesMinusCandidates:(id)a5 roamCandidates:(unint64_t)a6 uniqueChannels:(unint64_t)a7 uniqueBands:(unint64_t)a8
{
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    ++self->_countRoamScan;
    uint64_t v16 = [v20 count];
    uint64_t v17 = [v14 count];
    -[WiFiUsageSession setLastRoamScanFoundSSIDTransitionTarget:]( self,  "setLastRoamScanFoundSSIDTransitionTarget:",  v16 != 0);
    -[WiFiUsageSession setCountSSIDTransitionTargetInLastRoamScan:]( self,  "setCountSSIDTransitionTargetInLastRoamScan:",  v16);
    unint64_t countRoamScanThatFoundSSIDTransitionTarget = self->_countRoamScanThatFoundSSIDTransitionTarget;
    if (v16) {
      ++countRoamScanThatFoundSSIDTransitionTarget;
    }
    self->_unint64_t countRoamScanThatFoundSSIDTransitionTarget = countRoamScanThatFoundSSIDTransitionTarget;
    -[WiFiUsageSession setLastRoamScanFoundSSIDTransitionPotentialCandidate:]( self,  "setLastRoamScanFoundSSIDTransitionPotentialCandidate:",  v17 != 0);
    -[WiFiUsageSession setCountSSIDTransitionPotentialCandidatesInLastRoamScan:]( self,  "setCountSSIDTransitionPotentialCandidatesInLastRoamScan:",  v17);
    unint64_t countRoamScanThatFoundSSIDTransitionPotentialCandidate = self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    if (v17) {
      ++countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    }
    self->_unint64_t countRoamScanThatFoundSSIDTransitionPotentialCandidate = countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet = [v15 count];
    self->_lastRoamScanContainsRoamCandidateCount = a6 != 0;
    self->_lastRoamScanUniqueChannelsCount = a7;
    self->_lastRoamScanUniqueBandsCount = a8;
  }
}

- (void)updateUsbInsertedDuration:(id)a3
{
  id v4 = (NSDate *)a3;
  id v5 = v4;
  lastUsbStatusChange = self->_lastUsbStatusChange;
  if (!lastUsbStatusChange) {
    lastUsbStatusChange = self->_sessionStartTime;
  }
  -[NSDate timeIntervalSinceDate:](v4, "timeIntervalSinceDate:", lastUsbStatusChange);
  self->_usbInsertedDuration = v7 + self->_usbInsertedDuration;
  double v8 = self->_lastUsbStatusChange;
  self->_lastUsbStatusChange = v5;
}

- (void)updateUsbStatus:(BOOL)a3 currentDevices:(id)a4
{
  id v9 = a4;
  [MEMORY[0x189603F50] now];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v9 count];
  if (!self->_lastUsbStatusChange)
  {
    if (![v9 count]) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (!self->_anyUsbDeviceConnected && v6 != 0)
  {
    objc_storeStrong((id *)&self->_lastUsbStatusChange, v5);
    goto LABEL_14;
  }

  if (self->_anyUsbDeviceConnected && v6 == 0) {
LABEL_13:
  }
    -[WiFiUsageSession updateUsbInsertedDuration:](self, "updateUsbInsertedDuration:", v5);
LABEL_14:
  self->_anyUsbDeviceConnected = [v9 count] != 0;
  ++self->_usbDeviceEventCount;
}

- (id)description
{
  int v3 = (void *)NSString;
  -[WiFiUsageSession sessionName](self, "sessionName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isSessionActive) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  sessionStartTime = self->_sessionStartTime;
  sessionEndTime = self->_sessionEndTime;
  -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@ session (active:%@ start:%@ end:%@ network:%@)", v4, v5, sessionStartTime, sessionEndTime, v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)redactedDescription
{
  int v3 = (void *)NSString;
  uint64_t v4 = -[WiFiUsageSession sessionName](self, "sessionName");
  id v5 = (void *)v4;
  if (self->_isSessionActive) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 stringWithFormat:@"%@ session (active:%@ start:%@ end:%@ network:<REDACTED>)", v4, v6, self->_sessionStartTime, self->_sessionEndTime];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)tallyAssociatedDuration:(id)a3
{
  lastLinkStateChangedTime = self->_lastLinkStateChangedTime;
  if (lastLinkStateChangedTime)
  {
    sessionStartTime = self->_sessionStartTime;
    id v6 = a3;
    -[NSDate laterDate:](lastLinkStateChangedTime, "laterDate:", sessionStartTime);
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    self->_double associatedDuration = v9 + self->_associatedDuration;
    -[WiFiUsageSession setLastLinkStateChangedTime:](self, "setLastLinkStateChangedTime:", 0LL);
  }

- (void)tallyInfraScoreDuration:(unint64_t)a3 until:(id)a4
{
  id v6 = a4;
  unint64_t inAWDL_BestInfraScore = self->_inAWDL_BestInfraScore;
  if (self->_inAWDL_lastInfraScore == inAWDL_BestInfraScore)
  {
    if (self->_lastAWDLSequenceUpdate)
    {
      id v11 = v6;
      objc_msgSend(v6, "timeIntervalSinceDate:");
      id v6 = v11;
      self->_double inAWDL_BestInfraScoreDuration = v8 + self->_inAWDL_BestInfraScoreDuration;
      unint64_t inAWDL_BestInfraScore = self->_inAWDL_BestInfraScore;
    }

    else
    {
      unint64_t inAWDL_BestInfraScore = self->_inAWDL_lastInfraScore;
    }
  }

  if (inAWDL_BestInfraScore < a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_unint64_t inAWDL_BestInfraScore = a3;
    self->_double inAWDL_BestInfraScoreDuration = 0.0;
  }

  unint64_t inAWDL_WorstInfraScore = self->_inAWDL_WorstInfraScore;
  if (self->_inAWDL_lastInfraScore == inAWDL_WorstInfraScore)
  {
    if (self->_lastAWDLSequenceUpdate)
    {
      id v12 = v6;
      objc_msgSend(v6, "timeIntervalSinceDate:");
      id v6 = v12;
      self->_double inAWDL_WorstInfraScoreDuration = v10 + self->_inAWDL_WorstInfraScoreDuration;
      unint64_t inAWDL_WorstInfraScore = self->_inAWDL_WorstInfraScore;
    }

    else
    {
      unint64_t inAWDL_WorstInfraScore = self->_inAWDL_lastInfraScore;
    }
  }

  if (inAWDL_WorstInfraScore > a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_unint64_t inAWDL_WorstInfraScore = a3;
    self->_double inAWDL_WorstInfraScoreDuration = 0.0;
  }

  self->_inAWDL_lastInfraScore = a3;
}

- (void)tallyP2PScoreDuration:(double)a3 until:(id)a4
{
  id v6 = a4;
  double inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  if (self->_inAWDL_lastP2PScore == inAWDL_BestP2PScore && self->_lastAWDLSequenceUpdate)
  {
    id v11 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    id v6 = v11;
    self->_double inAWDL_BestP2PScoreDuration = v8 + self->_inAWDL_BestP2PScoreDuration;
    double inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  }

  if (inAWDL_BestP2PScore < a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_double inAWDL_BestP2PScore = a3;
    self->_double inAWDL_BestP2PScoreDuration = 0.0;
  }

  double inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  if (self->_inAWDL_lastP2PScore == inAWDL_WorstP2PScore && self->_lastAWDLSequenceUpdate)
  {
    id v12 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    id v6 = v12;
    self->_double inAWDL_WorstP2PScoreDuration = v10 + self->_inAWDL_WorstP2PScoreDuration;
    double inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  }

  if (inAWDL_WorstP2PScore > a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_double inAWDL_WorstP2PScore = a3;
    self->_double inAWDL_WorstP2PScoreDuration = 0.0;
  }

  self->_inAWDL_lastP2PScore = a3;
}

- (void)updateScanForwardStats:(id)a3
{
  id v21 = a3;
  [v21 objectForKey:@"SCAN_FWD_STATS_BSS_AWAKE_CNT"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4) {
    self->_forwardedBssInwakeCount += [v4 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_BSS_SLEEP_CNT"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    self->_forwardedBssInSleepCount += [v6 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_HOST_SCAN_CNT"];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7) {
    self->_hostScanTriggersCount += [v7 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_ROAM_SCAN_CNT"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    self->_roamScanTriggersCount += [v8 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_PNO_SCAN_CNT"];
  double v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    self->_pnoScanTriggersCount += [v9 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_EPNO_SCAN_CNT"];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    self->_epnoScanTriggersCount += [v10 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_CUR_BSS_AWAKE_CNT"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11) {
    self->_currentBssMsgInWakeCount += [v11 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_CUR_BSS_SLEEP_CNT"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    self->_currentBssMsgInSleepCount += [v12 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_SCAN_DATA_AWAKE_CNT"];
  double v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13) {
    self->_scanDataMsgInWakeCount += [v13 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_SCAN_DATA_SLEEP_CNT"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14) {
    self->_scanDataMsgInSleepCount += [v14 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_AWAKE_CNT"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15) {
    self->_spmiMsgInAwakeCount += [v15 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_SLEEP_CNT"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16) {
    self->_spmiMsgInSleepCount += [v16 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_DROP_RSSI_CNT"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17) {
    self->_spmiMsgDropRssiFilterCount += [v17 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_DROP_MAX_CNT"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18) {
    self->_spmiMsgDropMaxFilterCount += [v18 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_DROP_FAIL_CNT"];
  double v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19) {
    self->_spmiMsgDropSpmiFailCount += [v19 unsignedIntegerValue];
  }
  [v21 objectForKey:@"SCAN_FWD_STATS_BSS_DROP_LOW_MEM_CNT"];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20) {
    self->_bssDropLowMemoryCount += [v20 unsignedIntegerValue];
  }
}

- (BOOL)canSubmitToCA
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  ca_config = self->_ca_config;
  if (!ca_config || -[WiFiUsageSessionCAConfig canSubmit](ca_config, "canSubmit")) {
    return 1;
  }
  BOOL v5 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v5)
  {
    -[WiFiUsageSession sessionName](self, "sessionName");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession metricName](self, "metricName");
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession ca_config](self, "ca_config");
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = 138413058;
    double v10 = v6;
    __int16 v11 = 2080;
    id v12 = "-[WiFiUsageSession canSubmitToCA]";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%@ %s - skipping %@ submission (%@)",  (uint8_t *)&v9,  0x2Au);

    return 0;
  }

  return result;
}

- (id)describeCAConfig
{
  return -[WiFiUsageSessionCAConfig description](self->_ca_config, "description");
}

- (void)recordCAsubmission
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (double)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(double)a3
{
  self->_double sessionDuration = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (WiFiUsageNetworkDetails)networkDetails
{
  return self->_networkDetails;
}

- (void)setNetworkDetails:(id)a3
{
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (void)setIsSessionActive:(BOOL)a3
{
  self->_isSessionActive = a3;
}

- (BOOL)privacyRestrictionDisabled
{
  return self->_privacyRestrictionDisabled;
}

- (void)setPrivacyRestrictionDisabled:(BOOL)a3
{
  self->_privacyRestrictionDisabled = a3;
}

- (WiFiUsageBssSession)currentBssSession
{
  return self->_currentBssSession;
}

- (void)setCurrentBssSession:(id)a3
{
}

- (NSNumber)responsivenessScore
{
  return self->_responsivenessScore;
}

- (void)setResponsivenessScore:(id)a3
{
  self->_responsivenessScore = (NSNumber *)a3;
}

- (NSDate)processInitTime
{
  return self->_processInitTime;
}

- (void)setProcessInitTime:(id)a3
{
}

- (BOOL)isAssociated
{
  return self->_isAssociated;
}

- ($06992ED503081CE345EDB9EEA121564E)bandUsageDuration
{
  __int128 v3 = *(_OWORD *)&self[359].var0[1];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[358].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setBandUsageDuration:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_bandUsageDuration.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_bandUsageDuration.valueByBand[2] = v3;
}

- (BOOL)xctest
{
  return self->_xctest;
}

- (void)setXctest:(BOOL)a3
{
  self->_xctest = a3;
}

- (BOOL)isDisplayOn
{
  return self->_isDisplayOn;
}

- (void)setIsDisplayOn:(BOOL)a3
{
  self->_isDisplayOn = a3;
}

- (BOOL)isUnlocked
{
  return self->_isUnlocked;
}

- (void)setIsUnlocked:(BOOL)a3
{
  self->_isUnlocked = a3;
}

- (BOOL)isInHomeScreen
{
  return self->_isInHomeScreen;
}

- (void)setIsInHomeScreen:(BOOL)a3
{
  self->_isInHomeScreen = a3;
}

- (unint64_t)roamsAfterSupprLifted
{
  return self->_roamsAfterSupprLifted;
}

- (void)setRoamsAfterSupprLifted:(unint64_t)a3
{
  self->_unint64_t roamsAfterSupprLifted = a3;
}

- (BOOL)isDriverAvailable
{
  return self->_isDriverAvailable;
}

- (void)setIsDriverAvailable:(BOOL)a3
{
  self->_isDriverAvailable = a3;
}

- (unint64_t)driverUnavailabilityCount
{
  return self->_driverUnavailabilityCount;
}

- (void)setDriverUnavailabilityCount:(unint64_t)a3
{
  self->_unint64_t driverUnavailabilityCount = a3;
}

- (int)currentBand
{
  return self->_currentBand;
}

- (void)setCurrentBand:(int)a3
{
  self->_currentBand = a3;
}

- (NSString)secondaryInterfaceName
{
  return self->_secondaryInterfaceName;
}

- (void)setSecondaryInterfaceName:(id)a3
{
}

- (WiFiUsageSessionCAConfig)ca_config
{
  return self->_ca_config;
}

- (void)setCa_config:(id)a3
{
}

- (BOOL)poweredOn
{
  return self->_poweredOn;
}

- (void)setPoweredOn:(BOOL)a3
{
  self->_poweredOn = a3;
}

- (BOOL)controlCenterEnabled
{
  return self->_controlCenterEnabled;
}

- (void)setControlCenterEnabled:(BOOL)a3
{
  self->_controlCenterEnabled = a3;
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

- (BOOL)linkRecoveryDisabled
{
  return self->_linkRecoveryDisabled;
}

- (void)setLinkRecoveryDisabled:(BOOL)a3
{
  self->_linkRecoveryDisabled = a3;
}

- (NSString)cellularDataStatus
{
  return self->_cellularDataStatus;
}

- (void)setCellularDataStatus:(id)a3
{
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
}

- (unint64_t)sessionPid
{
  return self->_sessionPid;
}

- (void)setSessionPid:(unint64_t)a3
{
  self->_sessionPid = a3;
}

- (WiFiUsageNetworkDetails)networkDetailsAtEnd
{
  return self->_networkDetailsAtEnd;
}

- (void)setNetworkDetailsAtEnd:(id)a3
{
}

- (unint64_t)lastJoinReason
{
  return self->_lastJoinReason;
}

- (void)setLastJoinReason:(unint64_t)a3
{
  self->_unint64_t lastJoinReason = a3;
}

- (int64_t)lastJoinFailure
{
  return self->_lastJoinFailure;
}

- (void)setLastJoinFailure:(int64_t)a3
{
  self->_lastJoinFailure = a3;
}

- (int64_t)lastDisconnectReason
{
  return self->_lastDisconnectReason;
}

- (int64_t)lastDisconnectSubreason
{
  return self->_lastDisconnectSubreason;
}

- (void)setLastDisconnectSubreason:(int64_t)a3
{
  self->_lastDisconnectSubreason = a3;
}

- (int64_t)previousDisconnectReason
{
  return self->_previousDisconnectReason;
}

- (void)setPreviousDisconnectReason:(int64_t)a3
{
  self->_previousDisconnectReason = a3;
}

- (unint64_t)savedLastJoinReason
{
  return self->_savedLastJoinReason;
}

- (void)setSavedLastJoinReason:(unint64_t)a3
{
  self->_savedLastJoinReason = a3;
}

- (int64_t)savedLastJoinFailure
{
  return self->_savedLastJoinFailure;
}

- (void)setSavedLastJoinFailure:(int64_t)a3
{
  self->_savedLastJoinFailure = a3;
}

- (int64_t)savedPreviousDisconnectReason
{
  return self->_savedPreviousDisconnectReason;
}

- (void)setSavedPreviousDisconnectReason:(int64_t)a3
{
  self->_savedPreviousDisconnectReason = a3;
}

- (BOOL)lastInterfacePrimaryState
{
  return self->_lastInterfacePrimaryState;
}

- (void)setLastInterfacePrimaryState:(BOOL)a3
{
  self->_lastInterfacePrimaryState = a3;
}

- (NSDate)sessionInitTime
{
  return self->_sessionInitTime;
}

- (void)setSessionInitTime:(id)a3
{
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
}

- (NSDate)sessionEndTime
{
  return self->_sessionEndTime;
}

- (void)setSessionEndTime:(id)a3
{
}

- (NSDate)mediaStartedTime
{
  return self->_mediaStartedTime;
}

- (void)setMediaStartedTime:(id)a3
{
}

- (NSDate)chargingStartedTime
{
  return self->_chargingStartedTime;
}

- (void)setChargingStartedTime:(id)a3
{
}

- (NSDate)companionConnectionTime
{
  return self->_companionConnectionTime;
}

- (void)setCompanionConnectionTime:(id)a3
{
}

- (NSDate)callStartedTime
{
  return self->_callStartedTime;
}

- (void)setCallStartedTime:(id)a3
{
}

- (NSDate)inWalkingEntryTime
{
  return self->_inWalkingEntryTime;
}

- (void)setInWalkingEntryTime:(id)a3
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

- (NSDate)softApActiveTime
{
  return self->_softApActiveTime;
}

- (void)setSoftApActiveTime:(id)a3
{
}

- (NSDate)lastPowerStateChangedTime
{
  return self->_lastPowerStateChangedTime;
}

- (void)setLastPowerStateChangedTime:(id)a3
{
}

- (NSDate)lastControlCenterStateChangedTime
{
  return self->_lastControlCenterStateChangedTime;
}

- (void)setLastControlCenterStateChangedTime:(id)a3
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

- (NSDate)lastSystemWakeTime
{
  return self->_lastSystemWakeTime;
}

- (void)setLastSystemWakeTime:(id)a3
{
}

- (NSDate)lastSystemSleepTime
{
  return self->_lastSystemSleepTime;
}

- (void)setLastSystemSleepTime:(id)a3
{
}

- (NSDate)lastUnexpectedLinkDownTime
{
  return self->_lastUnexpectedLinkDownTime;
}

- (void)setLastUnexpectedLinkDownTime:(id)a3
{
}

- (NSDate)lastLinkStateChangedTime
{
  return self->_lastLinkStateChangedTime;
}

- (void)setLastLinkStateChangedTime:(id)a3
{
}

- (NSDate)lastPowerBudgetChangedTime
{
  return self->_lastPowerBudgetChangedTime;
}

- (void)setLastPowerBudgetChangedTime:(id)a3
{
}

- (NSDate)lastBssChangedTime
{
  return self->_lastBssChangedTime;
}

- (void)setLastBssChangedTime:(id)a3
{
}

- (NSDate)lastCompatibilityModeChangedTime
{
  return self->_lastCompatibilityModeChangedTime;
}

- (void)setLastCompatibilityModeChangedTime:(id)a3
{
}

- (NSDate)linkRecoveryDisabledTime
{
  return self->_linkRecoveryDisabledTime;
}

- (void)setLinkRecoveryDisabledTime:(id)a3
{
}

- (NSDate)wowStateEntryTime
{
  return self->_wowStateEntryTime;
}

- (void)setWowStateEntryTime:(id)a3
{
}

- (NSDate)lpasStateEntryTime
{
  return self->_lpasStateEntryTime;
}

- (void)setLpasStateEntryTime:(id)a3
{
}

- (NSDate)lowPowerStateEntryTime
{
  return self->_lowPowerStateEntryTime;
}

- (void)setLowPowerStateEntryTime:(id)a3
{
}

- (NSDate)batterySaverStateEntryTime
{
  return self->_batterySaverStateEntryTime;
}

- (void)setBatterySaverStateEntryTime:(id)a3
{
}

- (double)sessionTimeSinceLastSession
{
  return self->_sessionTimeSinceLastSession;
}

- (void)setSessionTimeSinceLastSession:(double)a3
{
  self->_sessionTimeSinceLastSession = a3;
}

- (double)systemAwakeDuration
{
  return self->_systemAwakeDuration;
}

- (void)setSystemAwakeDuration:(double)a3
{
  self->_systemAwakeDuration = a3;
}

- (double)mediaPlaybackDuration
{
  return self->_mediaPlaybackDuration;
}

- (void)setMediaPlaybackDuration:(double)a3
{
  self->_mediaPlaybackDuration = a3;
}

- (double)chargingDuration
{
  return self->_chargingDuration;
}

- (void)setChargingDuration:(double)a3
{
  self->_chargingDuration = a3;
}

- (double)companionConnectedDuration
{
  return self->_companionConnectedDuration;
}

- (void)setCompanionConnectedDuration:(double)a3
{
  self->_companionConnectedDuration = a3;
}

- (double)inCallDuration
{
  return self->_inCallDuration;
}

- (void)setInCallDuration:(double)a3
{
  self->_inCallDuration = a3;
}

- (double)inWalkingDuration
{
  return self->_inWalkingDuration;
}

- (void)setInWalkingDuration:(double)a3
{
  self->_inWalkingDuration = a3;
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
  self->_inA2dpDuration = a3;
}

- (double)inScoDuration
{
  return self->_inScoDuration;
}

- (void)setInScoDuration:(double)a3
{
  self->_inScoDuration = a3;
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
  self->_inAwdlDuration = a3;
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
  self->_inScanDuration = a3;
}

- (double)inSoftApDuration
{
  return self->_inSoftApDuration;
}

- (void)setInSoftApDuration:(double)a3
{
  self->_inSoftApDuration = a3;
}

- (double)poweredOnDuration
{
  return self->_poweredOnDuration;
}

- (void)setPoweredOnDuration:(double)a3
{
  self->_poweredOnDuration = a3;
}

- (double)associatedDuration
{
  return self->_associatedDuration;
}

- (void)setAssociatedDuration:(double)a3
{
  self->_double associatedDuration = a3;
}

- (double)associatedSleepDuration
{
  return self->_associatedSleepDuration;
}

- (void)setAssociatedSleepDuration:(double)a3
{
  self->_associatedSleepDuration = a3;
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

- (double)inControlCenterAutoJoinDisabledDuration
{
  return self->_inControlCenterAutoJoinDisabledDuration;
}

- (void)setInControlCenterAutoJoinDisabledDuration:(double)a3
{
  self->_inControlCenterAutoJoinDisabledDuration = a3;
}

- (double)inCompatibilityModeEnabledDuration
{
  return self->_inCompatibilityModeEnabledDuration;
}

- (void)setInCompatibilityModeEnabledDuration:(double)a3
{
  self->_inCompatibilityModeEnabledDuration = a3;
}

- (double)linkRecoveryDisabledDuration
{
  return self->_linkRecoveryDisabledDuration;
}

- (void)setLinkRecoveryDisabledDuration:(double)a3
{
  self->_linkRecoveryDisabledDuration = a3;
}

- (double)inWowStateDuration
{
  return self->_inWowStateDuration;
}

- (void)setInWowStateDuration:(double)a3
{
  self->_inWowStateDuration = a3;
}

- (double)inLpasStateDuration
{
  return self->_inLpasStateDuration;
}

- (void)setInLpasStateDuration:(double)a3
{
  self->_inLpasStateDuration = a3;
}

- (double)inLowPowerStateDuration
{
  return self->_inLowPowerStateDuration;
}

- (void)setInLowPowerStateDuration:(double)a3
{
  self->_inLowPowerStateDuration = a3;
}

- (double)inBatterySaverStateDuration
{
  return self->_inBatterySaverStateDuration;
}

- (void)setInBatterySaverStateDuration:(double)a3
{
  self->_inBatterySaverStateDuration = a3;
}

- (double)sleepPowerStatsTotalDuration
{
  return self->_sleepPowerStatsTotalDuration;
}

- (void)setSleepPowerStatsTotalDuration:(double)a3
{
  self->_sleepPowerStatsTotalDuration = a3;
}

- (double)sleepPowerStatsUnassociatedDuration
{
  return self->_sleepPowerStatsUnassociatedDuration;
}

- (void)setSleepPowerStatsUnassociatedDuration:(double)a3
{
  self->_sleepPowerStatsUndouble associatedDuration = a3;
}

- (double)sleepPowerStatsAssociatedDuration
{
  return self->_sleepPowerStatsAssociatedDuration;
}

- (void)setSleepPowerStatsAssociatedDuration:(double)a3
{
  self->_sleepPowerStatsAssociatedDuration = a3;
}

- (double)sleepPowerStatsRoamingDuration
{
  return self->_sleepPowerStatsRoamingDuration;
}

- (void)setSleepPowerStatsRoamingDuration:(double)a3
{
  self->_sleepPowerStatsRoamingDuration = a3;
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

- (unint64_t)roamStatusFailedNoScan
{
  return self->_roamStatusFailedNoScan;
}

- (void)setRoamStatusFailedNoScan:(unint64_t)a3
{
  self->_roamStatusFailedNoScan = a3;
}

- (unint64_t)roamIsWNMScoreUsedCount
{
  return self->_roamIsWNMScoreUsedCount;
}

- (void)setRoamIsWNMScoreUsedCount:(unint64_t)a3
{
  self->_roamIsWNMScoreUsedCount = a3;
}

- (unint64_t)roamPingPongAboveThresholdCount
{
  return self->_roamPingPongAboveThresholdCount;
}

- (void)setRoamPingPongAboveThresholdCount:(unint64_t)a3
{
  self->_roamPingPongAboveThresholdCount = a3;
}

- (unint64_t)roamPingPongAboveThresholdCountLowRssiOnly
{
  return self->_roamPingPongAboveThresholdCountLowRssiOnly;
}

- (void)setRoamPingPongAboveThresholdCountLowRssiOnly:(unint64_t)a3
{
  self->_roamPingPongAboveThresholdCountLowRssiOnly = a3;
}

- (unint64_t)roamPingPongLowRssiAndReassocOnly
{
  return self->_roamPingPongLowRssiAndReassocOnly;
}

- (void)setRoamPingPongLowRssiAndReassocOnly:(unint64_t)a3
{
  self->_roamPingPongLowRssiAndReassocOnly = a3;
}

- (unint64_t)roamPingPongReassocOnly
{
  return self->_roamPingPongReassocOnly;
}

- (void)setRoamPingPongReassocOnly:(unint64_t)a3
{
  self->_roamPingPongReassocOnly = a3;
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

- (double)inRoamSuppressionEnabled
{
  return self->_inRoamSuppressionEnabled;
}

- (void)setInRoamSuppressionEnabled:(double)a3
{
  self->_inRoamSuppressionEnabled = a3;
}

- (double)inRoamSuppressionWaitForRoamStart
{
  return self->_inRoamSuppressionWaitForRoamStart;
}

- (void)setInRoamSuppressionWaitForRoamStart:(double)a3
{
  self->_double inRoamSuppressionWaitForRoamStart = a3;
}

- (double)inRoamSuppressionWaitForRoamEnd
{
  return self->_inRoamSuppressionWaitForRoamEnd;
}

- (void)setInRoamSuppressionWaitForRoamEnd:(double)a3
{
  self->_double inRoamSuppressionWaitForRoamEnd = a3;
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
  self->_currentRSSIStrongestCount = a3;
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
  __int128 v3 = *(_OWORD *)&self[360].var0[1];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[359].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSICountByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSIByBand
{
  __int128 v3 = *(_OWORD *)&self[361].var0[1];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[360].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSIByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToBestRssiByBandTransition
{
  *(void *)&retstr->var1[2][2] = self[132].var0[1][2];
  __int128 v3 = *(_OWORD *)&self[132].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[131].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[132].var0[1][0];
  __int128 v4 = *(_OWORD *)&self[131].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[131].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToBestRssiByBandTransition:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[1][1];
  __int128 v4 = *(_OWORD *)&a3->var0[2][0];
  __int128 v5 = *(_OWORD *)&a3->var0[2][2];
  *(void *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2] = *(void *)&a3->var1[2][2];
  __int128 v6 = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0] = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2] = v6;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0] = v4;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2] = v5;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToBestRssiByBandTransition
{
  __int128 v3 = *(_OWORD *)&self[133].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[132].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[133].var0[1][0];
  *(void *)&retstr->var1[2][2] = self[133].var0[1][2];
  __int128 v4 = *(_OWORD *)&self[132].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[132].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToBestRssiByBandTransition:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2] = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0] = v3;
  __int128 v4 = *(_OWORD *)&a3->var0[1][1];
  __int128 v5 = *(_OWORD *)&a3->var0[2][0];
  __int128 v6 = *(_OWORD *)&a3->var0[2][2];
  *(void *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2] = *(void *)&a3->var1[2][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2] = v6;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0] = v5;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1] = v4;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToNextBestRssiByBandTransition
{
  *(void *)&retstr->var1[2][2] = self[134].var0[1][2];
  __int128 v3 = *(_OWORD *)&self[134].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[133].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[134].var0[1][0];
  __int128 v4 = *(_OWORD *)&self[133].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[133].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToNextBestRssiByBandTransition:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[1][1];
  __int128 v4 = *(_OWORD *)&a3->var0[2][0];
  __int128 v5 = *(_OWORD *)&a3->var0[2][2];
  *(void *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2] = *(void *)&a3->var1[2][2];
  __int128 v6 = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = v6;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = v4;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = v5;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToNextBestRssiByBandTransition
{
  __int128 v3 = *(_OWORD *)&self[135].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[134].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[135].var0[1][0];
  *(void *)&retstr->var1[2][2] = self[135].var0[1][2];
  __int128 v4 = *(_OWORD *)&self[134].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[134].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToNextBestRssiByBandTransition:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = v3;
  __int128 v4 = *(_OWORD *)&a3->var0[1][1];
  __int128 v5 = *(_OWORD *)&a3->var0[2][0];
  __int128 v6 = *(_OWORD *)&a3->var0[2][2];
  *(void *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2] = *(void *)&a3->var1[2][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = v6;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = v5;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = v4;
}

- (NSMutableDictionary)roamCandidatesPerBandWhenSuccessful
{
  return self->_roamCandidatesPerBandWhenSuccessful;
}

- (void)setRoamCandidatesPerBandWhenSuccessful:(id)a3
{
}

- (NSMutableDictionary)roamCandidatesPerBandWhenUnSuccessful
{
  return self->_roamCandidatesPerBandWhenUnSuccessful;
}

- (void)setRoamCandidatesPerBandWhenUnSuccessful:(id)a3
{
}

- (double)powerBudgetMaxDuration
{
  return self->_powerBudgetMaxDuration;
}

- (void)setPowerBudgetMaxDuration:(double)a3
{
  self->_powerBudgetMaxDuration = a3;
}

- (double)powerBudget90Duration
{
  return self->_powerBudget90Duration;
}

- (void)setPowerBudget90Duration:(double)a3
{
  self->_powerBudget90Duration = a3;
}

- (double)powerBudget80Duration
{
  return self->_powerBudget80Duration;
}

- (void)setPowerBudget80Duration:(double)a3
{
  self->_powerBudget80Duration = a3;
}

- (double)powerBudget70Duration
{
  return self->_powerBudget70Duration;
}

- (void)setPowerBudget70Duration:(double)a3
{
  self->_powerBudget70Duration = a3;
}

- (double)powerBudget60Duration
{
  return self->_powerBudget60Duration;
}

- (void)setPowerBudget60Duration:(double)a3
{
  self->_powerBudget60Duration = a3;
}

- (double)powerBudget50Duration
{
  return self->_powerBudget50Duration;
}

- (void)setPowerBudget50Duration:(double)a3
{
  self->_powerBudget50Duration = a3;
}

- (double)powerBudget40Duration
{
  return self->_powerBudget40Duration;
}

- (void)setPowerBudget40Duration:(double)a3
{
  self->_powerBudget40Duration = a3;
}

- (double)powerBudget30Duration
{
  return self->_powerBudget30Duration;
}

- (void)setPowerBudget30Duration:(double)a3
{
  self->_powerBudget30Duration = a3;
}

- (double)powerBudget20Duration
{
  return self->_powerBudget20Duration;
}

- (void)setPowerBudget20Duration:(double)a3
{
  self->_powerBudget20Duration = a3;
}

- (double)powerBudget10Duration
{
  return self->_powerBudget10Duration;
}

- (void)setPowerBudget10Duration:(double)a3
{
  self->_powerBudget10Duration = a3;
}

- (double)powerBudgetMinDuration
{
  return self->_powerBudgetMinDuration;
}

- (void)setPowerBudgetMinDuration:(double)a3
{
  self->_powerBudgetMinDuration = a3;
}

- (double)thermalIndexMaxDuration
{
  return self->_thermalIndexMaxDuration;
}

- (void)setThermalIndexMaxDuration:(double)a3
{
  self->_thermalIndexMaxDuration = a3;
}

- (double)thermalIndex90Duration
{
  return self->_thermalIndex90Duration;
}

- (void)setThermalIndex90Duration:(double)a3
{
  self->_thermalIndex90Duration = a3;
}

- (double)thermalIndex80Duration
{
  return self->_thermalIndex80Duration;
}

- (void)setThermalIndex80Duration:(double)a3
{
  self->_thermalIndex80Duration = a3;
}

- (double)thermalIndex70Duration
{
  return self->_thermalIndex70Duration;
}

- (void)setThermalIndex70Duration:(double)a3
{
  self->_thermalIndex70Duration = a3;
}

- (double)thermalIndex60Duration
{
  return self->_thermalIndex60Duration;
}

- (void)setThermalIndex60Duration:(double)a3
{
  self->_thermalIndex60Duration = a3;
}

- (double)thermalIndex50Duration
{
  return self->_thermalIndex50Duration;
}

- (void)setThermalIndex50Duration:(double)a3
{
  self->_thermalIndex50Duration = a3;
}

- (double)thermalIndex40Duration
{
  return self->_thermalIndex40Duration;
}

- (void)setThermalIndex40Duration:(double)a3
{
  self->_thermalIndex40Duration = a3;
}

- (double)thermalIndex30Duration
{
  return self->_thermalIndex30Duration;
}

- (void)setThermalIndex30Duration:(double)a3
{
  self->_thermalIndex30Duration = a3;
}

- (double)thermalIndex20Duration
{
  return self->_thermalIndex20Duration;
}

- (void)setThermalIndex20Duration:(double)a3
{
  self->_thermalIndex20Duration = a3;
}

- (double)thermalIndex10Duration
{
  return self->_thermalIndex10Duration;
}

- (void)setThermalIndex10Duration:(double)a3
{
  self->_thermalIndex10Duration = a3;
}

- (double)thermalIndexMinDuration
{
  return self->_thermalIndexMinDuration;
}

- (void)setThermalIndexMinDuration:(double)a3
{
  self->_thermalIndexMinDuration = a3;
}

- (unint64_t)mediaPlaybackEventCount
{
  return self->_mediaPlaybackEventCount;
}

- (void)setMediaPlaybackEventCount:(unint64_t)a3
{
  self->_mediaPlaybackEventCount = a3;
}

- (unint64_t)chargingEventCount
{
  return self->_chargingEventCount;
}

- (void)setChargingEventCount:(unint64_t)a3
{
  self->_chargingEventCount = a3;
}

- (unint64_t)inCallEventCount
{
  return self->_inCallEventCount;
}

- (void)setInCallEventCount:(unint64_t)a3
{
  self->_inCallEventCount = a3;
}

- (unint64_t)inWalkingEventCount
{
  return self->_inWalkingEventCount;
}

- (void)setInWalkingEventCount:(unint64_t)a3
{
  self->_inWalkingEventCount = a3;
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

- (unint64_t)inSoftApEventCount
{
  return self->_inSoftApEventCount;
}

- (void)setInSoftApEventCount:(unint64_t)a3
{
  self->_inSoftApEventCount = a3;
}

- (unint64_t)rangingEventCount
{
  return self->_rangingEventCount;
}

- (void)setRangingEventCount:(unint64_t)a3
{
  self->_rangingEventCount = a3;
}

- (unint64_t)companionConnectionStateChangedCount
{
  return self->_companionConnectionStateChangedCount;
}

- (void)setCompanionConnectionStateChangedCount:(unint64_t)a3
{
  self->_companionConnectionStateChangedCount = a3;
}

- (unint64_t)linkRecoveryDisabledCount
{
  return self->_linkRecoveryDisabledCount;
}

- (void)setLinkRecoveryDisabledCount:(unint64_t)a3
{
  self->_linkRecoveryDisabledCount = a3;
}

- (unint64_t)wowStateChangedCount
{
  return self->_wowStateChangedCount;
}

- (void)setWowStateChangedCount:(unint64_t)a3
{
  self->_wowStateChangedCount = a3;
}

- (unint64_t)lpasStateChangedCount
{
  return self->_lpasStateChangedCount;
}

- (void)setLpasStateChangedCount:(unint64_t)a3
{
  self->_lpasStateChangedCount = a3;
}

- (unint64_t)lowPowerStateChangedCount
{
  return self->_lowPowerStateChangedCount;
}

- (void)setLowPowerStateChangedCount:(unint64_t)a3
{
  self->_lowPowerStateChangedCount = a3;
}

- (unint64_t)batterySaverStateChangedCount
{
  return self->_batterySaverStateChangedCount;
}

- (void)setBatterySaverStateChangedCount:(unint64_t)a3
{
  self->_batterySaverStateChangedCount = a3;
}

- (unint64_t)systemWakeStateChangedCount
{
  return self->_systemWakeStateChangedCount;
}

- (void)setSystemWakeStateChangedCount:(unint64_t)a3
{
  self->_systemWakeStateChangedCount = a3;
}

- (unint64_t)systemWokenByWiFiCount
{
  return self->_systemWokenByWiFiCount;
}

- (void)setSystemWokenByWiFiCount:(unint64_t)a3
{
  self->_systemWokenByWiFiCount = a3;
}

- (unint64_t)lockStateChangedCount
{
  return self->_lockStateChangedCount;
}

- (void)setLockStateChangedCount:(unint64_t)a3
{
  self->_lockStateChangedCount = a3;
}

- (unint64_t)displayStateChangedCount
{
  return self->_displayStateChangedCount;
}

- (void)setDisplayStateChangedCount:(unint64_t)a3
{
  self->_displayStateChangedCount = a3;
}

- (unint64_t)networkChangedCount
{
  return self->_networkChangedCount;
}

- (void)setNetworkChangedCount:(unint64_t)a3
{
  self->_networkChangedCount = a3;
}

- (unint64_t)joinStateChangedCount
{
  return self->_joinStateChangedCount;
}

- (void)setJoinStateChangedCount:(unint64_t)a3
{
  self->_joinStateChangedCount = a3;
}

- (unint64_t)savedJoinStateChangedCount
{
  return self->_savedJoinStateChangedCount;
}

- (void)setSavedJoinStateChangedCount:(unint64_t)a3
{
  self->_savedJoinStateChangedCount = a3;
}

- (unint64_t)linkStateChangedCount
{
  return self->_linkStateChangedCount;
}

- (void)setLinkStateChangedCount:(unint64_t)a3
{
  self->_linkStateChangedCount = a3;
}

- (unint64_t)applicationStateChangedCount
{
  return self->_applicationStateChangedCount;
}

- (void)setApplicationStateChangedCount:(unint64_t)a3
{
  self->_applicationStateChangedCount = a3;
}

- (unint64_t)powerStateChangedCount
{
  return self->_powerStateChangedCount;
}

- (void)setPowerStateChangedCount:(unint64_t)a3
{
  self->_powerStateChangedCount = a3;
}

- (unint64_t)powerToggleEventCount
{
  return self->_powerToggleEventCount;
}

- (void)setPowerToggleEventCount:(unint64_t)a3
{
  self->_powerToggleEventCount = a3;
}

- (unint64_t)smartCoverStateChangedCount
{
  return self->_smartCoverStateChangedCount;
}

- (void)setSmartCoverStateChangedCount:(unint64_t)a3
{
  self->_smartCoverStateChangedCount = a3;
}

- (NSString)lastSmartCoverState
{
  return self->_lastSmartCoverState;
}

- (void)setLastSmartCoverState:(id)a3
{
}

- (unint64_t)controlCenterStateChangedCount
{
  return self->_controlCenterStateChangedCount;
}

- (void)setControlCenterStateChangedCount:(unint64_t)a3
{
  self->_controlCenterStateChangedCount = a3;
}

- (unint64_t)controlCenterToggleEventCount
{
  return self->_controlCenterToggleEventCount;
}

- (void)setControlCenterToggleEventCount:(unint64_t)a3
{
  self->_controlCenterToggleEventCount = a3;
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

- (unint64_t)rapidLinkTransitionCount
{
  return self->_rapidLinkTransitionCount;
}

- (void)setRapidLinkTransitionCount:(unint64_t)a3
{
  self->_rapidLinkTransitionCount = a3;
}

- (unint64_t)primaryInterfaceStateChangeCount
{
  return self->_primaryInterfaceStateChangeCount;
}

- (void)setPrimaryInterfaceStateChangeCount:(unint64_t)a3
{
  self->_primaryInterfaceStateChangeCount = a3;
}

- (unint64_t)compatibilityModeChangeCount
{
  return self->_compatibilityModeChangeCount;
}

- (void)setCompatibilityModeChangeCount:(unint64_t)a3
{
  self->_unint64_t compatibilityModeChangeCount = a3;
}

- (unint64_t)consecutiveJoinFailureCount
{
  return self->_consecutiveJoinFailureCount;
}

- (void)setConsecutiveJoinFailureCount:(unint64_t)a3
{
  self->_consecutiveJoinFailureCount = a3;
}

- (unint64_t)airplaneModeStateChangedCount
{
  return self->_airplaneModeStateChangedCount;
}

- (void)setAirplaneModeStateChangedCount:(unint64_t)a3
{
  self->_airplaneModeStateChangedCount = a3;
}

- (unint64_t)neighborBssCount
{
  return self->_neighborBssCount;
}

- (void)setNeighborBssCount:(unint64_t)a3
{
  self->_neighborBssCount = a3;
}

- (unint64_t)otherBssCount
{
  return self->_otherBssCount;
}

- (void)setOtherBssCount:(unint64_t)a3
{
  self->_otherBssCount = a3;
}

- (WiFiUsageInterfaceStats)ifStatsAtStart
{
  return self->_ifStatsAtStart;
}

- (void)setIfStatsAtStart:(id)a3
{
}

- (WiFiUsageInterfaceStats)secondaryIfStatsAtStart
{
  return self->_secondaryIfStatsAtStart;
}

- (void)setSecondaryIfStatsAtStart:(id)a3
{
}

- (unint64_t)netInterfaceTxBytes
{
  return self->_netInterfaceTxBytes;
}

- (void)setNetInterfaceTxBytes:(unint64_t)a3
{
  self->_netInterfaceTxBytes = a3;
}

- (unint64_t)netInterfaceRxBytes
{
  return self->_netInterfaceRxBytes;
}

- (void)setNetInterfaceRxBytes:(unint64_t)a3
{
  self->_netInterfaceRxBytes = a3;
}

- (unint64_t)secondaryInterfaceTxBytes
{
  return self->_secondaryInterfaceTxBytes;
}

- (void)setSecondaryInterfaceTxBytes:(unint64_t)a3
{
  self->_secondaryInterfaceTxBytes = a3;
}

- (unint64_t)secondaryInterfaceRxBytes
{
  return self->_secondaryInterfaceRxBytes;
}

- (void)setSecondaryInterfaceRxBytes:(unint64_t)a3
{
  self->_secondaryInterfaceRxBytes = a3;
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

- (NSDate)lastDriverTerminationTime
{
  return self->_lastDriverTerminationTime;
}

- (void)setLastDriverTerminationTime:(id)a3
{
}

- (NSDate)lastChipResetTime
{
  return self->_lastChipResetTime;
}

- (void)setLastChipResetTime:(id)a3
{
}

- (NSDate)lastDriverAvailableTime
{
  return self->_lastDriverAvailableTime;
}

- (void)setLastDriverAvailableTime:(id)a3
{
}

- (NSString)lastDriverUnavailableReason
{
  return self->_lastDriverUnavailableReason;
}

- (void)setLastDriverUnavailableReason:(id)a3
{
}

- (double)driverProcessLifespan
{
  return self->_driverProcessLifespan;
}

- (void)setDriverProcessLifespan:(double)a3
{
  self->_driverProcessLifespan = a3;
}

- (double)driverAvailabilityLifespan
{
  return self->_driverAvailabilityLifespan;
}

- (void)setDriverAvailabilityLifespan:(double)a3
{
  self->_driverAvailabilityLifespan = a3;
}

- (double)driverAvailabilityLatencyFromChipReset
{
  return self->_driverAvailabilityLatencyFromChipReset;
}

- (void)setDriverAvailabilityLatencyFromChipReset:(double)a3
{
  self->_driverAvailabilityLatencyFromChipReset = a3;
}

- (double)driverAvailabilityLatencyFromTermination
{
  return self->_driverAvailabilityLatencyFromTermination;
}

- (void)setDriverAvailabilityLatencyFromTermination:(double)a3
{
  self->_driverAvailabilityLatencyFromTermination = a3;
}

- (double)joinScanLatencyFromDriverAvailability
{
  return self->_joinScanLatencyFromDriverAvailability;
}

- (void)setJoinScanLatencyFromDriverAvailability:(double)a3
{
  self->_joinScanLatencyFromDriverAvailability = a3;
}

- (double)joinStartedLatencyFromDriverAvailability
{
  return self->_joinStartedLatencyFromDriverAvailability;
}

- (void)setJoinStartedLatencyFromDriverAvailability:(double)a3
{
  self->_joinStartedLatencyFromDriverAvailability = a3;
}

- (double)joinLinkUpLatencyFromDriverAvailability
{
  return self->_joinLinkUpLatencyFromDriverAvailability;
}

- (void)setJoinLinkUpLatencyFromDriverAvailability:(double)a3
{
  self->_joinLinkUpLatencyFromDriverAvailability = a3;
}

- (double)joinIpConfigurationLatencyFromDriverAvailability
{
  return self->_joinIpConfigurationLatencyFromDriverAvailability;
}

- (void)setJoinIpConfigurationLatencyFromDriverAvailability:(double)a3
{
  self->_joinIpConfigurationLatencyFromDriverAvailability = a3;
}

- (double)joinInterfaceRankingLatencyFromDriverAvailability
{
  return self->_joinInterfaceRankingLatencyFromDriverAvailability;
}

- (void)setJoinInterfaceRankingLatencyFromDriverAvailability:(double)a3
{
  self->_joinInterfaceRankingLatencyFromDriverAvailability = a3;
}

- (double)joinLinkUpLatencyFromSessionStart
{
  return self->_joinLinkUpLatencyFromSessionStart;
}

- (void)setJoinLinkUpLatencyFromSessionStart:(double)a3
{
  self->_joinLinkUpLatencyFromSessionStart = a3;
}

- (double)longestUnassociatedDuration
{
  return self->_longestUnassociatedDuration;
}

- (void)setLongestUnassociatedDuration:(double)a3
{
  self->_longestUndouble associatedDuration = a3;
}

- (WiFiUsageSessionLQM)lqm
{
  return self->_lqm;
}

- (void)setLqm:(id)a3
{
}

- (NSMutableSet)activeApplications
{
  return self->_activeApplications;
}

- (void)setActiveApplications:(id)a3
{
}

- (int64_t)lastPowerBudget
{
  return self->_lastPowerBudget;
}

- (void)setLastPowerBudget:(int64_t)a3
{
  self->_int64_t lastPowerBudget = a3;
}

- (int64_t)lastThermalIndex
{
  return self->_lastThermalIndex;
}

- (void)setLastThermalIndex:(int64_t)a3
{
  self->_int64_t lastThermalIndex = a3;
}

- (int)bandAtSessionStart
{
  return self->_bandAtSessionStart;
}

- (void)setBandAtSessionStart:(int)a3
{
  self->_bandAtSessionStart = a3;
}

- (BOOL)isAssociatedAtSessionStart
{
  return self->_isAssociatedAtSessionStart;
}

- (void)setIsAssociatedAtSessionStart:(BOOL)a3
{
  self->_isAssociatedAtSessionStart = a3;
}

- (int64_t)rssiAtSessionStart
{
  return self->_rssiAtSessionStart;
}

- (void)setRssiAtSessionStart:(int64_t)a3
{
  self->_rssiAtSessionStart = a3;
}

- (unint64_t)network6eDisabledModeChangeCount
{
  return self->_network6eDisabledModeChangeCount;
}

- (void)setNetwork6eDisabledModeChangeCount:(unint64_t)a3
{
  self->_network6eDisabledModeChangeCount = a3;
}

- (unint64_t)lastSSIDdisabled6eModeChangeCount
{
  return self->_lastSSIDdisabled6eModeChangeCount;
}

- (void)setLastSSIDdisabled6eModeChangeCount:(unint64_t)a3
{
  self->_lastSSIDdisabled6eModeChangeCount = a3;
}

- (NSString)networkDisable6eModeAtStart
{
  return self->_networkDisable6eModeAtStart;
}

- (void)setNetworkDisable6eModeAtStart:(id)a3
{
}

- (NSString)lastSSIDdisable6eModeAtStart
{
  return self->_lastSSIDdisable6eModeAtStart;
}

- (void)setLastSSIDdisable6eModeAtStart:(id)a3
{
}

- (NSDate)lastNetwork6eDisableModeChangedTime
{
  return self->_lastNetwork6eDisableModeChangedTime;
}

- (void)setLastNetwork6eDisableModeChangedTime:(id)a3
{
}

- (double)inNetwork6eModeOffDuration
{
  return self->_inNetwork6eModeOffDuration;
}

- (void)setInNetwork6eModeOffDuration:(double)a3
{
  self->_double inNetwork6eModeOffDuration = a3;
}

- (double)lastSSIDIn6eModeOffDuration
{
  return self->_lastSSIDIn6eModeOffDuration;
}

- (void)setLastSSIDIn6eModeOffDuration:(double)a3
{
  self->_lastSSIDIn6eModeOffDuration = a3;
}

- (WiFiUsageNetworkIPv4Details)ipV4Details
{
  return self->_ipV4Details;
}

- (void)setIpV4Details:(id)a3
{
}

- (WiFiUsageNetworkIPv6Details)ipV6Details
{
  return self->_ipV6Details;
}

- (void)setIpV6Details:(id)a3
{
}

- (WiFiUsageNetworkIPv4Details)ipV4DetailsPrevSession
{
  return self->_ipV4DetailsPrevSession;
}

- (void)setIpV4DetailsPrevSession:(id)a3
{
}

- (WiFiUsageNetworkIPv6Details)ipV6DetailsPrevSession
{
  return self->_ipV6DetailsPrevSession;
}

- (void)setIpV6DetailsPrevSession:(id)a3
{
}

- (BOOL)hasDifferentIpv4DetailsThanPrevSession
{
  return self->_hasDifferentIpv4DetailsThanPrevSession;
}

- (void)setHasDifferentIpv4DetailsThanPrevSession:(BOOL)a3
{
  self->_hasDifferentIpv4DetailsThanPrevSession = a3;
}

- (BOOL)hasDifferentIpv6DetailsThanPrevSession
{
  return self->_hasDifferentIpv6DetailsThanPrevSession;
}

- (void)setHasDifferentIpv6DetailsThanPrevSession:(BOOL)a3
{
  self->_hasDifferentIpv6DetailsThanPrevSession = a3;
}

- (BOOL)inCoexRealTime
{
  return self->_inCoexRealTime;
}

- (void)setInCoexRealTime:(BOOL)a3
{
  self->_BOOL inCoexRealTime = a3;
}

- (BOOL)inCoexRealTimeAtSessionStart
{
  return self->_inCoexRealTimeAtSessionStart;
}

- (void)setInCoexRealTimeAtSessionStart:(BOOL)a3
{
  self->_inCoexRealTimeAtSessionStart = a3;
}

- (BOOL)inCoexRealTimeAtLastJoin
{
  return self->_inCoexRealTimeAtLastJoin;
}

- (void)setInCoexRealTimeAtLastJoin:(BOOL)a3
{
  self->_inCoexRealTimeAtLastJoin = a3;
}

- (NSDate)lastCoexRealTimeOn
{
  return self->_lastCoexRealTimeOn;
}

- (void)setLastCoexRealTimeOn:(id)a3
{
}

- (NSDate)lastCoexRealTimeOff
{
  return self->_lastCoexRealTimeOff;
}

- (void)setLastCoexRealTimeOff:(id)a3
{
}

- (NSMutableArray)prevNetworkNames
{
  return self->_prevNetworkNames;
}

- (void)setPrevNetworkNames:(id)a3
{
}

- (unint64_t)prevJoinReason
{
  return self->_prevJoinReason;
}

- (void)setPrevJoinReason:(unint64_t)a3
{
  self->_prevJoinReason = a3;
}

- (NSDate)lastJoinTime
{
  return self->_lastJoinTime;
}

- (void)setLastJoinTime:(id)a3
{
}

- (double)timeSincePrevJoin
{
  return self->_timeSincePrevJoin;
}

- (void)setTimeSincePrevJoin:(double)a3
{
  self->_timeSincePrevJoin = a3;
}

- (BOOL)isA2DPActive
{
  return self->_isA2DPActive;
}

- (void)setIsA2DPActive:(BOOL)a3
{
  self->_isA2DPActive = a3;
}

- (BOOL)isSCOActive
{
  return self->_isSCOActive;
}

- (void)setIsSCOActive:(BOOL)a3
{
  self->_isSCOActive = a3;
}

- (BOOL)isUniAoSActive
{
  return self->_isUniAoSActive;
}

- (void)setIsUniAoSActive:(BOOL)a3
{
  self->_isUniAoSActive = a3;
}

- (BOOL)isBiAoSActive
{
  return self->_isBiAoSActive;
}

- (void)setIsBiAoSActive:(BOOL)a3
{
  self->_isBiAoSActive = a3;
}

- (NSString)btAudioBand
{
  return self->_btAudioBand;
}

- (void)setBtAudioBand:(id)a3
{
}

- (unint64_t)countRoamScan
{
  return self->_countRoamScan;
}

- (void)setCountRoamScan:(unint64_t)a3
{
  self->_countRoamScan = a3;
}

- (BOOL)lastRoamScanFoundSSIDTransitionTarget
{
  return self->_lastRoamScanFoundSSIDTransitionTarget;
}

- (void)setLastRoamScanFoundSSIDTransitionTarget:(BOOL)a3
{
  self->_lastRoamScanFoundSSIDTransitionTarget = a3;
}

- (unint64_t)countSSIDTransitionTargetInLastRoamScan
{
  return self->_countSSIDTransitionTargetInLastRoamScan;
}

- (void)setCountSSIDTransitionTargetInLastRoamScan:(unint64_t)a3
{
  self->_countSSIDTransitionTargetInLastRoamScan = a3;
}

- (unint64_t)countRoamScanThatFoundSSIDTransitionTarget
{
  return self->_countRoamScanThatFoundSSIDTransitionTarget;
}

- (void)setCountRoamScanThatFoundSSIDTransitionTarget:(unint64_t)a3
{
  self->_unint64_t countRoamScanThatFoundSSIDTransitionTarget = a3;
}

- (BOOL)lastRoamScanFoundSSIDTransitionPotentialCandidate
{
  return self->_lastRoamScanFoundSSIDTransitionPotentialCandidate;
}

- (void)setLastRoamScanFoundSSIDTransitionPotentialCandidate:(BOOL)a3
{
  self->_lastRoamScanFoundSSIDTransitionPotentialCandidate = a3;
}

- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScan
{
  return self->_countSSIDTransitionPotentialCandidatesInLastRoamScan;
}

- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScan:(unint64_t)a3
{
  self->_countSSIDTransitionPotentialCandidatesInLastRoamScan = a3;
}

- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet
{
  return self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet;
}

- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:(unint64_t)a3
{
  self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet = a3;
}

- (unint64_t)countRoamScanThatFoundSSIDTransitionPotentialCandidate
{
  return self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
}

- (void)setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:(unint64_t)a3
{
  self->_unint64_t countRoamScanThatFoundSSIDTransitionPotentialCandidate = a3;
}

- (BOOL)lastRoamScanContainsRoamCandidateCount
{
  return self->_lastRoamScanContainsRoamCandidateCount;
}

- (void)setLastRoamScanContainsRoamCandidateCount:(BOOL)a3
{
  self->_lastRoamScanContainsRoamCandidateCount = a3;
}

- (unint64_t)lastRoamScanUniqueChannelsCount
{
  return self->_lastRoamScanUniqueChannelsCount;
}

- (void)setLastRoamScanUniqueChannelsCount:(unint64_t)a3
{
  self->_lastRoamScanUniqueChannelsCount = a3;
}

- (unint64_t)lastRoamScanUniqueBandsCount
{
  return self->_lastRoamScanUniqueBandsCount;
}

- (void)setLastRoamScanUniqueBandsCount:(unint64_t)a3
{
  self->_lastRoamScanUniqueBandsCount = a3;
}

- (BOOL)savedInCoexRealTimeAtLastJoin
{
  return self->_savedInCoexRealTimeAtLastJoin;
}

- (void)setSavedInCoexRealTimeAtLastJoin:(BOOL)a3
{
  self->_savedInCoexRealTimeAtLastJoin = a3;
}

- (unint64_t)savedPrevJoinReason
{
  return self->_savedPrevJoinReason;
}

- (void)setSavedPrevJoinReason:(unint64_t)a3
{
  self->_savedPrevJoinReason = a3;
}

- (NSDate)savedLastJoinTime
{
  return self->_savedLastJoinTime;
}

- (void)setSavedLastJoinTime:(id)a3
{
}

- (double)savedTimeSincePrevJoin
{
  return self->_savedTimeSincePrevJoin;
}

- (void)setSavedTimeSincePrevJoin:(double)a3
{
  self->_savedTimeSincePrevJoin = a3;
}

- (BOOL)lastJoinWhileDeferForTD
{
  return self->_lastJoinWhileDeferForTD;
}

- (void)setLastJoinWhileDeferForTD:(BOOL)a3
{
  self->_lastJoinWhileDeferForTD = a3;
}

- (unint64_t)inPoorLinkSessionCount
{
  return self->_inPoorLinkSessionCount;
}

- (void)setInPoorLinkSessionCount:(unint64_t)a3
{
  self->_inPoorLinkSessionCount = a3;
}

- (double)inPoorLinkSessionDuration
{
  return self->_inPoorLinkSessionDuration;
}

- (void)setInPoorLinkSessionDuration:(double)a3
{
  self->_inPoorLinkSessionDuration = a3;
}

- (unint64_t)tdAfterJoinAfterTDCount
{
  return self->_tdAfterJoinAfterTDCount;
}

- (void)setTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_tdAfterJoinAfterTDCount = a3;
}

- (unint64_t)current_subsequentTdAfterJoinAfterTDCount
{
  return self->_current_subsequentTdAfterJoinAfterTDCount;
}

- (void)setCurrent_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_unint64_t current_subsequentTdAfterJoinAfterTDCount = a3;
}

- (unint64_t)min_subsequentTdAfterJoinAfterTDCount
{
  return self->_min_subsequentTdAfterJoinAfterTDCount;
}

- (void)setMin_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_min_subsequentTdAfterJoinAfterTDCount = a3;
}

- (unint64_t)max_subsequentTdAfterJoinAfterTDCount
{
  return self->_max_subsequentTdAfterJoinAfterTDCount;
}

- (void)setMax_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_max_subsequentTdAfterJoinAfterTDCount = a3;
}

- (unint64_t)tdSessionStartedByBadRSSICount
{
  return self->_tdSessionStartedByBadRSSICount;
}

- (void)setTdSessionStartedByBadRSSICount:(unint64_t)a3
{
  self->_tdSessionStartedByBadRSSICount = a3;
}

- (unint64_t)tdSessionStartedByTDRecommendedCount
{
  return self->_tdSessionStartedByTDRecommendedCount;
}

- (void)setTdSessionStartedByTDRecommendedCount:(unint64_t)a3
{
  self->_tdSessionStartedByTDRecommendedCount = a3;
}

- (unint64_t)tdSessionStartedBySymptomDNSFailureCount
{
  return self->_tdSessionStartedBySymptomDNSFailureCount;
}

- (void)setTdSessionStartedBySymptomDNSFailureCount:(unint64_t)a3
{
  self->_tdSessionStartedBySymptomDNSFailureCount = a3;
}

- (BOOL)isInTDEval
{
  return self->_isInTDEval;
}

- (void)setIsInTDEval:(BOOL)a3
{
  self->_isInTDEval = a3;
}

- (unint64_t)tdEvalEndedCount
{
  return self->_tdEvalEndedCount;
}

- (void)setTdEvalEndedCount:(unint64_t)a3
{
  self->_tdEvalEndedCount = a3;
}

- (double)tdEvalCumulativeDuration
{
  return self->_tdEvalCumulativeDuration;
}

- (void)setTdEvalCumulativeDuration:(double)a3
{
  self->_tdEvalCumulativeDuration = a3;
}

- (unint64_t)tdEvalStartedCount
{
  return self->_tdEvalStartedCount;
}

- (void)setTdEvalStartedCount:(unint64_t)a3
{
  self->_tdEvalStartedCount = a3;
}

- (unint64_t)tdEvalStartedByBadRSSICount
{
  return self->_tdEvalStartedByBadRSSICount;
}

- (void)setTdEvalStartedByBadRSSICount:(unint64_t)a3
{
  self->_tdEvalStartedByBadRSSICount = a3;
}

- (unint64_t)tdEvalStartedBySymptomsARPFailureCount
{
  return self->_tdEvalStartedBySymptomsARPFailureCount;
}

- (void)setTdEvalStartedBySymptomsARPFailureCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsARPFailureCount = a3;
}

- (unint64_t)tdEvalStartedBySymptomsDNSFailCount
{
  return self->_tdEvalStartedBySymptomsDNSFailCount;
}

- (void)setTdEvalStartedBySymptomsDNSFailCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDNSFailCount = a3;
}

- (unint64_t)tdEvalStartedBySymptomsShortFlowCount
{
  return self->_tdEvalStartedBySymptomsShortFlowCount;
}

- (void)setTdEvalStartedBySymptomsShortFlowCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsShortFlowCount = a3;
}

- (unint64_t)tdEvalStartedBySymptomsRTTFailCount
{
  return self->_tdEvalStartedBySymptomsRTTFailCount;
}

- (void)setTdEvalStartedBySymptomsRTTFailCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsRTTFailCount = a3;
}

- (unint64_t)tdEvalStartedBySymptomsDataStallCount
{
  return self->_tdEvalStartedBySymptomsDataStallCount;
}

- (void)setTdEvalStartedBySymptomsDataStallCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDataStallCount = a3;
}

- (unint64_t)tdEvalStartedBySymptomsDNSStallCount
{
  return self->_tdEvalStartedBySymptomsDNSStallCount;
}

- (void)setTdEvalStartedBySymptomsDNSStallCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDNSStallCount = a3;
}

- (unint64_t)tdEvalStartedByActiveProbingCount
{
  return self->_tdEvalStartedByActiveProbingCount;
}

- (void)setTdEvalStartedByActiveProbingCount:(unint64_t)a3
{
  self->_tdEvalStartedByActiveProbingCount = a3;
}

- (unint64_t)tdEvalStartedByFGNetwAppChangeCount
{
  return self->_tdEvalStartedByFGNetwAppChangeCount;
}

- (void)setTdEvalStartedByFGNetwAppChangeCount:(unint64_t)a3
{
  self->_tdEvalStartedByFGNetwAppChangeCount = a3;
}

- (unint64_t)tdEvalStartedByUserNotificationCount
{
  return self->_tdEvalStartedByUserNotificationCount;
}

- (void)setTdEvalStartedByUserNotificationCount:(unint64_t)a3
{
  self->_tdEvalStartedByUserNotificationCount = a3;
}

- (unint64_t)tdEvalStartedByCheckReassocCount
{
  return self->_tdEvalStartedByCheckReassocCount;
}

- (void)setTdEvalStartedByCheckReassocCount:(unint64_t)a3
{
  self->_tdEvalStartedByCheckReassocCount = a3;
}

- (BOOL)anyUsbDeviceConnected
{
  return self->_anyUsbDeviceConnected;
}

- (void)setAnyUsbDeviceConnected:(BOOL)a3
{
  self->_anyUsbDeviceConnected = a3;
}

- (unint64_t)usbDeviceEventCount
{
  return self->_usbDeviceEventCount;
}

- (void)setUsbDeviceEventCount:(unint64_t)a3
{
  self->_usbDeviceEventCount = a3;
}

- (NSDate)lastUsbStatusChange
{
  return self->_lastUsbStatusChange;
}

- (void)setLastUsbStatusChange:(id)a3
{
}

- (double)usbInsertedDuration
{
  return self->_usbInsertedDuration;
}

- (void)setUsbInsertedDuration:(double)a3
{
  self->_usbInsertedDuration = a3;
}

- (NSDate)lastAWDLSequenceUpdate
{
  return self->_lastAWDLSequenceUpdate;
}

- (void)setLastAWDLSequenceUpdate:(id)a3
{
}

- (unint64_t)inAWDL_BestInfraScore
{
  return self->_inAWDL_BestInfraScore;
}

- (void)setInAWDL_BestInfraScore:(unint64_t)a3
{
  self->_unint64_t inAWDL_BestInfraScore = a3;
}

- (unint64_t)inAWDL_WorstInfraScore
{
  return self->_inAWDL_WorstInfraScore;
}

- (void)setInAWDL_WorstInfraScore:(unint64_t)a3
{
  self->_unint64_t inAWDL_WorstInfraScore = a3;
}

- (double)inAWDL_BestP2PScore
{
  return self->_inAWDL_BestP2PScore;
}

- (void)setInAWDL_BestP2PScore:(double)a3
{
  self->_double inAWDL_BestP2PScore = a3;
}

- (double)inAWDL_WorstP2PScore
{
  return self->_inAWDL_WorstP2PScore;
}

- (void)setInAWDL_WorstP2PScore:(double)a3
{
  self->_double inAWDL_WorstP2PScore = a3;
}

- (unint64_t)inAWDL_lastInfraScore
{
  return self->_inAWDL_lastInfraScore;
}

- (void)setInAWDL_lastInfraScore:(unint64_t)a3
{
  self->_inAWDL_lastInfraScore = a3;
}

- (double)inAWDL_lastP2PScore
{
  return self->_inAWDL_lastP2PScore;
}

- (void)setInAWDL_lastP2PScore:(double)a3
{
  self->_inAWDL_lastP2PScore = a3;
}

- (double)inAWDL_BestInfraScoreDuration
{
  return self->_inAWDL_BestInfraScoreDuration;
}

- (void)setInAWDL_BestInfraScoreDuration:(double)a3
{
  self->_double inAWDL_BestInfraScoreDuration = a3;
}

- (double)inAWDL_BestP2PScoreDuration
{
  return self->_inAWDL_BestP2PScoreDuration;
}

- (void)setInAWDL_BestP2PScoreDuration:(double)a3
{
  self->_double inAWDL_BestP2PScoreDuration = a3;
}

- (double)inAWDL_WorstInfraScoreDuration
{
  return self->_inAWDL_WorstInfraScoreDuration;
}

- (void)setInAWDL_WorstInfraScoreDuration:(double)a3
{
  self->_double inAWDL_WorstInfraScoreDuration = a3;
}

- (double)inAWDL_WorstP2PScoreDuration
{
  return self->_inAWDL_WorstP2PScoreDuration;
}

- (void)setInAWDL_WorstP2PScoreDuration:(double)a3
{
  self->_double inAWDL_WorstP2PScoreDuration = a3;
}

- (unint64_t)forwardedBssInwakeCount
{
  return self->_forwardedBssInwakeCount;
}

- (void)setForwardedBssInwakeCount:(unint64_t)a3
{
  self->_forwardedBssInwakeCount = a3;
}

- (unint64_t)forwardedBssInSleepCount
{
  return self->_forwardedBssInSleepCount;
}

- (void)setForwardedBssInSleepCount:(unint64_t)a3
{
  self->_forwardedBssInSleepCount = a3;
}

- (unint64_t)hostScanTriggersCount
{
  return self->_hostScanTriggersCount;
}

- (void)setHostScanTriggersCount:(unint64_t)a3
{
  self->_hostScanTriggersCount = a3;
}

- (unint64_t)roamScanTriggersCount
{
  return self->_roamScanTriggersCount;
}

- (void)setRoamScanTriggersCount:(unint64_t)a3
{
  self->_roamScanTriggersCount = a3;
}

- (unint64_t)pnoScanTriggersCount
{
  return self->_pnoScanTriggersCount;
}

- (void)setPnoScanTriggersCount:(unint64_t)a3
{
  self->_pnoScanTriggersCount = a3;
}

- (unint64_t)epnoScanTriggersCount
{
  return self->_epnoScanTriggersCount;
}

- (void)setEpnoScanTriggersCount:(unint64_t)a3
{
  self->_epnoScanTriggersCount = a3;
}

- (unint64_t)currentBssMsgInWakeCount
{
  return self->_currentBssMsgInWakeCount;
}

- (void)setCurrentBssMsgInWakeCount:(unint64_t)a3
{
  self->_currentBssMsgInWakeCount = a3;
}

- (unint64_t)currentBssMsgInSleepCount
{
  return self->_currentBssMsgInSleepCount;
}

- (void)setCurrentBssMsgInSleepCount:(unint64_t)a3
{
  self->_currentBssMsgInSleepCount = a3;
}

- (unint64_t)scanDataMsgInWakeCount
{
  return self->_scanDataMsgInWakeCount;
}

- (void)setScanDataMsgInWakeCount:(unint64_t)a3
{
  self->_scanDataMsgInWakeCount = a3;
}

- (unint64_t)scanDataMsgInSleepCount
{
  return self->_scanDataMsgInSleepCount;
}

- (void)setScanDataMsgInSleepCount:(unint64_t)a3
{
  self->_scanDataMsgInSleepCount = a3;
}

- (unint64_t)spmiMsgInAwakeCount
{
  return self->_spmiMsgInAwakeCount;
}

- (void)setSpmiMsgInAwakeCount:(unint64_t)a3
{
  self->_spmiMsgInAwakeCount = a3;
}

- (unint64_t)spmiMsgInSleepCount
{
  return self->_spmiMsgInSleepCount;
}

- (void)setSpmiMsgInSleepCount:(unint64_t)a3
{
  self->_spmiMsgInSleepCount = a3;
}

- (unint64_t)spmiMsgDropRssiFilterCount
{
  return self->_spmiMsgDropRssiFilterCount;
}

- (void)setSpmiMsgDropRssiFilterCount:(unint64_t)a3
{
  self->_spmiMsgDropRssiFilterCount = a3;
}

- (unint64_t)spmiMsgDropMaxFilterCount
{
  return self->_spmiMsgDropMaxFilterCount;
}

- (void)setSpmiMsgDropMaxFilterCount:(unint64_t)a3
{
  self->_spmiMsgDropMaxFilterCount = a3;
}

- (unint64_t)spmiMsgDropSpmiFailCount
{
  return self->_spmiMsgDropSpmiFailCount;
}

- (void)setSpmiMsgDropSpmiFailCount:(unint64_t)a3
{
  self->_spmiMsgDropSpmiFailCount = a3;
}

- (unint64_t)bssDropLowMemoryCount
{
  return self->_bssDropLowMemoryCount;
}

- (void)setBssDropLowMemoryCount:(unint64_t)a3
{
  self->_bssDropLowMemoryCount = a3;
}

- (BOOL)isInstantHotspot
{
  return self->_isInstantHotspot;
}

- (void)setIsInstantHotspot:(BOOL)a3
{
  self->_isInstantHotspot = a3;
}

- (BOOL)isAutoHotspot
{
  return self->_isAutoHotspot;
}

- (void)setIsAutoHotspot:(BOOL)a3
{
  self->_isAutoHotspot = a3;
}

- (int)maxPhyMode
{
  return self->_maxPhyMode;
}

- (void)setMaxPhyMode:(int)a3
{
  self->_maxPhyMode = a3;
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionContext
{
  return self->_completionContext;
}

- (void)setCompletionContext:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end