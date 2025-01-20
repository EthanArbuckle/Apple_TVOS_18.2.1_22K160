@interface LACBackgroundTaskResult
- (BOOL)isEqual:(id)a3;
- (LACBackgroundTaskResult)initWithError:(id)a3;
- (LACBackgroundTaskResult)initWithValue:(id)a3;
- (LACBackgroundTaskResult)initWithValue:(id)a3 error:(id)a4;
- (NSError)error;
- (id)description;
- (id)value;
@end

@implementation LACBackgroundTaskResult

- (LACBackgroundTaskResult)initWithValue:(id)a3
{
  return -[LACBackgroundTaskResult initWithValue:error:](self, "initWithValue:error:", a3, 0LL);
}

- (LACBackgroundTaskResult)initWithError:(id)a3
{
  return -[LACBackgroundTaskResult initWithValue:error:](self, "initWithValue:error:", 0LL, a3);
}

- (LACBackgroundTaskResult)initWithValue:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACBackgroundTaskResult;
  v9 = -[LACBackgroundTaskResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    [v5 value];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[LACBackgroundTaskResult value](self, "value");
    if (v6 == (void *)v7)
    {
    }

    else
    {
      id v8 = (void *)v7;
      [v5 value];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[LACBackgroundTaskResult value](self, "value");
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }

    [v5 error];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[LACBackgroundTaskResult error](self, "error");
    if (v13 == (void *)v14)
    {
      char v12 = 1;
      v15 = v13;
    }

    else
    {
      v15 = (void *)v14;
      [v5 error];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[LACBackgroundTaskResult error](self, "error");
      char v12 = [v16 isEqual:v17];
    }

    goto LABEL_11;
  }

  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)description
{
  v15[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = (void *)NSString;
  v6 = -[LACBackgroundTaskResult value](self, "value");
  [v5 stringWithFormat:@"value: %@", v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  id v8 = (void *)NSString;
  v9 = -[LACBackgroundTaskResult error](self, "error");
  [v8 stringWithFormat:@"error: %@", v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 componentsJoinedByString:@"; "];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end