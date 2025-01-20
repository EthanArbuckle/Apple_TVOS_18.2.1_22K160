@interface LACEvaluationResult
+ (id)resultWithFailure:(id)a3;
+ (id)resultWithNext:(id)a3;
+ (id)resultWithSuccess:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LACEvaluationRequest)request;
- (LACEvaluationResult)initWithValue:(id)a3 error:(id)a4 request:(id)a5;
- (NSDictionary)value;
- (NSError)error;
- (id)description;
- (int64_t)rawValue;
@end

@implementation LACEvaluationResult

- (LACEvaluationResult)initWithValue:(id)a3 error:(id)a4 request:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LACEvaluationResult;
  v12 = -[LACEvaluationResult init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_value, a3);
    objc_storeStrong((id *)&v13->_error, a4);
    objc_storeStrong((id *)&v13->_request, a5);
    if (v9)
    {
      uint64_t v14 = 2LL;
LABEL_8:
      v13->_rawValue = v14;
      goto LABEL_9;
    }

    if (v10)
    {
      uint64_t v14 = 0LL;
      goto LABEL_8;
    }

    if (v11)
    {
      uint64_t v14 = 1LL;
      goto LABEL_8;
    }
  }

+ (id)resultWithNext:(id)a3
{
  id v3 = a3;
  v4 = -[LACEvaluationResult initWithValue:error:request:]( objc_alloc(&OBJC_CLASS___LACEvaluationResult),  "initWithValue:error:request:",  0LL,  0LL,  v3);

  return v4;
}

+ (id)resultWithSuccess:(id)a3
{
  id v3 = a3;
  v4 = -[LACEvaluationResult initWithValue:error:request:]( objc_alloc(&OBJC_CLASS___LACEvaluationResult),  "initWithValue:error:request:",  v3,  0LL,  0LL);

  return v4;
}

+ (id)resultWithFailure:(id)a3
{
  id v3 = a3;
  v4 = -[LACEvaluationResult initWithValue:error:request:]( objc_alloc(&OBJC_CLASS___LACEvaluationResult),  "initWithValue:error:request:",  0LL,  v3,  0LL);

  return v4;
}

- (id)description
{
  v12[3] = *MEMORY[0x1895F89C0];
  id v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  [NSString stringWithFormat:@"value: %@", self->_value];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  [NSString stringWithFormat:@"error: %@", self->_error];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  [NSString stringWithFormat:@"request: %@", self->_request];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:3];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 componentsJoinedByString:@"; "];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    id v7 = v4;
    int64_t v8 = -[LACEvaluationResult rawValue](self, "rawValue");
    if (v8 != [v7 rawValue])
    {
LABEL_14:
      BOOL v15 = 0;
LABEL_17:

      goto LABEL_18;
    }

    int64_t v9 = -[LACEvaluationResult rawValue](self, "rawValue");
    if (v9 == 2)
    {
      -[LACEvaluationResult value](self, "value");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v7 value];
      v12 = (void *)v16;
      v13 = -[LACEvaluationResult value](self, "value");
      uint64_t v14 = [v7 value];
    }

    else
    {
      if (v9 != 1)
      {
        if (v9) {
          goto LABEL_16;
        }
        -[LACEvaluationResult error](self, "error");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v7 error];
        if (v10 != (void *)v11)
        {
          v12 = (void *)v11;
          v13 = -[LACEvaluationResult error](self, "error");
          uint64_t v14 = [v7 error];
          goto LABEL_13;
        }

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (NSDictionary)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (LACEvaluationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end