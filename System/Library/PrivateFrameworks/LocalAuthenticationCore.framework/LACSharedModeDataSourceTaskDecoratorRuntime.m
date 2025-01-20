@interface LACSharedModeDataSourceTaskDecoratorRuntime
- (BOOL)isEqual:(id)a3;
- (LACSharedModeDataSourceTaskDecoratorRuntime)init;
- (LACSharedModeDataSourceTaskDecoratorRuntime)initWithMinValue:(double)a3 maxValue:(double)a4;
- (double)maxValue;
- (double)minValue;
- (id)description;
- (void)halveMaxValue;
- (void)resetMaxValue;
@end

@implementation LACSharedModeDataSourceTaskDecoratorRuntime

- (LACSharedModeDataSourceTaskDecoratorRuntime)init
{
  return -[LACSharedModeDataSourceTaskDecoratorRuntime initWithMinValue:maxValue:]( self,  "initWithMinValue:maxValue:",  0.025,  0.2);
}

- (LACSharedModeDataSourceTaskDecoratorRuntime)initWithMinValue:(double)a3 maxValue:(double)a4
{
  if (a3 > a4)
  {
    [NSString stringWithFormat:@"Runtime minValue must be less than or equal to maxValue"];
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
    -[LACSharedModeDataSourceTaskDecoratorRuntime maxValue](v8, v9);
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___LACSharedModeDataSourceTaskDecoratorRuntime;
    result = -[LACSharedModeDataSourceTaskDecoratorRuntime init](&v10, sel_init);
    if (result)
    {
      result->_minValue = a3;
      result->_maxValue = a4;
      result->_effectiveMaxValue = a4;
      result->_effectiveMinValue = a3;
    }
  }

  return result;
}

- (double)maxValue
{
  return self->_effectiveMaxValue;
}

- (double)minValue
{
  return self->_effectiveMinValue;
}

- (void)halveMaxValue
{
  double minValue = self->_minValue;
  if (minValue < self->_effectiveMaxValue * 0.5) {
    double minValue = self->_effectiveMaxValue * 0.5;
  }
  self->_effectiveMaxValue = minValue;
}

- (void)resetMaxValue
{
  self->_effectiveMaxValue = self->_maxValue;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    -[LACSharedModeDataSourceTaskDecoratorRuntime minValue](self, "minValue");
    double v7 = v6;
    [v5 minValue];
    if (v7 == v8)
    {
      -[LACSharedModeDataSourceTaskDecoratorRuntime maxValue](self, "maxValue");
      double v11 = v10;
      [v5 maxValue];
      BOOL v9 = v11 == v12;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v13[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v12[0] = @"minValue";
  id v5 = (void *)MEMORY[0x189607968];
  -[LACSharedModeDataSourceTaskDecoratorRuntime minValue](self, "minValue");
  objc_msgSend(v5, "numberWithDouble:");
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = @"maxValue";
  v13[0] = v6;
  double v7 = (void *)MEMORY[0x189607968];
  -[LACSharedModeDataSourceTaskDecoratorRuntime maxValue](self, "maxValue");
  objc_msgSend(v7, "numberWithDouble:");
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:2];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v9];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end