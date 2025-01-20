@interface WiFiUsageLQMUserSample
+ (id)allLQMProperties;
+ (id)featureFromFieldName:(id)a3;
- (BOOL)isAnyAppInFG;
- (BOOL)isBSPActive;
- (BOOL)isBspSampleDurationExpected:(unint64_t)a3;
- (BOOL)isFTactive;
- (BOOL)isP2PActiveBSP;
- (BOOL)isScanActiveBSP;
- (BOOL)isTimeSensitiveAppRunning;
- (NSDate)timestamp;
- (NSMutableArray)mloSamples;
- (NSString)fgApp;
- (NSString)interfaceName;
- (NSString)motionState;
- (WiFiUsageBssDetails)bssDetails;
- (WiFiUsageInterfaceCapabilities)capabilities;
- (WiFiUsageLQMUserSample)initWithInterfaceName:(id)a3;
- (WiFiUsageNetworkDetails)networkDetails;
- (id)asDictionaryInto:(id)a3;
- (id)description;
- (int64_t)diff_noise_core0;
- (int64_t)diff_noise_core1;
- (int64_t)diff_noisecore1_noisecore0;
- (int64_t)diff_rssi_core0;
- (int64_t)diff_rssi_core1;
- (int64_t)diff_rssicore1_rssicore0;
- (int64_t)noise;
- (int64_t)noise_core0;
- (int64_t)noise_core1;
- (int64_t)rssi;
- (int64_t)rssiForTD;
- (int64_t)rssi_core0;
- (int64_t)rssi_core1;
- (int64_t)snr;
- (unint64_t)beaconPer;
- (unint64_t)bspAvgMuteMS;
- (unint64_t)bspErrorPercentage;
- (unint64_t)bspMaxConsecutiveFails;
- (unint64_t)bspMaxMuteMS;
- (unint64_t)bspMutePercentage;
- (unint64_t)bspRejectOrFailPercentageOfTriggers;
- (unint64_t)bspTimeOutPercentageOfTriggers;
- (unint64_t)bspTimeToTST;
- (unint64_t)bspTriggerCount;
- (unint64_t)chanQualScore;
- (unint64_t)decodingAttempts;
- (unint64_t)driverRoamRecommended;
- (unint64_t)driverTDrecommended;
- (unint64_t)duration;
- (unint64_t)interference;
- (unint64_t)linkTheoreticalMaxRate;
- (unint64_t)otherCca;
- (unint64_t)perCoreRssiInUse;
- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage;
- (unint64_t)rxBytes;
- (unint64_t)rxBytesOverRxFrames;
- (unint64_t)rxBytesOverRxL3Packets;
- (unint64_t)rxBytesSecondary;
- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage;
- (unint64_t)rxFrames;
- (unint64_t)rxL3Packets;
- (unint64_t)rxLatencyScore;
- (unint64_t)rxLossScore;
- (unint64_t)rxRate;
- (unint64_t)rxRateOverDeviceTheoreticalMaxPercentage;
- (unint64_t)rxRateOverLinkTheoreticalMaxPercentage;
- (unint64_t)rxRetriesOverRxFrames;
- (unint64_t)rxStartOverDecodingAttemptsPercentage;
- (unint64_t)selfCca;
- (unint64_t)totalReportedCca;
- (unint64_t)trafficState;
- (unint64_t)txBytes;
- (unint64_t)txBytesOverTxFrames;
- (unint64_t)txBytesOverTxL3Packets;
- (unint64_t)txBytesSecondary;
- (unint64_t)txFailsOverTxFrames;
- (unint64_t)txFrames;
- (unint64_t)txL3Packets;
- (unint64_t)txLatencyP95;
- (unint64_t)txLatencyScore;
- (unint64_t)txLossScore;
- (unint64_t)txMpduDensity;
- (unint64_t)txRTS;
- (unint64_t)txRTSFailOvertxRTS;
- (unint64_t)txRate;
- (unint64_t)txRateOverDeviceTheoreticalMaxPercentage;
- (unint64_t)txRateOverLinkTheoreticalMaxPercentage;
- (unint64_t)txRetriesOverTxFrames;
- (void)appendBSSDetailsToDict:(id)a3;
- (void)appendNetworkDetailsToDict:(id)a3;
- (void)populateWithBspOverflowed:(BOOL)a3 IsBSPActive:(BOOL)a4 BspTimeToTST:(unint64_t)a5 BspSampleDurationMS:(unint64_t)a6 IsScanActiveBSP:(BOOL)a7 IsP2PActiveBSP:(BOOL)a8 BspTriggerCount:(unint64_t)a9 BspMutePercentage:(unint64_t)a10 BspMaxMuteMS:(unint64_t)a11 BspAvgMuteMS:(unint64_t)a12 BspErrorPercentage:(unint64_t)a13 BspTimeOutPercentageOfTriggers:(unint64_t)a14 BspRejectOrFailPercentageOfTriggers:(unint64_t)a15 BspMaxConsecutiveFails:(unint64_t)a16;
- (void)populateWithMotionState:(id)a3 andAppState:(id)a4;
- (void)populateWithPerMLOLinkStats:(apple_mlo_link_lqm *)a3;
- (void)populateWithRssi:(int64_t)a3 noise:(int64_t)a4 snr:(int64_t)a5 selfCca:(unint64_t)a6 otherCca:(unint64_t)a7 interference:(unint64_t)a8 totalReportedCca:(unint64_t)a9 beaconPer:(unint64_t)a10 rxCrsGlitch:(unint64_t)a11 rxBadPLCP:(unint64_t)a12 rxStart:(unint64_t)a13 sampleDuration:(unint64_t)a14;
- (void)populateWithRssi:(int64_t)a3 rssi0:(int64_t)a4 rssi1:(int64_t)a5 rssiMode:(unint64_t)a6 noise:(int64_t)a7 noise0:(int64_t)a8 noise1:(int64_t)a9 snr:(int64_t)a10 selfCca:(unint64_t)a11 otherCca:(unint64_t)a12 interference:(unint64_t)a13 totalReportedCca:(unint64_t)a14 beaconPer:(unint64_t)a15 rxCrsGlitch:(unint64_t)a16 rxBadPLCP:(unint64_t)a17 rxStart:(unint64_t)a18 rxBphyCrsGlitch:(unint64_t)a19 rxBphyBadPLCP:(unint64_t)a20 sampleDuration:(unint64_t)a21;
- (void)populateWithTxFrames:(unint64_t)a3 RxFrames:(unint64_t)a4 TxFails:(unint64_t)a5 TxRetries:(unint64_t)a6 RxRetries:(unint64_t)a7 TxRate:(unint64_t)a8 RxRate:(unint64_t)a9 txRTS:(unint64_t)a10 txRTSFail:(unint64_t)a11 txMpdu:(unint64_t)a12 txAMPDU:(unint64_t)a13;
- (void)setBeaconPer:(unint64_t)a3;
- (void)setBspAvgMuteMS:(unint64_t)a3;
- (void)setBspErrorPercentage:(unint64_t)a3;
- (void)setBspMaxConsecutiveFails:(unint64_t)a3;
- (void)setBspMaxMuteMS:(unint64_t)a3;
- (void)setBspMutePercentage:(unint64_t)a3;
- (void)setBspRejectOrFailPercentageOfTriggers:(unint64_t)a3;
- (void)setBspTimeOutPercentageOfTriggers:(unint64_t)a3;
- (void)setBspTimeToTST:(unint64_t)a3;
- (void)setBspTriggerCount:(unint64_t)a3;
- (void)setBssDetails:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChanQualScore:(unint64_t)a3;
- (void)setDecodingAttempts:(unint64_t)a3;
- (void)setDiff_noise_core0:(int64_t)a3;
- (void)setDiff_noise_core1:(int64_t)a3;
- (void)setDiff_noisecore1_noisecore0:(int64_t)a3;
- (void)setDiff_rssi_core0:(int64_t)a3;
- (void)setDiff_rssi_core1:(int64_t)a3;
- (void)setDiff_rssicore1_rssicore0:(int64_t)a3;
- (void)setDriverRoamRecommended:(unint64_t)a3;
- (void)setDriverTDrecommended:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setFgApp:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterference:(unint64_t)a3;
- (void)setIsAnyAppInFG:(BOOL)a3;
- (void)setIsBSPActive:(BOOL)a3;
- (void)setIsFTactive:(BOOL)a3;
- (void)setIsP2PActiveBSP:(BOOL)a3;
- (void)setIsScanActiveBSP:(BOOL)a3;
- (void)setIsTimeSensitiveAppRunning:(BOOL)a3;
- (void)setLinkTheoreticalMaxRate:(unint64_t)a3;
- (void)setMloSamples:(id)a3;
- (void)setMotionState:(id)a3;
- (void)setNetworkDetails:(id)a3;
- (void)setNoise:(int64_t)a3;
- (void)setNoise_core0:(int64_t)a3;
- (void)setNoise_core1:(int64_t)a3;
- (void)setOtherCca:(unint64_t)a3;
- (void)setPerCoreRssiInUse:(unint64_t)a3;
- (void)setRssi:(int64_t)a3;
- (void)setRssi_core0:(int64_t)a3;
- (void)setRssi_core1:(int64_t)a3;
- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxBytesOverRxFrames:(unint64_t)a3;
- (void)setRxBytesOverRxL3Packets:(unint64_t)a3;
- (void)setRxBytesSecondary:(unint64_t)a3;
- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxFrames:(unint64_t)a3;
- (void)setRxL3Packets:(unint64_t)a3;
- (void)setRxLatencyScore:(unint64_t)a3;
- (void)setRxLossScore:(unint64_t)a3;
- (void)setRxRate:(unint64_t)a3;
- (void)setRxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3;
- (void)setRxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3;
- (void)setRxRetriesOverRxFrames:(unint64_t)a3;
- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setSelfCca:(unint64_t)a3;
- (void)setSnr:(int64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTotalReportedCca:(unint64_t)a3;
- (void)setTrafficState:(unint64_t)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxBytesOverTxFrames:(unint64_t)a3;
- (void)setTxBytesOverTxL3Packets:(unint64_t)a3;
- (void)setTxBytesSecondary:(unint64_t)a3;
- (void)setTxFailsOverTxFrames:(unint64_t)a3;
- (void)setTxFrames:(unint64_t)a3;
- (void)setTxL3Packets:(unint64_t)a3;
- (void)setTxLatencyP95:(unint64_t)a3;
- (void)setTxLatencyScore:(unint64_t)a3;
- (void)setTxLossScore:(unint64_t)a3;
- (void)setTxMpduDensity:(unint64_t)a3;
- (void)setTxRTS:(unint64_t)a3;
- (void)setTxRTSFailOvertxRTS:(unint64_t)a3;
- (void)setTxRate:(unint64_t)a3;
- (void)setTxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3;
- (void)setTxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3;
- (void)setTxRetriesOverTxFrames:(unint64_t)a3;
- (void)updateWithChQualScore:(unint64_t)a3 txLatencyScore:(unint64_t)a4 rxLatencyScore:(unint64_t)a5 txLossScore:(unint64_t)a6 rxLossScore:(unint64_t)a7 txLatencyP95:(unint64_t)a8 linkRecommendationFlags:(unint64_t)a9 rtTrafficStatus:(unint64_t)a10;
- (void)updateWithInterfaceCapabilities:(id)a3 AndNetworkDetails:(id)a4;
- (void)updateWithTxBytes:(unint64_t)a3 RxBytes:(unint64_t)a4 TxL3Packets:(unint64_t)a5 RxL3Packets:(unint64_t)a6 txBytesSecondary:(unint64_t)a7 rxBytesSecondary:(unint64_t)a8;
@end

@implementation WiFiUsageLQMUserSample

- (WiFiUsageLQMUserSample)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
    v5 = -[WiFiUsageLQMUserSample init](&v13, sel_init);
    uint64_t v6 = [v4 copy];
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x189603F50] date];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    v5->_rssi = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise = 0x7FFFFFFFFFFFFFFFLL;
    v5->_snr = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rssi_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rssi_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssi_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssi_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssicore1_rssicore0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noise_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noise_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noisecore1_noisecore0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_selfCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_otherCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_interference = 0x7FFFFFFFFFFFFFFFLL;
    v5->_totalReportedCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_beaconPer = 0x7FFFFFFFFFFFFFFFLL;
    v5->_decodingAttempts = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txFrames = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxFrames = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txL3Packets = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxL3Packets = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_linkTheoreticalMaxRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRateOverLinkTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRateOverLinkTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRateOverDeviceTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRateOverDeviceTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRTS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txMpduDensity = 0x7FFFFFFFFFFFFFFFLL;
    v5->_chanQualScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLatencyScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxLatencyScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLossScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxLossScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLatencyP95 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_driverRoamRecommended = 0x7FFFFFFFFFFFFFFFLL;
    v5->_driverTDrecommended = 0x7FFFFFFFFFFFFFFFLL;
    v5->_trafficState = 0x7FFFFFFFFFFFFFFFLL;
    v5->_isBSPActive = 0;
    v5->_bspTimeToTST = 0x7FFFFFFFFFFFFFFFLL;
    v5->_isScanActiveBSP = 0;
    v5->_isP2PActiveBSP = 0;
    v5->_bspTriggerCount = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMutePercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMaxMuteMS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspAvgMuteMS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspErrorPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspTimeOutPercentageOfTriggers = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspRejectOrFailPercentageOfTriggers = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMaxConsecutiveFails = 0x7FFFFFFFFFFFFFFFLL;
    mloSamples = v5->_mloSamples;
    v5->_mloSamples = 0LL;

    self = v5;
    v11 = self;
  }

  else
  {
    NSLog(@"%s - Invalid interfaceName:%@", "-[WiFiUsageLQMUserSample initWithInterfaceName:]", 0LL);
    v11 = 0LL;
  }

  return v11;
}

- (void)populateWithRssi:(int64_t)a3 noise:(int64_t)a4 snr:(int64_t)a5 selfCca:(unint64_t)a6 otherCca:(unint64_t)a7 interference:(unint64_t)a8 totalReportedCca:(unint64_t)a9 beaconPer:(unint64_t)a10 rxCrsGlitch:(unint64_t)a11 rxBadPLCP:(unint64_t)a12 rxStart:(unint64_t)a13 sampleDuration:(unint64_t)a14
{
  if (a3) {
    int64_t v21 = a3;
  }
  else {
    int64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[WiFiUsageLQMUserSample setRssi:](self, "setRssi:", v21);
  if (a4) {
    int64_t v22 = a4;
  }
  else {
    int64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[WiFiUsageLQMUserSample setNoise:](self, "setNoise:", v22);
  if (a5) {
    int64_t v23 = a5;
  }
  else {
    int64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[WiFiUsageLQMUserSample setSnr:](self, "setSnr:", v23);
  -[WiFiUsageLQMUserSample setSelfCca:](self, "setSelfCca:", a6);
  -[WiFiUsageLQMUserSample setOtherCca:](self, "setOtherCca:", a7);
  -[WiFiUsageLQMUserSample setInterference:](self, "setInterference:", a8);
  -[WiFiUsageLQMUserSample setTotalReportedCca:](self, "setTotalReportedCca:", a9);
  -[WiFiUsageLQMUserSample setBeaconPer:](self, "setBeaconPer:", a10);
  if (a11 == 0x7FFFFFFFFFFFFFFFLL || a12 == 0x7FFFFFFFFFFFFFFFLL || a13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", 0x7FFFFFFFFFFFFFFFLL, a12);
    -[WiFiUsageLQMUserSample setRxStartOverDecodingAttemptsPercentage:]( self,  "setRxStartOverDecodingAttemptsPercentage:",  0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxBadPlcpOverDecodingAttemptsPercentage:]( self,  "setRxBadPlcpOverDecodingAttemptsPercentage:",  0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxCrsGlitchOverDecodingAttemptsPercentage:]( self,  "setRxCrsGlitchOverDecodingAttemptsPercentage:",  0x7FFFFFFFFFFFFFFFLL);
  }

  else
  {
    +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:");
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", v24);
    -[WiFiUsageLQMUserSample setRxStartOverDecodingAttemptsPercentage:]( self,  "setRxStartOverDecodingAttemptsPercentage:",  v27);
    -[WiFiUsageLQMUserSample setRxBadPlcpOverDecodingAttemptsPercentage:]( self,  "setRxBadPlcpOverDecodingAttemptsPercentage:",  v26);
    -[WiFiUsageLQMUserSample setRxCrsGlitchOverDecodingAttemptsPercentage:]( self,  "setRxCrsGlitchOverDecodingAttemptsPercentage:",  v25);
  }

- (void)populateWithRssi:(int64_t)a3 rssi0:(int64_t)a4 rssi1:(int64_t)a5 rssiMode:(unint64_t)a6 noise:(int64_t)a7 noise0:(int64_t)a8 noise1:(int64_t)a9 snr:(int64_t)a10 selfCca:(unint64_t)a11 otherCca:(unint64_t)a12 interference:(unint64_t)a13 totalReportedCca:(unint64_t)a14 beaconPer:(unint64_t)a15 rxCrsGlitch:(unint64_t)a16 rxBadPLCP:(unint64_t)a17 rxStart:(unint64_t)a18 rxBphyCrsGlitch:(unint64_t)a19 rxBphyBadPLCP:(unint64_t)a20 sampleDuration:(unint64_t)a21
{
  if (a4) {
    int64_t v25 = a4;
  }
  else {
    int64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_rssi_core0 = v25;
  if (a5) {
    int64_t v26 = a5;
  }
  else {
    int64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_rssi_core1 = v26;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
  self->_diff_rssi_core0 = objc_msgSend( -[WiFiUsageLQMUserSample class](&v38, sel_class),  "subtract:From:",  self->_rssi_core0,  self->_rssi);
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
  self->_diff_rssi_core1 = objc_msgSend( -[WiFiUsageLQMUserSample class](&v37, sel_class),  "subtract:From:",  self->_rssi_core1,  self->_rssi);
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
  self->_diff_rssicore1_rssicore0 = objc_msgSend( -[WiFiUsageLQMUserSample class](&v36, sel_class),  "subtract:From:",  self->_rssi_core0,  self->_rssi_core1);
  if (a8) {
    int64_t v27 = a8;
  }
  else {
    int64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_noise_core0 = v27;
  if (a9) {
    int64_t v28 = a9;
  }
  else {
    int64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_noise_core1 = v28;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
  self->_diff_noise_core0 = objc_msgSend( -[WiFiUsageLQMUserSample class](&v35, sel_class),  "subtract:From:",  self->_noise_core0,  self->_noise);
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
  self->_diff_noise_core1 = objc_msgSend( -[WiFiUsageLQMUserSample class](&v34, sel_class),  "subtract:From:",  self->_noise_core1,  self->_noise);
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
  self->_diff_noisecore1_noisecore0 = objc_msgSend( -[WiFiUsageLQMUserSample class](&v33, sel_class),  "subtract:From:",  self->_noise_core0,  self->_noise_core1);
  if (a16 == 0x7FFFFFFFFFFFFFFFLL || a17 == 0x7FFFFFFFFFFFFFFFLL || a18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", 0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxStartOverDecodingAttemptsPercentage:]( self,  "setRxStartOverDecodingAttemptsPercentage:",  0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxBadPlcpOverDecodingAttemptsPercentage:]( self,  "setRxBadPlcpOverDecodingAttemptsPercentage:",  0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxCrsGlitchOverDecodingAttemptsPercentage:]( self,  "setRxCrsGlitchOverDecodingAttemptsPercentage:",  0x7FFFFFFFFFFFFFFFLL);
  }

  else
  {
    +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:");
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", v29);
    -[WiFiUsageLQMUserSample setRxStartOverDecodingAttemptsPercentage:]( self,  "setRxStartOverDecodingAttemptsPercentage:",  v32);
    -[WiFiUsageLQMUserSample setRxCrsGlitchOverDecodingAttemptsPercentage:]( self,  "setRxCrsGlitchOverDecodingAttemptsPercentage:",  v30);
    -[WiFiUsageLQMUserSample setRxBadPlcpOverDecodingAttemptsPercentage:]( self,  "setRxBadPlcpOverDecodingAttemptsPercentage:",  v31);
  }

- (void)populateWithTxFrames:(unint64_t)a3 RxFrames:(unint64_t)a4 TxFails:(unint64_t)a5 TxRetries:(unint64_t)a6 RxRetries:(unint64_t)a7 TxRate:(unint64_t)a8 RxRate:(unint64_t)a9 txRTS:(unint64_t)a10 txRTSFail:(unint64_t)a11 txMpdu:(unint64_t)a12 txAMPDU:(unint64_t)a13
{
}

- (BOOL)isBspSampleDurationExpected:(unint64_t)a3
{
  unint64_t v4 = -[WiFiUsageLQMUserSample duration](self, "duration");
  unint64_t v5 = 1000 * v4 - a3;
  if (1000 * v4 < a3) {
    unint64_t v5 = a3 - 1000 * v4;
  }
  if (a3) {
    BOOL v6 = v5 >= 20000 * v4 / 0x64;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (void)populateWithBspOverflowed:(BOOL)a3 IsBSPActive:(BOOL)a4 BspTimeToTST:(unint64_t)a5 BspSampleDurationMS:(unint64_t)a6 IsScanActiveBSP:(BOOL)a7 IsP2PActiveBSP:(BOOL)a8 BspTriggerCount:(unint64_t)a9 BspMutePercentage:(unint64_t)a10 BspMaxMuteMS:(unint64_t)a11 BspAvgMuteMS:(unint64_t)a12 BspErrorPercentage:(unint64_t)a13 BspTimeOutPercentageOfTriggers:(unint64_t)a14 BspRejectOrFailPercentageOfTriggers:(unint64_t)a15 BspMaxConsecutiveFails:(unint64_t)a16
{
  BOOL v16 = a8;
  BOOL v17 = a7;
  BOOL v20 = a4;
  -[WiFiUsageLQMUserSample setIsBSPActive:](self, "setIsBSPActive:", a4);
  if (v20 && !a3)
  {
    if (-[WiFiUsageLQMUserSample isBspSampleDurationExpected:](self, "isBspSampleDurationExpected:", a6))
    {
      -[WiFiUsageLQMUserSample setBspTimeToTST:](self, "setBspTimeToTST:", a5);
      -[WiFiUsageLQMUserSample setIsScanActiveBSP:](self, "setIsScanActiveBSP:", v17);
      -[WiFiUsageLQMUserSample setIsP2PActiveBSP:](self, "setIsP2PActiveBSP:", v16);
      -[WiFiUsageLQMUserSample setBspTriggerCount:](self, "setBspTriggerCount:", a9);
      -[WiFiUsageLQMUserSample setBspMutePercentage:](self, "setBspMutePercentage:", a10);
      -[WiFiUsageLQMUserSample setBspMaxMuteMS:](self, "setBspMaxMuteMS:", a11);
      -[WiFiUsageLQMUserSample setBspAvgMuteMS:](self, "setBspAvgMuteMS:", a12);
      -[WiFiUsageLQMUserSample setBspErrorPercentage:](self, "setBspErrorPercentage:", a13);
      -[WiFiUsageLQMUserSample setBspTimeOutPercentageOfTriggers:](self, "setBspTimeOutPercentageOfTriggers:", a14);
      -[WiFiUsageLQMUserSample setBspRejectOrFailPercentageOfTriggers:]( self,  "setBspRejectOrFailPercentageOfTriggers:",  a15);
      -[WiFiUsageLQMUserSample setBspMaxConsecutiveFails:](self, "setBspMaxConsecutiveFails:", a16);
    }
  }

- (void)populateWithMotionState:(id)a3 andAppState:(id)a4
{
  int v4 = *(_DWORD *)&a4.var0;
  -[WiFiUsageLQMUserSample setMotionState:](self, "setMotionState:", a3);
  -[WiFiUsageLQMUserSample setIsTimeSensitiveAppRunning:]( self,  "setIsTimeSensitiveAppRunning:",  (*(void *)&v4 & 0xFF0000LL) != 0);
  -[WiFiUsageLQMUserSample setIsAnyAppInFG:](self, "setIsAnyAppInFG:", v4 != 0LL);
  -[WiFiUsageLQMUserSample setIsFTactive:](self, "setIsFTactive:", (v4 & 0xFF00) != 0LL);
}

- (void)populateWithPerMLOLinkStats:(apple_mlo_link_lqm *)a3
{
  unint64_t v5 = objc_alloc(&OBJC_CLASS___WiFiUsageLQMMLOSample);
  unint64_t duration = self->_duration;
  __int128 v7 = *(_OWORD *)&a3->var4;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v7;
  uint64_t v13 = *(void *)&a3->var8;
  uint64_t v8 = -[WiFiUsageLQMMLOSample initWith:andDuration:](v5, "initWith:andDuration:", v12, duration);
  if (v8)
  {
    mloSamples = self->_mloSamples;
    if (!mloSamples)
    {
      v10 = (NSMutableArray *)objc_opt_new();
      v11 = self->_mloSamples;
      self->_mloSamples = v10;

      mloSamples = self->_mloSamples;
    }

    -[NSMutableArray addObject:](mloSamples, "addObject:", v8);
  }
}

- (void)updateWithTxBytes:(unint64_t)a3 RxBytes:(unint64_t)a4 TxL3Packets:(unint64_t)a5 RxL3Packets:(unint64_t)a6 txBytesSecondary:(unint64_t)a7 rxBytesSecondary:(unint64_t)a8
{
  -[WiFiUsageLQMUserSample setTxBytesOverTxFrames:]( self,  "setTxBytesOverTxFrames:",  +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a3,  self->_txFrames,  +[WiFiUsageLQMTransformations byteScale](&OBJC_CLASS___WiFiUsageLQMTransformations, "byteScale") == 1));
  -[WiFiUsageLQMUserSample setRxBytesOverRxFrames:]( self,  "setRxBytesOverRxFrames:",  +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a4,  self->_rxFrames,  +[WiFiUsageLQMTransformations byteScale](&OBJC_CLASS___WiFiUsageLQMTransformations, "byteScale") == 1));
  -[WiFiUsageLQMUserSample setTxBytesOverTxL3Packets:]( self,  "setTxBytesOverTxL3Packets:",  +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a3,  a5,  +[WiFiUsageLQMTransformations byteScale](&OBJC_CLASS___WiFiUsageLQMTransformations, "byteScale") == 1));
  -[WiFiUsageLQMUserSample setRxBytesOverRxL3Packets:]( self,  "setRxBytesOverRxL3Packets:",  +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a4,  a6,  +[WiFiUsageLQMTransformations byteScale](&OBJC_CLASS___WiFiUsageLQMTransformations, "byteScale") == 1));
  -[WiFiUsageLQMUserSample setTxL3Packets:](self, "setTxL3Packets:", a5);
  -[WiFiUsageLQMUserSample setRxL3Packets:](self, "setRxL3Packets:", a6);
  -[WiFiUsageLQMUserSample setTxBytes:](self, "setTxBytes:", a3);
  -[WiFiUsageLQMUserSample setRxBytes:](self, "setRxBytes:", a4);
  -[WiFiUsageLQMUserSample setTxBytesSecondary:](self, "setTxBytesSecondary:", a7);
  -[WiFiUsageLQMUserSample setRxBytesSecondary:](self, "setRxBytesSecondary:", a8);
}

- (void)updateWithInterfaceCapabilities:(id)a3 AndNetworkDetails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[WiFiUsageLQMUserSample setNetworkDetails:](self, "setNetworkDetails:", v7);
  [v7 connectedBss];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiUsageLQMUserSample setBssDetails:](self, "setBssDetails:", v8);
  if (v6 && -[WiFiUsageBssDetails nSS](self->_bssDetails, "nSS") == 0x7FFFFFFFFFFFFFFFLL) {
    -[WiFiUsageBssDetails setNSS:](self->_bssDetails, "setNSS:", [v6 currentNumberOfSpatialStreams]);
  }
  -[WiFiUsageLQMUserSample setCapabilities:](self, "setCapabilities:", v6);
  if (v6)
  {
    bssDetails = self->_bssDetails;
    if (bssDetails)
    {
      +[WiFiUsageLQMTransformations ratePercentagesWithTxRate:rxRate:txFallbackRate:txFrames:rxFrames:nss:bw:phyMode:band:deviceMaxRate:]( WiFiUsageLQMTransformations,  "ratePercentagesWithTxRate:rxRate:txFallbackRate:txFrames:rxFrames:nss:bw:phyMode:band:deviceMaxRate:",  self->_txRate,  self->_rxRate,  0,  self->_txFrames,  self->_rxFrames,  -[WiFiUsageBssDetails nSS](bssDetails, "nSS"),  -[WiFiUsageBssDetails channelWidth](self->_bssDetails, "channelWidth"),  __PAIR64__( -[WiFiUsageBssDetails band](self->_bssDetails, "band"),  -[WiFiUsageBssDetails phyMode](self->_bssDetails, "phyMode")),  [v6 maxInterfacePHYRate]);
      self->_txRateOverLinkTheoreticalMaxPercentage = v10;
      self->_rxRateOverLinkTheoreticalMaxPercentage = v11;
      self->_linkTheoreticalMaxRate = v14;
      self->_txRateOverDeviceTheoreticalMaxPercentage = v12;
      self->_rxRateOverDeviceTheoreticalMaxPercentage = v13;
    }
  }
}

- (void)updateWithChQualScore:(unint64_t)a3 txLatencyScore:(unint64_t)a4 rxLatencyScore:(unint64_t)a5 txLossScore:(unint64_t)a6 rxLossScore:(unint64_t)a7 txLatencyP95:(unint64_t)a8 linkRecommendationFlags:(unint64_t)a9 rtTrafficStatus:(unint64_t)a10
{
  if (a9 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v16 = 0LL;
  }
  else {
    unint64_t v16 = (a9 >> 1) & 1;
  }
  -[WiFiUsageLQMUserSample setDriverRoamRecommended:]( self,  "setDriverRoamRecommended:",  (a9 != 0x7FFFFFFFFFFFFFFFLL) & a9);
  -[WiFiUsageLQMUserSample setDriverTDrecommended:](self, "setDriverTDrecommended:", v16);
  -[WiFiUsageLQMUserSample setTrafficState:](self, "setTrafficState:", a10);
}

- (int64_t)rssiForTD
{
  unint64_t perCoreRssiInUse = self->_perCoreRssiInUse;
  if (perCoreRssiInUse > 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return *(int64_t *)((char *)&self->super.super.isa + *off_18A16D9F0[perCoreRssiInUse]);
  }
}

- (id)description
{
  v2 = (void *)MEMORY[0x189607940];
  networkDetails = self->_networkDetails;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
  -[WiFiUsageLQMSample description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"%@{%@}", networkDetails, v4];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [NSString stringWithString:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)appendNetworkDetailsToDict:(id)a3
{
  networkDetails = self->_networkDetails;
  id v5 = a3;
  +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelsForNetworkProperties:",  networkDetails);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 addEntriesFromDictionary:v6];

  -[WiFiUsageNetworkDetails bssEnvironment](self->_networkDetails, "bssEnvironment");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v7 forKeyedSubscript:@"bssEnvironment"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageNetworkDetails isPersonalHotspot](self->_networkDetails, "isPersonalHotspot"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v8 forKeyedSubscript:@"isPersonalHotspot"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageNetworkDetails hasEnterpriseSecurity](self->_networkDetails, "hasEnterpriseSecurity"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v9 forKeyedSubscript:@"isEnterprise"];
}

- (void)appendBSSDetailsToDict:(id)a3
{
  id v17 = a3;
  +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  -[WiFiUsageBssDetails band](self->_bssDetails, "band"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v4 forKeyedSubscript:@"band"];

  +[WiFiUsagePrivacyFilter subBandForBSPAsStringFromChannel:andBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "subBandForBSPAsStringFromChannel:andBand:",  -[WiFiUsageBssDetails channel](self->_bssDetails, "channel"),  -[WiFiUsageBssDetails band](self->_bssDetails, "band"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v5 forKeyedSubscript:@"bandForBSP"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLong:",  -[WiFiUsageBssDetails channel](self->_bssDetails, "channel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v7 forKeyedSubscript:@"channel"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLong:",  -[WiFiUsageBssDetails channelWidth](self->_bssDetails, "channelWidth"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringValue];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v9 forKeyedSubscript:@"channelWidth"];

  -[WiFiUsageBssDetails apProfile](self->_bssDetails, "apProfile");
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v10 forKeyedSubscript:@"apProfile"];

  bssDetails = self->_bssDetails;
  if (bssDetails)
  {
    -[WiFiUsageBssDetails currentMloLinks](bssDetails, "currentMloLinks");
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 componentsJoinedByString:@"|"];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setObject:v14 forKeyedSubscript:@"MLOConfiguration"];
    v15 = -[WiFiUsageBssDetails mloTrafficSwitchEnabled](self->_bssDetails, "mloTrafficSwitchEnabled");
    [v17 setObject:v15 forKeyedSubscript:@"isMloTrafficSwitchEnabled"];

    +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  -[WiFiUsageBssDetails currentMloPreferredBand](self->_bssDetails, "currentMloPreferredBand"));
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setObject:v16 forKeyedSubscript:@"mloPreferredBand"];
  }
}

- (id)asDictionaryInto:(id)a3
{
  id v4 = a3;
  -[WiFiUsageLQMUserSample appendBSSDetailsToDict:](self, "appendBSSDetailsToDict:", v4);
  -[WiFiUsageLQMUserSample appendNetworkDetailsToDict:](self, "appendNetworkDetailsToDict:", v4);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMUserSample;
  -[WiFiUsageLQMSample asDictionaryInto:](&v7, sel_asDictionaryInto_, v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allLQMProperties
{
  v2 = (void *)MEMORY[0x189603FE0];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WiFiUsageLQMUserSample;
  objc_msgSendSuper2(&v7, sel_allLQMProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setWithSet:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 addObject:@"fgApp"];
  id v5 = (void *)[v4 copy];

  return v5;
}

+ (id)featureFromFieldName:(id)a3
{
  v3 = (void *)MEMORY[0x189603F68];
  id v4 = a3;
  objc_msgSend( v3,  "dictionaryWithObjectsAndKeys:",  @"chanQualScore",  @"minimum",  @"txLatencyScore",  @"minimum",  @"rxLatencyScore",  @"minimum",  @"txLossScore",  @"minimum",  @"rxLossScore",  @"maximum",  @"txLatencyP95",  @"maximum",  @"isAnyAppInFG",  @"maximum",  @"isFTactive",  @"maximum",  @"isTimeSensitiveAppRunning",  @"mode",  @"driverRoamRecommended",  @"mode",  @"driverTDrecommended",  @"mode",  @"trafficState",  @"mode",  @"duration",  0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    objc_super v7 = v6;
  }
  else {
    objc_super v7 = @"median";
  }

  return v7;
}

- (WiFiUsageNetworkDetails)networkDetails
{
  return self->_networkDetails;
}

- (void)setNetworkDetails:(id)a3
{
}

- (NSString)fgApp
{
  return self->_fgApp;
}

- (void)setFgApp:(id)a3
{
}

- (NSString)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(id)a3
{
}

- (BOOL)isAnyAppInFG
{
  return self->_isAnyAppInFG;
}

- (void)setIsAnyAppInFG:(BOOL)a3
{
  self->_isAnyAppInFG = a3;
}

- (BOOL)isFTactive
{
  return self->_isFTactive;
}

- (void)setIsFTactive:(BOOL)a3
{
  self->_isFTactive = a3;
}

- (BOOL)isTimeSensitiveAppRunning
{
  return self->_isTimeSensitiveAppRunning;
}

- (void)setIsTimeSensitiveAppRunning:(BOOL)a3
{
  self->_isTimeSensitiveAppRunning = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_unint64_t duration = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (int64_t)rssi_core0
{
  return self->_rssi_core0;
}

- (void)setRssi_core0:(int64_t)a3
{
  self->_rssi_core0 = a3;
}

- (int64_t)rssi_core1
{
  return self->_rssi_core1;
}

- (void)setRssi_core1:(int64_t)a3
{
  self->_rssi_core1 = a3;
}

- (int64_t)diff_rssi_core0
{
  return self->_diff_rssi_core0;
}

- (void)setDiff_rssi_core0:(int64_t)a3
{
  self->_diff_rssi_core0 = a3;
}

- (int64_t)diff_rssi_core1
{
  return self->_diff_rssi_core1;
}

- (void)setDiff_rssi_core1:(int64_t)a3
{
  self->_diff_rssi_core1 = a3;
}

- (int64_t)diff_rssicore1_rssicore0
{
  return self->_diff_rssicore1_rssicore0;
}

- (void)setDiff_rssicore1_rssicore0:(int64_t)a3
{
  self->_diff_rssicore1_rssicore0 = a3;
}

- (unint64_t)perCoreRssiInUse
{
  return self->_perCoreRssiInUse;
}

- (void)setPerCoreRssiInUse:(unint64_t)a3
{
  self->_unint64_t perCoreRssiInUse = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (int64_t)noise_core0
{
  return self->_noise_core0;
}

- (void)setNoise_core0:(int64_t)a3
{
  self->_noise_core0 = a3;
}

- (int64_t)noise_core1
{
  return self->_noise_core1;
}

- (void)setNoise_core1:(int64_t)a3
{
  self->_noise_core1 = a3;
}

- (int64_t)diff_noise_core0
{
  return self->_diff_noise_core0;
}

- (void)setDiff_noise_core0:(int64_t)a3
{
  self->_diff_noise_core0 = a3;
}

- (int64_t)diff_noise_core1
{
  return self->_diff_noise_core1;
}

- (void)setDiff_noise_core1:(int64_t)a3
{
  self->_diff_noise_core1 = a3;
}

- (int64_t)diff_noisecore1_noisecore0
{
  return self->_diff_noisecore1_noisecore0;
}

- (void)setDiff_noisecore1_noisecore0:(int64_t)a3
{
  self->_diff_noisecore1_noisecore0 = a3;
}

- (int64_t)snr
{
  return self->_snr;
}

- (void)setSnr:(int64_t)a3
{
  self->_snr = a3;
}

- (unint64_t)selfCca
{
  return self->_selfCca;
}

- (void)setSelfCca:(unint64_t)a3
{
  self->_selfCca = a3;
}

- (unint64_t)otherCca
{
  return self->_otherCca;
}

- (void)setOtherCca:(unint64_t)a3
{
  self->_otherCca = a3;
}

- (unint64_t)interference
{
  return self->_interference;
}

- (void)setInterference:(unint64_t)a3
{
  self->_interference = a3;
}

- (unint64_t)totalReportedCca
{
  return self->_totalReportedCca;
}

- (void)setTotalReportedCca:(unint64_t)a3
{
  self->_totalReportedCca = a3;
}

- (unint64_t)beaconPer
{
  return self->_beaconPer;
}

- (void)setBeaconPer:(unint64_t)a3
{
  self->_beaconPer = a3;
}

- (unint64_t)decodingAttempts
{
  return self->_decodingAttempts;
}

- (void)setDecodingAttempts:(unint64_t)a3
{
  self->_decodingAttempts = a3;
}

- (unint64_t)rxStartOverDecodingAttemptsPercentage
{
  return self->_rxStartOverDecodingAttemptsPercentage;
}

- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxStartOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage
{
  return self->_rxCrsGlitchOverDecodingAttemptsPercentage;
}

- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxCrsGlitchOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage
{
  return self->_rxBadPlcpOverDecodingAttemptsPercentage;
}

- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxBadPlcpOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)txFrames
{
  return self->_txFrames;
}

- (void)setTxFrames:(unint64_t)a3
{
  self->_txFrames = a3;
}

- (unint64_t)rxFrames
{
  return self->_rxFrames;
}

- (void)setRxFrames:(unint64_t)a3
{
  self->_rxFrames = a3;
}

- (unint64_t)txFailsOverTxFrames
{
  return self->_txFailsOverTxFrames;
}

- (void)setTxFailsOverTxFrames:(unint64_t)a3
{
  self->_txFailsOverTxFrames = a3;
}

- (unint64_t)txRetriesOverTxFrames
{
  return self->_txRetriesOverTxFrames;
}

- (void)setTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_txRetriesOverTxFrames = a3;
}

- (unint64_t)rxRetriesOverRxFrames
{
  return self->_rxRetriesOverRxFrames;
}

- (void)setRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_rxRetriesOverRxFrames = a3;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (void)setTxBytes:(unint64_t)a3
{
  self->_txBytes = a3;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (void)setRxBytes:(unint64_t)a3
{
  self->_rxBytes = a3;
}

- (unint64_t)txBytesSecondary
{
  return self->_txBytesSecondary;
}

- (void)setTxBytesSecondary:(unint64_t)a3
{
  self->_txBytesSecondary = a3;
}

- (unint64_t)rxBytesSecondary
{
  return self->_rxBytesSecondary;
}

- (void)setRxBytesSecondary:(unint64_t)a3
{
  self->_rxBytesSecondary = a3;
}

- (unint64_t)txBytesOverTxFrames
{
  return self->_txBytesOverTxFrames;
}

- (void)setTxBytesOverTxFrames:(unint64_t)a3
{
  self->_txBytesOverTxFrames = a3;
}

- (unint64_t)rxBytesOverRxFrames
{
  return self->_rxBytesOverRxFrames;
}

- (void)setRxBytesOverRxFrames:(unint64_t)a3
{
  self->_rxBytesOverRxFrames = a3;
}

- (unint64_t)txL3Packets
{
  return self->_txL3Packets;
}

- (void)setTxL3Packets:(unint64_t)a3
{
  self->_txL3Packets = a3;
}

- (unint64_t)rxL3Packets
{
  return self->_rxL3Packets;
}

- (void)setRxL3Packets:(unint64_t)a3
{
  self->_rxL3Packets = a3;
}

- (unint64_t)txBytesOverTxL3Packets
{
  return self->_txBytesOverTxL3Packets;
}

- (void)setTxBytesOverTxL3Packets:(unint64_t)a3
{
  self->_txBytesOverTxL3Packets = a3;
}

- (unint64_t)rxBytesOverRxL3Packets
{
  return self->_rxBytesOverRxL3Packets;
}

- (void)setRxBytesOverRxL3Packets:(unint64_t)a3
{
  self->_rxBytesOverRxL3Packets = a3;
}

- (unint64_t)linkTheoreticalMaxRate
{
  return self->_linkTheoreticalMaxRate;
}

- (void)setLinkTheoreticalMaxRate:(unint64_t)a3
{
  self->_linkTheoreticalMaxRate = a3;
}

- (unint64_t)rxRate
{
  return self->_rxRate;
}

- (void)setRxRate:(unint64_t)a3
{
  self->_rxRate = a3;
}

- (unint64_t)txRate
{
  return self->_txRate;
}

- (void)setTxRate:(unint64_t)a3
{
  self->_txRate = a3;
}

- (unint64_t)txRateOverLinkTheoreticalMaxPercentage
{
  return self->_txRateOverLinkTheoreticalMaxPercentage;
}

- (void)setTxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_txRateOverLinkTheoreticalMaxPercentage = a3;
}

- (unint64_t)rxRateOverLinkTheoreticalMaxPercentage
{
  return self->_rxRateOverLinkTheoreticalMaxPercentage;
}

- (void)setRxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_rxRateOverLinkTheoreticalMaxPercentage = a3;
}

- (unint64_t)txRateOverDeviceTheoreticalMaxPercentage
{
  return self->_txRateOverDeviceTheoreticalMaxPercentage;
}

- (void)setTxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_txRateOverDeviceTheoreticalMaxPercentage = a3;
}

- (unint64_t)rxRateOverDeviceTheoreticalMaxPercentage
{
  return self->_rxRateOverDeviceTheoreticalMaxPercentage;
}

- (void)setRxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_rxRateOverDeviceTheoreticalMaxPercentage = a3;
}

- (unint64_t)txRTS
{
  return self->_txRTS;
}

- (void)setTxRTS:(unint64_t)a3
{
  self->_txRTS = a3;
}

- (unint64_t)txRTSFailOvertxRTS
{
  return self->_txRTSFailOvertxRTS;
}

- (void)setTxRTSFailOvertxRTS:(unint64_t)a3
{
  self->_txRTSFailOvertxRTS = a3;
}

- (unint64_t)txMpduDensity
{
  return self->_txMpduDensity;
}

- (void)setTxMpduDensity:(unint64_t)a3
{
  self->_txMpduDensity = a3;
}

- (unint64_t)chanQualScore
{
  return self->_chanQualScore;
}

- (void)setChanQualScore:(unint64_t)a3
{
  self->_chanQualScore = a3;
}

- (unint64_t)txLatencyScore
{
  return self->_txLatencyScore;
}

- (void)setTxLatencyScore:(unint64_t)a3
{
  self->_txLatencyScore = a3;
}

- (unint64_t)rxLatencyScore
{
  return self->_rxLatencyScore;
}

- (void)setRxLatencyScore:(unint64_t)a3
{
  self->_rxLatencyScore = a3;
}

- (unint64_t)txLossScore
{
  return self->_txLossScore;
}

- (void)setTxLossScore:(unint64_t)a3
{
  self->_txLossScore = a3;
}

- (unint64_t)rxLossScore
{
  return self->_rxLossScore;
}

- (void)setRxLossScore:(unint64_t)a3
{
  self->_rxLossScore = a3;
}

- (unint64_t)txLatencyP95
{
  return self->_txLatencyP95;
}

- (void)setTxLatencyP95:(unint64_t)a3
{
  self->_txLatencyP95 = a3;
}

- (unint64_t)driverRoamRecommended
{
  return self->_driverRoamRecommended;
}

- (void)setDriverRoamRecommended:(unint64_t)a3
{
  self->_driverRoamRecommended = a3;
}

- (unint64_t)driverTDrecommended
{
  return self->_driverTDrecommended;
}

- (void)setDriverTDrecommended:(unint64_t)a3
{
  self->_driverTDrecommended = a3;
}

- (unint64_t)trafficState
{
  return self->_trafficState;
}

- (void)setTrafficState:(unint64_t)a3
{
  self->_trafficState = a3;
}

- (NSMutableArray)mloSamples
{
  return self->_mloSamples;
}

- (void)setMloSamples:(id)a3
{
}

- (BOOL)isBSPActive
{
  return self->_isBSPActive;
}

- (void)setIsBSPActive:(BOOL)a3
{
  self->_isBSPActive = a3;
}

- (unint64_t)bspTimeToTST
{
  return self->_bspTimeToTST;
}

- (void)setBspTimeToTST:(unint64_t)a3
{
  self->_bspTimeToTST = a3;
}

- (BOOL)isScanActiveBSP
{
  return self->_isScanActiveBSP;
}

- (void)setIsScanActiveBSP:(BOOL)a3
{
  self->_isScanActiveBSP = a3;
}

- (BOOL)isP2PActiveBSP
{
  return self->_isP2PActiveBSP;
}

- (void)setIsP2PActiveBSP:(BOOL)a3
{
  self->_isP2PActiveBSP = a3;
}

- (unint64_t)bspTriggerCount
{
  return self->_bspTriggerCount;
}

- (void)setBspTriggerCount:(unint64_t)a3
{
  self->_bspTriggerCount = a3;
}

- (unint64_t)bspMutePercentage
{
  return self->_bspMutePercentage;
}

- (void)setBspMutePercentage:(unint64_t)a3
{
  self->_bspMutePercentage = a3;
}

- (unint64_t)bspMaxMuteMS
{
  return self->_bspMaxMuteMS;
}

- (void)setBspMaxMuteMS:(unint64_t)a3
{
  self->_bspMaxMuteMS = a3;
}

- (unint64_t)bspAvgMuteMS
{
  return self->_bspAvgMuteMS;
}

- (void)setBspAvgMuteMS:(unint64_t)a3
{
  self->_bspAvgMuteMS = a3;
}

- (unint64_t)bspErrorPercentage
{
  return self->_bspErrorPercentage;
}

- (void)setBspErrorPercentage:(unint64_t)a3
{
  self->_bspErrorPercentage = a3;
}

- (unint64_t)bspTimeOutPercentageOfTriggers
{
  return self->_bspTimeOutPercentageOfTriggers;
}

- (void)setBspTimeOutPercentageOfTriggers:(unint64_t)a3
{
  self->_bspTimeOutPercentageOfTriggers = a3;
}

- (unint64_t)bspRejectOrFailPercentageOfTriggers
{
  return self->_bspRejectOrFailPercentageOfTriggers;
}

- (void)setBspRejectOrFailPercentageOfTriggers:(unint64_t)a3
{
  self->_bspRejectOrFailPercentageOfTriggers = a3;
}

- (unint64_t)bspMaxConsecutiveFails
{
  return self->_bspMaxConsecutiveFails;
}

- (void)setBspMaxConsecutiveFails:(unint64_t)a3
{
  self->_bspMaxConsecutiveFails = a3;
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (WiFiUsageBssDetails)bssDetails
{
  return self->_bssDetails;
}

- (void)setBssDetails:(id)a3
{
}

- (void).cxx_destruct
{
}

@end