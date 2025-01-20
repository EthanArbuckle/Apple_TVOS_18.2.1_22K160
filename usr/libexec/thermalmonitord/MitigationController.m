@interface MitigationController
- (BOOL)getGPUUtilization:(int *)a3;
- (BOOL)graphicsUpdateInFlight;
- (BOOL)powerSaveActive;
- (BOOL)proModeActive;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (float)getCLPCPackagePowerCPUSplitFraction;
- (id)initForFastLoop:(BOOL)a3 noDisplay:(BOOL)a4 powerSaveParams:(id)a5 powerZoneParams:(id)a6;
- (int)CPULevel;
- (int)CPUPower;
- (int)DVD1Level;
- (int)GPUPower;
- (int)SGXLevel;
- (int)getCLPCWriteToReadPower_8_24_mW:(__CFString *)a3;
- (int)getCPUTargetPower;
- (int)getCurrentCPULoadingIndex:(int)a3;
- (int)getCurrentCPUPower;
- (int)getCurrentGPULoadingIndex:(int)a3;
- (int)getCurrentGPUPower;
- (int)getCurrentPackageLoadingIndex:(int)a3;
- (int)getCurrentPackagePower;
- (int)getGPUTargetPower;
- (int)getPackageCPUPowerTarget;
- (int)getPackageGPUPowerTarget;
- (int)getPackagePowerZoneMetric;
- (int)getPackageTargetPower;
- (int)numberOfFields;
- (int)powerSaveToken;
- (int)proModeToken;
- (int)requestListID;
- (int)setServiceProperty:(unsigned int)a3 key:(__CFString *)a4 value:(int)a5 scaleToFixedPoint:(BOOL)a6;
- (void)setCPMSMitigationsEnabled:(BOOL)a3;
- (void)setCPULevel:(int)a3;
- (void)setCPULowPowerTarget:(int)a3;
- (void)setCPUPowerCeiling:(int)a3 forDVD1Contributor:(int)a4;
- (void)setCPUPowerCeiling:(int)a3 fromDecisionSource:(int)a4;
- (void)setCPUPowerFloor:(int)a3 fromDecisionSource:(int)a4;
- (void)setCPUPowerZoneTarget:(int)a3;
- (void)setDVD1Level:(int)a3;
- (void)setDieTempControllerProperty:(__CFString *)a3 level:(int)a4 scaleToFixedPoint:(BOOL)a5;
- (void)setGPUPowerCeiling:(int)a3 fromDecisionSource:(int)a4;
- (void)setGPUPowerFloor:(int)a3 fromDecisionSource:(int)a4;
- (void)setGPUPowerZoneTarget:(int)a3;
- (void)setGraphicsUpdateInFlight:(BOOL)a3;
- (void)setMaxCPUPowerTarget:(int)a3 useLegacyPath:(BOOL)a4 setProperty:(__CFString *)a5;
- (void)setMaxGraphicsDrivePowerTarget:(int)a3;
- (void)setMaxPackagePower:(int)a3;
- (void)setPackageLowPowerTarget;
- (void)setPackagePowerBudgetDirect:(int)a3 withDetails:(unint64_t)a4;
- (void)setPackagePowerCeiling:(int)a3 fromDecisionSource:(int)a4;
- (void)setPackagePowerFloor:(int)a3 fromDecisionSource:(int)a4;
- (void)setPackagePowerZoneTarget;
- (void)setPowerSaveActive:(BOOL)a3;
- (void)setPowerSaveToken:(int)a3;
- (void)setProModeActive:(BOOL)a3;
- (void)setProModeToken:(int)a3;
- (void)setSGXLevel:(int)a3;
- (void)updateCPU;
- (void)updateGPU;
- (void)updatePackage;
@end

@implementation MitigationController

- (id)initForFastLoop:(BOOL)a3 noDisplay:(BOOL)a4 powerSaveParams:(id)a5 powerZoneParams:(id)a6
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MitigationController;
  v10 = -[MitigationController init](&v32, "init");
  v11 = v10;
  if (v10)
  {
    v10->listPosition = 1;
    memset_pattern16(v10->ceilingListDVD1, &unk_1000483A0, 0x18uLL);
    memset_pattern16(v11->ceilingListCPU, &unk_1000483A0, 0x18uLL);
    memset_pattern16(v11->ceilingListSGX, &unk_1000483A0, 0x18uLL);
    memset_pattern16(v11->ceilingListPackage, &unk_1000483B0, 0x18uLL);
    for (uint64_t i = 0LL; i != 24; i += 4LL)
    {
      v13 = (_DWORD *)((char *)v11 + i);
      v13[34] = 0;
      v13[40] = 0;
      v13[46] = 0;
    }

    v11->cpuMitigationQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.thermalmonitor.cpuMitigationQueue",  0LL);
    v11->gpuMitigationQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.thermalmonitor.gpuMitigationQueue",  0LL);
    v11->packageControlQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.thermalmonitor.packageControlQueue",  0LL);
    v11->_noDisplay = a4;
    if (!a4) {
      v11->sgxDevice = sub_100020E9C("IOAcceleratorES", 0LL, 0LL);
    }
    unsigned int v14 = sub_100020E9C("AppleCLPC", 0LL, 0LL);
    v11->clpcService = v14;
    if (!v14 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B5F0();
    }
    unsigned int v15 = sub_100020E9C("ApplePMGR", 0LL, 0LL);
    v11->pmgrService = v15;
    if (!v15 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B5C4();
    }
    v11->graphicsUpdateInFlight = 0;
    v11->connectsToDieTempCtlDriver = a3;
    if (byte_10007D470)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  18LL,  @"zETM",  18LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  27LL,  @"zETM",  27LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  0LL,  @"zETM",  0LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  24LL,  @"zETM",  24LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  25LL,  @"zETM",  25LL);
    }

    if (a6)
    {
      v11->_maxCPUPower = objc_msgSend( objc_msgSend(a6, "objectForKey:", @"CPUMaxPower"),  "intValue");
      v11->_maxGPUPower = objc_msgSend( objc_msgSend(a6, "objectForKey:", @"GPUMaxPower"),  "intValue");
      v11->_maxPackagePower = objc_msgSend( objc_msgSend(a6, "objectForKey:", @"PackageMaxPower"),  "intValue");
      v11->_usesPowerZoneControl = 1;
      v11->_usesPackageControl = objc_msgSend( objc_msgSend(a6, "objectForKey:", @"usesPackageControl"),  "BOOLValue");
      -[MitigationController setGPUPowerZoneTarget:](v11, "setGPUPowerZoneTarget:", 100LL);
    }

    if (a5)
    {
      objc_initWeak(&location, v11);
      cpuMitigationQueue = (dispatch_queue_s *)v11->cpuMitigationQueue;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10001EC08;
      v29[3] = &unk_100060BB8;
      objc_copyWeak(&v30, &location);
      sub_100022F34("com.apple.system.lowpowermode", &v11->_powerSaveToken, cpuMitigationQueue, v29);
      v17 = (dispatch_queue_s *)v11->cpuMitigationQueue;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10001EC78;
      v27[3] = &unk_100060BB8;
      objc_copyWeak(&v28, &location);
      sub_100022F34("com.apple.system.highpowermode", &v11->_proModeToken, v17, v27);
      if (v11->_usesPowerZoneControl)
      {
        if (v11->_usesPackageControl)
        {
          unsigned int v18 = objc_msgSend( objc_msgSend(a5, "objectForKey:", @"PackageLowPowerTarget"),  "intValue");
          uint64_t v19 = 224LL;
        }

        else
        {
          unsigned int v18 = objc_msgSend(objc_msgSend(a5, "objectForKey:", @"CPULowPowerTarget"), "intValue");
          uint64_t v19 = 216LL;
        }
      }

      else
      {
        unsigned int v18 = objc_msgSend(objc_msgSend(a5, "objectForKey:", @"maxCPU"), "intValue");
        uint64_t v19 = 212LL;
      }

      *(_DWORD *)((char *)&v11->super.isa + v19) = v18;
      unsigned int v20 = objc_msgSend(objc_msgSend(a5, "objectForKey:", @"maxGPU"), "intValue");
      if (v11->connectsToDieTempCtlDriver) {
        int v21 = v20;
      }
      else {
        int v21 = 100;
      }
      v11->_powerSaveMaxSGX = v21;
      if (byte_10007CB30)
      {
        v22 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int powerSaveMaxDVD1 = v11->_powerSaveMaxDVD1;
          int powerSaveCPUPowerTarget = v11->_powerSaveCPUPowerTarget;
          int powerSavePackagePowerTarget = v11->_powerSavePackagePowerTarget;
          *(_DWORD *)buf = 136316162;
          v34 = "-[MitigationController initForFastLoop:noDisplay:powerSaveParams:powerZoneParams:]";
          __int16 v35 = 1024;
          int v36 = powerSaveMaxDVD1;
          __int16 v37 = 1024;
          int v38 = v21;
          __int16 v39 = 1024;
          int v40 = powerSaveCPUPowerTarget;
          __int16 v41 = 1024;
          int v42 = powerSavePackagePowerTarget;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s: powerSave params %d DVD1, %d SGX, LPM CPU power target %d, LPM package power target %d",  buf,  0x24u);
        }
      }

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }

    else
    {
      v11->_powerSaveActive = 0;
    }

    v11->DVD1Level = -1;
    *(void *)&v11->CPULevel = -1LL;
    *(_OWORD *)&v11->DVD1Contributors[0].DVD1LevelRequested = xmmword_100048390;
    *(_OWORD *)&v11->DVD1Contributors[2].DVD1LevelRequested = xmmword_100048390;
    v11->_cpmsMitigationsEnabled = 0;
    -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v11);
  }

  return v11;
}

- (BOOL)getGPUUtilization:(int *)a3
{
  *a3 = 0;
  int v3 = byte_10007CA78;
  if (!self->_noDisplay)
  {
    io_registry_entry_t sgxDevice = self->sgxDevice;
    if (sgxDevice) {
      BOOL v5 = byte_10007CA78 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      int v7 = sub_1000212F4(sgxDevice, @"GetGPUUtilization", a3, 1LL);
      int v3 = v7 ^ 1;
      byte_10007CA78 = v7 ^ 1;
    }

    else
    {
      v6 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "<Error> Cannot Get GPUUtilization",  v9,  2u);
        int v3 = byte_10007CA78;
      }
    }
  }

  return v3 == 0;
}

- (int)requestListID
{
  int result = self->listPosition;
  if (result > 5 || result == 0)
  {
    self->listPosition = 0;
    BOOL v5 = (os_log_s *)qword_10007CF50;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    int result = 0;
    if (v6)
    {
      *(_WORD *)int v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "<Error> MC: End of list", v7, 2u);
      int result = self->listPosition;
    }
  }

  self->listPosition = result + 1;
  return result;
}

- (void)setCPUPowerCeiling:(int)a3 fromDecisionSource:(int)a4
{
  uint64_t v4 = 64LL;
  if (!self->_usesPowerZoneControl) {
    uint64_t v4 = 40LL;
  }
  *(_DWORD *)((char *)&self->super.isa + 4 * a4 + v4) = a3;
}

- (void)setCPUPowerCeiling:(int)a3 forDVD1Contributor:(int)a4
{
  self->DVD1Contributors[a4].DVD1LevelRequested = a3;
}

- (void)setGPUPowerCeiling:(int)a3 fromDecisionSource:(int)a4
{
  self->ceilingListSGX[a4] = a3;
}

- (void)setCPUPowerFloor:(int)a3 fromDecisionSource:(int)a4
{
  self->floorListCPU[a4] = a3;
}

- (int)getCLPCWriteToReadPower_8_24_mW:(__CFString *)a3
{
  io_registry_entry_t clpcService = self->clpcService;
  if (!clpcService || !self->_usesPowerZoneControl) {
    return -1;
  }
  int v8 = 0;
  if ((sub_10002169C(clpcService, a3, &v8) & 1) == 0)
  {
    BOOL v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B61C(a3, v6);
    }
  }

  return (int)(float)((float)((float)v8 * 0.000000059605) * 1000.0);
}

- (float)getCLPCPackagePowerCPUSplitFraction
{
  io_registry_entry_t clpcService = self->clpcService;
  if (clpcService)
  {
    int v6 = 0;
    if ((sub_1000212F4(clpcService, @"~pkg-power-split-cpu-fraction", &v6, 1LL) & 1) != 0)
    {
      return (float)v6 * 0.000015259;
    }

    else
    {
      uint64_t v4 = (os_log_s *)qword_10007CF50;
      float v3 = 0.5;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003B6C0(v4);
      }
    }
  }

  else
  {
    float v3 = 0.5;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B694();
    }
  }

  return v3;
}

- (int)getCurrentCPUPower
{
  *(float *)&dword_10007D1D0 = (float)result / 1000.0;
  if (!self->_usesPowerZoneControl) {
    return -1;
  }
  return result;
}

- (int)getCurrentPackagePower
{
  if (!self->_usesPowerZoneControl) {
    return -1;
  }
  -[PowerZoneTelemetry getCurrentPackagePower]( +[PowerZoneTelemetry sharedInstance](&OBJC_CLASS___PowerZoneTelemetry, "sharedInstance"),  "getCurrentPackagePower");
  return (int)(float)(v2 * 1000.0);
}

- (int)getPackagePowerZoneMetric
{
  *(float *)&dword_10007D1D4 = (float)result;
  if (!self->_usesPackageControl) {
    return -1;
  }
  return result;
}

- (int)getPackageCPUPowerTarget
{
  if (self->_usesPowerZoneControl) {
  else
  }
    return -1;
}

- (int)getPackageGPUPowerTarget
{
  if (self->_usesPowerZoneControl) {
  else
  }
    return -1;
}

- (int)getCurrentGPUPower
{
  int result = 0;
  int v5 = 0;
  if (!self->_noDisplay)
  {
    io_registry_entry_t sgxDevice = self->sgxDevice;
    if (sgxDevice)
    {
      sub_1000212F4(sgxDevice, @"FilteredGPUPower", &v5, 1LL);
      int result = v5;
    }

    else
    {
      int result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10003B740();
        int result = 0;
      }
    }
  }

  *(float *)dword_10007D170 = (float)result / 1000.0;
  return result;
}

- (int)getCPUTargetPower
{
  return self->_currentRealCPUPowerTarget;
}

- (int)getGPUTargetPower
{
  return self->_currentRealGPUPowerTarget;
}

- (int)getPackageTargetPower
{
  return self->_packagePowerZoneTarget;
}

- (int)getCurrentCPULoadingIndex:(int)a3
{
  return 100 * a3 / self->_maxCPUPower + 1;
}

- (int)getCurrentGPULoadingIndex:(int)a3
{
  return 100 * a3 / self->_maxGPUPower + 1;
}

- (int)getCurrentPackageLoadingIndex:(int)a3
{
  return 100 * a3 / self->_maxPackagePower + 1;
}

- (void)setGPUPowerFloor:(int)a3 fromDecisionSource:(int)a4
{
  self->floorListGPU[a4] = a3;
}

- (void)updateCPU
{
  if (!byte_10007CB31)
  {
    cpuMitigationQueue = (dispatch_queue_s *)self->cpuMitigationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001F25C;
    block[3] = &unk_1000614D0;
    block[4] = self;
    dispatch_async(cpuMitigationQueue, block);
  }

- (void)updateGPU
{
  if (!byte_10007CB31 && !self->graphicsUpdateInFlight)
  {
    gpuMitigationQueue = (dispatch_queue_s *)self->gpuMitigationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001F694;
    block[3] = &unk_1000614D0;
    block[4] = self;
    dispatch_async(gpuMitigationQueue, block);
  }

- (void)setCPUPowerZoneTarget:(int)a3
{
  if (a3 != -1)
  {
    uint64_t v12 = v3;
    uint64_t v8 = 1374389535LL * self->_maxCPUPower * a3;
    unsigned int v9 = (v8 >> 37) + ((unint64_t)v8 >> 63);
    self->_currentRealCPUPowerTarget = v9;
    if (self->_isHipEngaged && self->_currentHipPowerTarget != v9)
    {
      if (a3 <= 99) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = 65000LL;
      }
      self->_currentHipPowerTarget = self->_currentRealCPUPowerTarget;
    }

    else
    {
      if (a3 <= 99) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 65000LL;
      }
      if (self->_currentHipPowerTarget != 65000)
      {
        self->_currentHipPowerTarget = 65000;
      }
    }
  }

- (void)setGPUPowerZoneTarget:(int)a3
{
  if (a3 != -1)
  {
    uint64_t v3 = 1374389535LL * self->_maxGPUPower * a3;
    unsigned int v4 = (v3 >> 37) + ((unint64_t)v3 >> 63);
    self->_currentRealGPUPowerTarget = v4;
    if (a3 == 100) {
      -[MitigationController setMaxGraphicsDrivePowerTarget:](self, "setMaxGraphicsDrivePowerTarget:", 65000LL);
    }
    else {
      -[MitigationController setMaxGraphicsDrivePowerTarget:](self, "setMaxGraphicsDrivePowerTarget:", v4);
    }
  }

- (void)setPackagePowerZoneTarget
{
  int CPULevel = self->CPULevel;
  uint64_t v4 = 1374389535LL * self->_maxCPUPower * CPULevel;
  int v5 = (v4 >> 37) + ((unint64_t)v4 >> 63);
  self->_currentRealCPUPowerTarget = v5;
  int SGXLevel = self->SGXLevel;
  uint64_t v7 = 1374389535LL * self->_maxGPUPower * SGXLevel;
  int v8 = (v7 >> 37) + ((unint64_t)v7 >> 63);
  self->_currentRealGPUPowerTarget = v8;
  if (CPULevel > 99) {
    int v5 = 65000;
  }
  if (SGXLevel > 99) {
    int v8 = 65000;
  }
  int v9 = v8 + v5;
  if (v9 >= 65000) {
    int v10 = 65000;
  }
  else {
    int v10 = v9;
  }
  if (v10 != self->_packagePowerZoneTarget)
  {
    LODWORD(v2) = vcvtd_n_s64_f64((double)v10 / 1000.0, 0x18uLL);
    if (self->_isHipEngaged && self->_currentHipPowerTarget != v10)
    {
      self->_currentHipPowerTarget = v10;
    }

    else
    {
      if (self->_currentHipPowerTarget != 65000)
      {
        self->_currentHipPowerTarget = 65000;
      }
    }

    self->_packagePowerZoneTarget = v10;
  }

- (void)setCPMSMitigationsEnabled:(BOOL)a3
{
  if (self->_usesPackageControl)
  {
    BOOL v3 = a3;
    int v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = "dis";
      if (v3) {
        uint64_t v6 = "en";
      }
      int v7 = 136315138;
      int v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> %sabling CPMS mitigations in MitigationController",  (uint8_t *)&v7,  0xCu);
    }

    self->_cpmsMitigationsEnabled = v3;
  }

- (void)setPackagePowerCeiling:(int)a3 fromDecisionSource:(int)a4
{
  self->ceilingListPackage[a4] = a3;
}

- (void)setPackagePowerFloor:(int)a3 fromDecisionSource:(int)a4
{
  self->floorListPackage[a4] = a3;
}

- (void)setPackagePowerBudgetDirect:(int)a3 withDetails:(unint64_t)a4
{
  if (self->_cpmsMitigationsEnabled)
  {
    -[CPMSHelper addToCPMSMitigationArray:withDetails:forComponent:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "addToCPMSMitigationArray:withDetails:forComponent:",  *(void *)&a3,  a4,  13LL);
  }

  else
  {
    uint64_t v4 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B76C(v4, v5, v6);
    }
  }

- (void)updatePackage
{
  packageControlQueue = (dispatch_queue_s *)self->packageControlQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001FC08;
  block[3] = &unk_1000614D0;
  block[4] = self;
  dispatch_async(packageControlQueue, block);
}

- (void)setMaxPackagePower:(int)a3
{
  if (self->_usesPackageControl)
  {
    if (byte_10007CB30)
    {
      uint64_t v5 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Setting max package power in mitigation controller: %d",  (uint8_t *)v6,  8u);
      }
    }

    self->_maxPackagePower = a3;
  }

- (void)setMaxGraphicsDrivePowerTarget:(int)a3
{
  if (!self->_noDisplay)
  {
    self->graphicsUpdateInFlight = 1;
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, @"SetMaxGPUAbsolutePower", kCFBooleanTrue);
    int valuePtr = a3;
    self->_int currentGPUPowerTarget = a3;
    CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
    if (v6)
    {
      CFNumberRef v7 = v6;
      CFDictionarySetValue(Mutable, @"AbsoluteTarget", v6);
      if (byte_10007CB30)
      {
        int v8 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int currentGPUPowerTarget = self->_currentGPUPowerTarget;
          *(_DWORD *)buf = 67109120;
          int v13 = currentGPUPowerTarget;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> GPUCC Set GPU power to %d",  buf,  8u);
        }
      }

      if (IORegistryEntrySetCFProperties(self->sgxDevice, Mutable))
      {
        int v10 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003B7E0(a3, v10);
        }
      }

      CFRelease(v7);
    }

    CFRelease(Mutable);
    self->graphicsUpdateInFlight = 0;
  }

- (void)setMaxCPUPowerTarget:(int)a3 useLegacyPath:(BOOL)a4 setProperty:(__CFString *)a5
{
  self->_currentCPUPowerTarget = a3;
  p_currentCPUPowerTarget = &self->_currentCPUPowerTarget;
  if (self->clpcService)
  {
    BOOL v7 = a4;
    double v9 = 16777216.0;
    if (a4) {
      double v9 = 65536.0;
    }
    unsigned int valuePtr = ((float)a3 / 1000.0 * v9);
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFNumberRef v11 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
    if (v11)
    {
      if (v7) {
        uint64_t v12 = @"CPUPowerTarget";
      }
      else {
        uint64_t v12 = a5;
      }
      CFDictionaryAddValue(Mutable, v12, v11);
      if (IORegistryEntrySetCFProperties(self->clpcService, Mutable))
      {
        unsigned int v15 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003B87C(p_currentCPUPowerTarget, v15, v16);
        }
      }

      else if (byte_10007CB30)
      {
        int v13 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = *p_currentCPUPowerTarget;
          *(_DWORD *)buf = 67109120;
          int v19 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "<Notice> CPUCC Set CPU power to %d",  buf,  8u);
        }
      }
    }

    CFRelease(v11);
    CFRelease(Mutable);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003B850();
  }

- (void)setCPULowPowerTarget:(int)a3
{
  p_currentCPULowPowerTarget = &self->_currentCPULowPowerTarget;
  if (self->_currentCPULowPowerTarget != a3)
  {
    self->_currentCPULowPowerTarget = a3;
    if (self->clpcService)
    {
      unsigned int valuePtr = vcvtd_n_u64_f64((float)a3 / 1000.0, 0x18uLL);
      Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
      if (v6)
      {
        if (IORegistryEntrySetCFProperties(self->clpcService, Mutable))
        {
          double v9 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_10003B8F0(p_currentCPULowPowerTarget, v9, v10);
          }
        }

        else if (byte_10007CB30)
        {
          BOOL v7 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            int v8 = *p_currentCPULowPowerTarget;
            *(_DWORD *)buf = 67109120;
            int v13 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> CPUCC Set CPU low power target to %d",  buf,  8u);
          }
        }
      }

      CFRelease(v6);
      CFRelease(Mutable);
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003B850();
    }
  }

- (void)setPackageLowPowerTarget
{
  if (self->_powerSaveActive) {
    int powerSavePackagePowerTarget = self->_powerSavePackagePowerTarget;
  }
  else {
    int powerSavePackagePowerTarget = 65000;
  }
  if (powerSavePackagePowerTarget != self->_packageLowPowerTarget && self->_powerSavePackagePowerTarget != 255000)
  {
    LODWORD(v2) = vcvtd_n_s64_f64((double)powerSavePackagePowerTarget / 1000.0, 0x18uLL);
    self->_packageLowPowerTarget = powerSavePackagePowerTarget;
  }

- (void)setDieTempControllerProperty:(__CFString *)a3 level:(int)a4 scaleToFixedPoint:(BOOL)a5
{
  if (dword_10007CA7C || (dword_10007CA7C = sub_100020E9C("AppleDieTempController", 0LL, 0LL)) != 0)
  {
    -[MitigationController setServiceProperty:key:value:scaleToFixedPoint:]( self,  "setServiceProperty:key:value:scaleToFixedPoint:");
  }

  else
  {
    CFNumberRef v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B964(v6, v7, v8);
    }
  }

- (int)setServiceProperty:(unsigned int)a3 key:(__CFString *)a4 value:(int)a5 scaleToFixedPoint:(BOOL)a6
{
  int valuePtr = a5;
  if (a6)
  {
    if (a5 <= 99) {
      int v8 = (a5 << 16) / 100;
    }
    else {
      int v8 = 0x10000;
    }
    int valuePtr = v8;
  }

  CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v9)
  {
    CFNumberRef v10 = v9;
    mach_error_t v11 = IORegistryEntrySetCFProperty(a3, a4, v9);
    if (v11)
    {
      int v14 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003BA5C((uint64_t)a4, v11, v14);
      }
    }

    CFRelease(v10);
  }

  else
  {
    int v13 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B9D8((uint64_t)a4, &valuePtr, v13);
    }
    return 5;
  }

  return v11;
}

- (int)numberOfFields
{
  return 20;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 < 0x12)
  {
    BOOL v3 = &off_100061850[a3];
    return *v3;
  }

  if ((a3 & 0xFFFFFFFC) == 0x10)
  {
    BOOL v3 = &off_100061830[a3 - 16];
    return *v3;
  }

  return 0LL;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 0:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->_packageLowPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    case 1:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController SGXLevel](self, "SGXLevel");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 2:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = 100LL;
      if (!self->_powerSaveActive) {
        uint64_t packageLowPowerTarget = 0LL;
      }
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    case 3:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->_maxCPUPower;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    case 4:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->_maxGPUPower;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    case 5:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->_currentCPUPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    case 6:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->_currentGPUPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    case 7:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController getCurrentCPUPower](self, "getCurrentCPUPower");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 8:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController getCurrentGPUPower](self, "getCurrentGPUPower");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 9:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController getCurrentPackagePower](self, "getCurrentPackagePower");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 10:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController CPULevel](self, "CPULevel");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 11:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->_currentCPULowPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    case 12:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->_packagePowerZoneTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    case 13:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController DVD1Level](self, "DVD1Level");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 14:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController getPackagePowerZoneMetric](self, "getPackagePowerZoneMetric");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 15:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController getPackageCPUPowerTarget](self, "getPackageCPUPowerTarget");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 16:
      uint64_t v5 = kCFAllocatorDefault;
      uint64_t v6 = -[MitigationController getPackageGPUPowerTarget](self, "getPackageGPUPowerTarget");
      return (__CFString *)CFStringCreateWithFormat(v5, 0LL, @"%d", v6);
    case 17:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->_currentHipPowerTarget;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
    default:
      if ((a3 & 0xFFFFFFFC) != 0x10) {
        return 0LL;
      }
      BOOL v3 = kCFAllocatorDefault;
      uint64_t packageLowPowerTarget = self->DVD1Contributors[a3 - 16].DVD1LevelSentPrevious;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", packageLowPowerTarget);
  }

- (int)DVD1Level
{
  return self->DVD1Level;
}

- (void)setDVD1Level:(int)a3
{
  self->DVD1Level = a3;
}

- (int)CPULevel
{
  return self->CPULevel;
}

- (void)setCPULevel:(int)a3
{
  self->int CPULevel = a3;
}

- (int)SGXLevel
{
  return self->SGXLevel;
}

- (void)setSGXLevel:(int)a3
{
  self->int SGXLevel = a3;
}

- (BOOL)graphicsUpdateInFlight
{
  return self->graphicsUpdateInFlight;
}

- (void)setGraphicsUpdateInFlight:(BOOL)a3
{
  self->graphicsUpdateInFlight = a3;
}

- (int)powerSaveToken
{
  return self->_powerSaveToken;
}

- (void)setPowerSaveToken:(int)a3
{
  self->_powerSaveToken = a3;
}

- (BOOL)powerSaveActive
{
  return self->_powerSaveActive;
}

- (void)setPowerSaveActive:(BOOL)a3
{
  self->_powerSaveActive = a3;
}

- (int)proModeToken
{
  return self->_proModeToken;
}

- (void)setProModeToken:(int)a3
{
  self->_proModeToken = a3;
}

- (BOOL)proModeActive
{
  return self->_proModeActive;
}

- (void)setProModeActive:(BOOL)a3
{
  self->_proModeActive = a3;
}

- (int)CPUPower
{
  return self->_CPUPower;
}

- (int)GPUPower
{
  return self->_GPUPower;
}

@end