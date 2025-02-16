@interface RBSystemPowerAssertion
- (RBSystemPowerAssertion)init;
- (id)_preventIdleSleepIdentifiers;
- (int)_targetPid;
@end

@implementation RBSystemPowerAssertion

- (RBSystemPowerAssertion)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RBSystemPowerAssertion;
  v2 = -[RBPowerAssertion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    baseName = v2->super._baseName;
    v2->super._baseName = (NSString *)@"runningboardd.system";
  }

  return v3;
}

- (id)_preventIdleSleepIdentifiers
{
  return -[RBSystemState preventIdleSleepIdentifiers](self->_state, "preventIdleSleepIdentifiers");
}

- (int)_targetPid
{
  int result = -[RBSystemState preventIdleSleep](self->_state, "preventIdleSleep");
  if (result) {
    return getpid();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end