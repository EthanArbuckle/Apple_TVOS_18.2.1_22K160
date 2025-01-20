@interface ContextualClampController
- (BOOL)isFrontCameraPowered;
- (BOOL)isRearCameraPowered;
- (ContextualClampController)init;
- (ContextualClampController)initWithParams:(id)a3 backlightController:(id)a4 product:(id)a5;
- (OS_dispatch_queue)clampQueue;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)frontCameraPowerStateToken;
- (int)numberOfFields;
- (int)oasisStateToken;
- (int)odeonStateToken;
- (int)rearCameraPowerStateToken;
- (int)rearSuperWideCameraPowerStateToken;
- (int)rearTeleCameraPowerStateToken;
- (void)handleFrontCameraPowerStateNotification:(unint64_t)a3;
- (void)handleOasisStateNotification:(unint64_t)a3;
- (void)handleOdeonStateNotification:(unint64_t)a3;
- (void)handleRearCameraPowerStateNotification:(unint64_t)a3;
- (void)setClampQueue:(id)a3;
- (void)setFrontCameraPowerStateToken:(int)a3;
- (void)setOasisStateToken:(int)a3;
- (void)setOdeonStateToken:(int)a3;
- (void)setRearCameraPowerStateToken:(int)a3;
- (void)setRearSuperWideCameraPowerStateToken:(int)a3;
- (void)setRearTeleCameraPowerStateToken:(int)a3;
- (void)update;
- (void)updateInternal;
- (void)updateMaxLIFloorsAndCeilings;
- (void)updatePackageFloorsAndCeilings:(BOOL)a3;
@end

@implementation ContextualClampController

- (ContextualClampController)init
{
  return -[ContextualClampController initWithParams:backlightController:product:]( self,  "initWithParams:backlightController:product:",  0LL,  0LL,  0LL);
}

- (ContextualClampController)initWithParams:(id)a3 backlightController:(id)a4 product:(id)a5
{
  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___ContextualClampController;
  v8 = -[ContextualClampController init](&v68, "init");
  v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_product = (CommonProduct *)a5;
  v8->_backlightController = (BackLightCC *)a4;
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.ThermalMonitor.context.clamp", 0LL);
  v9->_odeonFloorCPUPower = 0;
  v9->_clampQueue = (OS_dispatch_queue *)v10;
  v9->_frontCameraPowered = 0;
  v9->_odeonEnabled = 0;
  v9->_oasisEnabled = 0;
  v9->_oasisFloorCPUPower = 0;
  unsigned int v11 = [(id)qword_10007D4E0 requestListID];
  v9->_cameraFloorCPU = 0;
  v9->_mitigationControllerListID = v11;
  v9->_cameraFloorGPU = 0;
  v9->_cameraFloorPackagePower = 0;
  v9->_usesPackagePowerControl = 0;
  v9->_coldPressureState = 0LL;
  *(void *)&v9->_lowTempPerfCapCPU = 0x6400000064LL;
  v9->_lowTempPerfCapBL = 100;
  v9->_lowTempPPMBaseline = 100;
  *(void *)&v9->_int syntheticSOCType = 0LL;
  v9->_ppmService = 0;
  v9->_cameraFloorDetails = 0LL;
  v9->_hasCameraFloorDetails = 0;
  *(void *)((char *)&v9->_lowTempSyntheticSOC + 1) = 0LL;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003CB98();
    }
    BOOL v57 = 0;
    goto LABEL_82;
  }

  sub_100020FE0((CFDictionaryRef)a3, @"cameraFloorCPU", kCFNumberIntType, &v9->_cameraFloorCPU);
  sub_100020FE0((CFDictionaryRef)a3, @"cameraFloorGPU", kCFNumberIntType, &v9->_cameraFloorGPU);
  sub_100020FE0((CFDictionaryRef)a3, @"cameraFloorPackagePower", kCFNumberIntType, &v9->_cameraFloorPackagePower);
  if (v9->_cameraFloorPackagePower >= 1) {
    v9->_usesPackagePowerControl = 1;
  }
  sub_100020FE0((CFDictionaryRef)a3, @"odFloorCPU", kCFNumberIntType, &v9->_odeonFloorCPUPower);
  sub_100020FE0((CFDictionaryRef)a3, @"oasisFloorCPU", kCFNumberIntType, &v9->_oasisFloorCPUPower);
  if (sub_100020F6C((const __CFDictionary *)a3, @"usesCameraFloorPackageDetails", 0LL))
  {
    v12 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: using detailed budgets for package power camera floor",  buf,  2u);
    }

    v9->_cameraFloorDetails = 0x63616D666C6F6F72LL;
    v9->_hasCameraFloorDetails = 1;
  }

  BOOL v57 = sub_100020F6C((const __CFDictionary *)a3, @"usesFrontCameraFloors", 0LL);
  v9->_BOOL isAgeAware = [a3 objectForKey:@"isAgeAware"] != 0;
  id v13 = [a3 valueForKey:@"useWeightedRa"];
  v9->_deviceUsesWeightedRa = v13 != 0LL;
  v14 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAgeAware = v9->_isAgeAware;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v70 = isAgeAware;
    *(_WORD *)&v70[4] = 1024;
    *(_DWORD *)&v70[6] = v13 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: isAgeAware %d useWeightedRa %d\n",  buf,  0xEu);
  }

  v9->_backlightCapIsSoft = v9->_isAgeAware;
  id v16 = [a3 objectForKey:@"lowParamsBL"];
  if (v16) {
    v9->_lowTempClampBL = -[TableDrivenLowTempController initWithParams:]( objc_alloc(&OBJC_CLASS___TableDrivenLowTempController),  "initWithParams:",  v16);
  }
  id v17 = [a3 objectForKey:@"batteryParams"];
  if (!v17)
  {
    if (byte_10007CB30)
    {
      v20 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "<Notice> No Battery parameters set for platform",  buf,  2u);
      }
    }

    goto LABEL_32;
  }

  if (byte_10007CB30)
  {
    v18 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v70 = "-[ContextualClampController initWithParams:backlightController:product:]";
      *(_WORD *)&v70[8] = 2112;
      id v71 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s Aging Controller params: %@",  buf,  0x16u);
    }
  }

  if ([v17 objectForKey:@"usesAgingController"]
    && objc_msgSend( objc_msgSend(v17, "objectForKeyedSubscript:", @"usesAgingController"),  "BOOLValue")
    && (sub_100022B88() & 1) == 0)
  {
    v21 = objc_alloc(&OBJC_CLASS___AgingController);
    uint64_t v22 = sub_1000224A0();
    v9->_agingController = -[AgingController initWithParams:currentWRa:currentUPOCount:]( v21,  "initWithParams:currentWRa:currentUPOCount:",  v17,  v22,  sub_1000229C4());
  }

  else
  {
    v19 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "<Notice> Aging controller disabled for platform",  buf,  2u);
    }
  }

  id v23 = [v17 objectForKey:@"wRaP0LimitsPerChemId"];
  if (!v23)
  {
LABEL_32:
    uint64_t v27 = 500LL;
    goto LABEL_38;
  }

  uint64_t v24 = sub_100022470();
  id v25 = objc_msgSend( v23,  "objectForKey:",  -[NSNumber stringValue]( +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v24),  "stringValue"));
  if (v25)
  {
    signed int v26 = [v25 intValue];
  }

  else
  {
    id v28 = [v23 objectForKeyedSubscript:@"-1"];
    v29 = (os_log_s *)qword_10007CF50;
    BOOL v30 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v28)
    {
      if (v30) {
        sub_10003CE24(v24, v29, v31, v32, v33, v34, v35, v36);
      }
      uint64_t v27 = -1LL;
      goto LABEL_38;
    }

    if (v30) {
      sub_10003CE88(v24, v29, v31, v32, v33, v34, v35, v36);
    }
    signed int v26 = [v28 intValue];
  }

  uint64_t v27 = v26;
LABEL_38:
  if (notify_register_check("com.apple.system.batteryHealth.p0Threshold", (int *)&out_token))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003CDB8();
    }
  }

  else
  {
    if (notify_set_state((int)out_token, v27))
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003CD4C();
      }
    }

    else
    {
      notify_post("com.apple.system.batteryHealth.p0Threshold");
    }

    if (byte_10007CB30)
    {
      v37 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v70 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "<Notice> p0Threshold set to %llu\n",  buf,  0xCu);
      }
    }
  }

  if (notify_register_check("com.apple.system.batteryHealth.UPOAware", &v67))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003CCE0();
    }
  }

  else
  {
    if (notify_set_state(v67, 0x4E4FuLL))
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003CC74();
      }
    }

    else
    {
      notify_post("com.apple.system.batteryHealth.UPOAware");
    }

    if (byte_10007CB30)
    {
      v38 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "<Notice> Battery Health is influenced by UPO mitigation count",  buf,  2u);
      }
    }
  }

  sub_100020FE0((CFDictionaryRef)a3, @"syntheticSOCType", kCFNumberIntType, &v9->_syntheticSOCType);
  if (byte_10007CB30)
  {
    v39 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int syntheticSOCType = v9->_syntheticSOCType;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v70 = syntheticSOCType;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: syntheticSOCType %d",  buf,  8u);
    }
  }

  id v41 = [a3 objectForKey:@"lowParamsStrobe"];
  if (v41)
  {
    v42 = -[TableDrivenLowTempController initWithParams:]( objc_alloc(&OBJC_CLASS___TableDrivenLowTempController),  "initWithParams:",  v41);
    v9->_lowTempClampStrobe = v42;
    if (v42)
    {
      v43 = IOServiceMatching("AppleDieTempController");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v43);
      v9->_strobeService = MatchingService;
      if (!MatchingService)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003CC48();
        }

        v9->_lowTempClampStrobe = 0LL;
      }
    }
  }

  id v45 = [a3 objectForKey:@"lowParamsPPMBaseline"];
  if (v45)
  {
    v46 = -[TableDrivenLowTempController initWithParams:]( objc_alloc(&OBJC_CLASS___TableDrivenLowTempController),  "initWithParams:",  v45);
    v9->_lowTempClampPPMBaseline = v46;
    if (v46)
    {
      v47 = IOServiceMatching("ApplePPM");
      io_service_t v48 = IOServiceGetMatchingService(kIOMainPortDefault, v47);
      v9->_ppmService = v48;
      if (!v48)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003CC1C();
        }

        v9->_lowTempClampPPMBaseline = 0LL;
      }
    }
  }

  unsigned int v49 = sub_100020E9C("IOPMPowerSource", @"BatteryInstalled", kCFBooleanTrue);
  v9->_chargerService = v49;
  if (!v49 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003CBF0();
  }
  v50 = (const __CFDictionary *)[a3 objectForKey:@"lowNotificationLimits"];
  v51 = v50;
  if (v50)
  {
    sub_100020FE0(v50, @"tempLimit1", kCFNumberIntType, &v9->_coldThresholdModerate);
    sub_100020FE0(v51, @"tempLimit2", kCFNumberIntType, &v9->_coldThresholdHeavy);
    sub_100020FE0(v51, @"tempLimitHysteresis", kCFNumberIntType, &v9->_coldThresholdHysteresis);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003CBC4();
  }

  id v52 = [a3 objectForKey:@"lowParamsPeakPower"];
  if (v52) {
    v9->_lowTempClampPeakPowerPressure = -[TableDrivenLowTempController initWithParams:]( objc_alloc(&OBJC_CLASS___TableDrivenLowTempController),  "initWithParams:",  v52);
  }
LABEL_82:
  objc_initWeak((id *)buf, v9);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_100025408;
  v65[3] = &unk_100060BB8;
  objc_copyWeak(&v66, (id *)buf);
  sub_100022F34( "com.apple.isp.backcamerapower",  &v9->_rearCameraPowerStateToken,  (dispatch_queue_s *)v9->_clampQueue,  v65);
  sub_100022F34( "com.apple.isp.backtelecamerapower",  &v9->_rearTeleCameraPowerStateToken,  (dispatch_queue_s *)v9->_clampQueue,  v65);
  sub_100022F34( "com.apple.isp.backsuperwidecamerapower",  &v9->_rearSuperWideCameraPowerStateToken,  (dispatch_queue_s *)v9->_clampQueue,  v65);
  if (v57)
  {
    objc_initWeak(&out_token, v9);
    clampQueue = (dispatch_queue_s *)v9->_clampQueue;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_100025458;
    v62[3] = &unk_100060BB8;
    objc_copyWeak(&v63, &out_token);
    sub_100022F34("com.apple.isp.frontcamerapower", &v9->_frontCameraPowerStateToken, clampQueue, v62);
    objc_destroyWeak(&v63);
    objc_destroyWeak(&out_token);
  }

  if (notify_register_check("com.apple.system.thermalpressurelevel.cold", &v9->_coldPressureNotificationToken)
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003CB6C();
  }

  if (v9->_odeonFloorCPUPower >= 1)
  {
    objc_initWeak(&out_token, v9);
    v54 = (dispatch_queue_s *)v9->_clampQueue;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_1000254A8;
    v60[3] = &unk_100060BB8;
    objc_copyWeak(&v61, &out_token);
    sub_100022F34("com.apple.odeon.lla", &v9->_odeonStateToken, v54, v60);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&out_token);
  }

  if (v9->_oasisFloorCPUPower >= 1)
  {
    objc_initWeak(&out_token, v9);
    v55 = (dispatch_queue_s *)v9->_clampQueue;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_1000254F8;
    v58[3] = &unk_100060BB8;
    objc_copyWeak(&v59, &out_token);
    sub_100022F34("com.apple.airplay.oasis", &v9->_oasisStateToken, v55, v58);
    objc_destroyWeak(&v59);
    objc_destroyWeak(&out_token);
  }

  -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v9);
  objc_destroyWeak(&v66);
  objc_destroyWeak((id *)buf);
  return v9;
}

- (void)update
{
  if (self->_product)
  {
    clampQueue = (dispatch_queue_s *)self->_clampQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000255A8;
    block[3] = &unk_1000614D0;
    block[4] = self;
    dispatch_async(clampQueue, block);
  }

- (void)updateInternal
{
  uint64_t v3 = -[CommonProduct gasGaugeBatteryTemperature](self->_product, "gasGaugeBatteryTemperature");
  uint64_t v4 = sub_100021CC8();
  self->_lowTempSyntheticSOC = v4;
  if (self->_syntheticSOCType == 1)
  {
    int v5 = sub_100021DE8();
    int v6 = (int)((double)v5 * 0.4 + (double)(int)v4 * 0.6 + 0.5);
    self->_lowTempSyntheticSOC = v6;
    if (byte_10007CB30)
    {
      int v7 = v5;
      v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)cf = 67109632;
        *(_DWORD *)&cf[4] = v4;
        *(_WORD *)&cf[8] = 1024;
        *(_DWORD *)&cf[10] = v7;
        __int16 v47 = 1024;
        int v48 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: UI SOC %d, GG SOC %d ==> synthetic SOC %d",  cf,  0x14u);
      }
    }
  }

  agingController = self->_agingController;
  if (agingController)
  {
    uint64_t v10 = sub_1000229C4();
    -[AgingController takeActionOnUPO:forWRa:](agingController, "takeActionOnUPO:forWRa:", v10, sub_1000224A0());
  }

  if (self->_isAgeAware)
  {
    if (self->_deviceUsesWeightedRa)
    {
      if (byte_10007CB30)
      {
        unsigned int v11 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)cf = 136315138;
          *(void *)&cf[4] = "-[ContextualClampController updateInternal]";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s Using weighted Ra\n",  cf,  0xCu);
        }
      }

      uint64_t v12 = sub_1000224A0();
    }

    else
    {
      if (byte_10007CB30)
      {
        v14 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)cf = 136315138;
          *(void *)&cf[4] = "-[ContextualClampController updateInternal]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> %s Using max Ra\n", cf, 0xCu);
        }
      }

      uint64_t v12 = sub_10002266C();
    }

    uint64_t v13 = v12;
    self->_int batteryRaValueTrue = v12;
    int v15 = sub_1000229C4();
    int v16 = v15;
    if (dword_1000749C8 < 0) {
      dword_1000749C8 = v15;
    }
    if (byte_10007CB30)
    {
      id v17 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int batteryRaValueTrue = self->_batteryRaValueTrue;
        *(_DWORD *)cf = 67109888;
        *(_DWORD *)&cf[4] = batteryRaValueTrue;
        *(_WORD *)&cf[8] = 1024;
        *(_DWORD *)&cf[10] = v13;
        __int16 v47 = 1024;
        int v48 = v13;
        __int16 v49 = 1024;
        int v50 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: Ra true %d, effective Ra %d, effective Max Ra %d, count %d",  cf,  0x1Au);
      }
    }

    if (!v16) {
      goto LABEL_26;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  lowTempClampBL = self->_lowTempClampBL;
  if (!lowTempClampBL)
  {
LABEL_26:
    int v20 = 100;
    goto LABEL_27;
  }

  int v20 = -[TableDrivenLowTempController outputForBatteryTemperature:stateOfCharge:batteryRaValue:]( lowTempClampBL,  "outputForBatteryTemperature:stateOfCharge:batteryRaValue:",  v3,  v4,  v13);
LABEL_27:
  if (self->_lowTempPerfCapCPU != 100
    || self->_lowTempPerfCapGPU != 100
    || v20 != self->_lowTempPerfCapBL
    || self->_lowTempPerfCapCPULegacy != 100)
  {
    self->_lowTempPerfCapGPU = 100;
    self->_lowTempPerfCapBL = v20;
    *(void *)&self->_lowTempPerfCapCPULegacy = 0x6400000064LL;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }

  unint64_t coldPressureState = self->_coldPressureState;
  if (coldPressureState != 30)
  {
    if (coldPressureState == 20)
    {
      if ((int)v3 <= self->_coldThresholdHeavy)
      {
LABEL_47:
        unint64_t v22 = 30LL;
        goto LABEL_51;
      }

      unint64_t coldPressureState = 20LL;
      else {
        unint64_t v22 = 0LL;
      }
    }

    else
    {
      if (!coldPressureState)
      {
        if ((int)v3 > self->_coldThresholdHeavy)
        {
          unint64_t coldPressureState = 0LL;
          else {
            unint64_t v22 = 0LL;
          }
          goto LABEL_50;
        }

        goto LABEL_47;
      }

      uint64_t v24 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)cf = 134217984;
        *(void *)&cf[4] = coldPressureState;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "<Error> Clamp: unexpected cold state %lld",  cf,  0xCu);
        unint64_t v22 = 0LL;
        unint64_t coldPressureState = self->_coldPressureState;
      }

      else
      {
        unint64_t v22 = 0LL;
      }
    }

- (void)updateMaxLIFloorsAndCeilings
{
  if (byte_1000748C0)
  {
    if (self->_rearCameraPowered || self->_frontCameraPowered)
    {
      uint64_t cameraFloorGPU = self->_cameraFloorGPU;
      uint64_t v4 = 1LL;
    }

    else
    {
      uint64_t v4 = 0LL;
      uint64_t cameraFloorGPU = 0LL;
    }

    if (self->_odeonEnabled)
    {
      uint64_t odeonFloorCPUPower = self->_odeonFloorCPUPower;
      if (self->_oasisEnabled)
      {
        int oasisFloorCPUPower = self->_oasisFloorCPUPower;
        else {
          uint64_t odeonFloorCPUPower = odeonFloorCPUPower;
        }
      }
    }

    else
    {
      uint64_t odeonFloorCPUPower = self->_oasisEnabled ? self->_oasisFloorCPUPower : 0LL;
    }

    if (self->_usesPackagePowerControl)
    {
      -[ContextualClampController updatePackageFloorsAndCeilings:](self, "updatePackageFloorsAndCeilings:", v4);
    }

    else
    {
      if (byte_10007CB30)
      {
        int v7 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int cameraFloorCPU = self->_cameraFloorCPU;
          int v18 = 136315394;
          *(void *)v19 = "-[ContextualClampController updateMaxLIFloorsAndCeilings]";
          *(_WORD *)&v19[8] = 1024;
          *(_DWORD *)int v20 = cameraFloorCPU;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: [%s] Setting CPU kDVD1 to floor value%d\n",  (uint8_t *)&v18,  0x12u);
        }
      }

      [(id)qword_10007D4E0 setCPUPowerFloor:odeonFloorCPUPower fromDecisionSource:self->_mitigationControllerListID];
      [(id)qword_10007D4E0 setCPUPowerCeiling:self->_lowTempPerfCapCPU forDVD1Contributor:2];
      [(id)qword_10007D4E0 setCPUPowerCeiling:self->_lowTempPerfCapCPU fromDecisionSource:self->_mitigationControllerListID];
      [(id)qword_10007D4E0 updateCPU];
      [(id)qword_10007D4E0 setGPUPowerFloor:cameraFloorGPU fromDecisionSource:self->_mitigationControllerListID];
      [(id)qword_10007D4E0 setGPUPowerCeiling:self->_lowTempPerfCapGPU fromDecisionSource:self->_mitigationControllerListID];
      [(id)qword_10007D4E0 updateGPU];
    }

    backlightController = self->_backlightController;
    uint64_t lowTempPerfCapBL = self->_lowTempPerfCapBL;
    if (self->_backlightCapIsSoft) {
      -[BackLightCC setMaxLICeilingSoft:](backlightController, "setMaxLICeilingSoft:", lowTempPerfCapBL);
    }
    else {
      -[BackLightCC setMaxLICeiling:](backlightController, "setMaxLICeiling:", lowTempPerfCapBL);
    }
    if (byte_10007CB30)
    {
      unsigned int v11 = (os_log_s *)qword_10007CF50;
      if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      int lowTempPerfCapCPU = self->_lowTempPerfCapCPU;
      int lowTempPerfCapGPU = self->_lowTempPerfCapGPU;
      int v14 = self->_lowTempPerfCapBL;
      BOOL v15 = self->_rearCameraPowered || self->_frontCameraPowered;
      int v18 = 67110400;
      *(_DWORD *)v19 = odeonFloorCPUPower;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = lowTempPerfCapCPU;
      *(_WORD *)int v20 = 1024;
      *(_DWORD *)&v20[2] = cameraFloorGPU;
      __int16 v21 = 1024;
      int v22 = lowTempPerfCapGPU;
      __int16 v23 = 1024;
      int v24 = v14;
      __int16 v25 = 1024;
      BOOL v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: CPU [%d, %d], GPU [%d, %d], BL [%d] (camera %d)",  (uint8_t *)&v18,  0x26u);
      if (byte_10007CB30)
      {
        unsigned int v11 = (os_log_s *)qword_10007CF50;
LABEL_30:
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          BOOL odeonEnabled = self->_odeonEnabled;
          BOOL oasisEnabled = self->_oasisEnabled;
          int v18 = 67109376;
          *(_DWORD *)v19 = odeonEnabled;
          *(_WORD *)&v19[4] = 1024;
          *(_DWORD *)&v19[6] = oasisEnabled;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: Odeon %d Oasis %d",  (uint8_t *)&v18,  0xEu);
        }
      }
    }
  }

- (void)updatePackageFloorsAndCeilings:(BOOL)a3
{
  if (a3) {
    uint64_t cameraFloorPackagePower = self->_cameraFloorPackagePower;
  }
  else {
    uint64_t cameraFloorPackagePower = 0LL;
  }
  if (self->_hasCameraFloorDetails)
  {
    [(id)qword_10007D4E0 setPackagePowerBudgetDirect:cameraFloorPackagePower withDetails:self->_cameraFloorDetails];
  }

  else
  {
    [(id)qword_10007D4E0 setPackagePowerFloor:cameraFloorPackagePower fromDecisionSource:self->_mitigationControllerListID];
    [(id)qword_10007D4E0 updatePackage];
  }

  if (byte_10007CB30)
  {
    uint64_t v4 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = cameraFloorPackagePower;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: PackagePowerFloor [%d]",  (uint8_t *)v5,  8u);
    }
  }

- (void)handleRearCameraPowerStateNotification:(unint64_t)a3
{
  if (byte_10007CB30)
  {
    int v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: rear camera state %lld",  (uint8_t *)&v7,  0xCu);
    }
  }

  BOOL v6 = a3 != 0;
  if (self->_rearCameraPowered != v6)
  {
    self->_rearCameraPowered = v6;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }

- (void)handleFrontCameraPowerStateNotification:(unint64_t)a3
{
  if (byte_10007CB30)
  {
    int v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: front camera state %lld",  (uint8_t *)&v7,  0xCu);
    }
  }

  BOOL v6 = a3 != 0;
  if (self->_frontCameraPowered != v6)
  {
    self->_frontCameraPowered = v6;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }

- (void)handleOdeonStateNotification:(unint64_t)a3
{
  if (byte_10007CB30)
  {
    int v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: Odeon state %lld",  (uint8_t *)&v7,  0xCu);
    }
  }

  BOOL v6 = a3 != 0;
  if (self->_odeonEnabled != v6)
  {
    self->_BOOL odeonEnabled = v6;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }

- (void)handleOasisStateNotification:(unint64_t)a3
{
  if (byte_10007CB30)
  {
    int v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: Oasis state %lld",  (uint8_t *)&v7,  0xCu);
    }
  }

  BOOL v6 = a3 != 0;
  if (self->_oasisEnabled != v6)
  {
    self->_BOOL oasisEnabled = v6;
    -[ContextualClampController updateMaxLIFloorsAndCeilings](self, "updateMaxLIFloorsAndCeilings");
  }

- (BOOL)isRearCameraPowered
{
  return self->_rearCameraPowered;
}

- (BOOL)isFrontCameraPowered
{
  return self->_frontCameraPowered;
}

- (int)numberOfFields
{
  return 10;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  else {
    return off_1000619B0[a3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 0:
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%lld", self->_coldPressureState);
    case 1:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_rearCameraPowered;
      goto LABEL_13;
    case 2:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_lowTempPerfCapCPU;
      goto LABEL_13;
    case 3:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_lowTempPerfCapGPU;
      goto LABEL_13;
    case 4:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_lowTempPerfCapBL;
      goto LABEL_13;
    case 5:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_lowTempSyntheticSOC;
      goto LABEL_13;
    case 6:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_batteryRaValueTrue;
      goto LABEL_13;
    case 7:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_frontCameraPowered;
      goto LABEL_13;
    case 8:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_odeonEnabled;
      goto LABEL_13;
    case 9:
      uint64_t v4 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_oasisEnabled;
LABEL_13:
      result = (__CFString *)CFStringCreateWithFormat(v4, 0LL, @"%d", rearCameraPowered);
      break;
    default:
      result = 0LL;
      break;
  }

  return result;
}

- (int)rearCameraPowerStateToken
{
  return self->_rearCameraPowerStateToken;
}

- (void)setRearCameraPowerStateToken:(int)a3
{
  self->_rearCameraPowerStateToken = a3;
}

- (int)rearTeleCameraPowerStateToken
{
  return self->_rearTeleCameraPowerStateToken;
}

- (void)setRearTeleCameraPowerStateToken:(int)a3
{
  self->_rearTeleCameraPowerStateToken = a3;
}

- (int)rearSuperWideCameraPowerStateToken
{
  return self->_rearSuperWideCameraPowerStateToken;
}

- (void)setRearSuperWideCameraPowerStateToken:(int)a3
{
  self->_rearSuperWideCameraPowerStateToken = a3;
}

- (int)frontCameraPowerStateToken
{
  return self->_frontCameraPowerStateToken;
}

- (void)setFrontCameraPowerStateToken:(int)a3
{
  self->_frontCameraPowerStateToken = a3;
}

- (int)odeonStateToken
{
  return self->_odeonStateToken;
}

- (void)setOdeonStateToken:(int)a3
{
  self->_odeonStateToken = a3;
}

- (int)oasisStateToken
{
  return self->_oasisStateToken;
}

- (void)setOasisStateToken:(int)a3
{
  self->_oasisStateToken = a3;
}

- (OS_dispatch_queue)clampQueue
{
  return self->_clampQueue;
}

- (void)setClampQueue:(id)a3
{
  self->_clampQueue = (OS_dispatch_queue *)a3;
}

@end