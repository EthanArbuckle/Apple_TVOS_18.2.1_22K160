@interface WiFiUsageLQMKernelSampleCCA
+ (id)sampleWithStruct:(ccaStats *)a3 andTimestamp:(id)a4;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleCCA)initWithStruct:(ccaStats *)a3 andTimestamp:(id)a4;
- (double)duration;
- (unint64_t)interference;
- (unint64_t)interferenceSleepPerc;
- (unint64_t)interferenceWakePerc;
- (unint64_t)otherCca;
- (unint64_t)otherCcaSleepPerc;
- (unint64_t)otherCcaWakePerc;
- (unint64_t)selfCca;
- (unint64_t)selfCcaSleepPerc;
- (unint64_t)selfCcaWakePerc;
- (void)setDuration:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation WiFiUsageLQMKernelSampleCCA

+ (id)sampleWithStruct:(ccaStats *)a3 andTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog(@"%s - Unknown version: %u", "+[WiFiUsageLQMKernelSampleCCA sampleWithStruct:andTimestamp:]", var0);
    v7 = 0LL;
  }

  else
  {
    v7 = -[WiFiUsageLQMKernelSampleCCA initWithStruct:andTimestamp:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMKernelSampleCCA),  "initWithStruct:andTimestamp:",  a3,  v5);
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleCCA)initWithStruct:(ccaStats *)a3 andTimestamp:(id)a4
{
  id v7 = a4;
  +[WiFiUsageLQMTransformations ccaStatsWithDuration:ccaSelf:ccaOther:interference:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ccaStatsWithDuration:ccaSelf:ccaOther:interference:",  a3->var1,  a3->var2,  a3->var3,  a3->var4);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0LL;
  }

  else
  {
    +[WiFiUsageLQMTransformations ccaStatsWithDuration:ccaSelf:ccaOther:interference:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ccaStatsWithDuration:ccaSelf:ccaOther:interference:",  a3->var5,  a3->var6,  a3->var7,  a3->var8);
    +[WiFiUsageLQMTransformations ccaStatsWithDuration:ccaSelf:ccaOther:interference:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ccaStatsWithDuration:ccaSelf:ccaOther:interference:",  a3->var9,  a3->var10,  a3->var11,  a3->var12);
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMKernelSampleCCA;
    v9 = -[WiFiUsageLQMKernelSampleCCA init](&v11, sel_init);
    objc_storeStrong((id *)&v9->_timestamp, a4);
    v9->_selfCca = v18;
    v9->_otherCca = v19;
    v9->_interference = v20;
    v9->_selfCcaSleepPerc = v15;
    v9->_otherCcaSleepPerc = v16;
    v9->_interferenceSleepPerc = v17;
    v9->_selfCcaWakePerc = v12;
    v9->_otherCcaWakePerc = v13;
    v9->_interferenceWakePerc = v14;
    self = v9;
    v8 = self;
  }

  return v8;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)selfCca
{
  return self->_selfCca;
}

- (unint64_t)otherCca
{
  return self->_otherCca;
}

- (unint64_t)interference
{
  return self->_interference;
}

- (unint64_t)selfCcaSleepPerc
{
  return self->_selfCcaSleepPerc;
}

- (unint64_t)otherCcaSleepPerc
{
  return self->_otherCcaSleepPerc;
}

- (unint64_t)interferenceSleepPerc
{
  return self->_interferenceSleepPerc;
}

- (unint64_t)selfCcaWakePerc
{
  return self->_selfCcaWakePerc;
}

- (unint64_t)otherCcaWakePerc
{
  return self->_otherCcaWakePerc;
}

- (unint64_t)interferenceWakePerc
{
  return self->_interferenceWakePerc;
}

- (void).cxx_destruct
{
}

@end