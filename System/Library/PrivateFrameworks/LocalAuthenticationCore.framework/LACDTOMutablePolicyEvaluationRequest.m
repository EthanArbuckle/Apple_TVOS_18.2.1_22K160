@interface LACDTOMutablePolicyEvaluationRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractiveRatchetEvaluation;
- (LACDTOEnvironment)environment;
- (LACDTOMutablePolicyEvaluationRequest)initWithIdentifier:(id)a3;
- (NSDictionary)options;
- (NSDictionary)payload;
- (NSString)description;
- (NSString)identifier;
- (int64_t)policy;
- (unint64_t)hash;
- (void)setEnvironment:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPolicy:(int64_t)a3;
@end

@implementation LACDTOMutablePolicyEvaluationRequest

- (LACDTOMutablePolicyEvaluationRequest)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACDTOMutablePolicyEvaluationRequest;
  v5 = -[LACDTOMutablePolicyEvaluationRequest init](&v8, sel_init);
  v6 = v5;
  if (v5) {
    -[LACDTOMutablePolicyEvaluationRequest setIdentifier:](v5, "setIdentifier:", v4);
  }

  return v6;
}

- (BOOL)isInteractiveRatchetEvaluation
{
  options = self->_options;
  [MEMORY[0x189607968] numberWithInteger:1000];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", v4);
  BOOL v6 = ([v5 BOOLValue] & 1) == 0 && self->_policy == 1026;

  return v6;
}

- (NSString)description
{
  v21[4] = *MEMORY[0x1895F89C0];
  v19 = (void *)NSString;
  uint64_t v18 = objc_opt_class();
  v3 = (void *)NSString;
  v20 = -[LACDTOMutablePolicyEvaluationRequest identifier](self, "identifier");
  [v3 stringWithFormat:@"identifier: %@", v20];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v5 = (void *)NSString;
  NSStringFromLACPolicy(-[LACDTOMutablePolicyEvaluationRequest policy](self, "policy"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"policy: %@", v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  objc_super v8 = (void *)NSString;
  v9 = -[LACDTOMutablePolicyEvaluationRequest options](self, "options");
  [v8 stringWithFormat:@"options: %@", v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  v11 = (void *)NSString;
  v12 = -[LACDTOMutablePolicyEvaluationRequest environment](self, "environment");
  [v11 stringWithFormat:@"environment: %@", v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v21 count:4];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 componentsJoinedByString:@"; "];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stringWithFormat:@"<%@ %p; %@>", v18, self, v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C796FC0])
  {
    id v5 = v4;
    -[LACDTOMutablePolicyEvaluationRequest identifier](self, "identifier");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }

    else
    {
      objc_super v8 = (void *)v7;
      v9 = -[LACDTOMutablePolicyEvaluationRequest identifier](self, "identifier");
      [v5 identifier];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_10;
      }
    }

    int64_t v13 = -[LACDTOMutablePolicyEvaluationRequest policy](self, "policy");
    if (v13 == [v5 policy])
    {
      v14 = -[LACDTOMutablePolicyEvaluationRequest options](self, "options");
      uint64_t v15 = [v5 options];
      if (v14 == (void *)v15)
      {
      }

      else
      {
        v16 = (void *)v15;
        v17 = -[LACDTOMutablePolicyEvaluationRequest options](self, "options");
        [v5 options];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v19 = [v17 isEqualToDictionary:v18];

        if (!v19) {
          goto LABEL_10;
        }
      }
      v20 = -[LACDTOMutablePolicyEvaluationRequest environment](self, "environment");
      uint64_t v21 = [v5 environment];
      if (v20 == (void *)v21)
      {
        char v12 = 1;
        v22 = v20;
      }

      else
      {
        v22 = (void *)v21;
        v23 = -[LACDTOMutablePolicyEvaluationRequest environment](self, "environment");
        [v5 environment];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v23 isEqual:v24];
      }

      goto LABEL_16;
    }

- (unint64_t)hash
{
  int64_t v3 = -[LACDTOMutablePolicyEvaluationRequest policy](self, "policy");
  -[LACDTOMutablePolicyEvaluationRequest options](self, "options");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 hash] ^ v3;
  -[LACDTOMutablePolicyEvaluationRequest identifier](self, "identifier");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 hash];
  -[LACDTOMutablePolicyEvaluationRequest environment](self, "environment");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
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

- (LACDTOEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end