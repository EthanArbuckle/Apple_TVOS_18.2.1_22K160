@interface WiFiUsageBatterySaveSession
- (WiFiUsageBatterySaveSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6;
@end

@implementation WiFiUsageBatterySaveSession

- (WiFiUsageBatterySaveSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageBatterySaveSession;
  result = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v5,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  7LL,  a3,  a4);
  result->_batterySaveMode = 0;
  return result;
}

- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a6)
  {
    if (!self->_batterySaveMode)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[WiFiUsageBatterySaveSession updateWowState:lpasState:lowPowerState:batterySaverState:]";
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Battery save mode session started",  buf,  0xCu);
      }

      -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
      self->_batterySaveMode = 1;
    }
  }

  else if (self->_batterySaveMode)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WiFiUsageBatterySaveSession updateWowState:lpasState:lowPowerState:batterySaverState:]";
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Battery save session ended",  buf,  0xCu);
    }

    self->_batterySaveMode = 0;
    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiUsageBatterySaveSession;
  -[WiFiUsageSession updateWowState:lpasState:lowPowerState:batterySaverState:]( &v11,  sel_updateWowState_lpasState_lowPowerState_batterySaverState_,  v9,  v8,  v7,  v6);
}

- (id)metricName
{
  return @"com.apple.wifi.batterysavesession";
}

@end