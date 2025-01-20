@interface SocCC
- (SocCC)initWithParams:(__CFDictionary *)a3 listID:(int)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation SocCC

- (SocCC)initWithParams:(__CFDictionary *)a3 listID:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SocCC;
  v5 = -[ComponentControl initWithCC::](&v8, "initWithCC::", 3LL, a3);
  v6 = v5;
  if (v5)
  {
    v5->listIDPos = 101;
    *(&v5->super.currentPower + 1) = a4;
    v5->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d SoC ", 3LL);
  }

  return v6;
}

- (void)defaultAction
{
  self->listIDPos = self->super.previousValue;
  objc_msgSend((id)qword_10007D4E0, "setGPUPowerCeiling:fromDecisionSource:");
  [(id)qword_10007D4E0 updateGPU];
}

- (void)refreshTGraphTelemetry
{
  *(float *)&self->gpuPowerTarget = (float)*(unsigned int *)&self->super.allowLIOverride;
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SocCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SocCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___SocCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3) {
      return @"SoC - timeActive";
    }
    else {
      return 0LL;
    }
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SocCC;
    return -[ComponentControl copyHeaderForIndex:](&v7, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SocCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___SocCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3) {
      return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%.3f",  *(float *)&self->gpuPowerTarget);
    }
    else {
      return 0LL;
    }
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SocCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v7, "copyFieldCurrentValueForIndex:", v3);
  }

@end