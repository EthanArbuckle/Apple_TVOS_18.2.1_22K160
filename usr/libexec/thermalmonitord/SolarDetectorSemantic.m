@interface SolarDetectorSemantic
- (BOOL)isContextTriggered;
- (BOOL)synchContext;
- (SolarDetectorSemantic)init;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)getContextState;
- (int)numberOfFields;
- (void)handleBrightnessClientNotification:(id)a3 value:(id)a4;
- (void)initializeSemanticBrightnessHandling;
- (void)processPotentialSolarStateChange:(BOOL)a3;
- (void)setInfoOnlySensorsActive:(BOOL)a3;
- (void)updateCurrentSemanticAmbientLightLevel:(int)a3;
@end

@implementation SolarDetectorSemantic

- (SolarDetectorSemantic)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SolarDetectorSemantic;
  v2 = -[SolarDetectorSemantic init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->super.ctxType = 0;
    v2->super._infoOnlySensorsActive = 0;
    v2->_currentSemanticLux = -127;
    v2->_sunlightState = -1;
    v2->_sunlightStatePrevious = -1;
    v2->_sunlightOverrideState = 0;
    v2->_sunlightOverrideStatePrevious = 0;
    v2->_update_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.solar", 0LL);
    if (notify_register_check("com.apple.system.thermalsunlightstate", &v3->_thermalSunlightStateToken))
    {
      v4 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003A834(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }

    -[SolarDetectorSemantic updateCurrentSemanticAmbientLightLevel:](v3, "updateCurrentSemanticAmbientLightLevel:", 0LL);
    v12 = objc_alloc_init(&OBJC_CLASS___BrightnessSystemClient);
    v3->_brightnessSystemClient = v12;
    if (v12)
    {
      -[SolarDetectorSemantic initializeSemanticBrightnessHandling](v3, "initializeSemanticBrightnessHandling");
    }

    else
    {
      v13 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003A7B4(v13);
      }
    }

    if (byte_10007D470)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  14LL,  @"zETM",  14LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  13LL,  @"zETM",  13LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  12LL,  @"zETM",  12LL);
      *(float *)&dword_10007D1A0 = (float)v3->_currentSemanticAmbientLightLevel;
      *(float *)&dword_10007D1A8 = (float)v3->_currentSemanticLux;
      dword_10007D1A4 = 0;
    }

    -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v3);
  }

  return v3;
}

- (void)initializeSemanticBrightnessHandling
{
  v3 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "SemanticAmbientLightLevel");
  id v4 = -[BrightnessSystemClient copyPropertyForKey:](self->_brightnessSystemClient, "copyPropertyForKey:", v3);
  -[SolarDetectorSemantic handleBrightnessClientNotification:value:]( self,  "handleBrightnessClientNotification:value:",  v3,  v4);

  uint64_t v5 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v3, 0LL);
  brightnessSystemClient = self->_brightnessSystemClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100015E8C;
  v7[3] = &unk_100061610;
  v7[4] = self;
  -[BrightnessSystemClient registerNotificationBlock:forProperties:]( brightnessSystemClient,  "registerNotificationBlock:forProperties:",  v7,  v5);
}

- (void)handleBrightnessClientNotification:(id)a3 value:(id)a4
{
  if (a3 && a4 && !strncmp((const char *)[a3 UTF8String], "SemanticAmbientLightLevel", 0x19uLL))
  {
    if ((objc_opt_respondsToSelector(a4, "intValue") & 1) != 0)
    {
      -[SolarDetectorSemantic updateCurrentSemanticAmbientLightLevel:]( self,  "updateCurrentSemanticAmbientLightLevel:",  [a4 intValue]);
    }

    else
    {
      -[SolarDetectorSemantic updateCurrentSemanticAmbientLightLevel:]( self,  "updateCurrentSemanticAmbientLightLevel:",  0LL);
      if (byte_10007CB30)
      {
        uint64_t v6 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 138412290;
          id v8 = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> brightness callback %@",  (uint8_t *)&v7,  0xCu);
        }
      }
    }
  }

- (int)getContextState
{
  int sunlightOverrideState = self->_sunlightOverrideState;
  if (sunlightOverrideState < 0) {
    return 1;
  }
  if (sunlightOverrideState) {
    return 5;
  }
  return self->_currentSemanticAmbientLightLevel;
}

- (BOOL)isContextTriggered
{
  return -[SolarDetectorSemantic getContextState](self, "getContextState") == 5;
}

- (BOOL)synchContext
{
  if (self->super._infoOnlySensorsActive)
  {
    id v3 = -[BrightnessSystemClient copyPropertyForKey:]( self->_brightnessSystemClient,  "copyPropertyForKey:",  @"TrustedLux");
    if (v3)
    {
      id v4 = v3;
      self->_currentSemanticLux = [v3 intValue];
    }

    else
    {
      self->_currentSemanticLux = -127;
    }
  }

  int v5 = dword_10007CB4C;
  self->_int sunlightOverrideState = dword_10007CB4C;
  if (self->_sunlightOverrideStatePrevious != v5)
  {
    self->_sunlightOverrideStatePrevious = v5;
    update_queue = (dispatch_queue_s *)self->_update_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100016118;
    block[3] = &unk_1000614D0;
    block[4] = self;
    dispatch_async(update_queue, block);
  }

  return 1;
}

- (void)updateCurrentSemanticAmbientLightLevel:(int)a3
{
  update_queue = (dispatch_queue_s *)self->_update_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100016188;
  v4[3] = &unk_100061638;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(update_queue, v4);
}

- (void)processPotentialSolarStateChange:(BOOL)a3
{
  if (self->_currentSemanticAmbientLightLevel) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = !a3;
  }
  if (!v3)
  {
    int v5 = -[SolarDetectorSemantic isContextTriggered](self, "isContextTriggered", a3);
    self->_sunlightState = v5;
    if (self->_sunlightStatePrevious != v5)
    {
      self->_sunlightStatePrevious = v5;
      uint64_t v6 = +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance");
      if (self->_sunlightState) {
        uint64_t v7 = 100LL;
      }
      else {
        uint64_t v7 = 0LL;
      }
      -[TGraphSampler updatePowerlogMiscState:value:](v6, "updatePowerlogMiscState:value:", 2LL, v7);
      if (self->_sunlightState) {
        uint64_t v8 = 100LL;
      }
      else {
        uint64_t v8 = 0LL;
      }
      if (notify_set_state(self->_thermalSunlightStateToken, v8))
      {
        uint64_t v9 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003A868(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }

      *(float *)&dword_10007D1A4 = (float)self->_sunlightState;
    }
  }

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  self->super._infoOnlySensorsActive = a3;
}

- (int)numberOfFields
{
  return 3;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  else {
    return off_100061658[a3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 2:
      return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  self->_currentSemanticLux);
    case 1:
      BOOL v3 = kCFAllocatorDefault;
      unsigned int v5 = -[SolarDetectorSemantic isContextTriggered](self, "isContextTriggered");
      uint64_t v6 = 100LL;
      if (!v5) {
        uint64_t v6 = 0LL;
      }
      uint64_t v7 = v6;
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", v7);
    case 0:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t v7 = -[SolarDetectorSemantic getContextState](self, "getContextState");
      return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", v7);
  }

  return 0LL;
}

@end