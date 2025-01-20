@interface RBProcessPowerAssertion
- (id)_preventIdleSleepIdentifiers;
- (id)initWithProcess:(id *)a1;
- (int)_targetPid;
@end

@implementation RBProcessPowerAssertion

- (id)initWithProcess:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___RBProcessPowerAssertion;
    v5 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 7, a2);
      [a1[7] identity];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 shortDescription];
      id v8 = a1[4];
      a1[4] = (id)v7;
    }
  }

  return a1;
}

- (id)_preventIdleSleepIdentifiers
{
  return -[RBProcessState preventIdleSleepIdentifiers](self->_state, "preventIdleSleepIdentifiers");
}

- (int)_targetPid
{
  if (self->_process && -[RBProcessState preventIdleSleep](self->_state, "preventIdleSleep")) {
    return -[RBProcess rbs_pid](self->_process, "rbs_pid");
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end