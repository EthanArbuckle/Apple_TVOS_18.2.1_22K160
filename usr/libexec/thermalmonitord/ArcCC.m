@interface ArcCC
- (ArcCC)initWithParams:(__CFDictionary *)a3 product:(id)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation ArcCC

- (ArcCC)initWithParams:(__CFDictionary *)a3 product:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ArcCC;
  v6 = -[ComponentControl initWithCC::](&v11, "initWithCC::", 11LL, 0LL);
  v7 = (ArcCC *)v6;
  if (v6)
  {
    *(void *)(v6 + 140) = a4;
    *((_DWORD *)v6 + 18) = 100;
    *((_DWORD *)v6 + 39) = 1065353216;
    *((_DWORD *)v6 + 40) = -1082130432;
    *((void *)v6 + 6) = CFStringCreateWithFormat(0LL, 0LL, @"%d Arc ", 11LL);
    v7->super.previousValue = v7->super.currentLoadingIndex;
    sub_100020FE0(a3, @"thresholdModule", kCFNumberIntType, (char *)&v7->_product + 4);
    if (byte_10007CB30)
    {
      v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int product_high = HIDWORD(v7->_product);
        *(_DWORD *)buf = 67109120;
        int v13 = product_high;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> Got ArcCC module threshold: %d",  buf,  8u);
      }
    }
  }

  return v7;
}

- (void)defaultAction
{
  int v3 = [*(id *)(&self->super.currentPower + 1) arcModuleTemperature];
  self->_thresholdModuleTemperature = v3;
  if (*(void *)(&self->super.currentPower + 1))
  {
    if (v3 <= SHIDWORD(self->_product))
    {
      float v6 = 1.0;
      else {
        self->_latestModuleTemperature = 1065353216;
      }
    }

    else
    {
      LODWORD(v4) = self->super.currentLoadingIndex;
      float v5 = (double)v4 / 100.0;
      *(float *)&unint64_t v4 = v5 * v5;
      else {
        float v6 = 1.0;
      }
      *(float *)&self->_latestModuleTemperature = v6;
    }

    if (self->_currentHapticGain != v6 && byte_10007CB30 != 0)
    {
      v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        double v10 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> ArcCC: setting gain %.4f",  (uint8_t *)&v9,  0xCu);
        float v6 = *(float *)&self->_latestModuleTemperature;
      }
    }

    self->_currentHapticGain = v6;
  }

- (void)refreshTGraphTelemetry
{
  *(_DWORD *)&self->super.allowLIOverride = 0;
  v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003D468(v2);
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ArcCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ArcCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___ArcCC;
    unsigned int v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1) {
      v7 = @"ArcCC current gain";
    }
    else {
      v7 = 0LL;
    }
    if ((_DWORD)v3 == v6) {
      return @"ArcCC target gain";
    }
    else {
      return v7;
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___ArcCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ArcCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___ArcCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ArcCC;
  int v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    uint64_t v8 = 160LL;
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%f",  *(float *)((char *)&self->super.super.super.isa + v8));
  }

  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    uint64_t v8 = 156LL;
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%f",  *(float *)((char *)&self->super.super.super.isa + v8));
  }

  return 0LL;
}

@end