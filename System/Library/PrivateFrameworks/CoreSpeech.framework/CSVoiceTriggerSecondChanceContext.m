@interface CSVoiceTriggerSecondChanceContext
- (BOOL)shouldRunAsSecondChance;
- (CSVoiceTriggerSecondChanceContext)initWithWindowStartTime:(unint64_t)a3;
- (unint64_t)secondChanceHotTillMachTime;
- (void)setSecondChanceHotTillMachTime:(unint64_t)a3;
@end

@implementation CSVoiceTriggerSecondChanceContext

- (CSVoiceTriggerSecondChanceContext)initWithWindowStartTime:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerSecondChanceContext;
  v4 = -[CSVoiceTriggerSecondChanceContext init](&v7, "init");
  if (v4)
  {
    LODWORD(v5) = 8.0;
    v4->_secondChanceHotTillMachTime = (unint64_t)+[CSFTimeUtils secondsToHostTime:]( &OBJC_CLASS___CSFTimeUtils,  "secondsToHostTime:",  v5)
                                     + a3;
  }

  return v4;
}

- (BOOL)shouldRunAsSecondChance
{
  return mach_absolute_time() <= self->_secondChanceHotTillMachTime;
}

- (unint64_t)secondChanceHotTillMachTime
{
  return self->_secondChanceHotTillMachTime;
}

- (void)setSecondChanceHotTillMachTime:(unint64_t)a3
{
  self->_secondChanceHotTillMachTime = a3;
}

@end