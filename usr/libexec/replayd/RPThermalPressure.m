@interface RPThermalPressure
- (RPThermalPressureDelegate)delegate;
- (int)getStateWithToken:(int)a3;
- (int64_t)convertThermalPressureLevel:(int)a3;
- (int64_t)getCurrentPressureLevel;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)thermalPressureDidChangeWithThermalLevel:(int)a3;
@end

@implementation RPThermalPressure

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPThermalPressure;
  -[RPThermalPressure dealloc](&v3, "dealloc");
}

- (void)startMonitoring
{
  p_thermalNotificationToken = &self->_thermalNotificationToken;
  notify_register_check(kOSThermalNotificationPressureLevelName, &self->_thermalNotificationToken);
  int v4 = -[RPThermalPressure getStateWithToken:]( self,  "getStateWithToken:",  self->_thermalNotificationToken);
  self->_thermalLevel = v4;
  self->_newThermalLevel = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100004BF0;
  handler[3] = &unk_100070C30;
  handler[4] = self;
  notify_register_dispatch( kOSThermalNotificationPressureLevelName,  p_thermalNotificationToken,  &_dispatch_main_q,  handler);
}

- (void)stopMonitoring
{
}

- (int64_t)getCurrentPressureLevel
{
  return -[RPThermalPressure convertThermalPressureLevel:]( self,  "convertThermalPressureLevel:",  self->_newThermalLevel);
}

- (void)thermalPressureDidChangeWithThermalLevel:(int)a3
{
  int newThermalLevel = self->_newThermalLevel;
  if (newThermalLevel != a3)
  {
    self->_thermalLevel = newThermalLevel;
    self->_int newThermalLevel = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend( WeakRetained,  "thermalPressureDidChangeWithLevel:",  -[RPThermalPressure convertThermalPressureLevel:]( self,  "convertThermalPressureLevel:",  self->_thermalLevel));
  }

- (int64_t)convertThermalPressureLevel:(int)a3
{
  int64_t v3 = a3;
  if (a3 > 29)
  {
    switch(a3)
    {
      case 30:
        return 30LL;
      case 40:
        return 40LL;
      case 50:
        return 50LL;
    }
  }

  else
  {
    switch(a3)
    {
      case 0:
        return v3;
      case 10:
        return 10LL;
      case 20:
        return 20LL;
    }
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    v6 = "-[RPThermalPressure convertThermalPressureLevel:]";
    __int16 v7 = 1024;
    int v8 = 70;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d unknown pressure level",  (uint8_t *)&v5,  0x12u);
  }

  return v3;
}

- (int)getStateWithToken:(int)a3
{
  uint64_t state64 = 0LL;
  notify_get_state(a3, &state64);
  return state64;
}

- (RPThermalPressureDelegate)delegate
{
  return (RPThermalPressureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end