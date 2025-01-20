@interface SpeakerCC
- (SpeakerCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation SpeakerCC

- (SpeakerCC)initWithParams:(__CFDictionary *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SpeakerCC;
  v4 = -[ComponentControl initWithCC::](&v18, "initWithCC::", 12LL, 0LL);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d Speaker ", 12LL);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    sub_100020FE0(a3, @"speakerGainFloor", kCFNumberFloatType, &v5->_currentSpeakerGain);
    float currentSpeakerGain = v5->_currentSpeakerGain;
    if (currentSpeakerGain < 0.0 || currentSpeakerGain > 1.0)
    {
      v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003EE6C(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      v5->_float currentSpeakerGain = 1.0;
    }

    else if (byte_10007CB30)
    {
      v16 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v20 = currentSpeakerGain;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "<Notice> Got SpeakerCC gain floor value: %f",  buf,  0xCu);
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
    if (currentLoadingIndex < 0x64)
    {
      float v5 = self->_currentSpeakerGain + (double)currentLoadingIndex / 100.0 * (1.0 - self->_currentSpeakerGain);
      *((float *)&self->super.currentPower + 1) = v5;
      double v4 = v5;
    }

    else
    {
      *(&self->super.currentPower + 1) = 1065353216;
      double v4 = 1.0;
    }

    if (byte_10007CB30)
    {
      v6 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        double v8 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> SpeakerCC: setting gain %.4f",  (uint8_t *)&v7,  0xCu);
        unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
      }
    }

    self->super.maxLoadingIndex = currentLoadingIndex;
  }

- (void)refreshTGraphTelemetry
{
  *(_DWORD *)&self->super.allowLIOverride = 0;
  v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003EEDC(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SpeakerCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SpeakerCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___SpeakerCC;
    unsigned int v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1) {
      uint64_t v7 = @"SpeakerCC current gain";
    }
    else {
      uint64_t v7 = 0LL;
    }
    if ((_DWORD)v3 == v6) {
      return @"SpeakerCC target gain";
    }
    else {
      return v7;
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___SpeakerCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SpeakerCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___SpeakerCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SpeakerCC;
  int v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 1)
  {
    uint64_t v7 = kCFAllocatorDefault;
    uint64_t v8 = 144LL;
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%f",  *(float *)((char *)&self->super.super.super.isa + v8));
  }

  if (!v6)
  {
    uint64_t v7 = kCFAllocatorDefault;
    uint64_t v8 = 140LL;
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%f",  *(float *)((char *)&self->super.super.super.isa + v8));
  }

  return 0LL;
}

@end