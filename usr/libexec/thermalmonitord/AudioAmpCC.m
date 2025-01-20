@interface AudioAmpCC
- (AudioAmpCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation AudioAmpCC

- (AudioAmpCC)initWithParams:(__CFDictionary *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AudioAmpCC;
  v4 = -[ComponentControl initWithCC::](&v7, "initWithCC::", 10LL, 0LL);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    *(&v4->super.currentPower + 1) = 1109393408;
    v4->_targetPower = 0.0;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d AudioAmp ", 10LL);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    if (a3) {
      sub_100020FE0(a3, @"maxAudioAmpPower", kCFNumberFloatType, &v5->_currentPower);
    }
  }

  return v5;
}

- (void)defaultAction
{
  unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != self->super.maxLoadingIndex)
  {
    v4 = (float *)(&self->super.currentPower + 1);
    *((float *)&self->super.currentPower + 1) = (float)(self->_currentPower * (float)currentLoadingIndex) / 100.0;
    v5 = objc_alloc(&OBJC_CLASS___NSNumber);
    *(float *)&double v6 = *v4;
    objc_super v7 = -[NSNumber initWithFloat:](v5, "initWithFloat:", v6);
    if (v7)
    {
      v8 = v7;
      v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v8, @"target-power");
      id v10 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
      unsigned int v11 = [v10 setAttribute:v9 forKey:AVSystemController_ThermalControlInfoAttribute error:0];
      v12 = (os_log_s *)qword_10007CF50;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          double v13 = *v4;
          int v14 = 134217984;
          double v15 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> AudioAmpCC: Set the target power to %f",  (uint8_t *)&v14,  0xCu);
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003A954(v4, v12);
      }

      if (v9) {
    }
      }

    self->super.maxLoadingIndex = self->super.currentLoadingIndex;
  }

- (void)refreshTGraphTelemetry
{
  id v3 = +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
  id v4 = [v3 attributeForKey:AVSystemController_ThermalControlInfoAttribute];
  if (!v4)
  {
    v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003AA30(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  if (![v4 count])
  {
    double v13 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003AA00(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  id v21 = [v4 objectForKey:@"measured-power"];
  if (!v21)
  {
    v22 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003A9D0(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }

  [v21 floatValue];
  self->_targetPower = v30;
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AudioAmpCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AudioAmpCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___AudioAmpCC;
    unsigned int v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1) {
      uint64_t v7 = @"AudioAmpCC current power";
    }
    else {
      uint64_t v7 = 0LL;
    }
    if ((_DWORD)v3 == v6) {
      return @"AudioAmpCC target power";
    }
    else {
      return v7;
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___AudioAmpCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AudioAmpCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___AudioAmpCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AudioAmpCC;
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