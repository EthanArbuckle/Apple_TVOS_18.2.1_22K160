@interface WiFiUsageNetworkSession
- (BOOL)isSessionHarvestable;
- (WiFiUsageNetworkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)displayStateDidChange:(BOOL)a3;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)processForgetNetwork:(id)a3;
- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6;
- (void)sessionDidEnd;
- (void)sessionDidStart;
@end

@implementation WiFiUsageNetworkSession

- (WiFiUsageNetworkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkSession;
  v4 = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v15,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  3LL,  a3,  a4);
  lastNetworkDetails = v4->_lastNetworkDetails;
  v4->_lastNetworkDetails = 0LL;

  v4->_linkUp = 0;
  v4->_networkUsageDuration = 0.0;
  v4->_dnuEnabled = 1;
  if (_os_feature_enabled_impl())
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.WiFiLinkState-Biome-Event", v6);
    WiFiLinkStateBiomeEventQueue = v4->_WiFiLinkStateBiomeEventQueue;
    v4->_WiFiLinkStateBiomeEventQueue = (OS_dispatch_queue *)v7;
  }

  else
  {
    v9 = v4->_WiFiLinkStateBiomeEventQueue;
    v4->_WiFiLinkStateBiomeEventQueue = 0LL;

    NSLog( @"%s: Do Not allocate _WiFiLinkStateBiomeEventQueue as WiFiDirectDonation Feature Flag Disabled!",  "-[WiFiUsageNetworkSession initWithInterfaceName:andCapabilities:]");
  }

  uint64_t v10 = [MEMORY[0x189603FE0] set];
  neighborBssList = v4->_neighborBssList;
  v4->_neighborBssList = (NSMutableSet *)v10;

  uint64_t v12 = [MEMORY[0x189603FE0] set];
  otherBssList = v4->_otherBssList;
  v4->_otherBssList = (NSMutableSet *)v12;

  return v4;
}

- (void)displayStateDidChange:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkSession;
  -[WiFiUsageSession displayStateDidChange:](&v5, sel_displayStateDidChange_);
  if (!a3 && !-[WiFiUsageSession poweredOn](self, "poweredOn"))
  {
    if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
    {
      NSLog(@"%s: network session ended", "-[WiFiUsageNetworkSession displayStateDidChange:]");
      -[WiFiUsageNetworkSession sessionDidEnd](self, "sessionDidEnd");
    }
  }

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkSession;
  -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]( &v24,  sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_,  v12,  a4,  a5,  a6,  v13);
  lastNetworkDetails = self->_lastNetworkDetails;
  if (v12) {
    BOOL v15 = lastNetworkDetails == 0LL;
  }
  else {
    BOOL v15 = 0;
  }
  int v16 = v15;
  if (v15)
  {
    BOOL v17 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
    lastNetworkDetails = self->_lastNetworkDetails;
    if (!lastNetworkDetails)
    {
      if (!v17) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }

- (void)processForgetNetwork:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    if (v4)
    {
      [v4 networkName];
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        WiFiLinkStateBiomeEventQueue = (dispatch_queue_s *)self->_WiFiLinkStateBiomeEventQueue;
        if (WiFiLinkStateBiomeEventQueue)
        {
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke;
          block[3] = &unk_18A16C770;
          id v8 = v4;
          dispatch_async(WiFiLinkStateBiomeEventQueue, block);
        }

        else
        {
          NSLog( @"%s: _WiFiLinkStateBiomeEventQueue NUll!",  "-[WiFiUsageNetworkSession processForgetNetwork:]");
        }
      }

      else
      {
        NSLog(@"%s: networkName NUll!", "-[WiFiUsageNetworkSession processForgetNetwork:]");
      }
    }

    else
    {
      NSLog(@"%s: WiFiUsageNetworkDetails NUll!", "-[WiFiUsageNetworkSession processForgetNetwork:]");
    }
  }

  else
  {
    NSLog( @"%s: Do Nothing as WiFiDirectDonation Feature Flag Disabled!",  "-[WiFiUsageNetworkSession processForgetNetwork:]");
  }
}

void __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __softlink__BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 Device];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 Wireless];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 WiFi];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v5 pruner];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke_18;
      v8[3] = &unk_18A16DB38;
      id v9 = *(id *)(a1 + 32);
      [v6 deleteEventsPassingTest:v8];
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) networkName];
      dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v11 = "-[WiFiUsageNetworkSession processForgetNetwork:]_block_invoke";
      __int16 v12 = 2160;
      uint64_t v13 = 1752392040LL;
      __int16 v14 = 2112;
      BOOL v15 = v7;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: BMPruner NUll - SSID:%{mask.hash}@ ",  buf,  0x20u);
    }

    goto LABEL_8;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) networkName];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v11 = "-[WiFiUsageNetworkSession processForgetNetwork:]_block_invoke";
    __int16 v12 = 2160;
    uint64_t v13 = 1752392040LL;
    __int16 v14 = 2112;
    BOOL v15 = v6;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: BMStream NUll - SSID:%{mask.hash}@ ",  buf,  0x20u);
LABEL_8:
  }
}

uint64_t __48__WiFiUsageNetworkSession_processForgetNetwork___block_invoke_18(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) networkName];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 SSID];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v36 = a4;
  BOOL v8 = a3;
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v10 = a7;
  [MEMORY[0x189603F50] date];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL linkUp = self->_linkUp;
  BOOL v13 = !self->_linkUp && v8;
  BOOL v14 = !v8;
  if (!self->_linkUp) {
    BOOL v14 = 0;
  }
  v38 = v11;
  BOOL v35 = v14;
  if (v13)
  {
    objc_storeStrong((id *)&self->_lastLinkUpTime, v11);
    self->_BOOL linkUp = 1;
    [v10 networkName];
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageNetworkDetails networkName](self->_lastNetworkDetails, "networkName");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v15 isEqualToString:v16])
    {
      -[NSDate timeIntervalSinceDate:](self->_lastLinkUpTime, "timeIntervalSinceDate:", self->_lastLinkDownTime);
      double v18 = v17;

      if (v18 < (double)0x14uLL)
      {
        BOOL v19 = 0;
        int v20 = !-[WiFiUsageSession isSessionActive](self, "isSessionActive");
        goto LABEL_17;
      }
    }

    else
    {
    }
    v22 = -[WiFiUsageNetworkDetails networkName](self->_lastNetworkDetails, "networkName");
    uint64_t v23 = [v22 length];

    BOOL v19 = v23 != 0;
    [v10 networkName];
    objc_super v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 length];

    if (v25)
    {
      v26 = (WiFiUsageNetworkDetails *)[v10 copy];
      lastNetworkDetails = self->_lastNetworkDetails;
      self->_lastNetworkDetails = v26;
    }
  }

  else if (v14)
  {
    objc_storeStrong((id *)&self->_lastLinkDownTime, v11);
    -[NSDate timeIntervalSinceDate:](self->_lastLinkDownTime, "timeIntervalSinceDate:", self->_lastLinkUpTime);
    BOOL v19 = 0;
    self->_networkUsageDuration = v21 + self->_networkUsageDuration;
    self->_BOOL linkUp = 0;
  }

  else
  {
    BOOL v19 = 0;
  }

  int v20 = 1;
LABEL_17:
  if (!_os_feature_enabled_impl())
  {
    int64_t v29 = a5;
    BOOL v30 = v36;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315907;
    v44 = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
    __int16 v45 = 2113;
    id v46 = v10;
    __int16 v47 = 1024;
    BOOL v48 = v13;
    __int16 v49 = 1024;
    BOOL v50 = v35;
    v31 = (os_log_s *)MEMORY[0x1895F8DA0];
    v32 = "%s: Do Nothing as WiFiDirectDonation Feature Flag Disabled! details:%{private}@ linkWentUp:%d linkWentDown:%d ";
    goto LABEL_27;
  }

  if (!v10 || linkUp == v8)
  {
    int64_t v29 = a5;
    BOOL v30 = v36;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315907;
    v44 = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
    __int16 v45 = 2113;
    id v46 = v10;
    __int16 v47 = 1024;
    BOOL v48 = v13;
    __int16 v49 = 1024;
    BOOL v50 = v35;
    v31 = (os_log_s *)MEMORY[0x1895F8DA0];
    v32 = "%s: InValid inputs details:%{private}@ linkWentUp:%d linkWentDown:%d";
LABEL_27:
    _os_log_impl(&dword_187EBF000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0x22u);
LABEL_28:
    if (!v19) {
      goto LABEL_35;
    }
    goto LABEL_29;
  }

  WiFiLinkStateBiomeEventQueue = (dispatch_queue_s *)self->_WiFiLinkStateBiomeEventQueue;
  int64_t v29 = a5;
  BOOL v30 = v36;
  if (!WiFiLinkStateBiomeEventQueue)
  {
    NSLog( @"%s: _WiFiLinkStateBiomeEventQueue NUll!",  "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    if (!v19) {
      goto LABEL_35;
    }
LABEL_29:
    if (-[WiFiUsageSession isAssociated](self, "isAssociated"))
    {
      v33 = self->_lastNetworkDetails;
      if (v33)
      {
        v34 = (void *)-[WiFiUsageNetworkDetails copy](v33, "copy");
        -[WiFiUsageSession setNetworkDetailsAtEnd:](self, "setNetworkDetailsAtEnd:", v34);
      }
    }

    v39.receiver = self;
    v39.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkSession;
    -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]( &v39,  sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_,  v8,  v30,  v29,  a6,  v10);
    NSLog( @"%s: network session ended",  "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    -[WiFiUsageNetworkSession sessionDidEnd](self, "sessionDidEnd");
    if (v20) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __116__WiFiUsageNetworkSession_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails___block_invoke;
  block[3] = &unk_18A16CC08;
  id v41 = v10;
  BOOL v42 = v13;
  dispatch_async(WiFiLinkStateBiomeEventQueue, block);

  if (v19) {
    goto LABEL_29;
  }
LABEL_35:
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkSession;
  -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]( &v39,  sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_,  v8,  v30,  v29,  a6,  v10);
  if (v20)
  {
LABEL_36:
    NSLog( @"%s: network session started",  "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
    -[WiFiUsageNetworkSession sessionDidStart](self, "sessionDidStart");
  }

void __116__WiFiUsageNetworkSession_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails___block_invoke( uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v20 = 0LL;
  double v21 = &v20;
  uint64_t v22 = 0x2050000000LL;
  v2 = (void *)getBMDeviceWiFiClass_softClass;
  uint64_t v23 = getBMDeviceWiFiClass_softClass;
  if (!getBMDeviceWiFiClass_softClass)
  {
    *(void *)buf = MEMORY[0x1895F87A8];
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __getBMDeviceWiFiClass_block_invoke;
    uint64_t v25 = &unk_18A16DB60;
    v26 = &v20;
    __getBMDeviceWiFiClass_block_invoke((uint64_t)buf);
    v2 = (void *)v21[3];
  }

  v3 = v2;
  _Block_object_dispose(&v20, 8);
  id v4 = objc_alloc(v3);
  objc_msgSend(*(id *)(a1 + 32), "networkName", v20);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v7 = (void *)[v4 initWithSSID:v5 starting:v6];

  if (v7)
  {
    __softlink__BiomeLibrary();
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 Device];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 Wireless];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 WiFi];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      [v11 source];
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v13 = v12;
      if (v12)
      {
        [v12 sendEvent:v7];
      }

      else
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(a1 + 32) networkName];
          double v18 = (void *)objc_claimAutoreleasedReturnValue();
          int v19 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSub"
                               "reason:withNetworkDetails:]_block_invoke";
          *(_WORD *)&buf[12] = 2160;
          *(void *)&buf[14] = 1752392040LL;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v25 = v18;
          LOWORD(v26) = 1024;
          *(_DWORD *)((char *)&v26 + 2) = v19;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: BMSource NUll - SSID:%{mask.hash}@ linkstate:%d ",  buf,  0x26u);
        }
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) networkName];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreas"
                           "on:withNetworkDetails:]_block_invoke";
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040LL;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v25 = v16;
      LOWORD(v26) = 1024;
      *(_DWORD *)((char *)&v26 + 2) = v17;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: BMStream NUll - SSID:%{mask.hash}@ linkstate:%d ",  buf,  0x26u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) networkName];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[WiFiUsageNetworkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason"
                         ":withNetworkDetails:]_block_invoke";
    *(_WORD *)&buf[12] = 2160;
    *(void *)&buf[14] = 1752392040LL;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v25 = v14;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = v15;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: BMDeviceWiFi Allocation failed SSID:%{mask.hash}@ linkstate:%d ",  buf,  0x26u);
  }
}

- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkSession;
  -[WiFiUsageSession scanningStateDidChange:client:neighborBSS:otherBSS:]( &v16,  sel_scanningStateDidChange_client_neighborBSS_otherBSS_,  v8,  a4,  v10,  v11);
  if (self->_linkUp)
  {
    if (v10)
    {
      neighborBssList = self->_neighborBssList;
      [v10 allObjects];
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](neighborBssList, "addObjectsFromArray:", v13);
    }

    if (v11)
    {
      otherBssList = self->_otherBssList;
      [v11 allObjects];
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](otherBssList, "addObjectsFromArray:", v15);
    }
  }
}

- (void)sessionDidStart
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkSession;
  -[WiFiUsageSession sessionDidStart](&v3, sel_sessionDidStart);
  self->_networkUsageDuration = 0.0;
  -[NSMutableSet removeAllObjects](self->_neighborBssList, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_otherBssList, "removeAllObjects");
}

- (void)sessionDidEnd
{
  if (self->_networkUsageDuration != 0.0)
  {
    -[WiFiUsageSession setSessionDuration:](self, "setSessionDuration:");
    -[WiFiUsageSession setSessionStartTime:](self, "setSessionStartTime:", 0LL);
  }

  -[WiFiUsageSession setNeighborBssCount:]( self,  "setNeighborBssCount:",  -[NSMutableSet count](self->_neighborBssList, "count"));
  -[WiFiUsageSession setOtherBssCount:](self, "setOtherBssCount:", -[NSMutableSet count](self->_otherBssList, "count"));
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkSession;
  -[WiFiUsageSession sessionDidEnd](&v5, sel_sessionDidEnd);
  if (-[WiFiUsageNetworkSession isSessionHarvestable](self, "isSessionHarvestable"))
  {
    objc_super v3 = -[WiFiUsageConnectionQualityRecord initWithUsageSession:andNeighborBssList:andOtherBssList:]( objc_alloc(&OBJC_CLASS___WiFiUsageConnectionQualityRecord),  "initWithUsageSession:andNeighborBssList:andOtherBssList:",  self,  self->_neighborBssList,  self->_otherBssList);
    id v4 = v3;
    if (v3) {
      -[WiFiUsageConnectionQualityRecord queryNetworkPerformanceFeedAndSubmitToGeoWiFi]( v3,  "queryNetworkPerformanceFeedAndSubmitToGeoWiFi");
    }
  }

- (BOOL)isSessionHarvestable
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WiFiUsageSession privacyRestrictionDisabled](self, "privacyRestrictionDisabled")) {
    goto LABEL_16;
  }
  if (!self->_dnuEnabled || v3 == 0LL) {
    goto LABEL_25;
  }
  if ([v3 isHidden])
  {
    NSLog(@"%s: hidden network. Not harvesting.", "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }

  if ([v3 isHome])
  {
    NSLog(@"%s: home network. Not harvesting.", "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }

  if ([v3 hasNoMap])
  {
    NSLog(@"%s: private network. Not harvesting.", "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }

  if ([v3 isPersonalHotspot])
  {
    NSLog(@"%s: personal hotspot. Not harvesting.", "-[WiFiUsageNetworkSession isSessionHarvestable]");
    goto LABEL_25;
  }

  [v3 connectedBss];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 networkAccessCode] != 2)
  {
    [v3 connectedBss];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 networkAccessCode];

    if (v7 == 3) {
      goto LABEL_16;
    }
    if ([v3 usageRank] <= 3)
    {
      NSLog(@"%s: top network. Not harvesting.", "-[WiFiUsageNetworkSession isSessionHarvestable]");
    }

    else
    {
      -[WiFiUsageSession sessionDuration](self, "sessionDuration");
      if (v8 <= 60.0)
      {
        NSLog(@"%s: short data session. Not harvesting.", "-[WiFiUsageNetworkSession isSessionHarvestable]");
      }

      else
      {
        if (+[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "canPerformActionWithSampleRate:",  0LL))
        {
          goto LABEL_16;
        }

        NSLog(@"%s: loss coin toss. Not harvesting.", "-[WiFiUsageNetworkSession isSessionHarvestable]");
      }
    }

- (id)metricName
{
  return @"com.apple.wifi.linksession";
}

- (void).cxx_destruct
{
}

@end