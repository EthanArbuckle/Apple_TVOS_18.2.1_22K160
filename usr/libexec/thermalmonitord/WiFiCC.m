@interface WiFiCC
- (WiFiCC)initWithParams:(__CFDictionary *)a3;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation WiFiCC

- (WiFiCC)initWithParams:(__CFDictionary *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiCC;
  v4 = -[ComponentControl initWithCC::](&v9, "initWithCC::", 9LL, 0LL);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d WiFi ", 9LL);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    uint64_t v6 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
    *(void *)(&v5->super.currentPower + 1) = v6;
    if (!v6)
    {
      v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_1000398C4(v7);
      }
    }

    -[ComponentControl updatePowerParameters:](v5, "updatePowerParameters:", a3);
    if (sub_100020F6C(a3, @"expectsCPMSSupport", 0LL)) {
      -[ComponentControl setCPMSMitigationState:](v5, "setCPMSMitigationState:", 1LL);
    }
  }

  return v5;
}

- (void)defaultAction
{
  unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != self->super.maxLoadingIndex)
  {
    if (currentLoadingIndex >= 0x64) {
      uint64_t v4 = 100LL;
    }
    else {
      uint64_t v4 = currentLoadingIndex;
    }
    WiFiManagerClientSetThermalIndex(*(void *)(&self->super.currentPower + 1), v4);
    if (byte_10007CB30)
    {
      v5 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v6 = self->super.currentLoadingIndex;
        v7[0] = 67109120;
        v7[1] = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Set the WiFi maxLI to %d",  (uint8_t *)v7,  8u);
      }
    }

    self->super.maxLoadingIndex = self->super.currentLoadingIndex;
  }

- (void)refreshTGraphTelemetry
{
  unsigned int ThermalIndex = WiFiManagerClientGetThermalIndex(*(void *)(&self->super.currentPower + 1), a2);
  *(_DWORD *)&self->super.allowLIOverride = ThermalIndex;
  if (ThermalIndex >= 0x66)
  {
    int v4 = ThermalIndex;
    v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039904(v4, v5);
    }
  }

@end