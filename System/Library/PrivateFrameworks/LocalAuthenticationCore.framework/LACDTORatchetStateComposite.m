@interface LACDTORatchetStateComposite
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isEqual:(id)a3;
- (LACDTOBiometryWatchdogPack)watchdogs;
- (LACDTOGracePeriodState)gracePeriodState;
- (LACDTORatchetState)ratchetState;
- (LACDTORatchetStateComposite)initWithCoder:(id)a3;
- (LACDTORatchetStateComposite)initWithRatchetState:(id)a3 gracePeriodState:(id)a4 watchdogs:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTORatchetStateComposite

- (LACDTORatchetStateComposite)initWithRatchetState:(id)a3 gracePeriodState:(id)a4 watchdogs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACDTORatchetStateComposite;
  v12 = -[LACDTORatchetStateComposite init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ratchetState, a3);
    objc_storeStrong((id *)&v13->_gracePeriodState, a4);
    objc_storeStrong((id *)&v13->_watchdogs, a5);
  }

  return v13;
}

+ (id)nullInstance
{
  v2 = objc_alloc(&OBJC_CLASS___LACDTORatchetStateComposite);
  v3 = +[LACDTORatchetState nullInstance](&OBJC_CLASS___LACDTORatchetState, "nullInstance");
  v4 = +[LACDTOGracePeriodState nullInstance](&OBJC_CLASS___LACDTOGracePeriodState, "nullInstance");
  v5 = +[LACDTOBiometryWatchdogPack nullInstance](&OBJC_CLASS___LACDTOBiometryWatchdogPack, "nullInstance");
  v6 = -[LACDTORatchetStateComposite initWithRatchetState:gracePeriodState:watchdogs:]( v2,  "initWithRatchetState:gracePeriodState:watchdogs:",  v3,  v4,  v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[LACDTORatchetStateComposite ratchetState](self, "ratchetState");
  NSStringFromSelector(sel_ratchetState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:v6];
  v7 = -[LACDTORatchetStateComposite gracePeriodState](self, "gracePeriodState");
  NSStringFromSelector(sel_gracePeriodState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:v8];

  -[LACDTORatchetStateComposite watchdogs](self, "watchdogs");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_watchdogs);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:v9];
}

- (LACDTORatchetStateComposite)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  NSStringFromSelector(sel_ratchetState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v5 forKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = objc_opt_class();
  NSStringFromSelector(sel_gracePeriodState);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v8 forKey:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = objc_opt_class();
  NSStringFromSelector(sel_watchdogs);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v11 forKey:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[LACDTORatchetStateComposite initWithRatchetState:gracePeriodState:watchdogs:]( self,  "initWithRatchetState:gracePeriodState:watchdogs:",  v7,  v10,  v13);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    [v5 ratchetState];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[LACDTORatchetStateComposite ratchetState](self, "ratchetState");
    if (v6 == (void *)v7)
    {
    }

    else
    {
      uint64_t v8 = (void *)v7;
      [v5 ratchetState];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTORatchetStateComposite ratchetState](self, "ratchetState");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }

    [v5 gracePeriodState];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[LACDTORatchetStateComposite gracePeriodState](self, "gracePeriodState");
    if (v13 == (void *)v14)
    {
    }

    else
    {
      objc_super v15 = (void *)v14;
      [v5 gracePeriodState];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[LACDTORatchetStateComposite gracePeriodState](self, "gracePeriodState");
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }

    [v5 watchdogs];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = -[LACDTORatchetStateComposite watchdogs](self, "watchdogs");
    if (v19 == (void *)v20)
    {
      char v12 = 1;
      v21 = v19;
    }

    else
    {
      v21 = (void *)v20;
      [v5 watchdogs];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[LACDTORatchetStateComposite watchdogs](self, "watchdogs");
      char v12 = [v22 isEqual:v23];
    }

    goto LABEL_15;
  }

  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)description
{
  v18[3] = *MEMORY[0x1895F89C0];
  v17 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = (void *)NSString;
  -[LACDTORatchetStateComposite ratchetState](self, "ratchetState");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"ratchetState: %@", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  uint64_t v7 = (void *)NSString;
  -[LACDTORatchetStateComposite gracePeriodState](self, "gracePeriodState");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"gracePeriodState: %@", v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  id v10 = (void *)NSString;
  -[LACDTORatchetStateComposite watchdogs](self, "watchdogs");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringWithFormat:@"watchdogs: %@", v11];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 componentsJoinedByString:@"; "];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (LACDTOGracePeriodState)gracePeriodState
{
  return self->_gracePeriodState;
}

- (LACDTOBiometryWatchdogPack)watchdogs
{
  return self->_watchdogs;
}

- (void).cxx_destruct
{
}

@end