@interface LACDTOMutableLostModeFetchRequest
- (BOOL)isDTOEnabled;
- (BOOL)isEqual:(id)a3;
- (LACDTOBiometryWatchdogPack)biometryWatchdogPack;
- (LACDTORatchetState)ratchetState;
- (NSDictionary)options;
- (NSString)description;
- (int64_t)policy;
- (void)setBiometryWatchdogPack:(id)a3;
- (void)setIsDTOEnabled:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setRatchetState:(id)a3;
@end

@implementation LACDTOMutableLostModeFetchRequest

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C7934F8])
  {
    id v5 = v4;
    int64_t v6 = -[LACDTOMutableLostModeFetchRequest policy](self, "policy");
    if (v6 == [v5 policy])
    {
      v7 = -[LACDTOMutableLostModeFetchRequest options](self, "options");
      uint64_t v8 = [v5 options];
      if (v7 == (void *)v8)
      {
      }

      else
      {
        v9 = (void *)v8;
        v10 = -[LACDTOMutableLostModeFetchRequest options](self, "options");
        [v5 options];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v10 isEqualToDictionary:v11];

        if (!v12) {
          goto LABEL_11;
        }
      }

      int v14 = -[LACDTOMutableLostModeFetchRequest isDTOEnabled](self, "isDTOEnabled");
      if (v14 == [v5 isDTOEnabled])
      {
        v15 = -[LACDTOMutableLostModeFetchRequest ratchetState](self, "ratchetState");
        uint64_t v16 = [v5 ratchetState];
        if (v15 == (void *)v16)
        {
        }

        else
        {
          v17 = (void *)v16;
          v18 = -[LACDTOMutableLostModeFetchRequest ratchetState](self, "ratchetState");
          [v5 ratchetState];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          int v20 = [v18 isEqual:v19];

          if (!v20) {
            goto LABEL_11;
          }
        }
        v22 = -[LACDTOMutableLostModeFetchRequest biometryWatchdogPack](self, "biometryWatchdogPack");
        uint64_t v23 = [v5 biometryWatchdogPack];
        if (v22 == (void *)v23)
        {
          char v13 = 1;
          v24 = v22;
        }

        else
        {
          v24 = (void *)v23;
          v25 = -[LACDTOMutableLostModeFetchRequest biometryWatchdogPack](self, "biometryWatchdogPack");
          [v5 biometryWatchdogPack];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v25 isEqual:v26];
        }

        goto LABEL_12;
      }
    }

- (NSString)description
{
  v23[5] = *MEMORY[0x1895F89C0];
  v21 = (void *)NSString;
  uint64_t v20 = objc_opt_class();
  objc_msgSend( NSString,  "stringWithFormat:",  @"policy: %d",  -[LACDTOMutableLostModeFetchRequest policy](self, "policy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v22;
  v3 = (void *)NSString;
  -[LACDTOMutableLostModeFetchRequest options](self, "options");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"options: %@", v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  int64_t v6 = (void *)NSString;
  BOOL v7 = -[LACDTOMutableLostModeFetchRequest isDTOEnabled](self, "isDTOEnabled");
  uint64_t v8 = @"NO";
  if (v7) {
    uint64_t v8 = @"YES";
  }
  [v6 stringWithFormat:@"isDTOEnabled: %@", v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  v10 = (void *)NSString;
  v11 = -[LACDTOMutableLostModeFetchRequest ratchetState](self, "ratchetState");
  [v10 stringWithFormat:@"ratchetState: %@", v11];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v12;
  char v13 = (void *)NSString;
  -[LACDTOMutableLostModeFetchRequest biometryWatchdogPack](self, "biometryWatchdogPack");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stringWithFormat:@"biometryWatchdogPack: %@", v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v23 count:5];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 componentsJoinedByString:@"; "];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 stringWithFormat:@"<%@ %p; %@>", v20, self, v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)isDTOEnabled
{
  return self->_isDTOEnabled;
}

- (void)setIsDTOEnabled:(BOOL)a3
{
  self->_isDTOEnabled = a3;
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void)setRatchetState:(id)a3
{
}

- (LACDTOBiometryWatchdogPack)biometryWatchdogPack
{
  return self->_biometryWatchdogPack;
}

- (void)setBiometryWatchdogPack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end