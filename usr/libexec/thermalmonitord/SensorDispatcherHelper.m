@interface SensorDispatcherHelper
+ (id)sharedInstance;
- (SensorDispatcherHelper)init;
- (float)getFloatValueFromSMCForKey:(__CFString *)a3;
- (int)getTemperatureFromSMCForKey:(__CFString *)a3;
- (int)getValueFromSMCForKey:(__CFString *)a3;
- (int)writeKeysToSensorDispatcher:(smcKeyWrites *)a3;
- (void)readKeysFromSensorDispatcher;
@end

@implementation SensorDispatcherHelper

+ (id)sharedInstance
{
  if (qword_10007CB00 != -1) {
    dispatch_once(&qword_10007CB00, &stru_100061B78);
  }
  return (id)qword_10007CB08;
}

- (SensorDispatcherHelper)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SensorDispatcherHelper;
  v2 = -[SensorDispatcherHelper init](&v15, "init");
  if (v2)
  {
    v3 = IOServiceMatching("AppleSMCSensorDispatcher");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    uint32_t outputCnt = 1;
    size_t outputStructCnt = 60LL;
    if (MatchingService)
    {
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &v2->connect))
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003F2B8();
        }
      }

      else
      {
        if (IOConnectCallScalarMethod(v2->connect, 0, 0LL, 0, &v2->sensorCount, &outputCnt)
          && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003F28C();
        }

        p_sensor4CC = &v2->_sensor4CC;
        if (IOConnectCallStructMethod(v2->connect, 1u, 0LL, 0LL, &v2->_sensor4CC, &outputStructCnt)
          && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003F260();
        }

        v2->_smcSensorDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (v2->sensorCount)
        {
          unint64_t v7 = 0LL;
          v8 = (int *)&v2->_sensor4CC;
          do
          {
            int v9 = *v8++;
            CFStringRef v10 = sub_1000212A0(v9);
            sub_1000211FC(v2->_smcSensorDict, v10, kCFNumberSInt32Type, p_sensor4CC);
            ++v7;
            p_sensor4CC = (sensorTemperature4CC *)v8;
          }

          while (v7 < v2->sensorCount);
        }
      }
    }

    else
    {
      v5 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> AppleSMCSensorDispatcher not enabled on this device",  v12,  2u);
      }
    }
  }

  return v2;
}

- (void)readKeysFromSensorDispatcher
{
  size_t outputStructCnt = 60LL;
  mach_port_t connect = self->connect;
  if (connect
    && IOConnectCallStructMethod(connect, 2u, 0LL, 0LL, &self->_sensorData, &outputStructCnt)
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003F2E4();
  }

- (int)writeKeysToSensorDispatcher:(smcKeyWrites *)a3
{
  kern_return_t v4;
  os_log_s *v5;
  mach_port_t connect = self->connect;
  if (!connect) {
    return -536870212;
  }
  v4 = IOConnectCallStructMethod(connect, 3u, a3, 0x58uLL, 0LL, 0LL);
  if (v4)
  {
    v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003F310(v4, v5);
    }
  }

  return v4;
}

- (int)getValueFromSMCForKey:(__CFString *)a3
{
  if (byte_10007CB30)
  {
    v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      CStringPtr = CFStringGetCStringPtr(a3, 0x8000100u);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Looking for SMC Key %s",  (uint8_t *)&v8,  0xCu);
    }
  }

  uint64_t v6 = 0LL;
  int result = -1;
  do
  {
    if (v8 == self->_sensor4CC.sensor4CC[v6]) {
      int result = self->_sensorData.sensorTemperature[v6];
    }
    ++v6;
  }

  while (v6 != 15);
  return result;
}

- (float)getFloatValueFromSMCForKey:(__CFString *)a3
{
  int v4 = sub_100020FE0(self->_smcSensorDict, a3, kCFNumberSInt32Type, &v7);
  float result = -1.0;
  if (v4)
  {
    for (uint64_t i = 0LL; i != 15; ++i)
    {
      if (v7 == self->_sensor4CC.sensor4CC[i]) {
        float result = *(float *)&self->_sensorData.sensorTemperature[i];
      }
    }
  }

  return result;
}

- (int)getTemperatureFromSMCForKey:(__CFString *)a3
{
  int result = -[SensorDispatcherHelper getValueFromSMCForKey:](self, "getValueFromSMCForKey:", a3);
  if (result != -1)
  {
    if (result == -12700) {
      return -12800;
    }
    else {
      return (int)((double)result / 65535.0 * 100.0);
    }
  }

  return result;
}

@end