@interface WiFiUsageSoftApSession
- (BOOL)compatibilityEnabled;
- (BOOL)lastHiddenState;
- (NSDate)lastAwdlActiveTime;
- (NSDate)lastInfraActiveTime;
- (NSMutableSet)connectedClients;
- (NSString)requester;
- (NSString)status;
- (NSString)tearDownReason;
- (WiFiUsageSoftApSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (double)awdlActiveDuration;
- (double)infraActiveDuration;
- (double)lowPowerModeDuration;
- (double)requestToUpLatency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventDictionary:(BOOL)a3;
- (id)metricName;
- (unint64_t)appleClientConnectCount;
- (unint64_t)appliedCountryCode;
- (unint64_t)autoHotspotClientConnectCount;
- (unint64_t)awdlStateChangedCount;
- (unint64_t)bandTransitionCount;
- (unint64_t)broadcastClientConnectCount;
- (unint64_t)clientDisconnectCount;
- (unint64_t)fiveGHzChannelCount;
- (unint64_t)fiveGHzClientConnectCount;
- (unint64_t)fiveGHzDeniedUnii1ChannelCount;
- (unint64_t)fiveGHzDeniedUnii2aChannelCount;
- (unint64_t)fiveGHzDeniedUnii2cChannelCount;
- (unint64_t)fiveGHzDeniedUnii3ChannelCount;
- (unint64_t)hiddenClientConnectCount;
- (unint64_t)hiddenTransitionCount;
- (unint64_t)infraStateChangedCount;
- (unint64_t)instantHotspotClientConnectCount;
- (unint64_t)knownNetworkScanCount;
- (unint64_t)lastChannel;
- (unint64_t)maxConnectedClientCount;
- (unint64_t)otherClientConnectCount;
- (unint64_t)twoFourGHzChannelCount;
- (unint64_t)twoFourGHzClientConnectCount;
- (unint64_t)twoFourGHzDeniedChannelCount;
- (void)addSoftApClientEvent:(BOOL)a3 identifier:(id)a4 isAppleClient:(BOOL)a5 isInstantHotspot:(BOOL)a6 isAutoHotspot:(BOOL)a7 isHidden:(BOOL)a8;
- (void)addSoftApCoexEvent:(unint64_t)a3 deniedUnii1ChannelMap:(unint64_t)a4 deniedUnii2aChannelMap:(unint64_t)a5 deniedUnii2cChannelMap:(unint64_t)a6 deniedUnii3ChannelMap:(unint64_t)a7;
- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)setAppleClientConnectCount:(unint64_t)a3;
- (void)setAppliedCountryCode:(unint64_t)a3;
- (void)setAutoHotspotClientConnectCount:(unint64_t)a3;
- (void)setAwdlActiveDuration:(double)a3;
- (void)setAwdlStateChangedCount:(unint64_t)a3;
- (void)setBandTransitionCount:(unint64_t)a3;
- (void)setBroadcastClientConnectCount:(unint64_t)a3;
- (void)setClientDisconnectCount:(unint64_t)a3;
- (void)setCompatibilityEnabled:(BOOL)a3;
- (void)setConnectedClients:(id)a3;
- (void)setFiveGHzChannelCount:(unint64_t)a3;
- (void)setFiveGHzClientConnectCount:(unint64_t)a3;
- (void)setFiveGHzDeniedUnii1ChannelCount:(unint64_t)a3;
- (void)setFiveGHzDeniedUnii2aChannelCount:(unint64_t)a3;
- (void)setFiveGHzDeniedUnii2cChannelCount:(unint64_t)a3;
- (void)setFiveGHzDeniedUnii3ChannelCount:(unint64_t)a3;
- (void)setHiddenClientConnectCount:(unint64_t)a3;
- (void)setHiddenTransitionCount:(unint64_t)a3;
- (void)setInfraActiveDuration:(double)a3;
- (void)setInfraStateChangedCount:(unint64_t)a3;
- (void)setInstantHotspotClientConnectCount:(unint64_t)a3;
- (void)setKnownNetworkScanCount:(unint64_t)a3;
- (void)setLastAwdlActiveTime:(id)a3;
- (void)setLastChannel:(unint64_t)a3;
- (void)setLastHiddenState:(BOOL)a3;
- (void)setLastInfraActiveTime:(id)a3;
- (void)setLowPowerModeDuration:(double)a3;
- (void)setMaxConnectedClientCount:(unint64_t)a3;
- (void)setOtherClientConnectCount:(unint64_t)a3;
- (void)setRequestToUpLatency:(double)a3;
- (void)setRequester:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTearDownReason:(id)a3;
- (void)setTwoFourGHzChannelCount:(unint64_t)a3;
- (void)setTwoFourGHzClientConnectCount:(unint64_t)a3;
- (void)setTwoFourGHzDeniedChannelCount:(unint64_t)a3;
- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14;
- (void)summarizeSession;
@end

@implementation WiFiUsageSoftApSession

- (WiFiUsageSoftApSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiUsageSoftApSession;
  v4 = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v6,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  6LL,  a3,  a4);
  -[WiFiUsageSoftApSession setTwoFourGHzDeniedChannelCount:](v4, "setTwoFourGHzDeniedChannelCount:", 0LL);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii1ChannelCount:](v4, "setFiveGHzDeniedUnii1ChannelCount:", 0LL);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii2aChannelCount:](v4, "setFiveGHzDeniedUnii2aChannelCount:", 0LL);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii2cChannelCount:](v4, "setFiveGHzDeniedUnii2cChannelCount:", 0LL);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii3ChannelCount:](v4, "setFiveGHzDeniedUnii3ChannelCount:", 0LL);
  return v4;
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v7 = a3;
  objc_msgSend(MEMORY[0x189603F50], "date", a3, a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  lastInfraActiveTime = self->_lastInfraActiveTime;
  if (v7)
  {
    if (!lastInfraActiveTime)
    {
      v13 = v9;
      -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", v9);
      v10 = v13;
      ++self->_infraStateChangedCount;
    }
  }

  else if (lastInfraActiveTime)
  {
    v14 = v9;
    objc_msgSend(v9, "timeIntervalSinceDate:");
    self->_infraActiveDuration = v12 + self->_infraActiveDuration;
    -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", 0LL);
    v10 = v14;
  }
}

- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4
{
  BOOL v4 = a3;
  objc_msgSend(MEMORY[0x189603F50], "date", a3, a4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6;
  if (v4)
  {
    v9 = v6;
    -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", v6);
    BOOL v7 = v9;
    ++self->_awdlStateChangedCount;
  }

  else if (self->_lastAwdlActiveTime)
  {
    v10 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    self->_awdlActiveDuration = v8 + self->_awdlActiveDuration;
    -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", 0LL);
    BOOL v7 = v10;
  }
}

- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14
{
  BOOL v19 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  [MEMORY[0x189603F50] date];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v21;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive") == v19)
  {
LABEL_6:
    char v25 = 0;
    if (!v22) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (!v19)
  {
    NSLog( @"%s: softAP session ended",  "-[WiFiUsageSoftApSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isI nfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:]");
    -[WiFiUsageSoftApSession setLowPowerModeDuration:](self, "setLowPowerModeDuration:", a12);
    -[WiFiUsageSoftApSession setTearDownReason:](self, "setTearDownReason:", v23);
    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    -[NSMutableSet removeAllObjects](self->_connectedClients, "removeAllObjects");
    goto LABEL_6;
  }

  NSLog( @"%s: softAP session started",  "-[WiFiUsageSoftApSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInf raConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:]");
  -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
  -[WiFiUsageSoftApSession setRequester:](self, "setRequester:", v21);
  -[WiFiUsageSoftApSession setCompatibilityEnabled:](self, "setCompatibilityEnabled:", a13);
  -[WiFiUsageSoftApSession setLowPowerModeDuration:](self, "setLowPowerModeDuration:", 0.0);
  -[WiFiUsageSoftApSession setInfraActiveDuration:](self, "setInfraActiveDuration:", 0.0);
  -[WiFiUsageSoftApSession setAwdlActiveDuration:](self, "setAwdlActiveDuration:", 0.0);
  -[WiFiUsageSoftApSession setRequestToUpLatency:](self, "setRequestToUpLatency:", 0.0);
  -[WiFiUsageSoftApSession setAppleClientConnectCount:](self, "setAppleClientConnectCount:", 0LL);
  -[WiFiUsageSoftApSession setOtherClientConnectCount:](self, "setOtherClientConnectCount:", 0LL);
  -[WiFiUsageSoftApSession setHiddenClientConnectCount:](self, "setHiddenClientConnectCount:", 0LL);
  -[WiFiUsageSoftApSession setBroadcastClientConnectCount:](self, "setBroadcastClientConnectCount:", 0LL);
  -[WiFiUsageSoftApSession setTwoFourGHzClientConnectCount:](self, "setTwoFourGHzClientConnectCount:", 0LL);
  -[WiFiUsageSoftApSession setFiveGHzClientConnectCount:](self, "setFiveGHzClientConnectCount:", 0LL);
  -[WiFiUsageSoftApSession setClientDisconnectCount:](self, "setClientDisconnectCount:", 0LL);
  -[WiFiUsageSoftApSession setMaxConnectedClientCount:](self, "setMaxConnectedClientCount:", 0LL);
  -[WiFiUsageSoftApSession setInstantHotspotClientConnectCount:](self, "setInstantHotspotClientConnectCount:", 0LL);
  -[WiFiUsageSoftApSession setAutoHotspotClientConnectCount:](self, "setAutoHotspotClientConnectCount:", 0LL);
  -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", 0LL);
  -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", 0LL);
  -[WiFiUsageSoftApSession setTwoFourGHzChannelCount:](self, "setTwoFourGHzChannelCount:", 0LL);
  -[WiFiUsageSoftApSession setFiveGHzChannelCount:](self, "setFiveGHzChannelCount:", 0LL);
  -[WiFiUsageSoftApSession setInfraStateChangedCount:](self, "setInfraStateChangedCount:", 0LL);
  -[WiFiUsageSoftApSession setAwdlStateChangedCount:](self, "setAwdlStateChangedCount:", 0LL);
  -[WiFiUsageSoftApSession setKnownNetworkScanCount:](self, "setKnownNetworkScanCount:", 0LL);
  -[WiFiUsageSoftApSession setHiddenTransitionCount:](self, "setHiddenTransitionCount:", 0LL);
  -[WiFiUsageSoftApSession setBandTransitionCount:](self, "setBandTransitionCount:", 0LL);
  connectedClients = self->_connectedClients;
  if (connectedClients)
  {
    -[NSMutableSet removeAllObjects](connectedClients, "removeAllObjects");
  }

  else
  {
    [MEMORY[0x189603FE0] set];
    v28 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v29 = self->_connectedClients;
    self->_connectedClients = v28;
  }

  char v25 = 1;
  if (v22) {
LABEL_7:
  }
    -[WiFiUsageSoftApSession setStatus:](self, "setStatus:", v22);
LABEL_8:
  if (a8) {
    -[WiFiUsageSoftApSession setAppliedCountryCode:](self, "setAppliedCountryCode:", a8);
  }
  if (a14 > 0.0) {
    -[WiFiUsageSoftApSession setRequestToUpLatency:](self, "setRequestToUpLatency:", a14);
  }
  if (v19)
  {
    if ((v25 & 1) == 0)
    {
      int64_t v26 = a7 - self->_lastChannel;
      if (v26)
      {
        if (v26 < 0) {
          int64_t v26 = self->_lastChannel - a7;
        }
      }

      if (self->_lastHiddenState != a9) {
        ++self->_hiddenTransitionCount;
      }
    }

    if (!self->_lastInfraActiveTime && a10) {
      -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", v32);
    }
    if (!self->_lastAwdlActiveTime && a11) {
      -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", v32);
    }
    if (a7 && self->_lastChannel != a7)
    {
      v27 = &OBJC_IVAR___WiFiUsageSoftApSession__fiveGHzChannelCount;
      if (a7 < 0xE) {
        v27 = &OBJC_IVAR___WiFiUsageSoftApSession__twoFourGHzChannelCount;
      }
      ++*(Class *)((char *)&self->super.super.isa + *v27);
    }

    -[WiFiUsageSoftApSession setLastHiddenState:](self, "setLastHiddenState:", a9);
    -[WiFiUsageSoftApSession setLastChannel:](self, "setLastChannel:", a7);
  }

  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___WiFiUsageSoftApSession;
  BYTE3(v30) = a13;
  BYTE2(v30) = a11;
  LOWORD(v30) = __PAIR16__(a10, a9);
  -[WiFiUsageSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:]( &v34,  sel_softApStateDidChange_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency_,  v19,  v31,  v22,  v23,  a7,  a8,  a12,  a14,  v30);
}

- (void)addSoftApClientEvent:(BOOL)a3 identifier:(id)a4 isAppleClient:(BOOL)a5 isInstantHotspot:(BOOL)a6 isAutoHotspot:(BOOL)a7 isHidden:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a3;
  id v14 = a4;
  v15 = v14;
  if (v12)
  {
    if (self->_lastChannel >= 0xE) {
      v16 = &OBJC_IVAR___WiFiUsageSoftApSession__fiveGHzClientConnectCount;
    }
    else {
      v16 = &OBJC_IVAR___WiFiUsageSoftApSession__twoFourGHzClientConnectCount;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v16);
    v17 = &OBJC_IVAR___WiFiUsageSoftApSession__broadcastClientConnectCount;
    if (v8) {
      v17 = &OBJC_IVAR___WiFiUsageSoftApSession__hiddenClientConnectCount;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v17);
    v18 = &OBJC_IVAR___WiFiUsageSoftApSession__otherClientConnectCount;
    if (v11) {
      v18 = &OBJC_IVAR___WiFiUsageSoftApSession__appleClientConnectCount;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v18);
    if (v10) {
      ++self->_instantHotspotClientConnectCount;
    }
    if (v9) {
      ++self->_autoHotspotClientConnectCount;
    }
    v20 = v14;
    if (v14) {
      -[NSMutableSet addObject:](self->_connectedClients, "addObject:", v14);
    }
    unint64_t v19 = -[NSMutableSet count](self->_connectedClients, "count");
    v15 = v20;
    if (v19 > self->_maxConnectedClientCount)
    {
      self->_maxConnectedClientCount = -[NSMutableSet count](self->_connectedClients, "count");

      return;
    }
  }

  else
  {
    ++self->_clientDisconnectCount;
    if (v14)
    {
      id v21 = v14;
      -[NSMutableSet removeObject:](self->_connectedClients, "removeObject:", v14);
      v15 = v21;
    }
  }
}

- (void)addSoftApCoexEvent:(unint64_t)a3 deniedUnii1ChannelMap:(unint64_t)a4 deniedUnii2aChannelMap:(unint64_t)a5 deniedUnii2cChannelMap:(unint64_t)a6 deniedUnii3ChannelMap:(unint64_t)a7
{
}

- (id)eventDictionary:(BOOL)a3
{
  v48[1] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession sessionName](self, "sessionName");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKeyedSubscript:@"SessionName"];

  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  +[WiFiUsagePrivacyFilter numberWithDuration:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "numberWithDuration:");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v7 forKeyedSubscript:@"SessionDuration"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[WiFiUsageSession sessionPid](self, "sessionPid"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v8 forKeyedSubscript:@"SessionPid"];

  -[WiFiUsageSession sessionTimeSinceLastSession](self, "sessionTimeSinceLastSession");
  +[WiFiUsagePrivacyFilter numberWithDuration:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "numberWithDuration:");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v9 forKeyedSubscript:@"SessionTimeSinceLastSession"];

  [v5 setObject:self->_requester forKeyedSubscript:@"Requester"];
  [v5 setObject:self->_status forKeyedSubscript:@"Status"];
  [v5 setObject:self->_tearDownReason forKeyedSubscript:@"TearDownReason"];
  [MEMORY[0x189607968] numberWithBool:self->_lastHiddenState];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v10 forKeyedSubscript:@"LastHiddenState"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_lastChannel];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v11 forKeyedSubscript:@"LastChannel"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_twoFourGHzChannelCount];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v12 forKeyedSubscript:@"TwoFourGHzChannelCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_fiveGHzChannelCount];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v13 forKeyedSubscript:@"FiveGHzChannelCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_appleClientConnectCount];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v14 forKeyedSubscript:@"AppleClientConnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_otherClientConnectCount];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v15 forKeyedSubscript:@"OtherClientConnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_hiddenClientConnectCount];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v16 forKeyedSubscript:@"HiddenClientConnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_broadcastClientConnectCount];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v17 forKeyedSubscript:@"BroadcastClientConnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_autoHotspotClientConnectCount];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v18 forKeyedSubscript:@"AutoHotspotClientConnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_instantHotspotClientConnectCount];
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v19 forKeyedSubscript:@"InstantHotspotClientConnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_twoFourGHzClientConnectCount];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v20 forKeyedSubscript:@"TwoFourGHzClientConnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_fiveGHzClientConnectCount];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v21 forKeyedSubscript:@"FiveGHzClientConnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_clientDisconnectCount];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v22 forKeyedSubscript:@"ClientDisconnectCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_maxConnectedClientCount];
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v23 forKeyedSubscript:@"MaxConnectedClientCount"];

  double lowPowerModeDuration = self->_lowPowerModeDuration;
  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  lowPowerModeDuration,  v25);
  int64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v26 forKeyedSubscript:@"LowPowerModeDuration"];

  double infraActiveDuration = self->_infraActiveDuration;
  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  v29 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  infraActiveDuration,  v28);
  [v5 setObject:v29 forKeyedSubscript:@"InfraActiveDuration"];

  double awdlActiveDuration = self->_awdlActiveDuration;
  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  v32 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  awdlActiveDuration,  v31);
  [v5 setObject:v32 forKeyedSubscript:@"AwdlActiveDuration"];

  [MEMORY[0x189607968] numberWithDouble:self->_requestToUpLatency];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v33 forKeyedSubscript:@"RequestToUpLatency"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_infraStateChangedCount];
  objc_super v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v34 forKeyedSubscript:@"InfraStateChangedCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_awdlStateChangedCount];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v35 forKeyedSubscript:@"AwdlStateChangedCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_knownNetworkScanCount];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v36 forKeyedSubscript:@"KnownNetworkScanCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_hiddenTransitionCount];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v37 forKeyedSubscript:@"HiddenTransitionCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_bandTransitionCount];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v38 forKeyedSubscript:@"BandTransitionCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_twoFourGHzDeniedChannelCount];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v39 forKeyedSubscript:@"TwoFourGHzDeniedChannelCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_fiveGHzDeniedUnii1ChannelCount];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v40 forKeyedSubscript:@"FiveGHzDeniedUnii1ChannelCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_fiveGHzDeniedUnii2aChannelCount];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v41 forKeyedSubscript:@"FiveGHzDeniedUnii2aChannelCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_fiveGHzDeniedUnii2cChannelCount];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v42 forKeyedSubscript:@"FiveGHzDeniedUnii2cChannelCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_fiveGHzDeniedUnii3ChannelCount];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v43 forKeyedSubscript:@"FiveGHzDeniedUnii3ChannelCount"];

  v48[0] = self->_appliedCountryCode;
  [NSString stringWithCString:v48 encoding:4];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v44 forKeyedSubscript:@"CountryCodeApplied"];

  [MEMORY[0x189607968] numberWithBool:self->_compatibilityEnabled];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v45 forKeyedSubscript:@"MaximizeCompatibilityEnabled"];

  if (!a3)
  {
    v46 = -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    [v5 setObject:v46 forKeyedSubscript:@"SessionStartTimestamp"];
  }

  return v5;
}

- (void)summarizeSession
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3;
  if (self->_lastInfraActiveTime)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    self->_double infraActiveDuration = v5 + self->_infraActiveDuration;
    -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", 0LL);
  }

  if (self->_lastAwdlActiveTime)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    self->_double awdlActiveDuration = v6 + self->_awdlActiveDuration;
    -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", 0LL);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiUsageSoftApSession;
  -[WiFiUsageSession summarizeSession](&v7, sel_summarizeSession);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = -[WiFiUsageSession type](self, "type");
  -[WiFiUsageSession interfaceName](self, "interfaceName");
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession capabilities](self, "capabilities");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = (void *)[v4 initWithSessionType:v5 andInterfaceName:v6 andCapabilities:v7];

  -[WiFiUsageSession completionQueue](self, "completionQueue");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setCompletionQueue:v9];

  -[WiFiUsageSession completionContext](self, "completionContext");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setCompletionContext:v10];

  -[WiFiUsageSession completionHandler](self, "completionHandler");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setCompletionHandler:v11];

  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  objc_msgSend(v8, "setSessionDuration:");
  -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setSessionStartTime:v12];

  objc_msgSend(v8, "setIsSessionActive:", -[WiFiUsageSession isSessionActive](self, "isSessionActive"));
  objc_msgSend(v8, "setSessionPid:", -[WiFiUsageSession sessionPid](self, "sessionPid"));
  [v8 setRequester:self->_requester];
  [v8 setStatus:self->_status];
  [v8 setLastAwdlActiveTime:self->_lastAwdlActiveTime];
  [v8 setLastInfraActiveTime:self->_lastInfraActiveTime];
  [v8 setAppleClientConnectCount:self->_appleClientConnectCount];
  [v8 setOtherClientConnectCount:self->_otherClientConnectCount];
  [v8 setHiddenClientConnectCount:self->_hiddenClientConnectCount];
  [v8 setBroadcastClientConnectCount:self->_broadcastClientConnectCount];
  [v8 setTwoFourGHzClientConnectCount:self->_twoFourGHzClientConnectCount];
  [v8 setFiveGHzClientConnectCount:self->_fiveGHzChannelCount];
  [v8 setClientDisconnectCount:self->_clientDisconnectCount];
  [v8 setMaxConnectedClientCount:self->_maxConnectedClientCount];
  [v8 setInstantHotspotClientConnectCount:self->_instantHotspotClientConnectCount];
  [v8 setAutoHotspotClientConnectCount:self->_autoHotspotClientConnectCount];
  [v8 setLastHiddenState:self->_lastHiddenState];
  [v8 setLastChannel:self->_lastChannel];
  [v8 setTwoFourGHzChannelCount:self->_twoFourGHzChannelCount];
  [v8 setFiveGHzChannelCount:self->_fiveGHzChannelCount];
  [v8 setLowPowerModeDuration:self->_lowPowerModeDuration];
  [v8 setInfraActiveDuration:self->_infraActiveDuration];
  [v8 setAwdlActiveDuration:self->_awdlActiveDuration];
  [v8 setRequestToUpLatency:self->_requestToUpLatency];
  [v8 setCompatibilityEnabled:self->_compatibilityEnabled];
  [v8 setInfraStateChangedCount:self->_infraStateChangedCount];
  [v8 setAwdlStateChangedCount:self->_awdlStateChangedCount];
  [v8 setKnownNetworkScanCount:self->_knownNetworkScanCount];
  [v8 setHiddenTransitionCount:self->_hiddenTransitionCount];
  [v8 setBandTransitionCount:self->_bandTransitionCount];
  [v8 setTwoFourGHzDeniedChannelCount:self->_twoFourGHzDeniedChannelCount];
  [v8 setFiveGHzDeniedUnii1ChannelCount:self->_fiveGHzDeniedUnii1ChannelCount];
  [v8 setFiveGHzDeniedUnii2aChannelCount:self->_fiveGHzDeniedUnii2aChannelCount];
  [v8 setFiveGHzDeniedUnii2cChannelCount:self->_fiveGHzDeniedUnii2cChannelCount];
  [v8 setFiveGHzDeniedUnii3ChannelCount:self->_fiveGHzDeniedUnii3ChannelCount];
  [v8 setAppliedCountryCode:self->_appliedCountryCode];
  [v8 setConnectedClients:self->_connectedClients];
  [v8 setTearDownReason:self->_tearDownReason];
  return v8;
}

- (id)metricName
{
  return @"com.apple.wifi.softapsession";
}

- (NSString)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)tearDownReason
{
  return self->_tearDownReason;
}

- (void)setTearDownReason:(id)a3
{
}

- (NSDate)lastAwdlActiveTime
{
  return self->_lastAwdlActiveTime;
}

- (void)setLastAwdlActiveTime:(id)a3
{
}

- (NSDate)lastInfraActiveTime
{
  return self->_lastInfraActiveTime;
}

- (void)setLastInfraActiveTime:(id)a3
{
}

- (BOOL)compatibilityEnabled
{
  return self->_compatibilityEnabled;
}

- (void)setCompatibilityEnabled:(BOOL)a3
{
  self->_compatibilityEnabled = a3;
}

- (unint64_t)appleClientConnectCount
{
  return self->_appleClientConnectCount;
}

- (void)setAppleClientConnectCount:(unint64_t)a3
{
  self->_appleClientConnectCount = a3;
}

- (unint64_t)otherClientConnectCount
{
  return self->_otherClientConnectCount;
}

- (void)setOtherClientConnectCount:(unint64_t)a3
{
  self->_otherClientConnectCount = a3;
}

- (unint64_t)hiddenClientConnectCount
{
  return self->_hiddenClientConnectCount;
}

- (void)setHiddenClientConnectCount:(unint64_t)a3
{
  self->_hiddenClientConnectCount = a3;
}

- (unint64_t)broadcastClientConnectCount
{
  return self->_broadcastClientConnectCount;
}

- (void)setBroadcastClientConnectCount:(unint64_t)a3
{
  self->_broadcastClientConnectCount = a3;
}

- (unint64_t)twoFourGHzClientConnectCount
{
  return self->_twoFourGHzClientConnectCount;
}

- (void)setTwoFourGHzClientConnectCount:(unint64_t)a3
{
  self->_twoFourGHzClientConnectCount = a3;
}

- (unint64_t)fiveGHzClientConnectCount
{
  return self->_fiveGHzClientConnectCount;
}

- (void)setFiveGHzClientConnectCount:(unint64_t)a3
{
  self->_fiveGHzClientConnectCount = a3;
}

- (unint64_t)autoHotspotClientConnectCount
{
  return self->_autoHotspotClientConnectCount;
}

- (void)setAutoHotspotClientConnectCount:(unint64_t)a3
{
  self->_autoHotspotClientConnectCount = a3;
}

- (unint64_t)instantHotspotClientConnectCount
{
  return self->_instantHotspotClientConnectCount;
}

- (void)setInstantHotspotClientConnectCount:(unint64_t)a3
{
  self->_instantHotspotClientConnectCount = a3;
}

- (unint64_t)clientDisconnectCount
{
  return self->_clientDisconnectCount;
}

- (void)setClientDisconnectCount:(unint64_t)a3
{
  self->_clientDisconnectCount = a3;
}

- (unint64_t)maxConnectedClientCount
{
  return self->_maxConnectedClientCount;
}

- (void)setMaxConnectedClientCount:(unint64_t)a3
{
  self->_maxConnectedClientCount = a3;
}

- (BOOL)lastHiddenState
{
  return self->_lastHiddenState;
}

- (void)setLastHiddenState:(BOOL)a3
{
  self->_lastHiddenState = a3;
}

- (unint64_t)lastChannel
{
  return self->_lastChannel;
}

- (void)setLastChannel:(unint64_t)a3
{
  self->_lastChannel = a3;
}

- (unint64_t)twoFourGHzChannelCount
{
  return self->_twoFourGHzChannelCount;
}

- (void)setTwoFourGHzChannelCount:(unint64_t)a3
{
  self->_twoFourGHzChannelCount = a3;
}

- (unint64_t)fiveGHzChannelCount
{
  return self->_fiveGHzChannelCount;
}

- (void)setFiveGHzChannelCount:(unint64_t)a3
{
  self->_fiveGHzChannelCount = a3;
}

- (double)lowPowerModeDuration
{
  return self->_lowPowerModeDuration;
}

- (void)setLowPowerModeDuration:(double)a3
{
  self->_double lowPowerModeDuration = a3;
}

- (double)infraActiveDuration
{
  return self->_infraActiveDuration;
}

- (void)setInfraActiveDuration:(double)a3
{
  self->_double infraActiveDuration = a3;
}

- (double)awdlActiveDuration
{
  return self->_awdlActiveDuration;
}

- (void)setAwdlActiveDuration:(double)a3
{
  self->_double awdlActiveDuration = a3;
}

- (double)requestToUpLatency
{
  return self->_requestToUpLatency;
}

- (void)setRequestToUpLatency:(double)a3
{
  self->_requestToUpLatency = a3;
}

- (unint64_t)infraStateChangedCount
{
  return self->_infraStateChangedCount;
}

- (void)setInfraStateChangedCount:(unint64_t)a3
{
  self->_infraStateChangedCount = a3;
}

- (unint64_t)awdlStateChangedCount
{
  return self->_awdlStateChangedCount;
}

- (void)setAwdlStateChangedCount:(unint64_t)a3
{
  self->_awdlStateChangedCount = a3;
}

- (unint64_t)knownNetworkScanCount
{
  return self->_knownNetworkScanCount;
}

- (void)setKnownNetworkScanCount:(unint64_t)a3
{
  self->_knownNetworkScanCount = a3;
}

- (unint64_t)hiddenTransitionCount
{
  return self->_hiddenTransitionCount;
}

- (void)setHiddenTransitionCount:(unint64_t)a3
{
  self->_hiddenTransitionCount = a3;
}

- (unint64_t)bandTransitionCount
{
  return self->_bandTransitionCount;
}

- (void)setBandTransitionCount:(unint64_t)a3
{
  self->_bandTransitionCount = a3;
}

- (unint64_t)twoFourGHzDeniedChannelCount
{
  return self->_twoFourGHzDeniedChannelCount;
}

- (void)setTwoFourGHzDeniedChannelCount:(unint64_t)a3
{
  self->_twoFourGHzDeniedChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii1ChannelCount
{
  return self->_fiveGHzDeniedUnii1ChannelCount;
}

- (void)setFiveGHzDeniedUnii1ChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii1ChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii2aChannelCount
{
  return self->_fiveGHzDeniedUnii2aChannelCount;
}

- (void)setFiveGHzDeniedUnii2aChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii2aChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii2cChannelCount
{
  return self->_fiveGHzDeniedUnii2cChannelCount;
}

- (void)setFiveGHzDeniedUnii2cChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii2cChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii3ChannelCount
{
  return self->_fiveGHzDeniedUnii3ChannelCount;
}

- (void)setFiveGHzDeniedUnii3ChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii3ChannelCount = a3;
}

- (unint64_t)appliedCountryCode
{
  return self->_appliedCountryCode;
}

- (void)setAppliedCountryCode:(unint64_t)a3
{
  self->_appliedCountryCode = a3;
}

- (NSMutableSet)connectedClients
{
  return self->_connectedClients;
}

- (void)setConnectedClients:(id)a3
{
}

- (void).cxx_destruct
{
}

@end