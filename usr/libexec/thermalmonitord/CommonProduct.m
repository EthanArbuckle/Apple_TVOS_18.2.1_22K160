@interface CommonProduct
- (BOOL)canSystemSleep;
- (BOOL)fourCharCodeMatchesDieTempType:(char)a3 fourCharCode:(__CFString *)a4;
- (BOOL)fourCharCodeNeedsPMUtcal:(__CFString *)a3;
- (BOOL)getPotentialForcedThermalPressureLevel;
- (BOOL)isBackLightOn;
- (BOOL)isCPMSMitigationEnabled;
- (BOOL)isInternalInstall;
- (BOOL)isSendingMaxTempToDisplayDriverEnabled;
- (BOOL)mitigationsFullyReleased;
- (BOOL)shouldSuppressStandardBehaviors:(__CFDictionary *)a3;
- (BOOL)useTcalAdjust:(unsigned int)a3;
- (NSMutableArray)listOfSupervisorControl;
- (NSMutableArray)listofComponentControl;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)thermalQueue;
- (__CFArray)copyHotspotsArray:(id)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (id)copyDieTempSensorIndexSetForFourthChar:(char)a3 sensors:(__CFArray *)a4 filteredOnly:(BOOL)a5;
- (id)findComponent:(int)a3;
- (id)getGridX;
- (id)getGridY;
- (id)initProduct:(id)a3;
- (id)newBacklightComponentController:(__CFDictionary *)a3;
- (iir_filter_t)getFilterValues;
- (int)arcModuleTemperature;
- (int)arcVirtualTemperature;
- (int)calibrationResistorSensor;
- (int)calibrationResistorTempDefault;
- (int)canaryTempSensorIndex;
- (int)canaryTempThreshold;
- (int)chargerState;
- (int)chargerToken;
- (int)compute2DGridTemps;
- (int)computeMaxCGTemp;
- (int)desiredLoopInterval;
- (int)dieTempFilteredMaxAverage;
- (int)dieTempMaxAverage;
- (int)dieTempMaxMax;
- (int)displayToken;
- (int)gasGaugeBatteryTemperature;
- (int)getChargerState;
- (int)getCurrentMaxLIForComponent:(unsigned int)a3;
- (int)getFrontDisplayCenterTemperature;
- (int)getHighestSkinTemp;
- (int)getModeratePressureVersion;
- (int)maxControlEffort;
- (int)numberOfFields;
- (int)powerSensors;
- (int)sensorIndexFromList:(__CFArray *)a3 fourCharCode:(__CFString *)a4;
- (int)thermalState;
- (int)totalSensors;
- (int64_t)thermalPressureLevel;
- (unint64_t)componentThermalStatusLevel;
- (unint64_t)getMaxSensorValue;
- (unint64_t)getPotentialForcedThermalLevel:(unint64_t)a3;
- (unsigned)requiredCalibrationResistorSamples;
- (void)applyAlternateHotSpotTargets:(BOOL)a3;
- (void)clearControlEffortOverrides;
- (void)clearLoadingIndexOverrides;
- (void)createConnectionToCT;
- (void)dealloc;
- (void)emitThermalMitigationNotifications;
- (void)emitThermalTrendNotifications;
- (void)enableSendingMaxTempToDisplayDriver;
- (void)evaluteMitigationMaxLoadingIndex;
- (void)getAllComponentID:(__SCPreferences *)a3;
- (void)handleMCSThermalPressure;
- (void)logTrapEntryForAC:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overrideArcParam:(id)a3 value:(int)a4;
- (void)overrideLifetimeServoParam:(id)a3 value:(int)a4;
- (void)probeAllSupervisorControlLoadingIndex;
- (void)putDeviceInLowTempSimulationMode:(id)a3;
- (void)putDeviceInThermalSimulationMode:(id)a3;
- (void)registerChargerNotification;
- (void)registerDefaultsDomain;
- (void)registerDisplayNotification;
- (void)removeHotspotTargetOverrides;
- (void)removeLightPressureOverride;
- (void)replaceOrAppendHotspotEntry:(__CFDictionary *)a3 existingHotspots:(__CFArray *)a4;
- (void)setChargerState:(int)a3;
- (void)setChargerToken:(int)a3;
- (void)setComponentThermalStatusLevel:(unint64_t)a3;
- (void)setDefaults:(id)a3;
- (void)setDisplayToken:(int)a3;
- (void)setHiPFeatureEnabled:(BOOL)a3;
- (void)setIsBackLightOn:(BOOL)a3;
- (void)setIsCPMSMitigationEnabled:(BOOL)a3;
- (void)setThermalQueue:(id)a3;
- (void)setThermalState:(int)a3;
- (void)simulateLightThermalPressure;
- (void)thermalUpdatesToWatchdogEnabled:(id)a3;
- (void)tryTakeAction;
- (void)updateAccessories:(BOOL)a3;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateContextualClamp;
- (void)updateControlEffortFor:(int)a3 :(unsigned int)a4;
- (void)updateHotSpotPIDTargetFor:(int)a3 :(unsigned int)a4;
- (void)updateLifetimeServo;
- (void)updateMaxLIFor:(int)a3 :(unsigned int)a4;
- (void)updatePowerzoneTelemetry;
- (void)updateSleepTargetFor:(int)a3 :(unsigned int)a4;
- (void)updateSystemPowerState:(BOOL)a3;
- (void)updateTrapTargetFor:(int)a3 :(unsigned int)a4;
@end

@implementation CommonProduct

- (id)initProduct:(id)a3
{
  v129.receiver = self;
  v129.super_class = (Class)&OBJC_CLASS___CommonProduct;
  v4 = -[CommonProduct init](&v129, "init");
  if (!v4) {
    return v4;
  }
  *((void *)v4 + 2) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  *((void *)v4 + 3) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  *((void *)v4 + 4) = 0x143E00000000LL;
  *((_DWORD *)v4 + 10) = 0;
  v5 = v4 + 40;
  *((_DWORD *)v4 + 14) = 0;
  v4[8] = 0;
  v4[184] = 0;
  *((void *)v4 + 9) = 0LL;
  *((void *)v4 + 10) = 0LL;
  *((void *)v4 + 8) = 0LL;
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *((void *)v4 + 32) = dispatch_queue_create("com.apple.ThermalMonitor.mainQueue", v6);
  -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v4);
  id v7 = [(id)qword_10007D4E0 requestListID];
  v8 = (const __CFDictionary *)[a3 getConfigurationFor:@"generalProductConfig"];
  BOOL v9 = sub_100020F54(v8, @"noDisplay");
  id v10 = [a3 getConfigurationFor:@"powerZoneParams"];
  BOOL v11 = sub_100020F54(v8, @"usesSMCSensorExchange");
  byte_10007D470 = v11;
  if (v11)
  {
    -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  10LL,  @"zETM",  10LL);
    v12 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> Using SensorExchangeHelper",  buf,  2u);
    }
  }

  BOOL v13 = sub_100020F54(v8, @"usesACSK");
  byte_10007CB31 = v13;
  if (v13)
  {
    v14 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> Using ACSK", buf, 2u);
    }
  }

  BOOL v15 = sub_100020F54(v8, @"usesKeyboardHelper");
  byte_10007CB33 = v15;
  if (v15)
  {
    BOOL v16 = sub_100020F54(v8, @"needsCLPCClient");
    v17 = (os_log_s *)qword_10007CF50;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Uses CLPC framework", buf, 2u);
        v17 = (os_log_s *)qword_10007CF50;
      }

      byte_10007CB34 = 1;
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Using Keyboard Helper", buf, 2u);
    }

    v18 = objc_alloc_init(&OBJC_CLASS___KeyboardHelper);
    *((void *)v4 + 18) = v18;
    if (v18)
    {
      -[KeyboardHelper registerForKeyboardEvents](v18, "registerForKeyboardEvents");
      if (sub_100020F54(v8, @"usesFolioHelper"))
      {
        v19 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<Notice> Using Folio Helper", buf, 2u);
        }

        [*((id *)v4 + 18) registerForFolioEvents];
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003F098();
    }
  }

  if (!sub_100020F54(v8, @"skipMitigationController"))
  {
    v4[44] = sub_100020F54(v8, @"needsFastDieControl");
    v20 = objc_alloc(&OBJC_CLASS___MitigationController);
    uint64_t v21 = v4[44];
    id v22 = [a3 getConfigurationFor:@"powerSaveParams"];
    uint64_t v23 = v21;
    v5 = v4 + 40;
    qword_10007D4E0 = -[MitigationController initForFastLoop:noDisplay:powerSaveParams:powerZoneParams:]( v20,  "initForFastLoop:noDisplay:powerSaveParams:powerZoneParams:",  v23,  v9,  v22,  v10);
  }

  id v24 = [a3 getConfigurationFor:@"packageComponentControl"];
  if (v24)
  {
    v25 = -[PackagePowerCC initWithParams:](objc_alloc(&OBJC_CLASS___PackagePowerCC), "initWithParams:", v24);
  }

  else
  {
    v26 = (const __CFDictionary *)[a3 getConfigurationFor:@"cpuComponentControl"];
    if (v26)
    {
      v27 = v26;
      *(_DWORD *)buf = 0;
      sub_100020FE0(v26, @"controllerVersion", kCFNumberIntType, buf);
      if (*(_DWORD *)buf == 2)
      {
        v28 = -[CpuPiecewiseCC initWithParams:listID:needspowerZones:]( objc_alloc(&OBJC_CLASS___CpuPiecewiseCC),  "initWithParams:listID:needspowerZones:",  v27,  v7,  v10 != 0LL);
      }

      else
      {
        int valuePtr = 1065353216;
        v29 = (const __CFNumber *)[a3 getConfigurationFor:@"Power_Scale"];
        if (v29) {
          CFNumberGetValue(v29, kCFNumberIntType, &valuePtr);
        }
        v30 = objc_alloc(&OBJC_CLASS___CpuCC);
        LODWORD(v31) = valuePtr;
        v28 = -[CpuCC initWithParams:powerScale:listID:needspowerZones:]( v30,  "initWithParams:powerScale:listID:needspowerZones:",  v27,  v7,  v10 != 0LL,  v31);
      }

      v32 = v28;
      [*((id *)v4 + 2) addObject:v28];
    }

    id v33 = [a3 getConfigurationFor:@"socComponentControl"];
    if (!v33) {
      goto LABEL_36;
    }
    v25 = -[SocCC initWithParams:listID:](objc_alloc(&OBJC_CLASS___SocCC), "initWithParams:listID:", v33, v7);
  }

  v34 = v25;
  [*((id *)v4 + 2) addObject:v25];

LABEL_36:
  int valuePtr = 0;
  sub_100020FE0(v8, @"radioControllerType", kCFNumberIntType, &valuePtr);
  int v36 = valuePtr;
  v37 = off_100060518;
  switch(valuePtr)
  {
    case 0:
      goto LABEL_56;
    case 3:
      goto LABEL_38;
    case 4:
      v37 = off_100060510;
LABEL_38:
      id v38 = objc_msgSend( objc_alloc(*v37),  "initWithRunLoopAndParams:withParams:",  objc_msgSend(a3, "localMainRunloop"),  objc_msgSend(a3, "getConfigurationFor:", @"radioComponentControl"));
      if (v38)
      {
        v39 = v38;
        [*((id *)v4 + 2) addObject:v38];
      }

      goto LABEL_56;
    case 5:
      uint64_t v125 = (uint64_t)&v125;
      v126 = v5;
      uint64_t v41 = 0LL;
      v121 = @"radioModemBandComponentControl";
      v122 = @"radioFR2RFCGComponentControl";
      v123 = @"radioFR2RFBCComponentControl";
      v124 = @"radioFR2RFBandComponentControl";
      *(void *)&__int128 v35 = 138412290LL;
      __int128 v127 = v35;
      break;
    default:
      v40 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003F028(v36, v40);
      }
      goto LABEL_56;
  }

  do
  {
    if (byte_10007CB30)
    {
      v42 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = (uint64_t)*(&v121 + v41);
        *(_DWORD *)buf = v127;
        uint64_t v131 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "<Notice> Getting configuration and initializing RadioPowerCC type: %@",  buf,  0xCu);
      }
    }

    uint64_t v44 = (uint64_t)*(&v121 + v41);
    id v45 = objc_msgSend(a3, "getConfigurationFor:", v44, v121, v122, v123, v124, v125);
    if (!v45)
    {
      uint64_t v48 = qword_10007CF50;
      if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        goto LABEL_52;
      }
      *(_DWORD *)buf = v127;
      uint64_t v131 = v44;
      v49 = (os_log_s *)v48;
      v50 = "<Error> No configuration found for RadioPowerCC name: %@";
      goto LABEL_55;
    }

    v46 = -[RadioPowerCC initWithRunLoopAndParams:withMitigationType:withParams:]( [RadioPowerCC alloc],  "initWithRunLoopAndParams:withMitigationType:withParams:",  [a3 localMainRunloop],  dword_100048520[v41],  v45);
    if (v46)
    {
      v47 = v46;
      [*((id *)v4 + 2) addObject:v46];

      goto LABEL_52;
    }

    uint64_t v51 = qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v127;
      uint64_t v131 = v44;
      v49 = (os_log_s *)v51;
      v50 = "<Error> Failed to initialize RadioPowerCC name: %@";
LABEL_55:
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v50, buf, 0xCu);
    }

- (void)registerDefaultsDomain
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000327C8;
  block[3] = &unk_1000614D0;
  block[4] = self;
  if (qword_10007CAD8 != -1) {
    dispatch_once(&qword_10007CAD8, block);
  }
}

- (void)simulateLightThermalPressure
{
}

- (void)removeLightPressureOverride
{
}

- (void)setHiPFeatureEnabled:(BOOL)a3
{
  byte_1000748C1 = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"thermalSimulationMode"])
  {
    -[CommonProduct putDeviceInThermalSimulationMode:]( self,  "putDeviceInThermalSimulationMode:",  [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  }

  else if ([a3 isEqualToString:@"ppmSimulationMode"])
  {
    -[CommonProduct putDeviceInLowTempSimulationMode:]( self,  "putDeviceInLowTempSimulationMode:",  [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  }

  else if ([a3 isEqualToString:@"watchdogUpdates"])
  {
    -[CommonProduct thermalUpdatesToWatchdogEnabled:]( self,  "thermalUpdatesToWatchdogEnabled:",  [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003F0C4();
    }
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___CommonProduct;
    -[CommonProduct observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5,  a6);
  }

- (void)thermalUpdatesToWatchdogEnabled:(id)a3
{
  v4 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> Asked to change watchdog updates mode to %@",  (uint8_t *)&v9,  0xCu);
  }

  unsigned int v5 = [a3 isEqualToString:@"false"];
  byte_1000748C2 = v5 ^ 1;
  if (byte_10007CB30)
  {
    unsigned int v6 = v5;
    id v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "en";
      if (v6) {
        v8 = "dis";
      }
      int v9 = 136315138;
      id v10 = (id)v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Watchdog Thermal Updates %sabled",  (uint8_t *)&v9,  0xCu);
    }
  }

- (void)putDeviceInThermalSimulationMode:(id)a3
{
  unsigned int v5 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Asked to change thermal mode to %@",  (uint8_t *)&v13,  0xCu);
  }

  if (a3)
  {
    if ([a3 isEqualToString:@"off"])
    {
      -[CommonProduct clearLoadingIndexOverrides](self, "clearLoadingIndexOverrides");
      -[CommonProduct removeLightPressureOverride](self, "removeLightPressureOverride");
      -[CommonProduct setHiPFeatureEnabled:](self, "setHiPFeatureEnabled:", 1LL);
      byte_10007D4D9 = 0;
      dword_10007D198 = 0;
      return;
    }

    if ([a3 isEqualToString:@"nominal"])
    {
      memset(&qword_10007D4C8, 100, 17);
      -[CommonProduct removeLightPressureOverride](self, "removeLightPressureOverride");
      -[CommonProduct setHiPFeatureEnabled:](self, "setHiPFeatureEnabled:", 0LL);
      byte_10007D4D9 = 1;
      int v6 = 1065353216;
LABEL_15:
      dword_10007D198 = v6;
      return;
    }
  }

  -[CommonProduct setHiPFeatureEnabled:](self, "setHiPFeatureEnabled:", 0LL);
  byte_10007D4D9 = 1;
  id v7 = -[NSDictionary valueForKeyPath:](self->simulatedThermalMitigationLimits, "valueForKeyPath:", a3);
  for (uint64_t i = 0LL; i != 17; ++i)
  {
    id v9 = [v7 valueForKey:*(&off_100061B98 + i)];
    if (v9) {
      *((_BYTE *)&qword_10007D4C8 + i) = [v9 integerValue];
    }
  }

  if (a3)
  {
    if ([a3 isEqualToString:@"light"])
    {
      -[CommonProduct simulateLightThermalPressure](self, "simulateLightThermalPressure");
      int v6 = 0x40000000;
      goto LABEL_15;
    }

    unsigned __int8 v11 = [a3 isEqualToString:@"moderate"];
    LODWORD(v10) = 3.0;
    if ((v11 & 1) != 0
      || (unsigned int v12 = objc_msgSend(a3, "isEqualToString:", @"heavy", v10), LODWORD(v10) = 4.0, v12))
    {
      dword_10007D198 = LODWORD(v10);
    }
  }

  -[CommonProduct removeLightPressureOverride](self, "removeLightPressureOverride", v10);
}

- (void)putDeviceInLowTempSimulationMode:(id)a3
{
  unsigned int v5 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Asked to change low temp mode to %@",  (uint8_t *)&v13,  0xCu);
  }

  if ([a3 isEqualToString:@"off"])
  {
    sub_10002340C(0);
    sub_100022B64(0LL);
    sub_1000228FC();
    sub_1000229B4();
    sub_1000220D0();
    nullsub_1();
    sub_100021DD8();
    sub_1000221F8();
  }

  else
  {
    sub_10002340C(1);
    sub_100022B64(1LL);
    id v6 = -[NSDictionary valueForKeyPath:](self->simulatedLowTempMitigationLimits, "valueForKeyPath:", a3);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 valueForKey:@"Ra"];
      if (v8)
      {
        sub_100022854((int)[v8 integerValue]);
      }

      else
      {
        id v9 = [v7 valueForKey:@"wRa"];
        if (v9) {
          sub_10002290C((int)[v9 integerValue]);
        }
      }

      id v10 = [v7 valueForKey:@"soc"];
      if (v10)
      {
        unsigned __int8 v11 = v10;
        sub_1000220C4((uint64_t)[v10 integerValue]);
        sub_100021DCC((uint64_t)[v11 integerValue]);
        sub_100022020((int)[v11 integerValue]);
      }

      id v12 = [v7 valueForKey:@"TG0B"];
      if (v12) {
        sub_1000220E0((uint64_t)@"TG0B", (int)[v12 integerValue]);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003F0F0();
    }
  }

- (void)dealloc
{
  filteredAverageDieTempSensorIndexSet = self->_filteredAverageDieTempSensorIndexSet;
  if (filteredAverageDieTempSensorIndexSet) {

  }
  notify_cancel(self->_displayToken);
  notify_cancel(self->_chargerToken);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CommonProduct;
  -[CommonProduct dealloc](&v4, "dealloc");
}

- (id)copyDieTempSensorIndexSetForFourthChar:(char)a3 sensors:(__CFArray *)a4 filteredOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = a3;
  id v9 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
  if (CFArrayGetCount(a4) >= 1)
  {
    CFIndex v10 = 0LL;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a4, v10);
      if (-[CommonProduct fourCharCodeMatchesDieTempType:fourCharCode:]( self,  "fourCharCodeMatchesDieTempType:fourCharCode:",  v7,  CFDictionaryGetValue(ValueAtIndex, @"4CharCode"))
        && (!v5
         || -[HidSensors getFilterTimeConstantForSensor:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getFilterTimeConstantForSensor:",  v10) >= 1))
      {
        -[NSMutableArray addObject:]( v9,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
      }

      ++v10;
    }

    while (CFArrayGetCount(a4) > v10);
  }

  if (-[NSMutableArray count](v9, "count")) {
    id v12 = -[NSMutableArray copy](v9, "copy");
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

- (BOOL)fourCharCodeMatchesDieTempType:(char)a3 fourCharCode:(__CFString *)a4
{
  if (!a4) {
    return 0;
  }
  int CString = CFStringGetCString(a4, buffer, 16LL, 0x8000100u);
  BOOL result = 0;
  if (CString && buffer[0] == 84)
  {
    unsigned int v7 = buffer[1] - 80;
    BOOL v8 = v7 > 0x23;
    uint64_t v9 = (1LL << v7) & 0x901AA0001LL;
    BOOL v10 = v8 || v9 == 0;
    return v14 == a3 && v15 == 0;
  }

  return result;
}

- (BOOL)fourCharCodeNeedsPMUtcal:(__CFString *)a3
{
  if (!a3) {
    goto LABEL_7;
  }
  int CString = CFStringGetCString(a3, buffer, 16LL, 0x8000100u);
  if (CString)
  {
    LOBYTE(CString) = 0;
    if (buffer[0] == 84 && buffer[1] == 80)
    {
      if (v6 != 100 && v6 - 65 > 0x19)
      {
LABEL_7:
        LOBYTE(CString) = 0;
        return CString;
      }

      LOBYTE(CString) = v7 == 0;
    }
  }

  return CString;
}

- (BOOL)mitigationsFullyReleased
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(listofComponentControl);
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

  return 1;
}

- (int)getChargerState
{
  return self->_chargerState;
}

- (void)registerDisplayNotification
{
  thermalQueue = (dispatch_queue_s *)self->_thermalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100033418;
  v4[3] = &unk_100060BB8;
  objc_copyWeak(&v5, &location);
  sub_100022F34("com.apple.iokit.hid.displayStatus", &self->_displayToken, thermalQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)registerChargerNotification
{
  thermalQueue = (dispatch_queue_s *)self->_thermalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100033530;
  v4[3] = &unk_100060BB8;
  objc_copyWeak(&v5, &location);
  sub_100022F34("com.apple.system.powermanagement.poweradapter", &self->_chargerToken, thermalQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)clearControlEffortOverrides
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)i) setAllowCEOverride:0];
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
    }

    while (v5);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (j = 0LL; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(listofComponentControl);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)j) setAllowCEOverride:0];
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
    }

    while (v10);
  }

- (void)clearLoadingIndexOverrides
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(listofComponentControl);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)i) setAllowLIOverride:0];
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }

- (void)createConnectionToCT
{
}

- (void)evaluteMitigationMaxLoadingIndex
{
  if (byte_10007CB31)
  {
    -[CommonProduct handleMCSThermalPressure](self, "handleMCSThermalPressure");
    -[CommonProduct emitThermalTrendNotifications](self, "emitThermalTrendNotifications");
    return;
  }

  int v3 = -[CommonProduct getHighestSkinTemp](self, "getHighestSkinTemp");
  self->thermalState = v3;
  if (v3 == 1)
  {
    self->thermalTrap = 1;
    uint64_t v4 = 12LL;
    goto LABEL_7;
  }

  if (v3 == 2)
  {
    self->thermalTrap = 1;
    uint64_t v4 = 16LL;
LABEL_7:
    qword_10007CB28 = v4;
    goto LABEL_12;
  }

  else {
    unint64_t componentThermalStatusLevel = 11LL;
  }
  qword_10007CB28 = componentThermalStatusLevel;
  uint64_t v4 = -[CommonProduct getPotentialForcedThermalLevel:](self, "getPotentialForcedThermalLevel:");
  qword_10007CB28 = v4;
  self->thermalTrap = 0;
LABEL_12:
  id v6 = sub_100019824(v4);
  self->thermalPressureLevel = (int64_t)v6;
  if (v6 != (id)self->previousThermalPressureLevel)
  {
    __int128 v7 = +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance");
    -[TGraphSampler updatePowerlogLiteMode:pressureLevel:]( v7,  "updatePowerlogLiteMode:pressureLevel:",  qword_10007CB28,  self->thermalPressureLevel);
    -[TGraphSampler updateAppleCareState:value:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "updateAppleCareState:value:",  1LL,  LODWORD(self->thermalPressureLevel));
    self->previousThermalPressureLevel = self->thermalPressureLevel;
  }

  if (qword_10007CB28 != self->previousOSThermalNotificationLevel)
  {
    if (byte_1000748C0) {
      sub_1000197DC(qword_10007CB28);
    }
    if (!self->needsAppleConnectThermalTrapLogging) {
      goto LABEL_25;
    }
    unint64_t previousOSThermalNotificationLevel = self->previousOSThermalNotificationLevel;
    if (previousOSThermalNotificationLevel > 0xB || (unint64_t)qword_10007CB28 <= 0xB)
    {
      __int128 v9 = @"ThermalUIAlertExit";
    }

    else
    {
      __int128 v9 = @"ThermalUIAlertEnter";
    }

    -[CommonProduct logTrapEntryForAC:](self, "logTrapEntryForAC:", v9);
LABEL_25:
    self->unint64_t previousOSThermalNotificationLevel = qword_10007CB28;
    __int128 v10 = +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance");
    -[TGraphSampler updatePowerlogMiscState:value:]( v10,  "updatePowerlogMiscState:value:",  0LL,  qword_10007CB28);
  }

- (void)handleMCSThermalPressure
{
  signed int v2 = -[SensorDispatcherHelper getValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getValueFromSMCForKey:",  @"mTPL");
  if (v2 != dword_10007CAE0 && v2 != -12700 && v2 != -1)
  {
    int v9 = v2;
    sub_100019860(v2);
    dword_10007CAE0 = v9;
    __int128 v10 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      int v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> mTPL = %d", (uint8_t *)&v15, 8u);
    }
  }

  signed int v5 = -[SensorDispatcherHelper getValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getValueFromSMCForKey:",  @"mTLL");
  int v6 = dword_10007CAE4;
  if (v5 != dword_10007CAE4 && v5 != -12700 && v5 != -1)
  {
    int v12 = v5;
    sub_100019870(v5);
    dword_10007CAE4 = v12;
    __int128 v13 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> mTLL = %d", (uint8_t *)&v15, 8u);
      int v6 = dword_10007CAE4;
    }

    else
    {
      int v6 = v12;
    }
  }

  qword_10007CB28 = v6;
  sub_100019D24();
}

- (void)emitThermalTrendNotifications
{
  unsigned int v2 = -[SensorDispatcherHelper getValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getValueFromSMCForKey:",  @"mTTT");
  unsigned int v3 = -[SensorDispatcherHelper getValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getValueFromSMCForKey:",  @"mTRC");
  int v4 = v3;
  if (v2 != dword_10007CAE8)
  {
    if (v2 == -1) {
      return;
    }
    goto LABEL_9;
  }

  if (v3 != dword_10007CAEC && v2 != -1)
  {
LABEL_9:
    [(id)qword_10007CB38 updatetimeToMitigateNotification:v2 AndReasonCode:v3];
    dword_10007CAE8 = v2;
    dword_10007CAEC = v4;
    int v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      __int16 v8 = 1024;
      int v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> Time to Mitigate = %d, Mitigation reason code = %d",  (uint8_t *)v7,  0xEu);
    }
  }

- (void)emitThermalMitigationNotifications
{
  int v3 = (int)v2;
  if (dword_10007CAF0 != (int)v2 && v3 != -1)
  {
    [(id)qword_10007CB38 updateThermalMitigationNotification:(int)v2];
    dword_10007CAF0 = v3;
    signed int v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Thermal Mitigation = %d",  (uint8_t *)v7,  8u);
      int v6 = dword_10007CAF0;
    }

    else
    {
      int v6 = v3;
    }

    kdebug_trace(728039452LL, v6, v3, 0LL, 0LL);
  }

- (void)logTrapEntryForAC:(id)a3
{
  int v3 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", a3, 0LL);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", GetThermalState());
  logEventForAppleCare(v3);
}

- (id)findComponent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(listOfSupervisorControl);
      }
      __int128 v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
      if (v7 == (id)++v9)
      {
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    listofComponentControl = self->listofComponentControl;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
LABEL_11:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(listofComponentControl);
        }
        __int128 v10 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (v13 == (id)++v15)
        {
          id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
          __int128 v10 = 0LL;
          if (v13) {
            goto LABEL_11;
          }
          return v10;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v10;
}

- (void)getAllComponentID:(__SCPreferences *)a3
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(listofComponentControl);
        }
        CFArrayAppendValue(Mutable, [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) nameofComponent]);
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v8);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        CFArrayAppendValue(Mutable, [*(id *)(*((void *)&v16 + 1) + 8 * (void)j) nameofComponent]);
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v13);
  }

  SCPreferencesSetValue(a3, @"listComponentID_CLTMV2", Mutable);
  SCPreferencesCommitChanges(a3);
  CFRelease(Mutable);
}

- (int)getCurrentMaxLIForComponent:(unsigned int)a3
{
  return objc_msgSend( -[CommonProduct findComponent:](self, "findComponent:", *(void *)&a3),  "getReleaseMaxLI");
}

- (id)newBacklightComponentController:(__CFDictionary *)a3
{
  return -[BackLightCCSingle initWithParams:](objc_alloc(&OBJC_CLASS___BackLightCCSingle), "initWithParams:", a3);
}

- (void)enableSendingMaxTempToDisplayDriver
{
  self->sendMaxTemp = 1;
}

- (BOOL)isSendingMaxTempToDisplayDriverEnabled
{
  return self->sendMaxTemp;
}

- (iir_filter_t)getFilterValues
{
  return -[HidSensors getFilterTable]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getFilterTable");
}

- (int)getHighestSkinTemp
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(listOfSupervisorControl);
      }
      unsigned int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) getThermalStateofHotspot];
      if (v8 > v5) {
        unsigned int v5 = v8;
      }
    }

    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  }

  while (v4);
  return v5;
}

- (unint64_t)getMaxSensorValue
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v3)
  {
    id v4 = v3;
    unsigned int v5 = 0LL;
    uint64_t v6 = *(void *)v14;
    float v7 = 100.0;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        [v9 calculateTargetDifference];
        if (v10 < v7)
        {
          unsigned int v5 = v9;
          float v7 = v10;
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v4);
  }

  else
  {
    unsigned int v5 = 0LL;
  }

  [v5 hotspotTemperature];
  return (unint64_t)(float)(v11 * 100.0);
}

- (int)maxControlEffort
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (!v3) {
    return 0x80000000;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v11;
  int v6 = 0x80000000;
  do
  {
    for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(listOfSupervisorControl);
      }
      signed int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) controlEffort];
      if (v6 <= v8) {
        int v6 = v8;
      }
    }

    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  }

  while (v4);
  return v6;
}

- (BOOL)isInternalInstall
{
  if (qword_10007CAF8 != -1) {
    dispatch_once(&qword_10007CAF8, &stru_100061B20);
  }
  return byte_10007CAF4;
}

- (void)probeAllSupervisorControlLoadingIndex
{
}

- (int)totalSensors
{
  return self->_totalSensorCount;
}

- (int)powerSensors
{
  return self->_powerSensorCount;
}

- (void)tryTakeAction
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(listofComponentControl);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)i) testLoadingIndexLevel];
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listofComponentControl,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[CPMSHelper publishDetailedMitigationArrayToCPMS]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "publishDetailedMitigationArrayToCPMS");
  -[ArcController update](self->_arcController, "update");
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003F11C();
  }
}

- (int)compute2DGridTemps
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003F148();
  }
  return 0LL;
}

- (int)computeMaxCGTemp
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003F174();
  }
  return -1;
}

- (void)updatePowerzoneTelemetry
{
}

- (int)getFrontDisplayCenterTemperature
{
  return 3500;
}

- (id)getGridX
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003F1A0();
  }
  return 0LL;
}

- (id)getGridY
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003F1CC();
  }
  return 0LL;
}

- (void)updateAccessories:(BOOL)a3
{
}

- (void)updateLifetimeServo
{
  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController) {
    -[LifetimeServoController updateForTempMax:tempAverage:]( lifetimeServoController,  "updateForTempMax:tempAverage:",  -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax"),  -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage"));
  }
}

- (void)overrideLifetimeServoParam:(id)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController) {
    -[LifetimeServoController overrideParam:value:](lifetimeServoController, "overrideParam:value:", a3, *(void *)&a4);
  }
  lifetimeServoStatePersistence = self->lifetimeServoStatePersistence;
  if (lifetimeServoStatePersistence) {
    -[LifetimeServoStatePersistence overrideParam:value:](lifetimeServoStatePersistence, "overrideParam:value:", a3, v4);
  }
}

- (void)updateContextualClamp
{
  contextualClampController = self->contextualClampController;
  if (contextualClampController) {
    -[ContextualClampController update](contextualClampController, "update");
  }
}

- (int)dieTempMaxMax
{
  return sub_100023664(self->_maximumDieTempSensorIndexSet, dword_10007D05C, 0);
}

- (int)dieTempMaxAverage
{
  return sub_100023664(self->_averageDieTempSensorIndexSet, dword_10007D05C, 0);
}

- (int)dieTempFilteredMaxAverage
{
  filteredAverageDieTempSensorIndexSet = self->_filteredAverageDieTempSensorIndexSet;
  if (filteredAverageDieTempSensorIndexSet) {
    LODWORD(filteredAverageDieTempSensorIndexSet) = sub_100023664( filteredAverageDieTempSensorIndexSet,  dword_10007D05C,  byte_10007CF58);
  }
  return (int)filteredAverageDieTempSensorIndexSet;
}

- (int)gasGaugeBatteryTemperature
{
  return 3000;
}

- (int)arcModuleTemperature
{
  return 3000;
}

- (int)arcVirtualTemperature
{
  return 3000;
}

- (void)overrideArcParam:(id)a3 value:(int)a4
{
}

- (void)updateControlEffortFor:(int)a3 :(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = -[CommonProduct findComponent:](self, "findComponent:");
  if (v7)
  {
    __int128 v8 = v7;
    [v7 setControlEffort:v4];
    [v8 setAllowCEOverride:1];
  }

  id v9 = -[CommonProduct findComponent:](self, "findComponent:", v5);
  if (v9)
  {
    __int128 v10 = v9;
    [v9 setControlEffort:v4];
    [v10 setAllowCEOverride:1];
  }

- (void)updateHotSpotPIDTargetFor:(int)a3 :(unsigned int)a4
{
  id v5 = -[CommonProduct findComponent:](self, "findComponent:", *(void *)&a3);
  *(float *)&double v6 = (float)a4 / 100.0;
  [v5 overrideTargetTemperature:v6];
}

- (void)removeHotspotTargetOverrides
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)i) resetTargetTemperature];
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }

- (void)applyAlternateHotSpotTargets:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) applyAlternateTarget:v3];
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }

- (void)updateMaxLIFor:(int)a3 :(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = -[CommonProduct findComponent:](self, "findComponent:", *(void *)&a3);
  if (v5)
  {
    id v6 = v5;
    [v5 setAllowLIOverride:0];
    [v6 setMaxLoadingIndex:v4 releaseIndex:v4];
    [v6 setAllowLIOverride:1];
  }

- (void)updateSleepTargetFor:(int)a3 :(unsigned int)a4
{
  id v5 = -[CommonProduct findComponent:](self, "findComponent:", *(void *)&a3);
  if (v5)
  {
    *(float *)&double v6 = (float)a4 / 100.0;
    objc_msgSend(v5, "setTHERMAL_TRAP_SLEEP:", v6);
  }

- (void)updateTrapTargetFor:(int)a3 :(unsigned int)a4
{
  id v5 = -[CommonProduct findComponent:](self, "findComponent:", *(void *)&a3);
  if (v5)
  {
    *(float *)&double v6 = (float)a4 / 100.0;
    objc_msgSend(v5, "setTHERMAL_TRAP_LOAD:", v6);
  }

- (BOOL)useTcalAdjust:(unsigned int)a3
{
  return (self->_PMUtcalAdjustMask >> a3) & 1;
}

- (unint64_t)getPotentialForcedThermalLevel:(unint64_t)a3
{
  if (byte_1000748C0)
  {
    if (self->canForceThermalLevels)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      listOfSupervisorControl = self->listOfSupervisorControl;
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v6)
      {
        id v7 = v6;
        int v8 = 0;
        int v9 = 0;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(listOfSupervisorControl);
            }
            __int128 v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
            v8 |= [v12 shouldForceThermalLevelForThreshold:0];
            v9 |= [v12 shouldForceThermalLevelForThreshold:1];
          }

          id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        }

        while (v7);
        if (((v9 | v8) & 1) != 0)
        {
          uint64_t v13 = 108LL;
          if ((v9 & 1) != 0) {
            uint64_t v13 = 112LL;
          }
          return *(int *)((char *)&self->super.isa + v13);
        }
      }
    }
  }

  return a3;
}

- (BOOL)getPotentialForcedThermalPressureLevel
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) shouldEnforceLightThermalPressure];
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( listOfSupervisorControl,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v4);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (int)getModeratePressureVersion
{
  return self->moderatePressureToLevelVersion;
}

- (int)sensorIndexFromList:(__CFArray *)a3 fourCharCode:(__CFString *)a4
{
  LODWORD(v4) = -1;
  if (a3 && a4)
  {
    if (CFArrayGetCount(a3) < 1)
    {
LABEL_9:
      LODWORD(v4) = -1;
    }

    else
    {
      CFIndex v4 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v4);
        if (ValueAtIndex)
        {
          Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"4CharCode");
          if (Value)
          {
            if (CFStringCompare(Value, a4, 0LL) == kCFCompareEqualTo) {
              break;
            }
          }
        }

        if (CFArrayGetCount(a3) <= ++v4) {
          goto LABEL_9;
        }
      }
    }
  }

  return v4;
}

- (__CFArray)copyHotspotsArray:(id)a3
{
  id v3 = (__CFArray *)[a3 getConfigurationFor:@"hotspots"];
  CFIndex v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  return v4;
}

- (void)replaceOrAppendHotspotEntry:(__CFDictionary *)a3 existingHotspots:(__CFArray *)a4
{
  newValues = a3;
  Value = (const __CFString *)CFDictionaryGetValue(a3, @"description");
  if (Value)
  {
    id v7 = Value;
    CFIndex Count = CFArrayGetCount(a4);
    if (Count < 1)
    {
LABEL_7:
      CFArrayAppendValue(a4, a3);
    }

    else
    {
      CFIndex v9 = Count;
      CFIndex v10 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a4, v10);
        if (ValueAtIndex)
        {
          __int128 v12 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"description");
          if (CFStringCompare(v12, v7, 0LL) == kCFCompareEqualTo) {
            break;
          }
        }

        if (v9 == ++v10) {
          goto LABEL_7;
        }
      }

      v14.id location = v10;
      v14.length = 1LL;
      CFArrayReplaceValues(a4, v14, (const void **)&newValues, 1LL);
    }
  }

- (void)updateSystemPowerState:(BOOL)a3
{
  BOOL v3 = a3;
  -[ContextAwareThermalManager updateSystemPowerState:]( +[ContextAwareThermalManager sharedInstance](&OBJC_CLASS___ContextAwareThermalManager, "sharedInstance"),  "updateSystemPowerState:",  a3);
  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController) {
    -[LifetimeServoController updateSystemPowerState:](lifetimeServoController, "updateSystemPowerState:", v3);
  }
}

- (BOOL)canSystemSleep
{
  return 1;
}

- (BOOL)shouldSuppressStandardBehaviors:(__CFDictionary *)a3
{
  CFPropertyListRef v4 = CFPreferencesCopyValue( @"FProgramNumber",  @"com.apple.demo-settings",  @"mobile",  kCFPreferencesCurrentHost);
  if (byte_10007CB30)
  {
    int v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFPropertyListRef v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> FContext %@", buf, 0xCu);
    }
  }

  int valuePtr = 0;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue((CFNumberRef)v4, kCFNumberIntType, &valuePtr))
      {
        Value = (const __CFArray *)CFDictionaryGetValue(a3, @"suppressionFContexts");
        if (Value)
        {
          int v8 = Value;
          if (CFArrayGetCount(Value) >= 1)
          {
            CFIndex v9 = 0LL;
            while (1)
            {
              ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v8, v9);
              if (ValueAtIndex)
              {
                *(_DWORD *)buf = 0;
                if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, buf))
                {
                  if (*(_DWORD *)buf == -1 || *(_DWORD *)buf == valuePtr)
                  {
                    BOOL v18 = 1;
                    goto LABEL_29;
                  }
                }

                else
                {
                  uint64_t v13 = (os_log_s *)qword_10007CF50;
                  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                    sub_10003F22C(&v21, v22, v13);
                  }
                }
              }

              else
              {
                __int128 v12 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                  sub_10003F1F8(&v19, v20, v12);
                }
              }

              if (++v9 >= CFArrayGetCount(v8)) {
                goto LABEL_27;
              }
            }
          }

          goto LABEL_37;
        }

        if (!byte_10007CB30)
        {
LABEL_37:
          BOOL v18 = 0;
          goto LABEL_29;
        }

        __int128 v17 = (os_log_s *)qword_10007CF50;
        BOOL v18 = 0;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> no FContext array", buf, 2u);
          goto LABEL_37;
        }

- (int)desiredLoopInterval
{
  self->_reducedRateModeActive = 0;
  return -1;
}

- (int)canaryTempSensorIndex
{
  return -1;
}

- (int)canaryTempThreshold
{
  return -32768;
}

- (int)numberOfFields
{
  return 7;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  else {
    return *(&off_100061B40 + a3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 0:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t v4 = qword_10007CB28;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", v4);
    case 1:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t v4 = 100LL;
      if (!byte_1000748C0) {
        uint64_t v4 = 0LL;
      }
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", v4);
    case 2:
      CFTypeID v6 = kCFAllocatorDefault;
      int64_t thermalPressureLevel = self->thermalPressureLevel;
      return (__CFString *)CFStringCreateWithFormat(v6, 0LL, @"%d", thermalPressureLevel);
    case 3:
      CFTypeID v6 = kCFAllocatorDefault;
      int64_t thermalPressureLevel = self->_chargerState;
      return (__CFString *)CFStringCreateWithFormat(v6, 0LL, @"%d", thermalPressureLevel);
    case 4:
      int v8 = kCFAllocatorDefault;
      uint64_t v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
      goto LABEL_13;
    case 5:
      int v8 = kCFAllocatorDefault;
      uint64_t v9 = -[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage");
      goto LABEL_13;
    case 6:
      int v8 = kCFAllocatorDefault;
      uint64_t v9 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
LABEL_13:
      BOOL result = (__CFString *)CFStringCreateWithFormat(v8, 0LL, @"%d", v9);
      break;
    default:
      BOOL result = 0LL;
      break;
  }

  return result;
}

- (int)calibrationResistorSensor
{
  return self->calibrationResistorSensor;
}

- (int)calibrationResistorTempDefault
{
  return self->calibrationResistorTempDefault;
}

- (unsigned)requiredCalibrationResistorSamples
{
  return self->requiredCalibrationResistorSamples;
}

- (unint64_t)componentThermalStatusLevel
{
  return self->componentThermalStatusLevel;
}

- (void)setComponentThermalStatusLevel:(unint64_t)a3
{
  self->unint64_t componentThermalStatusLevel = a3;
}

- (NSMutableArray)listofComponentControl
{
  return self->listofComponentControl;
}

- (NSMutableArray)listOfSupervisorControl
{
  return self->listOfSupervisorControl;
}

- (int)thermalState
{
  return self->thermalState;
}

- (void)setThermalState:(int)a3
{
  self->thermalState = a3;
}

- (BOOL)isBackLightOn
{
  return self->_isBackLightOn;
}

- (void)setIsBackLightOn:(BOOL)a3
{
  self->_isBackLightOn = a3;
}

- (int)displayToken
{
  return self->_displayToken;
}

- (void)setDisplayToken:(int)a3
{
  self->_displayToken = a3;
}

- (int)chargerToken
{
  return self->_chargerToken;
}

- (void)setChargerToken:(int)a3
{
  self->_chargerToken = a3;
}

- (int)chargerState
{
  return self->_chargerState;
}

- (void)setChargerState:(int)a3
{
  self->_chargerState = a3;
}

- (OS_dispatch_queue)thermalQueue
{
  return self->_thermalQueue;
}

- (void)setThermalQueue:(id)a3
{
}

- (int64_t)thermalPressureLevel
{
  return self->thermalPressureLevel;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (BOOL)isCPMSMitigationEnabled
{
  return self->_isCPMSMitigationEnabled;
}

- (void)setIsCPMSMitigationEnabled:(BOOL)a3
{
  self->_isCPMSMitigationEnabled = a3;
}

@end