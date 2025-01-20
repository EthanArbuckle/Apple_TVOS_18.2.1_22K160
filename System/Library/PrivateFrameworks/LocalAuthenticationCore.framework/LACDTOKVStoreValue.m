@interface LACDTOKVStoreValue
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (LACDTOKVStoreValue)initWithBoolValue:(BOOL)a3;
- (LACDTOKVStoreValue)initWithData:(id)a3;
- (LACDTOKVStoreValue)initWithIntegerValue:(int64_t)a3;
- (id)data;
- (int64_t)integerValue;
@end

@implementation LACDTOKVStoreValue

- (LACDTOKVStoreValue)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACDTOKVStoreValue;
  v6 = -[LACDTOKVStoreValue init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (LACDTOKVStoreValue)initWithBoolValue:(BOOL)a3
{
  BOOL v7 = a3;
  [MEMORY[0x189603F48] dataWithBytes:&v7 length:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[LACDTOKVStoreValue initWithData:](self, "initWithData:", v4);

  return v5;
}

- (LACDTOKVStoreValue)initWithIntegerValue:(int64_t)a3
{
  int64_t v7 = a3;
  [MEMORY[0x189603F48] dataWithBytes:&v7 length:8];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[LACDTOKVStoreValue initWithData:](self, "initWithData:", v4);

  return v5;
}

- (BOOL)BOOLValue
{
  BOOL v3 = 1;
  v4 = -[LACDTOKVStoreValue initWithBoolValue:](objc_alloc(&OBJC_CLASS___LACDTOKVStoreValue), "initWithBoolValue:", 1LL);
  if (!-[LACDTOKVStoreValue isEqual:](self, "isEqual:", v4))
  {
    id v5 = -[LACDTOKVStoreValue initWithIntegerValue:]( objc_alloc(&OBJC_CLASS___LACDTOKVStoreValue),  "initWithIntegerValue:",  1LL);
    BOOL v3 = -[LACDTOKVStoreValue isEqual:](self, "isEqual:", v5);
  }

  return v3;
}

- (int64_t)integerValue
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (![v3 length])
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

    return v6;
  }
  v4 = -[LACDTOKVStoreValue data](self, "data");
  unint64_t v5 = [v4 length];

  if (v5 <= 8)
  {
    id v3 = -[LACDTOKVStoreValue data](self, "data");
    int64_t v6 = *(void *)[v3 bytes];
    goto LABEL_6;
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)data
{
  return self->_data;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    -[LACDTOKVStoreValue data](self, "data");
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 data];
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      char v10 = 1;
    }

    else
    {
      v8 = -[LACDTOKVStoreValue data](self, "data");
      [v5 data];
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
      char v10 = [v8 isEqual:v9];
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end