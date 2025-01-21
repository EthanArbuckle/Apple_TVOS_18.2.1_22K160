@interface WiFiBatteryManager
- (BOOL)configureWiFiClientAndRegisterWithBatteryModule:(BOOL)a3 :(__WiFiManager *)a4 :(id)a5 :(id)a6;
- (BOOL)cpmsActive;
- (BOOL)cpmsContPowerSupport;
- (BOOL)isPowerResourceAvailable:(unint64_t)a3;
- (BOOL)setupDevice:(void *)deviceManager;
- (NSDate)asyncPPMBudgetTimestamp;
- (NSDictionary)dutyCycleToPowerTable100ms;
- (NSDictionary)powerToDutyCycleTable100ms;
- (NSDictionary)wifiDevicePowerLevels100ms;
- (NSMutableArray)pendingRequests;
- (NSMutableDictionary)cachedBudget;
- (WiFiBatteryManager)initWithContext:(void *)a3;
- (float)ratioDutyPower;
- (id)WiFiBatteryManagerPopulatePowerTable;
- (id)WiFiBatteryManagerPpmAdmissionResultHandler;
- (id)WiFiBatteryManagerPpmAsyncNotificationHandler;
- (id)cpmsAsyncNotificationCallback;
- (id)getDutyCycleForPowerNumber:(unint64_t)a3;
- (id)getPowerNumberForDutyCycle:(int)a3;
- (int)admissionCheck;
- (int)requestPowerResource:(unint64_t)a3 withDetails:(void *)a4;
- (int64_t)wifiCPMSHandle;
- (unint64_t)WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:(id)a3;
- (unint64_t)availableResource;
- (unint64_t)claimedResource;
- (unint64_t)dutyMin;
- (unint64_t)getClosestAllowedLowerPowerNumber:(unint64_t)a3;
- (unint64_t)minBatteryIndex;
- (unint64_t)pMax;
- (unint64_t)pMin;
- (unint64_t)pUnconstrained;
- (void)WiFiBatteryManagerCpmsCallbackConfiguration:(__WiFiManager *)a3;
- (void)WiFiBatteryManagerHandlePowerAdmissionResponse:(unint64_t)a3;
- (void)WiFiBatteryManagerPpmCallbackConfiguration:(__WiFiManager *)a3;
- (void)WiFiDeviceManagerHandleInterfaceAvailability:(unint64_t)a3;
- (void)WiFiDeviceManagerHandlePowerBudgetChange:(unint64_t)a3;
- (void)WiFiDeviceManagerHandlePowerUnchangedPowerBudget:(unint64_t)a3 :(id *)a4;
- (void)dealloc;
- (void)releasePowerResources;
- (void)resetDevice;
- (void)setAsyncPPMBudgetTimestamp:(id)a3;
- (void)setAvailableResource:(unint64_t)a3;
- (void)setCachedBudget:(id)a3;
- (void)setClaimedResource:(unint64_t)a3;
- (void)setCpmsActive:(BOOL)a3;
- (void)setCpmsAsyncNotificationCallback:(id)a3;
- (void)setCpmsContPowerSupport:(BOOL)a3;
- (void)setDutyCycleToPowerTable100ms:(id)a3;
- (void)setDutyMin:(unint64_t)a3;
- (void)setMinBatteryIndex:(unint64_t)a3;
- (void)setPMax:(unint64_t)a3;
- (void)setPMin:(unint64_t)a3;
- (void)setPUnconstrained:(unint64_t)a3;
- (void)setPendingRequests:(id)a3;
- (void)setPowerToDutyCycleTable100ms:(id)a3;
- (void)setRatioDutyPower:(float)a3;
- (void)setWiFiBatteryManagerPpmAdmissionResultHandler:(id)a3;
- (void)setWiFiBatteryManagerPpmAsyncNotificationHandler:(id)a3;
- (void)setWifiCPMSHandle:(int64_t)a3;
- (void)setWifiDevicePowerLevels100ms:(id)a3;
@end

@implementation WiFiBatteryManager

- (WiFiBatteryManager)initWithContext:(void *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___WiFiBatteryManager;
  v4 = -[WiFiBatteryManager init](&v31, "init");
  v5 = v4;
  if (!v4)
  {
    v25 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : unable to super initialize WiFiBatteryManagerClient.",  "-[WiFiBatteryManager initWithContext:]");
    }
    goto LABEL_23;
  }

  v4->_manager = (__WiFiManager *)a3;
  if (!a3)
  {
    v25 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : null wifi manager ref!?.",  "-[WiFiBatteryManager initWithContext:]");
    }
    goto LABEL_23;
  }

  *(_WORD *)&v4->_wifiClientRegistered = 0;
  uint64_t v6 = [NSDate dateWithTimeIntervalSince1970:0.0];
  asyncPPMBudgetTimestamp = v5->_asyncPPMBudgetTimestamp;
  v5->_asyncPPMBudgetTimestamp = (NSDate *)v6;

  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  cachedBudget = v5->_cachedBudget;
  v5->_cachedBudget = v8;

  if (!objc_opt_class(&OBJC_CLASS___CPMSAgent))
  {
    -[WiFiBatteryManager setCpmsActive:](v5, "setCpmsActive:", 0LL);
    v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt :  Error! CPMS FWK does not exist! ",  "-[WiFiBatteryManager initWithContext:]");
    }
    objc_autoreleasePoolPop(v12);
    goto LABEL_17;
  }

  unsigned int v10 = +[CPMSAgent isCPMSSupported](&OBJC_CLASS___CPMSAgent, "isCPMSSupported");
  v5->_cpmsActive = v10;
  if (v10)
  {
    if (v5->_cpmsAgent)
    {
      v11 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"message:cpms agent exists "];
      }
      objc_autoreleasePoolPop(v11);
    }

    else
    {
      uint64_t v13 = [+[CPMSAgent sharedCPMSAgent](&OBJC_CLASS___CPMSAgent, "sharedCPMSAgent") autorelease];
      cpmsAgent = v5->_cpmsAgent;
      v5->_cpmsAgent = (CPMSAgentProtocol *)v13;

      if (!v5->_cpmsAgent)
      {
        v25 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt :  Error: couldn't get sharedCPMSAgent",  "-[WiFiBatteryManager initWithContext:]");
        }
        goto LABEL_23;
      }

      v5->_wifiCPMSHandle = 2LL;
    }

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___CPMSClientDescription);
    wifiClientDescriptionRef = v5->_wifiClientDescriptionRef;
    if (!v15)
    {
      v5->_wifiClientDescriptionRef = 0LL;

      v25 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt :  Error: cpms is active but [CPMSClientDescription class] fails!",  "-[WiFiBatteryManager initWithContext:]");
      }
      goto LABEL_23;
    }

    if (!wifiClientDescriptionRef)
    {
      v17 = objc_alloc_init(&OBJC_CLASS___CPMSClientDescription);
      v18 = v5->_wifiClientDescriptionRef;
      v5->_wifiClientDescriptionRef = v17;

      if (!v5->_wifiClientDescriptionRef)
      {
        v25 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt :  Error: unable to alloc and init CPMSClientDescription" message:3];
        }
        goto LABEL_23;
      }
    }

- (void)resetDevice
{
  self->_deviceManager = 0LL;
}

- (BOOL)setupDevice:(void *)deviceManager
{
  self->_deviceManager = (__WiFiDeviceManager *)deviceManager;
  if (!deviceManager)
  {
    uint64_t v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : null wifi device manager ref!?.",  "-[WiFiBatteryManager setupDevice:]");
    }
    goto LABEL_37;
  }

  if (!self->_wifiClientRegistered)
  {
    if (self->_cpmsActive)
    {
      uint64_t v4 = sub_10003BEDC((uint64_t)deviceManager);
      int v5 = sub_1000510DC(v4, (uint64_t)&self->_wifiChipPowerTable);
      if (self->_wifiChipPowerTable.dutyCycleTable[0] != 100
        || v5
        || self->_wifiChipPowerTable.powerTable[0] < self->_wifiChipPowerTable.powerTable[9])
      {
        uint64_t v6 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt :  Error! Failed to read power duty cyle table from driver. Using presets. ",  "-[WiFiBatteryManager setupDevice:]");
        }
        objc_autoreleasePoolPop(v6);
        *(_DWORD *)&self->_wifiChipPowerTable.dutyCycleTable[10] = 0;
        *(_OWORD *)&self->_wifiChipPowerTable.version = xmmword_10017F880;
        *(_OWORD *)&self->_wifiChipPowerTable.powerTable[6] = unk_10017F890;
        *(_OWORD *)&self->_wifiChipPowerTable.dutyCycleTable[2] = xmmword_10017F8A0;
      }

      self->_minBatteryIndex = self->_wifiChipPowerTable.dutyCycleTable[9];
      uint64_t v7 = sub_10003BEDC((uint64_t)self->_deviceManager);
      int v8 = sub_10005452C(v7);
      self->_cpmsContPowerSupport = v8 != 0;
      if (v8)
      {
        v9 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : Continous CPMS power budget issupported  ",  "-[WiFiBatteryManager setupDevice:]");
        }
        objc_autoreleasePoolPop(v9);
        unint64_t v10 = self->_wifiChipPowerTable.dutyCycleTable[9];
        self->_pUnconstrained = self->_wifiChipPowerTable.powerTable[0];
        self->_dutyMin = v10;
        unint64_t v11 = self->_wifiChipPowerTable.powerTable[1];
        unint64_t v12 = self->_wifiChipPowerTable.powerTable[9];
        self->_pMin = v12;
        self->_pMax = v11;
        if ((_DWORD)v11 != (_DWORD)v12) {
          self->_ratioDutyPower = (float)(self->_wifiChipPowerTable.dutyCycleTable[1] - v10) / (float)(v11 - v12);
        }
      }

      else
      {
        unint64_t v13 = self->_wifiChipPowerTable.powerTable[0];
        self->_pMin = self->_wifiChipPowerTable.powerTable[9];
        self->_pMax = v13;
      }

      for (uint64_t i = 0LL; i != 10; ++i)
      {
        uint64_t v15 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : Power : %d    Duty Cycle : %d",  "-[WiFiBatteryManager setupDevice:]",  self->_wifiChipPowerTable.powerTable[i],  self->_wifiChipPowerTable.dutyCycleTable[i]);
        }
        objc_autoreleasePoolPop(v15);
      }
    }

    if (-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::]( self,  "configureWiFiClientAndRegisterWithBatteryModule::::",  -[WiFiBatteryManager cpmsActive](self, "cpmsActive"),  self->_manager,  self->_wifiPpmClientRef,  self->_cpmsAgent))
    {
      self->_wifiClientRegistered = 1;
      deviceManager = self->_deviceManager;
      goto LABEL_22;
    }

    uint64_t v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt :  init done and got cpms/ppm handle But registering with battery module fails!?",  "-[WiFiBatteryManager setupDevice:]");
    }
LABEL_37:
    BOOL v20 = 0;
    goto LABEL_30;
  }

- (BOOL)configureWiFiClientAndRegisterWithBatteryModule:(BOOL)a3 :(__WiFiManager *)a4 :(id)a5 :(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  if (!self)
  {
    uint64_t v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt :  self unintialized.?",  "-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::]");
    }
    goto LABEL_12;
  }

  if (!v8)
  {
    -[WiFiBatteryManager WiFiBatteryManagerPpmCallbackConfiguration:]( self,  "WiFiBatteryManagerPpmCallbackConfiguration:",  a4);
    unsigned __int8 v16 = [v10 registerForNotificationsWithError:0 handler:self->_WiFiBatteryManagerPpmAsyncNotificationHandler];
    unsigned int v15 = 0;
    goto LABEL_6;
  }

  if (!self->_wifiClientDescriptionRef)
  {
    uint64_t v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt :  WiFiClient Configuration failed!" message:3];
    }
LABEL_12:
    objc_autoreleasePoolPop(v19);
    unsigned __int8 v16 = 0;
    BOOL v17 = 0;
LABEL_13:
    char v18 = v17 & v16;
    goto LABEL_14;
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CPMSClientDescription setIsContinuous:](self->_wifiClientDescriptionRef, "setIsContinuous:", 0LL);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100092A68;
  v22[3] = &unk_1001E4790;
  objc_copyWeak(&v23, &location);
  -[CPMSClientDescription setGetCurrentPower:](self->_wifiClientDescriptionRef, "setGetCurrentPower:", v22);
  -[CPMSClientDescription setPowerBudgetUpdateMinimumPeriod:]( self->_wifiClientDescriptionRef,  "setPowerBudgetUpdateMinimumPeriod:",  1000LL);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[WiFiBatteryManager WiFiBatteryManagerPopulatePowerTable]( self,  "WiFiBatteryManagerPopulatePowerTable"));
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v12));
  -[CPMSClientDescription setPowerLevels:](self->_wifiClientDescriptionRef, "setPowerLevels:", v13);

  -[CPMSClientDescription setClientId:]( self->_wifiClientDescriptionRef,  "setClientId:",  -[WiFiBatteryManager wifiCPMSHandle](self, "wifiCPMSHandle"));
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  -[WiFiBatteryManager WiFiBatteryManagerCpmsCallbackConfiguration:]( self,  "WiFiBatteryManagerCpmsCallbackConfiguration:",  a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager cpmsAsyncNotificationCallback](self, "cpmsAsyncNotificationCallback"));
  -[CPMSClientDescription setNotificationCallback:](self->_wifiClientDescriptionRef, "setNotificationCallback:", v14);

  unsigned int v15 = [v11 registerClientWithDescription:self->_wifiClientDescriptionRef error:0];
  unsigned __int8 v16 = 0;
LABEL_6:
  BOOL v17 = !v8;
  if ((v15 & 1) == 0 && (v16 & 1) == 0)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt :  Registration with CPMS/PPM failed!" message:3];
    }
    objc_autoreleasePoolPop(v21);
  }

  if ((v15 & v8 & 1) == 0) {
    goto LABEL_13;
  }
  char v18 = 1;
LABEL_14:

  return v18;
}

- (id)WiFiBatteryManagerPopulatePowerTable
{
  v3 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 10LL);
  if (v3)
  {
    uint64_t v4 = 35LL;
    do
    {
      int v5 = [NSNumber numberWithInt:*((unsigned __int16 *)&self->super.isa + v4)];
      -[NSMutableArray addObject:](v3, "addObject:", v5);

      unint64_t v6 = v4 - 25;
      --v4;
    }

    while (v6 > 1);
  }

  uint64_t v7 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 10LL);
  if (v7)
  {
    uint64_t v8 = 47LL;
    do
    {
      v9 = [NSNumber numberWithInt:*((unsigned __int16 *)&self->super.isa + v8)];
      -[NSMutableArray addObject:](v7, "addObject:", v9);

      unint64_t v10 = v8 - 37;
      --v8;
    }

    while (v10 > 1);
  }

  id v11 = +[NSDictionary dictionaryWithObjects:forKeys:v3,  v7];
  -[WiFiBatteryManager setDutyCycleToPowerTable100ms:](self, "setDutyCycleToPowerTable100ms:", v11);

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v7,  v3));
  -[WiFiBatteryManager setPowerToDutyCycleTable100ms:](self, "setPowerToDutyCycleTable100ms:", v12);

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v3,  kCPMSPowerTimeScale100ms));
  -[WiFiBatteryManager setWifiDevicePowerLevels100ms:](self, "setWifiDevicePowerLevels100ms:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager wifiDevicePowerLevels100ms](self, "wifiDevicePowerLevels100ms"));
  return v14;
}

- (void)WiFiBatteryManagerCpmsCallbackConfiguration:(__WiFiManager *)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100092CB0;
  v6[3] = &unk_1001E47E0;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = objc_retainBlock(v6);
  id cpmsAsyncNotificationCallback = self->_cpmsAsyncNotificationCallback;
  self->_id cpmsAsyncNotificationCallback = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)WiFiBatteryManagerPpmCallbackConfiguration:(__WiFiManager *)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000930E0;
  v10[3] = &unk_1001E47E0;
  objc_copyWeak(&v11, &location);
  uint64_t v4 = objc_retainBlock(v10);
  id WiFiBatteryManagerPpmAsyncNotificationHandler = self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
  self->_id WiFiBatteryManagerPpmAsyncNotificationHandler = v4;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100093434;
  v8[3] = &unk_1001E4830;
  objc_copyWeak(&v9, &location);
  unint64_t v6 = objc_retainBlock(v8);
  id WiFiBatteryManagerPpmAdmissionResultHandler = self->_WiFiBatteryManagerPpmAdmissionResultHandler;
  self->_id WiFiBatteryManagerPpmAdmissionResultHandler = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  id WiFiBatteryManagerPpmAsyncNotificationHandler = self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
  self->_id WiFiBatteryManagerPpmAsyncNotificationHandler = 0LL;

  id WiFiBatteryManagerPpmAdmissionResultHandler = self->_WiFiBatteryManagerPpmAdmissionResultHandler;
  self->_id WiFiBatteryManagerPpmAdmissionResultHandler = 0LL;

  id cpmsAsyncNotificationCallback = self->_cpmsAsyncNotificationCallback;
  self->_id cpmsAsyncNotificationCallback = 0LL;

  powerToDutyCycleTable100ms = self->_powerToDutyCycleTable100ms;
  self->_powerToDutyCycleTable100ms = 0LL;

  dutyCycleToPowerTable100ms = self->_dutyCycleToPowerTable100ms;
  self->_dutyCycleToPowerTable100ms = 0LL;

  wifiDevicePowerLevels100ms = self->_wifiDevicePowerLevels100ms;
  self->_wifiDevicePowerLevels100ms = 0LL;

  cachedBudget = self->_cachedBudget;
  self->_cachedBudget = 0LL;

  pendingRequests = self->_pendingRequests;
  self->_pendingRequests = 0LL;

  cpmsAgent = self->_cpmsAgent;
  self->_cpmsAgent = 0LL;

  wifiPpmClientRef = self->_wifiPpmClientRef;
  self->_wifiPpmClientRef = 0LL;

  wifiClientDescriptionRef = self->_wifiClientDescriptionRef;
  self->_wifiClientDescriptionRef = 0LL;

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___WiFiBatteryManager;
  -[WiFiBatteryManager dealloc](&v14, "dealloc");
}

- (void)WiFiBatteryManagerHandlePowerAdmissionResponse:(unint64_t)a3
{
  if (!self)
  {
    BOOL v20 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt :  Self uninitialized." message:3];
    }
    goto LABEL_27;
  }

  if (-[WiFiBatteryManager availableResource](self, "availableResource") != a3)
  {
    unint64_t v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"message:3: %s: WiFiBatteryMgmt : Changed budget from battery module. Previous value :%lu and new value :%lu " message:@"-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]" message:[self availableResource] message:[self availableResource]];
    }
    objc_autoreleasePoolPop(v12);
    -[WiFiBatteryManager setAvailableResource:](self, "setAvailableResource:", a3);
    if (a3) {
      unint64_t v13 = -[WiFiBatteryManager availableResource](self, "availableResource");
    }
    else {
      unint64_t v13 = 0LL;
    }
    -[WiFiBatteryManager setClaimedResource:](self, "setClaimedResource:", v13);
    -[WiFiBatteryManager WiFiDeviceManagerHandleInterfaceAvailability:]( self,  "WiFiDeviceManagerHandleInterfaceAvailability:",  -[WiFiBatteryManager availableResource](self, "availableResource"));
    -[WiFiBatteryManager WiFiDeviceManagerHandlePowerBudgetChange:]( self,  "WiFiDeviceManagerHandlePowerBudgetChange:",  -[WiFiBatteryManager availableResource](self, "availableResource"));
    goto LABEL_15;
  }

  int v5 = -[WiFiBatteryManager pendingRequests](self, "pendingRequests");
  id v6 = [v5 count];

  if (!v6)
  {
    BOOL v20 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt : No Pending Admission Request" message:3];
    }
LABEL_27:
    objc_autoreleasePoolPop(v20);
    return;
  }

  id v7 = [self pendingRequests];
  id v21 = [v7 objectAtIndexedSubscript:0];

  if (v21)
  {
    id v8 = v21;
    id v9 = [v8 bytes];
    if (v9)
    {
      id v10 = v9;
      -[WiFiBatteryManager setClaimedResource:]( self,  "setClaimedResource:",  -[WiFiBatteryManager availableResource](self, "availableResource"));
      id v11 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : Claimed resource is %lu",  "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]",  -[WiFiBatteryManager claimedResource](self, "claimedResource"));
      }
      objc_autoreleasePoolPop(v11);
      -[WiFiBatteryManager WiFiDeviceManagerHandlePowerUnchangedPowerBudget::]( self,  "WiFiDeviceManagerHandlePowerUnchangedPowerBudget::",  -[WiFiBatteryManager availableResource](self, "availableResource"),  v10);

LABEL_15:
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
      id v15 = [v14 count];

      if (v15)
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
        [v16 removeLastObject];
      }

      BOOL v17 = [self pendingRequests];
      id v18 = [v17 count];

      if (v18) {
        -[WiFiBatteryManager admissionCheck](self, "admissionCheck");
      }
      return;
    }
  }

  uint64_t v19 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt : NULL Request" message:3];
  }
  objc_autoreleasePoolPop(v19);
}

- (BOOL)isPowerResourceAvailable:(unint64_t)a3
{
  if (self)
  {
    if (a3 > 1)
    {
      id v6 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: WiFiBatteryMgmt : unknown resource type %@", "-[WiFiBatteryManager isPowerResourceAvailable:]", @"Unknown" message];
      }
      objc_autoreleasePoolPop(v6);
      BOOL v5 = 0;
    }

    else
    {
      BOOL v5 = -[WiFiBatteryManager claimedResource](self, "claimedResource") != 0;
    }
  }

  else
  {
    BOOL v5 = 1;
  }

  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)qword_100219F60;
  if (qword_100219F60)
  {
    if (v5) {
      id v9 = "available";
    }
    else {
      id v9 = "unavailable";
    }
    id v10 = @"Unknown";
    if (a3 == 1) {
      id v10 = @"Hosted Network";
    }
    if (!a3) {
      id v10 = @"AutoJoin";
    }
    id v11 = v10;
    [v8 WFLog:3, "%s: WiFiBatteryMgmt : resource is %s for type %@. claimedResource is %lu", "-[WiFiBatteryManager isPowerResourceAvailable:]", v9, v11, -[WiFiBatteryManager claimedResource](self, "claimedResource") message];
  }

  objc_autoreleasePoolPop(v7);
  return v5;
}

- (int)requestPowerResource:(unint64_t)a3 withDetails:(void *)a4
{
  v19[0] = a3;
  v19[1] = a4;
  id v6 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v19, 16LL);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
    [v7 addObject:v6];

    id v8 = objc_autoreleasePoolPush();
    id v9 = (void *)qword_100219F60;
    if (qword_100219F60)
    {
      id v10 = @"Unknown";
      if (a3 == 1) {
        id v10 = @"Hosted Network";
      }
      if (!a3) {
        id v10 = @"AutoJoin";
      }
      id v11 = v10;
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager pendingRequests](self, "pendingRequests"));
      [v9 WFLog:3, "WiFiBatteryMgmt : %s: Power resource request for %@ added. Pending=%lu.", "-[WiFiBatteryManager requestPowerResource:withDetails:]", v11, [v12 count]];
    }

    objc_autoreleasePoolPop(v8);
    unint64_t v13 = (void *)[self pendingRequests];
    id v14 = [v13 count];

    if (v14 == (id)1)
    {
      int v15 = -[WiFiBatteryManager admissionCheck](self, "admissionCheck");
      if (v15)
      {
        unsigned __int8 v16 = (void *)[self pendingRequests];
        [v16 removeObjectAtIndex:0];
      }
    }

    else
    {
      int v15 = 0;
    }
  }

  else
  {
    BOOL v17 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : null dataRef.",  "-[WiFiBatteryManager requestPowerResource:withDetails:]");
    }
    objc_autoreleasePoolPop(v17);
    int v15 = -3901;
  }

  return v15;
}

- (int)admissionCheck
{
  v3 = -[WiFiBatteryManager pendingRequests];
  id v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [self pendingRequests];
    id v6 = [v5 objectAtIndexedSubscript:0];

    if (v6 && (id v6 = v6, (v7 = [v6 bytes]) != 0))
    {
      id v8 = v7;
      if (-[WiFiBatteryManager isPowerResourceAvailable:](self, "isPowerResourceAvailable:", *v7))
      {
        id v9 = objc_autoreleasePoolPush();
        if (qword_100219F60)
        {
          id v10 = @"Unknown";
          if (*v8 == 1LL) {
            id v10 = @"Hosted Network";
          }
          if (*v8) {
            id v11 = v10;
          }
          else {
            id v11 = @"AutoJoin";
          }
          [(id)qword_100219F60 WFLog:3, "%s: WiFiBatteryMgmt : resource is already known and available for %@ request type.", "-[WiFiBatteryManager admissionCheck]", v11 message];
        }

        objc_autoreleasePoolPop(v9);
        -[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]( self,  "WiFiBatteryManagerHandlePowerAdmissionResponse:",  -[WiFiBatteryManager availableResource](self, "availableResource"));
        goto LABEL_21;
      }

      if (-[WiFiBatteryManager cpmsActive](self, "cpmsActive"))
      {
        unint64_t v13 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : requesting resource %d",  "-[WiFiBatteryManager admissionCheck]",  -[WiFiBatteryManager cpmsActive](self, "cpmsActive"));
        }
        objc_autoreleasePoolPop(v13);
        uint64_t v24 = kCPMSPowerTimeScale100ms;
        id v14 = [self getPowerNumberForDutyCycle:100LL];
        v25 = v14;
        int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

        id v16 = -[CPMSAgentProtocol copyPowerBudgetForRequest:forClient:error:]( self->_cpmsAgent,  "copyPowerBudgetForRequest:forClient:error:",  v15,  self->_wifiCPMSHandle,  0LL);
        -[CPMSAgentProtocol acknowledgePowerBudget:forClientId:error:]( self->_cpmsAgent,  "acknowledgePowerBudget:forClientId:error:",  v16,  self->_wifiCPMSHandle,  0LL);
        unint64_t v17 = -[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]( self,  "WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:",  v16);
        id v18 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : WiFiBatteryMgmt Admission Handler being called properly! and minvalue is %lu",  "-[WiFiBatteryManager admissionCheck]",  v17);
        }
        objc_autoreleasePoolPop(v18);
        -[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]( self,  "WiFiBatteryManagerHandlePowerAdmissionResponse:",  v17);

        goto LABEL_21;
      }

      if ((-[PPMClient admissionCheckWithLevel:options:error:handler:]( self->_wifiPpmClientRef,  "admissionCheckWithLevel:options:error:handler:",  &off_100204710,  0LL,  0LL,  self->_WiFiBatteryManagerPpmAdmissionResultHandler) & 1) != 0)
      {
LABEL_21:
        int v12 = 0;
        goto LABEL_22;
      }

      BOOL v20 = objc_autoreleasePoolPush();
      if (qword_100219F60)
      {
        id v21 = @"Unknown";
        if (*v8 == 1LL) {
          id v21 = @"Hosted Network";
        }
        if (*v8) {
          v22 = v21;
        }
        else {
          v22 = @"AutoJoin";
        }
        [(id)qword_100219F60 WFLog:3, "%s: WiFiBatteryMgmt :  failed to perform admission check for resource type %@", "-[WiFiBatteryManager admissionCheck]", v22 message];
      }

      objc_autoreleasePoolPop(v20);
      int v12 = -3906;
    }

    else
    {
      int v12 = -3901;
    }
  }

  else
  {
    id v23 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"message: %s: WiFiBatteryMgmt :  No pending requests, exiting" message:@"-[WiFiBatteryManager admissionCheck]"];
    }
    objc_autoreleasePoolPop(v23);
    int v12 = 0;
    id v6 = 0LL;
  }

- (void)releasePowerResources
{
  v3 = [self getPowerNumberForDutyCycle:[self minBatteryIndex]];
  if (!v3) {
    v3 = [self getPowerNumberForDutyCycle:100LL];
  }
  id v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt : Releasing battery power resource because of disassoc" message:3];
  }
  objc_autoreleasePoolPop(v4);
  if (-[WiFiBatteryManager cpmsActive](self, "cpmsActive"))
  {
    unsigned int v5 = -[WiFiBatteryManager cpmsActive](self, "cpmsActive");
    id v6 = objc_autoreleasePoolPush();
    if (v5)
    {
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: WiFiBatteryMgmt : Requesting minPower : %@ for resource release", "-[WiFiBatteryManager releasePowerResources]", v3 message];
      }
      objc_autoreleasePoolPop(v6);
      uint64_t v9 = kCPMSPowerTimeScale100ms;
      id v10 = v3;
      id v7 = [NSDictionary dictionaryWithObjects:forKeys:count:&v10, &v9, 1LL];
      id v8 = -[CPMSAgentProtocol copyPowerBudgetForRequest:forClient:error:]( self->_cpmsAgent,  "copyPowerBudgetForRequest:forClient:error:",  v7,  self->_wifiCPMSHandle,  0LL);
      -[CPMSAgentProtocol acknowledgePowerBudget:forClientId:error:]( self->_cpmsAgent,  "acknowledgePowerBudget:forClientId:error:",  v8,  self->_wifiCPMSHandle,  0LL);
      -[WiFiBatteryManager setClaimedResource:](self, "setClaimedResource:", 0LL);
    }

    else
    {
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : Fatal error. No power modules active!? self should have been nil",  "-[WiFiBatteryManager releasePowerResources]");
      }
      objc_autoreleasePoolPop(v6);
    }
  }

  else
  {
    -[PPMClient activityStoppedWithLevel:options:error:]( self->_wifiPpmClientRef,  "activityStoppedWithLevel:options:error:",  0LL,  0LL,  0LL);
    -[WiFiBatteryManager setClaimedResource:](self, "setClaimedResource:", 0LL);
  }
}

- (id)getPowerNumberForDutyCycle:(int)a3
{
  dutyCycleToPowerTable100ms = self->_dutyCycleToPowerTable100ms;
  id v4 = [NSNumber numberWithInt:a3];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](dutyCycleToPowerTable100ms, "objectForKey:", v4));

  return v5;
}

- (id)getDutyCycleForPowerNumber:(unint64_t)a3
{
  if (self->_cpmsContPowerSupport)
  {
    if (self->_pMax <= a3)
    {
      uint64_t v9 = &off_100204710;
    }

    else
    {
      unint64_t pMin = self->_pMin;
      BOOL v4 = a3 >= pMin;
      unint64_t v5 = a3 - pMin;
      if (v4) {
        uint64_t v6 = [NSNumber numberWithInt:LODWORD(self->_dutyMin) + (int)(float)(self->_ratioDutyPower * (float)v5)];
      }
      else {
        uint64_t v6 = [&OBJC_CLASS___NSNumber numberWithUnsignedInteger:self->_minBatteryIndex];
      }
      uint64_t v9 = (_UNKNOWN **)v6;
    }
  }

  else
  {
    powerToDutyCycleTable100ms = self->_powerToDutyCycleTable100ms;
    id v8 = [NSNumber numberWithInt:a3];
    uint64_t v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](powerToDutyCycleTable100ms, "objectForKey:", v8));
  }

  return v9;
}

- (unint64_t)getClosestAllowedLowerPowerNumber:(unint64_t)a3
{
  if (a3 && self->_pMin <= a3)
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      unint64_t v6 = self->_wifiChipPowerTable.powerTable[v5];
      if (v6 <= a3) {
        break;
      }
      if (++v5 == 10) {
        return self->_pMin;
      }
    }
  }

  else
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : Ignoring invalid power value (%lu) and using max power instead.",  "-[WiFiBatteryManager getClosestAllowedLowerPowerNumber:]",  a3);
    }
    objc_autoreleasePoolPop(v7);
    id v8 = [self getPowerNumberForDutyCycle:100LL];
    unint64_t v6 = (int)[v8 intValue];
  }

  return v6;
}

- (unint64_t)WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kCPMSPowerTimeScale100ms;
  unint64_t v6 = (void *)[v4 objectForKey:kCPMSPowerTimeScale100ms];
  unint64_t v7 = (int)[v6 intValue];

  id v8 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiBatteryMgmt : budget100ms : %lu",  "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]",  v7);
  }
  objc_autoreleasePoolPop(v8);
  uint64_t v9 = kCPMSPowerTimeScale1s;
  id v10 = [v4 objectForKey:kCPMSPowerTimeScale1s];
  unint64_t v11 = (int)[v10 intValue];

  int v12 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt : budget1s : %lu" message:3 v11];
  }
  objc_autoreleasePoolPop(v12);
  if (!(_DWORD)v11)
  {
    unint64_t v13 = (void *)[self getPowerNumberForDutyCycle:100LL];
    unint64_t v11 = (int)[v13 intValue];
  }

  if (self->_cpmsContPowerSupport)
  {
    unint64_t pUnconstrained = self->_pUnconstrained;
    if (pUnconstrained < v7)
    {
      int v15 = [self getPowerNumberForDutyCycle:100LL];
      unint64_t v7 = (int)[v15 intValue];

      unint64_t pUnconstrained = self->_pUnconstrained;
    }

    unint64_t pMin = self->_pMin;
    if (v7 <= pMin) {
      unint64_t v7 = self->_pMin;
    }
    if (v11 > pUnconstrained)
    {
      unint64_t v17 = [self getPowerNumberForDutyCycle:100LL];
      unint64_t v11 = (int)[v17 intValue];

      unint64_t pMin = self->_pMin;
    }

    if (v11 <= pMin) {
      unint64_t v11 = pMin;
    }
  }

  else
  {
    id v18 = [self getDutyCycleForPowerNumber:v7];
    unsigned int v19 = [v18 intValue];

    if (!v19)
    {
      BOOL v20 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: WiFiBatteryMgmt : Illegal budget100ms value : %lu",  "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]",  v7);
      }
      objc_autoreleasePoolPop(v20);
      unint64_t v7 = -[WiFiBatteryManager getClosestAllowedLowerPowerNumber:](self, "getClosestAllowedLowerPowerNumber:", v7);
      id v21 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt : Closest lower legal budget100ms value : %lu" message:3 v7];
      }
      objc_autoreleasePoolPop(v21);
    }

    v22 = [self getDutyCycleForPowerNumber:v11];
    unsigned int v23 = [v22 intValue];

    if (!v23)
    {
      uint64_t v24 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: WiFiBatteryMgmt : Illegal budget1s value : %lu",  "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]",  v11);
      }
      objc_autoreleasePoolPop(v24);
      unint64_t v11 = -[WiFiBatteryManager getClosestAllowedLowerPowerNumber:](self, "getClosestAllowedLowerPowerNumber:", v11);
      v25 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: WiFiBatteryMgmt : Closest lower legal budget1s value : %lu" message:3 v11];
      }
      objc_autoreleasePoolPop(v25);
    }
  }

  if (v7 >= v11) {
    unint64_t v26 = v11;
  }
  else {
    unint64_t v26 = v7;
  }
  v27 = [self cachedBudget];
  v28 = [NSNumber numberWithInt:v7];
  [v27 setObject:v28 forKey:v5];

  v29 = -[WiFiBatteryManager cachedBudget];
  v30 = [NSNumber numberWithInt:v11];
  [v29 setObject:v30 forKey:v9];

  objc_super v31 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiBatteryManager getDutyCycleForPowerNumber:](self, "getDutyCycleForPowerNumber:", v26));
  unint64_t v32 = (int)[v31 intValue];

  return v32;
}

- (void)WiFiDeviceManagerHandleInterfaceAvailability:(unint64_t)a3
{
}

- (void)WiFiDeviceManagerHandlePowerBudgetChange:(unint64_t)a3
{
}

- (void)WiFiDeviceManagerHandlePowerUnchangedPowerBudget:(unint64_t)a3 :(id *)a4
{
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (NSDictionary)powerToDutyCycleTable100ms
{
  return self->_powerToDutyCycleTable100ms;
}

- (void)setPowerToDutyCycleTable100ms:(id)a3
{
}

- (NSDictionary)dutyCycleToPowerTable100ms
{
  return self->_dutyCycleToPowerTable100ms;
}

- (void)setDutyCycleToPowerTable100ms:(id)a3
{
}

- (NSDictionary)wifiDevicePowerLevels100ms
{
  return self->_wifiDevicePowerLevels100ms;
}

- (void)setWifiDevicePowerLevels100ms:(id)a3
{
}

- (int64_t)wifiCPMSHandle
{
  return self->_wifiCPMSHandle;
}

- (void)setWifiCPMSHandle:(int64_t)a3
{
  self->_wifiCPMSHandle = a3;
}

- (NSMutableDictionary)cachedBudget
{
  return self->_cachedBudget;
}

- (void)setCachedBudget:(id)a3
{
}

- (unint64_t)availableResource
{
  return self->_availableResource;
}

- (void)setAvailableResource:(unint64_t)a3
{
  self->_availableResource = a3;
}

- (unint64_t)claimedResource
{
  return self->_claimedResource;
}

- (void)setClaimedResource:(unint64_t)a3
{
  self->_claimedResource = a3;
}

- (unint64_t)minBatteryIndex
{
  return self->_minBatteryIndex;
}

- (void)setMinBatteryIndex:(unint64_t)a3
{
  self->_minBatteryIndex = a3;
}

- (float)ratioDutyPower
{
  return self->_ratioDutyPower;
}

- (void)setRatioDutyPower:(float)a3
{
  self->_ratioDutyPower = a3;
}

- (unint64_t)pMin
{
  return self->_pMin;
}

- (void)setPMin:(unint64_t)a3
{
  self->_unint64_t pMin = a3;
}

- (unint64_t)pMax
{
  return self->_pMax;
}

- (void)setPMax:(unint64_t)a3
{
  self->_pMax = a3;
}

- (unint64_t)pUnconstrained
{
  return self->_pUnconstrained;
}

- (void)setPUnconstrained:(unint64_t)a3
{
  self->_unint64_t pUnconstrained = a3;
}

- (unint64_t)dutyMin
{
  return self->_dutyMin;
}

- (void)setDutyMin:(unint64_t)a3
{
  self->_dutyMin = a3;
}

- (NSDate)asyncPPMBudgetTimestamp
{
  return self->_asyncPPMBudgetTimestamp;
}

- (void)setAsyncPPMBudgetTimestamp:(id)a3
{
}

- (BOOL)cpmsActive
{
  return self->_cpmsActive;
}

- (void)setCpmsActive:(BOOL)a3
{
  self->_cpmsActive = a3;
}

- (BOOL)cpmsContPowerSupport
{
  return self->_cpmsContPowerSupport;
}

- (void)setCpmsContPowerSupport:(BOOL)a3
{
  self->_cpmsContPowerSupport = a3;
}

- (id)WiFiBatteryManagerPpmAsyncNotificationHandler
{
  return self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
}

- (void)setWiFiBatteryManagerPpmAsyncNotificationHandler:(id)a3
{
}

- (id)WiFiBatteryManagerPpmAdmissionResultHandler
{
  return self->_WiFiBatteryManagerPpmAdmissionResultHandler;
}

- (void)setWiFiBatteryManagerPpmAdmissionResultHandler:(id)a3
{
}

- (id)cpmsAsyncNotificationCallback
{
  return self->_cpmsAsyncNotificationCallback;
}

- (void)setCpmsAsyncNotificationCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end