@interface WiFiUsageRealTimeCoexSession
- (BOOL)hasCandidates;
- (BOOL)hasDifferentIpv4DetailsAfterSSIDTransition;
- (BOOL)hasDifferentIpv6DetailsAfterSSIDTransition;
- (BOOL)infraIsPartOfSplitSSID;
- (BOOL)isCurrentBandPreferredBand;
- (BOOL)isCurrentChannelPreferredChannel;
- (BOOL)isRtCoexOptimal;
- (BOOL)isSplitSSID;
- (BOOL)lastRequestDifferentSSID;
- (NSDate)firstIPUpdateAfterSSIDTransition;
- (NSDate)firstManualJoin;
- (NSDate)firstManualJoinAfterSSIDTransition;
- (NSDate)firstRtCoexOptimal;
- (NSDate)firstSSIDTransition;
- (NSDate)lastEnterPreferredBand;
- (NSDate)lastEnterPreferredChannel;
- (NSDate)lastRtCoexOptimalStatusChange;
- (NSString)lastRequestPreferredBSS;
- (NSString)lastRequestPreferredSSID;
- (NSString)rtCoexSubType;
- (WiFiUsageRealTimeCoexSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (double)preferredBandDuration;
- (double)preferredChannelDuration;
- (double)rtCoexInOptimalDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventDictionary:(BOOL)a3;
- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4;
- (id)metricName;
- (int)lastRequestPreferredBand;
- (unint64_t)lastRequestPreferredChannel;
- (unint64_t)lastRequestType;
- (unint64_t)requestDisconnectCount;
- (unint64_t)requestSteerCount;
- (unint64_t)requestSteerToPreferredChannelCount;
- (unint64_t)rtCoexType;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)processIPv4Changes:(id)a3;
- (void)processIPv6Changes:(id)a3;
- (void)sessionDidStart;
- (void)setFirstIPUpdateAfterSSIDTransition:(id)a3;
- (void)setFirstManualJoin:(id)a3;
- (void)setFirstManualJoinAfterSSIDTransition:(id)a3;
- (void)setFirstRtCoexOptimal:(id)a3;
- (void)setFirstSSIDTransition:(id)a3;
- (void)setHasCandidates:(BOOL)a3;
- (void)setHasDifferentIpv4DetailsAfterSSIDTransition:(BOOL)a3;
- (void)setHasDifferentIpv6DetailsAfterSSIDTransition:(BOOL)a3;
- (void)setIsRtCoexOptimal:(BOOL)a3;
- (void)setIsSplitSSID:(BOOL)a3;
- (void)setLastEnterPreferredBand:(id)a3;
- (void)setLastEnterPreferredChannel:(id)a3;
- (void)setLastRequestDifferentSSID:(BOOL)a3;
- (void)setLastRequestPreferredBSS:(id)a3;
- (void)setLastRequestPreferredBand:(int)a3;
- (void)setLastRequestPreferredChannel:(unint64_t)a3;
- (void)setLastRequestPreferredSSID:(id)a3;
- (void)setLastRequestType:(unint64_t)a3;
- (void)setLastRtCoexOptimalStatusChange:(id)a3;
- (void)setPreferredBandDuration:(double)a3;
- (void)setPreferredChannelAndBandUsageWithReferenceDate:(id)a3;
- (void)setPreferredChannelDuration:(double)a3;
- (void)setRealTimeCoexStatus:(BOOL)a3 type:(unint64_t)a4;
- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5;
- (void)setRequestDisconnectCount:(unint64_t)a3;
- (void)setRequestSteerCount:(unint64_t)a3;
- (void)setRequestSteerToPreferredChannelCount:(unint64_t)a3;
- (void)setRtCoexInOptimalDuration:(double)a3;
- (void)setRtCoexSubType:(id)a3;
- (void)setRtCoexType:(unint64_t)a3;
- (void)setSteeringRequest:(unint64_t)a3 preferredChannel:(unint64_t)a4 preferredBand:(int)a5 preferredSSID:(id)a6 targetSSIDDiffersFromCurrent:(BOOL)a7 preferredBSS:(id)a8 ssidIsSplit:(BOOL)a9 transitionCandidates:(BOOL)a10;
- (void)summarizeSession;
- (void)updateAssociatedNetworkDetails:(id)a3;
- (void)updatePreferredChannelAndBandUsageWithReferenceDate:(id)a3;
- (void)updateRtCoexInOptimalDuration:(BOOL)a3;
@end

@implementation WiFiUsageRealTimeCoexSession

- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5
{
  BOOL v6 = a3;
  id v16 = a5;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive") && !v6)
  {
    v8 = -[WiFiUsageSession sessionName](self, "sessionName");
    NSLog( @"%s - %@ session ended",  "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]",  v8);

    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
  }

  if (v6)
  {
    BOOL v9 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
    v10 = -[WiFiUsageSession sessionName](self, "sessionName");
    v11 = +[WiFiUsagePrivacyFilter getLabelForRTCoexType:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "getLabelForRTCoexType:", a4);
    uint64_t v12 = [v16 componentsJoinedByString:@"&"];
    v13 = (void *)v12;
    if (v9)
    {
      NSLog( @"%s - %@ session already active (%@:%@)",  "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]",  v10,  v11,  v12);
    }

    else
    {
      NSLog( @"%s - %@ session started for %@ (%@)",  "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]",  v10,  v11,  v12);

      self->_rtCoexType = a4;
      [v16 componentsJoinedByString:@"&"];
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      rtCoexSubType = self->_rtCoexSubType;
      self->_rtCoexSubType = v14;

      -[WiFiUsageRealTimeCoexSession sessionDidStart](self, "sessionDidStart");
    }
  }
}

- (void)setSteeringRequest:(unint64_t)a3 preferredChannel:(unint64_t)a4 preferredBand:(int)a5 preferredSSID:(id)a6 targetSSIDDiffersFromCurrent:(BOOL)a7 preferredBSS:(id)a8 ssidIsSplit:(BOOL)a9 transitionCandidates:(BOOL)a10
{
  BOOL v11 = a7;
  uint64_t v12 = *(void *)&a5;
  v15 = (NSString *)a6;
  id v16 = (NSString *)a8;
  v17 = +[WiFiUsagePrivacyFilter getLabelForSteeringRequest:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForSteeringRequest:",  a3);
  uint64_t v18 = +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", v12);
  v19 = (void *)v18;
  v20 = @"NO";
  BOOL v28 = v11;
  if (v11) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  if (a9) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  if (a10) {
    v20 = @"YES";
  }
  NSLog( @"%s - type:'%@'(%lu) preferredChannel:%lu preferredBand:%@ preferredSSID:%@ isDifferentSSID:%@ preferredBSS:%@ isSpl itSSID:%@ hasCandidates:%@",  "-[WiFiUsageRealTimeCoexSession setSteeringRequest:preferredChannel:preferredBand:preferredSSID:targetSSIDDiffersFrom Current:preferredBSS:ssidIsSplit:transitionCandidates:]",  v17,  a3,  a4,  v18,  v15,  v21,  v16,  v22,  v20);

  self->_lastRequestType = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
    self->_lastRequestPreferredChannel = a4;
  }
  if ((_DWORD)v12 != 3) {
    self->_lastRequestPreferredBand = v12;
  }
  lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
  self->_lastRequestPreferredSSID = v15;
  v24 = v15;

  self->_lastRequestDifferentSSID = v28;
  lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
  self->_lastRequestPreferredBSS = v16;

  self->_isSplitSSID = a9;
  self->_hasCandidates = a10;
  if (a3 <= 2)
  {
    uint64_t v26 = *off_18A16EA88[a3];
    ++*(Class *)((char *)&self->super.super.isa + v26);
  }

- (void)updateRtCoexInOptimalDuration:(BOOL)a3
{
  if (self->_lastRtCoexOptimalStatusChange) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x189603F50], "now", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 timeIntervalSinceDate:self->_lastRtCoexOptimalStatusChange];
    self->_rtCoexInOptimalDuration = v5 + self->_rtCoexInOptimalDuration;
  }

- (void)setRealTimeCoexStatus:(BOOL)a3 type:(unint64_t)a4
{
  BOOL v5 = a3;
  [MEMORY[0x189603F50] now];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!self->_lastRtCoexOptimalStatusChange || self->_isRtCoexOptimal && !v5)
    && (-[WiFiUsageRealTimeCoexSession updateRtCoexInOptimalDuration:](self, "updateRtCoexInOptimalDuration:", v5),
        -[WiFiUsageRealTimeCoexSession setLastRtCoexOptimalStatusChange:](self, "setLastRtCoexOptimalStatusChange:", v7),
        !self->_lastRtCoexOptimalStatusChange)
    || (!self->_isRtCoexOptimal ? (BOOL v8 = !v5) : (BOOL v8 = 1), !v8))
  {
    -[WiFiUsageRealTimeCoexSession setLastRtCoexOptimalStatusChange:](self, "setLastRtCoexOptimalStatusChange:", v7);
  }

  self->_isRtCoexOptimal = v5;
  if (self->_firstRtCoexOptimal) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v5;
  }
  if (!v9) {
    objc_storeStrong((id *)&self->_firstRtCoexOptimal, v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession setRealTimeCoexStatus:type:](&v10, sel_setRealTimeCoexStatus_type_, v5, a4);
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v12 = (void *)MEMORY[0x189603F50];
  id v13 = a7;
  [v12 now];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageRealTimeCoexSession updatePreferredChannelAndBandUsageWithReferenceDate:]( self,  "updatePreferredChannelAndBandUsageWithReferenceDate:",  v14);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]( &v15,  sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_,  v10,  v9,  a5,  a6,  v13);

  -[WiFiUsageRealTimeCoexSession setPreferredChannelAndBandUsageWithReferenceDate:]( self,  "setPreferredChannelAndBandUsageWithReferenceDate:",  v14);
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (v12 && a4 == 12)
  {
    if (!self->_firstSSIDTransition)
    {
      [MEMORY[0x189603F50] now];
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      firstSSIDTransition = self->_firstSSIDTransition;
      self->_firstSSIDTransition = v14;
LABEL_12:
    }
  }

  else if (v12 && a4 == 2)
  {
    if (!self->_firstManualJoin)
    {
      [MEMORY[0x189603F50] now];
      id v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
      firstManualJoin = self->_firstManualJoin;
      self->_firstManualJoin = v16;
    }

    if (self->_firstSSIDTransition && !self->_firstManualJoinAfterSSIDTransition)
    {
      [MEMORY[0x189603F50] now];
      uint64_t v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
      firstSSIDTransition = self->_firstManualJoinAfterSSIDTransition;
      self->_firstManualJoinAfterSSIDTransition = v18;
      goto LABEL_12;
    }
  }

  NSLog( @"%s - firstSSIDTransition:%@ firstManualJoinAfterSSIDTransition:%@ firstManualJoin:%@",  "-[WiFiUsageRealTimeCoexSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]",  self->_firstSSIDTransition,  self->_firstManualJoinAfterSSIDTransition,  self->_firstManualJoin);
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]( &v19,  sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_,  v12,  a4,  a5,  a6,  v13);
}

- (void)processIPv4Changes:(id)a3
{
  id v4 = a3;
  if (-[WiFiUsageSession lastJoinReason](self, "lastJoinReason") == 12)
  {
    -[WiFiUsageSession ipV4Details](self, "ipV4Details");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasDifferentIpv4DetailsAfterSSIDTransition = [v5 isEqual:v4] ^ 1;

    [MEMORY[0x189603F50] now];
    id v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
    self->_firstIPUpdateAfterSSIDTransition = v6;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  objc_msgSend( -[WiFiUsageRealTimeCoexSession class](&v10, sel_class),  "joinReasonString:",  -[WiFiUsageSession lastJoinReason](self, "lastJoinReason"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s - lastJoinReason:%@ firstIPUpdateAfterSSIDTransition:%@",  "-[WiFiUsageRealTimeCoexSession processIPv4Changes:]",  v8,  self->_firstIPUpdateAfterSSIDTransition);

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession processIPv4Changes:](&v9, sel_processIPv4Changes_, v4);
}

- (void)processIPv6Changes:(id)a3
{
  id v4 = a3;
  if (-[WiFiUsageSession lastJoinReason](self, "lastJoinReason") == 12)
  {
    -[WiFiUsageSession ipV6Details](self, "ipV6Details");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasDifferentIpv6DetailsAfterSSIDTransition = [v5 isEqual:v4] ^ 1;
  }

  if (!self->_firstIPUpdateAfterSSIDTransition)
  {
    [MEMORY[0x189603F50] now];
    id v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
    self->_firstIPUpdateAfterSSIDTransition = v6;

    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
    objc_msgSend( -[WiFiUsageRealTimeCoexSession class](&v10, sel_class),  "joinReasonString:",  -[WiFiUsageSession lastJoinReason](self, "lastJoinReason"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s - lastJoinReason:%@ firstIPUpdateAfterSSIDTransition:%@",  "-[WiFiUsageRealTimeCoexSession processIPv6Changes:]",  v8,  self->_firstIPUpdateAfterSSIDTransition);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession processIPv6Changes:](&v9, sel_processIPv6Changes_, v4);
}

- (void)summarizeSession
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageRealTimeCoexSession updateRtCoexInOptimalDuration:]( self,  "updateRtCoexInOptimalDuration:",  self->_isRtCoexOptimal);
  -[WiFiUsageRealTimeCoexSession updatePreferredChannelAndBandUsageWithReferenceDate:]( self,  "updatePreferredChannelAndBandUsageWithReferenceDate:",  v3);
  -[WiFiUsageRealTimeCoexSession setPreferredChannelAndBandUsageWithReferenceDate:]( self,  "setPreferredChannelAndBandUsageWithReferenceDate:",  v3);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession summarizeSession](&v4, sel_summarizeSession);
}

- (id)eventDictionary:(BOOL)a3
{
  objc_super v4 = (void *)MEMORY[0x189603FC8];
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession eventDictionary:](&v70, sel_eventDictionary_, a3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dictionaryWithDictionary:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    firstSSIDTransition = self->_firstSSIDTransition;
    -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceDate:](firstSSIDTransition, "timeIntervalSinceDate:", v8);
    double v10 = v9;

    -[NSDate timeIntervalSinceDate:]( self->_firstIPUpdateAfterSSIDTransition,  "timeIntervalSinceDate:",  self->_firstSSIDTransition);
    double v12 = v11;
    firstManualJoin = self->_firstManualJoin;
    v14 = -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    -[NSDate timeIntervalSinceDate:](firstManualJoin, "timeIntervalSinceDate:", v14);
    double v16 = v15;

    -[NSDate timeIntervalSinceDate:]( self->_firstManualJoinAfterSSIDTransition,  "timeIntervalSinceDate:",  self->_firstSSIDTransition);
    double v18 = v17;
    +[WiFiUsagePrivacyFilter getLabelForRTCoexType:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRTCoexType:",  self->_rtCoexType);
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v19 forKeyedSubscript:@"coexSessionTrigger"];

    [v6 setObject:self->_rtCoexSubType forKeyedSubscript:@"coexSessionReason"];
    v20 = +[WiFiUsagePrivacyFilter getLabelForSteeringRequest:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForSteeringRequest:",  self->_lastRequestType);
    [v6 setObject:v20 forKeyedSubscript:@"coexSteeringLastRequestType"];

    if (self->_firstSSIDTransition)
    {
      v21 = +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  v10);
      [v6 setObject:v21 forKeyedSubscript:@"timeToSSIDTransition"];
    }

    if (self->_firstIPUpdateAfterSSIDTransition)
    {
      v22 = +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  v12);
      [v6 setObject:v22 forKeyedSubscript:@"timeToCompleteDHCP"];
    }

    if (self->_firstManualJoin)
    {
      v23 = +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  v16);
      [v6 setObject:v23 forKeyedSubscript:@"timeToManualJoinAttempt"];
    }

    if (self->_firstManualJoinAfterSSIDTransition)
    {
      v24 = +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  v18);
      [v6 setObject:v24 forKeyedSubscript:@"timeSSIDTransitionToManualJoinAttempt"];
    }

    if (self->_lastRequestPreferredBand != 3)
    {
      v25 = +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:");
      [v6 setObject:v25 forKeyedSubscript:@"coexSteeringRequestLastPreferredBand"];

      uint64_t v26 = (void *)MEMORY[0x189607968];
      int lastRequestPreferredBand = self->_lastRequestPreferredBand;
      -[WiFiUsageSession networkDetails](self, "networkDetails");
      BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 connectedBss];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "numberWithBool:", lastRequestPreferredBand == objc_msgSend(v29, "band"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v30 forKeyedSubscript:@"bandAtEndIsTargetBand"];

      double preferredBandDuration = self->_preferredBandDuration;
      -[WiFiUsageSession sessionDuration](self, "sessionDuration");
      v33 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  preferredBandDuration,  v32);
      [v6 setObject:v33 forKeyedSubscript:@"durationOnPreferredBandPerc"];

      if (self->_lastRequestPreferredChannel != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageRealTimeCoexSession isCurrentChannelPreferredChannel](self, "isCurrentChannelPreferredChannel"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v34 forKeyedSubscript:@"channelAtEndIsTargetChannel"];

        double preferredChannelDuration = self->_preferredChannelDuration;
        -[WiFiUsageSession sessionDuration](self, "sessionDuration");
        v37 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  preferredChannelDuration,  v36);
        [v6 setObject:v37 forKeyedSubscript:@"durationOnPreferredChannelPerc"];
      }
    }

    if (self->_lastRequestType != 3)
    {
      [MEMORY[0x189607968] numberWithBool:self->_lastRequestPreferredSSID != 0];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v38 forKeyedSubscript:@"coexSteeringLastRequestHasPreferredSSID"];

      if (self->_lastRequestPreferredSSID)
      {
        [MEMORY[0x189607968] numberWithBool:self->_lastRequestDifferentSSID];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v39 forKeyedSubscript:@"coexSteeringLastRequestPreferredSSIDDiffers"];

        v40 = (void *)MEMORY[0x189607968];
        lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
        v42 = -[WiFiUsageSession networkDetails](self, "networkDetails");
        [v42 networkName];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( v40,  "numberWithBool:",  -[NSString isEqualToString:](lastRequestPreferredSSID, "isEqualToString:", v43));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v44 forKeyedSubscript:@"ssidAtEndIsTargetSSID"];
      }

      lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
      if (lastRequestPreferredBSS)
      {
        v46 = (void *)MEMORY[0x189607968];
        v47 = -[WiFiUsageSession networkDetails](self, "networkDetails");
        [v47 connectedBss];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v48 bssid];
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( v46,  "numberWithBool:",  -[NSString isEqualToString:](lastRequestPreferredBSS, "isEqualToString:", v49));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v50 forKeyedSubscript:@"bssAtEndIsTargetBSS"];

        BOOL v51 = self->_lastRequestPreferredBSS != 0LL;
      }

      else
      {
        BOOL v51 = 0LL;
      }

      [MEMORY[0x189607968] numberWithBool:v51];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v52 forKeyedSubscript:@"coexSteeringLastRequestHasPreferredBSS"];
    }

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_requestSteerToPreferredChannelCount];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v53 forKeyedSubscript:@"requestSteerToPreferredChannelCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_requestSteerCount];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v54 forKeyedSubscript:@"requestSteerCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_requestDisconnectCount];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v55 forKeyedSubscript:@"requestDisconnect"];

    firstRtCoexOptimal = self->_firstRtCoexOptimal;
    if (firstRtCoexOptimal)
    {
      v57 = -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
      -[NSDate timeIntervalSinceDate:](firstRtCoexOptimal, "timeIntervalSinceDate:", v57);
      double v59 = v58;
      v60 = +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  (unint64_t)v59,  &unk_18A1B59D8,  @"0",  1LL);
      [v6 setObject:v60 forKeyedSubscript:@"timeToOptimalCoex"];

      [MEMORY[0x189607968] numberWithDouble:v59];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v61 forKeyedSubscript:@"timeToOptimalCoex_raw"];

      -[WiFiUsageSession sessionDuration](self, "sessionDuration");
      v63 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  v59,  v62);
      [v6 setObject:v63 forKeyedSubscript:@"timeToOptimalCoexPercSession"];

      double rtCoexInOptimalDuration = self->_rtCoexInOptimalDuration;
      -[WiFiUsageSession sessionDuration](self, "sessionDuration");
      v66 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  rtCoexInOptimalDuration,  v65);
      [v6 setObject:v66 forKeyedSubscript:@"inOptimalCoexPercSession"];

      [MEMORY[0x189607968] numberWithDouble:self->_rtCoexInOptimalDuration];
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v67 forKeyedSubscript:@"inOptimalCoexDuration"];
    }

    id v68 = v6;
  }

  return v6;
}

- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4
{
  BOOL v5 = (void *)MEMORY[0x189603FC8];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession eventDictionaryByBand:isFirst:](&v10, sel_eventDictionaryByBand_isFirst_, *(void *)&a3, a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dictionaryWithDictionary:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiUsageRealTimeCoexSession eventDictionary:](self, "eventDictionary:", 1LL);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addEntriesFromDictionary:v8];

  return v7;
}

- (WiFiUsageRealTimeCoexSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  return -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v5,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  8LL,  a3,  a4);
}

- (void)sessionDidStart
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession sessionDidStart](&v13, sel_sessionDidStart);
  self->_lastRequestType = 3LL;
  self->_lastRequestPreferredChannel = 0x7FFFFFFFFFFFFFFFLL;
  self->_int lastRequestPreferredBand = 3;
  lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
  self->_lastRequestPreferredSSID = 0LL;

  self->_lastRequestDifferentSSID = 0;
  lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
  self->_lastRequestPreferredBSS = 0LL;

  self->_isSplitSSID = 0;
  self->_hasCandidates = 0;
  self->_isRtCoexOptimal = 1;
  firstRtCoexOptimal = self->_firstRtCoexOptimal;
  self->_firstRtCoexOptimal = 0LL;

  lastRtCoexOptimalStatusChange = self->_lastRtCoexOptimalStatusChange;
  self->_lastRtCoexOptimalStatusChange = 0LL;

  self->_double rtCoexInOptimalDuration = 0.0;
  self->_requestSteerToPreferredChannelCount = 0LL;
  self->_requestSteerCount = 0LL;
  self->_requestDisconnectCount = 0LL;
  lastEnterPreferredChannel = self->_lastEnterPreferredChannel;
  self->_lastEnterPreferredChannel = 0LL;

  self->_double preferredChannelDuration = 0.0;
  lastEnterPreferredBand = self->_lastEnterPreferredBand;
  self->_lastEnterPreferredBand = 0LL;

  self->_double preferredBandDuration = 0.0;
  firstSSIDTransition = self->_firstSSIDTransition;
  self->_firstSSIDTransition = 0LL;

  firstManualJoin = self->_firstManualJoin;
  self->_firstManualJoin = 0LL;

  firstManualJoinAfterSSIDTransition = self->_firstManualJoinAfterSSIDTransition;
  self->_firstManualJoinAfterSSIDTransition = 0LL;

  firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
  self->_firstIPUpdateAfterSSIDTransition = 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  objc_super v4 = -[WiFiUsageSession copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_super v5 = v4;
  if (v4)
  {
    v4[1493] = (id)self->_rtCoexType;
    objc_storeStrong(v4 + 1494, self->_rtCoexSubType);
    v5[1495] = (id)self->_lastRequestType;
    v5[1496] = (id)self->_lastRequestPreferredChannel;
    *((_DWORD *)v5 + 2984) = self->_lastRequestPreferredBand;
    objc_storeStrong(v5 + 1497, self->_lastRequestPreferredSSID);
    objc_storeStrong(v5 + 1498, self->_lastRequestPreferredBSS);
    *((_BYTE *)v5 + 11929) = self->_isSplitSSID;
    *((_BYTE *)v5 + 11930) = self->_hasCandidates;
    *((_BYTE *)v5 + 11933) = self->_isRtCoexOptimal;
    objc_storeStrong(v5 + 1499, self->_firstRtCoexOptimal);
    objc_storeStrong(v5 + 1500, self->_lastRtCoexOptimalStatusChange);
    v5[1501] = *(id *)&self->_rtCoexInOptimalDuration;
    v5[1510] = (id)self->_requestSteerToPreferredChannelCount;
    v5[1511] = (id)self->_requestSteerCount;
    v5[1512] = (id)self->_requestDisconnectCount;
    objc_storeStrong(v5 + 1502, self->_lastEnterPreferredChannel);
    v5[1503] = *(id *)&self->_preferredChannelDuration;
    objc_storeStrong(v5 + 1504, self->_lastEnterPreferredBand);
    v5[1505] = *(id *)&self->_preferredBandDuration;
    objc_storeStrong(v5 + 1506, self->_firstSSIDTransition);
    objc_storeStrong(v5 + 1507, self->_firstIPUpdateAfterSSIDTransition);
    objc_storeStrong(v5 + 1508, self->_firstManualJoin);
    objc_storeStrong(v5 + 1509, self->_firstManualJoinAfterSSIDTransition);
    id v6 = v5;
  }

  return v5;
}

- (id)metricName
{
  return @"com.apple.wifi.InfraRealTimeCoexSession";
}

- (BOOL)isCurrentChannelPreferredChannel
{
  if (self->_lastRequestPreferredBand == 3) {
    return 0;
  }
  unint64_t lastRequestPreferredChannel = self->_lastRequestPreferredChannel;
  if (lastRequestPreferredChannel == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  -[WiFiUsageSession networkDetails](self, "networkDetails");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 connectedBss];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (lastRequestPreferredChannel == [v6 channel])
  {
    int lastRequestPreferredBand = self->_lastRequestPreferredBand;
    -[WiFiUsageSession networkDetails](self, "networkDetails");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 connectedBss];
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v4 = lastRequestPreferredBand == [v9 band];
  }

  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isCurrentBandPreferredBand
{
  int lastRequestPreferredBand = self->_lastRequestPreferredBand;
  if (lastRequestPreferredBand == 3) {
    return 0;
  }
  -[WiFiUsageSession networkDetails](self, "networkDetails");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 connectedBss];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = lastRequestPreferredBand == [v5 band];

  return v3;
}

- (void)updateAssociatedNetworkDetails:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x189603F50];
  id v5 = a3;
  [v4 now];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageRealTimeCoexSession updatePreferredChannelAndBandUsageWithReferenceDate:]( self,  "updatePreferredChannelAndBandUsageWithReferenceDate:",  v6);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession updateAssociatedNetworkDetails:](&v7, sel_updateAssociatedNetworkDetails_, v5);

  -[WiFiUsageRealTimeCoexSession setPreferredChannelAndBandUsageWithReferenceDate:]( self,  "setPreferredChannelAndBandUsageWithReferenceDate:",  v6);
}

- (void)updatePreferredChannelAndBandUsageWithReferenceDate:(id)a3
{
  id v8 = a3;
  if (-[WiFiUsageRealTimeCoexSession isCurrentChannelPreferredChannel](self, "isCurrentChannelPreferredChannel")
    && self->_lastEnterPreferredChannel)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:");
    self->_double preferredChannelDuration = v4 + self->_preferredChannelDuration;
    lastEnterPreferredChannel = self->_lastEnterPreferredChannel;
    self->_lastEnterPreferredChannel = 0LL;
  }

  if (-[WiFiUsageRealTimeCoexSession isCurrentBandPreferredBand](self, "isCurrentBandPreferredBand")
    && self->_lastEnterPreferredBand)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:");
    self->_double preferredBandDuration = v6 + self->_preferredBandDuration;
    lastEnterPreferredBand = self->_lastEnterPreferredBand;
    self->_lastEnterPreferredBand = 0LL;
  }
}

- (void)setPreferredChannelAndBandUsageWithReferenceDate:(id)a3
{
  id v5 = a3;
  if (-[WiFiUsageRealTimeCoexSession isCurrentChannelPreferredChannel](self, "isCurrentChannelPreferredChannel")) {
    objc_storeStrong((id *)&self->_lastEnterPreferredChannel, a3);
  }
  if (-[WiFiUsageRealTimeCoexSession isCurrentBandPreferredBand](self, "isCurrentBandPreferredBand")) {
    objc_storeStrong((id *)&self->_lastEnterPreferredBand, a3);
  }
}

- (BOOL)infraIsPartOfSplitSSID
{
  return -[WiFiUsageSession bandAtSessionStart](self, "bandAtSessionStart") == 2 && self->_isSplitSSID;
}

- (unint64_t)rtCoexType
{
  return self->_rtCoexType;
}

- (void)setRtCoexType:(unint64_t)a3
{
  self->_rtCoexType = a3;
}

- (NSString)rtCoexSubType
{
  return (NSString *)objc_getProperty(self, a2, 11952LL, 1);
}

- (void)setRtCoexSubType:(id)a3
{
}

- (unint64_t)lastRequestType
{
  return self->_lastRequestType;
}

- (void)setLastRequestType:(unint64_t)a3
{
  self->_lastRequestType = a3;
}

- (unint64_t)lastRequestPreferredChannel
{
  return self->_lastRequestPreferredChannel;
}

- (void)setLastRequestPreferredChannel:(unint64_t)a3
{
  self->_unint64_t lastRequestPreferredChannel = a3;
}

- (int)lastRequestPreferredBand
{
  return self->_lastRequestPreferredBand;
}

- (void)setLastRequestPreferredBand:(int)a3
{
  self->_int lastRequestPreferredBand = a3;
}

- (BOOL)lastRequestDifferentSSID
{
  return self->_lastRequestDifferentSSID;
}

- (void)setLastRequestDifferentSSID:(BOOL)a3
{
  self->_lastRequestDifferentSSID = a3;
}

- (NSString)lastRequestPreferredSSID
{
  return (NSString *)objc_getProperty(self, a2, 11976LL, 1);
}

- (void)setLastRequestPreferredSSID:(id)a3
{
}

- (NSString)lastRequestPreferredBSS
{
  return (NSString *)objc_getProperty(self, a2, 11984LL, 1);
}

- (void)setLastRequestPreferredBSS:(id)a3
{
}

- (BOOL)isSplitSSID
{
  return self->_isSplitSSID;
}

- (void)setIsSplitSSID:(BOOL)a3
{
  self->_isSplitSSID = a3;
}

- (BOOL)hasCandidates
{
  return self->_hasCandidates;
}

- (void)setHasCandidates:(BOOL)a3
{
  self->_hasCandidates = a3;
}

- (BOOL)hasDifferentIpv4DetailsAfterSSIDTransition
{
  return self->_hasDifferentIpv4DetailsAfterSSIDTransition;
}

- (void)setHasDifferentIpv4DetailsAfterSSIDTransition:(BOOL)a3
{
  self->_hasDifferentIpv4DetailsAfterSSIDTransition = a3;
}

- (BOOL)hasDifferentIpv6DetailsAfterSSIDTransition
{
  return self->_hasDifferentIpv6DetailsAfterSSIDTransition;
}

- (void)setHasDifferentIpv6DetailsAfterSSIDTransition:(BOOL)a3
{
  self->_hasDifferentIpv6DetailsAfterSSIDTransition = a3;
}

- (BOOL)isRtCoexOptimal
{
  return self->_isRtCoexOptimal;
}

- (void)setIsRtCoexOptimal:(BOOL)a3
{
  self->_isRtCoexOptimal = a3;
}

- (NSDate)firstRtCoexOptimal
{
  return (NSDate *)objc_getProperty(self, a2, 11992LL, 1);
}

- (void)setFirstRtCoexOptimal:(id)a3
{
}

- (NSDate)lastRtCoexOptimalStatusChange
{
  return (NSDate *)objc_getProperty(self, a2, 12000LL, 1);
}

- (void)setLastRtCoexOptimalStatusChange:(id)a3
{
}

- (double)rtCoexInOptimalDuration
{
  return self->_rtCoexInOptimalDuration;
}

- (void)setRtCoexInOptimalDuration:(double)a3
{
  self->_double rtCoexInOptimalDuration = a3;
}

- (NSDate)lastEnterPreferredChannel
{
  return (NSDate *)objc_getProperty(self, a2, 12016LL, 1);
}

- (void)setLastEnterPreferredChannel:(id)a3
{
}

- (double)preferredChannelDuration
{
  return self->_preferredChannelDuration;
}

- (void)setPreferredChannelDuration:(double)a3
{
  self->_double preferredChannelDuration = a3;
}

- (NSDate)lastEnterPreferredBand
{
  return (NSDate *)objc_getProperty(self, a2, 12032LL, 1);
}

- (void)setLastEnterPreferredBand:(id)a3
{
}

- (double)preferredBandDuration
{
  return self->_preferredBandDuration;
}

- (void)setPreferredBandDuration:(double)a3
{
  self->_double preferredBandDuration = a3;
}

- (NSDate)firstSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12048LL, 1);
}

- (void)setFirstSSIDTransition:(id)a3
{
}

- (NSDate)firstIPUpdateAfterSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12056LL, 1);
}

- (void)setFirstIPUpdateAfterSSIDTransition:(id)a3
{
}

- (NSDate)firstManualJoin
{
  return (NSDate *)objc_getProperty(self, a2, 12064LL, 1);
}

- (void)setFirstManualJoin:(id)a3
{
}

- (NSDate)firstManualJoinAfterSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12072LL, 1);
}

- (void)setFirstManualJoinAfterSSIDTransition:(id)a3
{
}

- (unint64_t)requestSteerToPreferredChannelCount
{
  return self->_requestSteerToPreferredChannelCount;
}

- (void)setRequestSteerToPreferredChannelCount:(unint64_t)a3
{
  self->_requestSteerToPreferredChannelCount = a3;
}

- (unint64_t)requestSteerCount
{
  return self->_requestSteerCount;
}

- (void)setRequestSteerCount:(unint64_t)a3
{
  self->_requestSteerCount = a3;
}

- (unint64_t)requestDisconnectCount
{
  return self->_requestDisconnectCount;
}

- (void)setRequestDisconnectCount:(unint64_t)a3
{
  self->_requestDisconnectCount = a3;
}

- (void).cxx_destruct
{
}

@end