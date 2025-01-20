@interface WiFiTelephonyClient
+ (id)sharedInstance;
- (BOOL)isCellular5GActive;
- (BOOL)isCellular5GSupported;
- (BOOL)isCellularDataInRoaming;
- (BOOL)isCellularFallbackEnabled;
- (BOOL)isCellularLTEActive;
- (BOOL)isIMSRegistrationActiveAndOnWiFi;
- (CTDataConnectionStatus)connectionStatus;
- (CTDataStatus)dataStatus;
- (CTMobileEquipmentInfo)mobileEquipmentInfo;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSString)carrierName;
- (NSString)cellularDataIndicator;
- (NSString)cellularICCID;
- (NSString)cellularInterfaceName;
- (NSString)description;
- (NSString)radioAccessTechnology;
- (NSString)registrationStatus;
- (OS_dispatch_queue)internalQueue;
- (WiFiTelephonyClient)init;
- (id)_dataIndicatorToString:(int)a3;
- (id)_getCurrentDataServiceContext;
- (id)cellularDataStatusChangedHandler;
- (id)cellularFallbackStatusChangedHandler;
- (id)imsRegistrationStatusChangedHandler;
- (void)_getCurrentDataServiceContext;
- (void)_updateCellularMEIAndDataStatus;
- (void)carrierBundleChange:(id)a3;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)imsRegistrationChanged:(id)a3 info:(id)a4;
- (void)reliableNetworkFallbackChanged:(BOOL)a3 userEnabled:(BOOL)a4;
- (void)setCarrierName:(id)a3;
- (void)setCellular5GSupported:(BOOL)a3;
- (void)setCellularDataStatusChangedHandler:(id)a3;
- (void)setCellularFallbackEnabled:(BOOL)a3;
- (void)setCellularFallbackStatusChangedHandler:(id)a3;
- (void)setConnectionStatus:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setDataStatus:(id)a3;
- (void)setImsRegistrationActiveAndOnWiFi:(BOOL)a3;
- (void)setImsRegistrationStatusChangedHandler:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setMobileEquipmentInfo:(id)a3;
- (void)setRadioAccessTechnology:(id)a3;
- (void)setRegistrationStatus:(id)a3;
@end

@implementation WiFiTelephonyClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  }
  return (id)sharedInstance_sharedClient;
}

void __37__WiFiTelephonyClient_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___WiFiTelephonyClient);
  v1 = (void *)sharedInstance_sharedClient;
  sharedInstance_sharedClient = (uint64_t)v0;
}

- (WiFiTelephonyClient)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WiFiTelephonyClient;
  v2 = -[WiFiTelephonyClient init](&v13, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.wifi.telephony-client", v3);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v4;

  uint64_t v6 = [objc_alloc(MEMORY[0x1896057C0]) initWithQueue:v2->_internalQueue];
  coreTelephonyClient = v2->_coreTelephonyClient;
  v2->_coreTelephonyClient = (CoreTelephonyClient *)v6;

  -[CoreTelephonyClient setDelegate:](v2->_coreTelephonyClient, "setDelegate:", v2);
  v8 = (dispatch_queue_s *)v2->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__WiFiTelephonyClient_init__block_invoke;
  block[3] = &unk_18A16C770;
  v9 = v2;
  v12 = v9;
  dispatch_async(v8, block);

  return v9;
}

void __27__WiFiTelephonyClient_init__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) cellularDataStatusChangedHandler];
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();
  }

- (id)_getCurrentDataServiceContext
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v3 = -[WiFiTelephonyClient coreTelephonyClient](self, "coreTelephonyClient");
  if (v3)
  {
    -[WiFiTelephonyClient coreTelephonyClient](self, "coreTelephonyClient");
    dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = 0LL;
    [v4 getSubscriptionInfoWithError:&v31];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v31;
    [v5 subscriptions];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WiFiTelephonyClient coreTelephonyClient](self, "coreTelephonyClient");
    id v30 = v6;
    [v8 getCurrentDataSubscriptionContextSync:&v30];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v30;

    if (!v9)
    {
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v11 = v7;
      id v9 = (id)[v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v9)
      {
        uint64_t v12 = *(void *)v27;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v11);
            }
            v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
            objc_msgSend(v14, "userDataPreferred", (void)v26);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            int v16 = [v15 intValue];

            if (v16)
            {
              id v9 = v14;
              goto LABEL_16;
            }
          }

          id v9 = (id)[v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

- (void)_updateCellularMEIAndDataStatus
{
}

void __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) internalQueue];
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke_2;
  v7[3] = &unk_18A16C748;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) setImsRegistrationActiveAndOnWiFi:v2];
}

- (void)reliableNetworkFallbackChanged:(BOOL)a3 userEnabled:(BOOL)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __66__WiFiTelephonyClient_reliableNetworkFallbackChanged_userEnabled___block_invoke;
  v7[3] = &unk_18A16CC08;
  void v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

void __66__WiFiTelephonyClient_reliableNetworkFallbackChanged_userEnabled___block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) cellularFallbackStatusChangedHandler];
    id v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();
  }

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
  id v5 = a4;
  -[WiFiTelephonyClient internalQueue](self, "internalQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __51__WiFiTelephonyClient_imsRegistrationChanged_info___block_invoke;
  v8[3] = &unk_18A16C748;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __51__WiFiTelephonyClient_imsRegistrationChanged_info___block_invoke(uint64_t a1)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    [*(id *)(a1 + 40) imsRegistrationStatusChangedHandler];
    uint64_t v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
  }

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __82__WiFiTelephonyClient_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke;
  block[3] = &unk_18A16C770;
  void block[4] = self;
  dispatch_async(v6, block);
}

void __82__WiFiTelephonyClient_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke( uint64_t a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) cellularDataStatusChangedHandler];
    id v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();
  }

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__WiFiTelephonyClient_displayStatusChanged_status___block_invoke;
  block[3] = &unk_18A16C770;
  void block[4] = self;
  dispatch_async(v5, block);
}

void __51__WiFiTelephonyClient_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) cellularDataStatusChangedHandler];
    id v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();
  }

- (void)carrierBundleChange:(id)a3
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__WiFiTelephonyClient_carrierBundleChange___block_invoke;
  block[3] = &unk_18A16C770;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __43__WiFiTelephonyClient_carrierBundleChange___block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) cellularDataStatusChangedHandler];
    id v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();
  }

- (id)_dataIndicatorToString:(int)a3
{
  else {
    return off_18A16E3A8[a3];
  }
}

- (BOOL)isCellular5GActive
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 indicator];

  return 0;
}

- (BOOL)isCellularLTEActive
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 indicator] > 6;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)isCellularDataInRoaming
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:*MEMORY[0x1896057D0]];

  return v3;
}

- (NSString)cellularICCID
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 ICCID];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)cellularInterfaceName
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 interfaceName];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)cellularDataIndicator
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiTelephonyClient _dataIndicatorToString:](self, "_dataIndicatorToString:", [v3 indicator]);
  BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = @"undefined";
  }
  id v6 = v5;

  return v6;
}

- (NSString)description
{
  char v3 = (void *)MEMORY[0x189607940];
  BOOL v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@:%p ", v5, self];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiTelephonyClient cellularDataIndicator](self, "cellularDataIndicator");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"Indicator:%@ ", v7];

  -[WiFiTelephonyClient radioAccessTechnology](self, "radioAccessTechnology");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"RAT:%@ ", v8];

  -[WiFiTelephonyClient registrationStatus](self, "registrationStatus");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"Reg:%@ ", v9];

  -[WiFiTelephonyClient cellularInterfaceName](self, "cellularInterfaceName");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"IfName:%@ ", v10];

  -[WiFiTelephonyClient carrierName](self, "carrierName");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"Carrier:%@ ", v11];

  if (-[WiFiTelephonyClient isCellular5GSupported](self, "isCellular5GSupported")) {
    uint64_t v12 = @"Y";
  }
  else {
    uint64_t v12 = @"N";
  }
  [v6 appendFormat:@"5GSupported:%@ ", v12];
  if (-[WiFiTelephonyClient isCellularFallbackEnabled](self, "isCellularFallbackEnabled")) {
    objc_super v13 = @"Y";
  }
  else {
    objc_super v13 = @"N";
  }
  [v6 appendFormat:@"RNFEnabled:%@ ", v13];
  if (-[WiFiTelephonyClient isIMSRegistrationActiveAndOnWiFi](self, "isIMSRegistrationActiveAndOnWiFi")) {
    v14 = @"Y";
  }
  else {
    v14 = @"N";
  }
  [v6 appendFormat:@"IMSOnWiFi:%@", v14];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (id)cellularFallbackStatusChangedHandler
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCellularFallbackStatusChangedHandler:(id)a3
{
}

- (id)imsRegistrationStatusChangedHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setImsRegistrationStatusChangedHandler:(id)a3
{
}

- (id)cellularDataStatusChangedHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCellularDataStatusChangedHandler:(id)a3
{
}

- (BOOL)isCellularFallbackEnabled
{
  return self->_cellularFallbackEnabled;
}

- (BOOL)isIMSRegistrationActiveAndOnWiFi
{
  return self->_imsRegistrationActiveAndOnWiFi;
}

- (BOOL)isCellular5GSupported
{
  return self->_cellular5GSupported;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (CTMobileEquipmentInfo)mobileEquipmentInfo
{
  return (CTMobileEquipmentInfo *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMobileEquipmentInfo:(id)a3
{
}

- (CTDataStatus)dataStatus
{
  return (CTDataStatus *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDataStatus:(id)a3
{
}

- (CTDataConnectionStatus)connectionStatus
{
  return (CTDataConnectionStatus *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setConnectionStatus:(id)a3
{
}

- (NSString)radioAccessTechnology
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setRadioAccessTechnology:(id)a3
{
}

- (NSString)registrationStatus
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setRegistrationStatus:(id)a3
{
}

- (NSString)carrierName
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCarrierName:(id)a3
{
}

- (void)setCellular5GSupported:(BOOL)a3
{
  self->_cellular5GSupported = a3;
}

- (void)setCellularFallbackEnabled:(BOOL)a3
{
  self->_cellularFallbackEnabled = a3;
}

- (void)setImsRegistrationActiveAndOnWiFi:(BOOL)a3
{
  self->_imsRegistrationActiveAndOnWiFi = a3;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)_getCurrentDataServiceContext
{
}

@end