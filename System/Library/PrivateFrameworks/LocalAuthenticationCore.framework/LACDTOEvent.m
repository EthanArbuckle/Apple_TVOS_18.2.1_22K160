@interface LACDTOEvent
- (BOOL)isEqual:(id)a3;
- (LACDTOEvent)initWithRawValue:(int64_t)a3;
- (LACDTOEvent)initWithRawValue:(int64_t)a3 optionalValue:(id)a4;
- (id)description;
- (id)value;
- (int64_t)rawValue;
@end

@implementation LACDTOEvent

- (LACDTOEvent)initWithRawValue:(int64_t)a3 optionalValue:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LACDTOEvent;
  v8 = -[LACDTOEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_rawValue = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

- (LACDTOEvent)initWithRawValue:(int64_t)a3
{
  return -[LACDTOEvent initWithRawValue:optionalValue:](self, "initWithRawValue:optionalValue:", a3, 0LL);
}

- (id)description
{
  v16[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)NSString;
  int64_t v6 = -[LACDTOEvent rawValue](self, "rawValue");
  else {
    id v7 = off_18A368D68[v6 - 1];
  }
  [v5 stringWithFormat:@"rawValue: %@", v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v9 = (void *)NSString;
  v10 = -[LACDTOEvent value](self, "value");
  [v9 stringWithFormat:@"value: %@", v10];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v16 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 componentsJoinedByString:@"; "];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    uint64_t v6 = [v5 rawValue];
    if (v6 == -[LACDTOEvent rawValue](self, "rawValue"))
    {
      [v5 value];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[LACDTOEvent value](self, "value");
      char v9 = [v7 isEqual:v8];

      char v10 = v9 ^ 1;
    }

    else
    {
      char v10 = 0;
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end