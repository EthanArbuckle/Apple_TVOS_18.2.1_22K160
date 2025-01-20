@interface LACDTOMutablePolicyEvaluationResult
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuccess;
- (LACDTOMutablePolicyEvaluationResult)initWithIdentifier:(id)a3;
- (NSDictionary)result;
- (NSError)error;
- (NSString)description;
- (NSString)identifier;
- (void)setError:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation LACDTOMutablePolicyEvaluationResult

- (LACDTOMutablePolicyEvaluationResult)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACDTOMutablePolicyEvaluationResult;
  v5 = -[LACDTOMutablePolicyEvaluationResult init](&v8, sel_init);
  v6 = v5;
  if (v5) {
    -[LACDTOMutablePolicyEvaluationResult setIdentifier:](v5, "setIdentifier:", v4);
  }

  return v6;
}

- (BOOL)isSuccess
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (NSString)description
{
  v18[3] = *MEMORY[0x1895F89C0];
  v17 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = (void *)NSString;
  v5 = -[LACDTOMutablePolicyEvaluationResult identifier](self, "identifier");
  [v4 stringWithFormat:@"identifier: %@", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)NSString;
  -[LACDTOMutablePolicyEvaluationResult result](self, "result");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"result: %@", v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)NSString;
  v11 = -[LACDTOMutablePolicyEvaluationResult error](self, "error");
  [v10 stringWithFormat:@"error: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 componentsJoinedByString:@"; "];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C793D28])
  {
    id v5 = v4;
    v6 = -[LACDTOMutablePolicyEvaluationResult identifier](self, "identifier");
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }

    else
    {
      objc_super v8 = (void *)v7;
      v9 = -[LACDTOMutablePolicyEvaluationResult identifier](self, "identifier");
      [v5 identifier];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = -[LACDTOMutablePolicyEvaluationResult result](self, "result");
    uint64_t v14 = [v5 result];
    if (v13 == (void *)v14)
    {
    }

    else
    {
      v15 = (void *)v14;
      v16 = -[LACDTOMutablePolicyEvaluationResult result](self, "result");
      [v5 result];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = -[LACDTOMutablePolicyEvaluationResult error](self, "error");
    uint64_t v20 = [v5 error];
    if (v19 == (void *)v20)
    {
      char v12 = 1;
      v21 = v19;
    }

    else
    {
      v21 = (void *)v20;
      v22 = -[LACDTOMutablePolicyEvaluationResult error](self, "error");
      [v5 error];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v22 isEqual:v23];
    }

    goto LABEL_15;
  }

  char v12 = 0;
LABEL_16:

  return v12;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
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