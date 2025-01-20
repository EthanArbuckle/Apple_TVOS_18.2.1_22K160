@interface LARatchetState
- (BOOL)isEqual:(id)a3;
- (LARatchetState)initWithRawValue:(int64_t)a3 value:(id)a4 uuid:(id)a5;
- (LARatchetState)initWithState:(id)a3;
- (LARatchetStateValue)value;
- (NSString)uuid;
- (double)duration;
- (id)description;
- (int64_t)rawValue;
@end

@implementation LARatchetState

- (LARatchetState)initWithRawValue:(int64_t)a3 value:(id)a4 uuid:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LARatchetState;
  v11 = -[LARatchetState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_rawValue = a3;
    objc_storeStrong((id *)&v11->_value, a4);
    objc_storeStrong((id *)&v12->_uuid, a5);
  }

  return v12;
}

- (double)duration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (LARatchetState)initWithState:(id)a3
{
  id v4 = a3;
  if (objc_opt_class())
  {
    switch([v4 rawValue])
    {
      case 1LL:
        id v10 = objc_alloc(&OBJC_CLASS___LARatchetStateValueWaitingForCoolOff);
        [v4 duration];
        v5 = -[LARatchetStateValue initWithDuration:](v10, "initWithDuration:");
        [v4 uuid];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        uint64_t v8 = 1LL;
        break;
      case 2LL:
        v11 = objc_alloc(&OBJC_CLASS___LARatchetStateValueWaitingForSecondAuthentication);
        [v4 duration];
        v5 = -[LARatchetStateValue initWithDuration:](v11, "initWithDuration:");
        [v4 uuid];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        uint64_t v8 = 2LL;
        break;
      case 3LL:
        v12 = objc_alloc(&OBJC_CLASS___LARatchetStateValueReady);
        [v4 duration];
        v5 = -[LARatchetStateValue initWithDuration:](v12, "initWithDuration:");
        [v4 uuid];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        uint64_t v8 = 3LL;
        break;
      case 4LL:
        v13 = objc_alloc(&OBJC_CLASS___LARatchetStateValueCollapsed);
        [v4 duration];
        v5 = -[LARatchetStateValue initWithDuration:](v13, "initWithDuration:");
        [v4 uuid];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        uint64_t v8 = 4LL;
        break;
      default:
        v5 = -[LARatchetStateValue initInternal]( objc_alloc(&OBJC_CLASS___LARatchetStateValueNotStarted),  "initInternal");
        [v4 uuid];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        uint64_t v8 = 0LL;
        break;
    }

    self = -[LARatchetState initWithRawValue:value:uuid:](v7, "initWithRawValue:value:uuid:", v8, v5, v6);

    id v9 = self;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)description
{
  v20[3] = *MEMORY[0x1895F89C0];
  double v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)NSString;
  unint64_t v6 = -[LARatchetState rawValue](self, "rawValue");
  if (v6 > 4) {
    v7 = &stru_189F9A2A8;
  }
  else {
    v7 = off_189F99E28[v6];
  }
  [v5 stringWithFormat:@"rawValue: %@", v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  id v9 = (void *)NSString;
  -[LARatchetState duration](self, "duration");
  NSStringFromLARatchetStateDuration(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringWithFormat:@"duration: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  v13 = (void *)NSString;
  -[LARatchetState uuid](self, "uuid");
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stringWithFormat:@"uuid: %@", v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v20 count:3];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 componentsJoinedByString:@"; "];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    uint64_t v6 = [v5 rawValue];
    if (v6 == -[LARatchetState rawValue](self, "rawValue"))
    {
      [v5 value];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = -[LARatchetState value](self, "value");
      if (v7 == (void *)v8)
      {
      }

      else
      {
        id v9 = (void *)v8;
        [v5 value];
        double v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[LARatchetState value](self, "value");
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }

      [v5 uuid];
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = -[LARatchetState uuid](self, "uuid");
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        v16 = v14;
      }

      else
      {
        v16 = (void *)v15;
        [v5 uuid];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[LARatchetState uuid](self, "uuid");
        char v13 = [v17 isEqualToString:v18];
      }

      goto LABEL_12;
    }

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (LARatchetStateValue)value
{
  return self->_value;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end