@interface WiFiUsageLQMKernelSampleAWDLCoex
+ (id)sampleWithStruct:(awdlInfo *)a3 andTimestamp:(id)a4;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleAWDLCoex)initWithStruct:(awdlInfo *)a3 andTimestamp:(id)a4;
- (double)duration;
- (unint64_t)awdlActiveDurationPerc;
- (void)setAwdlActiveDurationPerc:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation WiFiUsageLQMKernelSampleAWDLCoex

+ (id)sampleWithStruct:(awdlInfo *)a3 andTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog( @"%s - Unknown version: %u",  "+[WiFiUsageLQMKernelSampleAWDLCoex sampleWithStruct:andTimestamp:]",  var0);
    v7 = 0LL;
  }

  else
  {
    v7 = -[WiFiUsageLQMKernelSampleAWDLCoex initWithStruct:andTimestamp:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMKernelSampleAWDLCoex),  "initWithStruct:andTimestamp:",  a3,  v5);
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleAWDLCoex)initWithStruct:(awdlInfo *)a3 andTimestamp:(id)a4
{
  v6 = (NSDate *)a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMKernelSampleAWDLCoex;
  v7 = -[WiFiUsageLQMKernelSampleAWDLCoex init](&v12, sel_init);
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;
  v9 = v6;

  unint64_t v10 = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a3->var2,  a3->var2,  +[WiFiUsageLQMTransformations ratioScale](&OBJC_CLASS___WiFiUsageLQMTransformations, "ratioScale"));
  v7->_awdlActiveDurationPerc = v10;
  return v7;
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

- (unint64_t)awdlActiveDurationPerc
{
  return self->_awdlActiveDurationPerc;
}

- (void)setAwdlActiveDurationPerc:(unint64_t)a3
{
  self->_awdlActiveDurationPerc = a3;
}

- (void).cxx_destruct
{
}

@end