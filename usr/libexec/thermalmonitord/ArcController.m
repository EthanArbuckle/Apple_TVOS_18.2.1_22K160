@interface ArcController
- (ArcController)init;
- (ArcController)initWithParams:(id)a3 product:(id)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)overrideParam:(id)a3 value:(int)originalThresholdModuleTemperature;
- (void)update;
- (void)updateInternal;
@end

@implementation ArcController

- (ArcController)init
{
  return -[ArcController initWithParams:product:](self, "initWithParams:product:", 0LL, 0LL);
}

- (ArcController)initWithParams:(id)a3 product:(id)a4
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___ArcController;
  v6 = -[ArcController init](&v35, "init");
  v7 = v6;
  if (v6)
  {
    v6->_product = (CommonProduct *)a4;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ThermalMonitor.arc", 0LL);
    v7->_arcQueue = (OS_dispatch_queue *)v8;
    v7->_mitigationsActive = -1;
    if (!v8)
    {
      v9 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003CB04(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    sub_100020FE0((CFDictionaryRef)a3, @"thresholdModule", kCFNumberIntType, &v7->_thresholdModuleTemperature);
    p_thresholdModuleTemperatureHysteresis = &v7->_thresholdModuleTemperatureHysteresis;
    sub_100020FE0( (CFDictionaryRef)a3,  @"thresholdModuleHysteresis",  kCFNumberIntType,  &v7->_thresholdModuleTemperatureHysteresis);
    p_thresholdVirtualTemperature = &v7->_thresholdVirtualTemperature;
    sub_100020FE0((CFDictionaryRef)a3, @"thresholdVirtual", kCFNumberIntType, &v7->_thresholdVirtualTemperature);
    p_thresholdVirtualTemperatureHysteresis = &v7->_thresholdVirtualTemperatureHysteresis;
    sub_100020FE0( (CFDictionaryRef)a3,  @"thresholdVirtualHysteresis",  kCFNumberIntType,  &v7->_thresholdVirtualTemperatureHysteresis);
    p_gainMitigated = &v7->_gainMitigated;
    sub_100020FE0((CFDictionaryRef)a3, @"gainMitigated", kCFNumberFloatType, &v7->_gainMitigated);
    p_gainUnmitigated = (_DWORD *)&v7->_gainUnmitigated;
    sub_100020FE0((CFDictionaryRef)a3, @"gainUnmitigated", kCFNumberFloatType, &v7->_gainUnmitigated);
    int thresholdModuleTemperature = v7->_thresholdModuleTemperature;
    if (thresholdModuleTemperature <= 0)
    {
      int v25 = *p_thresholdVirtualTemperature;
    }

    else
    {
      int v25 = *p_thresholdVirtualTemperature;
      BOOL v26 = *p_thresholdModuleTemperatureHysteresis < 1 || v25 < 1;
      if (!v26 && *p_thresholdVirtualTemperatureHysteresis >= 1)
      {
        LODWORD(v22) = 1.0;
        if (*p_gainMitigated > 0.0 && *p_gainMitigated <= 1.0)
        {
          LODWORD(v23) = *p_gainUnmitigated;
        }
      }
    }

    v29 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      int v31 = *p_thresholdModuleTemperatureHysteresis;
      int v32 = *p_thresholdVirtualTemperatureHysteresis;
      double v33 = *p_gainMitigated;
      double v34 = *(float *)p_gainUnmitigated;
      *(_DWORD *)buf = 67110400;
      int v37 = thresholdModuleTemperature;
      __int16 v38 = 1024;
      int v39 = v31;
      __int16 v40 = 1024;
      int v41 = v25;
      __int16 v42 = 1024;
      int v43 = v32;
      __int16 v44 = 2048;
      double v45 = v33;
      __int16 v46 = 2048;
      double v47 = v34;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "<Error> Arc control: bad params (%d %d %d %d %.2f %.2f)",  buf,  0x2Eu);
      int thresholdModuleTemperature = v7->_thresholdModuleTemperature;
      int v25 = *p_thresholdVirtualTemperature;
    }

- (void)update
{
  arcQueue = (dispatch_queue_s *)self->_arcQueue;
  if (arcQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100023F54;
    block[3] = &unk_1000614D0;
    block[4] = self;
    dispatch_async(arcQueue, block);
  }

- (void)updateInternal
{
  product = self->_product;
  if (product)
  {
    self->_latestModuleTemperature = -[CommonProduct arcModuleTemperature](product, "arcModuleTemperature");
    int v4 = -[CommonProduct arcVirtualTemperature](self->_product, "arcVirtualTemperature");
    self->_latestVirtualTemperature = v4;
    int thresholdVirtualTemperature = self->_thresholdVirtualTemperature;
    int mitigationsActive = self->_mitigationsActive;
    int thresholdModuleTemperature = self->_thresholdModuleTemperature;
    if (mitigationsActive == 100)
    {
      thresholdModuleTemperature -= self->_thresholdModuleTemperatureHysteresis;
      thresholdVirtualTemperature -= self->_thresholdVirtualTemperatureHysteresis;
    }

    BOOL v8 = self->_latestModuleTemperature <= thresholdModuleTemperature && v4 <= thresholdVirtualTemperature;
    uint64_t v9 = 44LL;
    if (v8)
    {
      uint64_t v9 = 48LL;
      int v10 = 0;
    }

    else
    {
      int v10 = 100;
    }

    if (v10 != mitigationsActive)
    {
      if (byte_10007CB30)
      {
        float v11 = *(float *)((char *)&self->super.isa + v9);
        uint64_t v12 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 134217984;
          double v14 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> Arc control: setting gain %.2f",  (uint8_t *)&v13,  0xCu);
        }
      }

      self->_int mitigationsActive = v10;
      -[TGraphSampler updatePowerlogMiscState:value:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "updatePowerlogMiscState:value:",  6LL,  self->_mitigationsActive);
    }
  }

- (void)overrideParam:(id)a3 value:(int)originalThresholdModuleTemperature
{
  v7 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = a3;
    __int16 v18 = 1024;
    int v19 = originalThresholdModuleTemperature;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Arc control: override (%@, %d)",  (uint8_t *)&v16,  0x12u);
  }

  if ([a3 isEqualToString:@"ArcModuleThresholdKey"])
  {
    if (originalThresholdModuleTemperature == -1) {
      originalThresholdModuleTemperature = self->_originalThresholdModuleTemperature;
    }
    self->_int thresholdModuleTemperature = originalThresholdModuleTemperature;
  }

  else if ([a3 isEqualToString:@"ArcVirtualThresholdKey"])
  {
    if (originalThresholdModuleTemperature == -1) {
      originalThresholdModuleTemperature = self->_originalThresholdVirtualTemperature;
    }
    self->_int thresholdVirtualTemperature = originalThresholdModuleTemperature;
  }

  else
  {
    BOOL v8 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003CB38(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

- (int)numberOfFields
{
  return 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3) {
    return 0LL;
  }
  else {
    return @"Arc-mitigating";
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3) {
    return 0LL;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  self->_mitigationsActive);
  }
}

@end